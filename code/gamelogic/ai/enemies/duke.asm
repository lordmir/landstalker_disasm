Duke	module
; AI for SPR_DUKE - Duke Mercator's sword fight. He uses Skeleton3's
; kit and odds: a long rush (BHVS_RUSH_40, 87-in-1000) that ends in
; the jab over its last $18 ticks, a block (126-in-1000: the guard
; pose with CombatFlags bit 0 invincibility for $28 ticks, dropped
; when he is hurt), the jab itself - the deep $29 box live every tick
; with no windup - and 50/50 leaping/advancing closes that also
; finish in the jab. CombatFlags bit 6, the alternate animation bank
; with his special poses (including the receive-damage animation), is
; held every tick.

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Duke_B:
		bra.s	EnemyAI_Duke

; A routine, run every tick. Being hurt drops the block (and his
; hitstun plays the damage animation from the alternate bank).
EnemyAI_Duke_A:
		bset	#$06,CombatFlags(a5)
		btst	#$01,InteractFlags(a5)
		bne.s	_hurtTick
		move.b	AIState(a5),d0
		beq.s	_idle
		cmpi.b	#$10,d0
		beq.s	_chase
		bra.w	_attackStates

_hurtTick:
		bclr	#$00,CombatFlags(a5)
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
		bcs.s	EnemyAI_Duke
		rts

; Aggro / attack-over / hitstun recovery: drop the block and start
; chasing the player (behaviour 6, AIState $10).
EnemyAI_Duke:
		bclr	#$00,CombatFlags(a5)
		move.w	#BHVS_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		rts

; State $10: chasing. If the player is already in hitstun just keep
; chasing; otherwise try each move in turn.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryRush
		bcs.s	_chaseTick
		bsr.s	_tryBlock
		bcs.s	_chaseTick
		bsr.w	_tryJab
		bcs.s	_chaseTick
		bsr.w	_tryClose

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		move.w	#BHVS_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; Player in the $50-$70 band ahead, $10 lateral: 87-in-1000 chance to
; rush (state $20, BHVS_RUSH_40) - the rush ends in the jab.
_tryRush:
		move.w	#$0070,d5
		move.w	#$FFB0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_rushMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00086,d7
		bhi.s	_rushMiss
		move.b	#$20,AIState(a5)
		move.w	#BHVS_RUSH_40,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_rushMiss:
		tst.b	d0
		rts

; Player within $50 ahead, $10 lateral: 126-in-1000 chance to block
; (state $21).
_tryBlock:
		move.w	#$0050,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_blockMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00125,d7
		bhi.s	_blockMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_blockMiss:
		tst.b	d0
		rts

; Player in the $20-$30 band ahead, $8 lateral: 44-in-1000 chance to
; jab (state $22, BHVS_ADVANCE).
_tryJab:
		move.w	#$0030,d5
		move.w	#$FFE0,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_jabMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00043,d7
		bhi.s	_jabMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_jabMiss:
		tst.b	d0
		rts

; Player point-blank ahead ($28 ahead, $8 lateral): close in - 50%
; with a leap (state $23, BHVS_LEAP_ADVANCE), else advancing (state
; $24, BHVS_ADVANCE); both finish in the jab.
_tryClose:
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_closeMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	_closeAdvance
		move.b	#$23,AIState(a5)
		move.w	#BHVS_LEAP_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_closeAdvance:
		move.b	#$24,AIState(a5)
		move.w	#BHVS_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_closeMiss:
		tst.b	d0
		rts

; States $20+: 0/3/4 = walking moves with the jab finish, 1 = block,
; 2 = jab. (The default's bra.w *+4 is a no-op falling into the
; walk-jab.)
_attackStates:
		andi.b	#$0F,d0
		beq.s	_walkJab
		cmpi.b	#$01,d0
		beq.s	_block
		cmpi.b	#$02,d0
		beq.w	_jab
		cmpi.b	#$03,d0
		beq.w	_walkJab
		bra.w	*+4			  ; (no-op branch)

; Rush / leap / advance: once the behaviour's walk has fewer than $18
; ticks left (BehavParam counts them down), the jab comes out -
; ACT_ATTACK1 with the deep hit box ($29 ahead, 9 behind, 9 lateral)
; live each tick.
_walkJab:
		cmpi.b	#$18,BehavParam(a5)
		bcc.s	_walkJabTick
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer

_walkJabTick:
		bsr.w	j_j_OnTick
		rts

; Block: hold the guard pose (ACT_ATTACK2), invincible (CombatFlags
; bit 0), for $28 ticks; being hurt or the reset drops the flag.
_block:
		bset	#$00,CombatFlags(a5)
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$28,AnimPhase(a5)
		bcc.w	EnemyAI_Duke
		rts

_jabTick:
		bsr.w	j_j_OnTick
		rts

; The jab: the deep hit box ($29 ahead, 9 behind, 9 lateral) is live
; every tick with the jab pose (ACT_ATTACK1) - no windup - while the
; advance behaviour moves him, for $F ticks.
_jab:
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_jabTick
		bra.w	EnemyAI_Duke

		modend
