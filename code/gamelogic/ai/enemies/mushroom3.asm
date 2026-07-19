Mushroom3	module
; AI for SPR_MUSHROOM3. Like Mushroom2, but its spore burst deals no
; damage at all - it only inflicts status effects: roll 0-99 at the
; end of the puff for poison (0-29), paralysis (30-49), confusion
; (50-64), curse (65-69), or nothing (70+).

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Mushroom3_B:
		bra.s	EnemyAI_Mushroom3

; A routine, run every tick.
EnemyAI_Mushroom3_A:
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
		bcs.s	EnemyAI_Mushroom3
		rts

; Aggro / attack-over / hitstun recovery: drop the disguise and chase
; the player (behaviour 6, AIState $10).
EnemyAI_Mushroom3:
		bclr	#$06,CombatFlags(a5)
		move.w	#BHVS_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		rts

; State $10: chasing (or sitting shrunken, if disguised). Try each
; move; while disguised the behaviour is not run, so the mushroom sits
; still.
_chase:
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryMorph
		bcs.s	_chaseTick
		bsr.w	_tryWait
		bcs.s	_chaseTick
		bsr.w	_trySpore
		bcs.s	_chaseTick
		bsr.w	_tryMelee

_chaseTick:
		btst	#$06,CombatFlags(a5)
		bne.s	_chaseRts
		bsr.w	j_j_OnTick

_chaseRts:
		rts

; Shrink or pop up (both via the state $20 morph sequence), never
; while airborne. Player within $20: 38-in-1000 chance per tick to
; shrink (disguise on, hitbox flattened, phases run 1-$18) when
; upright, or to pop up (AnimPhase $1F, resuming at the rise phases
; $20-$30) when disguised.
_tryMorph:
		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	_morphMiss
		btst	#$06,CombatFlags(a5)
		bne.s	_tryReveal
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	CheckPlayerInRange
		bcc.w	_morphMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00037,d7
		bhi.s	_morphMiss
		move.b	#$20,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		clr.b	AnimPhase(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bset	#$06,CombatFlags(a5)
		move.w	Z(a5),HitBoxZEnd(a5)
		ori	#$01,ccr
		rts

_tryReveal:
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_morphMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00037,d7
		bhi.s	_morphMiss
		move.b	#$20,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$1F,AnimPhase(a5)
		ori	#$01,ccr
		rts

_morphMiss:
		tst.b	d0
		rts

; Player in the $30-$38 band directly ahead (d6 negative pulls the box
; in front): 13-in-1000 chance to stop and wait (state $21,
; BHVS_PAUSE_32_AI).
_tryWait:
		btst	#$06,CombatFlags(a5)
		bne.s	_waitMiss
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_waitMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	_waitMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_PAUSE_32_AI,BehaviourLUTIndex(a5)
		clr.b	AnimPhase(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_waitMiss:
		tst.b	d0
		rts

; Player in the $18-$20 band directly ahead: 88-in-1000 chance to
; release a spore burst (state $22).
_trySpore:
		btst	#$06,CombatFlags(a5)
		bne.s	_sporeMiss
		move.w	#$0020,d5
		move.w	#$FFE8,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_sporeMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00087,d7
		bhi.s	_sporeMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_sporeMiss:
		tst.b	d0
		rts

; Player point-blank ahead ($18 ahead, $8 lateral): bite - 70%
; standing still (state $23), else advancing (state $24,
; BHVS_ADVANCE).
_tryMelee:
		btst	#$06,CombatFlags(a5)
		bne.s	_meleeMiss
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_meleeMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00070,d7
		bcc.s	_meleeAdvance
		move.b	#$23,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_meleeAdvance:
		move.b	#$24,AIState(a5)
		move.w	#BHVS_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_meleeMiss:
		tst.b	d0
		rts

; States $20+: 0 = morph (shrink/rise), 2 = spore burst, 3 = bite,
; 1/4 = behaviour-driven.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_morph
		cmpi.b	#$01,d0
		beq.w	_tick
		cmpi.b	#$02,d0
		beq.w	_spore
		cmpi.b	#$03,d0
		beq.w	_melee
		bra.w	_tick

; State $20 morph sequence: phases 1/$8/$10/$18 shrink (forcing morph
; animation frames via Action1 = $FF + PrevAction $40/$80/$C0/$100),
; then $20/$28/$30 rise back up. _tryMorph starts it at phase 0
; (shrink) or phase $1F (rise).
_morph:
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$01,AnimPhase(a5)
		bne.s	_shrink2
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		rts

_shrink2:
		cmpi.b	#$08,AnimPhase(a5)
		bne.s	_shrink3
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts

_shrink3:
		cmpi.b	#$10,AnimPhase(a5)
		bne.s	_shrunk
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts

; Fully shrunken. Unlike Mushroom1 this does not return to state $10:
; the phase keeps counting, so it pops back up on its own when it
; reaches the rise phases 8 ticks later.
_shrunk:
		cmpi.b	#$18,AnimPhase(a5)
		bne.s	_rise
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts

; Rising needs headroom: try the full-height hitbox and back off a
; phase if something is in the way.
_rise:
		cmpi.b	#$20,AnimPhase(a5)
		bne.s	_rise2
		clr.w	d0
		move.b	#$20,d0
		subq.b	#$01,d0
		add.w	d0,HitBoxZEnd(a5)
		jsr	(j_ValidateSpritePosition).l
		bcc.s	_riseOk
		move.w	Z(a5),HitBoxZEnd(a5)
		subq.b	#$01,AnimPhase(a5)
		rts

_riseOk:
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts

_rise2:
		cmpi.b	#$28,AnimPhase(a5)
		bne.s	_rise3
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts

; Upright again: clear the disguise and go back to chasing.
_rise3:
		cmpi.b	#$30,AnimPhase(a5)
		bne.s	_morphRts
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		bclr	#$06,CombatFlags(a5)
		bra.w	EnemyAI_Mushroom3

_morphRts:
		rts

_tick:
		bsr.w	j_j_OnTick
		rts

; State $22 spore burst: puff animation (ACT_ATTACK3/ACT_ATTACK4
; alternating) for $20 ticks, then roll 0-99 for the status effect:
; 0-29 poison, 30-49 paralysis, 50-64 confusion, 65-69 curse,
; 70+ nothing.
_spore:
		addq.b	#$01,AnimPhase(a5)
		move.b	AnimPhase(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#ACT_ATTACK3,d0
		move.w	d0,QueuedAction(a5)
		cmpi.b	#$20,AnimPhase(a5)
		bcs.s	_sporeRts
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		move.b	#STATUS_POISON,d0
		cmpi.b	#030,d7
		bcs.s	_sporeStatus
		move.b	#STATUS_PARALYSIS,d0
		cmpi.b	#050,d7
		bcs.s	_sporeStatus
		move.b	#STATUS_CONFUSION,d0
		cmpi.b	#065,d7
		bcs.s	_sporeStatus
		move.b	#STATUS_CURSE,d0
		cmpi.b	#070,d7
		bcc.w	EnemyAI_Mushroom3

_sporeStatus:
		bsr.w	j_j_AddStatusEffect
		bra.w	EnemyAI_Mushroom3

_sporeRts:
		rts

; State $23/$24 bite: the hit box ($19 ahead, 9 behind, 9 lateral) is
; live every tick with ACT_ATTACK1/ACT_ATTACK2 alternating, until
; tick $20.
_melee:
		addq.b	#$01,AnimPhase(a5)
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.b	AnimPhase(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#ACT_ATTACK1,d0
		move.w	d0,QueuedAction(a5)
		cmpi.b	#$20,AnimPhase(a5)
		bcs.s	_meleeRts
		bra.w	EnemyAI_Mushroom3

_meleeRts:
		rts

		modend
