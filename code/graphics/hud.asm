Hud	module
; The in-game HUD strip, drawn into two tilemap row buffers
; (g_HUD_Row2 / g_HUD_Row3, +$80 = one row down) and uploaded by
; j_QueuePartialHUDTilemapDMA when g_UpdateHUDFlag bit 7 is set.
; Left to right: the sword-charge meter (+8), the heart gauge - big
; heart (+$16), five medium-heart columns (+$1A) and the wide
; fractional heart (+$24) - the current/max health digits (+$2E /
; +$34), the Eke-Eke count (+$3E) and the gold count (+$42).
;
; Numbers are 1x2-tile digits. ConvertToBase10 digits are value+1
; with 0 = leading blank, and when a value overflows its field the
; leading-digit test forces every drawn digit to $0A - the "9"
; glyph - so health caps at "99", Eke-Eke at "9", gold at "9999".
; Health display values are the health word's high byte + 1 (0
; stays 0).

; Redraw every HUD element; falls through into MarkHUDForUpdate to
; queue the tilemap upload.
RefreshAllHUD:
		bsr.w	RefreshCurrentHealthHUD
		bsr.w	RefreshMaxHealthHUD
		bsr.w	RefreshGoldHUD
		bsr.w	RefreshSwordChargeHUD
		bsr.w	UpdateEkeEkeHUD

; Flag the HUD rows for upload on the next RefreshHUD.
MarkHUDForUpdate:
		bset	#$07,(g_UpdateHUDFlag).l
		rts

; Current health changed: redraw the health digits and the heart
; gauge.
RefreshCurrentHealthHUD:
		movem.l	d0-d3/d7-a1,-(sp)
		bsr.w	UpdateCurrentHealthHUD
		bsr.w	UpdateHeartHUD
		movem.l	(sp)+,d0-d3/d7-a1
		rts

; Upload the HUD rows if anything marked them dirty.
RefreshHUD:
		bclr	#$07,(g_UpdateHUDFlag).l
		beq.s	_rhDone
		jsr	(j_QueuePartialHUDTilemapDMA).l

_rhDone:
		rts

; Digit byte d0 -> tilemap words: d1 = top tile, d2 = bottom tile.
; 0 gives the blank pair ($66BC/$66BA); otherwise $66BF+d0 and the
; tile $10 below it ($01 = glyph "0" ... $0A = glyph "9").
_digitTiles:
		ext.w	d0
		move.w	#$66BC,d1
		move.w	#$66BA,d2
		tst.b	d0
		beq.s	_dtDone
		move.w	#$66BF,d1
		add.w	d0,d1
		move.w	#$0010,d2
		add.w	d1,d2

_dtDone:
		rts

; Max health changed: redraw the max digits and the heart gauge.
RefreshMaxHealthHUD:
		movem.l	d0-d3/d7-a1,-(sp)
		bsr.s	UpdateMaxHealthHUD
		bsr.w	UpdateHeartHUD
		movem.l	(sp)+,d0-d3/d7-a1
		rts

; Draw the two max-health digits at row offset $34, "99" if the
; value reached three digits.
UpdateMaxHealthHUD:
		moveq	#$00000000,d7
		move.w	(Player_MaxHealth).l,d7
		beq.s	_umhConvert
		addi.w	#$0100,d7

_umhConvert:
		lsr.w	#$08,d7
		jsr	(j_ConvertToBase10).l
		lea	(g_Base10Digit7).l,a0
		lea	((g_HUD_Row2+$34)).l,a1
		tst.b	(a0)+
		beq.s	_umhDraw
		move.b	#$0A,(a0)
		move.b	#$0A,$00000001(a0)

_umhDraw:
		bsr.w	UpdateHUDDigits
		bsr.w	UpdateHUDDigits
		rts

; Draw the two current-health digits at row offset $2E, "99" if the
; value reached three digits.
UpdateCurrentHealthHUD:
		moveq	#$00000000,d7
		move.w	(Player_CurrentHealth).l,d7
		beq.s	_uchConvert
		addi.w	#$0100,d7

_uchConvert:
		lsr.w	#$08,d7
		jsr	(j_ConvertToBase10).l
		lea	(g_Base10Digit7).l,a0
		lea	((g_HUD_Row2+$2E)).l,a1
		tst.b	(a0)+
		beq.s	_uchDraw
		move.b	#$0A,(a0)
		move.b	#$0A,$00000001(a0)

_uchDraw:
		bsr.w	UpdateHUDDigits
		bsr.w	UpdateHUDDigits
		rts

; Redraw the whole heart gauge.
UpdateHeartHUD:
		bsr.s	InitHeartHUD
		bsr.s	UpdateBigHeartHUD
		bsr.s	UpdateMediumHeartHUD
		bsr.w	UpdateSmallHeartHUD
		rts

; Compute the display values - d2 = current, d3 = max - and blank
; the gauge's 12 columns on both rows.
InitHeartHUD:
		move.w	(Player_CurrentHealth).l,d2
		beq.s	_ihMax
		addi.w	#$0100,d2

_ihMax:
		lsr.w	#$08,d2
		move.w	(Player_MaxHealth).l,d3
		beq.s	_ihBlank
		addi.w	#$0100,d3

_ihBlank:
		lsr.w	#$08,d3
		lea	((g_HUD_Row2+$16)).l,a0
		move.w	#$000B,d7

_ihLoop:
		move.w	#$66BA,$00000080(a0)
		move.w	#$66BC,(a0)+
		dbf	d7,_ihLoop
		rts

; The 2x2 big heart at the gauge's left - the 50-point tier marker:
; filled ($66E3) once current health reaches $33, outlined ($66E2)
; while only the max does, absent below that. The right half is the
; same tiles h-flipped ($800), the bottom row is +$10.
UpdateBigHeartHUD:
		lea	((g_HUD_Row2+$16)).l,a0
		move.w	#$66E3,d0
		cmpi.b	#$33,d2
		bcc.s	_bhDraw
		move.w	#$66E2,d0
		cmpi.b	#$33,d3
		bcs.s	_bhDone

_bhDraw:
		move.w	d0,d1
		move.w	d0,(a0)
		ori.w	#$0800,d0
		move.w	d0,$00000002(a0)
		addi.w	#$0010,d1
		move.w	d1,$00000080(a0)
		ori.w	#$0800,d1
		move.w	d1,$00000082(a0)

_bhDone:
		rts

; The five 1x2 columns between the big heart and the fractional
; heart: up to four overlapping medium hearts. Heart n exists when
; max health (d3) passes n*10 (the $0B/$15/$1F/$29 thresholds) and
; is filled - never partially - when current health (d2, minus $32
; once past the big heart's 50-point tier) does. Drawn right to
; left from offset $24 with heart 1 rightmost; each tile is a
; heart segment: $66E1/$66E0 is heart 1's unshared right-edge
; column (filled/empty), and every other column is shared between
; two hearts - a lone half $66CC (filled) / $66CB (empty) when the
; next heart does not exist, or an overlapping pair $66CE (both
; filled), $66CF (right filled, left empty - the fill boundary) or
; $66CD (both empty). Falls into _drawHeartTile for the last
; column.
UpdateMediumHeartHUD:
		lea	((g_HUD_Row2+$24)).l,a0
		cmpi.b	#$33,d2
		bcs.s	_mhLowTier
		subi.b	#$32,d2

_mhLowTier:
		cmpi.b	#$0B,d2
		bcc.s	_mhHeart1Full
		cmpi.b	#$0B,d3
		bcs.w	_mhRts
		move.w	#$66E0,d0
		bsr.w	_drawHeartTile
		move.w	#$66CB,d0
		cmpi.b	#$15,d3
		bcs.s	_mhLast
		move.w	#$66CD,d0

_mhHeart2:
		bsr.w	_drawHeartTile
		move.w	#$66CB,d0
		cmpi.b	#$1F,d3
		bcs.s	_mhLast
		move.w	#$66CD,d0

_mhHeart3:
		bsr.s	_drawHeartTile
		move.w	#$66CB,d0
		cmpi.b	#$29,d3
		bcs.s	_mhLast
		move.w	#$66CD,d0

_mhHeart4:
		bsr.s	_drawHeartTile
		move.w	#$66CB,d0

_mhLast:
		bra.s	_drawHeartTile
; ---------------------------------------------------------------------------

_mhHeart1Full:
		move.w	#$66E1,d0
		bsr.s	_drawHeartTile
		cmpi.b	#$15,d2
		bcc.s	_mhHeart2Full
		move.w	#$66CC,d0
		cmpi.b	#$15,d3
		bcs.s	_drawHeartTile
		move.w	#$66CF,d0
		bra.s	_mhHeart2
; ---------------------------------------------------------------------------

_mhHeart2Full:
		move.w	#$66CE,d0
		bsr.s	_drawHeartTile
		cmpi.b	#$1F,d2
		bcc.s	_mhHeart3Full
		move.w	#$66CC,d0
		cmpi.b	#$1F,d3
		bcs.s	_drawHeartTile
		move.w	#$66CF,d0
		bra.s	_mhHeart3
; ---------------------------------------------------------------------------

_mhHeart3Full:
		move.w	#$66CE,d0
		bsr.s	_drawHeartTile
		cmpi.b	#$29,d2
		bcc.s	_mhHeart4Full
		move.w	#$66CC,d0
		cmpi.b	#$29,d3
		bcs.s	_drawHeartTile
		move.w	#$66CF,d0
		bra.s	_mhHeart4
; ---------------------------------------------------------------------------

_mhHeart4Full:
		move.w	#$66CE,d0
		bsr.s	_drawHeartTile
		move.w	#$66CC,d0
; falls through into _drawHeartTile

; Draw tile d0 (top) and d0+$10 (bottom) one column to the left
; (a0 pre-decremented).
_drawHeartTile:
		move.w	d0,-(a0)
		addi.w	#$0010,d0
		move.w	d0,$00000080(a0)

_mhRts:
		rts

; The wide 5x2 fractional heart at offset $24. First draw row
; min(max, 10) of SmallHeartTiles as the outline (tile = byte +
; $66B4, 5 bytes per tilemap row), then overdraw the current fill:
; row current%10 (a remainder of 0 counts as a full 10) with the
; +$66B5 tile variants, stopping at the outline's edge (a table
; byte below $0A aborts the rest of the update).
UpdateSmallHeartHUD:
		clr.w	d0
		move.b	d3,d0
		cmpi.b	#$0A,d0
		bls.s	_shOutline
		move.b	#$0A,d0

_shOutline:
		mulu.w	#$000A,d0
		lea	_shTileBase(pc),a1
		lea	((g_HUD_Row2+$24)).l,a0
		moveq	#$00000004,d7
		bsr.w	_drawTiles
		lea	((g_HUD_Row3+$24)).l,a0
		moveq	#$00000004,d7
		bsr.w	_drawTiles
		clr.w	d0
		move.b	d2,d0
		beq.s	_shRts
		divu.w	#$000A,d0
		swap	d0
		tst.w	d0
		bne.s	_shFill
		move.b	#$0A,d0

_shFill:
		mulu.w	#$000A,d0
		lea	_shTileBase(pc),a1
		lea	((g_HUD_Row2+$24)).l,a0
		moveq	#$00000004,d7
		bsr.s	_shFillTop
		lea	((g_HUD_Row3+$24)).l,a0
		moveq	#$00000004,d7
		bsr.s	_shFillBottom
		rts

; Fill pass, top row: tile = byte + $66B5; a byte below $0A ends
; the whole update (_shAbort). A $30 byte becomes $32 when it sits
; above the outline's $66E8 bottom tile (joining the two halves).
_shFillTop:
		clr.w	d1
		move.b	(a1,d0.w),d1
		cmpi.b	#$0A,d1
		bcs.s	_shAbort
		cmpi.b	#$30,d1
		bne.s	_sftDraw
		cmpi.w	#$66E8,$00000080(a0)
		bne.s	_sftDraw
		addq.b	#$02,d1

_sftDraw:
		addi.w	#$66B5,d1
		move.w	d1,(a0)+
		addq.w	#$01,d0
		dbf	d7,_shFillTop
		rts
; ---------------------------------------------------------------------------

; Early out: pop the return address so the rts leaves
; UpdateSmallHeartHUD itself.
_shAbort:
		movem.l	(sp)+,d0

_shRts:
		rts

; Fill pass, bottom row: as _shFillTop without the join case.
_shFillBottom:
		clr.w	d1
		move.b	(a1,d0.w),d1
		cmpi.b	#$0A,d1
		bcs.s	_shAbort
		addi.w	#$66B5,d1

; The fill/outline rows are indexed 1-10 from here (offsets
; $0A-$6D), so row 1 is SmallHeartTiles itself and row 0 would
; read the code above - never used, as a zero max/fill is caught
; by the callers.
_shTileBase:
		move.w	d1,(a0)+
		addq.w	#$01,d0
		dbf	d7,_shFillBottom
		rts

; 10 fill levels x 10 bytes (5 top tiles + 5 bottom), added to
; $66B4 (outline pass) or $66B5 (fill pass).
SmallHeartTiles:dc.b $30,$08,$08,$08,$08,$06,$06,$06,$06,$06
		dc.b $30,$30,$08,$08,$08,$06,$06,$06,$06,$06
		dc.b $30,$30,$30,$08,$08,$06,$06,$06,$06,$06
		dc.b $30,$30,$30,$30,$08,$06,$06,$06,$06,$06
		dc.b $30,$30,$30,$30,$30,$06,$06,$06,$06,$06
		dc.b $32,$30,$30,$30,$30,$34,$06,$06,$06,$06
		dc.b $32,$32,$30,$30,$30,$34,$34,$06,$06,$06
		dc.b $32,$32,$32,$30,$30,$34,$34,$34,$06,$06
		dc.b $32,$32,$32,$32,$30,$34,$34,$34,$34,$06
		dc.b $32,$32,$32,$32,$32,$34,$34,$34,$34,$34

; Draw the Eke-Eke count at row offset $3E: one digit, "9" if the
; quantity reached two digits (a negative quantity - no Eke-Eke -
; draws as 0, i.e. blank).
UpdateEkeEkeHUD:
		moveq	#$00000000,d7
		move.b	#ITM_EKEEKE,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		move.b	d1,d7
		bpl.s	_ueConvert
		moveq	#$00000000,d7

_ueConvert:
		jsr	(j_ConvertToBase10).l
		lea	(g_Base10Digit8).l,a0
		lea	((g_HUD_Row2+$3E)).l,a1
		tst.b	(a0)+
		beq.s	_ueDraw
		move.b	#$0A,(a0)

_ueDraw:
		bsr.w	UpdateHUDDigits
		rts

; Draw the four gold digits at row offset $42, "9999" if the value
; reached five digits, and queue the upload.
RefreshGoldHUD:
		movem.l	d0-d2/d7-a1,-(sp)
		moveq	#$00000000,d7
		move.w	(g_Gold).l,d7
		jsr	(j_ConvertToBase10).l
		lea	(g_Base10Digit5).l,a0
		lea	((g_HUD_Row2+$42)).l,a1
		tst.b	(a0)+
		beq.s	_rgDraw
		move.b	#$0A,(a0)
		move.b	#$0A,$00000001(a0)
		move.b	#$0A,$00000002(a0)
		move.b	#$0A,$00000003(a0)

_rgDraw:
		bsr.s	UpdateHUDDigits
		bsr.s	UpdateHUDDigits
		bsr.s	UpdateHUDDigits
		bsr.s	UpdateHUDDigits
		bsr.w	MarkHUDForUpdate
		movem.l	(sp)+,d0-d2/d7-a1
		rts

; Draw one 1x2 digit: consume the digit byte at (a0)+ and write its
; tile pair at (a1)+ / row below.
UpdateHUDDigits:
		move.b	(a0)+,d0
		bsr.w	_digitTiles
		move.w	d2,$00000080(a1)
		move.w	d1,(a1)+
		rts

; The sword-charge meter at row offset 8: copy charge level
; g_SwordChargeMeter's 7-tile row from SwordChargeTiles (falling
; into _drawTiles, which also queues the upload).
RefreshSwordChargeHUD:
		clr.w	d0
		move.b	(g_SwordChargeMeter).l,d0
		mulu.w	#$0007,d0
		moveq	#$00000006,d7
		lea	((g_HUD_Row2+8)).l,a0
		lea	SwordChargeTiles(pc),a1
; falls through into _drawTiles

; Copy d7+1 table bytes from (a1,d0) as tiles (+ $66B4) to (a0)+,
; then mark the HUD for upload. Also the fractional heart's
; outline pass.
_drawTiles:
		clr.w	d1
		move.b	(a1,d0.w),d1
		addi.w	#$66B4,d1
		move.w	d1,(a0)+
		addq.w	#$01,d0
		dbf	d7,_drawTiles
		bra.w	MarkHUDForUpdate

; 52 meter levels x 7 tile bytes (+ $66B4): six bar segments and an
; end cap, the bar filling $41-$48 then latching full segments at
; $49; the final row swaps in the charged end cap ($37/$4A).
SwordChargeTiles:dc.b $40,$40,$40,$40,$40,$40,$36
		dc.b $41,$40,$40,$40,$40,$40,$36
		dc.b $42,$40,$40,$40,$40,$40,$36
		dc.b $43,$40,$40,$40,$40,$40,$36
		dc.b $44,$40,$40,$40,$40,$40,$36
		dc.b $45,$40,$40,$40,$40,$40,$36
		dc.b $46,$40,$40,$40,$40,$40,$36
		dc.b $47,$40,$40,$40,$40,$40,$36
		dc.b $48,$40,$40,$40,$40,$40,$36
		dc.b $49,$41,$40,$40,$40,$40,$36
		dc.b $49,$42,$40,$40,$40,$40,$36
		dc.b $49,$43,$40,$40,$40,$40,$36
		dc.b $49,$44,$40,$40,$40,$40,$36
		dc.b $49,$45,$40,$40,$40,$40,$36
		dc.b $49,$46,$40,$40,$40,$40,$36
		dc.b $49,$47,$40,$40,$40,$40,$36
		dc.b $49,$48,$40,$40,$40,$40,$36
		dc.b $49,$49,$41,$40,$40,$40,$36
		dc.b $49,$49,$42,$40,$40,$40,$36
		dc.b $49,$49,$43,$40,$40,$40,$36
		dc.b $49,$49,$44,$40,$40,$40,$36
		dc.b $49,$49,$45,$40,$40,$40,$36
		dc.b $49,$49,$46,$40,$40,$40,$36
		dc.b $49,$49,$47,$40,$40,$40,$36
		dc.b $49,$49,$48,$40,$40,$40,$36
		dc.b $49,$49,$49,$41,$40,$40,$36
		dc.b $49,$49,$49,$42,$40,$40,$36
		dc.b $49,$49,$49,$43,$40,$40,$36
		dc.b $49,$49,$49,$44,$40,$40,$36
		dc.b $49,$49,$49,$45,$40,$40,$36
		dc.b $49,$49,$49,$46,$40,$40,$36
		dc.b $49,$49,$49,$47,$40,$40,$36
		dc.b $49,$49,$49,$48,$40,$40,$36
		dc.b $49,$49,$49,$49,$41,$40,$36
		dc.b $49,$49,$49,$49,$42,$40,$36
		dc.b $49,$49,$49,$49,$43,$40,$36
		dc.b $49,$49,$49,$49,$44,$40,$36
		dc.b $49,$49,$49,$49,$45,$40,$36
		dc.b $49,$49,$49,$49,$46,$40,$36
		dc.b $49,$49,$49,$49,$47,$40,$36
		dc.b $49,$49,$49,$49,$48,$40,$36
		dc.b $49,$49,$49,$49,$49,$41,$36
		dc.b $49,$49,$49,$49,$49,$42,$36
		dc.b $49,$49,$49,$49,$49,$43,$36
		dc.b $49,$49,$49,$49,$49,$44,$36
		dc.b $49,$49,$49,$49,$49,$45,$36
		dc.b $49,$49,$49,$49,$49,$46,$36
		dc.b $49,$49,$49,$49,$49,$47,$36
		dc.b $49,$49,$49,$49,$49,$48,$36
		dc.b $49,$49,$49,$49,$49,$49,$37
		dc.b $49,$49,$49,$49,$49,$49,$4A
		dc.b $FF

	modend
