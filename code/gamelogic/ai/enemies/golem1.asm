Golem1	module
; AI for SPR_GOLEM1. The simplest enemy kit in the game: it chases,
; may stop to menace on the approach (BHVS_PAUSE_32_AI), and once the
; player is within $20 it always attacks - raising its fist
; (ACT_ATTACK3) and bringing it down on the player's head
; (ACT_ATTACK2, $19 box).

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Golem1_B:
		bra.s	EnemyAI_Golem1

; A routine, run every tick.
EnemyAI_Golem1_A:
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
		bcs.s	EnemyAI_Golem1
		rts

; Aggro / attack-over / hitstun recovery: chase (behaviour 6,
; AIState $10).
EnemyAI_Golem1:
		bra.w	StartEnemyChase

; State $10: chasing. If the player is already in hitstun just keep
; chasing; otherwise try the pause, then the smash.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryPause
		bcs.s	_chaseTick
		bsr.s	_trySmash

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		bra.w	RunChaseBehaviour

; Player in the $28-$50 band ahead, $8 lateral: 18-in-1000 chance to
; stop and menace for a moment (state $22, BHVS_PAUSE_32_AI).
_tryPause:
		move.w	#$0050,d5
		move.w	#$FFD8,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_pauseMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bcc.s	_pauseMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_PAUSE_32_AI,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_pauseMiss:
		tst.b	d0
		rts

; Player within $20 all around: smash, always (state $23).
_trySmash:
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_smashMiss
		move.b	#$23,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_smashMiss:
		tst.b	d0
		rts

; States $20+: below 3 = behaviour ticks (the pause), 3+ = the fist
; smash: raise the fist (ACT_ATTACK3) for $F ticks, then the hit box
; ($19 ahead, 9 behind, 9 lateral) is live with the downward blow
; (ACT_ATTACK2) each tick until tick $1E, then back to chasing.
_attackStates:
		andi.b	#$0F,d0
		cmpi.b	#$03,d0
		bcs.s	_behaviourTick
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_smashRts
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	_smashRts
		beq.w	EnemyAI_Golem1

_smashRts:
		rts

_behaviourTick:
		bsr.w	j_j_OnTick
		rts

		modend
