StringFuncs2	module
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

; Draw character d0 at the cursor in the current text colour.
; Preserves d1. (Called from ProcessChar and via j_DrawTextGlyph.)
DrawTextGlyph:
		movem.w	d1,-(sp)
		move.w	d0,d7
		move.b	(g_TextColour).l,d1
		bsr.s	_drawGlyph
		movem.w	(sp)+,d1
		rts

; Draw character d7 in colour d1. Char 0 is a space: just advance the
; cursor by the default width (8px, 11 on JP). Chars $7B/$7C are
; overlay marks (accents/dakuten): only the top 4 rows are drawn and
; the advance is undone afterwards (net +1px).
_drawGlyph:
		move.w	d7,(g_PrintedChar).l
	if REGION=JP
		move.w	#$000A,d4
	else
		move.w	#$0007,d4
	endif
		cmpi.b	#$00,d7
		beq.s	_pcAdvance
		move.w	#$000E,d6		  ; 15 glyph rows
		cmpi.b	#$7B,d7
		beq.s	_dgOverlay
		cmpi.b	#$7C,d7
		bne.s	PrintChar

_dgOverlay:
		move.w	#$0003,d6		  ; 4 glyph rows
		bsr.s	PrintChar
		sub.w	d4,(g_TextCursorX).l
		rts

; Render glyph d7 (d6+1 rows) at the cursor: decode each font row
; into the row buffer, blit it, step the destination down a pixel row
; and track the widest inked row in d4; finally advance the cursor by
; that width + 1.
PrintChar:
		mulu.w	#$001E,d7
		movea.l	(MainFontPtr).l,a0
		adda.l	d7,a0
		bsr.s	_calcGlyphDest
		move.w	d6,d7
		clr.w	d4
		move.b	(g_TextCursorY).l,d5

_pcRow:
		bsr.w	_renderGlyphRow
		bsr.w	_blitGlyphRow

_pcRowDone:
		bsr.w	_advanceDestRow
		bsr.w	_measureRowWidth
		dbf	d7,_pcRow

_pcAdvance:
		addq.w	#$01,d4
		add.w	d4,(g_TextCursorX).l
		rts

; From the cursor, compute a2 = destination in g_ScreenBuffer (line
; cell + row-within-line + 8px column cell) and turn colour d1 into
; the two nibble-pixel bytes the renderer alternates between: one
; with the pixel in the high nibble over an $A background, one plain
; low-nibble - which is which depends on the cursor X parity.
_calcGlyphDest:
		move.b	d1,d2
		btst	#$00,(g_TextCursorX+1).l
		beq.s	_cgdEvenX
		lsl.b	#$04,d2
		ori.b	#$0A,d2
		bra.s	_cgdOffset
; ---------------------------------------------------------------------------

_cgdEvenX:
		lsl.b	#$04,d1
		ori.b	#$0A,d1

_cgdOffset:
		move.b	(g_TextCursorY).l,d0
		move.b	d0,d3
		andi.b	#$30,d0
		lsr.b	#$03,d0
		ext.w	d0
		move.w	_lineCellOffsets(pc,d0.w),d0
		andi.b	#$0F,d3
		ext.w	d3
		lsl.b	#$02,d3			  ; 4 bytes per pixel row
		add.w	d3,d0
		move.w	(g_TextCursorX).l,d3
		andi.b	#$F8,d3
		lsl.w	#$03,d3			  ; $40 bytes per 8px column
		add.w	d3,d0
		lea	(g_ScreenBuffer).l,a2
		adda.w	d0,a2
		rts

; ---------------------------------------------------------------------------
; Buffer offset of each text line ($900 bytes per line).
_lineCellOffsets:
		dc.w $0000
		dc.w $0900
		dc.w $1200

; Measure the row just blitted: scan the row buffer backwards for the
; rightmost inked pixel (skipping the $0A/$AA background bytes) and
; keep the max of (position + 2) in d4, giving a 1px inter-glyph gap.
; Char $80 always advances the full 12px.
_measureRowWidth:
		move.w	#$000B,d6
		cmpi.w	#$0080,(g_PrintedChar).l
		beq.s	_mrwForce
		lea	(g_PrintedChar).l,a3	  ; = end of g_GlyphRowBuffer
		move.w	#$000B,d0
		move.w	#$000D,d6

_mrwScan:
		cmpi.b	#$0A,-(a3)
		beq.s	_mrwEmpty
		cmpi.b	#$AA,(a3)
		bne.s	_mrwDone

_mrwEmpty:
		subq.w	#$01,d6
		dbf	d0,_mrwScan

_mrwDone:
		cmp.w	d6,d4
		bcc.s	_mrwKeep

_mrwForce:
		move.w	d6,d4

_mrwKeep:
		rts

; Step a2 down one pixel row (4 bytes); when d5 crosses a 16px line
; boundary, skip to pixel row 1 of the same column in the next line's
; cell (+$8C4).
_advanceDestRow:
		adda.w	#$0004,a2
		addq.b	#$01,d5
		cmpi.b	#$10,d5
		beq.s	_adrLineSkip
		cmpi.b	#$20,d5
		bne.s	_adrDone

_adrLineSkip:
		adda.w	#$08C4,a2

_adrDone:
		rts

; Decode one 12-bit font row into g_GlyphRowBuffer: pre-fill with the
; background pattern for the cursor's nibble parity, then write the
; d1/d2 colour bytes (alternating high/low nibble forms) for each set
; bit, MSB first. An empty row pops the return address and skips the
; blit entirely (back to _pcRowDone).
_renderGlyphRow:
		lea	(g_GlyphRowBuffer).l,a1
		move.l	#$AA0AAA0A,d0
		btst	#$00,(g_TextCursorX+1).l
		beq.s	_rgrFill
		move.l	#$0AAA0AAA,d0

_rgrFill:
		move.l	d0,(a1)
		move.l	d0,$00000004(a1)
		move.l	d0,$00000008(a1)
		move.w	(a0)+,d0
		beq.s	_rgrEmptyRow
		lsl.w	#$01,d0
		bcc.s	_rgrPx1
		move.b	d1,(a1)

_rgrPx1:
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	_rgrPx2
		move.b	d2,(a1)

_rgrPx2:
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	_rgrPx3
		move.b	d1,(a1)

_rgrPx3:
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	_rgrPx4
		move.b	d2,(a1)

_rgrPx4:
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	_rgrPx5
		move.b	d1,(a1)

_rgrPx5:
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	_rgrPx6
		move.b	d2,(a1)

_rgrPx6:
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	_rgrPx7
		move.b	d1,(a1)

_rgrPx7:
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	_rgrPx8
		move.b	d2,(a1)

_rgrPx8:
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	_rgrPx9
		move.b	d1,(a1)

_rgrPx9:
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	_rgrPx10
		move.b	d2,(a1)

_rgrPx10:
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	_rgrPx11
		move.b	d1,(a1)

_rgrPx11:
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	_rgrDone
		move.b	d2,(a1)

_rgrDone:
		rts
; ---------------------------------------------------------------------------

_rgrEmptyRow:
		movem.l	(sp)+,d0
		bra.w	_pcRowDone

; Blit the row buffer into the destination cells: each non-background
; byte lands at nibble position (cursor X & 7) + byte index, spanning
; up to three 8px column cells (offsets 0-3, $40-$43, $80-$81). "Hi"
; entries write the whole byte (pixel in the high nibble, $A
; background low), "Lo" entries merge the pixel into the low nibble.
_blitGlyphRow:
		movem.w	d1,-(sp)
		lea	(g_GlyphRowBuffer).l,a1
		moveq	#$0000000B,d6

_bgrByte:
		move.b	(a1)+,d0
		cmpi.b	#$0A,d0
		beq.s	_bgrNext
		cmpi.b	#$AA,d0
		beq.s	_bgrNext
		move.w	(g_TextCursorX).l,d1
		andi.w	#$0007,d1
		addi.b	#$0B,d1
		sub.w	d6,d1
		lsl.w	#$02,d1
		jmp	_bgrTable(pc,d1.w)
; ---------------------------------------------------------------------------

_bgrTable:
		bra.w	_blitHi0
; ---------------------------------------------------------------------------
		bra.w	_blitLo0
; ---------------------------------------------------------------------------
		bra.w	_blitHi1
; ---------------------------------------------------------------------------
		bra.w	_blitLo1
; ---------------------------------------------------------------------------
		bra.w	_blitHi2
; ---------------------------------------------------------------------------
		bra.w	_blitLo2
; ---------------------------------------------------------------------------
		bra.w	_blitHi3
; ---------------------------------------------------------------------------
		bra.w	_blitLo3
; ---------------------------------------------------------------------------
		bra.w	_blitHi40
; ---------------------------------------------------------------------------
		bra.w	_blitLo40
; ---------------------------------------------------------------------------
		bra.w	_blitHi41
; ---------------------------------------------------------------------------
		bra.w	_blitLo41
; ---------------------------------------------------------------------------
		bra.w	_blitHi42
; ---------------------------------------------------------------------------
		bra.w	_blitLo42
; ---------------------------------------------------------------------------
		bra.w	_blitHi43
; ---------------------------------------------------------------------------
		bra.w	_blitLo43
; ---------------------------------------------------------------------------
		bra.w	_blitHi80
; ---------------------------------------------------------------------------
		bra.w	_blitLo80
; ---------------------------------------------------------------------------
		bra.w	_blitHi81
; ---------------------------------------------------------------------------

_bgrNext:
		dbf	d6,_bgrByte
		movem.w	(sp)+,d1
		rts
; ---------------------------------------------------------------------------

_blitHi0:
		move.b	d0,(a2)
		bra.s	_bgrNext
; ---------------------------------------------------------------------------

_blitLo0:
		andi.b	#$F0,(a2)
		or.b	d0,(a2)
		bra.s	_bgrNext
; ---------------------------------------------------------------------------

_blitHi1:
		move.b	d0,$00000001(a2)
		bra.s	_bgrNext
; ---------------------------------------------------------------------------

_blitLo1:
		andi.b	#$F0,$00000001(a2)
		or.b	d0,$00000001(a2)
		bra.s	_bgrNext
; ---------------------------------------------------------------------------

_blitHi2:
		move.b	d0,$00000002(a2)
		bra.s	_bgrNext
; ---------------------------------------------------------------------------

_blitLo2:
		andi.b	#$F0,$00000002(a2)
		or.b	d0,$00000002(a2)
		bra.s	_bgrNext
; ---------------------------------------------------------------------------

_blitHi3:
		move.b	d0,$00000003(a2)
		bra.s	_bgrNext
; ---------------------------------------------------------------------------

_blitLo3:
		andi.b	#$F0,$00000003(a2)
		or.b	d0,$00000003(a2)
		bra.s	_bgrNext
; ---------------------------------------------------------------------------

_blitHi40:
		move.b	d0,$00000040(a2)
		bra.s	_bgrNext
; ---------------------------------------------------------------------------

_blitLo40:
		andi.b	#$F0,$00000040(a2)
		or.b	d0,$00000040(a2)
		bra.s	_bgrNext
; ---------------------------------------------------------------------------

_blitHi41:
		move.b	d0,$00000041(a2)
		bra.s	_bgrNext
; ---------------------------------------------------------------------------

_blitLo41:
		andi.b	#$F0,$00000041(a2)
		or.b	d0,$00000041(a2)
		bra.s	_bgrNext
; ---------------------------------------------------------------------------

_blitHi42:
		move.b	d0,$00000042(a2)
		bra.s	_bgrNext
; ---------------------------------------------------------------------------

_blitLo42:
		andi.b	#$F0,$00000042(a2)
		or.b	d0,$00000042(a2)
		bra.w	_bgrNext
; ---------------------------------------------------------------------------

_blitHi43:
		move.b	d0,$00000043(a2)
		bra.w	_bgrNext
; ---------------------------------------------------------------------------

_blitLo43:
		andi.b	#$F0,$00000043(a2)
		or.b	d0,$00000043(a2)
		bra.w	_bgrNext
; ---------------------------------------------------------------------------

_blitHi80:
		move.b	d0,$00000080(a2)
		bra.w	_bgrNext
; ---------------------------------------------------------------------------

_blitLo80:
		andi.b	#$F0,$00000080(a2)
		or.b	d0,$00000080(a2)
		bra.w	_bgrNext
; ---------------------------------------------------------------------------

_blitHi81:
		move.b	d0,$00000081(a2)
		bra.w	_bgrNext

; ---------------------------------------------------------------------------
; The four masking sprites (3-6): two per scanline band (Y $121 and
; $141 = lines 161-192 and 193-224), 1x4-tile columns of glyph tile
; $528 with priority. Each pair is a normal sprite followed by one
; whose X the code toggles: at X=0 the VDP sprite-masking quirk hides
; every later sprite on those lines - the game sprites behind the
; textbox - and at X=1 the pair is inert (offscreen).
TextBoxSprites:	dc.w $0121, $0304, $8528, $0001
		dc.w $0121, $0305, $8528, $0001
		dc.w $0141, $0306, $8528, $0001
		dc.w $0141, $0307, $8528, $0001

	modend
