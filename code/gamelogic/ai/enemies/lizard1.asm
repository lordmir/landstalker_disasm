Lizard1	module
; AI for SPR_LIZARD1. A sword fighter: on the approach it may pause
; menacingly (BHVS_PAUSE_32_AI), pounce at the player (BHVS_POUNCE,
; contact damage, resetting on landing), or advance with the deep
; slash (ACT_ATTACK1/2, $29 box). Point-blank it swings: 60% the deep
; slash standing, 40% the second, shorter slash (ACT_ATTACK3/4, $19
; box).

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Lizard1_B:
		bra.s	EnemyAI_Lizard1

; A routine, run every tick.
EnemyAI_Lizard1_A:
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
		bcs.s	EnemyAI_Lizard1
		rts

; Aggro / attack-over / hitstun recovery: chase (behaviour 6,
; AIState $10).
EnemyAI_Lizard1:
		bra.w	StartEnemyChase

; State $10: chasing. If the player is already in hitstun just keep
; chasing; otherwise try each move in turn.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryPause
		bcs.s	_chaseTick
		bsr.s	_tryPounce
		bcs.s	_chaseTick
		bsr.w	_tryAdvanceSlash
		bcs.s	_chaseTick
		bsr.w	_tryMelee

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		bra.w	RunChaseBehaviour

; Player in the $40-$48 band ahead, $10 lateral: 13-in-1000 chance to
; stop and menace for a moment (state $20, BHVS_PAUSE_32_AI).
_tryPause:
		move.w	#$0048,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_pauseMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	_pauseMiss
		move.b	#$20,AIState(a5)
		move.w	#BHVS_PAUSE_32_AI,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_pauseMiss:
		tst.b	d0
		rts

; Player in the $38-$50 band ahead, $10 lateral: 26-in-1000 chance to
; pounce (state $21, BHVS_POUNCE).
_tryPounce:
		move.w	#$0050,d5
		move.w	#$FFC8,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_pounceMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	_pounceMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_POUNCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_pounceMiss:
		tst.b	d0
		rts

; Player in the $30-$40 band ahead, $10 lateral: 19-in-1000 chance to
; advance with the deep slash (state $22, BHVS_ADVANCE).
_tryAdvanceSlash:
		move.w	#$0040,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_advSlashMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	_advSlashMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_advSlashMiss:
		tst.b	d0
		rts

; Player within $20 ahead, $10 lateral: 60% the deep slash standing
; (state $23), else the second slash (state $24).
_tryMelee:
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_meleeMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00060,d7
		bcc.s	_meleeSlash2
		move.b	#$23,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_meleeSlash2:
		move.b	#$24,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_meleeMiss:
		tst.b	d0
		rts

; States $20+: 0 = pause (behaviour ticks), 1 = pounce, 2 = advancing
; slash, 3 = standing slash, 4+ = second slash.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_behaviourTick
		cmpi.b	#$01,d0
		beq.s	_pounce
		cmpi.b	#$02,d0
		beq.s	_advanceSlash
		cmpi.b	#$03,d0
		beq.s	_slash
		bra.w	_slash2

_behaviourTick:
		bsr.w	j_j_OnTick
		rts

; Pounce: ride the pounce behaviour while airborne (Action1 bits
; 4/5); contact does the damage. Reset on landing.
_pounce:
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		beq.w	EnemyAI_Lizard1
		bsr.w	j_j_OnTick
		rts

; Advancing deep slash: ACT_ATTACK1 windup for $F ticks, then the
; deep hit box ($29 ahead, 9 behind, 9 lateral) is live with
; ACT_ATTACK2 each tick until $1E; the advance behaviour keeps it
; moving.
_advanceSlash:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_advSlashTick
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	_advSlashTick
		bra.w	EnemyAI_Lizard1

_advSlashTick:
		bsr.w	j_j_OnTick
		rts

; The same deep slash, standing still (no behaviour tick).
_slash:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_slashRts
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	_slashRts
		bra.w	EnemyAI_Lizard1

_slashRts:
		rts

; The second slash (ACT_ATTACK3 windup, ACT_ATTACK4 strike): shorter
; reach ($19 ahead), standing.
_slash2:
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_slash2Rts
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	_slash2Rts
		bra.w	EnemyAI_Lizard1

_slash2Rts:
		rts

		modend
