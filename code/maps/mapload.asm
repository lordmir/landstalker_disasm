MapLoad	module
; Callable no-op (WaitUntilVBlank's pre-wait hook).
Return:
		rts


; Unreferenced debug helper: floods CRAM with green for a moment,
; then restores the active palette.
FlashPaletteGreen:
		movem.l	d0/a0,-(sp)
		move.w	#$C000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_CTRL_REG).l
		move.w	#$000F,d0

_fillGreen:
		move.w	#$00E0,(VDP_DATA_REG).l	  ; Green
		dbf	d0,_fillGreen		  ; Green
		move.w	#$001E,d0

_flashDelay:
		dbf	d0,_flashDelay
		move.w	#$C000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_CTRL_REG).l
		move.w	#$000F,d0
		lea	(g_Pal0Active).l,a0

_restorePal:
		move.w	(a0)+,(VDP_DATA_REG).l
		dbf	d0,_restorePal
		movem.l	(sp)+,d0/a0
		rts


; Drains the map-block streaming queue (runs from the HBlank
; handler): each g_ScreenBuffer entry is four {VRAM address.w,
; cell pair.l} writes - one map block - with $0003 as the fixed
; address high word. g_PendingBlockCopies holds the entry count.
ProcessPendingBlockCopies:
		tst.b	(g_PendingBlockCopies).l
		beq.w	_pbcDone
		movem.l	a0-a2,-(sp)
		move.w	#$8F02,(VDP_CTRL_REG).l
		lea	(g_ScreenBuffer).l,a0
		lea	(VDP_CTRL_REG).l,a1
		lea	(VDP_DATA_REG).l,a2

_pbcLoop:
		move.w	(a0)+,(a1)
		move.w	#$0003,(a1)
		move.l	(a0)+,(a2)
		move.w	(a0)+,(a1)
		move.w	#$0003,(a1)
		move.l	(a0)+,(a2)
		move.w	(a0)+,(a1)
		move.w	#$0003,(a1)
		move.l	(a0)+,(a2)
		move.w	(a0)+,(a1)
		move.w	#$0003,(a1)
		move.l	(a0)+,(a2)
		subq.b	#$01,(g_PendingBlockCopies).l
		bne.w	_pbcLoop
		movem.l	(sp)+,a0-a2
		move.l	#g_ScreenBuffer,(g_ScreenBufferPtr).l

_pbcDone:
		rts


; From the title screen: shows the save-select screen, loads the
; chosen save and enters its room. A blank save (Player_X zero)
; starts a new game: intro flags set, defaults from ClearGameData.
LoadGame:
		bsr.s	InitLoadGameState
		jsr	(j_HideRightArrow).l
		bsr.w	LoadGameSelectScreen
		bsr.w	ClearAndRefreshVDPSpriteTableDMA
		tst.w	(Player_X).l
		bne.s	_lgHaveSave
		bset	#$03,(g_AdditionalFlags+7).l
		move.b	#$03,(g_AdditionalFlags+$1B).l
		bsr.w	ClearGameData
		clr.b	d0
		bra.w	LoadRoom_0

_lgHaveSave:
		clr.b	d0
		bsr.w	LoadRoom_0
		bsr.w	LoadMagicSwordGfx
		rts


; Pre-load reset: HInt off (reg 0 bit 4), window height reset, the
; player entity and hurt/playback/streaming state cleared, and the
; cached tileset/blockset/palette indices invalidated.
InitLoadGameState:
		move.w	#$0000,d0
		move.b	#$EF,d1
		bsr.w	MaskVDPReg
		move.w	#$9200,d0
		bsr.w	SetVDPReg
		lea	(Player_X).l,a0
		move.w	#$007F,d7

_clrPlayerLoop:
		clr.b	(a0)+
		dbf	d7,_clrPlayerLoop
		clr.b	(g_PlayerPendingHit).l
		clr.b	(g_PlayerHurtTimer).l
		clr.b	(g_PlayerAnimation).l
		clr.b	(g_PendingBlockCopies).l
		clr.b	(g_ControllerPlayback).l
		clr.b	(g_ControllerPlaybackTimer).l
		move.l	#g_ScreenBuffer,(g_ScreenBufferPtr).l
		move.b	#$FF,(g_PriBlockset).l
		move.b	#$FF,(g_SecBlockset).l
		move.b	#$FF,(g_CurrentTileset).l
		move.b	#$FF,(g_CurPalIdx).l
		move.b	#$08,(Player_SubX).l
		move.b	#$08,(Player_SubY).l
		move.w	#$0000,(Player_AnimCtrl).l
		rts


; New-game defaults: health $03FF, defence $0100, nothing equipped,
; clock zeroed, all chests closed, and the intro: room
; ROOM_INTRO_START, start position, controls locked ($FE).
ClearGameData:
		move.w	#$03FF,(Player_CurrentHealth).l
		move.w	#$03FF,(Player_MaxHealth).l
		move.w	#$0100,(Player_Defence).l
		clr.w	(g_CurrentEquippedItems).l
		clr.w	(g_FrameCount).l
		clr.w	(g_MinuteCount).l
		clr.w	(g_HourCount).l
		lea	(g_ChestOpenFlags).l,a0
		move.w	#$003F,d7

_clrChestLoop:
		clr.b	(a0)+
		dbf	d7,_clrChestLoop
		move.w	#ROOM_INTRO_START,(g_CurrentRoom).l	  ; Intro sequence start
		move.b	#$3E,(Player_X).l
		move.b	#$18,(Player_Y).l
		move.b	#$90,(Player_FloorHeight).l
		move.w	#$0090,(Player_Z).l
		move.w	#$00FE,(g_ControllerPlayback).l
		rts


; Full room load into g_CurrentRoom. d0 = arrival mode, passed to
; SetPlayerArrivalZ; the outgoing room's max height is stacked for
; mode 2 (falling transitions).
LoadRoom_0:
		clr.w	d1
		move.b	(g_RoomMaxHeight).l,d1
		movem.w	d0-d1,-(sp)
		clr.b	(g_Flags+1).l
		bsr.w	CheckTempHealthRestore
		move.w	(g_CurrentRoom).l,d0
		bsr.w	SetRoomVisited
		bsr.w	LoadRoomParams
		bsr.w	InitPlayerForRoom
		lea	(Player_X).l,a1
		jsr	(j_CalcSpriteHitbox).l
		movem.w	(sp)+,d0/d3
		bsr.s	SetPlayerArrivalZ
		jsr	(j_InitSprites).l
		bsr.w	InitCameraFlattenedCoords
		bsr.w	LoadAllWarps
		bsr.w	LoadFallClimbDests
		bsr.w	UpdatePlayerSprite
		bsr.w	FlushDMACopyQueue
		bsr.w	InitRoomSpriteGfx
		bsr.w	FlushDMACopyQueue
		bsr.w	LoadSprites
		bsr.w	LoadAnimTiles
		bsr.w	LoadRoomMusic
		bsr.w	FlushDMACopyQueue
		bsr.w	UpdatePlayerDefence
		rts


; Sets the player's Z, floor height and fall rate for the room just
; entered. d0 = arrival mode: 0 = snap to the highest floor under
; the player, keeping the current height offset above the old floor;
; 1 = start at the room's ceiling (max height - 8) falling at $10;
; 2 = falling transition - rebase onto the new ground height keeping
; the in-flight offset (d3 = previous room's max height) and the
; current fall rate; other = rest one unit above the detected floor.
SetPlayerArrivalZ:
		clr.w	d1
		move.b	(g_RoomMaxHeight).l,d1
		move.w	#$0010,d2
		subi.b	#$08,d1
		cmpi.b	#$01,d0
		beq.w	_zApply
		movem.w	d0/d3,-(sp)
		lea	(Player_X).l,a0
		move.w	#$FFFF,d7
		bsr.w	GetHighestFloorUnder
		movem.w	(sp)+,d0/d3
		move.w	d4,d1
		tst.b	d0
		beq.s	_zKeepDelta
		cmpi.b	#$02,d0
		bne.s	_zSnapAbove
		move.w	(Player_Z).l,d2
		sub.w	d3,d2
		clr.w	d1
		move.b	(Player_GroundHeight).l,d1
		lsl.b	#$04,d1
		move.b	d1,(Player_FloorHeight).l
		add.b	d2,d1
		move.w	d1,(Player_Z).l
		move.b	(Player_FallRate).l,d2
		addi.b	#$07,d1
		bra.s	_zApply

_zSnapAbove:
		addq.b	#$01,d1
		clr.w	d2
		bra.s	_zApply

_zKeepDelta:
		move.w	(Player_Z).l,d2
		clr.w	d4
		move.b	(Player_FloorHeight).l,d4
		sub.w	d4,d2
		move.b	d1,(Player_FloorHeight).l
		add.w	d2,d1
		move.b	(Player_FallRate).l,d2

_zApply:
		move.w	d1,(Player_Z).l
		add.b	(Player_Height).l,d1
		subq.b	#$01,d1
		move.w	d1,(Player_HitBoxZEnd).l
		move.b	d2,(Player_FallRate).l
		rts


; Marks room d0 visited: RoomVisitedFlagLookup maps the room to a
; bit index into g_RoomVisitedFlags (drives the oracle stone progress check).
SetRoomVisited:
		move.w	d0,d1
		add.w	d1,d1
		lea	(RoomVisitedFlagLookup).l,a0
		move.w	(a0,d1.w),d1
		move.w	d1,d2
		andi.b	#$07,d1
		lsr.w	#$03,d2
		lea	(g_RoomVisitedFlags).l,a0
		bset	d1,(a0,d2.w)
		rts


; If the pending-restore flag (g_Flags+5 bit 7) is set: clears it,
; restores Player_TempHealth as the current health, clears status
; bit 4 and re-enables the menu - used in the Fahl minigame.
CheckTempHealthRestore:
		bclr	#$07,(g_Flags+5).l
		beq.s	_thrDone
		bclr	#$04,(g_PlayerStatus).l
		bclr	#$02,(g_LockPlayerActions).l ; Bit 0: Can't pick up items
						  ; Bit	1: Can't attack
						  ; Bit	2: Can't open menu
		move.w	(Player_TempHealth).l,(Player_CurrentHealth).l
		jsr	(j_RefreshCurrentHealthHUD).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l

_thrDone:
		rts


; Reloads the current room's graphics from scratch (invalidates all
; caches first) - used when returning from full-screen displays that
; clobbered VRAM. Also re-arms HInt on line 24 for dark rooms.
LoadRoom:
		move.w	#$8A18,(g_VDPReg10_HIntLine).l
		move.w	#$8A18,(VDP_CTRL_REG).l	  ; Enable HINT	on line	24
		move.b	#$FF,(g_PriBlockset).l
		move.b	#$FF,(g_SecBlockset).l
		move.b	#$FF,(g_CurrentTileset).l
		move.b	#$FF,(g_CurPalIdx).l
		move.w	(g_CurrentRoom).l,d0
		bsr.w	LoadRoomParams
		bsr.w	FlushDMACopyQueue
		bsr.w	ClearVDPSpriteTable
		bsr.w	LoadHUDSprites
		bsr.w	InitRoomSpriteGfx
		bsr.w	LoadSprites
		bra.w	EnableDMAQueueProcessing


; Starts the room's music (suppressed while the intro flag is set):
; RoomMusicLUT maps the g_RoomBGM index to a track, with two story
; overrides - the sad village theme becomes the happy one once the
; village flag is set, and overworld 1 becomes overworld 2 later on.
LoadRoomMusic:
		btst	#$03,(g_AdditionalFlags+7).l
		bne.s	_musicDone
		move.b	(g_RoomBGM).l,d0
		ext.w	d0
		move.b	RoomMusicLUT(pc,d0.w),d0
		cmpi.b	#SND_MusicEvilVillage,d0
		bne.s	_chkOverworld
		btst	#$05,(g_Flags+2).l
		beq.s	_chkOverworld
		move.b	#SND_MusicHappyVillage,d0

_chkOverworld:
		cmpi.b	#SND_MusicOverworld1,d0
		bne.s	_playMusic
		btst	#$04,(g_AdditionalFlags+8).l
		beq.s	_playMusic
		move.b	#SND_MusicOverworld2,d0

_playMusic:
		move.b	d0,(g_BGM).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_LoadFromD0

_musicDone:
		rts
RoomMusicLUT:	dc.b SND_MusicPalace1
		dc.b SND_MusicCave
		dc.b SND_MusicOverworld1
		dc.b SND_MusicTown
		dc.b SND_MusicDungeon
		dc.b SND_MusicChurch
		dc.b SND_MusicEvilVillage
		dc.b SND_MusicTreeWarp
		dc.b SND_MusicOverworld1
		dc.b SND_MusicPalace2
		dc.b SND_MusicMap
		dc.b SND_MusicCrypt
		dc.b SND_MusicEmptyTown
		dc.b SND_MusicLabrynth
		dc.b SND_MusicKazalt
		dc.b SND_MusicFinalRoom
		dc.b SND_MusicTwinkleVillage
		dc.b SND_MusicFinalBoss
		dc.b SND_FadeOut
		dc.b $FF


; Per-room player reset: cancels any carry in progress, clears the
; poison step counter, refreshes the flattened coordinates, then
; zeroes the player entity's dynamic fields (animation, targets,
; repeat pointers) while keeping position, facing and Z; the sprite
; underneath is reset to none ($FFFF).
InitPlayerForRoom:
		bsr.w	CheckPocketsTransform
		clr.b	(g_CarryPhase).l
		clr.w	(g_CarriedEntity).l
		clr.b	(byte_FF1147).l
		clr.b	(g_PoisonStepCounter).l
		lea	(Player_X).l,a1
		move.w	#ACT_PICKUP_MASK,d1
		move.w	(Player_Action).l,d0
		and.w	d1,d0
		beq.s	_resetEntity
		eori.w	#$FFFF,d1
		and.w	d1,(Player_Action).l	  ; cancel carry in progress

_resetEntity:
		lea	(g_PlayerXFlattened).l,a0
		move.l	(a1)+,(a0)
		andi.b	#$C1,(a1)
		ori.b	#$08,(a1)+
		move.b	#$1F,(a1)+
		andi.w	#$0800,(a1)
		move.w	#$439E,(a1)+
		move.w	#$0000,(a1)+
		addq.w	#$04,a1
		move.w	#$0000,(a1)+
		move.w	#$0000,(a1)+
		addq.w	#$02,a1
		move.w	#$0000,(a1)+
		move.w	#$0000,(a1)+
		move.w	#$0000,(a1)+
		move.w	#$0000,(a1)+
		move.w	#$0000,(a1)+
		move.w	#$0000,(a1)+
		addq.w	#$02,a1
		move.w	#$0000,(a1)+
		addq.w	#$04,a1
		move.w	#$0000,(a1)+
		move.w	#$0000,(a1)+
		addq.w	#$04,a1
		move.w	#$FFFF,(a1)+
		move.w	#$0000,(a1)+
		move.w	#$0000,(a1)+
		move.w	#$0000,(a1)+
		move.b	#$00,(a1)+
		addq.w	#$01,a1
		move.w	#$0000,(a1)+
		rts


; While the transform flag (g_Flags+3 bit 4) is set the player loads
; as Pockets; entering one of the RoomsPocketsXformReversed
; rooms reverts to Nigel, clears the flag and unlocks actions.
CheckPocketsTransform:
		btst	#$04,(g_Flags+3).l
		beq.s	_pocketsDone
		lea	RoomsPocketsXformReversed(pc),a0
		move.w	(g_CurrentRoom).l,d0
		moveq	#$02,d7

_revertScan:
		cmp.w	(a0)+,d0
		beq.s	_revertForm
		dbf	d7,_revertScan
		move.w	#$0141,(Player_AnimCtrl).l
		move.b	#SPR_POCKETS,(Player_SpriteType).l
		rts

_revertForm:
		move.w	#$0000,(Player_AnimCtrl).l
		move.b	#$00,(Player_AnimFlags).l
		bclr	#$04,(g_Flags+3).l
		andi.b	#$F8,(g_LockPlayerActions).l ; Bit 0: Can't pick up items
						  ; Bit	1: Can't attack
						  ; Bit	2: Can't open menu
		bsr.w	LoadPlayerPalette

_pocketsDone:
		rts

RoomsPocketsXformReversed:dc.w $0276
		dc.w $027E
		dc.w $01C6

; Loads room d0's assets from its 8-byte record at (RoomDataPtr):
; {map data ptr.l, tileset/blockset index.b, palette.b, max|min
; height nibbles.b, secondary blockset (top 3 bits) | music (low 5
; bits).b}. A music change fades the old track out first; then
; tileset, tilemap, blockset and palette are (re)loaded as needed.
LoadRoomParams:
		mulu.w	#$0008,d0
		movea.l	(RoomDataPtr).l,a0
		movea.l	(a0,d0.w),a2
		move.b	4(a0,d0.w),d3	  ; Tileset + big tiles
		ext.w	d3
		move.b	7(a0,d0.w),d2
		lsr.b	#$05,d2
		ext.w	d2
		moveq	#$00,d4
		move.b	5(a0,d0.w),d4	  ; Palette
		move.b	6(a0,d0.w),d7	  ; Room Height
		move.b	d7,(g_RoomMaxHeight).l
		andi.b	#$F0,(g_RoomMaxHeight).l  ; Max	height
		lsl.b	#$04,d7
		move.b	d7,(g_RoomMinHeight).l
		move.b	7(a0,d0.w),d0	  ; Music
		andi.b	#$1F,d0
		cmp.b	(g_RoomBGM).l,d0
		beq.s	_sameMusic
		trap	#$00			  ; Trap00Handler
		dc.w SND_FadeOut0
		move.b	d0,(g_RoomBGM).l

_sameMusic:
		movem.l	a2,-(sp)
		bsr.w	GetTileset
		movem.l	(sp)+,a2
		movem.w	d4/d7,-(sp)
		bsr.s	GetTilemap
		movem.w	(sp)+,d4/d7
		bsr.w	GetBlockset
		bsr.w	SetRoomPal
		bsr.w	CheckRoomGfxFlags
		rts


; Decompresses the room map (a2) into g_ForegroundBlocks and unpacks
; its layers. The decompressed data starts with a header {offset
; X.b, offset Y.b, width-1.b, height-1.b}, then the foreground and
; background block layers and the heightmap. The heightmap buffer is
; pre-filled with $4000 cells; background and heightmap are unpacked
; backwards into the fixed-width buffers via ExtractMap.
GetTilemap:
		lea	(g_HeightMap).l,a1
		move.w	#$0AB1,d7

_initHeightmap:
		move.l	#$40004000,(a1)+
		dbf	d7,_initHeightmap
		movea.l	a2,a0
		lea	(g_ForegroundBlocks).l,a1
		jsr	(DecompressMap1).l
		movem.w	d0-d4,-(sp)
		lea	(g_ForegroundBlocks).l,a0
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		move.b	(a0)+,d2
		move.b	(a0)+,d3
		ext.w	d0
		ext.w	d1
		ext.w	d2
		ext.w	d3
		movem.w	d1,-(sp)
		movem.w	d0,-(sp)
		movem.w	d2-d3,-(sp)
		addq.w	#$01,d2
		addq.w	#$01,d3
		mulu.w	d2,d3
		add.w	d3,d3
		add.w	d3,d3
		adda.w	d3,a0
		movem.w	(sp)+,d2-d3
		add.w	d2,d0
		add.w	d3,d1
		movem.w	(sp)+,d7
		movem.w	(sp)+,d5
		lea	(g_HeightMap).l,a1
		movem.w	d0-d3/d5/d7,-(sp)
		bsr.s	ExtractMap
		movem.w	(sp)+,d0-d3/d5/d7
		lea	(g_BackgroundBlocks).l,a1
		bsr.s	ExtractMap
		movem.w	(sp)+,d0-d4
		rts


; Unpacks one map layer (working backwards from the end of buffer
; a1) into the fixed 74-cell-wide map buffer, zero-padding the
; margins around the room's placement: d0/d1 = right/bottom margin
; origin, d2 = row width - 1, d3 = rows - 1, d5/d7 = remaining
; top/side padding.
ExtractMap:
		move.w	#$0048,d4
		sub.w	d1,d4
		bmi.s	_copyRows

_padEndRows:
		move.w	#$0049,d6

_padEndRow:
		clr.w	-(a1)
		dbf	d6,_padEndRow
		dbf	d4,_padEndRows

_copyRows:
		move.w	#$0048,d6
		sub.w	d0,d6
		subq.w	#$01,d7

_rowLoop:
		movem.w	d2/d6-d7,-(sp)
		tst.w	d6
		bmi.s	_copyCells

_padRowEnd:
		clr.w	-(a1)
		dbf	d6,_padRowEnd

_copyCells:
		move.w	-(a0),-(a1)
		dbf	d2,_copyCells
		tst.w	d7
		bmi.s	_nextRow

_padRowStart:
		clr.w	-(a1)
		dbf	d7,_padRowStart

_nextRow:
		movem.w	(sp)+,d2/d6-d7
		dbf	d3,_rowLoop
		subq.w	#$01,d5
		bmi.s	_extractDone

_padStartRows:
		move.w	#$0049,d7

_padStartRow:
		clr.w	-(a1)
		dbf	d7,_padStartRow
		dbf	d5,_padStartRows

_extractDone:
		rts


; Decompresses the room's primary blockset into g_Blockset and the
; secondary one after it (at g_SecBlocksetPtr), skipping whichever
; is already cached. d3 = blockset list index, d2 = secondary index.
GetBlockset:
		movea.l	(BigTilesListPtr).l,a2
		movea.l	(a2,d3.w),a2
		movea.l	(g_SecBlocksetPtr).l,a1
		cmp.b	(g_PriBlockset).l,d3
		beq.s	_chkSecondary
		move.b	d3,(g_PriBlockset).l
		movea.l	(a2),a0
		lea	(g_Blockset).l,a1
		jsr	(DecompBigTiles).l
		lsl.w	#$03,d0
		adda.w	d0,a1
		move.l	a1,(g_SecBlocksetPtr).l
		bra.s	_loadSecondary

_chkSecondary:
		cmp.b	(g_SecBlockset).l,d2
		beq.s	_blocksetDone

_loadSecondary:
		move.b	d2,(g_SecBlockset).l
		lsl.w	#$02,d2
		movea.l	4(a2,d2.w),a0
		jsr	(DecompBigTiles).l

_blocksetDone:
		rts


; If the tileset (d3 low 5 bits) differs from the cached one:
; LZ77-decompress it using g_ForegroundBlocks as scratch and DMA
; $3A80 words to VRAM 0. Returns d3 = index * 4, d7 = 1 if reloaded.
GetTileset:
		movem.w	d3,-(sp)
		clr.b	d7
		andi.b	#$1F,d3			  ; Tileset = d3
		cmp.b	(g_CurrentTileset).l,d3
		beq.w	_tilesetDone
		move.b	d3,(g_CurrentTileset).l
		movea.l	(TilesetPointers).l,a0
		lsl.w	#$02,d3
		movea.l	(a0,d3.w),a0
		movem.w	d2-d4,-(sp)
		lea	(g_ForegroundBlocks).l,a1
		lea	(0).w,a2
		movem.l	a2,-(sp)
		movea.l	a1,a2
		bsr.w	DecompressLZ77Gfx
		move.l	a1,d0
		sub.l	a2,d0
		lsr.w	#$02,d0
		movea.l	a2,a0
		movem.l	(sp)+,a1
		lea	(g_ForegroundBlocks).l,a0
		lea	(0).w,a1
		move.w	#$3A80,d0
		bsr.w	FlushDMACopyQueue
		bsr.w	DoDMACopy		  ; d0 = DMA Length
						  ; a0 = DMA Source
						  ; a1 = DMA Destination
		movem.w	(sp)+,d2-d4
		moveq	#$01,d7

_tilesetDone:
		movem.w	(sp)+,d3
		lsl.w	#$02,d3
		rts


; Loads room palette d4 (RoomPalPtr + d4*26: 13 colours into palette
; 0 slots 2-14), or the fixed lit-Labrynth palette when the room is
; lit by a torch. Slot 1 is always $0CCC, slots 0 and 15 black.
SetRoomPal:
		bsr.w	CheckIfRoomIsLit
		lea	LabrynthLitPal(pc),a0
		bcc.s	_chkPalIdx
		move.b	d4,(g_CurPalIdx).l
		bra.s	_copyPal

_chkPalIdx:
		cmp.b	(g_CurPalIdx).l,d4
		beq.s	_palDone
		move.b	d4,(g_CurPalIdx).l
		movea.l	(RoomPalPtr).l,a0
		mulu.w	#26,d4
		adda.l	d4,a0

_copyPal:
		lea	((g_Pal0Base+4)).l,a1
		move.w	#$000C,d0
		bsr.w	WordCopy
		clr.w	(g_Pal0Base).l
		move.w	#$0CCC,(g_Pal0Base+2).l
		clr.w	(g_Pal0Base+$1E).l

_palDone:
		rts

		modend
