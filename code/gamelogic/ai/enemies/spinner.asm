Spinner	module
; AI for SPR_SPINNER1 and SPR_SPINNER2 (both jump-table entries route
; here). An armoured boss with two signature moves. The roll: if the
; player is anywhere in the $40-$A0 band ahead he always starts the
; wind-up - crouching (ACT_ATTACK5) then tucking into the ball
; (ACT_ATTACK6) - and then, invincible in his ball form (CombatFlags
; bits 0 and 6), charges at speed 8 until he hits a wall
; (BHVS_CHARGE_TO_WALL); contact does the damage, and he has no idle
; state - state 0 IS the roll wind-up, so he opens the fight with it.
; The steel-claw slash: a four-pose swing (ACT_ATTACK1-4, hit box
; live in the middle, invincible throughout), standing, rushing
; (BHVS_RUSH_40) or leaping in (BHVS_LEAP_ADVANCE). And if the player
; swings his sword while close, the spinner back-leaps out of range
; (BHVS_BACK_LEAP).

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Spinner_B:
		bra.s	EnemyAI_Spinner

; A routine, run every tick. No idle: anything that is not the chase
; ($10) dispatches as an attack state, including the initial state 0.
EnemyAI_Spinner_A:
		btst	#$01,InteractFlags(a5)
		bne.s	_hurtTick
		move.b	AIState(a5),d0
		cmpi.b	#$10,d0
		beq.s	_chase
		bra.w	_attackStates

_hurtTick:
		bsr.w	j_j_OnTick
		rts

; Attack-over / hitstun recovery: drop the ball form and chase
; (BHVS_RESUME_CHASE also clears the walk-backwards flag).
EnemyAI_Spinner:
		bclr	#$06,CombatFlags(a5)
		bclr	#$00,CombatFlags(a5)
		move.w	#BHVS_RESUME_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		rts

; State $10: chasing - try each move in turn.
_chase:
		bclr	#$00,CombatFlags(a5)
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryRoll
		bcs.s	_chaseTick
		bsr.s	_tryRush
		bcs.s	_chaseTick
		bsr.w	_tryLeap
		bcs.s	_chaseTick
		bsr.w	_trySlash
		bcs.s	_chaseTick
		bsr.w	_tryBackLeap

_chaseTick:
		bsr.w	j_j_OnTick
		rts

; Player in the $40-$A0 band ahead, $10 lateral: always roll (state
; $20). The two facing compares are dead - no branch follows either.
_tryRoll:
		move.w	#$00A0,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_rollMiss
		move.b	RotationAndSize(a5),d0
		andi.b	#DIR_MASK,d0
		cmpi.b	#DIR_SE,d0
		cmpi.b	#DIR_SW,d0
		move.b	#$20,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_rollMiss:
		tst.b	d0
		rts

; Player in the $20-$50 band ahead, $10 lateral: 26-in-1000 chance to
; slash rushing (state $21, BHVS_RUSH_40).
_tryRush:
		move.w	#$0050,d5
		move.w	#$FFE0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_rushMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	_rushMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_RUSH_40,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_rushMiss:
		tst.b	d0
		rts

; Player in the $20-$30 band ahead, $10 lateral: 17-in-1000 chance to
; slash leaping in (state $22, BHVS_LEAP_ADVANCE).
_tryLeap:
		move.w	#$0030,d5
		move.w	#$FFE0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_leapMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00016,d7
		bhi.s	_leapMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_LEAP_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_leapMiss:
		tst.b	d0
		rts

; Player within $20 ahead, $8 lateral: slash standing, always (state
; $23). Shares its miss exit with the back-leap below.
_trySlash:
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_backLeapMiss
		move.b	#$23,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

; Player in the $10-$40 band ahead, $10 lateral, and mid-swing
; (attack action ids 1-7): dodge - leap away backwards (state $24,
; BHVS_BACK_LEAP).
_tryBackLeap:
		move.w	#$0040,d5
		move.w	#$FFF0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_backLeapMiss
		move.b	(Player_Action).l,d0
		andi.b	#$07,d0
		beq.s	_backLeapMiss
		move.b	#$24,AIState(a5)
		move.w	#BHVS_BACK_LEAP,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_backLeapMiss:
		tst.b	d0
		rts

; States: 0 = the roll, 1/2/3 = the claw slash (rushing, leaping or
; standing), 4+ = the back-leap (behaviour ticks).
_attackStates:
		andi.b	#$0F,d0
		beq.s	_roll
		cmpi.b	#$01,d0
		beq.s	_slash
		cmpi.b	#$02,d0
		beq.s	_slash
		cmpi.b	#$03,d0
		beq.s	_slash
		bra.w	_stateTick

; The roll: wind up - crouch (ACT_ATTACK5) to tick $A, tuck into the
; ball (ACT_ATTACK6) to $14 - then turn invincible in the ball form
; (CombatFlags bits 0 and 6) and charge at speed 8 until a wall
; stops it (BHVS_CHARGE_TO_WALL, whose RunSpecialAI then resets).
; Past $14 the behaviour does the rolling.
_roll:
		cmpi.b	#$14,AICounter(a5)
		bhi.s	_rollTick
		move.w	#ACT_ATTACK5,QueuedAction(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$0A,AICounter(a5)
		bcs.s	_rollTick
		move.w	#ACT_ATTACK6,QueuedAction(a5)
		cmpi.b	#$14,AICounter(a5)
		bcs.s	_rollTick
		bset	#$06,CombatFlags(a5)
		bset	#$00,CombatFlags(a5)
		move.w	#BHVS_CHARGE_TO_WALL,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour

_rollTick:
		bsr.w	j_j_OnTick
		rts

; The steel-claw slash, invincible throughout (CombatFlags bit 0
; re-set each tick): ACT_ATTACK1 to tick 5 (the swing sound there),
; ACT_ATTACK2 to $A, then the hit box ($19 ahead, 9 behind, 9
; lateral) is live with ACT_ATTACK3 to $F, ACT_ATTACK4 to $14, then
; back to chasing. The rush and leap variants keep moving.
_slash:
		bset	#$00,CombatFlags(a5)
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$05,AICounter(a5)
		bcs.s	_stateTick
		bne.s	_slashSwing
		trap	#$00			  ; Trap00Handler
		dc.w SND_SwordSwing

_slashSwing:
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$0A,AICounter(a5)
		bcs.s	_stateTick
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		cmpi.b	#$0F,AICounter(a5)
		bcs.s	_stateTick
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		cmpi.b	#$14,AICounter(a5)
		bcs.s	_stateTick
		beq.w	EnemyAI_Spinner

_stateTick:
		bsr.w	j_j_OnTick
		rts

		modend
