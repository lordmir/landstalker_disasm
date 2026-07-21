Inventory4	module
; The item screen's engine room: slot drawing (icons, names,
; quantities), the scrolling item window, the cursor and
; scroll-arrow sprites, d-pad auto-repeat, the menu font and cursor
; graphics loaders, and the A/C select handler. Called from the
; RunItemMenu loop in inventory3.asm (which the select handler
; jumps back into) and from the equip/save screens in
; inventory5/6.
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
; Also used by the equip screen (inventory6). The FR/DE
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
; the equip screen (inventory5).
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

; Cursor one row up: slide the cursor sprite there in 8 4-pixel
; steps.
InvCursorUp:
		trap	#$00			  ; Trap00Handler
		dc.w SND_CursorMove

		bsr.w	GetInvCursorPos
		lea	((g_Buffer+$C)).l,a0
		subq.w	#$01,(a0)
		moveq	#$00000007,d7

_cuStep:
		bsr.w	UpdateInvCursorSprites
		subq.w	#$04,d1
		dbf	d7,_cuStep
		rts

; Cursor one row down, sliding as above.
InvCursorDown:
		trap	#$00			  ; Trap00Handler
		dc.w SND_CursorMove

		bsr.w	GetInvCursorPos
		lea	((g_Buffer+$C)).l,a0
		addq.w	#$01,(a0)
		moveq	#$00000007,d7

_cdStep:
		bsr.w	UpdateInvCursorSprites
		addq.w	#$04,d1
		dbf	d7,_cdStep
		rts

; Cursor to the left column, sliding in 12 12-pixel steps.
InvCursorLeft:
		trap	#$00			  ; Trap00Handler
		dc.w SND_CursorMove

		bsr.w	GetInvCursorPos
		lea	((g_Buffer+$A)).l,a0
		subq.w	#$01,(a0)
		moveq	#$0000000B,d7

_clStep:
		bsr.w	UpdateInvCursorSprites
		subi.w	#$000C,d0
		dbf	d7,_clStep
		bsr.w	_redrawCursor
		rts
; ---------------------------------------------------------------------------

; Cursor to the right column, sliding as above.
InvCursorRight:
		trap	#$00			  ; Trap00Handler
		dc.w SND_CursorMove

		bsr.w	_redrawCursor
		lea	((g_Buffer+$A)).l,a0
		addq.w	#$01,(a0)
		moveq	#$0000000B,d7

_crStep:
		bsr.w	UpdateInvCursorSprites
		addi.w	#$000C,d0
		dbf	d7,_crStep
		bsr.w	_redrawCursor
		rts

; Redraw the cursor at its resting position (solid, d2 = $FF from
; GetInvCursorPos), falling through into the sprite update.
_redrawCursor:
		bsr.w	GetInvCursorPos

; Update the menu sprites: the cursor (d0/d1 = position; d2 = 1
; hides it this frame, 0 blinks it on a 32-frame cycle, anything
; else draws it solid) and the scroll arrows, then waits for
; vblank.
UpdateInvCursorSprites:
		movem.w	d0-d1/d7,-(sp)
		move.l	d2,-(sp)
		bsr.w	DrawInvCursorSprite
		move.l	(sp)+,d2
		bsr.w	_drawScrollArrows
		jsr	(WaitUntilVBlank).l
		movem.w	(sp)+,d0-d1/d7
		rts

; Sprite position of the cursor's current cell: x = column * $88 +
; $A0, y = row * $20 + $A0, d2 = $FF (solid draw).
GetInvCursorPos:
		lea	((g_Buffer+$A)).l,a0
		move.w	(a0),d0
		lea	((g_Buffer+$C)).l,a1
		move.w	(a1),d1
		mulu.w	#$0088,d0
		addi.w	#$00A0,d0
		mulu.w	#$0020,d1
		addi.w	#$00A0,d1
		move.b	#$FF,d2
		rts

; The scroll arrows (VDP sprites 1-2, 2x2 tiles, blinking 32 of
; every 64 frames): the up arrow shows while the window is
; scrolled down (state +6 non-zero), the down arrow (the same
; tiles v-flipped) while more list remains below (+6 < list height
; +8 minus a screenful).
_drawScrollArrows:
		clr.w	d2
		lea	(g_VDPSpr01_Y).l,a0
		lea	(g_Buffer).l,a1
		move.w	0000000004(a1),d3
		move.w	(g_VBlankCounter).l,d4
		sub.w	d3,d4
		andi.b	#$3F,d4
		cmpi.b	#$20,d4
		bcc.s	_dsaBase
		clr.b	d4

_dsaBase:
	if REGION=FR
		move.w	#$8140,d3
	elseif REGION=DE
		move.w	#$813C,d3
	else
		move.w	#$80B8,d3
	endif
		move.b	#$05,d2
		move.w	#$0098,(a0)
		tst.w	$00000006(a1)
		bne.s	_dsaBlinkUp
		clr.w	(a0)

_dsaBlinkUp:
		tst.b	d4
		beq.s	_dsaUpArrow
		clr.w	(a0)

_dsaUpArrow:
		move.b	d2,$00000002(a0)
		move.w	d3,$00000004(a0)
		move.w	#$008E,$00000006(a0)
		lea	$00000008(a0),a0
		move.w	#$0120,(a0)
		move.w	$00000008(a1),d0
		subi.w	#$0011,d0
		move.w	$00000006(a1),d1
		cmp.w	d0,d1
		bcs.s	_dsaBlinkDown
		clr.w	(a0)

_dsaBlinkDown:
		tst.b	d4
		beq.s	_dsaDownArrow
		clr.w	(a0)

_dsaDownArrow:
		move.b	d2,$00000002(a0)
		bset	#$0C,d3
		move.w	d3,$00000004(a0)
		move.w	#$008E,$00000006(a0)
		move.w	$00000016(a0),$0000000E(a0)
		rts

; Scroll the window one sub-row up (state +6, four sub-rows per
; item row). Returns carry clear at the top of the list, else
; refreshes the window and cursor with carry set.
InvScrollUp:
		lea	(g_Buffer).l,a1
		lea	0000000006(a1),a0
		subq.w	#$01,(a0)
		bpl.s	_isuOk
		clr.w	(a0)
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

_isuOk:
		bra.s	_scrollApply
; ---------------------------------------------------------------------------

; Scroll one sub-row down, clamped to the list height (+8) minus a
; screenful ($11 sub-rows); carry clear when already at the end.
InvScrollDown:
		lea	(g_Buffer).l,a1
		lea	g_Buffer+6-g_Buffer(a1),a0
		move.w	$00000008(a1),d0
		subi.w	#$0011,d0
		move.w	(a0),d1
		cmp.w	d0,d1
		bcs.s	_isdInc
		move.w	d0,(a0)
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

_isdInc:
		addq.w	#$01,(a0)

_scrollApply:
		bsr.w	RefreshItemWindow
		bsr.w	_redrawCursor
		jsr	(WaitUntilVBlank).l
		ori	#$01,ccr
		rts

; Copy the visible $11 sub-rows of the item list (the working copy
; at state +$84, $48 bytes per sub-row, from scroll offset +6)
; into g_InventoryTilemap and queue the window DMA.
RefreshItemWindow:
		lea	(g_Buffer).l,a1
		lea	0000000006(a1),a0
		move.w	(a0),d0
		lea	$00000084(a1),a0
		mulu.w	#$0048,d0
		ext.l	d0
		adda.l	d0,a0
		lea	((g_InventoryTilemap+$84)).l,a1
		move.w	#$0010,d7

_riwRow:
		movea.l	a1,a2
		move.w	#$0023,d6

_riwCol:
		move.w	(a0)+,(a1)+
		dbf	d6,_riwCol
		lea	$00000080(a2),a1
		dbf	d7,_riwRow
		jsr	(QueueInventoryWinTilemapDMA).l
		jsr	(j_EnableDMAQueueProcessing).l
		rts

; a0 = the working copy cell at column d0 (words), sub-row d1.
; Also used by the equip and save screens (inventory5/6).
GetInvWindowPtr:
		movem.w	d0-d1,-(sp)
		lea	(g_Buffer).l,a1
		lea	$00000084(a1),a0
		mulu.w	#$0048,d1
		add.w	d0,d1
		add.w	d0,d1
		adda.l	d1,a0
		movem.w	(sp)+,d0-d1
		rts

; D-pad auto-repeat, d0 = the initial delay in ticks: edge-detects
; the d-pad against the state block (+0 last raw byte, +1 held
; directions, +2 press time) and rewrites g_Controller1State so a
; held direction goes quiet for the delay, then repeats every
; tick. Also used by the equip screen.
UpdateMenuDPadRepeat:
		movem.w	d0,-(sp)
		jsr	(UpdateControllerInputs).l
		movem.w	(sp)+,d4
		move.w	(g_VBlankCounter).l,d2
		lea	(g_Buffer).l,a1
		move.b	(a1),d1
		lea	(g_Controller1State).l,a0
		move.b	(a0),d0
		andi.b	#CTRLBF_DIRECTION,d0
		andi.b	#CTRLBF_DIRECTION,d1
		eor.b	d0,d1
		and.b	d0,d1
		beq.s	_mdrHeld
		move.b	d1,d0

_mdrHeld:
		move.b	$00000001(a1),d1
		andi.b	#$0F,d1
		cmp.b	d1,d0
		beq.s	_mdrRepeat
		move.b	(a0),d1
		andi.b	#$F0,d1
		or.b	d1,d0
		move.b	(a0),(a1)
		move.b	d0,$00000001(a1)
		move.b	d0,(a0)
		move.w	d2,$00000002(a1)
		rts
; ---------------------------------------------------------------------------

_mdrRepeat:
		move.b	$00000001(a1),d1
		andi.b	#$0F,d1
		move.w	d2,d0
		sub.w	$00000002(a1),d0
		cmp.w	d4,d0
		bcc.s	_mdrApply
		clr.b	d1

_mdrApply:
		move.b	(a0),d0
		andi.b	#$F0,d0
		or.b	d1,d0
		move.b	(a0),(a1)
		move.b	d0,(a0)
		rts

; Write the cursor sprite (VDP sprite 0, 4x4 tiles): d0/d1 = x/y,
; d2 = 1 always hidden, 0 blinking (16 of every 32 frames from the
; menu-open time), else solid. Also used by the save screen
; (inventory6).
DrawInvCursorSprite:
		cmpi.b	#$01,d2
		bne.s	_dcsBlink
		moveq	#$FFFFFFFF,d0

_dcsBlink:
		tst.b	d2
		bne.s	_dcsWrite
		lea	(g_Buffer).l,a0
		move.w	4(a0),d2
		move.w	(g_VBlankCounter).l,d3
		sub.w	d2,d3
		andi.b	#$1F,d3
		cmpi.b	#$10,d3
		bcs.s	_dcsWrite
		moveq	#$FFFFFFFF,d0

_dcsWrite:
		lea	(g_VDPSpr00_Y).l,a0
		move.w	d0,0000000006(a0)
		move.w	d1,(a0)
		move.b	#$0F,$00000002(a0)
	if REGION=FR
		move.w	#$A130,d2
	elseif REGION=DE
		move.w	#$A12C,d2
	else
		move.w	#$A0A8,d2
	endif
		move.w	d2,$00000004(a0)
		rts

; Unreachable leftover: wait until all buttons are released.
_waitButtonsIdle:
		movem.w	d0,-(sp)
		jsr	(WaitUntilVBlank).l
		jsr	(UpdateControllerInputs).l
		movem.w	(sp)+,d0
		move.b	(g_Controller1State).l,d1
		andi.b	#$F0,d1
		bne.s	_waitButtonsIdle
		rts

; Wait until A/B/C/Start are all released (checked either side of a
; vblank).
WaitMenuButtonsRelease:
		jsr	(UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d0
		andi.b	#CTRLBF_BUTTONS,d0
		bne.s	WaitMenuButtonsRelease
		jsr	(WaitUntilVBlank).l
		jsr	(UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d0
		andi.b	#CTRLBF_BUTTONS,d0
		bne.s	WaitMenuButtonsRelease
		rts

; Expand the cursor (16 tiles) and scroll-arrow (4 tiles) 2bpp
; graphics into the state block and DMA them to their VRAM slots.
LoadMenuCursorGfx:
		lea	((g_Buffer+$84)).l,a0
		lea	MenuCursor2BPP(pc),a1
		move.b	#$00,d3
		move.b	#$05,d4
		move.b	#$0A,d5
		move.b	#$0F,d6
		moveq	#$0000000F,d7

_lmcTile:
		move.l	d7,-(sp)
		bsr.w	Expand2BPPGfx
		move.l	(sp)+,d7
		dbf	d7,_lmcTile
		lea	ArrowGraphic2BPP(pc),a1
		move.b	#$00,d3
		move.b	#$0B,d4
		move.b	#$0E,d5
		move.b	#$0F,d6
		bsr.w	Expand2BPPGfx
		bsr.w	Expand2BPPGfx
		bsr.w	Expand2BPPGfx
		bsr.w	Expand2BPPGfx
		lea	((g_Buffer+$84)).l,a0
	if REGION=FR
		lea	($2600).w,a1
	elseif REGION=DE
		lea	($2580).w,a1
	else
		lea	($1500).w,a1
	endif
		move.w	#$0140,d0
		move.w	#$0002,d1
		jsr	(DoDMACopy).l		  ; d0 = DMA Length
						  ; a0 = DMA Source
						  ; a1 = DMA Destination
		rts

; Load the menu font into VRAM. US/JP: expand the 1bpp MenuFont to
; 4bpp (plus a few extra 2bpp glyphs) and DMA it to tile 0. FR/DE:
; decompress the larger font and build both of its banks, with a
; second DMA for the second bank.
LoadMenuFont:
	if ((REGION=FR)!(REGION=DE))
		lea	MenuFont(pc),a0
	if REGION=FR
		lea	((g_ScreenBuffer+$684)).l,a1
	elseif REGION=DE
		lea	((g_ScreenBuffer+$5C4)).l,a1
	endif
		lea	($0000).w,a2
		jsr	(j_LoadCompressedGfx).l
		lea	((g_Buffer+$84)).l,a0
	if REGION=FR
		lea	((g_ScreenBuffer+$684)).l,a1
	elseif REGION=DE
		lea	((g_ScreenBuffer+$5C4)).l,a1
	endif
		move.b	#1,d2
		move.b	#0,d3
	if REGION=FR
		move.w	#$0097,d6
	elseif REGION=DE
		move.w	#$0091,d6
	endif
	else
		lea	((g_Buffer+$84)).l,a0
		lea	MenuFont(pc),a1
		move.b	#$01,d2
		move.b	#$00,d3
		bsr.w	Expand1bppTo4bpp
		move.w	#$009E,d6
	endif
_lmfGlyph:
		bsr.w	Expand1bppTo4bpp
		dbf	d6,_lmfGlyph
	if REGION=FR
		lea	((g_ScreenBuffer+$684)).l,a1
		bsr.w	Expand1bppTo4bpp
	elseif REGION=DE
		lea	((g_ScreenBuffer+$5C4)).l,a1
		bsr.w	Expand1bppTo4bpp
	endif
		move.b	#$0A,d3
		move.b	#$0A,d4
		move.b	#$01,d5
		move.b	d3,d6
	if ~((REGION=FR)!(REGION=DE))
		bsr.w	_expandExtraGlyphs
	endif
		move.b	#$0A,d3
		move.b	#$0A,d4
		move.b	#$03,d5
		move.b	d3,d6
	if ~((REGION=FR)!(REGION=DE))
		bsr.w	_expandExtraGlyphs
	endif
		lea	((g_Buffer+$84)).l,a0
	if REGION=FR
		lea	($000C).w,a1
		move.w	#$0980,d0
	elseif REGION=DE
		lea	($000C).w,a1
		move.w	#$0920,d0
	else
		lea	($0000).w,a1
		move.w	#$0A80,d0
	endif
		move.w	#2,d1
		jsr	(QueueDMAOp).l
		jsr	(FlushDMACopyQueue).l
	if REGION=FR
		lea	((g_Buffer+$8C)).l,a0
		lea	($1300).w,a1
		move.w	#$0980,d0
		move.w	#2,d1
		jsr	(QueueDMAOp).l
		jsr	(FlushDMACopyQueue).l
	elseif REGION=DE
		lea	((g_Buffer+$8C)).l,a0
		lea	($1240).w,a1
		move.w	#$0920,d0
		move.w	#2,d1
		jsr	(QueueDMAOp).l
		jsr	(FlushDMACopyQueue).l
	endif
		rts

; Expand the four extra 2bpp glyphs (Unused1/Unused2 - leftovers,
; nothing references their tiles).
_expandExtraGlyphs:
		lea	Unused1_2BPP(pc),a1
		bsr.w	Expand2BPPGfx
		lea	(Unused1_2BPP+6)(pc),a1
		bsr.w	Expand2BPPGfx
		lea	Unused2_2BPP(pc),a1
		bsr.w	Expand2BPPGfx
		lea	(Unused2_2BPP+4)(pc),a1
		bsr.w	Expand2BPPGfx
		rts

; Expand one 2bpp tile from (a1) to 4bpp at (a0), pixel values
; 00/01/10/11 -> colours d3/d4/d5/d6.
Expand2BPPGfx:
		move.w	#$0007,d7

_e2gRow:
		clr.l	d1
		move.w	(a1)+,d0
		bsr.w	Get2BitPixel
		bsr.w	Get2BitPixel
		bsr.w	Get2BitPixel
		bsr.w	Get2BitPixel
		bsr.w	Get2BitPixel
		bsr.w	Get2BitPixel
		bsr.w	Get2BitPixel
		bsr.w	Get2BitPixel
		move.l	d1,(a0)+
		dbf	d7,_e2gRow
		rts

; Shift the next 2bpp pixel out of d0 into d1 as a 4bpp nibble.
Get2BitPixel:
		rol.l	#$04,d1
		add.w	d0,d0
		bcs.w	_g2pHi
		add.w	d0,d0
		bcs.w	_g2pC1
		or.b	d3,d1
		rts
; ---------------------------------------------------------------------------

_g2pC1:
		or.b	d4,d1
		rts
; ---------------------------------------------------------------------------

_g2pHi:
		add.w	d0,d0
		bcs.w	_g2pC3
		or.b	d5,d1
		rts
; ---------------------------------------------------------------------------

_g2pC3:
		or.b	d6,d1
		rts

; Expand one 1bpp tile row-pair from (a1) to 4bpp at (a0), set
; bits -> colour d2, clear -> d3.
Expand1bppTo4bpp:
		move.w	#$0007,d7

_e1gRow:
		move.b	(a1)+,d0
		bsr.w	_expand4px
		bsr.w	_expand4px
		dbf	d7,_e1gRow
		rts

; Four 1bpp pixels -> one 4bpp word.
_expand4px:
		clr.w	d1
		bsr.w	_expand2px
		bsr.w	_expand2px
		move.w	d1,(a0)+
		rts

_expand2px:
		rol.w	#$04,d1
		add.b	d0,d0
		bcc.s	_e2pZero1
		or.b	d2,d1
		bra.s	_e2pBit2
; ---------------------------------------------------------------------------

_e2pZero1:
		or.b	d3,d1

_e2pBit2:
		rol.w	#$04,d1
		add.b	d0,d0
		bcc.s	_e2pZero2
		or.b	d2,d1
		bra.s	_e2pDone
; ---------------------------------------------------------------------------

_e2pZero2:
		or.b	d3,d1

_e2pDone:
		rts

; Wipe the textbox and push its tilemap.
_clearTextbox:
		jsr	(j_RefreshAndClearTextbox).l
		jsr	(j_QueueTextboxTilemapDMA).l
		jsr	(FlushDMACopyQueue).l
		rts

; A/C pressed in the item menu: look up the item under the cursor
; (index = scroll offset in item rows * 2 + row * 2 + column into
; the owned list at +$5C). An unowned or empty slot just buzzes.
; Otherwise print the item's use text into the textbox, and for
; the three read-in-menu items append their extra text: the Oracle
; Stone computes the explored percentage, the Blue Ribbon and
; Spell Book print theirs. Exits through ItemMenuExit with the
; item id in d0 (d1 = 0).
ItemMenuSelect:
		bsr.w	_redrawCursor
		lea	(g_Buffer).l,a0
		move.w	$00000006(a0),d1
		lsr.w	#$02,d1
		move.w	$0000000C(a0),d0
		add.w	d0,d1
		add.w	d1,d1
		move.w	$0000000A(a0),d0
		add.w	d1,d0
		lea	$0000005C(a0),a0
		move.b	(a0,d0.w),d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		beq.s	_imsBuzz
		cmpi.w	#$FFFF,d1
		beq.s	_imsBuzz
		move.l	d0,-(sp)
		bsr.s	_clearTextbox
		trap	#$00			  ; Trap00Handler
		dc.w SND_CursorSelect

		move.l	(sp)+,d0
		ext.w	d0
		move.w	d0,(g_CurrentTextItem).l
		movem.w	d0,-(sp)
		jsr	(j_GetItemUseStringIdx).l
		move.w	d1,d0
		jsr	(j_PrintString).l
		bsr.w	WaitMenuButtonsRelease
		movem.w	(sp)+,d0
		move.l	d0,-(sp)
		cmpi.b	#ITM_ORACLESTONE,d0
		bne.s	_imsBlueRibbon
		bsr.w	_printExploredPercent
		bra.w	_imsDone
; ---------------------------------------------------------------------------

_imsBlueRibbon:
		cmpi.b	#ITM_BLUERIBBON,d0
		bne.s	_imsSpellBook
		bsr.w	_printRibbonText
		bra.w	_imsDone
; ---------------------------------------------------------------------------

_imsSpellBook:
		cmpi.b	#ITM_SPELLBOOK,d0
		bne.s	_imsDone
		bsr.w	_printSpellBookText
		bra.w	*+4
; ---------------------------------------------------------------------------

_imsDone:
		move.l	(sp)+,d0
		bra.w	ItemMenuExit
; ---------------------------------------------------------------------------

_imsBuzz:
		trap	#$00			  ; Trap00Handler
		dc.w SND_ErrorBuzz

		bra.w	ItemMenuLoop

; The Oracle Stone's reading: count the set bits among the 643
; room-visited flags, take visited * 100 / 642 capped at 100, and
; print string $19 with the percentage.
_printExploredPercent:
		lea	(g_RoomVisitedFlags).l,a0
		move.w	#00642,d0
		clr.b	d1
		moveq	#$00000003,d7

_pepBit:
		btst	d1,(a0)
		beq.s	_pepNext
		addq.l	#$01,d7

_pepNext:
		addq.b	#$01,d1
		andi.b	#$07,d1
		bne.s	_pepAdvance
		addq.l	#$01,a0

_pepAdvance:
		dbf	d0,_pepBit
		mulu.w	#00100,d7
		divu.w	#00642,d7
		andi.l	#$0000FFFF,d7
		cmpi.l	#0000000100,d7
		bcs.s	_pepPrint
		moveq	#0000000100,d7

_pepPrint:
		move.l	d7,(g_PrintNumericDwordValue).l
		move.w	#$0019,d0
		jsr	(j_PrintString).l
		rts

; The Blue Ribbon's extra text (string $1A).
_printRibbonText:
		move.w	#$001A,d0
		jsr	(j_PrintString).l
		rts

; The Spell Book's extra text (string $1B).
_printSpellBookText:
		move.w	#$001B,d0
		jsr	(j_PrintString).l
		rts

; Rebuild the owned-item list at state +$5C from the InventoryItems
; menu order (40 entries, $FF = empty), and set the list height
; (+8) to round-up(count / 2) item rows * 4 sub-rows + 1, at least
; one screenful ($11).
BuildOwnedItemList:
		lea	InventoryItems(pc),a0
		lea	((g_Buffer+$5C)).l,a1
		movea.l	a1,a2
		moveq	#$00000027,d7
		clr.w	d6

_boiClear:
		move.b	#$FF,(a2)+
		dbf	d7,_boiClear
		moveq	#$00000027,d7

_boiItem:
		move.b	(a0),d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.s	_boiNext
		move.b	(a0),(a1)+
		addq.w	#$01,d6

_boiNext:
		addq.l	#$01,a0
		dbf	d7,_boiItem
		lsr.w	#$01,d6
		bcc.s	_boiHeight
		addq.w	#$01,d6

_boiHeight:
		lsl.w	#$02,d6
		addq.w	#$01,d6
		cmpi.w	#$0012,d6
		bcc.s	_boiStore
		move.w	#$0011,d6

_boiStore:
		lea	((g_Buffer+8)).l,a0
		move.w	d6,(a0)
		rts

	modend
