Mimic2	module
; AI for SPR_MIMIC2. As Mimic1, but shy and stronger: the disguise
; roll actually works (3-in-1000 per tick while unobserved), the
; transform runs faster (one frame every 7 ticks), it flees when
; approached (BHVS_FLEE_RANDOM), and when in reach it usually flees
; fast instead of latching (89%). The drain takes $200 health every
; $1E ticks.

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Mimic2_B:
		bra.s	EnemyAI_Mimic2

; A routine, run every tick.
EnemyAI_Mimic2_A:
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
		bcs.s	EnemyAI_Mimic2
		rts

; Aggro / attack-over / hitstun recovery: drop the disguise and start
; chasing the player (behaviour 6, AIState $10).
EnemyAI_Mimic2:
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
		bsr.w	_tryFlee
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
; the $80 box (nobody watching): 3-in-1000 chance to become a chest
; (state $20).
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
		cmpi.w	#00002,d7
		bhi.s	_disguiseMiss
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

; Player within $50 ahead, $20 lateral: 41-in-1000 chance to run away
; in a random direction (state $21, BHVS_FLEE_RANDOM).
_tryFlee:
		btst	#$06,CombatFlags(a5)
		bne.s	_fleeMiss
		move.w	#$0050,d5
		move.w	#$0000,d6
		move.w	#$0020,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_fleeMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00040,d7
		bhi.s	_fleeMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_FLEE_RANDOM,BehaviourLUTIndex(a5)
		clr.b	AnimPhase(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_fleeMiss:
		tst.b	d0
		rts

; Disguised, not airborne, and the player is within $50 all around:
; pop back up to mimic form (state $22).
_tryReveal:
		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	_revealMiss
		btst	#$06,CombatFlags(a5)
		beq.s	_revealMiss
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
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
; height (hitbox tops within a $20 window): 11-in-100 chance to latch
; on and drain (state $23), else run away fast (state $24,
; BHVS_FLEE_FAST).
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
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00010,d7
		bhi.s	_drainFlee
		move.b	#$23,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_drainFlee:
		move.b	#$24,AIState(a5)
		move.w	#BHVS_FLEE_FAST,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_drainMiss:
		tst.b	d0
		rts

; States $20+: 0 = become a chest, 1/4 = flee (tick the behaviour),
; 2 = reveal, 3 = drain.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_morph
		cmpi.b	#$01,d0
		beq.w	_fleeTick
		cmpi.b	#$02,d0
		beq.w	_reveal
		cmpi.b	#$03,d0
		beq.w	_drain
		bra.w	_fleeTick

; Become a chest: step down through the forced transform frames
; ($1C0 -> $40, one every 7 ticks); the final frame returns to the
; chase state still disguised, so the chest sits still.
_morph:
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$01,AnimPhase(a5)
		bne.s	_morph2
		move.b	#$FF,Action1(a5)
		move.w	#$01C0,PrevAction(a5)
		rts

_morph2:
		cmpi.b	#$07,AnimPhase(a5)
		bne.s	_morph3
		move.b	#$FF,Action1(a5)
		move.w	#$0180,PrevAction(a5)
		rts

_morph3:
		cmpi.b	#$0E,AnimPhase(a5)
		bne.s	_morph4
		move.b	#$FF,Action1(a5)
		move.w	#$0140,PrevAction(a5)
		rts

_morph4:
		cmpi.b	#$15,AnimPhase(a5)
		bne.s	_morph5
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts

_morph5:
		cmpi.b	#$1C,AnimPhase(a5)
		bne.w	_morph6
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts

_morph6:
		cmpi.b	#$23,AnimPhase(a5)
		bne.w	_morph7
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts

_morph7:
		cmpi.b	#$2A,AnimPhase(a5)
		bne.w	_morphRts
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		move.b	#$10,AIState(a5)

_morphRts:
		rts

; Flee states ($21/$24): run the flee behaviour; it ends with
; RunSpecialAI, which resets to the chase.
_fleeTick:
		bsr.w	j_j_OnTick
		rts

; Back to mimic form: step up through the transform frames ($40 ->
; $1C0, one every 7 ticks), then reset to the chase.
_reveal:
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$01,AnimPhase(a5)
		bne.s	_reveal2
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		rts

_reveal2:
		cmpi.b	#$07,AnimPhase(a5)
		bne.s	_reveal3
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts

_reveal3:
		cmpi.b	#$0E,AnimPhase(a5)
		bne.s	_reveal4
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts

_reveal4:
		cmpi.b	#$15,AnimPhase(a5)
		bne.s	_reveal5
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts

_reveal5:
		cmpi.b	#$1C,AnimPhase(a5)
		bne.w	_reveal6
		move.b	#$FF,Action1(a5)
		move.w	#$0140,PrevAction(a5)
		rts

_reveal6:
		cmpi.b	#$23,AnimPhase(a5)
		bne.w	_reveal7
		move.b	#$FF,Action1(a5)
		move.w	#$0180,PrevAction(a5)
		rts

_reveal7:
		cmpi.b	#$2A,AnimPhase(a5)
		bne.w	_revealRts
		move.b	#$FF,Action1(a5)
		move.w	#$01C0,PrevAction(a5)
		bra.w	EnemyAI_Mimic2

_revealRts:
		rts

; Drain: lift so its own hitbox top sits $11 above the player's (the
; latch pose, ACT_ATTACK1); if the lifted spot is blocked, restore and
; reset. While latched: abort if the player is in a special animation,
; hold them in hitstun (g_PlayerHurtTimer = 1), and let go if they
; escape the small box. On the first tick of each $1E-tick cycle it
; plays the throw sound and drains $200 health (a5 temporarily points
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
		bra.w	EnemyAI_Mimic2

_drainLifted:
		movem.w	(sp)+,d0-d1	; discard - keep the lifted position
		tst.b	(g_PlayerAnimation).l
		bne.w	EnemyAI_Mimic2
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
		bcc.w	EnemyAI_Mimic2
		move.b	AnimPhase(a5),d0
		addq.b	#$01,AnimPhase(a5)
		tst.b	d0
		bne.s	_drainWait
		trap	#$00			  ; Trap00Handler
		dc.w SND_Throw
		lea	(Player_X).l,a5
		move.w	#$0200,d0
		jsr	(j_j_RemoveHealth).l
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
