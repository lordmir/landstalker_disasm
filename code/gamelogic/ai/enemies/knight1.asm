Knight1	module
; AI for SPR_KNIGHT1. Chases; can pause at range or retreat, and has
; the knights' two special moves: the sword guard - raised when the
; player is mid sword swing nearby, making the knight invincible
; (CombatFlags bit 0) while it holds the block - and the long sword
; thrust ($29-deep hit box), sometimes delivered with a hop
; (BHVS_HOP).

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Knight1_B:
		bra.s	EnemyAI_Knight1

; A routine, run every tick.
EnemyAI_Knight1_A:
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
; detection box ($60 ahead, $10 behind, $30 lateral), then aggro.
_idle:
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0060,d5
		move.w	#$0010,d6
		move.w	#$0030,d7
		bsr.w	CheckPlayerInRange
		bcs.s	EnemyAI_Knight1
		rts

; Aggro / attack-over / hitstun recovery: start chasing the player
; (behaviour 6, AIState $10).
EnemyAI_Knight1:
		bra.w	StartEnemyChase

; State $10: chasing. If the player is already in hitstun just keep
; chasing; otherwise try each move in turn.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryWait
		bcs.s	_chaseTick
		bsr.s	_tryRetreat
		bcs.s	_chaseTick
		bsr.w	_tryGuard
		bcs.s	_chaseTick
		bsr.w	_tryThrust

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		bra.w	RunChaseBehaviour

; Player in the $40-$48 band ahead, $10 lateral: 38-in-1000 chance to
; stop and wait (state $20, BHVS_PAUSE_32_AI).
_tryWait:
		move.w	#$0048,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_waitMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00037,d7
		bhi.s	_waitMiss
		move.b	#$20,AIState(a5)
		move.w	#BHVS_PAUSE_32_AI,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_waitMiss:
		tst.b	d0
		rts

; Player in the $30-$38 band ahead, $8 lateral: 26-in-1000 chance to
; retreat (state $21, BHVS_RETREAT: turn 180 and walk away).
_tryRetreat:
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_retreatMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	_retreatMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_RETREAT,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_retreatMiss:
		tst.b	d0
		rts

; Player within $28 ahead, $10 lateral, 15% roll, and the player is
; mid sword swing (the high byte of Player_Action holds the attack
; action id): raise the guard (state $22).
_tryGuard:
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_guardMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00150,d7
		bhi.s	_guardMiss
		move.b	(Player_Action).l,d0	; player action id byte
		andi.b	#$07,d0
		beq.s	_guardMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_guardMiss:
		tst.b	d0
		rts

; Player point-blank ahead ($20 ahead, $8 lateral): thrust - 30% with
; a hop (state $23, BHVS_HOP), else standing (state $24).
_tryThrust:
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_thrustMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00030,d7
		bcc.s	_thrustStand
		move.b	#$23,AIState(a5)
		move.w	#BHVS_HOP,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_thrustStand:
		move.b	#$24,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_thrustMiss:
		tst.b	d0
		rts

; States $20+: 0/1 = behaviour-driven wait/retreat, 2 = guard,
; 3/4 = thrust.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_tick
		cmpi.b	#$01,d0
		beq.s	_tick
		cmpi.b	#$02,d0
		beq.s	_guard
		cmpi.b	#$03,d0
		beq.s	_thrust
		bra.w	_thrust

_tick:
		bsr.w	j_j_OnTick
		rts

; Guard: raise the sword (ACT_ATTACK3) for 5 ticks, then hold the
; block pose (ACT_ATTACK4) until tick $17 - invincible (CombatFlags
; bit 0) the whole time, cleared at the end.
_guard:
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$05,AnimPhase(a5)
		bcs.s	_guardHold
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		cmpi.b	#$17,AnimPhase(a5)
		bcs.s	_guardHold
		bclr	#$00,CombatFlags(a5)
		bra.w	EnemyAI_Knight1

_guardHold:
		bset	#$00,CombatFlags(a5)
		rts

; Sword thrust: ACT_ATTACK1 windup for $F ticks, then the hit box
; ($29 ahead, 9 behind, 9 lateral) is live with ACT_ATTACK2 each tick
; until tick $1E, then back to chasing.
_thrust:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_thrustTick
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	_thrustTick
		bra.w	EnemyAI_Knight1

_thrustTick:
		bsr.w	j_j_OnTick
		rts

		modend
