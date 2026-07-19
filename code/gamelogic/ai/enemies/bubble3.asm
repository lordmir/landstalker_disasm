Bubble3	module
; AI for SPR_BUBBLE3/4/5/6 (all four share this handler pair). Same as
; Bubble2, except it always starts a hop when the player comes within
; its $40-unit detection box instead of waiting on the random roll.

; B routine (behaviour command $2B): reset to idle.
EnemyAI_Bubble3_B:
		bra.s	EnemyAI_Bubble3

; A routine, run every tick.
EnemyAI_Bubble3_A:
		btst	#$01,InteractFlags(a5)
		bne.s	_hurtTick
		move.b	AIState(a5),d0
		beq.s	_idle
		cmpi.b	#$10,d0
		beq.w	_wobble

_hurtTick:
		bsr.w	j_j_OnTick
		rts

; Hitstun recovery entry: back to idle (behaviour 0, AIState 0, hurt
; flag cleared).
EnemyAI_Bubble3:
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$00,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		rts

; Idle: hop at the player if they are within $40 units; otherwise roll
; 0-999 and test the low byte (cmpi.b, so 4 outcomes in 1000 each):
; 0 = start a hop, 1 = start the wobble, anything else = do nothing
; this tick.
_idle:
		tst.w	BehavParam(a5)
		bne.s	_airPose
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_pickHop
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.b	#$01,d7
		bcs.s	_pickHop
		cmpi.b	#$02,d7
		bcs.s	_startWobble
		rts

; Pick a hop pattern: behaviour $22 80% of the time, $21 otherwise.
_pickHop:
		move.b	#$22,d0
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.b	#00080,d7
		bcs.s	_startHop
		move.b	#$21,d0

_startHop:
		move.w	d0,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour

; Run the behaviour; while airborne queue the squash/stretch poses.
_airPose:
		btst	#$05,Action1(a5)	; ACT_JUMP bit
		bne.s	_jumpPose
		btst	#$04,Action1(a5)	; ACT_FALL bit
		bne.s	_fallPose
		bsr.w	j_j_OnTick
		rts

_startWobble:
		move.b	#$10,AIState(a5)
		clr.b	AnimPhase(a5)
		rts

_jumpPose:
		bsr.w	j_j_OnTick
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		rts

_fallPose:
		bsr.w	j_j_OnTick
		move.w	#ACT_ATTACK2,QueuedAction(a5)
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
