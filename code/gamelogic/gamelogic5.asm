GameLogic5	module
; Post-load game start: sets up the HUD (status bar gfx, window plane
; VDP regs, palettes, HUD sprites), scroll registers and blocks. A
; save in room $8B (the first intro room) runs the intro sequence
; instead of the normal HUD refresh + fade.
StartGame:

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
		cmpi.w	#ROOM_INTRO_START,(g_CurrentRoom).l
		beq.s	Intro
		jsr	(j_RefreshAllHUD).l
		jsr	(j_RefreshHUD).l
		jmp	(FadeFromBlack).l

; Intro wake-up: shows the intro string with a blank HUD, fades the
; textbox colour in over six steps, starts the Labrynth music, then
; loads the intro status bar palette and fades the room in.
Intro:
		move.b	#$01,(g_IntroStringToDisplay).l
		bsr.w	CheckAndDisplayIntroString
		jsr	(EnableDMAQueueProcessing).l
		move.w	#$0222,d1
		move.w	#$0005,d7

_introFadeLoop:
		move.l	#$C0760000,(VDP_CTRL_REG).l
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal3Active+$16).l
		move.w	d1,(g_Pal3Base+$16).l
		move.w	#$0004,d0
		jsr	(Sleep).l
		addi.w	#$0222,d1
		dbf	d7,_introFadeLoop
		move.l	#$C07E0000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		move.w	#$0000,(g_Pal3Active+$1E).l
		move.w	#$0000,(g_Pal3Base+$1E).l
		move.w	#60,d0
		jsr	(Sleep).l
		trap	#$00
		dc.w SND_MusicLabrynth
		move.b	#SND_MusicLabrynth,(g_BGM).l
		move.w	#120,d0
		jsr	(Sleep).l
		lea	StatusBarPal(pc),a0
		lea	((g_Pal3Base+$14)).l,a1
		move.w	#$0004,d0
		jsr	(WordCopy).l
		jsr	FadeInFromDarkness(pc)
		nop
		rts


InitRoomDisplayAndFadeIn:
		bsr.s	InitRoomDisplay
		bra.s	FadeInFromDarkness


; Re-initialises the room display after a room load: textbox, HUD
; sprites, scroll registers and block tables.
InitRoomDisplay:
		jsr	(j_RefreshAndClearTextbox).l
		bsr.w	LoadHUDSprites
		bsr.w	InitScrollRegs
		bsr.w	InitBlocks
		rts


; Six-step palette fade-in, then moves the HInt line back to 184 (the
; HUD split during gameplay).
FadeInFromDarkness:

		move.w	#$8AB8,(g_VDPReg10_HIntLine).l
		move.w	#$8AB8,(VDP_CTRL_REG).l	  ; HINT on line 184
		jsr	(InitFadeFromBlackParams).l
		move.w	#$0006,d6

_fadeInLoop:
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		move.w	#$0039,d5
		jsr	(DarkenPalette).l
		move.w	#$0002,d0
		jsr	(Sleep).l
		dbf	d6,_fadeInLoop
		rts


; Six-step palette fade-out, then parks the HInt line at 24 while the
; screen is dark.
FadeOutToDarkness:
		jsr	(InitFadeToBlackParams).l
		move.w	#$0006,d6

_fadeOutLoop:
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		move.w	#$0039,d5
		jsr	(DarkenPalette).l
		move.w	#$0002,d0
		jsr	(Sleep).l
		dbf	d6,_fadeOutLoop
		move.w	#$8A18,(g_VDPReg10_HIntLine).l ; HINT on line 24
		move.w	#$8A18,(VDP_CTRL_REG).l
		rts


LoadStatusBarGfx:
		lea	StatusBarGfx(pc),a0
		nop
		lea	(g_Buffer).l,a1
		lea	($D680).l,a2
		jmp	(LoadCompressedGfx).l


; Loads the HUD tilemap and programs the window plane + HInt VDP
; registers (VDPRegs below).
InitHUD:
		bsr.w	LoadHUDTiles
		lea	VDPRegs(pc),a0
		moveq	#$4,d1

_regLoop:
		move.w	(a0)+,d0
		jsr	(SetVDPReg).l
		dbf	d1,_regLoop
		rts

VDPRegs:	dc.w $9100
		dc.w $9203			  ; Window position 0,3
		dc.w $8014			  ; HInt enabled, HV Counter enabled
		dc.w $8AB8			  ; HInt on line 184
		dc.w $8B00			  ; Ext	interrupt disabled, H+V	FULL SCROLL


; Fills the HUD window tilemap rows: blank tiles when starting the
; intro (room $8B), else the status bar tilemap at palette 3 /
; priority.
LoadHUDTiles:
		cmpi.w	#ROOM_INTRO_START,(g_CurrentRoom).l	  ; Intro start
		bne.s	_copyTilemap
		lea	(g_HUD_Row1).l,a1	  ; Blank HUD
		move.w	#$07FF,d7

_blankLoop:
		move.w	#$E6B4,(a1)+
		dbf	d7,_blankLoop
		rts

_copyTilemap:
		lea	StatusBarTilemap(pc),a0
		lea	(g_HUD_Row1).l,a1
		move.w	#$0002,d7

_rowLoop:
		move.w	#$0027,d6

_cellLoop:
		move.w	(a0)+,d0
		ori.w	#$6000,d0
		move.w	d0,(a1)+
		dbf	d6,_cellLoop
		adda.w	#$0030,a1
		dbf	d7,_rowLoop
		rts


LoadPlayerPalette:
		lea	DefaultPlayerPal(pc),a0
		lea	(g_Pal2Base).l,a1
		move.w	#$000F,d0
		jsr	(WordCopy).l
		bra.w	UpdateEquipPal


; Player palette + status bar palette, then the fixed colours shared
; by all four palettes: 0 transparent, 1 light grey, 15 black.
InitPalettes:
		bsr.s	LoadPlayerPalette
		lea	StatusBarPal(pc),a0
		lea	((g_Pal3Base+$14)).l,a1
		move.w	#$0004,d0
		jsr	(WordCopy).l
		lea	(g_Pal0Base).l,a0
		clr.w	(a0)			  ; Colour 0 - Always transparent
		clr.w	$20(a0)
		clr.w	$40(a0)
		clr.w	$60(a0)
		move.w	#$0CCC,d0		  ; Colour 1 - Always light grey
		move.w	d0,$2(a0)
		move.w	d0,$22(a0)
		move.w	d0,$42(a0)
		move.w	d0,$62(a0)
		clr.w	$1E(a0)		  ; Colour 15 -	Always black
		clr.w	$3E(a0)
		clr.w	$5E(a0)
		clr.w	$7E(a0)
		rts

		modend
