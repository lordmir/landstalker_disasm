Unicorn3	module
; AI for SPR_UNICORN3. The most defensive unicorn: it rarely charges
; (31% up front, 30% per stare-down re-roll) but dodges the player's
; swings 81% of the time, and its stare-down alternates the
; ACT_ATTACK2/ACT_ATTACK3 poses (the others use ATTACK3/ATTACK4).

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Unicorn3_B:
		bra.s	EnemyAI_Unicorn3

; A routine, run every tick. The walk-backwards flag only persists
; while the dodge state re-sets it each tick.
EnemyAI_Unicorn3_A:
		bclr	#$01,CombatFlags(a5)
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
		bcs.s	EnemyAI_Unicorn3
		rts

; Aggro / attack-over / hitstun recovery: start chasing the player
; (behaviour 6, AIState $10).
EnemyAI_Unicorn3:
		move.w	#BHVS_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		bclr	#$01,CombatFlags(a5)
		rts

; State $10: chasing. If the player is already in hitstun just keep
; chasing; otherwise try each move in turn.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryConfront
		bcs.s	_chaseTick
		bsr.w	_tryDodge
		bcs.s	_chaseTick
		bsr.w	_tryThrust

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		move.w	#BHVS_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; Player in the mid-range ring (within $40 but not within $30, all
; around) and the two are facing each other head-on: 31% chance to
; charge (state $21, BHVS_CHASE_BURST), else rear up for the
; stare-down (state $20). If not head-on, re-aim (reset re-loads the
; chase) and report no attack.
_tryConfront:
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_confrontMiss
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_confrontMiss
		move.b	RotationAndSize(a5),d0
		andi.b	#DIR_MASK,d0
		eori.b	#DIR_FLIP,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#DIR_MASK,d1
		cmp.b	d0,d1
		bne.s	_confrontReAim
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00030,d7
		bls.w	_startCharge
		move.b	#$20,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

; Charge the player (state $21, BHVS_CHASE_BURST). Also entered from
; the stare-down's periodic re-roll.
_startCharge:
		move.b	#$21,AIState(a5)
		move.w	#BHVS_CHASE_BURST,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_confrontReAim:
		bsr.w	EnemyAI_Unicorn3

_confrontMiss:
		tst.b	d0
		rts

; Player within $28 ahead, $10 lateral, facing each other head-on:
; if the player is not mid-swing, advance with the sword out (state
; $23, BHVS_ADVANCE); if he is mid-swing, 81% chance ($50 = 80) to
; dodge (state $22, BHVS_BACKSTEP + walk-backwards flag).
_tryDodge:
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_dodgeMiss
		move.b	RotationAndSize(a5),d0
		andi.b	#DIR_MASK,d0
		eori.b	#DIR_FLIP,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#DIR_MASK,d1
		cmp.b	d0,d1
		bne.s	_dodgeMiss
		move.b	(Player_PrevAction).l,d0
		andi.b	#$07,d0
		beq.w	_advance
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0050,d7
		bhi.s	_dodgeMiss
		bset	#$01,CombatFlags(a5)
		move.b	#$22,AIState(a5)
		move.w	#BHVS_BACKSTEP,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_dodgeMiss:
		tst.b	d0
		rts

_advance:
		move.b	#$23,AIState(a5)
		move.w	#BHVS_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

; Player point-blank ahead ($20 ahead, $10 lateral): standing sword
; thrust (state $24).
_tryThrust:
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_thrustMiss
		move.b	#$24,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_thrustMiss:
		tst.b	d0
		rts

; States $20+: 0 = stare-down, 1 = charge, 2 = dodge, 3/4 = thrust.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_stareDown
		cmpi.b	#$01,d0
		beq.w	_charge
		cmpi.b	#$02,d0
		beq.w	_dodge
		cmpi.b	#$03,d0
		beq.w	_thrust
		bra.w	_thrust

; Stare-down: only holds while the player stays in the mid-range ring
; and the two remain head-on (otherwise reset). Alternates the two
; threat poses (ACT_ATTACK2/ACT_ATTACK3) every $10 ticks, and on each
; pose flip rolls a 30% chance to break into the charge.
_stareDown:
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	CheckPlayerInRange
		bcc.w	EnemyAI_Unicorn3
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	CheckPlayerInRange
		bcs.w	EnemyAI_Unicorn3
		move.b	RotationAndSize(a5),d0
		andi.b	#DIR_MASK,d0
		eori.b	#DIR_FLIP,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#DIR_MASK,d1
		cmp.b	d0,d1
		bne.w	EnemyAI_Unicorn3
		addq.b	#$01,AnimPhase(a5)
		move.b	AnimPhase(a5),d0
		andi.b	#$0F,d0
		bne.s	_starePose
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00030,d7
		bcs.w	_startCharge

_starePose:
		move.b	AnimPhase(a5),d0
		andi.w	#$0010,d0
		lsl.w	#$04,d0
		addi.w	#ACT_ATTACK2,d0
		move.w	d0,QueuedAction(a5)
		rts

; Charge: the burst behaviour does the running; contact does the
; damage. Its RunSpecialAI resets to the chase when done.
_charge:
		bsr.w	j_j_OnTick
		rts

; Thrust: the hit box ($19 ahead, 9 behind, 9 lateral) is live every
; tick with the thrust pose (ACT_ATTACK1) - no windup - until
; AnimPhase reaches $10 (it is not cleared on entry, so a leftover
; count can cut this short). The advance variant keeps moving.
_thrust:
		addq.b	#$01,AnimPhase(a5)
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		cmpi.b	#$10,AnimPhase(a5)
		bcs.s	_thrustTick
		bra.w	EnemyAI_Unicorn3

_thrustTick:
		bsr.w	j_j_OnTick
		rts

; Dodge: re-set the walk-backwards flag (cleared at the top of every
; tick) while the backstep behaviour carries it away still facing the
; player; the behaviour's RunSpecialAI resets to the chase.
_dodge:
		bset	#$01,CombatFlags(a5)
		bsr.w	j_j_OnTick
		rts

		modend
