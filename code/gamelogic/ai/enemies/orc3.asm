Orc3	module
; AI for SPR_ORC3. Same skeleton as Orc2 with the strongest moves: its
; mid-range advance leaps (behaviour $12: jump, walk forward, reset),
; it never retreats (the third slot is another advance, behaviour
; $11), and it swings during every moving state.

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Orc3_B:
		bra.s	EnemyAI_Orc3

; A routine, run every tick.
EnemyAI_Orc3_A:
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
		bcs.s	EnemyAI_Orc3
		rts

; Aggro / attack-over / hitstun recovery: start chasing the player
; (behaviour 6, AIState $10).
EnemyAI_Orc3:
		bra.w	StartEnemyChase

; State $10: chasing. If the player is already in hitstun just keep
; chasing; otherwise try each attack in turn, farthest range first.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryPounce
		bcs.s	_chaseTick
		bsr.s	_tryLeapAdvance
		bcs.s	_chaseTick
		bsr.w	_tryAdvance
		bcs.s	_chaseTick
		bsr.w	_trySwing

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		bra.w	RunChaseBehaviour

; Player inside the $50 ring but not the $38 ring: 9-in-1000 chance
; per tick to pounce (state $20, behaviour $E: jump + run forward).
_tryPounce:
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_pounceMiss
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_pounceMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00008,d7
		bhi.s	_pounceMiss
		move.b	#$20,AIState(a5)
		move.w	#BHVS_POUNCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_pounceMiss:
		tst.b	d0
		rts

; Player roughly in line ($38 ahead/behind, $10 lateral) but not
; within $20: 13-in-1000 chance to leap forward swinging (state $21,
; behaviour $12: jump, walk forward, then reset).
_tryLeapAdvance:
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_leapMiss
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_leapMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	_leapMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_LEAP_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_leapMiss:
		tst.b	d0
		rts

; Same ring again: 13-in-1000 chance to advance swinging (state $22,
; behaviour $11: walk forward, then reset).
_tryAdvance:
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_advanceMiss
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_advanceMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	_advanceMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_advanceMiss:
		tst.b	d0
		rts

; Player point-blank ahead ($20 ahead, $8 lateral): swing the club -
; 50/50 standing still (state $23, behaviour 0) or leaping forward
; (state $24, behaviour $12).
_trySwing:
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_swingMiss
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcc.s	_swingLeap
		move.b	#$23,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_swingLeap:
		move.b	#$24,AIState(a5)
		move.w	#BHVS_LEAP_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_swingMiss:
		tst.b	d0
		rts

; States $20+: 0 = pounce, 1/2/4 = leap/advance while swinging,
; 3 = stationary swing.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_pounceTick
		cmpi.b	#$01,d0
		beq.s	_swingTick
		cmpi.b	#$02,d0
		beq.s	_swingTick
		cmpi.b	#$03,d0
		beq.s	_swing
		bra.s	_swingTick

; Pounce: back to chasing once no longer airborne.
_pounceTick:
		move.b	Action1(a5),d0
		andi.b	#$30,d0			; ACT_JUMP|ACT_FALL bits
		beq.w	EnemyAI_Orc3
		bsr.w	j_j_OnTick
		rts

; Club swing: ACT_ATTACK1 windup for $F ticks, then the hit box
; ($19 ahead, 9 behind, 9 lateral) is live with ACT_ATTACK2 each tick
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
		beq.w	EnemyAI_Orc3

_swingRts:
		rts

; As _swing, but also runs the behaviour so the orc keeps moving.
_swingTick:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_swingTickDone
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	_swingTickDone
		beq.w	EnemyAI_Orc3

_swingTickDone:
		bsr.w	j_j_OnTick
		rts

		modend
