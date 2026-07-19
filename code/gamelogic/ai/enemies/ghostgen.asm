GhostGen	module
; The ghost generator (shared by SPR_GHOSTGEN1/2/3): a stationary
; object whose only job is to exist - while one is alive in the room,
; vanished ghosts respawn (CheckRespawnGhost below). Destroying the
; generator stops the respawning.

; B routine (behaviour command $2B): reset to idle.
EnemyAI_GhostGen_B:
		bra.s	EnemyAI_GhostGen

; A routine, run every tick: pinned in place (Speed cleared every
; tick).
EnemyAI_GhostGen_A:
		clr.b	Speed(a5)
		bsr.w	j_j_OnTick
		rts

EnemyAI_GhostGen:
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bclr	#$01,InteractFlags(a5)
		rts

; Chunk of RunEnemyAI, entered for hidden ($7F7F) enemy slots: if the
; hidden sprite is a ghost and a live ghost generator is present in
; the room, restore the ghost from its Init* fields at its spawn
; point with full health. If the spawn spot validates, continue with
; FinishGhostRespawn (enemyai2) to start the materialise; if it is
; blocked, fall through into enemyai2's MoveSpriteOffscreen (this
; file is included directly before it) to stay hidden and retry.
CheckRespawnGhost:
		cmpi.b	#SpriteB_Ghost,InitSpriteGraphic(a5)
		beq.s	_findGenerator

_noRespawn:
		rts

_findGenerator:
		lea	(Sprite1_X).l,a0

_genScan:
		move.w	(a0),d0
		bmi.s	_noRespawn
		cmpi.b	#SpriteB_GhostGen,SpriteGraphic(a0)
		beq.s	_genFound
		lea	SPRITE_SIZE(a0),a0
		bra.s	_genScan

; Found a generator: no respawn if it is itself hidden (destroyed).
_genFound:
		cmpi.b	#$7F,d0
		beq.s	_noRespawn
		move.w	InitX(a5),X(a5)
		move.w	InitSubX(a5),SubX(a5)
		move.w	InitRotAndSize(a5),RotationAndSize(a5)
		andi.b	#$1F,TileSource(a5)
		move.b	InitTileSource(a5),d0
		or.b	d0,TileSource(a5)
		move.w	InitAnimCtrl(a5),AnimCtrl(a5)
		move.b	InitInteractFlags(a5),InteractFlags(a5)
		move.w	InitZ(a5),Z(a5)
		move.w	InitBehavParam(a5),BehavParam(a5)
		move.l	InitBehaviourLUTPtr(a5),BehaviourLUTPtr(a5)
		move.b	InitGoldOrChestCont(a5),GoldOrChestContents(a5)
		move.w	InitDialogue(a5),Dialogue(a5)
		move.w	MaxHealth(a5),CurrentHealth(a5)
		bclr	#$00,StateFlags(a5)
		clr.b	AIState(a5)
		clr.b	CombatFlags(a5)
		movea.l	a5,a1
		jsr	(j_LookupSpriteAnimFlags).l
		bsr.w	j_j_CalcSpriteHitbox
		jsr	(j_ValidateSpritePosition).l
		bcc.s	FinishGhostRespawn
		; falls through into enemyai2's MoveSpriteOffscreen

		modend
