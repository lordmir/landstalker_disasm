Harpy2	module
; AI for SPR_HARPY2, an unused flying enemy: identical logic to
; Harpy1 (one literal written in decimal where Harpy1 uses hex) -
; only the sprite differs. It never aggros on its
; own: the idle detection check's result is discarded (the branch is
; missing), so it only wakes when hit or when its placed behaviour
; runs RunSpecialAI. Once active it wanders (BHVS_WANDER) instead of
; chasing - though it homes in (behaviour 6) while the player is in
; hitstun - and opportunistically pounces from the $38-$50 ring,
; hovers (BHVS_PAUSE_60_AI), or backs off; in reach it uses its claw
; attack, 50% standing / 50% with a hop.

; B routine (behaviour command $2B): back to wandering.
EnemyAI_Harpy2_B:
		bra.s	EnemyAI_Harpy2

; A routine, run every tick.
EnemyAI_Harpy2_A:
		btst	#$01,InteractFlags(a5)
		bne.s	_hurtTick
		move.b	AIState(a5),d0
		beq.s	_idle
		cmpi.b	#$10,d0
		beq.s	_wander
		bra.w	_attackStates

_hurtTick:
		bsr.w	j_j_OnTick
		rts

; State 0: run the placed behaviour. The detection box is checked but
; the result is thrown away - the harpy never aggros from here.
_idle:
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	CheckPlayerInRange
		rts

; Attack-over / hitstun recovery: wander (behaviour 4, AIState $10).
EnemyAI_Harpy2:
		move.w	#BHVS_WANDER,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		rts

; State $10: wandering. While the player is in hitstun it chases
; instead; otherwise try each move in turn.
_wander:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryPounce
		bcs.s	_wanderTick
		bsr.s	_tryHover
		bcs.s	_wanderTick
		bsr.w	_tryRetreat
		bcs.s	_wanderTick
		bsr.w	_tryClaw

_wanderTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		bra.w	RunChaseBehaviour

; Player in the ring within $50 but not within $38, all around:
; 13-in-1000 chance to pounce at him (state $20, BHVS_POUNCE).
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
		cmpi.w	#00012,d7
		bhi.s	_pounceMiss
		move.b	#$20,AIState(a5)
		move.w	#BHVS_POUNCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_pounceMiss:
		tst.b	d0
		rts

; Player within $38 ahead or behind, $10 lateral, but not within $28
; all around: 19-in-1000 chance to hover in place (state $21,
; BHVS_PAUSE_60_AI).
_tryHover:
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_hoverMiss
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_hoverMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	_hoverMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_PAUSE_60_AI,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_hoverMiss:
		tst.b	d0
		rts

; Player within $30 ahead or behind, $10 lateral, but not within $28
; all around: 13-in-1000 chance to back away (state $22,
; BHVS_RETREAT).
_tryRetreat:
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_retreatMiss
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_retreatMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	_retreatMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_RETREAT,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_retreatMiss:
		tst.b	d0
		rts

; Player within $20 ahead, $8 lateral: claw - 50% standing (state
; $23), else with a hop (state $24, BHVS_HOP).
_tryClaw:
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_clawMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	_clawHop
		move.b	#$23,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_clawHop:
		move.b	#$24,AIState(a5)
		move.w	#BHVS_HOP,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_clawMiss:
		tst.b	d0
		rts

; States $20+: 0 = pounce, 1 = hover, 2 = retreat (behaviour ticks),
; 3/4 = claw (standing or hopping).
_attackStates:
		andi.b	#$0F,d0
		beq.s	_pounce
		cmpi.b	#$01,d0
		beq.s	_behaviourTick
		cmpi.b	#$02,d0
		beq.s	_behaviourTick
		cmpi.b	#$03,d0
		beq.s	_claw
		bra.s	_claw

; Pounce: ride the pounce behaviour while airborne (Action1 bits
; 4/5); contact does the damage. Reset on landing.
_pounce:
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		beq.w	EnemyAI_Harpy2

_behaviourTick:
		bsr.w	j_j_OnTick
		rts

; Claw: ACT_ATTACK1 windup for $F ticks, then the hit box ($19 ahead,
; 9 behind, 9 lateral) is live with ACT_ATTACK2 each tick until tick
; $1E, then back to wandering. The hop variant does not tick its
; behaviour here - both claws swing in place.
_claw:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_clawRts
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	_clawRts
		beq.w	EnemyAI_Harpy2

_clawRts:
		rts

		modend
