Ninja1	module
; AI for SPR_NINJA1. A sword fighter: at range it squares up in a
; two-frame stance, may back off (BHVS_RETREAT), and leaps in with a
; slash from the $28-$30 ring (BHVS_LEAP_ADVANCE); point-blank it
; slashes 40% advancing / 60% standing. (No teleport - that is
; Ninja2/3.)

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Ninja1_B:
		bra.s	EnemyAI_Ninja1

; A routine, run every tick.
EnemyAI_Ninja1_A:
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
; detection box ($60 ahead, $30 behind, $40 lateral), then aggro.
_idle:
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	CheckPlayerInRange
		bcs.s	EnemyAI_Ninja1
		rts

; Aggro / attack-over / hitstun recovery: chase (behaviour 6,
; AIState $10).
EnemyAI_Ninja1:
		bra.w	StartEnemyChase

; State $10: chasing. If the player is already in hitstun just keep
; chasing; otherwise try each move in turn.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryStance
		bcs.s	_chaseTick
		bsr.s	_tryRetreat
		bcs.s	_chaseTick
		bsr.w	_tryLeapSlash
		bcs.s	_chaseTick
		bsr.w	_tryMelee

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		bra.w	RunChaseBehaviour

; Player in the $38-$40 band ahead, $20 lateral: 38-in-1000 chance to
; square up in the stance (state $20).
_tryStance:
		move.w	#$0040,d5
		move.w	#$FFC8,d6
		move.w	#$0020,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_stanceMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00037,d7
		bhi.s	_stanceMiss
		move.b	#$20,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_stanceMiss:
		tst.b	d0
		rts

; Player in the $30-$38 band ahead, $38 lateral: 13-in-1000 chance to
; back away (state $21, BHVS_RETREAT).
_tryRetreat:
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0038,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_retreatMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	_retreatMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_RETREAT,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_retreatMiss:
		tst.b	d0
		rts

; Player in the mid-range ring (within $30 but not within $28, all
; around): 19-in-1000 chance to leap in slashing (state $22,
; BHVS_LEAP_ADVANCE).
_tryLeapSlash:
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_leapSlashMiss
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_leapSlashMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	_leapSlashMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_LEAP_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_leapSlashMiss:
		tst.b	d0
		rts

; Player within $16 ahead, $10 lateral: 40% slash advancing (state
; $23, BHVS_ADVANCE), else standing (state $24).
_tryMelee:
		move.w	#$0016,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_meleeMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00040,d7
		bcc.s	_meleeStand
		move.b	#$23,AIState(a5)
		move.w	#BHVS_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_meleeStand:
		move.b	#$24,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_meleeMiss:
		tst.b	d0
		rts

; States $20+: 0 = stance, 1 = retreat (behaviour ticks), 2/3/4 =
; slash (leaping, advancing or standing).
_attackStates:
		andi.b	#$0F,d0
		beq.s	_stance
		cmpi.b	#$01,d0
		beq.s	_behaviourTick
		cmpi.b	#$02,d0
		beq.s	_slash
		cmpi.b	#$03,d0
		beq.w	_slash
		bra.w	_slash

; Stance: hold facing the player while he stays in the $38-$40 band,
; alternating two forced frames ($40/$80) every $10 ticks; give up
; after $80 ticks or when he leaves the band.
_stance:
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0040,d5
		move.w	#$FFC8,d6
		move.w	#$0020,d7
		bsr.w	CheckPlayerInRange
		bcc.w	EnemyAI_Ninja1
		addq.b	#$01,AnimPhase(a5)
		move.b	AnimPhase(a5),d0
		cmpi.b	#$80,d0
		beq.w	EnemyAI_Ninja1
		andi.b	#$0F,d0
		cmpi.b	#$01,d0
		bne.s	_stanceRts
		move.b	#$FF,Action1(a5)
		move.b	AnimPhase(a5),d0
		andi.w	#$0010,d0
		addi.b	#$10,d0
		lsl.b	#$02,d0
		move.w	d0,PrevAction(a5)

_stanceRts:
		rts

_behaviourTick:
		bsr.w	j_j_OnTick
		rts

; Slash: ACT_ATTACK1 windup for $F ticks, then the hit box ($19
; ahead, 9 behind, 9 lateral) is live with ACT_ATTACK2 each tick
; until tick $1E, then back to chasing. Runs the behaviour, so the
; leap and advance variants keep moving.
_slash:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_slashTick
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	_slashTick
		beq.w	EnemyAI_Ninja1

_slashTick:
		bsr.w	j_j_OnTick
		rts

		modend
