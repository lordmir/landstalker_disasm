; ---------------------------------------------------------------------------

StartGame:					  ; CODE XREF: ROM:000016CEp
						  ; DATA XREF: j_StartGamet
		jsr	(DisableDisplayAndInts).l
		move.l	#$C0760000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		move.w	#$0000,(g_Pal3Active+$16).l
		move.w	#$0000,(g_Pal3Base+$16).l
		bsr.w	LoadStatusBarGfx
		bsr.w	InitHUD
		jsr	(EnableDisplayAndInts).l
		bsr.w	QueueFullHUDTilemapDMA
		bsr.w	InitPalettes
		jsr	(DisableVDPSpriteUpdate).l
		jsr	(FlushDMACopyQueue).l
		bsr.w	LoadHUDSprites
		bsr.w	InitScrollRegs
		bsr.w	InitBlocks
		cmpi.w	#$008B,(g_RmNum1).l
		beq.s	Intro
		jsr	(j_RefreshAllHUD).l
		jsr	(j_RefreshHUD).l
		jmp	(FadeFromBlack).l
; ---------------------------------------------------------------------------

Intro:						  ; CODE XREF: ROM:00008DE2j
		move.b	#$01,(g_IntroStringToDisplay).l
		bsr.w	CheckAndDisplayIntroString
		jsr	(EnableDMAQueueProcessing).l
		move.w	#$0222,d1
		move.w	#$0005,d7

loc_8E10:					  ; CODE XREF: ROM:00008E3Aj
		move.l	#$C0760000,(VDP_CTRL_REG).l
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal3Active+$16).l
		move.w	d1,(g_Pal3Base+$16).l
		move.w	#$0004,d0
		jsr	(Sleep).l		  ; Sleeps for d0 frames
		addi.w	#$0222,d1
		dbf	d7,loc_8E10
		move.l	#$C07E0000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		move.w	#$0000,(g_Pal3Active+$1E).l
		move.w	#$0000,(g_Pal3Base+$1E).l
		move.w	#00060,d0
		jsr	(Sleep).l		  ; Sleeps for d0 frames
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicLabrynth
; ---------------------------------------------------------------------------
		move.b	#SND_MusicLabrynth,(g_BGM).l
		move.w	#00120,d0
		jsr	(Sleep).l		  ; Sleeps for d0 frames
		lea	StatusBarPal(pc),a0
		lea	((g_Pal3Base+$14)).l,a1
		move.w	#$0004,d0
		jsr	(WordCopy).l
		jsr	FadeInFromDarkness(pc)
		nop
		rts

; =============== S U B	R O U T	I N E =======================================


sub_8E9C:					  ; CODE XREF: ROM:00002EB4j
						  ; sub_620A+12p ...
		bsr.s	InitVDP
		bra.s	FadeInFromDarkness
; End of function sub_8E9C


; =============== S U B	R O U T	I N E =======================================


InitVDP:					  ; CODE XREF: sub_620A+FAp
						  ; sub_620A+136p ...
		jsr	(j_RefreshAndClearTextbox).l
		bsr.w	LoadHUDSprites
		bsr.w	InitScrollRegs
		bsr.w	InitBlocks
		rts
; End of function InitVDP


; =============== S U B	R O U T	I N E =======================================


FadeInFromDarkness:				  ; CODE XREF: CheckForMenuOpen+92p
						  ; sub_8E9C+2j
						  ; DATA XREF: ...
		move.w	#$8AB8,(g_VDPReg10_HIntLine).l
		move.w	#$8AB8,(VDP_CTRL_REG).l	  ; HINT on line 184
		jsr	(InitFadeFromBlackParams).l
		move.w	#$0006,d6

loc_8ECE:					  ; CODE XREF: FadeInFromDarkness+3Aj
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		move.w	#$0039,d5
		jsr	(DarkenPalette).l
		move.w	#$0002,d0
		jsr	(Sleep).l		  ; Sleeps for d0 frames
		dbf	d6,loc_8ECE
		rts
; End of function FadeInFromDarkness


; =============== S U B	R O U T	I N E =======================================


FadeOutToDarkness:				  ; CODE XREF: ROM:00002E56p
						  ; sub_620A:WarpToRoomp ...
		jsr	(InitFadeToBlackParams).l
		move.w	#$0006,d6

loc_8EFE:					  ; CODE XREF: FadeOutToDarkness+2Aj
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		move.w	#$0039,d5
		jsr	(DarkenPalette).l
		move.w	#$0002,d0
		jsr	(Sleep).l		  ; Sleeps for d0 frames
		dbf	d6,loc_8EFE
		move.w	#$8A18,(g_VDPReg10_HIntLine).l ; HINT on line 24
		move.w	#$8A18,(VDP_CTRL_REG).l
		rts
; End of function FadeOutToDarkness


; =============== S U B	R O U T	I N E =======================================


LoadStatusBarGfx:				  ; CODE XREF: ROM:00008DACp
		lea	StatusBarGfx(pc),a0
		nop
		lea	(g_Buffer).l,a1
		lea	($0000D680).l,a2
		jmp	(LoadCompressedGfx).l	  ; a0 - compressed graphics source
; End of function LoadStatusBarGfx		  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination

; =============== S U B	R O U T	I N E =======================================


InitHUD:					  ; CODE XREF: ROM:00008DB0p
		bsr.w	LoadHUDTiles
		lea	VDPRegs(pc),a0		  ; Window position 0,3
						  ; HInt enabled, HV Counter enabled
						  ; HInt on line 184
						  ; Ext	interrupt disabled, H+V	FULL SCROLL
		moveq	#$00000004,d1

loc_8F56:					  ; CODE XREF: InitHUD+12j
		move.w	(a0)+,d0
		jsr	(SetVDPReg).l
		dbf	d1,loc_8F56
		rts
; End of function InitHUD

; ---------------------------------------------------------------------------
VDPRegs:	dc.w $9100			  ; DATA XREF: InitHUD+4t
		dc.w $9203			  ; Window position 0,3
		dc.w $8014			  ; HInt enabled, HV Counter enabled
		dc.w $8AB8			  ; HInt on line 184
		dc.w $8B00			  ; Ext	interrupt disabled, H+V	FULL SCROLL

; =============== S U B	R O U T	I N E =======================================


LoadHUDTiles:					  ; CODE XREF: InitHUDp
		cmpi.w	#$008B,(g_RmNum1).l	  ; Intro start
		bne.s	loc_8F8C
		lea	(g_HUD_Row1).l,a1	  ; Blank HUD
		move.w	#$07FF,d7

loc_8F82:					  ; CODE XREF: LoadHUDTiles+18j
		move.w	#$E6B4,(a1)+
		dbf	d7,loc_8F82
		rts
; ---------------------------------------------------------------------------

loc_8F8C:					  ; CODE XREF: LoadHUDTiles+8j
		lea	StatusBarTilemap(pc),a0
		lea	(g_HUD_Row1).l,a1
		move.w	#$0002,d7

loc_8F9A:					  ; CODE XREF: LoadHUDTiles+40j
		move.w	#$0027,d6

loc_8F9E:					  ; CODE XREF: LoadHUDTiles+38j
		move.w	(a0)+,d0
		ori.w	#$6000,d0
		move.w	d0,(a1)+
		dbf	d6,loc_8F9E
		adda.w	#$0030,a1
		dbf	d7,loc_8F9A
		rts
; End of function LoadHUDTiles


; =============== S U B	R O U T	I N E =======================================


LoadPlayerPalette:				  ; CODE XREF: sub_2AF2+50p
						  ; InitPalettesp
						  ; DATA XREF: ...
		lea	DefaultPlayerPal(pc),a0
		lea	(g_Pal2Base).l,a1
		move.w	#$000F,d0
		jsr	(WordCopy).l
		bra.w	UpdateEquipPal
; End of function LoadPlayerPalette


; =============== S U B	R O U T	I N E =======================================


InitPalettes:					  ; CODE XREF: ROM:00008DBEp
		bsr.s	LoadPlayerPalette
		lea	StatusBarPal(pc),a0
		lea	((g_Pal3Base+$14)).l,a1
		move.w	#$0004,d0
		jsr	(WordCopy).l
		lea	(g_Pal0Base).l,a0
		clr.w	(a0)			  ; Colour 0 - Always transparent
		clr.w	$00000020(a0)
		clr.w	$00000040(a0)
		clr.w	$00000060(a0)
		move.w	#$0CCC,d0		  ; Colour 1 - Always light grey
		move.w	d0,$00000002(a0)
		move.w	d0,$00000022(a0)
		move.w	d0,$00000042(a0)
		move.w	d0,$00000062(a0)
		clr.w	$0000001E(a0)		  ; Colour 15 -	Always black
		clr.w	$0000003E(a0)
		clr.w	$0000005E(a0)
		clr.w	$0000007E(a0)
		rts
; End of function InitPalettes

; ---------------------------------------------------------------------------
