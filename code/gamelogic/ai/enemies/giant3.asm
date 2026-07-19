Giant3	module
; AI for SPR_GIANT3. The strongest giant: its rush is the long
; BHVS_RUSH_40_2, it swings the club during its pounce's descent, and
; point-blank is a 50/50 split between the slow heavy swing and the
; flurry.

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Giant3_B:
		bra.s	EnemyAI_Giant3

; A routine, run every tick.
EnemyAI_Giant3_A:
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
		bcs.s	EnemyAI_Giant3
		rts

; Aggro / attack-over / hitstun recovery: start chasing the player
; (behaviour 6, AIState $10).
EnemyAI_Giant3:
		bra.w	StartEnemyChase

; State $10: chasing. If the player is already in hitstun just keep
; chasing; otherwise try each attack in turn, farthest range first.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryRush
		bcs.s	_chaseTick
		bsr.s	_tryPounce
		bcs.s	_chaseTick
		bsr.w	_tryAdvance
		bcs.s	_chaseTick
		bsr.w	_trySwing

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		bra.w	RunChaseBehaviour

; Player in the $40-$58 band ahead, $10 lateral: 9-in-1000 chance to
; rush (state $20, BHVS_RUSH_40_2: walk 40 ticks at speed 2).
_tryRush:
		move.w	#$0058,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_rushMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00008,d7
		bhi.s	_rushMiss
		move.b	#$20,AIState(a5)
		move.w	#BHVS_RUSH_40_2,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_rushMiss:
		tst.b	d0
		rts

; Player in the $38-$48 band ahead, $10 lateral: 19-in-1000 chance to
; pounce (state $21, BHVS_POUNCE), swinging on the way down.
_tryPounce:
		move.w	#$0048,d5
		move.w	#$FFC8,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_pounceMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	_pounceMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_POUNCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_pounceMiss:
		tst.b	d0
		rts

; Player within $38 ahead, $10 lateral: 6-in-1000 chance to advance
; swinging (state $22, BHVS_ADVANCE).
_tryAdvance:
		move.w	#$0038,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_advanceMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00005,d7
		bhi.s	_advanceMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_advanceMiss:
		tst.b	d0
		rts

; Player within $28 ahead, $10 lateral: standing attack - 50/50 the
; slow heavy swing (state $23) or the flurry (state $24).
_trySwing:
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_swingMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	_flurryStart
		move.b	#$23,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_flurryStart:
		move.b	#$24,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_swingMiss:
		tst.b	d0
		rts

; States $20+: 0 = rush, 1 = pounce with swing, 2 = quick swing,
; 3 = slow swing, 4 = flurry.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_tick
		cmpi.b	#$01,d0
		beq.s	_pounceSwing
		cmpi.b	#$02,d0
		beq.s	_swing
		cmpi.b	#$03,d0
		beq.w	_swingSlow
		bra.w	_flurry

_tick:
		bsr.w	j_j_OnTick
		rts

; Pounce with swing: club raised (ACT_ATTACK1) while rising; once past
; the peak the hit box goes live with ACT_ATTACK2; back to chasing on
; landing.
_pounceSwing:
		move.b	Action1(a5),d1
		move.b	d1,d2
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		andi.b	#$20,d1			; ACT_JUMP bit
		bne.s	_pounceTick
		movem.w	d2,-(sp)
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		movem.w	(sp)+,d2
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		andi.b	#$10,d2			; ACT_FALL bit
		bne.s	_pounceTick
		bra.w	EnemyAI_Giant3

_pounceTick:
		bsr.w	j_j_OnTick
		rts

; Quick club swing: ACT_ATTACK1 windup for $F ticks, then the hit box
; ($21 ahead, 9 behind, 9 lateral) is live with ACT_ATTACK2 each tick
; until tick $1E, then back to chasing.
_swing:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_swingTick
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	_swingTick
		bra.w	EnemyAI_Giant3

_swingTick:
		bsr.w	j_j_OnTick
		rts

; Slow heavy swing: the same hit box but a $1E-tick windup, live until
; tick $2D.
_swingSlow:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	_swingSlowRts
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$2D,AnimPhase(a5)
		bcs.s	_swingSlowRts
		bra.w	EnemyAI_Giant3

_swingSlowRts:
		rts

; Flurry: alternate ACT_ATTACK1/ACT_ATTACK2 every 8 ticks, the hit box
; live during every ACT_ATTACK2 half, for $60 ticks (three full
; swings).
_flurry:
		addq.b	#$01,AnimPhase(a5)
		move.b	AnimPhase(a5),d0
		andi.w	#$0008,d0
		lsl.w	#$05,d0
		addi.w	#ACT_ATTACK1,d0
		move.w	d0,QueuedAction(a5)
		cmpi.w	#ACT_ATTACK1,d0
		beq.s	_flurryEnd
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer

_flurryEnd:
		cmpi.b	#$60,AnimPhase(a5)
		bcc.w	EnemyAI_Giant3
		rts

		modend
