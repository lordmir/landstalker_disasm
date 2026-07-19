Zak	module
; AI for SPR_ZAK - the duel with Zak. His signature move is the
; fly-up (state $20, also where his hitstun recovery sends him): he
; beats his wings (cycling through all eight action ids, two ticks
; each, with SND_Slash1 every tick) and rises 4 units a tick for $1F
; ticks with gravity off, then drops - tracking the player
; horizontally (snapping onto his X/Y every tick) until he falls to
; within a random $40 or $58 of the player's height, where he
; commits to the dive (ACT_ATTACK3) and can no longer follow.
; Landing is contact damage. He also has a slash (ACT_ATTACK2
; windup, ACT_ATTACK3 strike - standing, advancing or leaping) and
; the boomerang throw (SPR_ZAKBOOMERANG, AttackStrength $1400,
; BHVS_BOOMERANG - it flies out and comes back).

; B routine (behaviour command $2B): take off - straight into the
; fly-up.
EnemyAI_Zak_B:
		bra.s	EnemyAI_Zak

; A routine, run every tick.
EnemyAI_Zak_A:
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
; detection box ($60 ahead, $40 behind, $30 lateral), then aggro.
_idle:
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0060,d5
		move.w	#$0040,d6
		move.w	#$0030,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_startChase
		rts

; Reset out of hitstun: resume the chase, then take off.
EnemyAI_Zak:
		bsr.s	_startChase
		bra.w	_startFlyUp

; Start chasing (behaviour 6, AIState $10). The bit number of a bset
; on memory is taken mod 8, so #$08 sets FallRate bit 0.
_startChase:
		bset	#$08,FallRate(a5)
		bra.w	StartEnemyChase

; State $10: chasing. If the player is already in hitstun just keep
; chasing; otherwise try each move in turn.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryBoomerang
		bcs.s	_chaseTick
		bsr.s	_tryFlyUp
		bcs.s	_chaseTick
		bsr.w	_tryLeapSlash
		bcs.s	_chaseTick
		bsr.w	_tryAdvanceSlash
		bcs.s	_chaseTick
		bsr.w	_tryMelee

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		bra.w	RunChaseBehaviour

; Player in the $40-$80 band ahead, $10 lateral: 17-in-1000 chance to
; throw the boomerang (state $25).
_tryBoomerang:
		move.w	#$0080,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_boomerangMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00016,d7
		bhi.s	_boomerangMiss
		move.b	#$25,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_boomerangMiss:
		tst.b	d0
		rts

; Player in the ring within $70 but not within $30, all around:
; 17-in-1000 chance to take off (state $20).
_tryFlyUp:
		move.w	#$0070,d5
		move.w	#$0070,d6
		move.w	#$0070,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_flyUpMiss
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_flyUpMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00016,d7
		bhi.s	_flyUpMiss

_startFlyUp:
		move.b	#$20,AIState(a5)
		move.w	#BHVS_WANDER,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_flyUpMiss:
		tst.b	d0
		rts

; Player in the $30-$60 band ahead, $10 lateral: 13-in-1000 chance to
; leap in slashing (state $21, BHVS_LEAP_ADVANCE).
_tryLeapSlash:
		move.w	#$0060,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_leapSlashMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	_leapSlashMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_LEAP_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_leapSlashMiss:
		tst.b	d0
		rts

; Player within $40 ahead, $20 behind, $10 lateral: 13-in-1000 chance
; to advance slashing (state $22, BHVS_ADVANCE).
_tryAdvanceSlash:
		move.w	#$0040,d5
		move.w	#$0020,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_advSlashMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	_advSlashMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_advSlashMiss:
		tst.b	d0
		rts

; Player point-blank ahead ($20 ahead, $8 lateral): slash - 50%
; standing (state $23), else with a leap (state $24,
; BHVS_LEAP_ADVANCE).
_tryMelee:
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_meleeMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	_meleeLeap
		move.b	#$23,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_meleeLeap:
		move.b	#$24,AIState(a5)
		move.w	#BHVS_LEAP_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_meleeMiss:
		tst.b	d0
		rts

; States $20+: 0 = fly up and drop, 1/2/4 = slash with the behaviour
; moving him, 3 = slash standing, 5+ = boomerang.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_flyUp
		cmpi.b	#$01,d0
		beq.w	_slash
		cmpi.b	#$02,d0
		beq.w	_slash
		cmpi.b	#$03,d0
		beq.w	_slashStand
		cmpi.b	#$04,d0
		beq.w	_slash
		bra.w	_boomerang

; Fly up: for $1F ticks, gravity off (FallRate bit 7), rise 4 units
; a tick, cycle the action ids ((AICounter & $E) << 7: $000-$700,
; two ticks each) and keep turned toward the player, with a wing
; beat (SND_Slash1) every tick.
_flyUp:
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$1F,AICounter(a5)
		bhi.s	_dive
		bset	#$07,FallRate(a5)
		addi.w	#$0004,Z(a5)
		addi.w	#$0004,HitBoxZEnd(a5)
		move.b	AICounter(a5),d0
		andi.w	#$000E,d0
		lsl.w	#$07,d0
		move.w	d0,QueuedAction(a5)
		bsr.w	GetDirToPlayer
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d2,RotationAndSize(a5)
		trap	#$00			  ; Trap00Handler
		dc.w SND_Slash1
		bsr.w	j_j_OnTick
		rts

; The drop: gravity back on. On the first falling tick, play the
; fall sound and roll the commit height - the drop stops tracking
; once Zak is within $40 or $58 (random) of the player's Z (stashed
; in RepeatPtr).
_dive:
		bclr	#$07,FallRate(a5)
		cmpi.b	#$20,AICounter(a5)
		bne.s	_diveTrack
		trap	#$00			  ; Trap00Handler
		dc.w SND_Fall
		move.w	#$0002,d6
		jsr	(j_GenerateRandomNumber).l
		move.w	#$0040,d0
		tst.b	d7
		beq.s	_diveHeightSet
		move.w	#$0058,d0

_diveHeightSet:
		move.w	d0,RepeatPtr(a5)
		rts

; Falling (AICounter pinned at $20): while still higher than the
; player's Z plus the commit height, snap onto the player's X/Y -
; the drop homes onto him; below that, hold the dive pose
; (ACT_ATTACK3). On landing, a thud (SND_LadderClimb) and back to
; the chase. Contact does the damage.
_diveTrack:
		subq.b	#$01,AICounter(a5)
		bclr	#$07,FallRate(a5)
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		beq.w	_diveLand
		move.w	(Player_Z).l,d0
		add.w	RepeatPtr(a5),d0
		cmp.w	Z(a5),d0
		bcc.s	_diveCommit
		move.l	(Player_X).l,(a5)
		movea.l	a5,a1
		jsr	(j_j_CalcSpriteHitbox).l
		rts

_diveCommit:
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		rts

_diveLand:
		trap	#$00			  ; Trap00Handler
		dc.w SND_LadderClimb
		bra.w	_startChase

; Slash, standing (state 3): ACT_ATTACK2 windup for $F ticks, then
; the hit box ($19 ahead, 9 behind, 9 lateral) is live with the
; strike pose (ACT_ATTACK3) each tick until tick $1E.
_slashStand:
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_slashStandRts
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	_slashStandRts
		beq.w	_startChase

_slashStandRts:
		rts

; The same slash with the behaviour running - the leap and advance
; variants keep moving.
_slash:
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_slashTick
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	_slashTick
		beq.w	_startChase

_slashTick:
		bsr.w	j_j_OnTick
		rts

; Boomerang: windup (ACT_ATTACK2) until tick $F, then the throw
; (ACT_ATTACK3, SND_Slash2): spawn projectile type 3
; (SPR_ZAKBOOMERANG) with AttackStrength $1400, then repoint its
; tiles ($44C0), set speed 4 and swap its behaviour to
; BHVS_BOOMERANG (fly out and return), loading it with a5 briefly on
; the projectile. Recover holding the pose until tick $3C.
_boomerang:
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$0F,AICounter(a5)
		bcs.s	_boomerangRts
		bhi.s	_boomerangRecover
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		trap	#$00			  ; Trap00Handler
		dc.w SND_Slash2
		move.b	#$03,d0
		move.w	#$1400,d1
		bsr.w	SpawnSmallProjectile
		bcs.w	_boomerangRts
		move.w	#$44C0,TileSource(a1)
		move.b	#$04,Speed(a1)
		move.w	#BHVS_BOOMERANG,BehaviourLUTIndex(a1)
		movem.l	a5,-(sp)
		movea.l	a1,a5
		bsr.w	j_j_LoadSpriteBehaviour
		movem.l	(sp)+,a5

_boomerangRts:
		rts

_boomerangRecover:
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		cmpi.b	#$3C,AICounter(a5)
		beq.w	_startChase
		rts

		modend
