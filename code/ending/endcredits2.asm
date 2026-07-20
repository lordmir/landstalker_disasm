EndCredits2	module
; Credit line renderer for endcredits1. Lines are drawn glyph by
; glyph into a pixel canvas in g_ScreenBuffer, DMA'd into a rolling
; range of tiles ($200-$5FF), and their cells written into the
; plane-row window at g_HUD_Row2 as it scrolls by.

; Every 16th tick (one tile of scroll), shift the plane-row window
; up one row and DMA the row entering at the top into plane B
; (row = tick/16 mod 32).
UpdateCreditScroll:
		move.w	-$00000002(a6),d0
		andi.b	#$0F,d0
		cmpi.b	#$0F,d0
		beq.s	ScrollCredits1Tile
		rts

ScrollCredits1Tile:
		lea	(g_HUD_Row1).l,a0
		lea	$00000080(a0),a1
		move.w	#$013F,d7

_sctShift:
		move.l	(a1)+,(a0)+
		dbf	d7,_sctShift
		lea	(g_HUD_Row1).l,a0
		clr.l	d0
		move.w	-$00000002(a6),d0
		lsr.w	#$04,d0
		andi.w	#$001F,d0
		lsl.w	#$07,d0
		ori.w	#$E000,d0		  ; plane B row address
		movea.l	d0,a1
		moveq	#$00000028,d0
		moveq	#$00000002,d1
		jsr	(j_QueueDMAOp).l
		jsr	(j_EnableDMAQueueProcessing).l
		rts

; Resets the glyph canvas: cursor to x = 1, underline mode off, and
; the whole canvas filled with the background colour nibble.
_clearCanvas:
		move.w	#$0001,(g_TextCursorX).l
		clr.b	(g_TextCursorY).l
		clr.b	-$0000000E(a6)
		movem.l	d0/d7-a0,-(sp)
		lea	(g_ScreenBuffer).l,a0
		move.b	(g_CreditBGColour).l,d0
		move.b	d0,d1
		lsl.l	#$08,d0
		or.b	d0,d1
		lsl.l	#$08,d0
		or.b	d0,d1
		lsl.l	#$08,d0
		or.b	d0,d1
		move.w	#$027F,d7

_ccFill:
		move.l	d0,(a0)+
		dbf	d7,_ccFill
		movem.l	(sp)+,d0/d7-a0
		rts

; Renders one credit line from the text stream at a0. d0 = the
; line's position byte, kept in -$06(a6):
;   $00-$7F  explicit cell column
;   $FF      centred across the full 40 columns
;   $FD/$FE  centred within 20 columns at offset 2 / $12 (beside
;            the logos); other negatives centre at offset 0
; In-line control bytes: $00 ends the line, $81/$82 pick the thin/
; thick underline, $83-$86 stamp a logo block from the logo tilemap
; instead of text, and a region-specific range moves the cursor
; backwards for kerning (US $40-$7F less $3F, FR $50-$6F less $4F,
; DE $46-$65 less $45). Every fourth glyph ticks a credits frame so
; the scroll keeps moving.
RenderCreditLine:
		move.w	d0,-$00000006(a6)
		bsr.s	_clearCanvas
		clr.w	d7

_rclNext:
		clr.w	d0
		move.b	(a0)+,d0
		beq.w	_rclEnd
		cmpi.b	#$81,d0
		bne.s	_rclChkThick
		move.b	#$01,-$0000000E(a6)
		bra.s	_rclNext

_rclChkThick:
		cmpi.b	#$82,d0
		bne.s	_rclChkKern
		move.b	#$02,-$0000000E(a6)
		bra.s	_rclNext

_rclChkKern:
	if REGION=FR
		cmpi.b	#$50,d0
		bcs.w	_rclChkLogos
		cmpi.b	#$70,d0
		bcc.w	_rclChkLogos
		subi.b	#$4F,d0
	elseif REGION=DE
		cmpi.b	#$46,d0
		bcs.w	_rclChkLogos
		cmpi.b	#$66,d0
		bcc.w	_rclChkLogos
		subi.b	#$45,d0
	else
		cmpi.b	#$40,d0
		bcs.w	_rclChkLogos
		cmpi.b	#$80,d0
		bcc.w	_rclChkLogos
		subi.b	#$3F,d0
	endif
		ext.w	d0
		sub.w	d0,(g_TextCursorX).l
		bra.s	_rclNext

_rclChkLogos:
		cmpi.b	#$83,d0
		beq.w	_logoA
		cmpi.b	#$84,d0
		beq.w	_logoB
		cmpi.b	#$85,d0
		beq.w	_logoC
		cmpi.b	#$86,d0
		beq.w	_logoD
		movem.l	d7-a0,-(sp)
		bsr.w	_drawGlyph
		movem.l	(sp)+,d7-a0
		move.w	d7,d0
		cmpi.b	#$04,d0
		bcs.s	_rclCount
		bsr.w	AdvanceCreditFrame
		clr.w	d7

_rclCount:
		addq.w	#$01,d7
		bra.s	_rclNext

_rclEnd:
		move.l	a0,-(sp)
		bsr.w	AdvanceCreditFrame
		bsr.w	_padCanvas
		bsr.w	_emitLine
		movea.l	(sp)+,a0
		rts

; Emits the finished line: allocate its tiles from the $200-$5FF
; ring (-$04(a6) cursor; wrap and retry when the range would run
; past $600), DMA the canvas into them, then write the {tile,
; tile+1} cell pairs into the window row at g_HUD_Row2 (top row,
; bottom at +$80) at the column the position code dictates.
_emitLine:
		move.w	-$00000004(a6),d0
		andi.w	#$03FF,d0
		addi.w	#$0200,d0
		move.w	d0,-$00000008(a6)
		clr.l	d1
		move.w	d0,d1
		lsl.w	#$05,d1			  ; VRAM address of the base tile
		movea.l	d1,a1
		lea	((g_ScreenBuffer+$40)).l,a0
		move.w	(g_TextCursorX).l,d1
		move.w	d1,d2
		lsr.w	#$02,d1			  ; width in half-tiles
		andi.b	#$07,d2
		beq.s	_elWidth
		addq.w	#$02,d1

_elWidth:
		move.w	d1,-$0000000A(a6)
		add.w	d1,d0
		cmpi.w	#$0600,d0
		bcs.s	_elEmit
		clr.w	-$00000004(a6)		  ; ring exhausted: wrap and
		bra.s	_emitLine		  ; reallocate

_elEmit:
		add.w	d1,-$00000004(a6)
		lsl.w	#$04,d1			  ; 16 words per half-tile column
		move.w	d1,d0
		moveq	#$00000002,d1
		jsr	(j_QueueDMAOp).l
		jsr	(j_EnableDMAQueueProcessing).l
		bsr.w	AdvanceCreditFrame
		lea	(g_HUD_Row2).l,a0
		move.w	-$00000006(a6),d0
		tst.b	d0
		bpl.w	_elCells
		move.w	d0,d3
		clr.w	d2
		moveq	#$00000014,d0
		cmpi.b	#$FF,d3
		bne.s	_elChkFD
		moveq	#$00000028,d0		  ; $FF: full 40 columns

_elChkFD:
		cmpi.b	#$FD,d3
		bne.s	_elChkFE
		moveq	#$00000002,d2

_elChkFE:
		cmpi.b	#$FE,d3
		bne.s	_elCentre
		moveq	#$00000012,d2

_elCentre:
		move.w	-$0000000A(a6),d1
		lsr.w	#$01,d1
		sub.w	d1,d0
		lsr.w	#$01,d0
		add.w	d2,d0			  ; (span - tiles)/2 + offset

_elCells:
		add.w	d0,d0
		lea	(a0,d0.w),a0
		move.w	-$0000000A(a6),d7
		lsr.w	#$01,d7
		subq.w	#$01,d7
		move.w	-$00000008(a6),d0
		ori.w	#$0000,d0		  ; (no palette/priority bits)

_elCell:
		move.w	d0,(a0)
		addq.w	#$01,d0
		move.w	d0,$00000080(a0)
		addq.w	#$01,d0
		addq.l	#$02,a0
		dbf	d7,_elCell
		rts

; The four logo blocks ($83-$86): stamp 15-cell-wide rows straight
; from the logo tilemap (in g_Blockset scratch) into the window row
; at the position byte's column.
_logoA:
		lea	((g_Blockset+2)).l,a2
		moveq	#$00000002,d7
		bra.w	_logoStamp

_logoB:
		lea	((g_Blockset+$5C)).l,a2
		moveq	#$00000002,d7
		bra.w	_logoStamp

_logoC:
		lea	((g_Blockset+$B6)).l,a2
		moveq	#$00000004,d7
		bra.w	_logoStamp

_logoD:
		lea	((g_Blockset+$14C)).l,a2
		moveq	#$00000003,d7

_logoStamp:
		move.l	a0,-(sp)
		move.w	-$00000006(a6),d1
		add.w	d1,d1
		lea	(g_HUD_Row2).l,a3
		lea	(a3,d1.w),a3

_lsRow:
		movea.l	a2,a4
		movea.l	a3,a5
		moveq	#$0000000E,d6

_lsCell:
		move.w	(a4)+,(a5)+
		dbf	d6,_lsCell
		lea	$0000001E(a2),a2
		lea	$00000080(a3),a3
		dbf	d7,_lsRow
		movea.l	(sp)+,a0
		rts

; Draws glyph d0 from the proportional font in g_Buffer (records of
; {width, width x 4 bytes}, one 16-pixel 2bpp column each): walk to
; record d0-1 ($00 uses the first record, $80 draws six columns of
; the first record's data - a wide space), render its columns, then
; one spacing column.
_drawGlyph:
		lea	(g_Buffer).l,a0
		tst.b	d0
		beq.w	_dgWidth
		cmpi.b	#$80,d0
		bne.s	_dgLookup
		moveq	#$00000005,d2
		addq.l	#$01,a0
		bra.s	_dgCols

_dgLookup:
		subq.b	#$01,d0
		beq.w	_dgWidth
		subq.b	#$01,d0

_dgSkip:
		clr.w	d1
		move.b	(a0)+,d1
		beq.w	_dgWidth
		mulu.w	#$0004,d1
		lea	(a0,d1.w),a0
		dbf	d0,_dgSkip

_dgWidth:
		clr.w	d2
		move.b	(a0)+,d2
		subq.w	#$01,d2

_dgCols:
		bsr.w	_drawGlyphColumn
		addq.w	#$01,(g_TextCursorX).l
		dbf	d2,_dgCols
		lea	((g_Buffer+1)).l,a0
		bsr.w	_drawGlyphColumn
		addq.w	#$01,(g_TextCursorX).l
		rts

; Renders one 1px glyph column (16 rows of 2bpp from (a0)) into the
; canvas at the cursor: bit pairs 01/10/11 plot the three ink
; shades from g_CreditInkColours as pixel nibbles (parity picks the
; nibble). The underline modes force the bottom pixels: mode 1 sets
; the last row to shade 2, mode 2 the last two rows to shades 3+2.
_drawGlyphColumn:
		lea	((g_ScreenBuffer+$40)).l,a1
		move.w	(g_TextCursorX).l,d0
		move.w	d0,d1
		andi.b	#$F8,d1
		lsl.w	#$03,d1
		lea	(a1,d1.w),a1		  ; 8px column group (32 bytes)
		move.w	d0,d1
		andi.w	#$0007,d1
		lsr.w	#$01,d1
		lea	(a1,d1.w),a1
		lea	(g_CreditInkColours).l,a2
		move.b	(a2)+,d5
		move.b	(a2)+,d6
		move.b	(a2)+,d7
		btst	#$00,d0
		bne.s	_dgcRead
		lsl.b	#$04,d5			  ; even x: high nibble
		lsl.b	#$04,d6
		lsl.b	#$04,d7

_dgcRead:
		move.b	(a0)+,d0
		lsl.l	#$08,d0
		move.b	(a0)+,d0
		lsl.l	#$08,d0
		move.b	(a0)+,d0
		lsl.l	#$08,d0
		move.b	(a0)+,d0
		move.b	-$0000000E(a6),d4
		beq.w	_dgcRows
		cmpi.b	#$01,d4
		bne.s	_dgcThick
		andi.b	#$FC,d0
		ori.b	#$02,d0
		bra.s	_dgcRows

_dgcThick:
		andi.b	#$F0,d0
		ori.b	#$0E,d0

_dgcRows:
		moveq	#$0000000F,d3

_dgcPixel:
		add.l	d0,d0
		bcs.s	_dgcHi
		add.l	d0,d0
		bcc.s	_dgcSkip
		or.b	d5,(a1)			  ; 01: shade 1

_dgcSkip:
		bra.s	_dgcNext

_dgcHi:
		add.l	d0,d0
		bcs.s	_dgcShade3
		or.b	d6,(a1)			  ; 10: shade 2
		bra.s	_dgcNext

_dgcShade3:
		or.b	d7,(a1)			  ; 11: shade 3

_dgcNext:
		addq.l	#$04,a1
		dbf	d3,_dgcPixel
		rts

; Pads the finished line out to a whole number of 16px column
; pairs: rounds the cursor up and shifts the canvas pixels along by
; the remainder, in three byte-rotate variants for the possible
; shift amounts.
_padCanvas:
		move.w	(g_TextCursorX).l,d0
		andi.w	#$000F,d0
		bne.s	_pcAmount
		rts

_pcAmount:
		moveq	#$00000010,d1
		sub.w	d0,d1
		lsr.w	#$02,d1
		bne.s	_pcShift
		rts

_pcShift:
		move.w	(g_TextCursorX).l,d0
		andi.w	#$FFF0,d0
		addi.w	#$0010,d0
		move.w	d0,(g_TextCursorX).l
		lea	((g_ScreenBuffer+$803)).l,a1
		moveq	#$0000000F,d6
		cmpi.b	#$02,d1
		beq.w	_pcShift2
		bcc.w	_pcShift3

_pcShift1:
		movea.l	a1,a0
		move.w	#$001F,d7

_ps1Byte:
		move.b	-$00000001(a0),(a0)
		move.b	-$00000002(a0),-$00000001(a0)
		move.b	-$00000003(a0),-$00000002(a0)
		move.b	-$00000040(a0),-$00000003(a0)
		suba.l	#$00000040,a0
		dbf	d7,_ps1Byte
		lea	$00000004(a1),a1
		dbf	d6,_pcShift1
		rts

_pcShift2:
		movea.l	a1,a0
		move.w	#$001F,d7

_ps2Byte:
		move.b	-$00000002(a0),(a0)
		move.b	-$00000003(a0),-$00000001(a0)
		move.b	-$00000040(a0),-$00000002(a0)
		move.b	-$00000041(a0),-$00000003(a0)
		suba.l	#$00000040,a0
		dbf	d7,_ps2Byte
		lea	$00000004(a1),a1
		dbf	d6,_pcShift2
		rts

_pcShift3:
		movea.l	a1,a0
		move.w	#$001F,d7

_ps3Byte:
		move.b	-$00000003(a0),(a0)
		move.b	-$00000040(a0),-$00000001(a0)
		move.b	-$00000041(a0),-$00000002(a0)
		move.b	-$00000042(a0),-$00000003(a0)
		suba.l	#$00000040,a0
		dbf	d7,_ps3Byte
		lea	$00000004(a1),a1
		dbf	d6,_pcShift3
		rts

		modend
