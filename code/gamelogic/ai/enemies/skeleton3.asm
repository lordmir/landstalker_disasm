Skeleton3	module
; AI for SPR_SKELETON3. The strongest skeleton: its long rush
; (BHVS_RUSH_40) turns into a lunge for its final $18 ticks (watching
; BehavParam count down), it blocks freely (no head-on facing
; requirement, 126-in-1000), and its point-blank swings leap or
; advance.

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Skeleton3_B:
		bra.s	EnemyAI_Skeleton3

; A routine, run every tick. Being hurt drops the block.
EnemyAI_Skeleton3_A:
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
		bcs.s	EnemyAI_Skeleton3
		rts

; Aggro / attack-over / hitstun recovery: drop the block and start
; chasing the player (behaviour 6, AIState $10).
EnemyAI_Skeleton3:
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
		bsr.w	_tryLunge
		bcs.s	_chaseTick
		bsr.w	_trySwing

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		move.w	#BHVS_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; Player in the $50-$70 band ahead, $10 lateral: 87-in-1000 chance to
; rush (state $20, BHVS_RUSH_40) - the rush ends in a lunge.
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
; lunge (state $22, BHVS_ADVANCE).
_tryLunge:
		move.w	#$0030,d5
		move.w	#$FFE0,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_lungeMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00043,d7
		bhi.s	_lungeMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_lungeMiss:
		tst.b	d0
		rts

; Player point-blank ahead ($28 ahead, $8 lateral): swing - 50% with
; a leap (state $23, BHVS_LEAP_ADVANCE), else advancing (state $24,
; BHVS_ADVANCE).
_trySwing:
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_swingMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	_swingAdvance
		move.b	#$23,AIState(a5)
		move.w	#BHVS_LEAP_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_swingAdvance:
		move.b	#$24,AIState(a5)
		move.w	#BHVS_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_swingMiss:
		tst.b	d0
		rts

; States $20+: 0 = rush (with lunge finish), 1 = block, 2 = lunge,
; 3/4 = swing.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_rushLunge
		cmpi.b	#$01,d0
		beq.s	_block
		cmpi.b	#$02,d0
		beq.w	_lunge
		cmpi.b	#$03,d0
		beq.w	_swing
		bra.w	_swing

; Rush: once the rush behaviour's walk has fewer than $18 ticks left
; (BehavParam counts them down), hold the lunge pose (ACT_ATTACK3)
; with the deep hit box live.
_rushLunge:
		cmpi.b	#$18,BehavParam(a5)
		bcc.s	_rushTick
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer

_rushTick:
		bsr.w	j_j_OnTick
		rts

; Block: hold the block pose (ACT_ATTACK4), invincible (CombatFlags
; bit 0), for $28 ticks; the reset drops the flag.
_block:
		bset	#$00,CombatFlags(a5)
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$28,AnimPhase(a5)
		bcc.w	EnemyAI_Skeleton3
		rts

; Swing: ACT_ATTACK1 windup for $F ticks, then the hit box ($19
; ahead, 9 behind, 9 lateral) is live with ACT_ATTACK2 each tick
; until tick $1E, then back to chasing. Runs the behaviour, so the
; leap and advance variants keep moving.
_swing:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_swingTick
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	_swingTick
		beq.w	EnemyAI_Skeleton3

_swingTick:
		bsr.w	j_j_OnTick
		rts

; Lunge: the deep hit box ($29 ahead, 9 behind, 9 lateral) is live
; every tick with the lunge pose (ACT_ATTACK3) while the advance
; behaviour moves the skeleton, for $F ticks.
_lunge:
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_swingTick
		bra.w	EnemyAI_Skeleton3

		modend
