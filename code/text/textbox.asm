Textbox	module
; Textbox setup and the proportional glyph renderer.
;
; The textbox glyph tiles live in g_ScreenBuffer and are DMA-copied
; to VRAM $A500 (tile $528). The buffer is arranged as 64-byte cells:
; one cell is an 8px-wide, 16px-tall pair of stacked tiles, 36 cells
; per text line, $900 bytes per line. In-game the dialogue box has 3
; text lines (raster split at line 160); with the inventory/menu open
; the text area has 2 (split at line 176).
;
; Glyphs come from MainFontPtr: 30 bytes per character, 15 rows of a
; 12-bit-wide bitmap. Each row is decoded into g_GlyphRowBuffer (one
; byte per pixel), blitted into the destination cells at 4bpp nibble
; alignment, and measured to find the proportional advance width.

; Show the textbox: redraw it empty, point the raster split at it and
; queue its tilemap rows for DMA.
SetUpTextbox:
		bsr.s	RefreshAndClearTextbox
		bsr.s	SetTextboxHInt
		jsr	(j_QueueTextboxTilemapDMA).l
		jsr	(j_FlushDMACopyQueue).l
		rts

RefreshAndClearTextbox:
		movem.l	d0-a6,-(sp)
		bsr.s	ReloadTextbox
		bsr.w	ReloadTextboxSprites
		movem.l	(sp)+,d0-a6
		rts

; Close the textbox: raster split back to line 184, masking sprites
; parked at X=1 (inert), box reset to empty.
SetUpTextDisplay:
		move.w	#$8AB8,d0		  ; HINT on line 184
		move.w	#$0001,d1
		bsr.s	SetVDPForTextbox
		bsr.s	ReloadTextbox
		bra.w	ReloadTextboxSprites

; Point the H-int raster split at the top of the textbox: line 160
; for the 3-line in-game box, 176 for the 2-line inventory text area.
; d1 = 0 arms the masking sprites. Falls through to SetVDPForTextbox.
SetTextboxHInt:
		bsr.s	TestIfInventoryIsOpen
		bcs.s	_sthGame
		move.w	#$8AB0,d0		  ; HINT on line 176
		bra.s	_sthApply
; ---------------------------------------------------------------------------

_sthGame:
		move.w	#$8AA0,d0		  ; HINT on line 160

_sthApply:
		move.w	#$0000,d1

; d1 = X for masking sprites 4 and 6 (0 = mask on: all later sprites
; on the textbox scanlines are hidden; 1 = mask off), d0 = H-int line
; register value, written to the VDP and its RAM mirror.
SetVDPForTextbox:
		move.w	d1,(g_VDPSpr04_X).l
		move.w	d1,(g_VDPSpr06_X).l
		jsr	(j_WaitUntilVBlank).l
		move.w	d0,(VDP_CTRL_REG).l
		move.w	d0,(g_VDPReg10_HIntLine).l
		rts

; Carry clear = inventory/menu open (the window plane covers the
; whole screen: VDP reg $12 mirror = $921C), carry set = in-game.
TestIfInventoryIsOpen:
		cmpi.w	#$921C,(g_VDPReg18_WindowVPos).l
		rts

; Reset the textbox to an empty state and copy it to VRAM.
ReloadTextbox:
		bsr.s	LoadTextboxTilemap
		bsr.s	ClearTextboxTiles
		bsr.w	DMACopyTextboxTiles
		rts

; Build the textbox tilemap rows (40 tiles wide) into the RAM copy of
; the window plane rows: in-game the 8-row 3-line box (palette line
; 3) into g_TextBoxLine1, in menus the 6-row 2-line box (palette
; line 0) into g_TextBoxLine3. Also resets the text cursor/colour.
LoadTextboxTilemap:
		clr.w	(g_VDPSpr79_Y).l
		move.w	#$0001,(g_TextCursorX).l
		move.b	#$01,(g_TextCursorY).l
		move.b	#$0B,(g_TextColour).l
		bsr.s	TestIfInventoryIsOpen
		bcs.s	_lttGame
		lea	InventoryTextBoxTilemap(pc),a0
		lea	(g_TextBoxLine3).l,a1
		move.w	#$0005,d7
		clr.w	d1
		bra.s	_lttRow
; ---------------------------------------------------------------------------

_lttGame:
		lea	TextBoxTilemap(pc),a0
		lea	(g_TextBoxLine1).l,a1
		move.w	#$0007,d7
		move.w	#$6000,d1

_lttRow:
		move.w	#$0027,d6

_lttTile:
		move.w	(a0)+,d0
		or.w	d1,d0
		move.w	d0,(a1)+
		dbf	d6,_lttTile
		adda.w	#$0030,a1		  ; Next window row ($80 bytes)
		dbf	d7,_lttRow
		rts

; Load the four masking sprites (3-6) from TextBoxSprites.
ReloadTextboxSprites:
		lea	TextBoxSprites(pc),a0
		lea	(g_VDPSpr03_Y).l,a1
		move.w	#$000F,d0

_rbsCopy:
		move.w	(a0)+,(a1)+
		dbf	d0,_rbsCopy
		rts

; Fill the glyph buffer with the $A background colour: 3 lines'
; worth ($1B00 bytes) in-game, 2 lines' worth ($1200) in menus.
ClearTextboxTiles:
	if ~((REGION=JP)!(REGION=US_BETA))
		tst.b	(g_PendingBlockCopies).l
		beq.w	_cttStart
		nop
		nop
		jsr	(j_WaitUntilVBlank).l
	endif

_cttStart:
		lea	(g_ScreenBuffer).l,a0
		bsr.w	TestIfInventoryIsOpen
		bcs.s	_cttGame
		move.w	#$08FF,d7
		bra.s	_cttFill
; ---------------------------------------------------------------------------

_cttGame:
		move.w	#$0D7F,d7

_cttFill:
		move.w	#$AAAA,(a0)+
		dbf	d7,_cttFill
		rts

; Queue and flush a DMA of the glyph buffer to VRAM $A500: $D80 words
; (3 text lines) in-game, $900 words (2 lines) in menus.
DMACopyTextboxTiles:
		bsr.w	TestIfInventoryIsOpen
		bcs.s	_dcttGame
		move.w	#$0900,d0
		bra.s	_dcttQueue
; ---------------------------------------------------------------------------

_dcttGame:
		move.w	#$0D80,d0

_dcttQueue:
		lea	(g_ScreenBuffer).l,a0
		lea	($0000A500).l,a1
		jsr	(j_QueueDMAOp).l
		jmp	(j_FlushDMACopyQueue).l

; Scroll the textbox text up one line (16px) as eight animated 2px
; steps, each flushed to VRAM.
ScrollTextboxUp:
		moveq	#$00000007,d6

_stuStep:
		bsr.s	_scrollStep
		bsr.s	DMACopyTextboxTiles
		dbf	d6,_stuStep
		rts

; One 2px scroll pass over all 36 columns: each column's cells are
; shifted up 8 bytes (2 pixel rows) down the whole box, with blank
; ($AA) rows fed in at the bottom. The suba after each column undoes
; the lines walked and steps to the next column cell (+$40).
_scrollStep:
		lea	(g_ScreenBuffer).l,a0
		moveq	#$00000023,d7
		bsr.w	TestIfInventoryIsOpen
		bcs.s	_ssGameCol

_ssInvCol:
		bsr.s	_shiftTwoCells
		suba.w	#$11C0,a0
		dbf	d7,_ssInvCol
		rts
; ---------------------------------------------------------------------------

_ssGameCol:
		bsr.s	_shiftThreeCells
		suba.w	#$1AC0,a0
		dbf	d7,_ssGameCol
		rts

; Shift a column of three cells (in-game box): the first cell pulls
; its bottom rows from the cell below, then falls through to the
; two-cell version for the rest.
_shiftThreeCells:
		move.l	$00000900(a0),d0
		move.l	$00000904(a0),d1
		bsr.s	_shiftCell

; Shift a column of two cells (menu text area): the first pulls from
; the cell below, the last is fed blank background rows.
_shiftTwoCells:
		move.l	$00000900(a0),d0
		move.l	$00000904(a0),d1
		bsr.s	_shiftCell
		move.l	#$AAAAAAAA,d0
		move.l	#$AAAAAAAA,d1

; Shift one 64-byte cell up 8 bytes (2 pixel rows), appending d0/d1
; as the new bottom rows, then advance a0 to the same column in the
; next line ($900 total with the $40 walked here).
_shiftCell:
		movea.l	a0,a1
		addq.w	#$08,a1
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	d0,(a0)+
		move.l	d1,(a0)+
		adda.w	#$08C0,a0
		rts
	modend
