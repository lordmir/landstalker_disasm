GlyphRender	module

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
