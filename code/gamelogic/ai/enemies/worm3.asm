Worm3	module
; AI for SPR_WORM3. Like Worm2 with higher odds and a longer breath
; cloud ($20 ahead) that always inflicts a status effect on a hit:
; poison on a roll under 10, otherwise confusion. (The paralysis
; branch repeats the under-10 test, so it can never be taken -
; presumably a bug.)

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Worm3_B:
		bra.s	EnemyAI_Worm3

; A routine, run every tick.
EnemyAI_Worm3_A:
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

; State 0: underground - keep the hitbox flat every tick; aggro when
; the player enters the detection box ($50 ahead, $10 behind,
; $20 lateral).
_idle:
		move.w	Z(a5),HitBoxZEnd(a5)
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	CheckPlayerInRange
		bcs.s	EnemyAI_Worm3
		rts

; Aggro / attack-over / hitstun recovery: chase the player without
; jumping (BHVS_CHASE_NO_JUMP, AIState $10).
EnemyAI_Worm3:
		move.w	#BHVS_CHASE_NO_JUMP,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		rts

; State $10: chasing. If the player is already in hitstun just keep
; chasing; otherwise try each move. A successful _tryBurrow returns
; d0 = 1 and branches into _attackStates so the burrow starts this
; same tick.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryEmerge
		bcs.s	_chaseTick
		bsr.w	_tryBurrow
		bcs.w	_attackStates
		bsr.w	_tryBreath
		bcs.s	_chaseTick
		bsr.w	_tryBite

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		move.w	#BHVS_CHASE_NO_JUMP,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; Underground + player in the $28-$38 ring: 38-in-1000 chance per tick
; to emerge (falls into _startEmerge). Never while airborne.
_tryEmerge:
		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	_emergeMiss
		btst	#$06,CombatFlags(a5)
		bne.s	_emergeMiss
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_emergeMiss
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_emergeMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00037,d7
		bhi.s	_emergeMiss

; Start the emerge sequence (state $20, BHVS_PAUSE_32_AI); the other
; checks also jump here when the worm is still underground.
_startEmerge:
		move.b	#$20,AIState(a5)
		move.w	#BHVS_PAUSE_32_AI,BehaviourLUTIndex(a5)
		clr.b	AnimPhase(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_emergeMiss:
		tst.b	d0
		rts

; Above ground + player in the $28-$38 ring: 51-in-1000 chance to
; burrow (state $21); returns d0 = 1 for the immediate dispatch.
; Never while airborne.
_tryBurrow:
		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	_burrowMiss
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_burrowMiss
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_burrowMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bhi.s	_burrowMiss
		btst	#$06,CombatFlags(a5)
		beq.s	_startEmerge
		move.b	#$21,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		clr.b	AnimPhase(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$01,d0
		ori	#$01,ccr
		rts

_burrowMiss:
		tst.b	d0
		rts

; Player in the $18-$28 ring: 38-in-1000 chance to breathe poison dust
; (state $22); emerges first if underground.
_tryBreath:
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_breathMiss
		move.w	#$0018,d5
		move.w	#$0018,d6
		move.w	#$0018,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_breathMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00037,d7
		bhi.s	_breathMiss
		btst	#$06,CombatFlags(a5)
		beq.w	_startEmerge
		move.b	#$22,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_breathMiss:
		tst.b	d0
		rts

; Player point-blank ahead ($18 ahead, $8 lateral): always bite
; (state $23); emerges first if underground.
_tryBite:
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_biteMiss
		btst	#$06,CombatFlags(a5)
		beq.w	_startEmerge
		move.b	#$23,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_biteMiss:
		tst.b	d0
		rts

; States $20+: 0 = emerge, 1 = burrow, 2 = dust breath, 3+ = bite.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_emerge
		cmpi.b	#$01,d0
		beq.w	_burrow
		cmpi.b	#$02,d0
		beq.w	_breath
		cmpi.b	#$03,d0
		bra.w	_bite

; State $20 emerge: at phase 0, test the headroom by raising the
; hitbox top $17 (retry next tick if blocked), then mark the worm
; above ground and step the dig-up animation frames (Action1 = $FF +
; PrevAction $40/$80/$C0/$100) at phases 1/$A/$14/$1E; done at $32.
_emerge:
		tst.b	AnimPhase(a5)
		bne.s	_emergeAnim
		move.b	#$18,d0
		subq.b	#$01,d0
		add.b	d0,HitBoxSubZEnd(a5)
		jsr	(j_ValidateSpritePosition).l
		bcc.s	_emergeOk
		move.w	Z(a5),HitBoxZEnd(a5)
		rts

_emergeOk:
		bset	#$06,CombatFlags(a5)

_emergeAnim:
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$01,AnimPhase(a5)
		bne.s	_emergeF2
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		rts

_emergeF2:
		cmpi.b	#$0A,AnimPhase(a5)
		bne.s	_emergeF3
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts

_emergeF3:
		cmpi.b	#$14,AnimPhase(a5)
		bne.s	_emergeF4
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts

_emergeF4:
		cmpi.b	#$1E,AnimPhase(a5)
		bne.s	_emergeEnd
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts

_emergeEnd:
		cmpi.b	#$32,AnimPhase(a5)
		bne.w	_animRts
		bra.w	EnemyAI_Worm3

; State $21 burrow: clear the above-ground flag, step the dig-down
; frames ($100/$C0/$140/$180) at phases 1/$A/$14/$1E, then at $28
; flatten the hitbox again and go back to chasing (underground).
_burrow:
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$01,AnimPhase(a5)
		bne.s	_burrowF2
		bclr	#$06,CombatFlags(a5)
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts

_burrowF2:
		cmpi.b	#$0A,AnimPhase(a5)
		bne.s	_burrowF3
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts

_burrowF3:
		cmpi.b	#$14,AnimPhase(a5)
		bne.s	_burrowF4
		move.b	#$FF,Action1(a5)
		move.w	#$0140,PrevAction(a5)
		rts

_burrowF4:
		cmpi.b	#$1E,AnimPhase(a5)
		bne.s	_burrowEnd
		move.b	#$FF,Action1(a5)
		move.w	#$0180,PrevAction(a5)
		rts

_burrowEnd:
		cmpi.b	#$28,AnimPhase(a5)
		bne.s	_animRts
		move.b	#$FF,Action1(a5)
		move.w	#$0020,PrevAction(a5)
		move.w	Z(a5),HitBoxZEnd(a5)
		bra.w	EnemyAI_Worm3

_animRts:
		rts

; State $22 dust breath: emerge first if underground; ACT_ATTACK3
; windup for $C ticks, then the breath cloud (ACT_ATTACK5, box $20
; ahead, $8 lateral) - a hit on the first breath tick always inflicts
; a status: roll under 10 = poison, else confusion (the paralysis
; branch is unreachable). ACT_ATTACK6 recovery from tick $18, done at
; $20.
_breath:
		btst	#$06,CombatFlags(a5)
		bne.s	_breathGo
		bsr.w	_startEmerge
		bra.w	_emerge

_breathGo:
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0C,AnimPhase(a5)
		bcs.w	_biteRts
		move.w	#ACT_ATTACK5,QueuedAction(a5)
		move.w	#$0020,d1
		move.w	#$0000,d2
		move.w	#$0008,d3
		bsr.w	TryHitPlayer
		bcc.s	_breathTail
		cmpi.b	#$0C,AnimPhase(a5)
		bne.s	_breathTail
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		move.b	#STATUS_POISON,d0
		cmpi.b	#010,d7
		bcs.s	_applyStatus
		move.b	#STATUS_PARALYSIS,d0
		cmpi.b	#010,d7
		bcs.s	_applyStatus
		move.b	#STATUS_CONFUSION,d0

_applyStatus:
		bsr.w	j_j_AddStatusEffect
		bra.s	_breathRts

_breathTail:
		cmpi.b	#$18,AnimPhase(a5)
		bcs.s	_breathRts
		move.w	#ACT_ATTACK6,QueuedAction(a5)
		cmpi.b	#$20,AnimPhase(a5)
		bcs.s	_breathRts
		bra.w	_attackEnd

_breathRts:
		rts

; State $23 bite: emerge first if underground; ACT_ATTACK3 windup for
; $F ticks, the hit box ($19 ahead, 9 behind, 9 lateral) live with
; ACT_ATTACK4 until tick $1E.
_bite:
		btst	#$06,CombatFlags(a5)
		bne.s	_biteGo
		bsr.w	_startEmerge
		bra.w	_emerge

_biteGo:
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_biteRts
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	_biteRts

_attackEnd:
		clr.w	QueuedAction(a5)
		clr.w	PrevAction(a5)
		bset	#$06,CombatFlags(a5)
		bra.w	EnemyAI_Worm3

_biteRts:
		rts

		modend
