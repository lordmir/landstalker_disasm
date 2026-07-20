GameSelectScreen2	module
; Save-window content renderers for the select screen
; (gameloadscreen1): play time, gold, slot number, health and the
; heart gauge, drawn as tile cells straight into a window's spot in
; g_Buffer, plus the shared text-buffer helpers. Everything draws
; 2-tile columns: top tile at (a1), bottom on the next tile row
; (+$50).
;
; Digit bytes from ConvertToBase10 are one-based: value n+1 is the
; glyph pair for digit n (tiles $82/$83 + 2n); 0 is a suppressed
; leading zero (blank pair $80/$81).

; Play time at a1 as "HHHH:MM": up to four hour digits (leading
; blanks), a gap column for the colon, two forced minute digits.
GetPlayTimeDigits:
		moveq	#$00000000,d7
		move.w	(g_HourCount).l,d7
		mulu.w	#00100,d7
		add.w	(g_MinuteCount).l,d7
		jsr	(j_ConvertToBase10).l
		lea	(g_Base10Digit4).l,a0
		bsr.s	_drawDigit
		bsr.s	_drawDigit
		bsr.s	_drawDigit
		bsr.s	_drawDigitZero
		addq.l	#$02,a1			  ; the colon column
		bsr.s	_drawDigitZero
		bsr.s	_drawDigitZero
		rts

; One digit column at (a1)+; digit byte 0 draws the blank pair.
_drawDigit:
		move.b	(a0)+,d0
		ext.w	d0
		beq.s	_ddTile
		add.w	d0,d0

_ddTile:
		addi.w	#$0080,d0
		move.w	d0,(a1)+
		beq.s	_ddBottom		  ; never taken - the tile id
		addq.w	#$01,d0			  ; can't be zero

_ddBottom:
		move.w	d0,$0000004E(a1)
		rts

; One digit column, with 0 forced to display as '0' (digit value 1).
_drawDigitZero:
		move.b	(a0)+,d0
		ext.w	d0
		bne.s	_dzTile
		addq.b	#$01,d0

_dzTile:
		add.b	d0,d0
		ext.w	d0
		addi.w	#$0080,d0
		move.w	d0,(a1)+
		addq.w	#$01,d0
		move.w	d0,$0000004E(a1)
		rts

; Gold as four digit columns at a1.
DrawSaveGold:
		move.w	(g_Gold).l,d7
	if FIX_GOLD_CAP
		cmpi.w	#$2710,d7
		bcs.s	_dgConvert
		move.w	#$270F,d7
	endif

_dgConvert:
		jsr	(j_ConvertToBase10).l
		lea	(g_Base10Digit6).l,a0
		bsr.s	_drawDigit
		bsr.s	_drawDigit
		bsr.s	_drawDigit
		bsr.s	_drawDigitZero
		rts

; The slot number (d0 = slot + 1) as one digit column at a1.
DrawSaveSlotNumber:
		clr.w	d7
		move.b	d0,d7
		jsr	(j_ConvertToBase10).l
		lea	(g_Base10Digit9).l,a0
		bsr.s	_drawDigitZero
		rts

; Current and maximum hearts as two 2-digit numbers at a1 with a
; gap column between them. The JP and beta ROMs assembled two of
; the bsr's short, hence the region conditionals.
DrawSaveHealthNumbers:
		bsr.s	GetHeartCounts
		move.l	d3,-(sp)
		move.b	d2,d7
		ext.w	d7
		jsr	(j_ConvertToBase10).l
		lea	(g_Base10Digit8).l,a0
	if	((REGION=JP)!(REGION=US_BETA))
		bsr.s	_drawDigit
	else
		bsr.w	_drawDigit
	endif
		bsr.s	_drawDigitZero
		addq.l	#$02,a1
		move.l	(sp)+,d7
		ext.w	d7
		jsr	(j_ConvertToBase10).l
		lea	(g_Base10Digit8).l,a0
		bsr.w	_drawDigit
	if	((REGION=JP)!(REGION=US_BETA))
		bsr.s	_drawDigitZero
	else
		bsr.w	_drawDigitZero
	endif
		rts

; d2/d3 = current/max health in whole hearts: the health high byte
; plus one (zero stays zero), capped at 99.
GetHeartCounts:
		clr.l	d2
		move.w	(Player_CurrentHealth).l,d2
		beq.s	_ghcMax
		addi.w	#$0100,d2

_ghcMax:
		lsr.w	#$08,d2
		clr.l	d3
		move.w	(Player_MaxHealth).l,d3
		beq.s	_ghcCapCur
		addi.w	#$0100,d3

_ghcCapCur:
		lsr.w	#$08,d3
		cmpi.w	#$0064,d2
		bcs.s	_ghcCapMax
		moveq	#$00000063,d2

_ghcCapMax:
		cmpi.w	#$0064,d3
		bcs.s	_ghcDone
		moveq	#$00000063,d3

_ghcDone:
		rts

; The 50+ marker at a1 (2x2 tiles, right half H-flipped): filled
; ($98) once the current hearts pass 50, hollow ($96) while only
; the maximum does, nothing below that.
DrawHeartOverflowIcon:
		move.w	#$0098,d0
		move.b	#$33,d1
		cmp.b	d1,d2
		bcc.s	_dhoDraw
		move.w	#$0096,d0
		cmp.b	d1,d3
		bcs.s	_dhoDone

_dhoDraw:
		move.w	d0,d1
		move.w	d0,(a1)
		ori.w	#$0800,d0
		move.w	d0,$00000002(a1)
		addq.w	#$01,d1
		move.w	d1,$00000050(a1)
		ori.w	#$0800,d1
		move.w	d1,$00000052(a1)

_dhoDone:
		rts

; The heart-decade gauge, drawn right-to-left from a1: one 2-tile
; segment per decade of max hearts, choosing among tiles $9A-$A6 by
; where the current (d2, reduced by 50 once past it) and maximum
; (d3) counts fall relative to each decade boundary (11/21/31/41).
DrawHeartMeter:
		cmpi.b	#$33,d2
		bcs.s	_dhmChk
		subi.b	#$32,d2

_dhmChk:
		cmpi.b	#$0B,d2
		bcc.w	_dhmCur10
		cmpi.b	#$0B,d3
		bcs.w	_msDone
		move.w	#$00A4,d0
		bsr.w	_drawMeterSegment
		move.w	#$009A,d0
		cmpi.b	#$15,d3
		bcs.s	_dhmLast
		move.w	#$009E,d0

_dhmSeg2:
		bsr.w	_drawMeterSegment
		move.w	#$009A,d0
		cmpi.b	#$1F,d3
		bcs.s	_dhmLast
		move.w	#$009E,d0

_dhmSeg3:
		bsr.s	_drawMeterSegment
		move.w	#$009A,d0
		cmpi.b	#$29,d3
		bcs.s	_dhmLast
		move.w	#$009E,d0

_dhmSeg4:
		bsr.s	_drawMeterSegment
		move.w	#$009A,d0

_dhmLast:
		bsr.s	_drawMeterSegment
		rts

_dhmCur10:
		move.w	#$00A6,d0
		bsr.s	_drawMeterSegment
		cmpi.b	#$15,d2
		bcc.s	_dhmCur20
		move.w	#$009C,d0
		cmpi.b	#$15,d3
		bcs.s	_drawMeterSegment
		move.w	#$00A2,d0
		bra.s	_dhmSeg2

_dhmCur20:
		move.w	#$00A0,d0
		bsr.s	_drawMeterSegment
		cmpi.b	#$1F,d2
		bcc.s	_dhmCur30
		move.w	#$009C,d0
		cmpi.b	#$1F,d3
		bcs.s	_drawMeterSegment
		move.w	#$00A2,d0
		bra.s	_dhmSeg3

_dhmCur30:
		move.w	#$00A0,d0
		bsr.s	_drawMeterSegment
		cmpi.b	#$29,d2
		bcc.s	_dhmCur40
		move.w	#$009C,d0
		cmpi.b	#$29,d3
		bcs.s	_drawMeterSegment
		move.w	#$00A2,d0
		bra.s	_dhmSeg4

_dhmCur40:
		move.w	#$00A0,d0
		bsr.s	_drawMeterSegment
		move.w	#$009C,d0
						  ; falls through for the last
						  ; segment
; One gauge segment, right-to-left: top tile d0 at -(a1), bottom on
; the next row.
_drawMeterSegment:
		move.w	d0,-(a1)
		addq.w	#$01,d0
		move.w	d0,$00000050(a1)

_msDone:
		rts

; The last decade as up to ten small hearts in two rows of five at
; a1: one cell per max heart (d3 counts down), the first
; current-mod-10 (zero drawing as ten) filled - $A8 empty, $A9
; filled.
DrawHeartUnits:
		addi.w	#$000A,d2
		divu.w	#$000A,d2
		swap	d2
		tst.w	d2
		bne.s	_dhuTiles
		moveq	#$0000000A,d2

_dhuTiles:
		move.w	#$00A8,d0
		move.w	#$00A9,d1
		moveq	#$00000001,d6

_dhuRow:
		moveq	#$00000004,d7

_dhuCell:
		tst.b	d3
		beq.s	_dhuDone
		subq.b	#$01,d3
		move.w	d0,(a1)
		tst.b	d2
		beq.s	_dhuNext
		subq.b	#$01,d2
		move.w	d1,(a1)

_dhuNext:
		addq.l	#$02,a1
		dbf	d7,_dhuCell
		lea	$00000046(a1),a1
		dbf	d6,_dhuRow

_dhuDone:
		rts

; The save's location name: number the window's 14-column text
; strip with sequential tiles from d0, render the location string
; as glyphs in g_ScreenBuffer, then DMA the rendered glyph graphics
; into those tiles.
DrawSaveLocationName:
		move.w	#$000D,d7
		bsr.w	WriteTileStrip
		bsr.w	ClearTextBuffer
		move.w	#$0070,(g_TextCursorX).l
		move.l	d0,-(sp)
		jsr	(j_GetSaveLocationString).l
		bsr.w	_drawGlyphs
		move.l	(sp)+,d0
		andi.w	#$03FF,d0
		lsl.w	#$05,d0			  ; VRAM address of tile d0
		movea.w	d0,a1
		move.w	(g_TextCursorX).l,d1
		subi.w	#$0070,d1
		lsr.w	#$03,d1
		addq.w	#$01,d1
		lsl.w	#$06,d1
		lea	(g_ScreenBuffer).l,a0
		lea	(a0,d1.w),a0
		move.w	#$01C0,d0
		moveq	#$00000002,d1
		jsr	(j_DoDMACopy).l
		rts

; Writes d7+1 columns of sequentially numbered tiles at a1,
; starting from d0 (top d0, bottom d0+1, next column d0+2...).
WriteTileStrip:
		move.w	d0,d1

_wtsCol:
		move.w	d1,(a1)+
		addq.w	#$01,d1
		move.w	d1,$0000004E(a1)
		addq.w	#$01,d1
		dbf	d7,_wtsCol
		rts

; DMAs the rendered text glyphs (g_ScreenBuffer, $480 words) to the
; text tile area at VRAM $50C0.
DMACopyTextBuffer:
		lea	(g_ScreenBuffer).l,a0
		lea	($000050C0).w,a1
		move.w	#$0480,d0
		moveq	#$00000002,d1
		jsr	(j_DoDMACopy).l
		rts

; Resets the text cursor and fills g_ScreenBuffer with $AA pixels
; (the text background colour).
ClearTextBuffer:
		clr.w	(g_TextCursorX).l
		clr.b	(g_TextCursorY).l
		lea	(g_ScreenBuffer).l,a1
		move.l	#$AAAAAAAA,d1
		move.w	#$027F,d7

_ctbFill:
		move.l	d1,(a1)+
		dbf	d7,_ctbFill
		rts

; Loads uncompressed string d1 (leaving a2 = text, d7 = length-1)
; and falls through to render it at the text cursor. IDA called it
; j_j_LoadUncompressedString.
DrawUncompressedString:
		jsr	(j_LoadUncompressedString).l

; Renders d7+1 glyphs from (a2) into g_ScreenBuffer.
_drawGlyphs:
		clr.w	d0
		move.b	(a2)+,d0
		movem.l	d7/a2,-(sp)
		jsr	(j_DrawTextGlyph).l
		movem.l	(sp)+,d7/a2
		dbf	d7,_drawGlyphs
		rts

; Loads the select screen: the font and window art into VRAM, the
; screen tilemap into g_Buffer, and a pristine copy of the first
; window's 18x10 cells into g_SaveWindowTemplate for later redraws.
LoadGameSelectMenu:
		move.w	#$0000,d0
		move.w	#$0000,d1
		clr.w	d2
		jsr	(j_DoDMAFill).l
		lea	LoadGameScreenCharsCmp(pc),a0
		lea	(g_Buffer).l,a1
		lea	($00001000).w,a2
		jsr	(j_LoadCompressedGfx).l	  ; a0 - compressed graphics source
						  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination
		lea	LoadGameScreenGfxCmp(pc),a0
		lea	(g_Buffer).l,a1
		lea	($00002000).w,a2
		jsr	(j_LoadCompressedGfx).l	  ; a0 - compressed graphics source
						  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination
		lea	LoadGameScreenTilemapCmp(pc),a0
		lea	(g_Buffer).l,a1
		jsr	(j_DecompTilemap).l
		lea	((g_Buffer+$56)).l,a0
		lea	(g_SaveWindowTemplate).l,a1
		moveq	#$00000011,d6
		moveq	#$00000009,d7
		bsr.w	CopyTileRect
		rts

; Fills palette lines 0, 1 and 3 from GameStartPalette (line 2 is
; the player palette, loaded separately): line 0 from the asset,
; line 1 copied from line 0, and - via the fall-through with a0
; left pointing at line 1 - line 3 copied from line 1.
LoadGameStartPalette:
		lea	GameStartPalette(pc),a0
		lea	(g_Pal0Base).l,a1
		bsr.s	CopyPalette_0
		lea	(g_Pal0Base).l,a0
		lea	$00000020(a0),a1
		bsr.w	CopyPalette_0
		lea	$00000040(a0),a1

; Copies 16 colours (a0)+ to (a1)+.
CopyPalette_0:
		moveq	#$0000000F,d7

_cpColour:
		move.w	(a0)+,(a1)+
		dbf	d7,_cpColour
		rts

		modend
