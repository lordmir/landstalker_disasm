Nole	module
; AI for SPR_NOLE, the duel with King Nole. An axe fighter with the
; spectres' vanishing trick: his opener (and his B routine) is the
; vanish - sinking through ACT_ATTACK5/6, then hidden (InteractFlags
; bit 6), invincible and floating (Z $100, no gravity) while he
; chases invisibly; after at least $1E ticks hidden he teleports in
; beside the player (TeleportBesidePlayer, included below, with his
; taller $1F hitbox) and fades back in. Visible, he swings his axe to
; loose the axe projectile (SPR_NOLEAXEPROJECTILE, AttackStrength
; $1E00 - the hardest-hitting attack in the game - at speed 8; he
; never lets go of the axe itself) from up to $A0 away, and swings
; it in melee (deep $21 box), leaping in or standing.

; B routine (behaviour command $2B): chase, opening with the vanish.
EnemyAI_Nole_B:
		bra.s	EnemyAI_Nole

; A routine, run every tick.
EnemyAI_Nole_A:
		btst	#$01,InteractFlags(a5)
		bne.s	_hurtTick
		move.b	AIState(a5),d0
		beq.s	_idle
		cmpi.b	#$10,d0
		beq.s	_chase
		bra.w	_attackStates

_hurtTick:
		bsr.w	j_j_OnTick
		rts

; State 0: run the placed behaviour until the player enters the
; detection box ($60 ahead, $20 behind, $30 lateral), then aggro.
_idle:
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_startChase
		rts

; Aggro / hitstun recovery: chase, and vanish straight away.
EnemyAI_Nole:
		bsr.s	_startChase
		bra.w	_startVanish

_startChase:
		bra.w	StartEnemyChase

; State $10: chasing (invisibly, while vanished - the reappear try
; is gated on AICounter reaching $1E first). Try each move in turn.
_chase:
		btst	#$06,InteractFlags(a5)
		beq.s	_chaseMoves
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$1E,AICounter(a5)
		bcs.s	_chaseTick
		subq.b	#$01,AICounter(a5)

_chaseMoves:
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.w	_tryReappear
		bcs.s	_chaseTick
		bsr.w	_tryVanish
		bcs.s	_chaseTick
		bsr.w	_tryProjectile
		bcs.s	_chaseTick
		bsr.w	_tryLeapSwing
		bcs.s	_chaseTick
		bsr.w	_trySwing

_chaseTick:
		bsr.w	j_j_OnTick
		rts

; Unreachable leftover: the player-in-hitstun chase reload the other
; enemies have - Nole's chase never branches here.
		bra.w	RunChaseBehaviour

; Hidden only: 31-in-100 chance to teleport in beside the player (at
; his height, hitbox top $1F above); success starts the fade-in
; (state $25).
_tryReappear:
		btst	#$06,InteractFlags(a5)
		beq.w	TeleportFail
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00030,d7
		bhi.w	TeleportFail
		move.w	#$001F,d1
		bsr.s	TeleportBesidePlayer
		bcs.w	_startReappear
		rts

        include         "code/gamelogic/ai/enemyteleport.asm"

_startReappear:
		move.b	#$25,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

; 2-in-100 chance to vanish (state $20). Also Nole's opener.
_tryVanish:
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00001,d7
		bhi.s	_vanishMiss

_startVanish:
		move.b	#$20,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_vanishMiss:
		tst.b	d0
		rts

; Visible, player in the $28-$A0 band ahead, $10 lateral: 301-in-1000
; chance to summon the axe projectile (state $21).
_tryProjectile:
		btst	#$06,InteractFlags(a5)
		bne.s	_projectileMiss
		move.w	#$00A0,d5
		move.w	#$FFD8,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_projectileMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00300,d7
		bhi.s	_projectileMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_projectileMiss:
		tst.b	d0
		rts

; Visible, player within $48 ahead, $30 behind, $10 lateral:
; 26-in-1000 chance to leap in swinging (state $22,
; BHVS_LEAP_ADVANCE).
_tryLeapSwing:
		btst	#$06,InteractFlags(a5)
		bne.s	_leapSwingMiss
		move.w	#$0048,d5
		move.w	#$0030,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_leapSwingMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	_leapSwingMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_LEAP_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_leapSwingMiss:
		tst.b	d0
		rts

; Visible, player within $20 ahead, $8 lateral: swing, always (state
; $23).
_trySwing:
		btst	#$06,InteractFlags(a5)
		bne.s	_swingMiss
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_swingMiss
		move.b	#$23,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_swingMiss:
		tst.b	d0
		rts

; States $20+: 0 = vanish, 1 = the axe projectile, 2/3/4 = axe swing,
; 5+ = reappear.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_vanish
		cmpi.b	#$01,d0
		beq.w	_projectile
		cmpi.b	#$02,d0
		beq.w	_swing
		cmpi.b	#$03,d0
		beq.w	_swing
		cmpi.b	#$04,d0
		beq.w	_swing
		bra.s	_reappear

; Vanish: invincible from the first tick, sinking through
; ACT_ATTACK5 (4 ticks) and ACT_ATTACK6 (to 8), then hidden
; (InteractFlags bit 6) at the floating height with gravity off -
; and back to the chase state, invisible.
_vanish:
		bset	#$00,CombatFlags(a5)
		move.w	#ACT_ATTACK5,QueuedAction(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$04,AICounter(a5)
		bcs.s	_vanishRts
		move.w	#ACT_ATTACK6,QueuedAction(a5)
		cmpi.b	#$08,AICounter(a5)
		bcs.s	_vanishRts
		bset	#$06,InteractFlags(a5)
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
		bset	#$07,FallRate(a5)
		clr.b	AICounter(a5)
		bra.w	_startChase

_vanishRts:
		rts

; Reappear: visible again, playing the sink poses in reverse
; (ACT_ATTACK6 then 5, 4 ticks each), then drop the invincibility
; and gravity-off and resume the chase.
_reappear:
		bclr	#$06,InteractFlags(a5)
		move.w	#ACT_ATTACK6,QueuedAction(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$04,AICounter(a5)
		bcs.s	_reappearRts
		move.w	#ACT_ATTACK5,QueuedAction(a5)
		cmpi.b	#$08,AICounter(a5)
		bcs.s	_reappearRts
		bclr	#$00,CombatFlags(a5)
		bclr	#$07,FallRate(a5)
		bra.w	_startChase

_reappearRts:
		rts

; The axe projectile: a swing of the axe - wind up through
; ACT_ATTACK1 (8 ticks) and ACT_ATTACK2 (to $10), then ACT_ATTACK3
; and, at tick $18 (SND_GhostAbsorbHP as the cast sound), the
; summon: projectile type 2
; (SPR_NOLEAXEPROJECTILE) with AttackStrength $1E00, its tiles
; repointed to $24C0 and sped up to 8. Recover in ACT_ATTACK4 until
; tick $20.
_projectile:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$08,AICounter(a5)
		bcs.s	_projRts
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$10,AICounter(a5)
		bcs.s	_projRts
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		cmpi.b	#$18,AICounter(a5)
		bhi.w	_projRecover
		bcs.w	_projRts
		trap	#$00			  ; Trap00Handler
		dc.w SND_GhostAbsorbHP
		move.b	#$02,d0
		move.w	#$1E00,d1
		bsr.w	SpawnSmallProjectile
		bcs.w	_projDone
		move.w	#$24C0,TileSource(a1)
		move.b	#$08,Speed(a1)
		rts

_projRecover:
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		cmpi.b	#$20,AICounter(a5)
		beq.w	_projDone

_projRts:
		rts

_projDone:
		clr.b	AICounter(a5)
		bra.w	_startChase

; The axe swing: ACT_ATTACK1 (8 ticks), ACT_ATTACK2 (to $10, with
; the swing sound on the last of them), then the deep hit box ($21
; ahead, 9 behind, 9 lateral) is live with ACT_ATTACK3 to $18 and
; ACT_ATTACK4 to $20, then back to chasing. Runs the behaviour, so
; the leaping variant keeps moving.
_swing:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$08,AnimPhase(a5)
		bcs.s	_swingTick
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$10,AnimPhase(a5)
		bcs.s	_swingTick
		bhi.s	_swingHit
		trap	#$00			  ; Trap00Handler
		dc.w SND_SwordSwing

_swingHit:
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		cmpi.b	#$18,AnimPhase(a5)
		bcs.s	_swingTick
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		cmpi.b	#$20,AnimPhase(a5)
		bcs.s	_swingTick
		beq.w	_startChase

_swingTick:
		bsr.w	j_j_OnTick
		rts

		modend
