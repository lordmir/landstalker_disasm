Mummy1	module
; AI for SPR_MUMMY1. Shambles after the player; on the approach it
; may pause menacingly (BHVS_PAUSE_32_AI) or back off (BHVS_RETREAT),
; and at mid range it can unravel - collapsing into a pile of
; bandages (ACT_ATTACK3/4/5) and lying still until the player comes
; within $30, then winding itself back up. In reach it slashes (a
; deep, wide box: $21 ahead, $11 lateral) 80% of the time, else
; grabs hold and absorbs $40 health every $28 ticks until the player
; breaks free or dies.

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Mummy1_B:
		bra.s	EnemyAI_Mummy1

; A routine, run every tick.
EnemyAI_Mummy1_A:
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
; detection box ($70 ahead, $30 behind, $30 lateral), then aggro.
_idle:
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0070,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	CheckPlayerInRange
		bcs.s	EnemyAI_Mummy1
		rts

; Aggro / attack-over / hitstun recovery: start chasing the player
; (behaviour 6, AIState $10).
EnemyAI_Mummy1:
		move.w	#BHVS_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		clr.b	AnimPhase(a5)
		rts

; Drain cycle complete ($28 ticks): re-enter the drain state fresh -
; the mummy keeps absorbing until the player gets away.
_restartDrain:
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$24,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		clr.b	AnimPhase(a5)
		rts

; State $10: chasing. If the player is already in hitstun just keep
; chasing; otherwise try each move in turn.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryPause
		bcs.s	_chaseTick
		bsr.s	_tryRetreat
		bcs.s	_chaseTick
		bsr.w	_tryUnravel
		bcs.s	_chaseTick
		bsr.w	_tryMelee

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		move.w	#BHVS_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; Player in the $40-$50 band ahead, $10 lateral: 19-in-1000 chance to
; stop and menace for a moment (state $20, BHVS_PAUSE_32_AI).
_tryPause:
		move.w	#$0050,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_pauseMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	_pauseMiss
		move.b	#$20,AIState(a5)
		move.w	#BHVS_PAUSE_32_AI,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_pauseMiss:
		tst.b	d0
		rts

; Player in the $30-$48 band ahead, $10 lateral: 13-in-1000 chance to
; back away (state $21, BHVS_RETREAT).
_tryRetreat:
		move.w	#$0048,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_retreatMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	_retreatMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_RETREAT,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_retreatMiss:
		tst.b	d0
		rts

; Player in the $28-$38 band ahead, $10 lateral: 21-in-1000 chance to
; unravel into a bandage pile (state $22).
_tryUnravel:
		move.w	#$0038,d5
		move.w	#$FFD8,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_unravelMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00020,d7
		bhi.s	_unravelMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_unravelMiss:
		tst.b	d0
		rts

; Player within $18 ahead, $8 lateral, and no more than $21 above the
; player's feet: 80% slash (state $23), else grab and drain (state
; $24).
_tryMelee:
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_meleeMiss
		move.w	HitBoxZEnd(a5),d0
		sub.w	(Player_Z).l,d0
		cmpi.w	#$0021,d0
		bhi.s	_meleeMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00080,d7
		bcc.s	_meleeDrain
		move.b	#$23,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_meleeDrain:
		move.b	#$24,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_meleeMiss:
		tst.b	d0
		rts

; States $20+: 0 = pause, 1 = retreat (both just tick their
; behaviour), 2 = unravel, 3 = slash, 4+ = drain.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_behaviourTick
		cmpi.b	#$01,d0
		beq.s	_behaviourTick
		cmpi.b	#$02,d0
		beq.w	_unravel
		cmpi.b	#$03,d0
		beq.w	_slash
		bra.w	_drain

_behaviourTick:
		bsr.w	j_j_OnTick
		rts

; Unravel: collapse through ACT_ATTACK3/4/5 (8 ticks each) into a
; bandage pile, then lie still (holding AnimPhase at $18) until the
; player comes within $30 all around - then wind back up through
; ACT_ATTACK4/3 and return to the chase.
_unravel:
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$08,AnimPhase(a5)
		bcs.s	_unravelRts
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		cmpi.b	#$10,AnimPhase(a5)
		bcs.s	_unravelRts
		move.w	#ACT_ATTACK5,QueuedAction(a5)
		cmpi.b	#$18,AnimPhase(a5)
		bcs.s	_unravelRts
		cmpi.b	#$19,AnimPhase(a5)
		bcc.s	_rewrap
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	CheckPlayerInRange
		bcc.w	_holdUnravelled
		addq.b	#$01,AnimPhase(a5)

_rewrap:
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		cmpi.b	#$20,AnimPhase(a5)
		bcs.s	_unravelRts
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		cmpi.b	#$28,AnimPhase(a5)
		bcs.s	_unravelRts
		bra.w	EnemyAI_Mummy1

_holdUnravelled:
		subq.b	#$01,AnimPhase(a5)

_unravelRts:
		rts

; Drain: aborts if the player is in a special animation; holds him in
; hitstun (g_PlayerHurtTimer = 1) and lets go if he escapes the small
; box ($15 ahead, 9 behind, 9 lateral). On the first tick it plays
; the absorb sound and takes $40 health (a5 temporarily points at the
; player); after $28 ticks the state restarts and drains again.
_drain:
		tst.b	(g_PlayerAnimation).l
		bne.w	EnemyAI_Mummy1
		tst.b	(g_PlayerHurtTimer).l
		bne.w	_drainHold
		move.b	#$01,(g_PlayerHurtTimer).l
		bra.w	*+4			  ; (no-op branch)

_drainHold:
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0015,d5
		move.w	#$0009,d6
		move.w	#$0009,d7
		bsr.w	CheckPlayerInRange
		bcc.w	EnemyAI_Mummy1
		move.b	AnimPhase(a5),d0
		addq.b	#$01,AnimPhase(a5)
		tst.b	d0
		bne.s	_drainWait
		trap	#$00			  ; Trap00Handler
		dc.w SND_Throw
		lea	(Player_X).l,a5
		move.w	#$0040,d0
		bsr.w	j_j_RemoveHealth
		tst.w	CurrentHealth(a5)
		beq.s	_playerDead

_drainWait:
		cmpi.b	#$28,d0
		bcc.w	_restartDrain
		rts

; The drain killed the player: clear his blink flag so he is drawn
; (a5 is the player here) and run the death sequence.
_playerDead:
		bclr	#$06,InteractFlags(a5)
		bra.w	j_j_PlayerDeath

; Slash: ACT_ATTACK1 windup for $F ticks, then the deep, wide hit box
; ($21 ahead, 9 behind, $11 lateral) is live with ACT_ATTACK2 each
; tick until tick $1E, then back to chasing.
_slash:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.w	_slashRts
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0011,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcc.w	EnemyAI_Mummy1

_slashRts:
		rts

		modend
