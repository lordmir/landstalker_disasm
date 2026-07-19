Mimic1	module
; AI for SPR_MIMIC1. A chest monster: when nobody is close enough to
; watch, it transforms into a treasure chest (CombatFlags bit 6 +
; forced transform frames; while disguised its behaviour is never
; ticked, so the chest sits perfectly still), popping back up when
; the player comes near. Its attack latches onto the player at chest
; height and drains $100 health every $1E ticks until he escapes.
; Two quirks: the disguise roll's result is never tested (it always
; disguises), and the hop state never runs its behaviour, freezing
; the mimic until a hit resets it.

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Mimic1_B:
		bra.s	EnemyAI_Mimic1

; A routine, run every tick.
EnemyAI_Mimic1_A:
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
; detection box ($50 ahead, $10 behind, $20 lateral), then aggro.
_idle:
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	CheckPlayerInRange
		bcs.s	EnemyAI_Mimic1
		rts

; Aggro / attack-over / hitstun recovery: drop the disguise and start
; chasing the player (behaviour 6, AIState $10).
EnemyAI_Mimic1:
		bclr	#$06,CombatFlags(a5)
		move.w	#BHVS_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		rts

; State $10: chasing - try each move in turn. While disguised (bit 6)
; the behaviour is not ticked, so the chest never moves.
_chase:
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryDisguise
		bcs.s	_chaseTick
		bsr.w	_tryHop
		bcs.s	_chaseTick
		bsr.w	_tryReveal
		bcs.s	_chaseTick
		bsr.w	_tryDrain

_chaseTick:
		btst	#$06,CombatFlags(a5)
		bne.s	_chaseEnd
		bsr.w	j_j_OnTick

_chaseEnd:
		rts

; Not airborne, not already disguised, and the player is *outside*
; the $80 box (nobody watching): become a chest (state $20). The
; random roll's result is never tested - the branch is missing - so
; this always triggers.
_tryDisguise:
		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	_disguiseMiss
		btst	#$06,CombatFlags(a5)
		bne.s	_disguiseMiss
		move.w	#$0080,d5
		move.w	#$0080,d6
		move.w	#$0080,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_disguiseMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0002,d7	; result unused: no conditional branch follows
		move.b	#$20,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		clr.b	AnimPhase(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bset	#$06,CombatFlags(a5)
		ori	#$01,ccr
		rts

_disguiseMiss:
		tst.b	d0
		rts

; Player within $20 all around: 401-in-1000 chance to hop away
; (state $21, BHVS_HOP_AI). The hop state never ticks the behaviour,
; so this actually freezes the mimic in place (see _hop).
_tryHop:
		btst	#$06,CombatFlags(a5)
		bne.s	_hopMiss
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_hopMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00400,d7
		bhi.s	_hopMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_HOP_AI,BehaviourLUTIndex(a5)
		clr.b	AnimPhase(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_hopMiss:
		tst.b	d0
		rts

; Disguised, not airborne, and the player is within $30 all around:
; pop back up to mimic form (state $22).
_tryReveal:
		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	_revealMiss
		btst	#$06,CombatFlags(a5)
		beq.s	_revealMiss
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_revealMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		bclr	#$06,CombatFlags(a5)
		ori	#$01,ccr
		rts

_revealMiss:
		tst.b	d0
		rts

; Not disguised, player within $10 ahead, $8 lateral, and at chest
; height (hitbox tops within a $20 window): latch on and drain
; (state $23).
_tryDrain:
		btst	#$06,CombatFlags(a5)
		bne.s	_drainMiss
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_drainMiss
		move.b	HitBoxSubZEnd(a5),d0
		subi.b	#$10,d0
		sub.b	(Player_HitBoxZEnd+1).l,d0
		cmpi.b	#$20,d0
		bcc.s	_drainMiss
		move.b	#$23,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_drainMiss:
		tst.b	d0
		rts

; States $20+: 0 = become a chest, 1 = hop (inert), 2 = reveal,
; 3+ = drain.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_morph
		cmpi.b	#$01,d0
		beq.w	_hop
		cmpi.b	#$02,d0
		beq.w	_reveal
		cmpi.b	#$03,d0
		beq.w	_drain
		bra.w	_drain

; Become a chest: step down through the forced transform frames
; ($1C0 -> $40, one every 8 ticks); the final frame returns to the
; chase state still disguised, so the chest sits still.
_morph:
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$01,AnimPhase(a5)
		bne.s	_morph2
		move.b	#$FF,Action1(a5)
		move.w	#$01C0,PrevAction(a5)
		rts

_morph2:
		cmpi.b	#$08,AnimPhase(a5)
		bne.s	_morph3
		move.b	#$FF,Action1(a5)
		move.w	#$0180,PrevAction(a5)
		rts

_morph3:
		cmpi.b	#$10,AnimPhase(a5)
		bne.s	_morph4
		move.b	#$FF,Action1(a5)
		move.w	#$0140,PrevAction(a5)
		rts

_morph4:
		cmpi.b	#$18,AnimPhase(a5)
		bne.s	_morph5
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts

_morph5:
		cmpi.b	#$20,AnimPhase(a5)
		bne.w	_morph6
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts

_morph6:
		cmpi.b	#$28,AnimPhase(a5)
		bne.w	_morph7
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts

_morph7:
		cmpi.b	#$30,AnimPhase(a5)
		bne.w	_morphRts
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		move.b	#$10,AIState(a5)

_morphRts:
		rts

; Hop state (BHVS_HOP_AI loaded): does nothing - the behaviour is
; never ticked, so the mimic stands frozen here until it takes a hit
; (the hitstun behaviour's RunSpecialAI then resets it).
_hop:
		rts

; Back to mimic form: step up through the transform frames ($40 ->
; $1C0, one every 8 ticks), then reset to the chase.
_reveal:
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$01,AnimPhase(a5)
		bne.s	_reveal2
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		rts

_reveal2:
		cmpi.b	#$08,AnimPhase(a5)
		bne.s	_reveal3
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts

_reveal3:
		cmpi.b	#$10,AnimPhase(a5)
		bne.s	_reveal4
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts

_reveal4:
		cmpi.b	#$18,AnimPhase(a5)
		bne.s	_reveal5
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts

_reveal5:
		cmpi.b	#$20,AnimPhase(a5)
		bne.w	_reveal6
		move.b	#$FF,Action1(a5)
		move.w	#$0140,PrevAction(a5)
		rts

_reveal6:
		cmpi.b	#$28,AnimPhase(a5)
		bne.w	_reveal7
		move.b	#$FF,Action1(a5)
		move.w	#$0180,PrevAction(a5)
		rts

_reveal7:
		cmpi.b	#$30,AnimPhase(a5)
		bne.w	_revealRts
		move.b	#$FF,Action1(a5)
		move.w	#$01C0,PrevAction(a5)
		bra.w	EnemyAI_Mimic1

_revealRts:
		rts

; Drain: lift so its own hitbox top sits $11 above the player's (the
; latch pose, ACT_ATTACK1); if the lifted spot is blocked, restore and
; reset. While latched: abort if the player is in a special animation,
; hold them in hitstun (g_PlayerHurtTimer = 1), and let go if they
; escape the small box. On the first tick of each $1E-tick cycle it
; plays the throw sound and drains $100 health (a5 temporarily points
; at the player) - repeating until the player escapes or dies.
_drain:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		move.w	Z(a5),d0
		move.w	HitBoxZEnd(a5),d1
		movem.w	d0-d1,-(sp)
		move.w	(Player_HitBoxZEnd).l,d0
		addi.w	#$0011,d0
		move.w	d0,HitBoxZEnd(a5)
		clr.w	d1
		move.b	Height(a5),d1
		sub.w	d1,d0
		addq.w	#$01,d0
		move.w	d0,Z(a5)
		jsr	(j_ValidateSpritePosition).l
		bcc.s	_drainLifted
		movem.w	(sp)+,d0-d1
		move.w	d0,Z(a5)
		move.w	d1,HitBoxZEnd(a5)
		bra.w	EnemyAI_Mimic1

_drainLifted:
		movem.w	(sp)+,d0-d1	; discard - keep the lifted position
		tst.b	(g_PlayerAnimation).l
		bne.w	EnemyAI_Mimic1
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_drainHold
		move.b	#$01,(g_PlayerHurtTimer).l

_drainHold:
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.w	EnemyAI_Mimic1
		move.b	AnimPhase(a5),d0
		addq.b	#$01,AnimPhase(a5)
		tst.b	d0
		bne.s	_drainWait
		trap	#$00			  ; Trap00Handler
		dc.w SND_Throw
		lea	(Player_X).l,a5
		move.w	#$0100,d0
		bsr.w	j_j_RemoveHealth
		tst.w	CurrentHealth(a5)
		beq.s	_playerDead

_drainWait:
		cmpi.b	#$1E,d0
		bcs.w	_drainRts
		clr.b	AnimPhase(a5)

_drainRts:
		rts

; The drain killed the player: clear their blink flag so they are
; drawn (a5 is the player here) and run the death sequence.
_playerDead:
		bclr	#$06,InteractFlags(a5)
		bra.w	j_j_PlayerDeath

		modend
