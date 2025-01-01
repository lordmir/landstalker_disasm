; ---------------------------------------------------------------------------

EnemyAI_GhostGen_B:				  ; CODE XREF: ROM:001A860Aj
						  ; ROM:001A8612j ...
		bra.s	EnemyAI_GhostGen
; ---------------------------------------------------------------------------

EnemyAI_GhostGen_A:				  ; CODE XREF: ROM:001A8606j
						  ; ROM:001A860Ej ...
		clr.b	Speed(a5)
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

EnemyAI_GhostGen:				  ; CODE XREF: ROM:EnemyAI_GhostGen_Bj
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR RespawnGhost

CheckRespawnGhost:				  ; CODE XREF: RespawnGhost+4j
		cmpi.b	#SpriteB_Ghost,InitSpriteGraphic(a5)
		beq.s	loc_1A8718

locret_1A8716:					  ; CODE XREF: RespawnGhost+33Aj
						  ; RespawnGhost+34Ej
		rts
; ---------------------------------------------------------------------------

loc_1A8718:					  ; CODE XREF: RespawnGhost+32Ej
		lea	(Sprite1_X).l,a0

loc_1A871E:					  ; CODE XREF: RespawnGhost+348j
		move.w	(a0),d0
		bmi.s	locret_1A8716
		cmpi.b	#SpriteB_GhostGen,SpriteGraphic(a0)
		beq.s	loc_1A8730
		lea	SPRITE_SIZE(a0),a0
		bra.s	loc_1A871E
; ---------------------------------------------------------------------------

loc_1A8730:					  ; CODE XREF: RespawnGhost+342j
		cmpi.b	#$7F,d0
		beq.s	locret_1A8716
		move.w	InitX(a5),X(a5)
		move.w	InitSubX(a5),SubX(a5)
		move.w	InitRotAndSize(a5),RotationAndSize(a5)
		andi.b	#$1F,TileSource(a5)
		move.b	InitTileSource(a5),d0
		or.b	d0,TileSource(a5)
		move.w	InitUnk0A(a5),Unk0A(a5)
		move.b	InitFlags2(a5),Flags2(a5)
		move.w	InitZ(a5),Z(a5)
		move.w	Unk6A(a5),BehavParam(a5)
		move.l	InitBehaviourLUTPtr(a5),BehaviourLUTPtr(a5)
		move.b	InitGoldOrChestCont(a5),GoldOrChestContents(a5)
		move.w	InitDialogue(a5),Dialogue(a5)
		move.w	MaxHealth(a5),CurrentHealth(a5)
		bclr	#$00,Flags1(a5)
		clr.b	ChestIndex(a5)
		clr.b	Flags4(a5)		  ; Bit	0 = Invincible / Solid
		movea.l	a5,a1
		jsr	(j_LookupSpriteAnimFlags).l
		bsr.w	sub_1A8AE6
		jsr	(sub_3BC).l
		bcc.s	loc_1A87D2
; END OF FUNCTION CHUNK	FOR RespawnGhost
