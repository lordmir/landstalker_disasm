Knight3	module
; AI for SPR_KNIGHT3. The strongest knight: its ranged move is a
; thrusting leap (BHVS_LEAP_ADVANCE), and its guard is a counter -
; whenever the player swings nearby it leaps at him with the guard
; up, invincible while it closes in. Note the counter's random roll is
; compared but never branched on (presumably a bug), so it always
; fires when the player attacks in range.

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Knight3_B:
		bra.s	EnemyAI_Knight3

; A routine, run every tick.
EnemyAI_Knight3_A:
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
		bcs.s	EnemyAI_Knight3
		rts

; Aggro / attack-over / hitstun recovery: start chasing the player
; (behaviour 6, AIState $10).
EnemyAI_Knight3:
		bra.w	StartEnemyChase

; State $10: chasing. If the player is already in hitstun just keep
; chasing; otherwise try each move in turn.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryLeap
		bcs.s	_chaseTick
		bsr.s	_tryCounter
		bcs.s	_chaseTick
		bsr.w	_tryAdvance
		bcs.s	_chaseTick
		bsr.w	_tryThrust

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		bra.w	RunChaseBehaviour

; Player in the $30-$40 band ahead, $10 lateral: 19-in-1000 chance to
; leap at the player, thrusting (state $20, BHVS_LEAP_ADVANCE).
_tryLeap:
		move.w	#$0040,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_leapMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	_leapMiss
		move.b	#$20,AIState(a5)
		move.w	#BHVS_LEAP_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_leapMiss:
		tst.b	d0
		rts

; Player in the $20-$38 band ahead, $8 lateral, and mid sword swing:
; counter-leap with the guard up (state $21, BHVS_LEAP_ADVANCE). The
; random roll's result is never tested, so the counter always fires.
_tryCounter:
		move.w	#$0038,d5
		move.w	#$FFE0,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_counterMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		move.b	(Player_Action).l,d0	; player action id byte
		andi.b	#$07,d0
		beq.s	_counterMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_LEAP_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_counterMiss:
		tst.b	d0
		rts

; Player within $30 ahead, $10 lateral: 76-in-1000 chance to advance
; thrusting (state $22, BHVS_ADVANCE).
_tryAdvance:
		move.w	#$0030,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_advanceMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00075,d7
		bhi.s	_advanceMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_advanceMiss:
		tst.b	d0
		rts

; Player point-blank ahead ($28 ahead, $8 lateral): thrust - 10% with
; a hop (state $23, BHVS_HOP), else standing (state $24).
_tryThrust:
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_thrustMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00010,d7
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

; States $20+: 0/2/3/4 = thrust (0 during the leap), 1 = the
; counter-leap guard.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_thrust
		cmpi.b	#$01,d0
		beq.s	_guard
		cmpi.b	#$02,d0
		beq.s	_thrust
		cmpi.b	#$03,d0
		beq.s	_thrust
		bra.w	_thrust

; Counter-leap guard: raise the sword (ACT_ATTACK3) for 5 ticks, then
; the block pose (ACT_ATTACK4) until tick $17 - invincible
; (CombatFlags bit 0) throughout. Unlike the other knights this runs
; the behaviour each tick, so the knight keeps leaping while guarded.
_guard:
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$05,AnimPhase(a5)
		bcs.s	_guardHold
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		cmpi.b	#$17,AnimPhase(a5)
		bcs.s	_guardHold
		bclr	#$00,CombatFlags(a5)
		bra.w	EnemyAI_Knight3

_guardHold:
		bset	#$00,CombatFlags(a5)
		bsr.w	j_j_OnTick
		rts

; Sword thrust: ACT_ATTACK1 windup for $F ticks, then the hit box
; ($29 ahead, 9 behind, 9 lateral) is live with ACT_ATTACK2 each tick
; until tick $1E, then back to chasing. Runs the behaviour, so the
; leap, advance and hop variants keep moving.
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
		bra.w	EnemyAI_Knight3

_thrustTick:
		bsr.w	j_j_OnTick
		rts

		modend
