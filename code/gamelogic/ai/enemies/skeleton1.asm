Skeleton1	module
; AI for SPR_SKELETON1. Chases; rushes from very long range, pounces,
; and has the skeletons' special lunge - an advance with the sword
; held out, its deep hit box ($29 ahead) live every tick. Point-blank
; it swings, sometimes with a hop. (No block - that is Skeleton2/3.)
; A leftover bone-throw spawner sits unreachable at the end of the
; file.

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Skeleton1_B:
		bra.s	EnemyAI_Skeleton1

; A routine, run every tick.
EnemyAI_Skeleton1_A:
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
		bcs.s	EnemyAI_Skeleton1
		rts

; Aggro / attack-over / hitstun recovery: start chasing the player
; (behaviour 6, AIState $10).
EnemyAI_Skeleton1:
		move.w	#BHVS_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		rts

; State $10: chasing. If the player is already in hitstun just keep
; chasing; otherwise try each move in turn.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryRush
		bcs.s	_chaseTick
		bsr.s	_tryPounce
		bcs.s	_chaseTick
		bsr.w	_tryLunge
		bcs.s	_chaseTick
		bsr.w	_trySwing

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		move.w	#BHVS_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; Player in the $60-$90 band ahead, $10 lateral: 37-in-1000 chance to
; rush (state $20, BHVS_RUSH_24).
_tryRush:
		move.w	#$0090,d5
		move.w	#$FFA0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_rushMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00036,d7
		bhi.s	_rushMiss
		move.b	#$20,AIState(a5)
		move.w	#BHVS_RUSH_24,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_rushMiss:
		tst.b	d0
		rts

; Player in the $30-$40 band ahead, $10 lateral: 37-in-1000 chance to
; pounce swinging (state $21, BHVS_POUNCE).
_tryPounce:
		move.w	#$0040,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_pounceMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00036,d7
		bhi.s	_pounceMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_POUNCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_pounceMiss:
		tst.b	d0
		rts

; Player in the $28-$48 band ahead, $8 lateral: 37-in-1000 chance to
; lunge (state $22, BHVS_ADVANCE).
_tryLunge:
		move.w	#$0048,d5
		move.w	#$FFD8,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_lungeMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00036,d7
		bhi.s	_lungeMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_lungeMiss:
		tst.b	d0
		rts

; Player point-blank ahead ($20 ahead, $8 lateral): swing - 60%
; standing (state $23), else with a hop (state $24, BHVS_HOP).
_trySwing:
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_swingMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00060,d7
		bcc.s	_swingHop
		move.b	#$23,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_swingHop:
		move.b	#$24,AIState(a5)
		move.w	#BHVS_HOP,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_swingMiss:
		tst.b	d0
		rts

; States $20+: 0 = rush, 1/3/4 = swing, 2 = lunge.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_tick
		cmpi.b	#$01,d0
		beq.s	_swing
		cmpi.b	#$02,d0
		beq.s	_lunge
		cmpi.b	#$03,d0
		beq.w	_swing
		bra.w	_swing

_tick:
		bsr.w	j_j_OnTick
		rts

; Swing: ACT_ATTACK1 windup for $F ticks, then the hit box ($19
; ahead, 9 behind, 9 lateral) is live with ACT_ATTACK2 each tick
; until tick $1E, then back to chasing. Runs the behaviour, so the
; pounce and hop variants keep moving.
_swing:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_swingTick
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	_swingTick
		beq.w	EnemyAI_Skeleton1

_swingTick:
		bsr.w	j_j_OnTick
		rts

; Lunge: the deep hit box ($29 ahead, 9 behind, 9 lateral) is live
; every tick with the lunge pose (ACT_ATTACK3) while the advance
; behaviour moves the skeleton, for $F ticks.
_lunge:
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_swingTick
		bra.w	EnemyAI_Skeleton1

; Unreachable leftover: a bone throw. Spawns sprite graphic $78 two
; cells behind the skeleton, facing and flying backwards as a
; player-side projectile (BHVS_PLAYER_PROJECTILE).
		jsr	(j_FindFreeSpriteSlot).l
		bcs.w	_boneDone
		move.w	(a5),d0
		move.b	RotationAndSize(a5),d1
		andi.b	#DIR_MASK,d1
		eori.b	#DIR_FLIP,d1
		beq.s	_boneNE
		cmpi.b	#DIR_SW,d1
		bcs.s	_boneSE
		beq.s	_boneSW
		subi.w	#$0200,d0	; NW: X - 2
		bra.s	_boneSpawn

_boneNE:
		subq.b	#$02,d0		; NE: Y - 2
		bra.s	_boneSpawn

_boneSE:
		addi.w	#$0200,d0	; SE: X + 2
		bra.s	_boneSpawn

_boneSW:
		addq.b	#$02,d0		; SW: Y + 2

_boneSpawn:
		move.w	d0,(a1)
		move.b	d1,RotationAndSize(a1)
		move.b	#$78,d2
		move.w	Z(a5),d3
		addi.w	#$0010,d3
		move.w	d3,Z(a1)
		move.w	SubX(a5),SubX(a1)
		move.w	#$47C0,TileSource(a1)
		move.w	#BHVS_PLAYER_PROJECTILE,BehaviourLUTIndex(a1)
		move.b	#$04,Speed(a1)
		jsr	(j_InitSpawnedSprite).l

_boneDone:
		bra.w	EnemyAI_Skeleton1

		modend
