Ghost2	module
; AI for SPR_GHOST2. Like Ghost1 with a stronger drain ($100 health,
; wider grab box), and after the grab lands it rolls: 90% drain, 10%
; the vanish attack - a large damaging burst, after which the ghost
; disappears (parked offscreen) until the ghost generator respawns it.

; B routine (behaviour command $2B): reset.
EnemyAI_Ghost2_B:
		bra.s	EnemyAI_Ghost2

; A routine, run every tick.
EnemyAI_Ghost2_A:
		btst	#$01,InteractFlags(a5)
		bne.s	_hurtTick
		move.b	AIState(a5),d0
		beq.s	_spawn
		cmpi.b	#$10,d0
		beq.s	_chase
		bra.w	_attackStates

_hurtTick:
		bsr.w	j_j_OnTick
		rts

_spawn:
		bra.s	_startMaterialise

; Reset entry: materialise if AnimCtrl bit 7 is set (fresh respawn),
; otherwise straight to the chase.
EnemyAI_Ghost2:
		tst.b	AnimCtrl(a5)
		bpl.s	_startChase

_startMaterialise:
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$20,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		clr.b	AnimPhase(a5)
		rts

_startChase:
		move.w	#BHVS_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		clr.b	AnimPhase(a5)
		rts

; State $10: chase, trying the grab each tick.
_chase:
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.w	_tryGrab
		bsr.w	j_j_OnTick
		rts

; Player within $10 ahead, $8 lateral, and no more than $20 above the
; ghost's hitbox top: 90% latch on and drain (state $21), 10% the
; vanish attack (state $22).
_tryGrab:
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_grabMiss
		move.w	HitBoxZEnd(a5),d0
		sub.w	(Player_Z).l,d0
		cmpi.w	#$0020,d0
		bcc.s	_grabMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00090,d7
		bcc.s	_startVanish
		move.b	#$21,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_startVanish:
		move.b	#$22,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_grabMiss:
		tst.b	d0
		rts

; States $20+: 0 = materialise, 1 = drain, 2 = vanish, anything else
; = reset.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_materialise
		cmpi.b	#$01,d0
		beq.s	_drain
		cmpi.b	#$02,d0
		beq.w	_vanish
		bra.w	EnemyAI_Ghost2

; Materialise: step through ACT_ATTACK1-4 (the fade-in frames) every
; 8 ticks, then start chasing.
_materialise:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$08,AnimPhase(a5)
		bcs.s	_matRts
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$10,AnimPhase(a5)
		bcs.s	_matRts
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		cmpi.b	#$18,AnimPhase(a5)
		bcs.s	_matRts
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		cmpi.b	#$20,AnimPhase(a5)
		bcs.s	_matRts
		move.w	#BHVS_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,AIState(a5)

_matRts:
		rts

; State $21 drain: aborts if the player is in a special animation;
; holds them in hitstun (g_PlayerHurtTimer = 1) and, on the first
; tick, plays the absorb sound and drains $100 health (a5 temporarily
; points at the player). Lets go back to the chase if the player
; escapes the box, or after $3C ticks.
_drain:
		tst.b	(g_PlayerAnimation).l
		bne.w	EnemyAI_Ghost2
		tst.b	(g_PlayerHurtTimer).l
		bne.w	_drainHold
		move.b	#$01,(g_PlayerHurtTimer).l
		bra.w	*+4			  ; (no-op branch)

_drainHold:
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0019,d5
		move.w	#$0009,d6
		move.w	#$0009,d7
		bsr.w	CheckPlayerInRange
		bcc.w	_startChase
		move.b	AICounter(a5),d0
		addq.b	#$01,AICounter(a5)
		tst.b	d0
		bne.s	_drainWait
		trap	#$00			  ; Trap00Handler
		dc.w SND_GhostAbsorbHP
		lea	(Player_X).l,a5
		move.w	#$0100,d0
		bsr.w	j_j_RemoveHealth
		tst.w	CurrentHealth(a5)
		beq.s	_playerDead

_drainWait:
		cmpi.b	#$3C,d0
		bcc.w	_startChase
		rts

; The drain killed the player: clear their blink flag so they are
; drawn (a5 is the player here) and run the death sequence.
_playerDead:
		bclr	#$06,InteractFlags(a5)
		bra.w	j_j_PlayerDeath

; State $22 vanish: a large hit box ($29 ahead/behind, $19 lateral)
; is live every tick with the vanish pose (ACT_ATTACK5); the vanish
; sound plays at phase 2, and at $F the ghost parks itself offscreen
; ($7F7F) - the ghost generator will respawn it later.
_vanish:
		move.w	#$0029,d1
		move.w	#$0029,d2
		move.w	#$0019,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK5,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcc.w	_vanishGone
		cmpi.b	#$02,AnimPhase(a5)
		bne.s	_vanishRts
		trap	#$00			  ; Trap00Handler
		dc.w SND_EnemyDie1

_vanishRts:
		rts

_vanishGone:
		bsr.w	MoveSpriteOffscreen
		bra.w	EnemyAI_Ghost2

		modend
