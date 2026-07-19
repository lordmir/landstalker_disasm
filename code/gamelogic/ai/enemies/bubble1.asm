Bubble1	module
; AI for SPR_BUBBLE1. Mostly sits still: each idle tick it rolls a
; random 0-999 and may start a short move (behaviour $20) or a
; stationary wobble; being hurt just runs the behaviour until the
; hitstun recovery resets it to idle.

; B routine (behaviour command $2B): reset to idle.
EnemyAI_Bubble1_B:
		bra.s	EnemyAI_Bubble1

; A routine, run every tick.
EnemyAI_Bubble1_A:
		btst	#$01,InteractFlags(a5)
		bne.s	_hurtTick
		move.b	AIState(a5),d0
		beq.s	_idle
		cmpi.b	#$10,d0
		beq.s	_wobble

_hurtTick:
		bsr.w	j_j_OnTick
		rts

; Idle: if not mid behaviour record, roll 0-999 and test the low byte
; (cmpi.b, so 4 outcomes in 1000 each): 0 = start a move (behaviour
; $20), 1 = start the wobble, anything else = do nothing this tick.
_idle:
		tst.w	BehavParam(a5)
		bne.s	_tick
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.b	#$01,d7
		bcs.s	_startMove
		cmpi.b	#$02,d7
		bcs.s	_startWobble
		rts

_startMove:
		move.w	#BHVS_RANDOM_STEP,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour

_tick:
		bsr.w	j_j_OnTick
		rts

_startWobble:
		move.b	#$10,AIState(a5)
		clr.b	AnimPhase(a5)
		rts

; Hitstun recovery entry: back to idle (behaviour 0, AIState 0, hurt
; flag cleared).
EnemyAI_Bubble1:
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$00,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		rts

; State $10: stand and wobble - alternate ACT_ATTACK3/ACT_ATTACK4 every
; 4 ticks; after $40 ticks clear the action and return to idle.
_wobble:
		addq.b	#$01,AnimPhase(a5)
		move.b	AnimPhase(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#ACT_ATTACK3,d0
		move.w	d0,QueuedAction(a5)
		cmpi.b	#$40,AnimPhase(a5)
		bcs.s	_wobbleRts
		clr.w	QueuedAction(a5)
		move.w	#$FFFF,PrevAction(a5)
		clr.b	AIState(a5)

_wobbleRts:
		rts

		modend
