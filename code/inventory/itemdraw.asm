ItemDraw	module
; The item screen's engine room: slot drawing (icons, names,
; quantities), the scrolling item window, the cursor and
; scroll-arrow sprites, d-pad auto-repeat, the menu font and cursor
; graphics loaders, and the A/C select handler. Called from the
; RunItemMenu loop in itemmenu.asm (which the select handler
; jumps back into) and from the equip/save screens in
; equipmenu/equipmenudraw.
;
; The FR/DE builds replace the 8x8 menu font with a larger
; two-bank font, so the text drawing and the icon/cursor tile
; bases are region-conditional throughout.

; Draw one item slot: d0 = item id, a0 = its spot in the window
; working copy (from GetInvWindowPtr). Unowned items (quantity
; $FFFF) draw nothing; a quantity of 0 draws the slot greyed out
; (d1 flag = 1, palette line 2). Icon first, then the name below
; it, then - unless d2 from GetItemQtyAndMaxQty says otherwise -
; the xN quantity.
PopulateItemSlot:
		jsr	(j_GetItemQtyAndMaxQty).l
		cmpi.w	#$FFFF,d1
		bne.s	_pisOwned
		rts
; ---------------------------------------------------------------------------

_pisOwned:
		tst.w	d1
		beq.s	_pisGreyed
		clr.l	d1
		bra.s	_pisDraw
; ---------------------------------------------------------------------------

_pisGreyed:
		moveq	#$00000001,d1

_pisDraw:
		movem.w	d1,-(sp)
	if ((REGION=FR)!(REGION=DE))
		movem.l	a0,-(sp)
	endif
		bsr.w	DrawItemIcon
	if ((REGION=FR)!(REGION=DE))
		movem.l	(sp)+,a0
	endif
		movem.w	(sp)+,d1
	if REGION=JP
		lea	-$8E(a0),a0
	elseif ((REGION=FR)!(REGION=DE))
		movem.l	a0,-(sp)
		lea	8(a0),a0
	else
		lea	-$D6(a0),a0
		movem.l	a0,-(sp)
	endif
		bsr.s	DrawItemName
		jsr	(j_GetItemQtyAndMaxQty).l
	if ~(REGION=JP)
		movem.l	(sp)+,a0
	endif
		tst.w	d2
		bne.s	_pisDone
	if ((REGION=FR)!(REGION=DE))
		lea	$AC(a0),a0
	elseif ~(REGION=JP)
		lea	$5A(a0),a0
	endif
		bsr.s	_drawQuantity

_pisDone:
		rts

; Draw the slot's quantity (d1, fresh from GetItemQtyAndMaxQty):
; the x sign (CHR_MULT) then the count as a digit character (value
; + 1) - in the greyed palette when the quantity is 0.
_drawQuantity:
		tst.b	d1
		beq.s	_dqGreyed
		move.w	#$A000,d0
		bra.s	_dqDraw
; ---------------------------------------------------------------------------

_dqGreyed:
		move.w	#$C000,d0

_dqDraw:
		move.b	#CHR_MULT,d0
	if ((REGION=FR)!(REGION=DE))
		bsr.w	_frGlyphRaw
	else
		move.w	d0,(a0)+
	endif
		move.b	d1,d0
		addq.b	#$01,d0
	if ((REGION=FR)!(REGION=DE))
		bsr.w	_frGlyphMapped
	else
		move.w	d0,(a0)+
	endif
		rts

; Draw an item name into the slot: d0 = the item id, d1 = the
; greyed flag selecting the palette (swapped on entry, so the
; string loader sees the id in d1). The name characters
; stream from LoadUncompressedString; the menu control characters
; wrap to the slot's second line - CHR_MENU_HYPHENATION_POINT
; draws a dash first, CHR_MENU_BREAKING_SPACE / BREAK_POINT wrap
; silently. Japanese has no wrapping here: it reuses those two
; codes for the voicing marks, drawn a row above the cursor
; without advancing it so they combine with the preceding kana.
; Also used by the equip screen (equipmenudraw). The FR/DE
; variant instead maps each character through the two-bank menu
; font (_frGlyph and friends below).
DrawItemName:
	if REGION=JP
		movem.w	d0,-(sp)
	elseif ((REGION=FR)!(REGION=DE))
		movem.w	d0-d2,-(sp)
	else
		movem.w	d0-d1,-(sp)
	endif
		exg	d0,d1
		jsr	(j_LoadUncompressedString).l
		movea.l	a0,a1
		tst.b	d0
		bne.s	_dnGreyPal
		move.w	#$A000,d0
		bra.s	_dnChar
; ---------------------------------------------------------------------------

_dnGreyPal:
		move.w	#$C000,d0

_dnChar:
	if ~((REGION=FR)!(REGION=DE))
		move.b	(a2)+,d0
	if ~(REGION=JP)
		cmpi.b	#CHR_MENU_HYPHENATION_POINT,d0
		bne.s	_dnBreakSpace
		move.b	#CHR_DASH,d0
		move.w	d0,(a0)
		lea	$00000048(a1),a0
		bra.w	_dnNext
	endif
; ---------------------------------------------------------------------------

_dnBreakSpace:
	if	REGION=JP
		cmpi.b	#CHR_MENU_DAKUTEN,d0
	else
		cmpi.b	#CHR_MENU_BREAKING_SPACE,d0
	endif
		bne.s	_dnBreakPoint
	if	REGION=JP
		move.w	d0,-$48(a0)	  ; Voicing mark: one row up, cursor stays put
	else
		lea	$00000048(a1),a0
	endif
		bra.w	_dnNext
; ---------------------------------------------------------------------------

_dnBreakPoint:
	if	REGION=JP
		cmpi.b	#CHR_MENU_HANDAKUTEN,d0
	else
		cmpi.b	#CHR_MENU_BREAK_POINT,d0
	endif
		bne.s	_dnPutChar
	if	REGION=JP
		move.w	d0,-$48(a0)	  ; Voicing mark: one row up, cursor stays put
	else
		lea	$00000048(a1),a0
	endif
		bra.w	_dnNext
; ---------------------------------------------------------------------------

_dnPutChar:
		move.w	d0,(a0)+

_dnNext:
		dbf	d7,_dnChar
		lea	$00000012(a1),a0
	if REGION=JP
		movem.w	(sp)+,d0
	else
		movem.w	(sp)+,d0-d1
	endif
		rts
	else		; French/German menu text parsing
_dnFr:
		clr.w	d2

_dnFrChar:
		move.b	(a2)+,d0
		cmpi.b	#CHR_MENU_BREAK_POINT,d0
	if REGION=DE
		beq.w	_dnFrDash
	else
		beq.w	_dnFrWrap
	endif
		cmpi.b	#CHR_MENU_BREAKING_SPACE,d0
		beq.w	_dnFrWrap
		cmpi.b	#CHR_MENU_HYPHENATION_POINT,d0
		bne.s	_dnFrPut

_dnFrDash:
		move.b	#CHR_DASH,d0
		bsr.w	_frGlyph

_dnFrWrap:
		lea	$90(a1),a0
		moveq	#1,d2
		bra.w	_dnFrNext

_dnFrPut:
		bsr.w	_frGlyph

_dnFrNext:
		dbf	d7,_dnFrChar
		lea	$12(a1),a0
		movem.w	(sp)+,d0-d2
		rts

; Draw character d0 from the second font bank: map it, then fall
; into the raw draw with the bank offset added.
_frGlyphMapped:
		bsr.w	_frMapChar

_frGlyphRaw:
		movem.w	d0,-(sp)
		asl.b	#$01,d0
	if REGION=FR
		addi.w	#$98,d0
	elseif REGION=DE
		addi.w	#$92,d0
	endif
		move.w	d0,(a0)+
		addq.b	#$01,d0
		move.w	d0,$46(a0)
		movem.w	(sp)+,d0
		rts

; Draw one name character: on the wrapped second line (d2 set) use
; the second font bank, otherwise map and draw from the first.
; Every glyph is two tiles (the second row at $46(a0)).
_frGlyph:
		tst.b	d2
		bne.s	_frGlyphMapped
		bsr.w	_frMapChar
		asl.b	#$01,d0
		move.w	d0,(a0)+
		addq.b	#$01,d0
		move.w	d0,$46(a0)
		rts

; Map text characters past the letters (apostrophe, dash,
; accented) onto the menu font's glyph indices. The alphabet ends
; at lowercase z in French and at uppercase Z in the caps-only
; German font, so the cutoff is per-region.
_frMapChar:
		cmpi.b	#(CHR_LAST_LETTER+1),d0
		bcc.s	_fmcPunct

_fmcDone:
		rts

_fmcPunct:
	if REGION=FR
		cmpi.b	#CHR_APOSTROPHE,d0
		bne.s	_fmcDash
		move.b	#CHR_MENU_APOSTROPHE,d0
		rts
	endif

_fmcDash:
		cmpi.b	#CHR_DASH,d0
		bne.s	_fmcShift
		move.b	#CHR_MENU_DASH,d0
		rts

_fmcShift:
	if REGION=FR
		subi.b	#$15,d0
	elseif REGION=DE
		subi.b	#$FC,d0
	endif
		rts
	endif

; Draw an item's 4x4-tile icon at a0: tile = icon base + item * 16
; (the icons are stored column-major, 16 tiles each), on palette
; line 1, or line 2 (greyed) when the d1 flag is set. Also used by
; the equip screen (equipmenu).
DrawItemIcon:
		movem.w	d0-d1,-(sp)
		tst.b	d1
		bne.s	_diiGrey
	if REGION=FR
		move.w	#$A144,d1
	elseif REGION=DE
		move.w	#$A140,d1
	else
		move.w	#$A0BC,d1
	endif
		bra.w	_diiDraw
; ---------------------------------------------------------------------------

_diiGrey:
	if REGION=FR
		move.w	#$C144,d1
	elseif REGION=DE
		move.w	#$C140,d1
	else
		move.w	#$C0BC,d1
	endif

_diiDraw:
		andi.w	#$003F,d0
		mulu.w	#$0010,d0
		add.w	d1,d0
		moveq	#$00000003,d7

_diiRow:
		move.w	d0,(a0)
		addq.w	#$04,d0
		move.w	d0,$00000002(a0)
		addq.w	#$04,d0
		move.w	d0,$00000004(a0)
		addq.w	#$04,d0
		move.w	d0,$00000006(a0)
		subi.w	#$000B,d0
		lea	$00000048(a0),a0
		dbf	d7,_diiRow
		lea	$00000008(a0),a0
		movem.w	(sp)+,d0-d1
		rts
	modend
