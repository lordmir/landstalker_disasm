
; =============== S U B	R O U T	I N E =======================================


nullsub_1:					  ; CODE XREF: WaitUntilVBlankp
		rts
; End of function nullsub_1


; =============== S U B	R O U T	I N E =======================================


sub_2630:
		movem.l	d0/a0,-(sp)
		move.w	#$C000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_CTRL_REG).l
		move.w	#$000F,d0

loc_2648:					  ; CODE XREF: sub_2630+20j
		move.w	#$00E0,(VDP_DATA_REG).l	  ; Green
		dbf	d0,loc_2648		  ; Green
		move.w	#$001E,d0

loc_2658:					  ; CODE XREF: sub_2630:loc_2658j
		dbf	d0,loc_2658
		move.w	#$C000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_CTRL_REG).l
		move.w	#$000F,d0
		lea	(g_Pal0Active).l,a0

loc_2676:					  ; CODE XREF: sub_2630+4Cj
		move.w	(a0)+,(VDP_DATA_REG).l
		dbf	d0,loc_2676
		movem.l	(sp)+,d0/a0
		rts
; End of function sub_2630


; =============== S U B	R O U T	I N E =======================================


sub_2686:					  ; CODE XREF: HandleHBlankInterrupt+30p
		tst.b	(byte_FF1128).l
		beq.w	locret_26E6
		movem.l	a0-a2,-(sp)
		move.w	#$8F02,(VDP_CTRL_REG).l
		lea	(g_ScreenBuffer).l,a0
		lea	(VDP_CTRL_REG).l,a1
		lea	(VDP_DATA_REG).l,a2

loc_26AE:					  ; CODE XREF: sub_2686+4Ej
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
		subq.b	#$01,(byte_FF1128).l
		bne.w	loc_26AE
		movem.l	(sp)+,a0-a2
		move.l	#g_ScreenBuffer,(g_ScreenBufferPtr).l

locret_26E6:					  ; CODE XREF: sub_2686+6j
		rts
; End of function sub_2686


; =============== S U B	R O U T	I N E =======================================


LoadGame:					  ; CODE XREF: ROM:loc_16CAp
		bsr.s	sub_2726
		jsr	(sub_22EC0).l
		bsr.w	LoadGameSelectScreen
		bsr.w	ClearAndRefreshVDPSpriteTableDMA
		tst.w	(Player_X).l
		bne.s	loc_271A
		bset	#$03,(g_AdditionalFlags+7).l
		move.b	#$03,(g_AdditionalFlags+$1B).l
		bsr.w	ClearGameData
		clr.b	d0
		bra.w	LoadRoom_0
; ---------------------------------------------------------------------------

loc_271A:					  ; CODE XREF: LoadGame+16j
		clr.b	d0
		bsr.w	LoadRoom_0
		bsr.w	LoadMagicSwordGfx
		rts
; End of function LoadGame


; =============== S U B	R O U T	I N E =======================================


sub_2726:					  ; CODE XREF: LoadGamep
		move.w	#$0000,d0
		move.b	#$EF,d1
		bsr.w	MaskVDPReg
		move.w	#$9200,d0
		bsr.w	SetVDPReg
		lea	(Player_X).l,a0
		move.w	#$007F,d7

loc_2744:					  ; CODE XREF: sub_2726+20j
		clr.b	(a0)+
		dbf	d7,loc_2744
		clr.b	(byte_FF1143).l
		clr.b	(byte_FF1142).l
		clr.b	(byte_FF1145).l
		clr.b	(byte_FF1128).l
		clr.b	(g_ControllerPlayback).l
		clr.b	(g_ControllerPlaybackTimer).l
		move.l	#g_ScreenBuffer,(g_ScreenBufferPtr).l
		move.b	#$FF,(g_PriBlockset).l
		move.b	#$FF,(g_SecBlockset).l
		move.b	#$FF,(g_CurrentTileset).l
		move.b	#$FF,(g_CurPalIdx).l
		move.b	#$08,(Player_SubX).l
		move.b	#$08,(Player_SubY).l
		move.w	#$0000,(Player_Unk0A).l
		rts
; End of function sub_2726


; =============== S U B	R O U T	I N E =======================================


ClearGameData:					  ; CODE XREF: LoadGame+28p
		move.w	#$03FF,(Player_CurrentHealth).l
		move.w	#$03FF,(Player_MaxHealth).l
		move.w	#$0100,(Player_Defence).l
		clr.w	(g_CurrentEquippedItems).l
		clr.w	(g_FrameCount).l
		clr.w	(g_MinuteCount).l
		clr.w	(g_HourCount).l
		lea	(g_ChestOpenFlags).l,a0
		move.w	#$003F,d7

loc_27EC:					  ; CODE XREF: ClearGameData+3Cj
		clr.b	(a0)+
		dbf	d7,loc_27EC
		move.w	#$008B,(g_RmNum1).l	  ; Intro sequence start
		move.b	#$3E,(Player_X).l
		move.b	#$18,(Player_Y).l
		move.b	#$90,(Player_FloorHeight).l
		move.w	#$0090,(Player_Z).l
		move.w	#$00FE,(g_ControllerPlayback).l
		rts
; End of function ClearGameData


; =============== S U B	R O U T	I N E =======================================


LoadRoom_0:					  ; CODE XREF: j_LoadRoom_0j
						  ; LoadGame+2Ej ...
		clr.w	d1
		move.b	(g_RoomMaxHeight).l,d1
		movem.w	d0-d1,-(sp)
		clr.b	(g_Flags+1).l
		bsr.w	sub_295E
		move.w	(g_RmNum1).l,d0
		bsr.w	SetRoomVisited
		bsr.w	LoadRoomParams
		bsr.w	sub_2A46
		lea	(Player_X).l,a1
		jsr	(sub_1038E).l
		movem.w	(sp)+,d0/d3
		bsr.s	sub_2896
		jsr	(sub_10388).l
		bsr.w	sub_2DCE
		bsr.w	LoadAllWarps
		bsr.w	sub_A114
		bsr.w	sub_7274
		bsr.w	FlushDMACopyQueue
		bsr.w	sub_4042
		bsr.w	FlushDMACopyQueue
		bsr.w	LoadSprites
		bsr.w	LoadAnimTiles
		bsr.w	LoadRoomMusic
		bsr.w	FlushDMACopyQueue
		bsr.w	UpdatePlayerDefence
		rts
; End of function LoadRoom_0


; =============== S U B	R O U T	I N E =======================================


sub_2896:					  ; CODE XREF: LoadRoom_0+38p
		clr.w	d1
		move.b	(g_RoomMaxHeight).l,d1
		move.w	#$0010,d2
		subi.b	#$08,d1
		cmpi.b	#$01,d0
		beq.w	loc_2920
		movem.w	d0/d3,-(sp)
		lea	(Player_X).l,a0
		move.w	#$FFFF,d7
		bsr.w	sub_3302
		movem.w	(sp)+,d0/d3
		move.w	d4,d1
		tst.b	d0
		beq.s	loc_2902
		cmpi.b	#$02,d0
		bne.s	loc_28FC
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
		bra.s	loc_2920
; ---------------------------------------------------------------------------

loc_28FC:					  ; CODE XREF: sub_2896+38j
		addq.b	#$01,d1
		clr.w	d2
		bra.s	loc_2920
; ---------------------------------------------------------------------------

loc_2902:					  ; CODE XREF: sub_2896+32j
		move.w	(Player_Z).l,d2
		clr.w	d4
		move.b	(Player_FloorHeight).l,d4
		sub.w	d4,d2
		move.b	d1,(Player_FloorHeight).l
		add.w	d2,d1
		move.b	(Player_FallRate).l,d2

loc_2920:					  ; CODE XREF: sub_2896+14j
						  ; sub_2896+64j ...
		move.w	d1,(Player_Z).l
		add.b	(Player_Height).l,d1
		subq.b	#$01,d1
		move.w	d1,(Player_HitBoxZEnd).l
		move.b	d2,(Player_FallRate).l
		rts
; End of function sub_2896


; =============== S U B	R O U T	I N E =======================================


SetRoomVisited:					  ; CODE XREF: LoadRoom_0+1Cp
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
; End of function SetRoomVisited


; =============== S U B	R O U T	I N E =======================================


sub_295E:					  ; CODE XREF: LoadRoom_0+12p
		bclr	#$07,(g_Flags+5).l
		beq.s	locret_2994
		bclr	#$04,(g_PlayerStatus).l
		bclr	#$02,(g_LockPlayerActions).l ; Bit 0: Can't pick up items
						  ; Bit	1: Can't attack
						  ; Bit	2: Can't open menu
		move.w	(Player_TempHealth).l,(Player_CurrentHealth).l
		jsr	(j_RefreshCurrentHealthHUD).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l

locret_2994:					  ; CODE XREF: sub_295E+8j
		rts
; End of function sub_295E


; =============== S U B	R O U T	I N E =======================================


LoadRoom:					  ; CODE XREF: j_LoadRoomj
						  ; sub_7766+28p
		move.w	#$8A18,(g_VDPReg10_HIntLine).l
		move.w	#$8A18,(VDP_CTRL_REG).l	  ; Enable HINT	on line	24
		move.b	#$FF,(g_PriBlockset).l
		move.b	#$FF,(g_SecBlockset).l
		move.b	#$FF,(g_CurrentTileset).l
		move.b	#$FF,(g_CurPalIdx).l
		move.w	(g_RmNum1).l,d0
		bsr.w	LoadRoomParams
		bsr.w	FlushDMACopyQueue
		bsr.w	ClearVDPSpriteTable
		bsr.w	LoadHUDSprites
		bsr.w	sub_4042
		bsr.w	LoadSprites
		bra.w	EnableDMAQueueProcessing
; End of function LoadRoom

; ---------------------------------------------------------------------------

LoadRoomMusic:					  ; CODE XREF: LoadRoom_0+64p
		btst	#$03,(g_AdditionalFlags+7).l
		bne.s	locret_2A30
		move.b	(g_RoomBGM).l,d0
		ext.w	d0
		move.b	RoomMusicLUT(pc,d0.w),d0
		cmpi.b	#SND_MusicEvilVillage,d0
		bne.s	loc_2A12
		btst	#$05,(g_Flags+2).l
		beq.s	loc_2A12
		move.b	#SND_MusicHappyVillage,d0

loc_2A12:					  ; CODE XREF: ROM:00002A02j
						  ; ROM:00002A0Cj
		cmpi.b	#SND_MusicOverworld1,d0
		bne.s	loc_2A26
		btst	#$04,(g_AdditionalFlags+8).l
		beq.s	loc_2A26
		move.b	#SND_MusicOverworld2,d0

loc_2A26:					  ; CODE XREF: ROM:00002A16j
						  ; ROM:00002A20j
		move.b	d0,(g_BGM).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_LoadFromD0
; ---------------------------------------------------------------------------

locret_2A30:					  ; CODE XREF: ROM:000029F0j
		rts
; ---------------------------------------------------------------------------
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

; =============== S U B	R O U T	I N E =======================================


sub_2A46:					  ; CODE XREF: LoadRoom_0+24p
		bsr.w	sub_2AF2
		clr.b	(byte_FF1133).l
		clr.w	(g_CarriedEntity).l
		clr.b	(byte_FF1147).l
		clr.b	(byte_FF1148).l
		lea	(Player_X).l,a1
		move.w	#$00C0,d1
		move.w	(Player_Action).l,d0	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		and.w	d1,d0
		beq.s	loc_2A80
		eori.w	#$FFFF,d1
		and.w	d1,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage

loc_2A80:					  ; CODE XREF: sub_2A46+2Ej
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
; End of function sub_2A46


; =============== S U B	R O U T	I N E =======================================


sub_2AF2:					  ; CODE XREF: sub_2A46p
		btst	#$04,(g_Flags+3).l
		beq.s	locret_2B46
		lea	RoomsPocketsXformReversed(pc),a0
		move.w	(g_RmNum1).l,d0
		moveq	#$00000002,d7

loc_2B08:					  ; CODE XREF: sub_2AF2+1Aj
		cmp.w	(a0)+,d0
		beq.s	loc_2B22
		dbf	d7,loc_2B08
		move.w	#$0141,(Player_Unk0A).l
		move.b	#SPR_POCKETS,(Player_SpriteType).l
		rts
; ---------------------------------------------------------------------------

loc_2B22:					  ; CODE XREF: sub_2AF2+18j
		move.w	#$0000,(Player_Unk0A).l
		move.b	#$00,(Player_Unk6F).l
		bclr	#$04,(g_Flags+3).l
		andi.b	#$F8,(g_LockPlayerActions).l ; Bit 0: Can't pick up items
						  ; Bit	1: Can't attack
						  ; Bit	2: Can't open menu
		bsr.w	LoadPlayerPalette

locret_2B46:					  ; CODE XREF: sub_2AF2+8j
		rts
; End of function sub_2AF2

; ---------------------------------------------------------------------------
RoomsPocketsXformReversed:dc.w $0276		  ; DATA XREF: sub_2AF2+At
		dc.w $027E
		dc.w $01C6
; ---------------------------------------------------------------------------

LoadRoomParams:					  ; CODE XREF: LoadRoom_0+20p
						  ; LoadRoom+36p ...
		mulu.w	#$0008,d0
		movea.l	(RoomDataPtr).l,a0
		movea.l	(a0,d0.w),a2
		move.b	$00000004(a0,d0.w),d3	  ; Tileset + big tiles
		ext.w	d3
		move.b	$00000007(a0,d0.w),d2
		lsr.b	#$05,d2
		ext.w	d2
		moveq	#$00000000,d4
		move.b	$00000005(a0,d0.w),d4	  ; Palette
		move.b	$00000006(a0,d0.w),d7	  ; Room Height
		move.b	d7,(g_RoomMaxHeight).l
		andi.b	#$F0,(g_RoomMaxHeight).l  ; Max	height
		lsl.b	#$04,d7
		move.b	d7,(g_RoomMinHeight).l
		move.b	$00000007(a0,d0.w),d0	  ; Music
		andi.b	#$1F,d0
		cmp.b	(g_RoomBGM).l,d0
		beq.s	loc_2BA4
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut0
; ---------------------------------------------------------------------------
		move.b	d0,(g_RoomBGM).l

loc_2BA4:					  ; CODE XREF: ROM:00002B98j
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

; =============== S U B	R O U T	I N E =======================================


GetTilemap:					  ; CODE XREF: ROM:00002BB4p
		lea	(g_HeightMap).l,a1
		move.w	#$0AB1,d7

loc_2BD2:					  ; CODE XREF: GetTilemap+10j
		move.l	#$40004000,(a1)+
		dbf	d7,loc_2BD2
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
; End of function GetTilemap


; =============== S U B	R O U T	I N E =======================================


ExtractMap:					  ; CODE XREF: GetTilemap+6Ep
						  ; GetTilemap+7Ap
		move.w	#$0048,d4
		sub.w	d1,d4
		bmi.s	loc_2C60

loc_2C52:					  ; CODE XREF: ExtractMap+12j
		move.w	#$0049,d6

loc_2C56:					  ; CODE XREF: ExtractMap+Ej
		clr.w	-(a1)
		dbf	d6,loc_2C56
		dbf	d4,loc_2C52

loc_2C60:					  ; CODE XREF: ExtractMap+6j
		move.w	#$0048,d6
		sub.w	d0,d6
		subq.w	#$01,d7

loc_2C68:					  ; CODE XREF: ExtractMap+40j
		movem.w	d2/d6-d7,-(sp)
		tst.w	d6
		bmi.s	loc_2C76

loc_2C70:					  ; CODE XREF: ExtractMap+28j
		clr.w	-(a1)
		dbf	d6,loc_2C70

loc_2C76:					  ; CODE XREF: ExtractMap+24j
						  ; ExtractMap+2Ej
		move.w	-(a0),-(a1)
		dbf	d2,loc_2C76
		tst.w	d7
		bmi.s	loc_2C86

loc_2C80:					  ; CODE XREF: ExtractMap+38j
		clr.w	-(a1)
		dbf	d7,loc_2C80

loc_2C86:					  ; CODE XREF: ExtractMap+34j
		movem.w	(sp)+,d2/d6-d7
		dbf	d3,loc_2C68
		subq.w	#$01,d5
		bmi.s	locret_2CA0

loc_2C92:					  ; CODE XREF: ExtractMap+52j
		move.w	#$0049,d7

loc_2C96:					  ; CODE XREF: ExtractMap+4Ej
		clr.w	-(a1)
		dbf	d7,loc_2C96
		dbf	d5,loc_2C92

locret_2CA0:					  ; CODE XREF: ExtractMap+46j
		rts
; End of function ExtractMap


; =============== S U B	R O U T	I N E =======================================


GetBlockset:					  ; CODE XREF: ROM:00002BBAp
		movea.l	(BigTilesListPtr).l,a2
		movea.l	(a2,d3.w),a2
		movea.l	(dword_FF1874).l,a1
		cmp.b	(g_PriBlockset).l,d3
		beq.s	loc_2CDA
		move.b	d3,(g_PriBlockset).l
		movea.l	(a2),a0
		lea	(g_Blockset).l,a1
		jsr	(DecompBigTiles).l
		lsl.w	#$03,d0
		adda.w	d0,a1
		move.l	a1,(dword_FF1874).l
		bra.s	loc_2CE2
; ---------------------------------------------------------------------------

loc_2CDA:					  ; CODE XREF: GetBlockset+16j
		cmp.b	(g_SecBlockset).l,d2
		beq.s	locret_2CF4

loc_2CE2:					  ; CODE XREF: GetBlockset+36j
		move.b	d2,(g_SecBlockset).l
		lsl.w	#$02,d2
		movea.l	$00000004(a2,d2.w),a0
		jsr	(DecompBigTiles).l

locret_2CF4:					  ; CODE XREF: GetBlockset+3Ej
		rts
; End of function GetBlockset


; =============== S U B	R O U T	I N E =======================================


GetTileset:					  ; CODE XREF: ROM:00002BA8p
		movem.w	d3,-(sp)
		clr.b	d7
		andi.b	#$1F,d3			  ; Tileset = d3
		cmp.b	(g_CurrentTileset).l,d3
		beq.w	loc_2D5C
		move.b	d3,(g_CurrentTileset).l
		movea.l	(TilesetPointers).l,a0
		lsl.w	#$02,d3
		movea.l	(a0,d3.w),a0
		movem.w	d2-d4,-(sp)
		lea	(g_ForegroundBlocks).l,a1
		lea	(0000000000).w,a2
		movem.l	a2,-(sp)
		movea.l	a1,a2
		bsr.w	DecompressLZ77Gfx
		move.l	a1,d0
		sub.l	a2,d0
		lsr.w	#$02,d0
		movea.l	a2,a0
		movem.l	(sp)+,a1
		lea	(g_ForegroundBlocks).l,a0
		lea	(0000000000).w,a1
		move.w	#$3A80,d0
		bsr.w	FlushDMACopyQueue
		bsr.w	DoDMACopy		  ; d0 = DMA Length
						  ; a0 = DMA Source
						  ; a1 = DMA Destination
		movem.w	(sp)+,d2-d4
		moveq	#$00000001,d7

loc_2D5C:					  ; CODE XREF: GetTileset+10j
		movem.w	(sp)+,d3
		lsl.w	#$02,d3
		rts
; End of function GetTileset


; =============== S U B	R O U T	I N E =======================================


SetRoomPal:					  ; CODE XREF: ROM:00002BBEp
		bsr.w	CheckIfRoomIsLit
		lea	LabrynthLitPal(pc),a0
		bcc.s	loc_2D76
		move.b	d4,(g_CurPalIdx).l
		bra.s	loc_2D90
; ---------------------------------------------------------------------------

loc_2D76:					  ; CODE XREF: SetRoomPal+8j
		cmp.b	(g_CurPalIdx).l,d4
		beq.s	locret_2DB2
		move.b	d4,(g_CurPalIdx).l
		movea.l	(RoomPalPtr).l,a0
		mulu.w	#00026,d4
		adda.l	d4,a0

loc_2D90:					  ; CODE XREF: SetRoomPal+10j
		lea	((g_Pal0Base+4)).l,a1
		move.w	#$000C,d0
		bsr.w	WordCopy
		clr.w	(g_Pal0Base).l
		move.w	#$0CCC,(g_Pal0Base+2).l
		clr.w	(g_Pal0Base+$1E).l

locret_2DB2:					  ; CODE XREF: SetRoomPal+18j
		rts
; End of function SetRoomPal

; ---------------------------------------------------------------------------
