GameSelectScreen3	module
; Save-window drawing, palette fades and the arrow-cursor menus for
; the select screen (gameloadscreen1). Shares the a6 stack frame of
; InitGameSelectScreen: -$02 cursor slot, -$0A arrow blink tick,
; -$0C action, -$0E palette fade budget. Window text strips: each
; save window owns 14 columns of tiles ($216/$232/$24E/$26A), the
; action bar the 34 columns from $286 (= VRAM $50C0, the target of
; DMACopyTextBuffer).

; First-time screen setup: blank the four windows' location-text
; tiles (28 tiles at $380-byte VRAM steps from $42C0 = tile $216),
; number the action bar's tile strip into the buffer at row 23,
; then draw all four save windows.
InitGameStartScreen:
		bsr.w	ClearTextBuffer
		lea	($000042C0).w,a1
		moveq	#$00000003,d7

_issBlank:
		movem.l	d7/a1,-(sp)
		lea	(g_ScreenBuffer).l,a0
		move.w	#$01C0,d0
		moveq	#$00000002,d1
		jsr	(j_DoDMACopy).l
		movem.l	(sp)+,d7/a1
		lea	$00000380(a1),a1
		dbf	d7,_issBlank
		move.w	#$0286,d0
		lea	((g_Buffer+$738)).l,a1
		move.w	#$0021,d7
		bsr.w	WriteTileStrip
		moveq	#$00000003,d0

_issWindows:
		move.l	d0,-(sp)
		bsr.w	_drawSaveWindow
		move.l	(sp)+,d0
		dbf	d0,_issWindows
		bsr.w	CopySaveScreenToPlaneA
		rts

; Redraws save window d0 and pushes the screen to plane A.
RedrawSaveWindow:
		bsr.s	_drawSaveWindow
		bsr.w	CopySaveScreenToPlaneA
		rts

; Draws save window d0 into its buffer spot (a5) with its text
; strip base tile, preserving g_SaveSlot around the render.
_drawSaveWindow:
		move.b	(g_SaveSlot).l,d1
		move.l	d1,-(sp)
		move.b	d0,(g_SaveSlot).l
		cmpi.b	#$01,d0
		bcc.s	_dswSlot1
		lea	((g_Buffer+$56)).l,a5
		move.w	#$0216,d0
		bra.s	_dswRender

_dswSlot1:
		bne.s	_dswSlot23
		lea	((g_Buffer+$7A)).l,a5
		move.w	#$0232,d0
		bra.s	_dswRender

_dswSlot23:
		cmpi.b	#$03,d0
		bcc.s	_dswSlot3
		lea	((g_Buffer+$376)).l,a5
		move.w	#$024E,d0
		bra.s	_dswRender

_dswSlot3:
		lea	((g_Buffer+$39A)).l,a5
		move.w	#$026A,d0

_dswRender:
		bsr.w	_renderSaveWindow
		move.l	(sp)+,d1
		move.b	d1,(g_SaveSlot).l
		rts

; Renders the current slot's window at a5 (d0 = its text strip
; tile): loads the save, stamps the clean window template, then the
; location name, slot number and - when the save has any health -
; gold, play time, health numbers, 50+ icon and the heart gauge. A
; blank save instead smears the empty cell across the stats rows
; (overlapping 15x4 copy shifted one cell).
_renderSaveWindow:
		move.l	d0,-(sp)
		jsr	(LoadSavedGame).l
		lea	(g_SaveWindowTemplate).l,a0
		lea	(a5),a1
		moveq	#$00000011,d6
		moveq	#$00000009,d7
		bsr.w	CopyTileRect
		move.l	(sp)+,d0
		lea	$00000236(a5),a1
		bsr.w	DrawSaveLocationName
		lea	$00000056(a5),a1
		move.b	(g_SaveSlot).l,d0
		addq.b	#$01,d0
		bsr.w	DrawSaveSlotNumber
		move.w	(Player_CurrentHealth).l,d2
		beq.s	_rswHearts
		addi.w	#$0100,d2

_rswHearts:
		lsr.w	#$08,d2
		beq.w	_rswEmpty
		lea	$00000108(a5),a1
		bsr.w	DrawSaveGold
		lea	$000001A4(a5),a1
		bsr.w	GetPlayTimeDigits
		lea	$000000FC(a5),a1
		bsr.w	DrawSaveHealthNumbers
		bsr.w	GetHeartCounts
		lea	$0000005A(a5),a1
		bsr.w	DrawHeartOverflowIcon
		lea	$00000068(a5),a1
		bsr.w	DrawHeartMeter
		lea	$00000068(a5),a1
		bsr.w	DrawHeartUnits
		rts

_rswEmpty:
		lea	$000000F2(a5),a0
		lea	$000000F4(a5),a1
		moveq	#$0000000E,d6
		moveq	#$00000003,d7
		bsr.w	CopyTileRect
		rts

; Copies a d6+1 x d7+1 cell rectangle from a0 to a1 ($50-byte row
; stride on both sides).
CopyTileRect:
		movem.l	d6-a1,-(sp)

_ctrRow:
		movea.l	a0,a2
		movea.l	a1,a3
		move.w	d6,d5

_ctrCell:
		move.w	(a0)+,(a1)+
		dbf	d5,_ctrCell
		lea	$00000050(a2),a0
		lea	$00000050(a3),a1
		dbf	d7,_ctrRow
		movem.l	(sp)+,d6-a1
		rts

; Unreachable leftover: would pulse palette line 1 between the
; inverse and a straight copy of line 0 every 16 frames of the
; -$0A(a6) tick.
		move.w	-$0000000A(a6),d0
		addq.w	#$01,-$0000000A(a6)
		andi.b	#$1F,d0
		beq.s	_pulseInvert
		cmpi.b	#$10,d0
		beq.s	_pulseRestore
		rts

_pulseInvert:
		lea	(g_Pal0Base).l,a0
		lea	$00000020(a0),a1
		moveq	#$0000000F,d7
		move.w	#$0EEE,d1

_piColour:
		move.w	(a0)+,d0
		move.w	d1,d2
		sub.w	d0,d2
		move.w	d2,(a1)+
		dbf	d7,_piColour
		jsr	(CopyBasePaletteToActivePalette).l
		jsr	(EnableDMAQueueProcessing).l
		rts

_pulseRestore:
		lea	(g_Pal0Base).l,a0
		lea	$00000020(a0),a1
		moveq	#$0000000F,d7

_prColour:
		move.w	(a0)+,(a1)+
		dbf	d7,_prColour
		jsr	(CopyBasePaletteToActivePalette).l
		jsr	(EnableDMAQueueProcessing).l
		rts

; Fade tick for the game-start sequence: while the -$0E(a6) budget
; runs, darken palette lines 1 and 3 one step every sixth frame.
DarkenMenuPalettes:
		bsr.w	_fadeTick
		bcs.s	_dmpStep
		rts

_dmpStep:
		lea	(g_Pal1Base).l,a0
		bsr.w	_darkenPal16
		lea	(g_Pal3Base).l,a0
		bra.s	_darkenPal16

; As above but only line 3 (the dimmed-window tint), used while
; picking a slot.
DarkenWindowPalette:
		bsr.w	_fadeTick
		bcs.s	_dwpStep
		rts

_dwpStep:
		lea	(g_Pal3Base).l,a0

_darkenPal16:
		moveq	#$0000000F,d7

; Darkens d7+1 colours at a0 by one step per component and commits
; the palette. Also reached through the visualeffects1 fade tables.
DarkenPaletteStep:
		move.w	(a0),d0
		move.w	d0,d1
		andi.w	#$0E00,d1
		subi.w	#$0200,d1
		bpl.s	_dpsGreen
		clr.w	d1

_dpsGreen:
		move.w	d0,d2
		andi.w	#$00E0,d2
		subi.w	#$0020,d2
		bpl.s	_dpsRed
		clr.w	d2

_dpsRed:
		move.w	d0,d3
		andi.w	#$000E,d3
		subi.w	#$0002,d3
		bpl.s	_dpsStore
		clr.w	d3

_dpsStore:
		or.w	d2,d1
		or.w	d3,d1
		move.w	d1,(a0)+
		dbf	d7,DarkenPaletteStep
		jsr	(CopyBasePaletteToActivePalette).l
		jsr	(EnableDMAQueueProcessing).l
		rts

; Ticks the -$0E(a6) fade budget down; carry set on every sixth
; tick (time for one darken step), clear otherwise or when spent.
_fadeTick:
		move.w	-$0000000E(a6),d0
		bne.s	_ftCount
		rts

_ftCount:
		subq.w	#$01,d0
		move.w	d0,-$0000000E(a6)
		divu.w	#$0006,d0
		swap	d0
		tst.w	d0
		beq.s	_ftStep
		rts

_ftStep:
		ori	#$01,ccr
		rts

; The Start/Copy/Delete action bar: reset sprites, palettes and
; window tints, draw the bar text, then run the arrow selector over
; the three options (geometry differs by region). B cannot back out
; - the selector just runs again. Returns d0 = choice, also stored
; in -$0C(a6).
RunActionBar:
		jsr	(ClearVDPSpriteTable).l
		bsr.w	LoadGameStartPalette
		bsr.w	ClearSaveSlotHighlights
		bsr.s	DrawActionBarText

_rabLoop:
	if REGION=JP
		move.w	#$00B0,d0
		move.w	#$0138,d1
		moveq	#$50,d2
	elseif REGION=FR
		move.w	#$0096,d0
		move.w	#$0134,d1
		moveq	#$60,d2
	else
		move.w	#$00B0,d0
		move.w	#$0134,d1
		moveq	#$50,d2
	endif
		moveq	#3,d3
		clr.w	-12(a6)
		bsr.w	_runArrowSelect
		tst.w	d0
		bmi.s	_rabLoop
		move.w	d0,-12(a6)
		rts

; Renders "Start" ($43), "Copy" ($44) and "Delete" ($45) into the
; action bar tiles (French at its own x positions).
DrawActionBarText:
		bsr.w	ClearTextBuffer
	if REGION=FR
		move.w	#$10,(g_TextCursorX).l
	else
		move.w	#$28,(g_TextCursorX).l
	endif
		move.w	#$43,d1
		bsr.w	DrawUncompressedString ; Start
	if REGION=FR
		move.w	#$0070,(g_TextCursorX).l
	else
		move.w	#$0078,(g_TextCursorX).l
	endif
		move.w	#$0044,d1
		bsr.w	DrawUncompressedString ; Copy
	if REGION=FR
		move.w	#$00D0,(g_TextCursorX).l
	else
		move.w	#$00C8,(g_TextCursorX).l
	endif
		move.w	#$0045,d1
		bsr.w	DrawUncompressedString ; Delete
		bsr.w	DMACopyTextBuffer
		rts

; Yes/no prompt over the action bar: Nigel parked still, "Yes"
; ($46) and "No" ($47) drawn, then a two-option arrow selection.
; Returns d0 = 0 for yes (nonzero otherwise).
RunYesNoPrompt:
		bsr.w	DrawSaveNigelStill
		move.w	#$0090,(g_TextCursorX).l
		move.w	#$0046,d1
		bsr.w	DrawUncompressedString
		move.w	#$00D0,(g_TextCursorX).l
		move.w	#$0047,d1
		bsr.w	DrawUncompressedString
		jsr	(WaitUntilVBlank).l
		bsr.w	DMACopyTextBuffer
		bsr.w	UpdateSaveSlotHighlights
		move.w	#$0118,d0
	if 	REGION=JP
		move.w	#$0138,d1
	else
		move.w	#$0134,d1
	endif
		moveq	#$00000040,d2
		moveq	#$00000002,d3
		bsr.w	_runArrowSelect
		rts

; Generic horizontal arrow-cursor selector: d0/d1 = arrow start
; x/y, d2 = x spacing, d3 = option count. VDP sprite 0 is the
; blinking arrow. Returns d0 = the option picked, or -1 on B.
; Own a4 frame: -$02 cursor/result, -$04 arrow x, -$06 arrow y,
; -$08 spacing, -$0A option count (the blink tick lives in the
; screen frame at -$0A(a6)).
_runArrowSelect:
		link	a4,#-$000A
		move.w	d1,-$00000006(a4)
		move.w	d1,(g_VDPSpr00_Y).l
		move.b	#$05,(g_VDPSpr00_Size).l
		move.w	#$A0AA,(g_VDPSpr00_TileSource).l
		move.w	d0,-$00000004(a4)
		move.w	d0,(g_VDPSpr00_X).l
		move.w	d2,-$00000008(a4)
		clr.w	-$00000002(a4)
		move.w	d3,-$0000000A(a4)
		jsr	(CopyBasePaletteToActivePalette).l
		jsr	(WaitUntilVBlank).l
		bsr.w	CopySaveScreenToPlaneA
		bsr.s	_arrowLoop
		move.w	-$00000002(a4),d0
		unlk	a4
		rts

; Selector loop: fresh presses only. A button press ($10 and up)
; shows the arrow and either cancels (B: result $FFFF) or picks
; with the select sound; the d-pad moves via _arrowMove, with the
; window fade ticking each frame.
_arrowLoop:
		bsr.w	SuppressHeldInputs
		move.b	(g_Controller1State).l,d1
		cmpi.b	#$10,d1
		bcs.s	_alMove
		clr.w	-$0000000A(a6)
		jsr	_arrowBlink(pc)
		nop
		move.b	(g_Controller1State).l,d1
		andi.b	#$10,d1
		beq.s	_alSelect
		move.w	#$FFFF,-$00000002(a4)
		rts

_alSelect:
		trap	#$00			  ; Trap00Handler
		dc.w SND_CursorSelect
		rts

_alMove:
		bsr.s	_arrowMove
		move.w	d0,-$00000002(a4)
		bsr.s	_arrowBlink
		bsr.w	DarkenWindowPalette
		jsr	(WaitUntilVBlank).l
		bra.s	_arrowLoop

; d-pad left/right: move the cursor (clamped, no wrap - edge moves
; are silent), slide the arrow sprite and restart the blink.
_arrowMove:
		move.w	-$00000002(a4),d0
		move.w	-$00000008(a4),d1
		move.w	-$0000000A(a4),d2
		move.b	(g_Controller1State).l,d3
		btst	#CTRL_LEFT,d3
		bne.s	_amLeft
		btst	#CTRL_RIGHT,d3
		bne.s	_amRight
		rts

_amLeft:
		subq.w	#$01,d0
		bpl.s	_amLeftOk
		clr.w	d0
		bra.s	_amDone

_amLeftOk:
		sub.w	d1,-$00000004(a4)
		clr.w	-$0000000A(a6)
		trap	#$00			  ; Trap00Handler
		dc.w SND_CursorMove

_amDone:
		rts

_amRight:
		addq.w	#$01,d0
		cmp.w	d2,d0
		bcs.s	_amRightOk
		move.w	d2,d0
		subq.w	#$01,d0
		bra.s	_amDone2

_amRightOk:
		add.w	d1,-$00000004(a4)
		clr.w	-$0000000A(a6)
		trap	#$00			  ; Trap00Handler
		dc.w SND_CursorMove

_amDone2:
		rts

; Arrow blink: the -$0A(a6) tick's bit 4 alternates the sprite
; between parked offscreen (x = 1) and its real position.
_arrowBlink:
		addq.w	#$01,-$0000000A(a6)
		move.w	-$0000000A(a6),d0
		andi.b	#$10,d0
		beq.s	_abShow
		move.w	#$0001,(g_VDPSpr00_X).l
		rts

_abShow:
		move.w	-$00000004(a4),(g_VDPSpr00_X).l
		move.w	-$00000006(a4),(g_VDPSpr00_Y).l
		rts

; Parks the arrow sprite offscreen.
HideArrowSprite:
		move.w	#$FFFF,(g_VDPSpr00_Y).l
		rts

; Loads the cursor slot's save and sets palette line 2 to its
; player palette (base colours + equipment tint).
LoadSlotPlayerPalette:
		move.w	-$00000002(a6),d0
		move.b	d0,(g_SaveSlot).l
		jsr	(LoadSavedGame).l
		lea	(g_Pal2Base).l,a1
		bsr.w	LoadInitialPlayerPalette
		jsr	(UpdateEquipPal).l
		jsr	(CopyBasePaletteToActivePalette).l
		jsr	(EnableDMAQueueProcessing).l
		rts

; Copies the default player palette over palette line 2.
LoadInitialPlayerPalette:
		lea	InitialPlayerPal(pc),a0
		lea	(g_Pal2Base).l,a1
		moveq	#$0000000F,d7

_lippColour:
		move.w	(a0)+,(a1)+
		dbf	d7,_lippColour
		rts

		modend
