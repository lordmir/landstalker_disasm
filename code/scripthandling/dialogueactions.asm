; ---------------------------------------------------------------------------

RestoreBGM_0:					  ; CODE XREF: ROM:CSA_00F3p
						  ; ROM:CSA_00FCp ...
		move.b	(g_BGM).l,d0
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_LoadFromD0
; ---------------------------------------------------------------------------
		rts

; =============== S U B	R O U T	I N E =======================================


LoadCutsceneDialogue:				  ; CODE XREF: ROM:00012690j
						  ; ROM:00012696j ...
		jsr	(j_FlushDMACopyQueue).l
		jsr	(j_PlayCutsceneScript).l
		rts
; End of function LoadCutsceneDialogue


; =============== S U B	R O U T	I N E =======================================


CSA_0000:					  ; CODE XREF: CustomScriptActionTablej
		move.b	#$01,(g_PlayerAnimation).l
		rts
; End of function CSA_0000

; ---------------------------------------------------------------------------

CSA_0001:					  ; CODE XREF: ROM:00012100j
		move.w	#$0009,d0		  ; Cutscene 0x009: 0x025440
		bra.s	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0002:					  ; CODE XREF: ROM:00012104j
		move.w	#$000A,d0		  ; Cutscene 0x00A: 0x025442
		bra.s	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0003:					  ; CODE XREF: ROM:00012108j
		move.w	#$000D,d0		  ; Cutscene 0x00D: 0x025448
		bra.s	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0004:					  ; CODE XREF: ROM:0001210Cj
		bsr.w	CSA_015A
		move.w	#$000E,d0		  ; Cutscene 0x00E: 0x02544A
		bsr.s	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_0005:					  ; CODE XREF: ROM:00012110j
		bsr.w	CSA_015A
		move.w	#$000F,d0		  ; Cutscene 0x00F: 0x02544C
		bra.s	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0006:					  ; CODE XREF: ROM:00012114j
		move.w	#$0010,d0		  ; Cutscene 0x010: 0x02544E
		bra.s	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0007:					  ; CODE XREF: ROM:00012118j
		move.w	(g_RmNum1).l,d0
		jsr	(j_CheckForRoomTransition).l
		move.w	d0,(g_RmNum1).l
		jsr	(j_WarpToRoom).l
		move.b	#$31,(g_FridayAnimation2).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_0008:					  ; CODE XREF: ROM:0001211Cj
		move.b	#$01,(g_FridayAnimation1).l
		move.b	#$21,(g_FridayAnimation2).l
		move.w	#$000B,d0		  ; Cutscene 0x00B: 0x025444
		bsr.w	LoadCutsceneDialogue
		move.b	#$11,(g_FridayAnimation2).l
		move.w	#$000C,d0		  ; Cutscene 0x00C: 0x025446
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

CSA_0009:					  ; CODE XREF: ROM:00012120j
		movem.l	a5,-(sp)
		move.b	#$00,d0
		move.b	#$06,d1
		bsr.w	sub_1587C
		jsr	(j_LoadSprites).l
		jsr	(sub_404).l
		jsr	(j_EnableProcessingOfVRAMCopyQueue).l
		jsr	(j_EnableDMAQueueProcessing).l
		move.w	#$0012,d0		  ; Cutscene 0x012: 0x025452
		bsr.w	LoadCutsceneDialogue
		movem.l	(sp)+,a5
		movea.l	a5,a0
		andi.b	#$3F,RotationAndSize(a0)
		bsr.w	loc_10492
		jsr	(j_LoadSprites).l
		move.w	#$0013,d0		  ; Cutscene 0x013: 0x025454
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_000A:					  ; CODE XREF: ROM:00012124j
		move.l	a5,d0
		subi.l	#Player_X,d0
		lsr.w	#$07,d0
		subi.b	#$01,d0
		move.b	d0,d1
		addi.b	#$06,d1
		bsr.w	sub_1587C
		jsr	(j_LoadSprites).l
		jsr	(sub_404).l
		jsr	(j_EnableProcessingOfVRAMCopyQueue).l
		jmp	(j_EnableDMAQueueProcessing).l
; ---------------------------------------------------------------------------

CSA_000B:					  ; CODE XREF: ROM:00012128j
		move.w	#$0014,d0		  ; Cutscene 0x014: 0x025456
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_000C:					  ; CODE XREF: ROM:0001212Cj
		move.w	#$0015,d0		  ; Cutscene 0x015: 0x025458
		bsr.w	LoadCutsceneDialogue
		move.b	#$0C,d0
		move.b	#$0D,d1
		bsr.w	sub_1587C
		jsr	(j_LoadSprites).l
		jsr	(sub_404).l
		jsr	(j_EnableProcessingOfVRAMCopyQueue).l
		jmp	(j_EnableDMAQueueProcessing).l
; ---------------------------------------------------------------------------

CSA_000D:					  ; CODE XREF: ROM:00012130j
		move.w	#$0016,d0		  ; Cutscene 0x016: 0x02545A
		bsr.w	LoadCutsceneDialogue
		move.b	#$09,d0
		bsr.w	PlaybackInput
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_000E:					  ; CODE XREF: ROM:00012134j
		move.w	#$0017,d0		  ; Cutscene 0x017: 0x02545C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_000F:					  ; CODE XREF: ROM:00012138j
		move.w	#$0018,d0		  ; Cutscene 0x018: 0x02545E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0010:					  ; CODE XREF: ROM:0001213Cj
		move.w	#$0006,d0		  ; Cutscene 0x006: 0x02543A
		bsr.w	LoadCutsceneDialogue
		bsr.w	CSA_015A
		move.w	#$0007,d0		  ; Cutscene 0x007: 0x02543C
		bsr.w	LoadCutsceneDialogue
		bsr.w	sub_1584A
		move.w	#00039,d7

loc_1281E:					  ; CODE XREF: ROM:00012852j
		movem.w	d7,-(sp)
		lea	(Sprite1_X).l,a0
		move.b	Sprite1_RotationAndSize-Sprite1_X(a0),d0
		addi.b	#$40,d0
		andi.b	#$C0,d0
		andi.b	#$3F,$00000004(a0)
		or.b	d0,$00000004(a0)
		bsr.w	loc_10492
		jsr	(j_LoadSprites).l
		jsr	(j_WaitUntilVBlank).l
		movem.w	(sp)+,d7
		dbf	d7,loc_1281E
		move.w	#$0008,d0		  ; Cutscene 0x008: 0x02543E
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

CSA_0011:					  ; CODE XREF: ROM:00012140j
		move.b	#$01,(g_FridayAnimation1).l
		move.b	#$11,(g_FridayAnimation2).l
		move.w	#$0000,d0		  ; Cutscene 0x000: 0x02542E
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation2).l
		bset	#$05,(g_Flags).l
		rts
; ---------------------------------------------------------------------------

CSA_0012:					  ; CODE XREF: ROM:00012144j
		move.w	#$0001,d0		  ; Cutscene 0x001: 0x025430
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0013:					  ; CODE XREF: ROM:00012148j
		move.w	#$0002,d0		  ; Cutscene 0x002: 0x025432
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0014:					  ; CODE XREF: ROM:0001214Cj
		move.b	#$09,d0
		bsr.w	PlaybackInput
		move.w	#$0019,d0		  ; Cutscene 0x019: 0x025460
		bsr.w	LoadCutsceneDialogue
		bset	#$01,(Player_Flags4).l
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_0015:					  ; CODE XREF: ROM:00012150j
		move.w	#$001A,d0		  ; Cutscene 0x01A: 0x025462
		bsr.w	LoadCutsceneDialogue
		bclr	#$01,(Player_Flags4).l
		rts
; ---------------------------------------------------------------------------

CSA_0016:					  ; CODE XREF: ROM:00012154j
		bsr.w	CSA_015A
		move.w	#$001B,d0		  ; Cutscene 0x01B: 0x025464
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation2).l
		tst.b	(g_YesNoPromptResult).l
		beq.s	loc_12906
		move.b	#$08,d0
		jsr	(j_DoTileSwap).l
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

loc_12906:					  ; CODE XREF: ROM:000128F0j
		clr.w	(g_ControllerPlayback).l
		rts
; ---------------------------------------------------------------------------

CSA_0017:					  ; CODE XREF: ROM:00012158j
		move.b	#$10,d0
		jsr	(j_DoTileSwap).l
		rts
; ---------------------------------------------------------------------------

CSA_0018:					  ; CODE XREF: ROM:0001215Cj
		bsr.w	CSA_015A
		move.w	#$001C,d0		  ; Cutscene 0x01C: 0x025466
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation2).l
		tst.b	(g_YesNoPromptResult).l
		beq.s	loc_1294A
		move.b	#$08,d0
		jsr	(j_DoTileSwap).l
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

loc_1294A:					  ; CODE XREF: ROM:00012934j
		clr.w	(g_ControllerPlayback).l
		rts
; ---------------------------------------------------------------------------

CSA_0019:					  ; CODE XREF: ROM:00012160j
		move.b	#$08,d0
		jmp	(j_DoTileSwap).l
; ---------------------------------------------------------------------------

CSA_001A:					  ; CODE XREF: ROM:00012164j
		move.b	#$10,d0
		jmp	(j_DoTileSwap).l
; ---------------------------------------------------------------------------

CSA_001B:					  ; CODE XREF: ROM:00012168j
		move.b	#$08,d0
		jmp	(j_DoTileSwap).l
; ---------------------------------------------------------------------------

CSA_001C:					  ; CODE XREF: ROM:0001216Cj
		move.w	#$0003,d0
		bsr.w	LoadCutsceneDialogue
		move.b	#$21,(g_FridayAnimation2).l
		move.w	#$0004,d0		  ; Cutscene 0x004: 0x025436
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_001D:					  ; CODE XREF: ROM:00012170j
		move.w	#$0005,d0		  ; Cutscene 0x005: 0x025438
		bsr.w	LoadCutsceneDialogue
		bsr.w	sub_1584A
		bset	#$07,(g_Flags).l
		jsr	(j_FadeOutToDarkness).l
		move.b	#$11,(Player_X).l
		move.b	#$10,(Player_Y).l
		bclr	#$06,(Player_Flags2).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(sub_3E0).l
		move.b	#$31,(g_FridayAnimation2).l
		clr.w	(g_ControllerPlayback).l
		bset	#$04,(g_Flags).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_001E:					  ; CODE XREF: ROM:00012174j
		bset	#$03,(g_Flags).l
		move.w	(g_RmNum1).l,d0
		jsr	(j_CheckForRoomTransition).l
		move.w	d0,(g_RmNum1).l
		jsr	(j_WarpToRoom).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_001F:					  ; CODE XREF: ROM:00012178j
		bsr.w	CSA_015A
		move.w	#$001D,d0		  ; Cutscene 0x01D: 0x025468
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation1).l
		move.b	#$0D,d0
		bsr.w	PlaybackInput
		ori.b	#$C0,(Player_RotationAndSize).l
		rts
; ---------------------------------------------------------------------------

CSA_0020:					  ; CODE XREF: ROM:0001217Cj
		move.w	#$001E,d0		  ; Cutscene 0x01E: 0x02546A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0021:					  ; CODE XREF: ROM:00012180j
		move.w	#$0020,d0		  ; Cutscene 0x020: 0x02546E
		bsr.w	LoadCutsceneDialogue
		bset	#$00,(g_Flags+1).l
		movea.l	(dword_FF187C).l,a0
		move.b	RotationAndSize(a0),d0
		andi.b	#$C0,d0
		ori.b	#$01,d0
		move.b	d0,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_0022:					  ; CODE XREF: ROM:00012184j
		move.w	#$0021,d0		  ; Cutscene 0x021: 0x025470
		bsr.w	LoadCutsceneDialogue
		bset	#$03,(g_Flags+4).l
		rts
; ---------------------------------------------------------------------------

CSA_0023:					  ; CODE XREF: ROM:00012188j
		move.b	(g_Flags+1).l,d0
		andi.b	#$C0,d0
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d0,RotationAndSize(a5)
		bset	#$07,Unk0A(a5)
		rts
; ---------------------------------------------------------------------------

CSA_0024:					  ; CODE XREF: ROM:0001218Cj
		move.w	#$0022,d0		  ; Cutscene 0x022: 0x025472
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0025:					  ; CODE XREF: ROM:00012190j
		move.w	#$0023,d0		  ; Cutscene 0x023: 0x025474
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0026:					  ; CODE XREF: ROM:00012194j
		move.w	#$0024,d0		  ; Cutscene 0x024: 0x025476
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0027:					  ; CODE XREF: ROM:00012198j
		move.w	#$0025,d0		  ; Cutscene 0x025: 0x025478
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0028:					  ; CODE XREF: ROM:0001219Cj
		move.w	#$0036,d0		  ; Cutscene 0x036: 0x02549A
		bsr.w	LoadCutsceneDialogue
		btst	#$03,(g_Flags+4).l
		beq.s	loc_12AF2
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_DoorLock
; ---------------------------------------------------------------------------
		move.b	#$08,d0
		jsr	(j_DoTileSwap).l
		bset	#$07,(g_Flags+4).l
		rts
; ---------------------------------------------------------------------------

loc_12AF2:					  ; CODE XREF: ROM:00012AD8j
		clr.w	(g_ControllerPlayback).l
		rts
; ---------------------------------------------------------------------------

CSA_0029:					  ; CODE XREF: ROM:000121A0j
		move.b	#$09,d0
		bsr.w	PlaybackInput
		bset	#$00,(g_Flags+5).l
		move.w	#$0032,d0		  ; Cutscene 0x032: 0x025492
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_002A:					  ; CODE XREF: ROM:000121A4j
		move.w	#$0033,d0		  ; Cutscene 0x033: 0x025494
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_002B:					  ; CODE XREF: ROM:000121A8j
		move.w	#$0034,d0		  ; Cutscene 0x034: 0x025496
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_002C:					  ; CODE XREF: ROM:000121ACj
		move.w	(Player_HeightmapOffset).l,d0
		movem.w	d0,-(sp)
		move.w	#$E8DC,(Player_HeightmapOffset).l
		jsr	(j_CheckForDoorNW).l
		movem.w	(sp)+,d0
		move.w	d0,(Player_HeightmapOffset).l
		rts
; ---------------------------------------------------------------------------

CSA_002D:					  ; CODE XREF: ROM:000121B0j
		move.w	(Player_HeightmapOffset).l,d0
		movem.w	d0,-(sp)
		move.w	#$EF58,(Player_HeightmapOffset).l
		jsr	(j_CheckForDoorNW).l
		movem.w	(sp)+,d0
		move.w	d0,(Player_HeightmapOffset).l
		rts
; ---------------------------------------------------------------------------

CSA_002E:					  ; CODE XREF: ROM:000121B4j
		move.w	#$002D,d0		  ; Cutscene 0x02D: 0x025488
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_002F:					  ; CODE XREF: ROM:000121B8j
		move.w	#$002E,d0		  ; Cutscene 0x02E: 0x02548A
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	loc_12BFE
		bset	#$02,(g_Flags+5).l
		bsr.w	CSA_015A
		move.w	#$0030,d0		  ; Cutscene 0x030: 0x02548E
		bsr.w	LoadCutsceneDialogue
		bsr.w	sub_1584A
		move.w	#$0025,d7

loc_12BA0:					  ; CODE XREF: ROM:00012BE4j
		movem.w	d7,-(sp)
		lea	(Player_X).l,a0
		move.b	RotationAndSize(a0),d0
		addi.b	#$40,d0
		andi.b	#$C0,d0
		andi.b	#$3F,$00000004(a0)
		or.b	d0,$00000004(a0)
		ori.b	#$80,$0000000A(a0)
		movem.l	a5,-(sp)
		jsr	(sub_3FE).l
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,a5
		movem.w	(sp)+,d7
		dbf	d7,loc_12BA0
		bsr.w	sub_13140
		move.w	#$0031,d0		  ; Cutscene 0x031: 0x025490
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

loc_12BFE:					  ; CODE XREF: ROM:00012B80j
		move.w	#$002F,d0		  ; Cutscene 0x02F: 0x02548C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0030:					  ; CODE XREF: ROM:000121BCj
		clr.b	(g_AdditionalFlags+$1A).l
		move.w	#$0037,d0		  ; Cutscene 0x037: 0x02549C
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.s	locret_12C4E
		bset	#$07,(g_Flags+5).l
		bset	#$04,(g_PlayerStatus).l
		bset	#$02,(g_LockPlayerActions).l ; Bit 0: Can't pick up items
						  ; Bit	1: Can't attack
						  ; Bit	2: Can't open menu
		move.w	(Player_CurrentHealth).l,(Player_TempHealth).l
		move.w	#$00FF,(Player_CurrentHealth).l
		bsr.w	RefreshCurrentHealthHUD
		bsr.w	MarkHUDForUpdate

locret_12C4E:					  ; CODE XREF: ROM:00012C1Aj
		rts
; ---------------------------------------------------------------------------

CSA_0031:					  ; CODE XREF: ROM:000121C0j
		movem.l	a5,-(sp)
		move.b	#$01,(Sprite1_Speed).l
		lea	(Sprite1_X).l,a1
		bset	#$07,Flags2(a1)
		bset	#$07,InitFlags2(a1)
		bclr	#$04,Flags2(a1)
		clr.w	d0
		move.b	(g_AdditionalFlags+$1A).l,d0
		move.b	FahlEnemyList(pc,d0.w),d0
		move.b	d0,SpriteType(a1)
		bsr.w	LookupSpriteGfxIndex
		move.b	SpriteGraphic(a1),d0
		bsr.w	GetEnemyStats		  ; sprite type
		bsr.s	sub_12CAE
		movem.l	(sp)+,a5
		jsr	(sub_1A440C).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts

; =============== S U B	R O U T	I N E =======================================


sub_12CAE:					  ; CODE XREF: ROM:00012C90p
						  ; ROM:00012D3Ep
		bsr.w	GetSpriteDims
		bsr.w	LookupSpriteAnimFlags
		move.b	RotationAndSize(a1),d1
		bsr.w	SetSpriteRotationAnimFlags
		move.b	SpriteType(a1),d0
		movea.l	a1,a0
		jsr	(loc_1A4418).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyHit1
; ---------------------------------------------------------------------------
		jsr	(j_CopyBasePalleteToActivePalette).l
		lea	(Sprite1_X).l,a1
		bset	#$07,Unk48(a1)
		jmp	(j_LoadSprites).l
; End of function sub_12CAE

; ---------------------------------------------------------------------------
FahlEnemyList:	dc.b SPR_ORC1			  ; DATA XREF: ROM:00012C7Cr
		dc.b SPR_ORC1
		dc.b SPR_ORC2
		dc.b SPR_ORC2
		dc.b SPR_ORC3
		dc.b SPR_ORC3
		dc.b SPR_ORC3
		dc.b SPR_NINJA1
		dc.b SPR_NINJA1
		dc.b SPR_NINJA2
		dc.b SPR_NINJA2
		dc.b SPR_NINJA2
		dc.b SPR_NINJA3
		dc.b SPR_NINJA3
		dc.b SPR_NINJA3
		dc.b SPR_LIZARD1
		dc.b SPR_LIZARD1
		dc.b SPR_LIZARD2
		dc.b SPR_LIZARD2
		dc.b SPR_LIZARD3
		dc.b SPR_LIZARD3
		dc.b SPR_LIZARD3
		dc.b SPR_GIANT1
		dc.b SPR_GIANT1
		dc.b SPR_GIANT2
		dc.b SPR_GIANT2
		dc.b SPR_GIANT2
		dc.b SPR_GIANT3
		dc.b SPR_GIANT3
		dc.b SPR_GIANT3
		dc.b SPR_UNICORN1
		dc.b SPR_UNICORN1
		dc.b SPR_UNICORN2
		dc.b SPR_UNICORN2
		dc.b SPR_UNICORN3
		dc.b SPR_UNICORN3
		dc.b SPR_UNICORN3
		dc.b SPR_KNIGHT1
		dc.b SPR_KNIGHT1
		dc.b SPR_KNIGHT2
		dc.b SPR_KNIGHT2
		dc.b SPR_KNIGHT3
		dc.b SPR_KNIGHT3
		dc.b SPR_SKELETON1
		dc.b SPR_SKELETON1
		dc.b SPR_SKELETON2
		dc.b SPR_SKELETON2
		dc.b SPR_SKELETON3
		dc.b SPR_SKELETON3
		dc.b SPR_SKELETON3
; ---------------------------------------------------------------------------

CSA_0032:					  ; CODE XREF: ROM:000121C4j
		lea	(Sprite1_X).l,a1
		clr.w	BehavParam(a1)
		bclr	#$07,Flags2(a1)
		bclr	#$07,InitFlags2(a1)
		move.b	#$01,d0
		move.b	d0,SpriteType(a1)
		bsr.w	LookupSpriteGfxIndex
		move.b	SpriteGraphic(a1),d0
		bsr.w	sub_12CAE
		tst.w	(Player_CurrentHealth).l
		beq.w	locret_12D8E
		addq.b	#$01,(g_AdditionalFlags+$1A).l
		cmpi.b	#$05,(g_AdditionalFlags+$1A).l
		beq.s	loc_12D90
		cmpi.b	#$0A,(g_AdditionalFlags+$1A).l
		beq.s	loc_12D96
		cmpi.b	#$14,(g_AdditionalFlags+$1A).l
		beq.s	loc_12D9C
		cmpi.b	#$1E,(g_AdditionalFlags+$1A).l
		beq.s	loc_12DA2
		cmpi.b	#$28,(g_AdditionalFlags+$1A).l
		beq.s	loc_12DA8
		cmpi.b	#$32,(g_AdditionalFlags+$1A).l
		beq.s	loc_12DC6

locret_12D8E:					  ; CODE XREF: ROM:00012D48j
		rts
; ---------------------------------------------------------------------------

loc_12D90:					  ; CODE XREF: ROM:00012D5Aj
		move.w	#$0038,d0		  ; Cutscene 0x038: 0x02549E
		bra.s	loc_12DAC
; ---------------------------------------------------------------------------

loc_12D96:					  ; CODE XREF: ROM:00012D64j
		move.w	#$0039,d0		  ; Cutscene 0x039: 0x0254A0
		bra.s	loc_12DAC
; ---------------------------------------------------------------------------

loc_12D9C:					  ; CODE XREF: ROM:00012D6Ej
		move.w	#$003A,d0		  ; Cutscene 0x03A: 0x0254A2
		bra.s	loc_12DAC
; ---------------------------------------------------------------------------

loc_12DA2:					  ; CODE XREF: ROM:00012D78j
		move.w	#$003B,d0		  ; Cutscene 0x03B: 0x0254A4
		bra.s	loc_12DAC
; ---------------------------------------------------------------------------

loc_12DA8:					  ; CODE XREF: ROM:00012D82j
		move.w	#$003C,d0		  ; Cutscene 0x03C: 0x0254A6

loc_12DAC:					  ; CODE XREF: ROM:00012D94j
						  ; ROM:00012D9Aj ...
		cmpi.w	#$00FF,(Player_CurrentHealth).l
		bne.s	loc_12DCE
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	loc_12DCE
		rts
; ---------------------------------------------------------------------------

loc_12DC6:					  ; CODE XREF: ROM:00012D8Cj
		move.w	#$003D,d0		  ; Cutscene 0x03D: 0x0254A8
		bsr.w	LoadCutsceneDialogue

loc_12DCE:					  ; CODE XREF: ROM:00012DB4j
						  ; ROM:00012DC0j
		bclr	#$07,(g_Flags+5).l
		bclr	#$06,(g_Flags+$C).l
		move.w	(Player_TempHealth).l,(Player_CurrentHealth).l
		bsr.w	RefreshCurrentHealthHUD
		bsr.w	MarkHUDForUpdate
		bsr.w	RefreshHUD
		jsr	(j_EnableDMAQueueProcessing).l
		clr.b	(g_PlayerAnimation).l
		clr.b	(byte_FF1142).l
		clr.b	(byte_FF1143).l
		clr.w	(g_ControllerPlayback).l
		bclr	#$00,(Player_Flags2).l
		bclr	#$04,(g_PlayerStatus).l
		bclr	#$02,(g_LockPlayerActions).l ; Bit 0: Can't pick up items
						  ; Bit	1: Can't attack
						  ; Bit	2: Can't open menu
		clr.w	(Sprite1_Unk2A).l
		clr.w	(Sprite2_Unk2A).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_0033:					  ; CODE XREF: ROM:000121C8j
		bset	#$04,Flags2(a5)
		lea	(Player_X).l,a0
		bset	#$07,Unk0A(a0)
		bset	#$07,Unk48(a0)
		jsr	(sub_3FE).l
		jsr	(j_LoadSprites).l
		move.w	(Player_TempHealth).l,(Player_CurrentHealth).l
		bsr.w	RefreshCurrentHealthHUD
		bsr.w	MarkHUDForUpdate
		bsr.w	RefreshHUD
		jsr	(j_EnableDMAQueueProcessing).l
		clr.b	(g_PlayerAnimation).l
		clr.b	(byte_FF1142).l
		clr.b	(byte_FF1143).l
		clr.w	(g_ControllerPlayback).l
		bclr	#$00,(Player_Flags2).l
		bclr	#$04,(g_PlayerStatus).l
		bclr	#$02,(g_LockPlayerActions).l ; Bit 0: Can't pick up items
						  ; Bit	1: Can't attack
						  ; Bit	2: Can't open menu
		move.w	#$003E,d0		  ; Cutscene 0x03E: 0x0254AA
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0034:					  ; CODE XREF: ROM:000121CCj
		move.w	#$003F,d0		  ; Cutscene 0x03F: 0x0254AC
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.s	locret_12EE0
		bset	#$00,(g_Flags+1).l
		bset	#$05,(Sprite2_Flags2).l

locret_12EE0:					  ; CODE XREF: ROM:00012ECEj
		rts
; ---------------------------------------------------------------------------

CSA_0035:					  ; CODE XREF: ROM:000121D0j
		moveq	#0000000050,d0
		btst	#$01,(g_Flags+1).l
		bne.s	loc_12F00
		moveq	#0000000100,d0
		btst	#$02,(g_Flags+1).l
		bne.s	loc_12F00
		move.l	#0000000400,d0

loc_12F00:					  ; CODE XREF: ROM:00012EECj
						  ; ROM:00012EF8j
		add.w	d0,(g_AdditionalFlags+$1C).l
		move.l	d0,(g_PrintNumericDwordValue).l
		bsr.w	AddGold
		move.w	#$0040,d0		  ; Cutscene 0x040: 0x0254AE
		bsr.w	LoadCutsceneDialogue
		bsr.w	MarkHUDForUpdate
		bra.w	RefreshHUD
; ---------------------------------------------------------------------------

CSA_0036:					  ; CODE XREF: ROM:000121D4j
		move.w	#$0041,d0		  ; Cutscene 0x041: 0x0254B0
		bsr.w	LoadCutsceneDialogue
		moveq	#0000000050,d0
		btst	#$01,(g_Flags+1).l
		bne.s	loc_12F50
		moveq	#0000000100,d0
		btst	#$02,(g_Flags+1).l
		bne.s	loc_12F50
		move.l	#0000000400,d0
		btst	#$03,(g_Flags+1).l
		beq.s	locret_12F5A

loc_12F50:					  ; CODE XREF: ROM:00012F32j
						  ; ROM:00012F3Ej
		sub.w	d0,(g_AdditionalFlags+$1C).l
		bsr.w	RemoveGold

locret_12F5A:					  ; CODE XREF: ROM:00012F4Ej
		rts
; ---------------------------------------------------------------------------

CSA_0037:					  ; CODE XREF: ROM:000121D8j
		move.b	(g_Flags+$13).l,d0
		andi.b	#$E0,d0
		cmpi.b	#$60,d0
		bcc.s	loc_12F7E
		addi.b	#$20,d0
		andi.b	#$1F,(g_Flags+$13).l
		or.b	d0,(g_Flags+$13).l

loc_12F7E:					  ; CODE XREF: ROM:00012F6Aj
		move.w	#$0043,d0		  ; Cutscene 0x043: 0x0254B4
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0038:					  ; CODE XREF: ROM:000121DCj
		move.w	#$0042,d0		  ; Cutscene 0x042: 0x0254B2
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.s	locret_12F9E
		bset	#$02,(g_Flags+3).l

locret_12F9E:					  ; CODE XREF: ROM:00012F94j
		rts
; ---------------------------------------------------------------------------

CSA_0039:					  ; CODE XREF: ROM:000121E0j
		move.w	#$0044,d0		  ; Cutscene 0x044: 0x0254B6
		bsr.w	LoadCutsceneDialogue
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_003A:					  ; CODE XREF: ROM:000121E4j
		move.w	#$005B,d0		  ; Cutscene 0x05B: 0x0254E4
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_003B:					  ; CODE XREF: ROM:000121E8j
		move.w	#$0045,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_003C:					  ; CODE XREF: ROM:000121ECj
		move.w	#$0046,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_003D:					  ; CODE XREF: ROM:000121F0j
		move.w	#$0048,d0
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.s	locret_12FE4
		bsr.s	sub_12FE6
		move.w	#$0049,d0
		bsr.w	LoadCutsceneDialogue

locret_12FE4:					  ; CODE XREF: ROM:00012FD8j
		rts

; =============== S U B	R O U T	I N E =======================================


sub_12FE6:					  ; CODE XREF: ROM:00012FDAp
		bset	#$04,(g_Flags+3).l
		move.b	#$07,(g_LockPlayerActions).l ; Bit 0: Can't pick up items
						  ; Bit	1: Can't attack
						  ; Bit	2: Can't open menu
		move.w	#$8141,(Player_Unk0A).l
		move.b	#SPR_POCKETS,(Player_SpriteType).l
		move.b	#$01,(Player_Unk6F).l
		lea	(Player_X).l,a1
		move.b	RotationAndSize(a1),d1
		bsr.w	SetSpriteRotationAnimFlags
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		rts
; End of function sub_12FE6

; ---------------------------------------------------------------------------

CSA_003E:					  ; CODE XREF: ROM:000121F4j
		move.w	#$004A,d0		  ; Cutscene 0x04A: 0x0254C2
		bsr.w	LoadCutsceneDialogue
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_003F:					  ; CODE XREF: ROM:000121F8j
		move.w	#$004B,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0040:					  ; CODE XREF: ROM:000121FCj
		move.w	#$004C,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0041:					  ; CODE XREF: ROM:00012200j
		move.w	#$004D,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0042:					  ; CODE XREF: ROM:00012204j
		move.w	#$0047,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0043:					  ; CODE XREF: ROM:00012208j
		move.w	#$004E,d0
		bsr.w	LoadCutsceneDialogue
		move.b	#$51,(g_FridayAnimation1).l
		move.b	#$21,(g_FridayAnimation2).l

loc_13074:					  ; CODE XREF: ROM:00013082j
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#$21,(g_FridayAnimation1).l
		bne.s	loc_13074
		move.w	#$004F,d0
		bsr.w	LoadCutsceneDialogue
		move.w	#$0003,d7

loc_13090:					  ; CODE XREF: ROM:000130EAj
		movem.w	d7,-(sp)
		bsr.w	sub_1584A
		move.w	#$0025,d7

loc_1309C:					  ; CODE XREF: ROM:000130E0j
		movem.w	d7,-(sp)
		lea	(Player_X).l,a0
		move.b	RotationAndSize(a0),d0
		addi.b	#$40,d0
		andi.b	#$C0,d0
		andi.b	#$3F,RotationAndSize(a0)
		or.b	d0,RotationAndSize(a0)
		ori.b	#$80,Unk0A(a0)
		movem.l	a5,-(sp)
		jsr	(sub_3FE).l
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,a5
		movem.w	(sp)+,d7
		dbf	d7,loc_1309C
		bsr.s	sub_13140
		movem.w	(sp)+,d7
		dbf	d7,loc_13090
		move.w	#$8000,(Player_Unk0A).l
		move.b	#$00,(Player_Unk6F).l
		bclr	#$04,(g_Flags+3).l
		andi.b	#$F8,(g_LockPlayerActions).l ; Bit 0: Can't pick up items
						  ; Bit	1: Can't attack
						  ; Bit	2: Can't open menu
		jsr	(sub_428).l
		jsr	(j_CopyBasePalleteToActivePalette).l
		lea	(Player_X).l,a1
		move.b	RotationAndSize(a1),d1
		bsr.w	SetSpriteRotationAnimFlags
		jsr	(j_LoadSprites).l
		move.w	#$0050,d0
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation2).l
		rts

; =============== S U B	R O U T	I N E =======================================


sub_13140:					  ; CODE XREF: ROM:00012BE8p
						  ; ROM:000130E4p ...
		lea	(Player_X).l,a5
		cmpi.w	#$0100,CurrentHealth(a5)
		bcs.s	locret_1315E
		move.w	#$00FF,d0
		bsr.w	RemoveHealth
		bsr.w	MarkHUDForUpdate
		bsr.w	RefreshHUD

locret_1315E:					  ; CODE XREF: sub_13140+Cj
		rts
; End of function sub_13140

; ---------------------------------------------------------------------------

CSA_0044:					  ; CODE XREF: ROM:0001220Cj
		move.w	#$0051,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0045:					  ; CODE XREF: ROM:00012210j
		move.w	#$0052,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0046:					  ; CODE XREF: ROM:00012214j
		move.w	#$0053,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0047:					  ; CODE XREF: ROM:00012218j
		move.w	#$000C,AnimationIndex(a5)
		move.w	#$0004,AnimationFrame(a5)
		bset	#$07,Unk48(a5)
		movem.l	a5,-(sp)
		jsr	(j_LoadSprites).l
		move.w	#$0054,d0
		bsr.w	LoadCutsceneDialogue
		movem.l	(sp)+,a5
		clr.w	AnimationFrame(a5)
		bset	#$07,Unk48(a5)
		rts
; ---------------------------------------------------------------------------

CSA_0048:					  ; CODE XREF: ROM:0001221Cj
		move.w	#$0004,AnimationFrame(a5)
		bset	#$07,Unk48(a5)
		rts
; ---------------------------------------------------------------------------

CSA_0049:					  ; CODE XREF: ROM:00012220j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordHit
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CSA_004A:					  ; CODE XREF: ROM:00012224j
		move.w	#$0004,AnimationIndex(a5)
		clr.w	AnimationFrame(a5)
		bset	#$07,Unk48(a5)
		jsr	(j_LoadSprites).l
		move.w	#$0055,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_004B:					  ; CODE XREF: ROM:00012228j
		move.w	#$0056,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_004C:					  ; CODE XREF: ROM:0001222Cj
		move.w	#$0057,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_004D:					  ; CODE XREF: ROM:00012230j
		move.w	#$0058,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_004E:					  ; CODE XREF: ROM:00012234j
		move.w	#$0059,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_004F:					  ; CODE XREF: ROM:00012238j
		bset	#$01,(g_Flags+$12).l
		move.w	(g_RmNum1).l,d0
		jsr	(j_CheckForRoomTransition).l
		move.w	d0,(g_RmNum1).l
		jsr	(j_WarpToRoom).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_0050:					  ; CODE XREF: ROM:0001223Cj
		bset	#$00,(g_Flags+1).l
		move.w	#$005A,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0051:					  ; CODE XREF: ROM:00012240j
		bset	#$00,(g_Flags+1).l
		move.b	(Sprite3_RotationAndSize).l,d0
		andi.b	#$C0,d0
		or.b	d0,(g_Flags+1).l
		move.w	#$005C,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0052:					  ; CODE XREF: ROM:00012244j
		move.b	(g_Flags+1).l,d1
		andi.b	#$C0,d1
		movem.w	d1,-(sp)
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d1,RotationAndSize(a5)
		bset	#$07,Unk48(a5)
		movea.l	a5,a1
		bsr.w	SetSpriteRotationAnimFlags
		movem.w	(sp)+,d1
		lea	(Player_X).l,a0
		bset	#$07,Unk0A(a0)
		andi.b	#$3F,RotationAndSize(a0)
		eori.b	#$80,d1
		or.b	d1,RotationAndSize(a0)
		jsr	(sub_3FE).l
		jsr	(j_LoadSprites).l
		move.w	#$005D,d0		  ; Cutscene 0x05D: 0x0254E8
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0053:					  ; CODE XREF: ROM:00012248j
		move.w	#$005E,d0		  ; Cutscene 0x05E: 0x0254EA
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	loc_13370
		bsr.w	CSA_015A
		move.w	#$005F,d0		  ; Cutscene 0x05F: 0x0254EC
		bsr.w	LoadCutsceneDialogue
		bsr.w	sub_1584A

loc_132D8:					  ; CODE XREF: ROM:CSA_0056j
		move.w	#$0F14,(Player_X).l
		jsr	(j_FadeOutToDarkness).l
		clr.b	(g_FridayAnimation1).l
		clr.w	(gVDPSprFriday_Y).l
		move.w	#$0061,d0
		bsr.w	SetRoomNumber
		jsr	(sub_434).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(j_InitVDP).l
		clr.b	(byte_FF1142).l
		clr.b	(byte_FF1143).l
		bclr	#$06,(Player_Flags2).l
		bclr	#$00,(Player_Flags2).l
		bclr	#$05,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		bclr	#$05,(Player_AnimAction).l
		move.w	#$0044,(Player_AnimationIndex).l
		move.w	#$0008,(Player_AnimationFrame).l
		bset	#$07,(Player_Unk48).l
		jsr	(j_LoadSprites).l
		jsr	(j_FadeInFromDarkness).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

loc_13370:					  ; CODE XREF: ROM:000132C4j
		bset	#$01,(Player_Flags4).l
		move.b	#$1B,d0
		bra.w	PlaybackInput
; ---------------------------------------------------------------------------

CSA_0054:					  ; CODE XREF: ROM:0001224Cj
		move.w	#$0060,d0		  ; Cutscene 0x060: 0x0254EE
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0055:					  ; CODE XREF: ROM:00012250j
		bsr.w	CSA_015A

loc_1338C:					  ; CODE XREF: ROM:0001339Aj
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#$21,(g_FridayAnimation1).l
		bne.s	loc_1338C
		move.w	#$0061,d0		  ; Cutscene 0x061: 0x0254F0
		btst	#$07,(g_Flags+$12).l
		beq.s	loc_133AE
		move.w	#$0062,d0		  ; Cutscene 0x062: 0x0254F2

loc_133AE:					  ; CODE XREF: ROM:000133A8j
		bsr.w	LoadCutsceneDialogue
		bsr.w	sub_1584A
		move.b	#$31,(g_FridayAnimation1).l
		lea	(Player_X).l,a0
		jsr	(sub_3FE).l
		bset	#$07,(Player_Unk48).l
		rts
; ---------------------------------------------------------------------------

CSA_0056:					  ; CODE XREF: ROM:00012254j
		bra.w	loc_132D8
; ---------------------------------------------------------------------------

CSA_0057:					  ; CODE XREF: ROM:00012258j
		tst.b	(byte_FF1142).l
		bne.s	loc_1341E
		move.b	#$11,(byte_FF1142).l
		bset	#$05,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		bclr	#$05,(Player_AnimAction).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_NigelHit2
; ---------------------------------------------------------------------------
		clr.b	(byte_FF1143).l
		move.w	#$0100,d6
		jsr	(j_GenerateRandomNumber).l
		andi.b	#$C0,d7
		andi.b	#$3F,(Player_RotationAndSize).l
		or.b	d7,(Player_RotationAndSize).l

loc_1341E:					  ; CODE XREF: ROM:000133DEj
		bset	#$05,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		rts
; ---------------------------------------------------------------------------

CSA_0058:					  ; CODE XREF: ROM:0001225Cj
		jmp	(sub_22EE8).l
; ---------------------------------------------------------------------------

CSA_0059:					  ; CODE XREF: ROM:00012260j
		jsr	(j_SetUpTextDisplay).l
		bclr	#$01,(Player_Flags4).l
		rts
; ---------------------------------------------------------------------------

CSA_005A:					  ; CODE XREF: ROM:00012264j
		move.w	#$0063,d0		  ; Cutscene 0x063: 0x0254F4
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_005B:					  ; CODE XREF: ROM:00012268j
		move.w	#$0064,d0		  ; Cutscene 0x064: 0x0254F6
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_005C:					  ; CODE XREF: ROM:0001226Cj
		move.w	#$0065,d0		  ; Cutscene 0x065: 0x0254F8
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_005D:					  ; CODE XREF: ROM:00012270j
		move.w	#$0066,d0		  ; Cutscene 0x066: 0x0254FA
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_005E:					  ; CODE XREF: ROM:00012274j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut0
; ---------------------------------------------------------------------------
		move.w	#00180,d0
		jsr	(j_Sleep).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicPiano
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CSA_005F:					  ; CODE XREF: ROM:00012278j
		move.w	#00180,d0
		jsr	(j_Sleep).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicPalace1
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CSA_0060:					  ; CODE XREF: ROM:0001227Cj
		move.w	#$0067,d0		  ; Cutscene 0x067: 0x0254FC
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0061:					  ; CODE XREF: ROM:00012280j
		move.w	#$0068,d0		  ; Cutscene 0x068: 0x0254FE
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0062:					  ; CODE XREF: ROM:00012284j
		bsr.w	CSA_015A
		move.w	#$0069,d0		  ; Cutscene 0x069: 0x025500
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	loc_134BA
		move.b	#$1F,d0
		bsr.w	PlaybackInput
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

loc_134BA:					  ; CODE XREF: ROM:000134A4j
		move.b	#$31,(g_FridayAnimation2).l
		clr.w	(g_ControllerPlayback).l
		rts
; ---------------------------------------------------------------------------

CSA_0063:					  ; CODE XREF: ROM:00012288j
		move.b	#$01,(g_PlayerAnimation).l

loc_134D2:					  ; CODE XREF: ROM:000134EAj
		bsr.w	sub_135F6
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		cmpi.b	#$1A,(g_PlayerAnimation).l
		bne.s	loc_134D2
		clr.b	(g_PlayerAnimation).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut0
; ---------------------------------------------------------------------------
		move.w	#00180,d0
		jsr	(j_Sleep).l
		jsr	(j_InitFadeToBlackParams).l
		move.w	#$0001,d6
		bsr.w	sub_135D0
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicFridayCutscene
; ---------------------------------------------------------------------------
		move.w	#00120,d0
		jsr	(j_Sleep).l
		move.w	#$006A,d0		  ; Cutscene 0x06A: 0x025502
		bsr.w	LoadCutsceneDialogue
		move.b	#$53,(g_FridayAnimation1).l
		move.b	#$21,(g_FridayAnimation2).l
		bsr.w	loc_15852
		move.w	#$006B,d0		  ; Cutscene 0x06B: 0x025504
		bsr.w	LoadCutsceneDialogue
		move.b	#$55,(g_FridayAnimation1).l
		move.b	#$22,(g_FridayAnimation2).l
		bsr.w	loc_15852
		move.w	#$006C,d0		  ; Cutscene 0x06C: 0x025506
		bsr.w	LoadCutsceneDialogue
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut0
; ---------------------------------------------------------------------------
		move.w	#$0004,d6
		bsr.w	sub_135D0
		clr.b	(g_FridayAnimation1).l
		clr.w	(gVDPSprFriday_Y).l
		move.w	#$FFFF,d0
		lea	(Player_X).l,a5
		jsr	(j_AddHealth).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		move.w	#00120,d0
		jsr	(j_Sleep).l
		bset	#$00,(g_Flags+$14).l
		move.w	#$140E,(Player_X).l
		move.w	#$0808,(Player_SubX).l
		jsr	(sub_42E).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		clr.w	(g_ControllerPlayback).l
		rts

; =============== S U B	R O U T	I N E =======================================


sub_135D0:					  ; CODE XREF: ROM:0001350Ap
						  ; ROM:00013564p ...
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		move.w	#$0039,d5
		jsr	(j_DarkenPalette).l
		move.w	#00020,d0
		jsr	(j_Sleep).l
		dbf	d6,sub_135D0
		rts
; End of function sub_135D0


; =============== S U B	R O U T	I N E =======================================


sub_135F6:					  ; CODE XREF: ROM:loc_134D2p
		move.w	#$0048,(Player_AnimationIndex).l
		addq.b	#$01,(g_PlayerAnimation).l
		cmpi.b	#$02,(g_PlayerAnimation).l
		bne.s	loc_13620
		move.w	#$0004,(Player_AnimationFrame).l
		ori.b	#$80,(Player_Unk0A).l
		rts
; ---------------------------------------------------------------------------

loc_13620:					  ; CODE XREF: sub_135F6+16j
		cmpi.b	#$0F,(g_PlayerAnimation).l
		bne.s	loc_1363C
		move.w	#$0008,(Player_AnimationFrame).l
		ori.b	#$80,(Player_Unk0A).l
		rts
; ---------------------------------------------------------------------------

loc_1363C:					  ; CODE XREF: sub_135F6+32j
		cmpi.b	#$14,(g_PlayerAnimation).l
		bne.s	loc_13658
		move.w	#$000C,(Player_AnimationFrame).l
		ori.b	#$80,(Player_Unk0A).l
		rts
; ---------------------------------------------------------------------------

loc_13658:					  ; CODE XREF: sub_135F6+4Ej
		cmpi.b	#$19,(g_PlayerAnimation).l
		bne.s	locret_13672
		move.w	#$0010,(Player_AnimationFrame).l
		ori.b	#$80,(Player_Unk0A).l

locret_13672:					  ; CODE XREF: sub_135F6+6Aj
		rts
; End of function sub_135F6

; ---------------------------------------------------------------------------

CSA_0064:					  ; CODE XREF: ROM:0001228Cj
		move.w	#$006D,d0		  ; Cutscene 0x06D: 0x025508
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0065:					  ; CODE XREF: ROM:00012290j
		move.w	#$006E,d0		  ; Cutscene 0x06E: 0x02550A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0066:					  ; CODE XREF: ROM:00012294j
		move.w	#$000B,d7

loc_13688:					  ; CODE XREF: ROM:00013696j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyNoise
; ---------------------------------------------------------------------------
		move.w	#00005,d0
		jsr	(j_Sleep).l
		dbf	d7,loc_13688
		move.b	#$08,d0
		jsr	(j_DoTileSwap).l
		moveq	#$FFFFFFFF,d0
		move.w	(Player_HeightmapOffset).l,d0
		movea.l	d0,a0
		move.w	(a0),(Player_GroundHeight).l
		rts
; ---------------------------------------------------------------------------

CSA_0067:					  ; CODE XREF: ROM:00012298j
		move.w	#$001F,d0		  ; Cutscene 0x01F: 0x02546C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0068:					  ; CODE XREF: ROM:0001229Cj
		bsr.w	CSA_015A
		move.w	#$0026,d0		  ; Cutscene 0x026: 0x02547A
		bsr.w	LoadCutsceneDialogue
		clr.b	(g_FridayAnimation1).l
		jsr	(j_DisplayLithograph).l
		move.w	#$0027,d0		  ; Cutscene 0x027: 0x02547C
		bsr.w	LoadCutsceneDialogue
		bset	#$01,(g_Flags+4).l
		move.w	(g_RmNum1).l,d0
		jsr	(j_CheckForRoomTransition).l
		move.w	d0,(g_RmNum1).l
		jsr	(j_TransitionToNewRoom).l
		move.b	#$21,(g_FridayAnimation1).l
		move.b	#$21,(g_FridayAnimation2).l
		jsr	(j_WaitUntilVBlank).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_0069:					  ; CODE XREF: ROM:000122A0j
		move.w	#$0071,d0		  ; Cutscene 0x071: 0x025510
		bsr.w	LoadCutsceneDialogue
		move.w	#$0002,d7

loc_13732:					  ; CODE XREF: ROM:0001374Ej
		movem.w	d7,-(sp)
		move.w	#$0000,AnimationFrame(a5)
		bsr.s	sub_1375A
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordHit
; ---------------------------------------------------------------------------
		move.w	#$0004,AnimationFrame(a5)
		bsr.s	sub_1375A
		movem.w	(sp)+,d7
		dbf	d7,loc_13732
		move.w	#$0072,d0		  ; Cutscene 0x072: 0x025512
		bra.w	LoadCutsceneDialogue

; =============== S U B	R O U T	I N E =======================================


sub_1375A:					  ; CODE XREF: ROM:0001373Cp
						  ; ROM:00013748p
		movem.l	a5,-(sp)
		move.w	#$0008,AnimationIndex(a5)
		bset	#$07,Unk48(a5)
		jsr	(j_LoadSprites).l
		jsr	(j_EnableDMAQueueProcessing).l
		movem.l	(sp)+,a5
		move.w	#00010,d0
		jmp	(j_Sleep).l
; End of function sub_1375A

; ---------------------------------------------------------------------------

CSA_006A:					  ; CODE XREF: ROM:000122A4j
		bset	#$04,(g_Flags+$14).l
		move.w	#$0073,d0		  ; Cutscene 0x073: 0x025514
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	loc_137CA
		move.w	(Player_HeightmapOffset).l,d0
		movem.w	d0,-(sp)
		move.w	#$F258,(Player_HeightmapOffset).l
		jsr	(j_CheckForDoorNW).l
		movem.w	(sp)+,d0
		move.w	d0,(Player_HeightmapOffset).l
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

loc_137CA:					  ; CODE XREF: ROM:0001379Aj
		lea	(Sprite1_X).l,a5
		addi.l	#$00000018,BehaviourLUTPtr(a5)
		movea.l	BehaviourLUTPtr(a5),a0
		move.b	(a0),BehavCmd(a5)
		move.b	$00000001(a0),BehavParam(a5)
		rts
; ---------------------------------------------------------------------------

CSA_006B:					  ; CODE XREF: ROM:000122A8j
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		eori.b	#$80,d1
		bset	#$07,Unk48(a5)
		movea.l	a5,a1
		bsr.w	SetSpriteRotationAnimFlags
		jsr	(j_LoadSprites).l
		move.w	#$0074,d0		  ; Cutscene 0x074: 0x025516
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_006C:					  ; CODE XREF: ROM:000122ACj
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Throw1
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CSA_006D:					  ; CODE XREF: ROM:000122B0j
		bset	#$00,(g_Flags+1).l
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		eori.b	#$40,d0
		andi.b	#$3F,(g_Flags+1).l
		or.b	d0,(g_Flags+1).l
		move.w	#$0075,d0		  ; Cutscene 0x075: 0x025518
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_006E:					  ; CODE XREF: ROM:000122B4j
		move.b	(g_Flags+1).l,d0
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d0,RotationAndSize(a5)
		rts
; ---------------------------------------------------------------------------

CSA_006F:					  ; CODE XREF: ROM:000122B8j
		bsr.w	CSA_015A
		move.w	#$006F,d0		  ; Cutscene 0x06F: 0x02550C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0070:					  ; CODE XREF: ROM:000122BCj
		bset	#$05,Flags2(a5)
		move.w	#$0070,d0		  ; Cutscene 0x070: 0x02550E
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_0071:					  ; CODE XREF: ROM:000122C0j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicKayla
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CSA_0072:					  ; CODE XREF: ROM:000122C4j
		move.w	#$000C,AnimationIndex(a5)
		clr.w	AnimationFrame(a5)
		bset	#$07,Unk48(a5)
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		move.w	#$0028,d0		  ; Cutscene 0x028: 0x02547E
		bsr.w	LoadCutsceneDialogue
		move.b	#$57,(g_FridayAnimation1).l
		move.b	#$23,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

CSA_0073:					  ; CODE XREF: ROM:000122C8j
		move.w	#$0029,d0		  ; Cutscene 0x029: 0x025480
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0074:					  ; CODE XREF: ROM:000122CCj
		move.w	#$002A,d0		  ; Cutscene 0x02A: 0x025482
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0075:					  ; CODE XREF: ROM:000122D0j
		move.w	#$002B,d0		  ; Cutscene 0x02B: 0x025484
		bsr.w	LoadCutsceneDialogue
		move.b	#$59,(g_FridayAnimation1).l
		move.b	#$22,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

CSA_0076:					  ; CODE XREF: ROM:000122D4j
		move.b	#ITM_LITHOGRAPH,d0
		jsr	(j_CheckAndConsumeItem).l
		move.w	#$002C,d0		  ; Cutscene 0x02C: 0x025486
		bsr.w	LoadCutsceneDialogue
		move.b	#$5B,(g_FridayAnimation1).l
		move.b	#$31,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

CSA_0077:					  ; CODE XREF: ROM:000122D8j
		movem.l	a5,-(sp)
		lea	(Sprite1_X).l,a5
		move.w	#00333,BehaviourLUTIndex(a5)
		jsr	(j_LoadSpriteBehaviour).l
		movem.l	(sp)+,a5
		rts
; ---------------------------------------------------------------------------

CSA_0078:					  ; CODE XREF: ROM:000122DCj
		move.w	#$0076,d0		  ; Cutscene 0x076: 0x02551A
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		bne.w	locret_13938
		bclr	#$02,(g_Flags+$16).l

locret_13938:					  ; CODE XREF: ROM:0001392Cj
		rts
; ---------------------------------------------------------------------------

CSA_0079:					  ; CODE XREF: ROM:000122E0j
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_007A:					  ; CODE XREF: ROM:000122E4j
		btst	#$00,(g_Flags+$15).l
		bne.s	locret_13956
		bset	#$00,(g_Flags+1).l

locret_13956:					  ; CODE XREF: ROM:0001394Cj
		rts
; ---------------------------------------------------------------------------

CSA_007B:					  ; CODE XREF: ROM:000122E8j
		move.b	#$08,d0
		jsr	(j_DoTileSwap).l
		move.b	#$10,d0
		jsr	(j_DoTileSwap).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_PermanentSwitch
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CSA_007C:					  ; CODE XREF: ROM:000122ECj
		btst	#$01,(g_Flags+$15).l
		bne.s	locret_13984
		bset	#$00,(g_Flags+1).l

locret_13984:					  ; CODE XREF: ROM:0001397Aj
		rts
; ---------------------------------------------------------------------------

CSA_007D:					  ; CODE XREF: ROM:000122F0j
		btst	#$03,(g_Flags+$15).l
		bne.s	locret_13998
		bset	#$00,(g_Flags+1).l

locret_13998:					  ; CODE XREF: ROM:0001398Ej
		rts
; ---------------------------------------------------------------------------

CSA_007E:					  ; CODE XREF: ROM:000122F4j
		btst	#$04,(g_Flags+$15).l
		bne.s	locret_139AC
		bset	#$01,(g_Flags+1).l

locret_139AC:					  ; CODE XREF: ROM:000139A2j
		rts
; ---------------------------------------------------------------------------

CSA_007F:					  ; CODE XREF: ROM:000122F8j
		btst	#$05,(g_Flags+$15).l
		bne.s	locret_139C0
		bset	#$01,(g_Flags+1).l

locret_139C0:					  ; CODE XREF: ROM:000139B6j
		rts
; ---------------------------------------------------------------------------

CSA_0080:					  ; CODE XREF: ROM:000122FCj
		btst	#$06,(g_Flags+$15).l
		bne.s	locret_139D4
		bset	#$00,(g_Flags+1).l

locret_139D4:					  ; CODE XREF: ROM:000139CAj
		rts
; ---------------------------------------------------------------------------

CSA_0081:					  ; CODE XREF: ROM:00012300j
		move.w	#$0077,d0		  ; Cutscene 0x077: 0x02551C
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	locret_139F0
		bset	#$00,(g_Flags+1).l

locret_139F0:					  ; CODE XREF: ROM:000139E4j
		rts
; ---------------------------------------------------------------------------

CSA_0082:					  ; CODE XREF: ROM:00012304j
		move.w	#$0078,d0		  ; Cutscene 0x078: 0x02551E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0083:					  ; CODE XREF: ROM:00012308j
		move.w	#$0079,d0		  ; Cutscene 0x079: 0x025520
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	loc_13A16
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

loc_13A16:					  ; CODE XREF: ROM:00013A08j
		clr.w	(g_ControllerPlayback).l
		jsr	(j_HideSprite).l
		move.b	#$28,d0
		jmp	(j_DoTileSwap).l
; ---------------------------------------------------------------------------

CSA_0084:					  ; CODE XREF: ROM:0001230Cj
		move.w	#$007A,d0		  ; Cutscene 0x07A: 0x025522
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0085:					  ; CODE XREF: ROM:00012310j
		movem.l	a5,-(sp)
		lea	(Sprite1_X).l,a5
		jsr	(j_HideSprite).l
		lea	(Sprite2_X).l,a5
		jsr	(j_HideSprite).l
		movem.l	(sp)+,a5
		rts
; ---------------------------------------------------------------------------

CSA_0086:					  ; CODE XREF: ROM:00012314j
		move.w	#$007B,d0		  ; Cutscene 0x07B: 0x025524
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0087:					  ; CODE XREF: ROM:00012318j
		move.w	#$007C,d0		  ; Cutscene 0x07C: 0x025526
		bsr.w	LoadCutsceneDialogue
		movem.l	a5,-(sp)
		lea	(Sprite10_X).l,a5
		jsr	(j_HideSprite).l
	if	FIX_ARMLET_SKIP
		lea	(Sprite12_X).l,a5
		jsr	(j_HideSprite).l
	endif
		movem.l	(sp)+,a5
		move.b	#ITM_ARMLET,d0
		jmp	(j_CheckAndConsumeItem).l
; ---------------------------------------------------------------------------

CSA_0088:					  ; CODE XREF: ROM:0001231Cj
		move.w	#$007D,d0		  ; Cutscene 0x07D: 0x025528
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	loc_13AAC
		bset	#$05,(g_Flags+$16).l
		rts
; ---------------------------------------------------------------------------

loc_13AAC:					  ; CODE XREF: ROM:00013A9Ej
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_0089:					  ; CODE XREF: ROM:00012320j
		move.w	#$007E,d0		  ; Cutscene 0x07E: 0x02552A
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	loc_13AD2
		bset	#$06,(g_Flags+$16).l
		rts
; ---------------------------------------------------------------------------

loc_13AD2:					  ; CODE XREF: ROM:00013AC4j
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_008A:					  ; CODE XREF: ROM:00012324j
		move.w	#$007F,d0		  ; Cutscene 0x07F: 0x02552C
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	locret_13AF6
		bset	#$07,(g_Flags+$16).l

locret_13AF6:					  ; CODE XREF: ROM:00013AEAj
		rts
; ---------------------------------------------------------------------------

CSA_008B:					  ; CODE XREF: ROM:00012328j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordSwing
; ---------------------------------------------------------------------------
		movem.l	a5,-(sp)
		clr.w	AnimationFrame(a5)
		bra.s	loc_13B56
; ---------------------------------------------------------------------------

CSA_008C:					  ; CODE XREF: ROM:0001232Cj
		movem.l	a5,-(sp)
		move.w	#$0038,AnimationIndex(a5)
		move.w	#$0004,AnimationFrame(a5)
		bset	#$07,Unk48(a5)
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		move.b	#$40,(byte_FF1143).l
		clr.w	(Player_AttackStrength).l
		bsr.w	sub_13140
		movem.l	(sp)+,a5
		rts
; ---------------------------------------------------------------------------

CSA_008D:					  ; CODE XREF: ROM:00012330j
		movem.l	a5,-(sp)
		move.w	#$0008,AnimationFrame(a5)
		bra.s	loc_13B56
; ---------------------------------------------------------------------------

CSA_008E:					  ; CODE XREF: ROM:00012334j
		movem.l	a5,-(sp)
		move.w	#$000C,AnimationFrame(a5)

loc_13B56:					  ; CODE XREF: ROM:00013B04j
						  ; ROM:00013B4Aj
		move.w	#$0038,AnimationIndex(a5)
		bset	#$07,Unk48(a5)
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,a5
		rts
; ---------------------------------------------------------------------------

CSA_008F:					  ; CODE XREF: ROM:00012338j
		clr.w	BehavParam(a5)
		movea.l	BehaviourLUTPtr(a5),a0
		addi.l	#$0000000F,BehaviourLUTPtr(a5)
		addq.l	#$02,a0
		lea	(Sprite2_X).l,a5
		move.l	a0,Sprite2_BehaviourLUTPtr-Sprite2_X(a5)
		move.b	(a0),BehavCmd(a5)
		move.b	$00000001(a0),BehavParam(a5)
		rts
; ---------------------------------------------------------------------------

CSA_0090:					  ; CODE XREF: ROM:0001233Cj
		move.w	#$0080,d0		  ; Cutscene 0x080: 0x02552E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0091:					  ; CODE XREF: ROM:00012340j
		move.w	#$0081,d0		  ; Cutscene 0x081: 0x025530
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0092:					  ; CODE XREF: ROM:00012344j
		move.w	#$0082,d0		  ; Cutscene 0x082: 0x025532
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0093:					  ; CODE XREF: ROM:00012348j
		move.w	#$0083,d0		  ; Cutscene 0x083: 0x025534
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0094:					  ; CODE XREF: ROM:0001234Cj
		move.w	#$0084,d0		  ; Cutscene 0x084: 0x025536
		bsr.w	LoadCutsceneDialogue
		bsr.w	CSA_015A
		move.w	#$0085,d0		  ; Cutscene 0x085: 0x025538
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_0095:					  ; CODE XREF: ROM:00012350j
		bclr	#$07,(Sprite9_Flags2).l
		bclr	#$07,(Sprite9_InitFlags2).l
		rts
; ---------------------------------------------------------------------------

CSA_0096:					  ; CODE XREF: ROM:00012354j
		movea.l	a5,a0
		lea	(Sprite9_X).l,a5
		movea.l	BehaviourLUTPtr(a0),a1
		addq.l	#$04,a1
		move.l	a1,BehaviourLUTPtr(a5)
		move.b	(a1),BehavCmd(a5)
		move.b	$00000001(a1),BehavParam(a5)
		bclr	#$07,Flags2(a5)
		bclr	#$07,InitFlags2(a5)
		bclr	#$01,Flags2(a5)
		bclr	#$06,Flags2(a5)
		rts

; =============== S U B	R O U T	I N E =======================================


CSA_0097:					  ; CODE XREF: ROM:00012358j
						  ; ROM:CSA_0099p
		bclr	#$07,(Sprite4_Flags2).l
		bclr	#$07,(Sprite4_InitFlags2).l
		rts
; End of function CSA_0097

; ---------------------------------------------------------------------------

CSA_0098:					  ; CODE XREF: ROM:0001235Cj
		move.w	#$0086,d0		  ; Cutscene 0x086: 0x02553A
		bsr.w	LoadCutsceneDialogue
		bsr.w	CSA_015A
		move.w	#$0087,d0		  ; Cutscene 0x087: 0x02553C
		bsr.w	LoadCutsceneDialogue
		move.w	#$0088,d0		  ; Cutscene 0x088: 0x02553E
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_0099:					  ; CODE XREF: ROM:00012360j
		bsr.s	CSA_0097
		clr.w	(Sprite4_Unk2A).l
		rts
; ---------------------------------------------------------------------------

CSA_009A:					  ; CODE XREF: ROM:00012364j
						  ; ROM:000147D4j
		move.w	#$161C,(Player_X).l
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$80,(Player_RotationAndSize).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_WarpPad
; ---------------------------------------------------------------------------
		jsr	(sub_44C).l
		move.w	#$01DB,d0		  ; Outside Mir's tower
		bsr.w	SetRoomNumber
		jsr	(sub_434).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(j_InitVDP).l
		jsr	(j_FadeInFromDarkness).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_009B:					  ; CODE XREF: ROM:00012368j
		move.w	#$0089,d0		  ; Cutscene 0x089: 0x025540
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	locret_13CD4
		bset	#$00,(g_Flags+1).l

locret_13CD4:					  ; CODE XREF: ROM:00013CC8j
		rts
; ---------------------------------------------------------------------------

CSA_009C:					  ; CODE XREF: ROM:0001236Cj
		move.w	#$008A,d0		  ; Cutscene 0x08A: 0x025542
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_009D:					  ; CODE XREF: ROM:00012370j
		move.b	#$23,d0
		cmpi.b	#$1D,(Player_X).l
		beq.s	loc_13CF0
		move.b	#$24,d0

loc_13CF0:					  ; CODE XREF: ROM:00013CEAj
		bra.w	PlaybackInput
; ---------------------------------------------------------------------------

CSA_009E:					  ; CODE XREF: ROM:00012374j
		move.w	#$008B,d0		  ; Cutscene 0x08B: 0x025544
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_009F:					  ; CODE XREF: ROM:00012378j
		move.w	#$008C,d0		  ; Cutscene 0x08C: 0x025546
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00A0:					  ; CODE XREF: ROM:0001237Cj
		move.w	#$008D,d0		  ; Cutscene 0x08D: 0x025548
		bsr.w	LoadCutsceneDialogue
		bsr.s	sub_13D16
		move.w	#$008E,d0		  ; Cutscene 0x08E: 0x02554A
		bra.w	LoadCutsceneDialogue

; =============== S U B	R O U T	I N E =======================================


sub_13D16:					  ; CODE XREF: ROM:00013D0Cp
						  ; ROM:0001443Ep
		move.w	#$0001,d7

loc_13D1A:					  ; CODE XREF: sub_13D16+20j
		movem.w	d7,-(sp)
		move.w	#$0000,AnimationFrame(a5)
		bsr.s	sub_13D3C
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordSwing
; ---------------------------------------------------------------------------
		move.w	#$0004,AnimationFrame(a5)
		bsr.s	sub_13D3C
		movem.w	(sp)+,d7
		dbf	d7,loc_13D1A
		rts
; End of function sub_13D16


; =============== S U B	R O U T	I N E =======================================


sub_13D3C:					  ; CODE XREF: sub_13D16+Ep
						  ; sub_13D16+1Ap
		movem.l	a5,-(sp)
		move.w	#$0010,AnimationIndex(a5)
		bset	#$07,Unk48(a5)
		jsr	(j_LoadSprites).l
		jsr	(j_EnableDMAQueueProcessing).l
		movem.l	(sp)+,a5
		move.w	#$0008,d0
		jmp	(j_Sleep).l
; End of function sub_13D3C

; ---------------------------------------------------------------------------

CSA_00A1:					  ; CODE XREF: ROM:00012380j
		move.w	#$008F,d0		  ; Cutscene 0x08F: 0x02554C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00A2:					  ; CODE XREF: ROM:00012384j
		move.w	#$0090,d0		  ; Cutscene 0x090: 0x02554E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00A3:					  ; CODE XREF: ROM:00012388j
		move.b	#ITM_REDJEWEL,d0
		jsr	(j_CheckAndConsumeItem).l
		move.b	#ITM_PURPLEJEWEL,d0
		jsr	(j_CheckAndConsumeItem).l
		move.w	#$0091,d0		  ; Cutscene 0x091: 0x025550
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00A4:					  ; CODE XREF: ROM:0001238Cj
		move.w	#$0092,d0		  ; Cutscene 0x092: 0x025552
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00A5:					  ; CODE XREF: ROM:00012390j
		bset	#$02,(g_Flags+$13).l
		move.w	#$0093,d0		  ; Cutscene 0x093: 0x025554
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00A6:					  ; CODE XREF: ROM:00012394j
		move.w	#$0094,d0		  ; Cutscene 0x094: 0x025556
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00A7:					  ; CODE XREF: ROM:00012398j
		move.w	#$0095,d0		  ; Cutscene 0x095: 0x025558
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00A8:					  ; CODE XREF: ROM:0001239Cj
		move.w	#$0096,d0		  ; Cutscene 0x096: 0x02555A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00A9:					  ; CODE XREF: ROM:000123A0j
		move.w	#$0097,d0		  ; Cutscene 0x097: 0x02555C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00AA:					  ; CODE XREF: ROM:000123A4j
		move.w	#$0098,d0		  ; Cutscene 0x098: 0x02555E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00AB:					  ; CODE XREF: ROM:000123A8j
		move.w	(Player_HeightmapOffset).l,d0
		movem.w	d0,-(sp)
		move.w	#$E3B4,(Player_HeightmapOffset).l
		jsr	(j_CheckForDoorNW).l
		movem.w	(sp)+,d0
		move.w	d0,(Player_HeightmapOffset).l
		rts
; ---------------------------------------------------------------------------

CSA_00AC:					  ; CODE XREF: ROM:000123ACj
		move.w	#$0098,d0		  ; Cutscene 0x098: 0x02555E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00AD:					  ; CODE XREF: ROM:000123B0j
		move.w	#$0099,d0		  ; Cutscene 0x099: 0x025560
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00AE:					  ; CODE XREF: ROM:000123B4j
		move.w	#$009A,d0		  ; Cutscene 0x09A: 0x025562
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00AF:					  ; CODE XREF: ROM:000123B8j
		move.w	#$009B,d0		  ; Cutscene 0x09B: 0x025564
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00B0:					  ; CODE XREF: ROM:000123BCj
		move.w	(Player_HeightmapOffset).l,d0
		movem.w	d0,-(sp)
		move.w	#$DCA8,(Player_HeightmapOffset).l
		jsr	(j_CheckForDoorNW).l
		movem.w	(sp)+,d0
		move.w	d0,(Player_HeightmapOffset).l
		rts
; ---------------------------------------------------------------------------

CSA_00B1:					  ; CODE XREF: ROM:000123C0j
		move.w	#$009C,d0		  ; Cutscene 0x09C: 0x025566
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00B2:					  ; CODE XREF: ROM:000123C4j
		move.w	#$009D,d0		  ; Cutscene 0x09D: 0x025568
		bsr.w	LoadCutsceneDialogue
		addi.w	#$0A00,HitBoxXStart(a5)
		addi.w	#$0A00,HitBoxXEnd(a5)
		addi.w	#$0A00,HitBoxYStart(a5)
		addi.w	#$0A00,HitBoxYEnd(a5)
		addi.w	#$0A00,$00000098(a5)
		addi.w	#$0A00,$0000009A(a5)
		addi.w	#$0A00,$0000009C(a5)
		addi.w	#$0A00,$0000009E(a5)
		lea	ZakLaraCutsceneFlyCmds(pc),a0

loc_13E7E:					  ; CODE XREF: ROM:00013EAEj
		move.b	$00000001(a0),d7
		bmi.s	loc_13EB0
		ext.w	d7

loc_13E86:					  ; CODE XREF: ROM:00013EA8j
		move.b	(a0),d0
		add.b	d0,d0
		ext.w	d0
		jsr	j_CSA_00B2_ZakOnlyFlyUp(pc,d0.w)
		bsr.w	ZakFlapWings
		movem.l	d7-a0/a5,-(sp)
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,d7-a0/a5
		dbf	d7,loc_13E86
		addq.l	#$02,a0
		bra.s	loc_13E7E
; ---------------------------------------------------------------------------

loc_13EB0:					  ; CODE XREF: ROM:00013E82j
		move.w	#$009E,d0		  ; Cutscene 0x09E: 0x02556A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------
ZakLaraCutsceneFlyCmds:dc.b $00,$1F		  ; DATA XREF: ROM:00013E7At
		dc.b $01,$0F
		dc.b $02,$07
		dc.b $03,$2F
		dc.b $08,$2F
		dc.b $07,$17
		dc.b $09,$09
		dc.b $0A,$1F
		dc.b $FF,$FF

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_CSA_00B2_ZakOnlyFlyUp:			  ; CODE XREF: ROM:00013E8Cp
		bra.s	CSA_00B2_ZakOnlyFlyUp
; End of function j_CSA_00B2_ZakOnlyFlyUp

; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_ZakOnlyMoveNW
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_MoveUp
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_MoveSW
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_MoveNE
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_MoveSE
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_MoveNW
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_FlyUpSE
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_FlyS
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_FlyUpSE_Spd2
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_FlyUpSE_Spd3

; =============== S U B	R O U T	I N E =======================================


CSA_00B2_MoveUp:				  ; CODE XREF: ROM:00013ECEj
						  ; CSA_00B2_FlyUpSEp ...
		addq.w	#$01,$00000092(a5)
		addq.w	#$01,$000000D4(a5)

CSA_00B2_ZakOnlyFlyUp:				  ; CODE XREF: j_CSA_00B2_ZakOnlyFlyUpj
		addq.w	#$01,Z(a5)
		addq.w	#$01,HitBoxZEnd(a5)
		rts
; End of function CSA_00B2_MoveUp

; ---------------------------------------------------------------------------

CSA_00B2_ZakOnlyMoveNW:				  ; CODE XREF: ROM:00013ECCj
		subq.w	#$01,CentreX(a5)
		rts

; =============== S U B	R O U T	I N E =======================================


CSA_00B2_MoveSW:				  ; CODE XREF: ROM:00013ED0j
						  ; ROM:CSA_00B2_FlySp
		addq.w	#$01,CentreY(a5)
		addq.w	#$01,$00000096(a5)
		rts
; End of function CSA_00B2_MoveSW

; ---------------------------------------------------------------------------

CSA_00B2_MoveNE:				  ; CODE XREF: ROM:00013ED2j
		subq.w	#$01,CentreY(a5)
		subq.w	#$01,$00000096(a5)
		rts

; =============== S U B	R O U T	I N E =======================================


CSA_00B2_MoveSE:				  ; CODE XREF: ROM:00013ED4j
						  ; CSA_00B2_FlyUpSE+4p ...
		addq.w	#$01,CentreX(a5)
		addq.w	#$01,$00000094(a5)
		rts
; End of function CSA_00B2_MoveSE

; ---------------------------------------------------------------------------

CSA_00B2_MoveNW:				  ; CODE XREF: ROM:00013ED6j
		subq.w	#$01,CentreX(a5)
		subq.w	#$01,$00000094(a5)
		rts

; =============== S U B	R O U T	I N E =======================================


CSA_00B2_FlyUpSE:				  ; CODE XREF: ROM:00013ED8j
						  ; CSA_00B2_FlyUpSE_Spd2p
		bsr.s	CSA_00B2_MoveUp
		bsr.s	CSA_00B2_MoveUp
		bsr.s	CSA_00B2_MoveSE
		bsr.s	CSA_00B2_MoveSE
		bsr.s	CSA_00B2_MoveSE
		bsr.w	ZakFlapWings
		rts
; End of function CSA_00B2_FlyUpSE

; ---------------------------------------------------------------------------

CSA_00B2_FlyS:					  ; CODE XREF: ROM:00013EDAj
		bsr.s	CSA_00B2_MoveSW
		bsr.s	CSA_00B2_MoveSE
		bsr.w	ZakFlapWings
		rts

; =============== S U B	R O U T	I N E =======================================


CSA_00B2_FlyUpSE_Spd2:				  ; CODE XREF: ROM:00013EDCj
						  ; ROM:CSA_00B2_FlyUpSE_Spd3p
		bsr.s	CSA_00B2_FlyUpSE
		bsr.s	CSA_00B2_MoveUp
		bsr.s	CSA_00B2_MoveSE
		bsr.s	CSA_00B2_MoveSE
		bsr.w	ZakFlapWings
		bsr.w	ZakFlapWings
		bsr.w	ZakFlapWings
		rts
; End of function CSA_00B2_FlyUpSE_Spd2

; ---------------------------------------------------------------------------

CSA_00B2_FlyUpSE_Spd3:				  ; CODE XREF: ROM:00013EDEj
		bsr.s	CSA_00B2_FlyUpSE_Spd2
		bsr.s	CSA_00B2_MoveUp
		bsr.s	CSA_00B2_MoveSE
		bsr.s	CSA_00B2_MoveSE
		bsr.w	ZakFlapWings
		bsr.w	ZakFlapWings
		bsr.w	ZakFlapWings
		rts

; =============== S U B	R O U T	I N E =======================================


sub_13F66:					  ; CODE XREF: sub_147E8p
						  ; sub_147E8+4p
		move.w	#$0018,AnimationIndex(a5)
		bra.s	loc_13F74
; End of function sub_13F66


; =============== S U B	R O U T	I N E =======================================


ZakFlapWings:					  ; CODE XREF: ROM:00013E90p
						  ; CSA_00B2_FlyUpSE+Ap ...

arg_38		=  $3C

		move.w	#$0014,AnimationIndex(a5)

loc_13F74:					  ; CODE XREF: sub_13F66+6j
		addq.b	#$01,Unk0D(a5)
		move.b	Unk0D(a5),d0
		andi.b	#$03,d0
		bne.s	locret_13F96
		addq.b	#$04,AnimationFrame1(a5)
		andi.b	#$0C,AnimationFrame1(a5)
		bset	#$07,Unk48(a5)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Slash1
; ---------------------------------------------------------------------------

locret_13F96:					  ; CODE XREF: ZakFlapWings+12j
		rts
; ---------------------------------------------------------------------------

CSA_00B3:					  ; CODE XREF: ROM:000123C8j
		move.w	#$009E,d0		  ; Cutscene 0x09E: 0x02556A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00B4:					  ; CODE XREF: ROM:000123CCj
		move.w	#$0000,AnimationFrame(a5)
		bsr.s	sub_13FB2
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordSwing
; End of function ZakFlapWings

; ---------------------------------------------------------------------------
		move.w	#$0004,AnimationFrame(a5)

; =============== S U B	R O U T	I N E =======================================


sub_13FB2:					  ; CODE XREF: ZakFlapWings+38p
		movem.l	a5,-(sp)
		move.w	#$0008,AnimationIndex(a5)
		bset	#$07,Unk48(a5)
		jsr	(j_LoadSprites).l
		jsr	(j_EnableDMAQueueProcessing).l
		movem.l	(sp)+,a5
		move.w	#$0004,d0
		jmp	(j_Sleep).l
; End of function sub_13FB2

; ---------------------------------------------------------------------------

CSA_00B5:					  ; CODE XREF: ROM:000123D0j
		bset	#$06,(g_AdditionalFlags).l
		move.w	#$00A0,d0		  ; Cutscene 0x0A0: 0x02556E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00B6:					  ; CODE XREF: ROM:000123D4j
		move.w	#$00A1,d0		  ; Cutscene 0x0A1: 0x025570
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00B7:					  ; CODE XREF: ROM:000123D8j
		move.w	#$00A2,d0		  ; Cutscene 0x0A2: 0x025572
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00B8:					  ; CODE XREF: ROM:000123DCj
		move.w	#$00A3,d0		  ; Cutscene 0x0A3: 0x025574
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00B9:					  ; CODE XREF: ROM:000123E0j
		move.w	#$00A4,d0		  ; Cutscene 0x0A4: 0x025576
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00BA:					  ; CODE XREF: ROM:000123E4j
		move.w	#$00AC,d0		  ; Cutscene 0x0AC: 0x025586
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00BB:					  ; CODE XREF: ROM:000123E8j
		move.w	#$00AD,d0		  ; Cutscene 0x0AD: 0x025588
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00BC:					  ; CODE XREF: ROM:000123ECj
		rts
; ---------------------------------------------------------------------------

CSA_00BD:					  ; CODE XREF: ROM:000123F0j
		move.w	#$00AE,d0		  ; Cutscene 0x0AE: 0x02558A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00BE:					  ; CODE XREF: ROM:000123F4j
		move.w	#$00AF,d0		  ; Cutscene 0x0AF: 0x02558C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00BF:					  ; CODE XREF: ROM:000123F8j
		move.w	#$00B0,d0		  ; Cutscene 0x0B0: 0x02558E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00C0:					  ; CODE XREF: ROM:000123FCj
		move.w	#$00B1,d0		  ; Cutscene 0x0B1: 0x025590
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00C1:					  ; CODE XREF: ROM:00012400j
		move.w	#$00B2,d0		  ; Cutscene 0x0B2: 0x025592
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00C2:					  ; CODE XREF: ROM:00012404j
		move.b	#$C0,d0
		cmpi.b	#$30,(Player_X).l
		beq.s	loc_14058
		move.b	#$40,d0

loc_14058:					  ; CODE XREF: ROM:00014052j
		lea	(Player_X).l,a0
		andi.b	#$3F,RotationAndSize(a0)
		or.b	d0,RotationAndSize(a0)
		ori.b	#$80,Unk0A(a0)
		movem.l	a5,-(sp)
		jsr	(sub_3FE).l
		jsr	(j_LoadSprites).l
		jsr	(j_EnableDMAQueueProcessing).l
		movem.l	(sp)+,a5
		bsr.w	CSA_015A
		move.w	#$00A5,d0		  ; Cutscene 0x0A5: 0x025578
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	loc_140C2
		bsr.w	sub_1584A
		move.b	#ITM_EKEEKE,d0
		jsr	(j_CheckAndConsumeItem).l
		jsr	(j_UpdateEkeEkeHUD).l
		bset	#$00,(g_AdditionalFlags+4).l
		jsr	(j_HideSprite).l
		rts
; ---------------------------------------------------------------------------

loc_140C2:					  ; CODE XREF: ROM:0001409Aj
		move.b	#$31,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_00C3:					  ; CODE XREF: ROM:00012408j
		move.w	#$00A6,d0		  ; Cutscene 0x0A6: 0x02557A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00C4:					  ; CODE XREF: ROM:0001240Cj
		move.w	#$00A7,d0		  ; Cutscene 0x0A7: 0x02557C
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_00C5:					  ; CODE XREF: ROM:00012410j
		move.w	#$00A8,d0		  ; Cutscene 0x0A8: 0x02557E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00C6:					  ; CODE XREF: ROM:00012414j
		move.w	#$00A9,d0		  ; Cutscene 0x0A9: 0x025580
		bsr.w	LoadCutsceneDialogue
		bsr.w	CSA_015A
		move.w	#$00AA,d0		  ; Cutscene 0x0AA: 0x025582
		bsr.w	LoadCutsceneDialogue
		lea	(Player_X).l,a0
		andi.b	#$3F,RotationAndSize(a0)
		ori.b	#$80,RotationAndSize(a0)
		ori.b	#$80,Unk0A(a0)
		movem.l	a5,-(sp)
		jsr	(sub_3FE).l
		jsr	(j_LoadSprites).l
		jsr	(j_EnableDMAQueueProcessing).l
		movem.l	(sp)+,a5
		move.w	#$00AB,d0		  ; Cutscene 0x0AB: 0x025584
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation1).l
		bset	#$04,(g_AdditionalFlags+4).l
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_00C7:					  ; CODE XREF: ROM:00012418j
		rts
; ---------------------------------------------------------------------------

CSA_00C8:					  ; CODE XREF: ROM:0001241Cj
		bsr.w	CSA_015A
		move.w	#$00B3,d0		  ; Cutscene 0x0B3: 0x025594
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	loc_141E0
		move.b	#$11,(g_FridayAnimation2).l
		move.w	#$00B4,d0		  ; Cutscene 0x0B4: 0x025596
		bsr.w	LoadCutsceneDialogue
		move.w	#00060,d0
		jsr	(j_Sleep).l
		move.b	#$24,(g_FridayAnimation2).l

loc_14190:					  ; CODE XREF: ROM:0001419Ej
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#$24,(g_FridayAnimation1).l
		bne.s	loc_14190
		move.w	#$00B5,d0		  ; Cutscene 0x0B5: 0x025598
		bsr.w	LoadCutsceneDialogue
		move.b	#$5D,(g_FridayAnimation1).l
		move.b	#$22,(g_FridayAnimation2).l
		bsr.w	loc_15852
		move.w	#$00B6,d0		  ; Cutscene 0x0B6: 0x02559A
		bsr.w	LoadCutsceneDialogue
		move.b	#$5F,(g_FridayAnimation1).l
		move.b	#$22,(g_FridayAnimation2).l
		bsr.w	loc_15852
		bset	#$06,(g_AdditionalFlags+4).l

loc_141E0:					  ; CODE XREF: ROM:0001416Aj
		move.b	#$31,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_00C9:					  ; CODE XREF: ROM:00012420j
		move.w	#$00B8,d0		  ; Cutscene 0x0B8: 0x02559E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00CA:					  ; CODE XREF: ROM:00012424j
		move.w	#$00B9,d0		  ; Cutscene 0x0B9: 0x0255A0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00CB:					  ; CODE XREF: ROM:00012428j
		move.w	#$00BA,d0		  ; Cutscene 0x0BA: 0x0255A2
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00CC:					  ; CODE XREF: ROM:0001242Cj
		btst	#$07,(g_Flags+$15).l
		bne.s	locret_14214
		bset	#$00,(g_Flags+1).l

locret_14214:					  ; CODE XREF: ROM:0001420Aj
		rts
; ---------------------------------------------------------------------------

CSA_00CD:					  ; CODE XREF: ROM:00012430j
		bset	#$07,(Sprite3_JumpRate).l
		rts
; ---------------------------------------------------------------------------

CSA_00CE:					  ; CODE XREF: ROM:00012434j
		move.w	#$00BB,d0		  ; Cutscene 0x0BB: 0x0255A4
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00CF:					  ; CODE XREF: ROM:00012438j
		move.w	#$00BC,d0		  ; Cutscene 0x0BC: 0x0255A6
		bsr.w	LoadCutsceneDialogue
		bset	#$01,(g_AdditionalFlags+6).l
		move.w	#$0275,(g_RmNum1).l	  ; Lighthouse
		bsr.s	SpecialWarp
		bset	#$00,(g_Flags+1).l
		move.b	#ITM_SUNSTONE,d0
		jsr	(j_CheckAndConsumeItem).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts

; =============== S U B	R O U T	I N E =======================================


SpecialWarp:					  ; CODE XREF: ROM:00014240p
						  ; ROM:0001474Ep ...
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MirWarp
; ---------------------------------------------------------------------------
		jsr	(j_FadeToWhite).l
		jsr	(sub_434).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(j_InitVDP).l
		jmp	(j_FadeFromWhite).l
; End of function SpecialWarp

; ---------------------------------------------------------------------------

CSA_00D0:					  ; CODE XREF: ROM:0001243Cj
		move.w	#$00BD,d0		  ; Cutscene 0x0BD: 0x0255A8
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00D1:					  ; CODE XREF: ROM:00012440j
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		beq.s	loc_142BA
		move.w	#$00C1,d0
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	locret_142B8
		bset	#$04,(g_AdditionalFlags+$B).l

locret_142B8:					  ; CODE XREF: ROM:000142ACj
		rts
; ---------------------------------------------------------------------------

loc_142BA:					  ; CODE XREF: ROM:0001429Cj
		move.w	#$00C2,d0		  ; Cutscene 0x0C2: 0x0255B2
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00D2:					  ; CODE XREF: ROM:00012444j
		move.w	#$00BE,d0		  ; Cutscene 0x0BE: 0x0255AA
		bsr.w	LoadCutsceneDialogue
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicFanfare2
; ---------------------------------------------------------------------------
		moveq	#$00000000,d0
		jsr	(j_DisplayIslandMap).l
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$80,(Player_RotationAndSize).l
		bset	#$04,(g_AdditionalFlags+8).l
		move.w	#$01F1,(g_RmNum1).l	  ; Ship
		move.w	#$2724,(Player_X).l
		bsr.s	LoadRoom_1
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts

; =============== S U B	R O U T	I N E =======================================


LoadRoom_1:					  ; CODE XREF: ROM:000142FEp
						  ; ROM:00014350p
		move.b	#$FF,(g_PriBlockset).l
		move.b	#$FF,(g_SecBlockset).l
		move.b	#$FF,(g_CurrentTileset).l
		move.b	#$FF,(g_CurPalIdx).l
		jmp	(sub_42E).l
; End of function LoadRoom_1

; ---------------------------------------------------------------------------

CSA_00D3:					  ; CODE XREF: ROM:00012448j
		moveq	#$00000001,d0
		jsr	(j_DisplayIslandMap).l
		move.w	#$01EF,(g_RmNum1).l	  ; Ship at dock
		move.w	#$262F,(Player_X).l
		bsr.s	LoadRoom_1
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_00D4:					  ; CODE XREF: ROM:0001244Cj
		move.w	#$00C3,d0		  ; Cutscene 0x0C3: 0x0255B4
		bsr.w	LoadCutsceneDialogue
		move.w	(Player_HeightmapOffset).l,d0
		movem.w	d0,-(sp)
		move.w	#$E69C,(Player_HeightmapOffset).l
		jsr	(j_CheckForDoorNW).l
		movem.w	(sp)+,d0
		move.w	d0,(Player_HeightmapOffset).l
		rts
; ---------------------------------------------------------------------------

CSA_00D5:					  ; CODE XREF: ROM:00012450j
		move.w	#$00BF,d0		  ; Cutscene 0x0BF: 0x0255AC
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00D6:					  ; CODE XREF: ROM:00012454j
		move.w	#$00C0,d0		  ; Cutscene 0x0C0: 0x0255AE
		bsr.w	LoadCutsceneDialogue
		move.w	#$021F,(g_RmNum1).l	  ; Empty dock
		move.w	#$2D28,(Player_X).l
		jsr	(j_WarpToRoom).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_00D7:					  ; CODE XREF: ROM:00012458j
		move.w	#$00C4,d0		  ; Cutscene 0x0C4: 0x0255B6
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00D8:					  ; CODE XREF: ROM:0001245Cj
		move.w	#$00C5,d0		  ; Cutscene 0x0C5: 0x0255B8
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00D9:					  ; CODE XREF: ROM:00012460j
		move.w	#$00C6,d0		  ; Cutscene 0x0C6: 0x0255BA
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00DA:					  ; CODE XREF: ROM:00012464j
		move.w	#$00C8,d0		  ; Cutscene 0x0C8: 0x0255BE
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00DB:					  ; CODE XREF: ROM:00012468j
		move.w	#$00C9,d0		  ; Cutscene 0x0C9: 0x0255C0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00DC:					  ; CODE XREF: ROM:0001246Cj
		move.w	#$00CA,d0		  ; Cutscene 0x0CA: 0x0255C2
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CSA_00DD:					  ; CODE XREF: ROM:00012470j
		move.w	#$00CC,d0		  ; Cutscene 0x0CC: 0x0255C6
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00DE:					  ; CODE XREF: ROM:00012474j
		move.w	#$009F,d0		  ; Cutscene 0x09F: 0x02556C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00DF:					  ; CODE XREF: ROM:00012478j
		move.w	#$00CD,d0		  ; Cutscene 0x0CD: 0x0255C8
		bsr.w	LoadCutsceneDialogue
		move.b	#$53,(g_FridayAnimation1).l
		move.b	#$21,(g_FridayAnimation2).l
		bsr.w	loc_15852
		move.b	#$31,(g_FridayAnimation1).l
		move.w	#$00CE,d0		  ; Cutscene 0x0CE: 0x0255CA
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00E0:					  ; CODE XREF: ROM:0001247Cj
		move.w	#$00D4,d0		  ; Cutscene 0x0D4: 0x0255D6
		bsr.w	LoadCutsceneDialogue
		bsr.w	sub_13D16
		move.w	#$00D5,d0		  ; Cutscene 0x0D5: 0x0255D8
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00E1:					  ; CODE XREF: ROM:00012480j
		move.w	#$00CF,d0		  ; Cutscene 0x0CF: 0x0255CC
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00E2:					  ; CODE XREF: ROM:00012484j
		move.w	#$00D0,d0		  ; Cutscene 0x0D0: 0x0255CE
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00E3:					  ; CODE XREF: ROM:00012488j
		movem.l	a5,-(sp)
		move.b	#$01,d0
		lea	($0000F180).l,a2
		jsr	(j_LoadMagicSwordEffect).l
		move.l	#$C03A0000,(VDP_CTRL_REG).l
		move.w	#$008C,d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal1Base+$1A).l
		move.w	d1,(g_Pal1Active+$1A).l
		move.w	#$002C,d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal1Base+$1C).l
		move.w	d1,(g_Pal1Active+$1C).l
		move.l	#$C05A0000,(VDP_CTRL_REG).l
		move.w	#$008C,(VDP_DATA_REG).l
		move.w	#$002C,(VDP_DATA_REG).l
		lea	($00009880).l,a2
		move.b	#$01,d0
		jsr	(j_LoadMagicSwordEffect).l
		movem.l	(sp)+,a5
		bset	#$00,$00000048(a5)
		bset	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

CSA_00E4:					  ; CODE XREF: ROM:0001248Cj
		move.w	#$00D1,d0		  ; Cutscene 0x0D1: 0x0255D0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00E5:					  ; CODE XREF: ROM:00012490j
		clr.b	(g_Flags+8).l
		clr.b	(g_Flags+9).l
		move.w	#$00D2,d0		  ; Cutscene 0x0D2: 0x0255D2
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00E6:					  ; CODE XREF: ROM:00012494j
		btst	#$03,(g_Flags+7).l
		bne.s	locret_1450E
		bset	#$02,(g_Flags+1).l

locret_1450E:					  ; CODE XREF: ROM:00014504j
		rts
; ---------------------------------------------------------------------------

CSA_00E7:					  ; CODE XREF: ROM:00012498j
		move.w	#$0100,AttackStrength(a5)
		rts
; ---------------------------------------------------------------------------

CSA_00E8:					  ; CODE XREF: ROM:0001249Cj
		addi.w	#$0040,HitBoxXStart(a5)
		addi.w	#$0040,HitBoxXEnd(a5)
		move.w	#$00D3,d0		  ; Cutscene 0x0D3: 0x0255D4
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00E9:					  ; CODE XREF: ROM:000124A0j
		bset	#$05,Flags2(a5)
		move.w	#$00D6,d0		  ; Cutscene 0x0D6: 0x0255DA
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00EA:					  ; CODE XREF: ROM:000124A4j
		move.w	#$FFFF,(Sprite2_X).l
		rts
; ---------------------------------------------------------------------------

CSA_00EB:					  ; CODE XREF: ROM:000124A8j
		bsr.w	CSA_015A
		move.w	#$00D7,d0		  ; Cutscene 0x0D7: 0x0255DC
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00EC:					  ; CODE XREF: ROM:000124ACj
		move.w	#$00D8,d0		  ; Cutscene 0x0D8: 0x0255DE
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00ED:					  ; CODE XREF: ROM:000124B0j
		move.w	#$00D9,d0		  ; Cutscene 0x0D9: 0x0255E0
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_00EE:					  ; CODE XREF: ROM:000124B4j
		move.b	(Player_X).l,d0
		andi.b	#$FE,d0
		cmpi.b	#$26,d0
		bne.s	locret_1458C
		cmpi.b	#$0E,(Player_Y).l
		bne.s	locret_1458C
		move.b	#$03,d0
		bsr.w	PlaybackInput

locret_1458C:					  ; CODE XREF: ROM:00014578j
						  ; ROM:00014582j
		rts
; ---------------------------------------------------------------------------

CSA_00EF:					  ; CODE XREF: ROM:000124B8j
		bset	#$01,(g_AdditionalFlags+$A).l
		move.w	#$00E3,d0		  ; Cutscene 0x0E3: 0x0255F4
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00F0:					  ; CODE XREF: ROM:000124BCj
		jmp	(sub_22EA4).l
; ---------------------------------------------------------------------------

CSA_00F1:					  ; CODE XREF: ROM:000124C0j
		move.b	#$03,d0
		bsr.w	PlaybackInput
		move.b	(Player_Action+1).l,d0	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		andi.b	#$C0,d0
		cmpi.b	#$C0,d0
		bne.s	loc_145C2
		jmp	(sub_22EB4).l
; ---------------------------------------------------------------------------

loc_145C2:					  ; CODE XREF: ROM:000145BAj
		jsr	(j_FlushDMACopyQueue).l
		jmp	(sub_22EA8).l
; ---------------------------------------------------------------------------

CSA_00F2:					  ; CODE XREF: ROM:000124C4j
		move.w	#$00DA,d0		  ; Cutscene 0x0DA: 0x0255E2
		bsr.w	LoadCutsceneDialogue
		clr.w	AnimationFrame(a5)
		bsr.s	sub_145E2
		move.w	#$0004,AnimationFrame(a5)

; =============== S U B	R O U T	I N E =======================================


sub_145E2:					  ; CODE XREF: ROM:000145DAp
		movem.l	a5,-(sp)
		move.w	#$0028,AnimationIndex(a5)
		bset	#$07,Unk48(a5)
		jsr	(j_LoadSprites).l
		jsr	(j_EnableDMAQueueProcessing).l
		movem.l	(sp)+,a5
		move.w	#$0006,d0
		jmp	(j_Sleep).l
; End of function sub_145E2

; ---------------------------------------------------------------------------

CSA_00F3:					  ; CODE XREF: ROM:000124C8j
		bsr.w	RestoreBGM_0
		move.w	#$00DB,d0		  ; Cutscene 0x0DB: 0x0255E4
		bsr.w	LoadCutsceneDialogue
		movea.l	a5,a0
		lea	(Sprite5_X).l,a5
		movea.l	BehaviourLUTPtr(a0),a1
		addq.l	#$04,a1
		move.l	a1,BehaviourLUTPtr(a5)
		move.b	(a1),BehavCmd(a5)
		move.b	$00000001(a1),BehavParam(a5)
		bclr	#$07,Flags2(a5)
		bclr	#$07,InitFlags2(a5)
		bclr	#$01,Flags2(a5)
		bclr	#$06,Flags2(a5)
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bclr	#$00,Flags2(a5)
		move.b	#$01,AnimFlags(a5)
		bset	#$04,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

CSA_00F4:					  ; CODE XREF: ROM:000124CCj
		bclr	#$07,(Sprite5_Flags2).l
		bclr	#$07,(Sprite5_InitFlags2).l
		rts
; ---------------------------------------------------------------------------

CSA_00F5:					  ; CODE XREF: ROM:000124D0j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Fall
; ---------------------------------------------------------------------------
		move.w	#$0033,d7

loc_14680:					  ; CODE XREF: ROM:000146B0j
		subi.w	#$0004,Z(a5)
		subi.w	#$0004,HitBoxZEnd(a5)
		bsr.w	ZakFlapWings
		bsr.w	ZakFlapWings
		bsr.w	ZakFlapWings
		bsr.w	ZakFlapWings
		movem.l	d7-a0/a5,-(sp)
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,d7-a0/a5
		dbf	d7,loc_14680
		movem.l	a5,-(sp)
		move.w	#$6400,d0
		lea	(Player_X).l,a5
		bsr.w	RemoveHealth
		movem.l	(sp)+,a5
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$80,(Player_RotationAndSize).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyNoise
; ---------------------------------------------------------------------------
		bset	#$00,(g_AdditionalFlags+$19).l
		move.b	#$01,(g_PlayerAnimation).l
		rts
; ---------------------------------------------------------------------------

CSA_00F6:					  ; CODE XREF: ROM:000124D4j
		bclr	#$00,(g_AdditionalFlags+$19).l
		move.w	#$00DC,d0		  ; Cutscene 0x0DC: 0x0255E6
		bsr.w	LoadCutsceneDialogue
		move.w	#$002F,d7

loc_14704:					  ; CODE XREF: ROM:0001472Cj
		addi.w	#$0002,Z(a5)
		addi.w	#$0002,HitBoxZEnd(a5)
		bsr.w	ZakFlapWings
		bsr.w	ZakFlapWings
		movem.l	d7-a0/a5,-(sp)
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,d7-a0/a5
		dbf	d7,loc_14704
		move.w	#$0310,(g_RmNum1).l	  ; Mir's Room
		move.w	#$0310,(RmNum2).l
		move.w	#$1718,(Player_X).l
		clr.w	(Player_SubX).l
		bsr.w	SpecialWarp
		clr.b	(byte_FF1142).l
		clr.b	(g_PlayerAnimation).l
		move.w	#$00DD,d0		  ; Cutscene 0x0DD: 0x0255E8
		bsr.w	LoadCutsceneDialogue
		movem.l	a5,-(sp)
		move.w	#$6400,d0
		lea	(Player_X).l,a5
		bsr.w	AddHealth
		bsr.w	MarkHUDForUpdate
		bsr.w	RefreshHUD
		movem.l	(sp)+,a5
		lea	(Player_X).l,a1
		andi.b	#$3F,Player_RotationAndSize-Player_X(a1)
		clr.b	d1
		bsr.w	SetSpriteRotationAnimFlags
		bset	#$07,$00000048(a1)
		bclr	#$00,$0000000C(a1)
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		bsr.w	CSA_015A
		move.w	#$00DE,d0		  ; Cutscene 0x0DE: 0x0255EA
		bsr.w	LoadCutsceneDialogue
		clr.b	(g_FridayAnimation1).l
		clr.w	(gVDPSprFriday_Y).l
		clr.w	(g_ControllerPlayback).l
		bset	#$05,(g_AdditionalFlags+$A).l
		bra.w	CSA_009A
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CSA_00F7:					  ; CODE XREF: ROM:000124D8j
		move.w	#$0120,Z(a5)
		bset	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		rts

; =============== S U B	R O U T	I N E =======================================


sub_147E8:					  ; CODE XREF: ROM:0001482Ap
						  ; ROM:0001484Ep ...
		bsr.w	sub_13F66
		bsr.w	sub_13F66
		movem.l	d7-a0/a5,-(sp)
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,d7-a0/a5
		rts
; End of function sub_147E8

; ---------------------------------------------------------------------------

CSA_00F8:					  ; CODE XREF: ROM:000124DCj
		move.w	#$00DF,d0		  ; Cutscene 0x0DF: 0x0255EC
		bsr.w	LoadCutsceneDialogue
		move.w	#$002F,d7

loc_14812:					  ; CODE XREF: ROM:0001482Cj
		addi.w	#$0001,$0000001C(a5)
		addi.w	#$0001,$0000001E(a5)
		addi.w	#$0001,$00000016(a5)
		subi.w	#$0001,$00000012(a5)
		bsr.s	sub_147E8
		dbf	d7,loc_14812
		rts
; ---------------------------------------------------------------------------

CSA_00F9:					  ; CODE XREF: ROM:000124E0j
		move.w	#$0005,d7

loc_14836:					  ; CODE XREF: ROM:00014850j
		addi.w	#$0008,$0000001C(a5)
		addi.w	#$0008,$0000001E(a5)
		addi.w	#$0008,$00000016(a5)
		addi.w	#$0001,$00000012(a5)
		bsr.s	sub_147E8
		dbf	d7,loc_14836
		bsr.w	CSA_015A
		move.w	#$00E0,d0		  ; Cutscene 0x0E0: 0x0255EE
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation1).l
		move.w	#$003F,d7

loc_1486C:					  ; CODE XREF: ROM:00014876j
		addi.w	#$0002,$00000012(a5)
		bsr.w	sub_147E8
		dbf	d7,loc_1486C
		rts
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CSA_00FA:					  ; CODE XREF: ROM:000124E4j
		bset	#$00,(g_Flags+1).l
		move.w	#$00E1,d0		  ; Cutscene 0x0E1: 0x0255F0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00FB:					  ; CODE XREF: ROM:000124E8j
		bclr	#$07,(Sprite4_Flags2).l
		bclr	#$07,(Sprite4_InitFlags2).l
		rts
; ---------------------------------------------------------------------------

CSA_00FC:					  ; CODE XREF: ROM:000124ECj
		bsr.w	RestoreBGM_0
		bset	#$04,(Sprite4_Flags2).l
		move.w	#$00E2,d0		  ; Cutscene 0x0E2: 0x0255F2
		bsr.w	LoadCutsceneDialogue
		movea.l	a5,a0
		lea	(Sprite4_X).l,a5
		movea.l	BehaviourLUTPtr(a0),a1
		addq.l	#$04,a1
		move.l	a1,BehaviourLUTPtr(a5)
		move.b	(a1),BehavCmd(a5)
		move.b	Y(a1),BehavParam(a5)
		bclr	#$07,Flags2(a5)
		bclr	#$07,InitFlags2(a5)
		rts
; ---------------------------------------------------------------------------

CSA_00FD:					  ; CODE XREF: ROM:000124F0j
		bclr	#$04,(Sprite4_Flags2).l
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d1,RotationAndSize(a5)
		rts
; ---------------------------------------------------------------------------

CSA_00FE:					  ; CODE XREF: ROM:000124F4j
		move.w	#$003F,d7

loc_14900:					  ; CODE XREF: ROM:0001491Cj
		subi.w	#$0002,HitBoxYStart(a5)
		subi.w	#$0002,HitBoxYEnd(a5)
		subi.w	#$0002,CentreY(a5)
		addi.w	#$0002,Z(a5)
		bsr.w	sub_147E8
		dbf	d7,loc_14900
		rts
; ---------------------------------------------------------------------------

CSA_00FF:					  ; CODE XREF: ROM:000124F8j
		move.w	#$00E5,d0		  ; Cutscene 0x0E5: 0x0255F8
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0100:					  ; CODE XREF: ROM:000124FCj
		move.w	#$00E6,d0		  ; Cutscene 0x0E6: 0x0255FA
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0101:					  ; CODE XREF: ROM:00012500j
		move.w	#$00E7,d0		  ; Cutscene 0x0E7: 0x0255FC
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0102:					  ; CODE XREF: ROM:00012504j
		move.w	#$00E8,d0		  ; Cutscene 0x0E8: 0x0255FE
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0103:					  ; CODE XREF: ROM:00012508j
		move.w	#$00E9,d0		  ; Cutscene 0x0E9: 0x025600
		bsr.w	LoadCutsceneDialogue
		moveq	#$00000009,d0
		jsr	(j_DoVisualEffect).l
		rts
; ---------------------------------------------------------------------------

CSA_0104:					  ; CODE XREF: ROM:0001250Cj
		move.w	#$00EB,d0		  ; Cutscene 0x0EB: 0x025604
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0105:					  ; CODE XREF: ROM:00012510j
		move.w	#$00EC,d0		  ; Cutscene 0x0EC: 0x025606
		bsr.w	LoadCutsceneDialogue
		bsr.w	CSA_015A
		move.w	#$00ED,d0		  ; Cutscene 0x0ED: 0x025608
		bsr.w	LoadCutsceneDialogue
		move.b	#$61,(g_FridayAnimation1).l
		move.b	#$22,(g_FridayAnimation2).l

loc_14980:					  ; CODE XREF: ROM:0001498Ej
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#$22,(g_FridayAnimation1).l
		bne.s	loc_14980
		move.w	#$00EE,d0		  ; Cutscene 0x0EE: 0x02560A
		bsr.w	LoadCutsceneDialogue
		move.b	#$63,(g_FridayAnimation1).l
		move.b	#$21,(g_FridayAnimation2).l

loc_149A8:					  ; CODE XREF: ROM:000149B6j
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#$21,(g_FridayAnimation1).l
		bne.s	loc_149A8
		move.w	#$00EF,d0		  ; Cutscene 0x0EF: 0x02560C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0106:					  ; CODE XREF: ROM:00012514j
		moveq	#$0000000A,d0
		jsr	(j_DoVisualEffect).l
		move.w	#$00EA,d0		  ; Cutscene 0x0EA: 0x025602
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0107:					  ; CODE XREF: ROM:00012518j
		move.w	#$00F0,d0		  ; Cutscene 0x0F0: 0x02560E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0108:					  ; CODE XREF: ROM:0001251Cj
		move.w	#$00F1,d0		  ; Cutscene 0x0F1: 0x025610
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0109:					  ; CODE XREF: ROM:00012520j
		move.w	#$00F2,d0		  ; Cutscene 0x0F2: 0x025612
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_010A:					  ; CODE XREF: ROM:00012524j
		move.w	#$00FA,d0		  ; Cutscene 0x0FA: 0x025622
		btst	#$07,(g_AdditionalFlags+4).l
		bne.s	loc_14A12
		move.w	#$00F9,d0
		btst	#$01,(g_Flags+4).l
		bne.s	loc_14A12
		move.w	#$00F8,d0		  ; Cutscene 0x0F8: 0x02561E

loc_14A12:					  ; CODE XREF: ROM:000149FEj
						  ; ROM:00014A0Cj
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_010B:					  ; CODE XREF: ROM:00012528j
		move.w	#$00FB,d0		  ; Cutscene 0x0FB: 0x025624
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_010C:					  ; CODE XREF: ROM:0001252Cj
		lea	(Sprite1_X).l,a0
		moveq	#$0000000E,d7

loc_14A26:					  ; CODE XREF: ROM:00014A40j
		tst.w	(a0)
		bmi.s	locret_14A44
		bclr	#$07,Flags2(a0)
		bclr	#$07,InitFlags2(a0)
		beq.s	loc_14A3C
		clr.w	BehavParam(a0)

loc_14A3C:					  ; CODE XREF: ROM:00014A36j
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,loc_14A26

locret_14A44:					  ; CODE XREF: ROM:00014A28j
		rts
; ---------------------------------------------------------------------------

CSA_010D:					  ; CODE XREF: ROM:00012530j
		move.w	#$008C,(g_RmNum1).l	  ; Intro screen 2
		move.w	#$008C,(RmNum2).l
		move.w	#$2014,(Player_X).l
		move.w	#$0808,(Player_SubX).l
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$80,(Player_RotationAndSize).l
		jsr	(j_WarpToRoom).l
		move.w	#$00FE,(g_ControllerPlayback).l	; Lock controls
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_010E:					  ; CODE XREF: ROM:00012534j
		move.w	#$008D,(g_RmNum1).l	  ; Intro Screen 3
		move.w	#$008D,(RmNum2).l
		move.w	#$2C2C,(Player_X).l
		move.w	#$0808,(Player_SubX).l
		ori.b	#$C0,(Player_RotationAndSize).l
		jsr	(j_WarpToRoom).l
		move.w	#$00FE,(g_ControllerPlayback).l	; Lock Controls
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_010F:					  ; CODE XREF: ROM:00012538j
		move.w	#$008E,(g_RmNum1).l	  ; Intro Screen 4
		move.w	#$008E,(RmNum2).l
		move.w	#$2F1D,(Player_X).l
		move.w	#$0808,(Player_SubX).l
		ori.b	#$C0,(Player_RotationAndSize).l
		ori.b	#$40,(Player_Flags2).l
		jsr	(j_WarpToRoom).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicHarbour
; ---------------------------------------------------------------------------
		move.b	#$0E,(g_BGM).l
		move.w	#$00FE,(g_ControllerPlayback).l	; Lock Controls
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_0110:					  ; CODE XREF: ROM:0001253Cj
		andi.b	#$BF,(Player_Flags2).l
		rts
; ---------------------------------------------------------------------------

CSA_0111:					  ; CODE XREF: ROM:00012540j
		move.w	#$00FD,d0		  ; Cutscene 0x0FD: 0x025628
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$00FE,d0		  ; Cutscene 0x0FE: 0x02562A
		move.w	#00001,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$00FF,d0		  ; Cutscene 0x0FF: 0x02562C
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0100,d0		  ; Cutscene 0x100: 0x02562E
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jsr	(j_ClearTextbox).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicFridayAppear
; ---------------------------------------------------------------------------
		move.b	#$65,(g_FridayAnimation1).l
		move.b	#$22,(g_FridayAnimation2).l

loc_14B8E:					  ; CODE XREF: ROM:00014B9Cj
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#$22,(g_FridayAnimation1).l
		bne.s	loc_14B8E
		clr.b	(g_FridayAnimation1).l
		clr.w	(gVDPSprFriday_Y).l
		move.w	#$0101,d0		  ; Cutscene 0x101: 0x025630
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jsr	(j_ClearTextbox).l
		move.w	#00030,d0
		jsr	(j_Sleep).l
		bsr.w	CSA_015A
		move.w	#$0102,d0		  ; Cutscene 0x102: 0x025632
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0103,d0		  ; Cutscene 0x103: 0x025634
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jsr	(j_ClearTextbox).l
		bset	#$03,(g_Flags+1).l
		rts

; =============== S U B	R O U T	I N E =======================================


ShowCutsceneDialogueAndWait:			  ; CODE XREF: ROM:00014B4Cp
						  ; ROM:00014B58p ...
		movem.w	d1,-(sp)
		bsr.w	LoadCutsceneDialogue
		movem.w	(sp)+,d0
		jmp	(j_Sleep).l
; End of function ShowCutsceneDialogueAndWait

; ---------------------------------------------------------------------------

CSA_0112:					  ; CODE XREF: ROM:00012544j
		bsr.w	CSA_015A
		move.w	#$010E,d0		  ; Cutscene 0x10E: 0x02564A
		move.w	#00090,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$010F,d0		  ; Cutscene 0x10F: 0x02564C
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0110,d0		  ; Cutscene 0x110: 0x02564E
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0111,d0		  ; Cutscene 0x111: 0x025650
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0112,d0		  ; Cutscene 0x112: 0x025652
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0113,d0		  ; Cutscene 0x113: 0x025654
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0114,d0		  ; Cutscene 0x114: 0x025656
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0115,d0		  ; Cutscene 0x115: 0x025658
		move.w	#00090,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0116,d0		  ; Cutscene 0x116: 0x02565A
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0117,d0		  ; Cutscene 0x117: 0x02565C
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0118,d0		  ; Cutscene 0x118: 0x02565E
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jsr	(j_ClearTextbox).l
		move.b	#$67,(g_FridayAnimation1).l
		move.b	#$22,(g_FridayAnimation2).l

loc_14CA2:					  ; CODE XREF: ROM:00014CB0j
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#$22,(g_FridayAnimation1).l
		bne.s	loc_14CA2
		move.w	#$008F,(g_RmNum1).l	  ; Intro Screen 5
		move.w	#$008F,(RmNum2).l
		move.w	#$2119,(Player_X).l
		move.w	#$0808,(Player_SubX).l
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$80,(Player_RotationAndSize).l
		jsr	(j_FadeOutToDarkness).l
		move.b	#$21,(g_FridayAnimation1).l
		move.b	#$21,(g_FridayAnimation2).l
		jsr	(sub_42E).l
		move.w	#$00FE,(g_ControllerPlayback).l
		move.b	#ITM_STATUEOFJYPTA,d0
		jsr	(j_CheckAndConsumeItem).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_0113:					  ; CODE XREF: ROM:00012548j
		move.w	#$0094,(g_RmNum1).l	  ; Game begin
		move.w	#$2026,(Player_X).l
		move.w	#$0808,(Player_SubX).l
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$80,(Player_RotationAndSize).l
		bclr	#$03,(g_AdditionalFlags+7).l
		move.w	#$0090,(Player_Z).l
		jsr	(j_FadeOutToDarkness).l
		jsr	(sub_434).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(j_StartGame).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_0114:					  ; CODE XREF: ROM:0001254Cj
		move.w	#$0104,d0		  ; Cutscene 0x104: 0x025636
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0105,d0		  ; Cutscene 0x105: 0x025638
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0106,d0		  ; Cutscene 0x106: 0x02563A
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0107,d0		  ; Cutscene 0x107: 0x02563C
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0108,d0		  ; Cutscene 0x108: 0x02563E
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0109,d0		  ; Cutscene 0x109: 0x025640
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$010A,d0		  ; Cutscene 0x10A: 0x025642
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jmp	(j_ClearTextbox).l
; ---------------------------------------------------------------------------

CSA_0115:					  ; CODE XREF: ROM:00012550j
		move.w	#$010B,d0		  ; Cutscene 0x10B: 0x025644
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.b	#$31,(g_FridayAnimation1).l
		move.w	#$010C,d0		  ; Cutscene 0x10C: 0x025646
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicIntro
; ---------------------------------------------------------------------------
		jmp	(j_ClearTextbox).l
; ---------------------------------------------------------------------------

CSA_0116:					  ; CODE XREF: ROM:00012554j
		move.w	#$010D,d0		  ; Cutscene 0x10D: 0x025648
		move.w	#00090,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jmp	(j_ClearTextbox).l
; ---------------------------------------------------------------------------

CSA_0117:					  ; CODE XREF: ROM:00012558j
		move.b	#$02,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_0118:					  ; CODE XREF: ROM:0001255Cj
		move.b	#$03,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_0119:					  ; CODE XREF: ROM:00012560j
		move.b	#$04,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_011A:					  ; CODE XREF: ROM:00012564j
		move.b	#$05,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_011B:					  ; CODE XREF: ROM:00012568j
		move.b	#$06,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_011C:					  ; CODE XREF: ROM:0001256Cj
		move.w	#$011A,d0		  ; Cutscene 0x11A: 0x025662
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$011B,d0		  ; Cutscene 0x11B: 0x025664
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$011C,d0		  ; Cutscene 0x11C: 0x025666
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$011D,d0		  ; Cutscene 0x11D: 0x025668
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$011E,d0		  ; Cutscene 0x11E: 0x02566A
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$011F,d0		  ; Cutscene 0x11F: 0x02566C
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		clr.w	(g_ControllerPlayback).l
		move.b	#$31,(g_FridayAnimation1).l
		jmp	(j_ClearTextbox).l
; ---------------------------------------------------------------------------

CSA_011D:					  ; CODE XREF: ROM:00012570j
		move.b	#$07,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_011E:					  ; CODE XREF: ROM:00012574j
		move.b	#$08,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_011F:					  ; CODE XREF: ROM:00012578j
		move.b	#$09,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_0120:					  ; CODE XREF: ROM:0001257Cj
		move.b	#$0A,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_0121:					  ; CODE XREF: ROM:00012580j
		move.b	#$0B,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_0122:					  ; CODE XREF: ROM:00012584j
		move.b	#$0C,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_0123:					  ; CODE XREF: ROM:00012588j
		move.w	#$0119,d0		  ; Cutscene 0x119: 0x025660
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jmp	(j_ClearTextbox).l
; ---------------------------------------------------------------------------

CSA_0124:					  ; CODE XREF: ROM:0001258Cj
		move.w	#$00F3,d0		  ; Cutscene 0x0F3: 0x025614
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0125:					  ; CODE XREF: ROM:00012590j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_DogTransform
; ---------------------------------------------------------------------------
		move.b	#$07,(g_LockPlayerActions).l ; Bit 0: Can't pick up items
						  ; Bit	1: Can't attack
						  ; Bit	2: Can't open menu
		bset	#STATUS_NOHEAL,(g_PlayerStatus).l
		move.w	#$814D,(Player_Unk0A).l
		move.b	#SPR_DOG,(Player_SpriteType).l
		move.b	#$01,(Player_Unk6F).l
		lea	(Player_X).l,a1
		move.b	Player_RotationAndSize-Player_X(a1),d1
		bsr.w	SetSpriteRotationAnimFlags
		rts
; ---------------------------------------------------------------------------

CSA_0126:					  ; CODE XREF: ROM:00012594j
		move.w	#$00F4,d0		  ; Cutscene 0x0F4: 0x025616
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0127:					  ; CODE XREF: ROM:00012598j
		move.w	#$00F5,d0		  ; Cutscene 0x0F5: 0x025618
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0128:					  ; CODE XREF: ROM:0001259Cj
		move.w	#$00F6,d0		  ; Cutscene 0x0F6: 0x02561A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0129:					  ; CODE XREF: ROM:000125A0j
		move.w	#$8000,(Player_Unk0A).l
		move.b	#$00,(Player_Unk6F).l
		bclr	#$04,(g_Flags+3).l
		andi.b	#$F8,(g_LockPlayerActions).l ; Bit 0: Can't pick up items
						  ; Bit	1: Can't attack
						  ; Bit	2: Can't open menu
		bclr	#STATUS_NOHEAL,(g_PlayerStatus).l
		jsr	(sub_428).l
		jsr	(j_CopyBasePalleteToActivePalette).l
		lea	(Player_X).l,a1
		move.b	Player_RotationAndSize-Player_X(a1),d1
		bsr.w	SetSpriteRotationAnimFlags
		jsr	(j_LoadSprites).l
		bsr.w	CSA_015A
		move.w	#$00F7,d0		  ; Cutscene 0x0F7: 0x02561C
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_012A:					  ; CODE XREF: ROM:000125A4j
		move.w	#$00FC,d0		  ; Cutscene 0x0FC: 0x025626
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_012B:					  ; CODE XREF: ROM:000125A8j
		bset	#$02,(g_AdditionalFlags+9).l
		move.w	#$0120,d0		  ; Cutscene 0x120: 0x02566E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_012C:					  ; CODE XREF: ROM:000125ACj
		move.w	#$0121,d0		  ; Cutscene 0x121: 0x025670
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_012D:					  ; CODE XREF: ROM:000125B0j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicFanfare2
; ---------------------------------------------------------------------------
		jmp	(j_RestoreBGM).l
; ---------------------------------------------------------------------------

CSA_012E:					  ; CODE XREF: ROM:000125B4j
		move.w	#$0004,d6
		jsr	(j_GenerateRandomNumber).l
		addi.b	#$0A,d7
		move.b	d7,$00000066(a5)
		rts
; ---------------------------------------------------------------------------

CSA_012F:					  ; CODE XREF: ROM:000125B8j
		move.w	#$0003,d6
		jsr	(j_GenerateRandomNumber).l
		addi.b	#$02,d7
		move.b	d7,$00000066(a5)
		rts
; ---------------------------------------------------------------------------

CSA_0130:					  ; CODE XREF: ROM:000125BCj
		move.w	#$0002,d6
		jsr	(j_GenerateRandomNumber).l
		addi.b	#$01,d7
		move.b	d7,$00000066(a5)
		rts
; ---------------------------------------------------------------------------

CSA_0131:					  ; CODE XREF: ROM:000125C0j
		move.w	#$0008,d6
		jsr	(j_GenerateRandomNumber).l
		addi.b	#$01,d7
		move.b	d7,$00000066(a5)
		rts
; ---------------------------------------------------------------------------

CSA_0132:					  ; CODE XREF: ROM:000125C4j
		move.w	#$0122,d0		  ; Cutscene 0x122: 0x025672
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	locret_15046
		bset	#$00,(g_Flags+1).l

locret_15046:					  ; CODE XREF: ROM:0001503Aj
		rts
; ---------------------------------------------------------------------------

CSA_0133:					  ; CODE XREF: ROM:000125C8j
		bset	#$02,(g_Flags+1).l
		cmpi.b	#$0E,(Sprite2_X).l
		beq.s	loc_1506E
		cmpi.b	#$12,(Sprite2_X).l
		beq.s	loc_1506E
		cmpi.b	#$16,(Sprite2_X).l
		bne.s	loc_15094

loc_1506E:					  ; CODE XREF: ROM:00015058j
						  ; ROM:00015062j
		cmpi.b	#$10,(Sprite2_Y).l
		beq.s	loc_1508C
		cmpi.b	#$14,(Sprite2_Y).l
		beq.s	loc_1508C
		cmpi.b	#$18,(Sprite2_Y).l
		bne.s	loc_15094

loc_1508C:					  ; CODE XREF: ROM:00015076j
						  ; ROM:00015080j
		move.w	#$0123,d0		  ; Cutscene 0x123: 0x025674
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

loc_15094:					  ; CODE XREF: ROM:0001506Cj
						  ; ROM:0001508Aj
		move.w	#$0124,d0		  ; Cutscene 0x124: 0x025676
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0134:					  ; CODE XREF: ROM:000125CCj
		btst	#$03,(g_Flags+1).l
		beq.s	loc_150AE
		move.w	#$0129,d0		  ; Cutscene 0x129: 0x025680
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

loc_150AE:					  ; CODE XREF: ROM:000150A4j
		move.w	#$0124,d0		  ; Cutscene 0x124: 0x025676
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0135:					  ; CODE XREF: ROM:000125D0j
		move.w	#$0128,d0		  ; Cutscene 0x128: 0x02567E
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	locret_150D0
		bset	#$00,(g_Flags+1).l

locret_150D0:					  ; CODE XREF: ROM:000150C4j
		rts
; ---------------------------------------------------------------------------

CSA_0136:					  ; CODE XREF: ROM:000125D4j
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		move.b	#$08,d0
		cmpi.b	#$02,d7
		bcs.s	loc_150F4
		move.b	#$02,d0
		cmpi.b	#$1E,d7
		bcs.s	loc_150F4
		move.b	#$01,d0

loc_150F4:					  ; CODE XREF: ROM:000150E4j
						  ; ROM:000150EEj
		move.b	d0,$00000009(a5)
		move.w	#$0008,d6
		jsr	(j_GenerateRandomNumber).l
		addi.b	#$01,d7
		move.b	d7,$00000066(a5)
		rts
; ---------------------------------------------------------------------------

CSA_0137:					  ; CODE XREF: ROM:000125D8j
		move.w	#$012A,d0		  ; Cutscene 0x12A: 0x025682
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	locret_15126
		bset	#$03,(g_AdditionalFlags+9).l

locret_15126:					  ; CODE XREF: ROM:0001511Aj
		rts
; ---------------------------------------------------------------------------

CSA_0138:					  ; CODE XREF: ROM:000125DCj
		move.w	#$012B,d0		  ; Cutscene 0x12B: 0x025684
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	locret_15142
		bset	#$04,(g_AdditionalFlags+9).l

locret_15142:					  ; CODE XREF: ROM:00015136j
		rts
; ---------------------------------------------------------------------------

CSA_0139:					  ; CODE XREF: ROM:000125E0j
		move.w	#$012C,d0		  ; Cutscene 0x12C: 0x025686
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_013A:					  ; CODE XREF: ROM:000125E4j
		bsr.w	CSA_015A
		move.w	#$012F,d0
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_013B:					  ; CODE XREF: ROM:000125E8j
		move.b	#$10,FallRate(a5)
		rts
; ---------------------------------------------------------------------------

CSA_013C:					  ; CODE XREF: ROM:000125ECj
		bsr.w	CSA_015A
		move.w	#$012D,d0		  ; Cutscene 0x12D: 0x025688
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_013D:					  ; CODE XREF: ROM:000125F0j
		bsr.w	CSA_015A
		move.w	#$012E,d0		  ; Cutscene 0x12E: 0x02568A
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_013E:					  ; CODE XREF: ROM:000125F4j
		move.w	#$00C7,d0		  ; Cutscene 0x0C7: 0x0255BC
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_013F:					  ; CODE XREF: ROM:000125F8j
		move.w	#$0130,d0		  ; Cutscene 0x130: 0x02568E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0140:					  ; CODE XREF: ROM:000125FCj
		move.w	#$0131,d0		  ; Cutscene 0x131: 0x025690
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0141:					  ; CODE XREF: ROM:00012600j
		move.w	#$0132,d0		  ; Cutscene 0x132: 0x025692
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0142:					  ; CODE XREF: ROM:00012604j
		move.w	#$0133,d0		  ; Cutscene 0x133: 0x025694
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0143:					  ; CODE XREF: ROM:00012608j
		move.w	#$0134,d0		  ; Cutscene 0x134: 0x025696
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0144:					  ; CODE XREF: ROM:0001260Cj
		bclr	#$07,(Sprite3_Flags2).l
		bclr	#$07,(Sprite3_InitFlags2).l
		bclr	#$04,(Sprite3_Flags2).l
		bclr	#$04,(Sprite3_InitFlags2).l
		rts
; ---------------------------------------------------------------------------

CSA_0145:					  ; CODE XREF: ROM:00012610j
		bsr.w	RestoreBGM_0
		move.w	#$0135,d0		  ; Cutscene 0x135: 0x025698
		bsr.w	LoadCutsceneDialogue
		lea	(Sprite3_X).l,a5
		jsr	(j_HideSprite).l
		rts
; ---------------------------------------------------------------------------

CSA_0146:					  ; CODE XREF: ROM:00012614j
		bclr	#$07,(Sprite2_Flags2).l
		bclr	#$07,(Sprite2_InitFlags2).l
		bclr	#$04,(Sprite2_Flags2).l
		bclr	#$04,(Sprite2_InitFlags2).l
		rts
; ---------------------------------------------------------------------------

CSA_0147:					  ; CODE XREF: ROM:00012618j
		move.w	#$0136,d0		  ; Cutscene 0x136: 0x02569A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0148:					  ; CODE XREF: ROM:0001261Cj
		bsr.w	RestoreBGM_0
		move.w	#$0137,d0		  ; Cutscene 0x137: 0x02569C
		bsr.w	LoadCutsceneDialogue
		lea	(Sprite2_X).l,a5
		jsr	(j_HideSprite).l
		rts
; ---------------------------------------------------------------------------

CSA_0149:					  ; CODE XREF: ROM:00012620j
		bsr.w	CSA_015A
		move.w	#$0138,d0		  ; Cutscene 0x138: 0x02569E
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_014A:					  ; CODE XREF: ROM:00012624j
		bsr.w	CSA_015A
		btst	#$04,(g_AdditionalFlags+$18).l
		bne.s	locret_15272
		move.w	#$0139,d0		  ; Cutscene 0x139: 0x0256A0
		bsr.w	LoadCutsceneDialogue

locret_15272:					  ; CODE XREF: ROM:00015268j
		rts
; ---------------------------------------------------------------------------

CSA_014B:					  ; CODE XREF: ROM:00012628j
		move.w	#$013A,d0		  ; Cutscene 0x13A: 0x0256A2
		bsr.w	LoadCutsceneDialogue
		move.b	#$31,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_014C:					  ; CODE XREF: ROM:0001262Cj
		move.w	#$013F,d0		  ; Cutscene 0x13F: 0x0256AC
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_014D:					  ; CODE XREF: ROM:00012630j
		move.w	#$006F,(g_RmNum1).l	  ; Boss Arena
		move.w	#$1E35,(Player_X).l
		move.w	#$0808,(Player_SubX).l
		bsr.w	SpecialWarp
		clr.w	(g_ControllerPlayback).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_014E:					  ; CODE XREF: ROM:00012634j
		lea	((g_HeightMap+$13E2)).l,a0
		lea	((g_HeightMap+$1476)).l,a1
		lea	((g_HeightMap+$150A)).l,a2
		move.w	#$4000,d0
		or.w	d0,(a0)
		or.w	d0,(a1)
		or.w	d0,(a2)
		or.w	d0,$00000094(a0)
		or.w	d0,$00000094(a1)
		or.w	d0,$00000094(a2)
		or.w	d0,$00000128(a0)
		or.w	d0,$00000128(a1)
		or.w	d0,$00000128(a2)
		or.w	d0,$000001BC(a0)
		or.w	d0,$000001BC(a1)
		or.w	d0,$000001BC(a2)
		or.w	d0,$00000250(a0)
		or.w	d0,$00000250(a1)
		or.w	d0,$00000250(a2)
		or.w	d0,$000002E4(a0)
		or.w	d0,$000002E4(a1)
		or.w	d0,$000002E4(a2)
		or.w	d0,$00000378(a0)
		or.w	d0,$00000378(a1)
		or.w	d0,$00000378(a2)
		or.w	d0,$0000040C(a0)
		or.w	d0,$0000040C(a1)
		or.w	d0,$0000040C(a2)
		or.w	d0,$000004A0(a0)
		or.w	d0,$000004A0(a1)
		or.w	d0,$000004A0(a2)
		or.w	d0,$00000534(a0)
		or.w	d0,$00000534(a1)
		or.w	d0,$00000534(a2)
		or.w	d0,$000005C8(a0)
		or.w	d0,$000005C8(a1)
		or.w	d0,$000005C8(a2)
		or.w	d0,$0000065C(a0)
		or.w	d0,$0000065C(a1)
		or.w	d0,$0000065C(a2)
		or.w	d0,$000006F0(a0)
		or.w	d0,$000006F0(a1)
		or.w	d0,$000006F0(a2)
		or.w	d0,$00000784(a0)
		or.w	d0,$00000784(a1)
		or.w	d0,$00000784(a2)
		or.w	d0,$00000818(a0)
		or.w	d0,$00000818(a1)
		or.w	d0,$00000818(a2)
		or.w	d0,$000008AC(a0)
		or.w	d0,$000008AC(a1)
		or.w	d0,$000008AC(a2)
		or.w	d0,$00000940(a0)
		or.w	d0,$00000940(a1)
		or.w	d0,$00000940(a2)
		move.w	#$0140,d0		  ; Cutscene 0x140: 0x0256AE
		bsr.w	LoadCutsceneDialogue
		bclr	#$06,Flags2(a5)
		bclr	#$06,InitFlags2(a5)
		move.w	#$000C,AnimationIndex(a5)
		move.w	#$0014,AnimationFrame(a5)
		bset	#$07,Unk48(a5)
		movem.l	a5,-(sp)
		jsr	(j_LoadSprites).l
		movem.l	(sp)+,a5
		jsr	(j_EnableDMAQueueProcessing).l
		move.w	#$0005,d0
		jsr	(j_Sleep).l
		move.w	#$000C,AnimationIndex(a5)
		move.w	#$0010,AnimationFrame(a5)
		bset	#$07,Unk48(a5)
		movem.l	a5,-(sp)
		jsr	(j_LoadSprites).l
		movem.l	(sp)+,a5
		jsr	(j_EnableDMAQueueProcessing).l
		move.w	#$0005,d0
		jsr	(j_Sleep).l
		move.w	#$0004,AnimationIndex(a5)
		move.w	#$0000,AnimationFrame(a5)
		bset	#$07,Unk48(a5)
		rts
; ---------------------------------------------------------------------------

CSA_014F:					  ; CODE XREF: ROM:00012638j
		bclr	#$07,(Sprite3_Flags2).l
		bclr	#$07,(Sprite3_InitFlags2).l
		rts
; ---------------------------------------------------------------------------

CSA_0150:					  ; CODE XREF: ROM:0001263Cj
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicFinalRoom
; ---------------------------------------------------------------------------
		move.w	#$0141,d0		  ; Cutscene 0x141: 0x0256B0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0151:					  ; CODE XREF: ROM:00012640j
		move.w	#$0142,d0		  ; Cutscene 0x142: 0x0256B2
		bsr.w	LoadCutsceneDialogue
		move.w	#$0070,(g_RmNum1).l	  ; Gola battle
		bsr.w	SpecialWarp
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_0152:					  ; CODE XREF: ROM:00012644j
		bclr	#$07,(Sprite2_Flags2).l
		bclr	#$07,(Sprite2_InitFlags2).l
		rts
; ---------------------------------------------------------------------------

CSA_0153:					  ; CODE XREF: ROM:00012648j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Fireball1
; ---------------------------------------------------------------------------
		move.w	#$0008,AnimationIndex(a5)
		move.w	#$0004,AnimationFrame(a5)
		bset	#$07,Unk48(a5)
		movem.l	a5,-(sp)
		jsr	(j_LoadSprites).l
		movem.l	(sp)+,a5
		jsr	(j_FlushDMACopyQueue).l
		lea	($0000F180).l,a2
		move.b	#$01,d0
		jsr	(j_LoadMagicSwordEffect).l
		move.l	#$C05A0000,(VDP_CTRL_REG).l
		move.w	#$008C,d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal2Base+$1A).l
		move.w	d1,(g_Pal2Active+$1A).l
		move.w	#$002C,d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal2Base+$1C).l
		move.w	d1,(g_Pal2Active+$1C).l
		moveq	#$00000009,d7

loc_154EE:					  ; CODE XREF: ROM:00015508j
		movem.w	d7,-(sp)
		moveq	#$00000006,d0
		jsr	(j_DoVisualEffect).l
		bsr.s	sub_15530
		jsr	(j_CopyBasePalleteToActivePalette).l
		bsr.s	sub_15530
		movem.w	(sp)+,d7
		dbf	d7,loc_154EE
		move.w	#$0143,d0
		bsr.w	LoadCutsceneDialogue
		jsr	(j_UpdateEquipPal).l
		jsr	(j_CopyBasePalleteToActivePalette).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicFinalBoss
; ---------------------------------------------------------------------------
		lea	(Sprite3_X).l,a5
		jmp	(j_HideSprite).l

; =============== S U B	R O U T	I N E =======================================


sub_15530:					  ; CODE XREF: ROM:000154FAp
						  ; ROM:00015502p
		moveq	#$00000005,d7

loc_15532:					  ; CODE XREF: sub_15530+36j
		bset	#$07,(Sprite3_Unk48).l
		bset	#$00,(Sprite3_Unk48).l
		bset	#$01,(Sprite3_Flags2).l
		movem.w	d7,-(sp)
		movem.l	a5,-(sp)
		jsr	(j_LoadSprites).l
		movem.l	(sp)+,a5
		jsr	(j_FlushDMACopyQueue).l
		movem.w	(sp)+,d7
		dbf	d7,loc_15532
		rts
; End of function sub_15530

; ---------------------------------------------------------------------------

CSA_0154:					  ; CODE XREF: ROM:0001264Cj
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Stop
; ---------------------------------------------------------------------------
		move.w	#00120,d0
		jsr	(j_Sleep).l
	if FIX_GOLA_BUG
		movem.l	a0,-(sp)
		bsr.w	sub_15914
		movem.l	(sp)+,a0
	else
		bsr.w	sub_15914
	endif
; ---------------------------------------------------------------------------
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MirWarp
; ---------------------------------------------------------------------------
		lea	(g_HUD_Row1).l,a1
		move.w	#$07FF,d7

loc_15594:					  ; CODE XREF: ROM:00015598j
		move.w	#$E6B4,(a1)+
		dbf	d7,loc_15594
		jsr	(j_QueueFullHUDTilemapDMA).l
		move.w	#$0071,(g_RmNum1).l	  ; Gola defeated
		move.w	#$1C19,(Player_X).l
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$80,(Player_RotationAndSize).l
		ori.b	#$80,Unk0A(a0)
		jsr	(sub_3FE).l
		jsr	(sub_434).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(j_InitVDP).l
		jsr	(j_FadeFromWhite).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicFinalCutscene
; ---------------------------------------------------------------------------
		bsr.w	CSA_015A
		bsr.w	loc_15852
		move.b	#$6B,(g_FridayAnimation1).l
		move.b	#$21,(g_FridayAnimation2).l
		bsr.w	loc_15852
		move.w	#$0144,d0		  ; Cutscene 0x144: 0x0256B6
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0145,d0		  ; Cutscene 0x145: 0x0256B8
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jsr	(j_ClearTextbox).l
		move.b	#$6D,(g_FridayAnimation1).l
		move.b	#$21,(g_FridayAnimation2).l
		bsr.w	loc_15852
		move.w	#$0146,d0		  ; Cutscene 0x146: 0x0256BA
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0147,d0		  ; Cutscene 0x147: 0x0256BC
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0148,d0		  ; Cutscene 0x148: 0x0256BE
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0149,d0		  ; Cutscene 0x149: 0x0256C0
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$014A,d0		  ; Cutscene 0x14A: 0x0256C2
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jsr	(j_ClearTextbox).l
		move.b	#$69,(g_FridayAnimation1).l
		move.b	#$21,(g_FridayAnimation2).l
		moveq	#$00000003,d7

loc_1568E:					  ; CODE XREF: ROM:0001569Cj
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_FridayMagic
; ---------------------------------------------------------------------------
		move.w	#00052,d0
		jsr	(j_Sleep).l
		dbf	d7,loc_1568E
		bsr.w	loc_15852
		move.w	#$014B,d0		  ; Cutscene 0x14B: 0x0256C4
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$014C,d0		  ; Cutscene 0x14C: 0x0256C6
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$014D,d0		  ; Cutscene 0x14D: 0x0256C8
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$014E,d0		  ; Cutscene 0x14E: 0x0256CA
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$014F,d0		  ; Cutscene 0x14F: 0x0256CC
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0150,d0		  ; Cutscene 0x150: 0x0256CE
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0151,d0		  ; Cutscene 0x151: 0x0256D0
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut0
; ---------------------------------------------------------------------------
		jsr	(j_FadeToBlack).l
		move.w	#00120,d0
		jsr	(j_Sleep).l
		clr.w	d0
		move.b	#$EF,d1
		jsr	(j_MaskVDPReg).l
		jsr	(j_PlayEndCredits).l
		jmp	(j_EndGame).l
; ---------------------------------------------------------------------------

CSA_0155:					  ; CODE XREF: ROM:00012650j
		lea	(Sprite2_X).l,a5
		jmp	(j_HideSprite).l
; ---------------------------------------------------------------------------

CSA_0156:					  ; CODE XREF: ROM:00012654j
		lea	(Sprite3_X).l,a5
		jmp	(j_HideSprite).l
; ---------------------------------------------------------------------------

CSA_0157:					  ; CODE XREF: ROM:00012658j
		lea	(Sprite3_X).l,a1
		moveq	#$0000000D,d7

loc_15744:					  ; CODE XREF: ROM:0001578Aj
		tst.b	(a1)
		bmi.s	locret_1578E
		tst.w	$00000012(a1)
		bne.s	loc_15786
		move.w	InitX(a1),X(a1)
		move.w	InitSubX(a1),SubX(a1)
		move.w	InitRotAndSize(a1),RotationAndSize(a1)
		move.w	InitZ(a1),Z(a1)
		movem.l	a1/a5,-(sp)
		jsr	(sub_1038E).l
		jsr	(sub_3BC).l
		movem.l	(sp)+,a1/a5
		bcc.s	loc_15780
		clr.w	Z(a1)
		bra.s	loc_15786
; ---------------------------------------------------------------------------

loc_15780:					  ; CODE XREF: ROM:00015778j
		addq.b	#$01,(g_AdditionalFlags+$11).l

loc_15786:					  ; CODE XREF: ROM:0001574Cj
						  ; ROM:0001577Ej
		lea	SPRITE_SIZE(a1),a1
		dbf	d7,loc_15744

locret_1578E:					  ; CODE XREF: ROM:00015746j
		rts
; ---------------------------------------------------------------------------

CSA_0158:					  ; CODE XREF: ROM:0001265Cj
		bset	#$02,(g_Flags+1).l
		clr.l	d0
		move.b	(g_AdditionalFlags+$11).l,d0
		movem.l	d0,-(sp)
		cmp.b	(g_AdditionalFlags+$1B).l,d0
		bls.s	loc_157C0
		move.b	d0,(g_AdditionalFlags+$1B).l
		move.l	d0,(g_PrintNumericDwordValue).l
		move.w	#$0126,d0		  ; Cutscene 0x126: 0x02567A
		bsr.w	LoadCutsceneDialogue

loc_157C0:					  ; CODE XREF: ROM:000157AAj
		movem.l	(sp)+,d1
		mulu.w	#$0005,d1
		move.l	d1,(g_PrintNumericDwordValue).l
		move.w	#$0127,d0		  ; Cutscene 0x127: 0x02567C
		tst.b	d1
		bne.s	loc_157DA
		move.w	#$0124,d0

loc_157DA:					  ; CODE XREF: ROM:000157D4j
		bsr.w	LoadCutsceneDialogue
		bsr.w	MarkHUDForUpdate
		bsr.w	RefreshHUD
		lea	(Sprite3_X).l,a1
		moveq	#$0000000D,d7

loc_157EE:					  ; CODE XREF: ROM:00015802j
		tst.b	(a1)
		bmi.s	locret_15806
		move.b	#$01,Speed(a1)
		bclr	#$05,Flags2(a1)
		lea	SPRITE_SIZE(a1),a1
		dbf	d7,loc_157EE

locret_15806:					  ; CODE XREF: ROM:000157F0j
		rts
; ---------------------------------------------------------------------------

CSA_0159:					  ; CODE XREF: ROM:00012660j
		clr.l	d0
		move.b	(g_AdditionalFlags+$1B).l,d0 ; Chicken toss room record
		move.l	d0,(g_PrintNumericDwordValue).l
		move.w	#$0125,d0		  ; Cutscene 0x125: 0x025678
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	locret_15836
		bset	#$00,(g_Flags+1).l
		clr.b	(g_AdditionalFlags+$11).l

locret_15836:					  ; CODE XREF: ROM:00015824j
		rts

; =============== S U B	R O U T	I N E =======================================


CSA_015A:					  ; CODE XREF: ROM:00012664j
						  ; ROM:CSA_0004p ...
		move.b	#$01,(g_FridayAnimation1).l
		move.b	#$21,(g_FridayAnimation2).l
		rts
; End of function CSA_015A


; =============== S U B	R O U T	I N E =======================================


sub_1584A:					  ; CODE XREF: ROM:00012816p
						  ; ROM:00012990p ...
		move.b	#$41,(g_FridayAnimation2).l

loc_15852:					  ; CODE XREF: ROM:00013534p
						  ; ROM:00013550p ...
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#$21,(g_FridayAnimation1).l
		beq.s	locret_1586C
		cmpi.b	#$22,(g_FridayAnimation1).l
		bne.s	loc_15852

locret_1586C:					  ; CODE XREF: sub_1584A+16j
		rts
; End of function sub_1584A


; =============== S U B	R O U T	I N E =======================================


SetRoomNumber:					  ; CODE XREF: ROM:000132F6p
						  ; ROM:00013C8Ap
		move.w	d0,(g_RmNum1).l
		move.w	d0,(RmNum2).l
		rts
; End of function SetRoomNumber


; =============== S U B	R O U T	I N E =======================================


sub_1587C:					  ; CODE XREF: ROM:00012732p
						  ; ROM:00012788p ...
		ext.w	d0
		ext.w	d1
		lsl.w	#$06,d0
		lsl.w	#$06,d1
		movem.w	d0-d1,-(sp)
		lea	(unk_FF1440).l,a0
		lea	(unk_FF1440).l,a1
		adda.w	d0,a0
		adda.w	d1,a1
		move.w	#$001F,d7

loc_1589C:					  ; CODE XREF: sub_1587C+26j
		move.w	(a0),d2
		move.w	(a1),(a0)+
		move.w	d2,(a1)+
		dbf	d7,loc_1589C
		movem.w	(sp)+,d0-d1
		add.w	d0,d0
		add.w	d1,d1
		lea	(Sprite1_X).l,a0
		lea	(Sprite1_X).l,a1
		adda.w	d0,a0
		adda.w	d1,a1
		move.w	RotationAndSize(a0),d0
		move.w	RotationAndSize(a1),RotationAndSize(a0)
		move.w	d0,RotationAndSize(a1)
		move.w	TileSource(a0),d0
		move.w	TileSource(a1),TileSource(a0)
		move.w	d0,TileSource(a1)
		move.w	Unk0A(a0),d0
		move.w	Unk0A(a1),Unk0A(a0)
		move.w	d0,Unk0A(a1)
		move.l	AnimationIndex(a0),d0
		move.l	AnimationIndex(a1),AnimationIndex(a0)
		move.l	d0,AnimationIndex(a1)
		move.b	SpriteType(a0),d0
		move.b	SpriteType(a1),SpriteType(a0)
		move.b	d0,SpriteType(a1)
		move.w	Unk6E(a0),d0
		move.w	Unk6E(a1),Unk6E(a0)
		move.w	d0,Unk6E(a1)
		rts
; End of function sub_1587C


; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn

sub_15914:					  ; CODE XREF: ROM:0001557Ep
		bsr.s	sub_15972
		bsr.w	sub_159DE
		bsr.w	sub_159FA
		move.w	#$0200,(dword_FF1804).l
		move.w	#$0200,(word_FF1808).l
		move.w	#$0E00,(word_FF180C).l

loc_15936:					  ; CODE XREF: sub_15914+44j
		bsr.w	sub_159AE
		bsr.w	loc_15A96
	if ENABLE_GOLD_COUNT_AT_END
		move.w	#00013,d0
		jsr	(AddGold).l
		jsr	(j_QueueHUDTilemapDMA).l
	endif
		jsr	(j_FlushDMACopyQueue).l
		bsr.w	sub_1595C
		bra.w	loc_15936
; End of function sub_15914


; =============== S U B	R O U T	I N E =======================================


sub_1595C:					  ; CODE XREF: sub_15914+40p
		movea.l	a1,a0
		move.w	d6,d7

loc_15960:					  ; CODE XREF: sub_1595C+Cj
		tst.w	RotationAndSize(a0)
		bne.s	locret_15970
		addq.w	#$08,a0
		dbf	d7,loc_15960
		movem.l	(sp)+,a0

locret_15970:					  ; CODE XREF: sub_1595C+8j
		rts
; End of function sub_1595C


; =============== S U B	R O U T	I N E =======================================


sub_15972:					  ; CODE XREF: sub_15914p
		moveq	#$00000007,d7
		move.w	#$0001,(word_FF1800).l

loc_1597C:					  ; CODE XREF: sub_15972+36j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Rumble
; ---------------------------------------------------------------------------
		movem.w	d7,-(sp)
		move.w	#$0027,d6

loc_15988:					  ; CODE XREF: sub_15972+1Ej
		bsr.s	sub_159AE
		jsr	(j_WaitUntilVBlank).l
		dbf	d6,loc_15988
		cmpi.w	#$0004,(word_FF1800).l
		bcc.s	loc_159A4
		addq.w	#$01,(word_FF1800).l

loc_159A4:					  ; CODE XREF: sub_15972+2Aj
		movem.w	(sp)+,d7
		dbf	d7,loc_1597C
		rts
; End of function sub_15972


; =============== S U B	R O U T	I N E =======================================


sub_159AE:					  ; CODE XREF: sub_15914:loc_15936p
						  ; sub_15972:loc_15988p
		movem.l	d0-a6,-(sp)
		move.w	(word_FF1800).l,d0
		add.w	d0,(g_VSRAMData).l
		add.w	d0,(g_VSRAMData+2).l
		neg.w	d0
		move.w	d0,(word_FF1800).l
		jsr	(j_QueueVSRAMUpdate).l
		jsr	(j_EnableDMAQueueProcessing).l
		movem.l	(sp)+,d0-a6
		rts
; End of function sub_159AE


; =============== S U B	R O U T	I N E =======================================


sub_159DE:					  ; CODE XREF: sub_15914+2p
		move.b	#$05,(g_EquippedSword).l
		jsr	(j_LoadMagicSwordGfx).l
		jsr	(j_UpdateEquipPal).l
		jsr	(j_CopyBasePalleteToActivePalette).l
		rts
; End of function sub_159DE


; =============== S U B	R O U T	I N E =======================================


sub_159FA:					  ; CODE XREF: sub_15914+6p
		lea	(g_VDPSpr16_Y).l,a0
		move.b	#$10,d3
		move.w	#$003E,d7

loc_15A08:					  ; CODE XREF: sub_159FA+16j
		tst.w	(a0)
		beq.s	loc_15A14
		addq.b	#$01,d3
		addq.w	#$08,a0
		dbf	d7,loc_15A08

loc_15A14:					  ; CODE XREF: sub_159FA+10j
		cmpi.b	#$28,d7
		bcs.s	loc_15A1E
		move.b	#$28,d7

loc_15A1E:					  ; CODE XREF: sub_159FA+1Ej
		move.b	d3,(g_VDPSpr15_Link).l
		movea.l	a0,a1
		move.w	d7,d6
		move.w	#$C78C,d0
		clr.b	d1
		move.w	#$0004,d4
		clr.b	d5
		movem.w	d6-d7,-(sp)

loc_15A38:					  ; CODE XREF: sub_159FA+86j
		movem.w	d7,-(sp)
		move.w	#$00E0,d6
		jsr	(j_GenerateRandomNumber).l
		subi.w	#$0060,d7
		move.w	d7,(a0)
		move.b	#$0F,$00000002(a0)
		move.w	d0,$00000004(a0)
		move.w	#$0140,d6
		jsr	(j_GenerateRandomNumber).l
		addi.w	#$0080,d7
		move.w	d7,$00000006(a0)
		addi.w	#$0010,d0
		addq.b	#$01,d1
		cmpi.b	#$03,d1
		bcs.s	loc_15A7A
		clr.b	d1
		subi.w	#$0030,d0

loc_15A7A:					  ; CODE XREF: sub_159FA+78j
		addq.w	#$08,a0
		movem.w	(sp)+,d7
		dbf	d7,loc_15A38
		movem.w	(sp)+,d6-d7
		move.w	#$0001,-$00000008(a0)
		move.b	#$10,-$00000005(a0)
		rts
; End of function sub_159FA

; ---------------------------------------------------------------------------

loc_15A96:					  ; CODE XREF: sub_15914+26p
		movea.l	a1,a0
		move.w	d6,d7
		clr.b	d0

loc_15A9C:					  ; CODE XREF: ROM:00015B42j
		tst.l	$00000004(a0)
		beq.w	loc_15B40
		move.w	#$0007,d1
		cmpi.w	#$C78C,$00000004(a0)
		beq.s	loc_15AC0
		move.w	#$0005,d1
		cmpi.w	#$C79C,$00000004(a0)
		beq.s	loc_15AC0
		move.w	#$0003,d1

loc_15AC0:					  ; CODE XREF: ROM:00015AAEj
						  ; ROM:00015ABAj
		add.w	d1,(a0)
		tst.w	(a0)
		bmi.s	loc_15B40
		cmpi.w	#$0138,(a0)
		bcs.s	loc_15B40
		cmpi.b	#$0C,d5
		bne.s	loc_15AE2
		clr.w	(a0)
		clr.b	$00000002(a0)
		clr.w	$00000004(a0)
		clr.w	$00000006(a0)
		bra.s	loc_15B40
; ---------------------------------------------------------------------------

loc_15AE2:					  ; CODE XREF: ROM:00015AD0j
		move.w	#$0088,(a0)
		movem.w	d6-d7,-(sp)
		move.w	#$0140,d6
		jsr	(j_GenerateRandomNumber).l
		addi.w	#$0080,d7
		move.w	d7,$00000006(a0)
		btst	#$02,d7
		bne.s	loc_15B32
		movem.w	d0,-(sp)
		move.b	#SND_HealthRecover1,d0
		andi.b	#$03,d7
		beq.s	loc_15B28
		move.b	#SND_CursorMove,d0
		cmpi.b	#$01,d7
		beq.s	loc_15B28
		move.b	#SND_CursorSelect,d0
		cmpi.b	#$02,d7
		beq.s	loc_15B28
		move.b	#SND_SwordHit,d0

loc_15B28:					  ; CODE XREF: ROM:00015B0Ej
						  ; ROM:00015B18j ...
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_LoadFromD0
; ---------------------------------------------------------------------------
		movem.w	(sp)+,d0
		bra.s	loc_15B3C
; ---------------------------------------------------------------------------

loc_15B32:					  ; CODE XREF: ROM:00015B00j
		btst	#$03,d7
		bne.s	loc_15B3C
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Rumble
; ---------------------------------------------------------------------------

loc_15B3C:					  ; CODE XREF: ROM:00015B30j
						  ; ROM:00015B36j
		movem.w	(sp)+,d6-d7

loc_15B40:					  ; CODE XREF: ROM:00015AA0j
						  ; ROM:00015AC4j ...
		addq.w	#$08,a0
		dbf	d7,loc_15A9C
		cmpi.w	#$00F8,-$00000008(a0)
		bcs.s	locret_15B7A
		move.w	#$0001,-$00000008(a0)
		addq.b	#$01,d5
		cmpi.b	#$03,d5
		bcs.s	loc_15B64
		cmpi.b	#$0A,d5
		bcc.s	loc_15B64
		bsr.s	sub_15B7C

loc_15B64:					  ; CODE XREF: ROM:00015B5Aj
						  ; ROM:00015B60j
		cmpi.b	#$0C,d5
		bcs.s	locret_15B7A
		clr.w	-$00000008(a0)
		clr.b	-$00000006(a0)
		clr.w	-$00000004(a0)
		clr.w	-$00000002(a0)

locret_15B7A:					  ; CODE XREF: ROM:00015B4Cj
						  ; ROM:00015B68j
		rts

; =============== S U B	R O U T	I N E =======================================


sub_15B7C:					  ; CODE XREF: ROM:00015B62p
		movem.l	d0-a6,-(sp)
		bsr.s	sub_15B88
		movem.l	(sp)+,d0-a6
		rts
; End of function sub_15B7C


; =============== S U B	R O U T	I N E =======================================


sub_15B88:					  ; CODE XREF: sub_15B7C+4p
		move.w	(dword_FF1804).l,d3
		move.w	(word_FF1808).l,d4
		move.w	(word_FF180C).l,d7
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		move.w	#$003F,d5

loc_15BAA:					  ; CODE XREF: sub_15B88+28j
		move.w	(a0)+,d0
		bsr.s	sub_15BD0
		move.w	d0,(a1)+
		dbf	d5,loc_15BAA
		jsr	(j_QueueFullPaletteDMA).l
		add.w	d4,d3
		move.w	d3,(dword_FF1804).l
		move.w	d4,(word_FF1808).l
		move.w	d7,(word_FF180C).l
		rts
; End of function sub_15B88


; =============== S U B	R O U T	I N E =======================================


sub_15BD0:					  ; CODE XREF: sub_15B88+24p
		move.w	d0,d1
		andi.w	#$0E00,d1
		add.w	d3,d1
		andi.w	#$1E00,d1
		cmpi.w	#$1000,d1
		bcs.s	loc_15BE4
		move.w	d7,d1

loc_15BE4:					  ; CODE XREF: sub_15BD0+10j
		lsr.w	#$04,d3
		lsr.w	#$04,d7
		move.w	d0,d2
		andi.w	#$00E0,d2
		add.w	d3,d2
		andi.w	#$01E0,d2
		cmpi.w	#$0100,d2
		bcs.s	loc_15BFC
		move.w	d7,d2

loc_15BFC:					  ; CODE XREF: sub_15BD0+28j
		lsr.w	#$04,d3
		lsr.w	#$04,d7
		andi.w	#$000E,d0
		add.w	d3,d0
		andi.w	#$001E,d0
		cmpi.w	#$0010,d0
		bcs.s	loc_15C12
		move.w	d7,d0

loc_15C12:					  ; CODE XREF: sub_15BD0+3Ej
		lsl.w	#$08,d3
		lsl.w	#$08,d7
		or.w	d2,d0
		or.w	d1,d0
		rts
; End of function sub_15BD0

