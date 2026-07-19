Spectre2	module
; AI for SPR_SPECTRE2. As Spectre1, but it vanishes (19-in-1000) and
; summons fireballs (17-in-1000) more often, and the fireball's
; AttackStrength is $500.

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Spectre2_B:
		bra.s	EnemyAI_Spectre2

; A routine, run every tick. FallRate bit 7 keeps it airborne.
EnemyAI_Spectre2_A:
		bset	#$07,FallRate(a5)
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
		bcs.s	EnemyAI_Spectre2
		rts

; Aggro / attack-over / hitstun recovery: chase (behaviour 6,
; AIState $10).
EnemyAI_Spectre2:
		bra.w	StartEnemyChase

; State $10: chasing (invisibly, if vanished). After $1E ticks
; vanished it tries to re-materialise every tick; then try each move
; in turn.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		btst	#$06,InteractFlags(a5)
		beq.s	_chaseMoves
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$1E,AICounter(a5)
		bcs.s	_chaseTick
		subq.b	#$01,AICounter(a5)
		bsr.w	_tryMaterialise

_chaseMoves:
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryVanish
		bcs.s	_chaseTick
		bsr.s	_tryReappear
		bcs.s	_chaseTick
		bsr.w	_tryFireball
		bcs.s	_chaseTick
		bsr.w	_trySwing

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		bra.w	RunChaseBehaviour

; Visible, player in the box $70 ahead, $30 behind, $20 lateral:
; 19-in-1000 chance to vanish - hidden (InteractFlags bit 6) and
; floating at the fixed height (Z $100), still chasing.
_tryVanish:
		move.w	#$0070,d5
		move.w	#$0030,d6
		move.w	#$0020,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_vanishMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	_vanishMiss
		bset	#$06,InteractFlags(a5)
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_vanishMiss:
		tst.b	d0
		rts

; Player within $60 ahead, $20 lateral: 7-in-1000 chance to
; re-materialise early (teleporting in beside the player); when
; already visible this succeeds without doing anything.
_tryReappear:
		move.w	#$0060,d5
		move.w	#$0000,d6
		move.w	#$0020,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_reappearMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00006,d7
		bhi.s	_reappearMiss
		bsr.w	_tryMaterialise
		bcc.s	_reappearMiss
		ori	#$01,ccr
		rts

_reappearMiss:
		tst.b	d0
		rts

; Player in the box $60 ahead, $48 behind, $10 lateral: 17-in-1000
; chance to summon a fireball (state $22) - materialising first if
; vanished.
_tryFireball:
		move.w	#$0060,d5
		move.w	#$0048,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_fireballMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00016,d7
		bhi.s	_fireballMiss
		bsr.w	_tryMaterialise
		bcc.s	_fireballMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_fireballMiss:
		tst.b	d0
		rts

; Player point-blank ahead ($18 ahead, $8 lateral): 80% chance to
; swing (state $23) - materialising first if vanished.
_trySwing:
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_swingMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00080,d7
		bcc.s	_swingMiss
		bsr.s	_tryMaterialise
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

; Succeeds (carry set) if the spectre is visible, or if vanished and
; the teleport in beside the player (at the player's height, hitbox
; top $F above) finds a clear spot - becoming visible again.
_tryMaterialise:
		btst	#$06,InteractFlags(a5)
		beq.s	_materialise
		move.w	#$000F,d1
		bsr.w	TeleportBesidePlayer
		bcs.s	_materialise
		tst.b	d0
		rts

_materialise:
		bclr	#$06,InteractFlags(a5)
		ori	#$01,ccr
		rts

; States $20+: 0-2 = summon fireball (entered as $22), 3+ = swing.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_castFireball
		cmpi.b	#$01,d0
		beq.s	_castFireball
		cmpi.b	#$02,d0
		beq.s	_castFireball
		cmpi.b	#$03,d0
		beq.s	_swing
		bra.s	_swing

; Summon a fireball, driven by AICounter: tick 1 - casting pose
; (ACT_ATTACK3) and load the fireball's flame graphics (shared
; with the Magic Sword's burn animation) to VRAM $9880 (tail call); tick 2 - load the
; projectile palette; tick $2D - throwing pose (ACT_ATTACK2) and spawn
; the fireball (type 1, AttackStrength $500; abort if no free slot);
; then recover until tick $46.
_castFireball:
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$01,AICounter(a5)
		bne.s	_castPalette
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		lea	($00009880).l,a2
		move.b	#ITM_MAGICSWORD,d0
		jmp	(j_LoadMagicSwordEffect).l

_castPalette:
		cmpi.b	#$02,AICounter(a5)
		bne.w	_castThrow
		move.b	#$01,d0
		bra.w	LoadProjectilePalette

_castThrow:
		cmpi.b	#$2D,AICounter(a5)
		bhi.w	_castRecover
		bcs.w	_castWait
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		move.b	#$01,d0
		move.w	#$0500,d1
		bsr.w	SpawnSmallProjectile
		bcs.w	_castDone
		rts

_castRecover:
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$46,AICounter(a5)
		beq.w	_castDone

_castWait:
		rts

_castDone:
		clr.b	AICounter(a5)
		bra.w	EnemyAI_Spectre2

; Swing: ACT_ATTACK1 windup for $F ticks, then the hit box ($19
; ahead, 9 behind, 9 lateral) is live with ACT_ATTACK2 each tick
; until tick $1E, then back to chasing.
_swing:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_swingRts
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	_swingRts
		beq.w	EnemyAI_Spectre2

_swingRts:
		rts

		modend
