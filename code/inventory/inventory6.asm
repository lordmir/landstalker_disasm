Inventory6	module
; The equip screen's name drawing and select handler - the grid,
; cursor and input loop are in inventory5.asm. (The save-slot
; select screen that used to sit in this file lives in
; code/title/gameselectscreen.asm.)

; Draw each equip slot's row label: blank the name area, then the
; currently equipped item's name (from its EquipInventoryLayout row
; and g_CurrentEquippedItems column, +$10.. in the state block)
; next to the grid. Also resets the window scroll (+6) to the top.
DrawEquipItemNames:
		lea	(g_Buffer).l,a0
		lea	0000000006(a0),a0
		clr.w	(a0)
	if	REGION=JP
		move.w	#3,d1
	elseif	((REGION=FR)!(REGION=DE))
		moveq	#1,d1
	else
		moveq	#$2,d1
	endif
		lea	EquipInventoryLayout(pc),a3
		lea	(g_Buffer).l,a4
		move.w	#$0003,d7

_denSlot:
		move.w	#$0001,d0
		movem.w	d1/d7,-(sp)
		bsr.w	GetInvWindowPtr
	if ((REGION=FR)!(REGION=DE))
		move.w	#9,d7
	else
		move.w	#8,d7
	endif
		bsr.w	_blankNameArea
		move.w	$00000010(a4),d0
		andi.l	#$00000007,d0
		move.b	(a3,d0.w),d0
		andi.b	#$7F,d0
		clr.b	d1
		bsr.w	DrawItemName
		movem.w	(sp)+,d1/d7
		addq.w	#$04,d1
		lea	$00000005(a3),a3
		lea	$00000002(a4),a4
		dbf	d7,_denSlot
		rts

; Blank a d7-wide name area with the space character ($14) over 2
; rows (4 on FR/DE). The JP build fills with the incoming d0 and
; walks its rows upward instead.
_blankNameArea:
		subq.w	#$01,d7
		movem.l	a0,-(sp)
	if ((REGION=FR)!(REGION=DE))
		move.w	#3,d5
	else
		move.w	#1,d5
	endif

_bnaRow:
		move.w	d7,d6
		movea.l	a0,a1

_bnaCell:
	if ~(REGION=JP)
		move.w	#$0014,d0
	endif
		move.w	d0,(a0)+
		dbf	d6,_bnaCell
		movea.l	a1,a0
	if REGION=JP
		lea	-$00000048(a0),a0
	else
		lea	$00000048(a0),a0
	endif
		dbf	d5,_bnaRow
		movem.l	(sp)+,a0
		rts

; Unreachable leftover: pack d0 into decimal digits (hundreds and
; tens counted into d1 nibbles, remainder or'd in).
_toBCD:
		movem.w	d2,-(sp)
		clr.l	d1
		move.b	#$64,d2
		bsr.w	_bcdDigit
		move.b	#$0A,d2
		bsr.w	_bcdDigit
		or.b	d0,d1
		movem.w	(sp)+,d2
		rts

_bcdDigit:
		sub.b	d2,d0
		bcs.w	_bcdDone
		addq.b	#$01,d1
		bra.s	_bcdDigit
; ---------------------------------------------------------------------------

_bcdDone:
		add.b	d2,d0
		lsl.l	#$08,d1
		rts

; Recompute the equip cursor's resting position and draw it
; (falls through).
DrawEquipCursor:
		bsr.w	GetEquipCursorPos

; Draw the equip cursor: DrawInvCursorSprite (same modes: 1 =
; hidden, 0 = blink, else solid), with the item screen's scroll
; arrows (sprites 1-2) parked offscreen.
DrawEquipCursorSprite:
		move.l	d2,-(sp)
		bsr.w	DrawInvCursorSprite
		moveq	#$FFFFFFFF,d2
		move.w	d2,$00000008(a0)
		move.w	d2,$00000010(a0)
		jsr	(FlushDMACopyQueue).l
		move.l	(sp)+,d2
		rts

; Sprite position of the equip cursor's cell: x = column * $28 +
; $E0, y = row * $20 + $A8, d2 = solid.
GetEquipCursorPos:
		lea	((g_Buffer+$18)).l,a0
		lea	((g_Buffer+$1A)).l,a1
		move.w	(a0),d0
		move.w	(a1),d1
		mulu.w	#$0028,d0
		addi.w	#$00E0,d0
		mulu.w	#$0020,d1
		addi.w	#$00A8,d1
		moveq	#$FFFFFFFF,d2
		rts

; Unreachable leftover: an older name-drawing loop (with the $7B /
; $7C wrap characters written to the row above).
_orphanNameLoop:
		move.w	#$A000,d0

_onlChar:
		move.b	(a1)+,d0
		cmpi.b	#$7B,d0
		bne.s	_onl7C
		move.w	d0,-$00000048(a0)
		bra.w	_onlNext
; ---------------------------------------------------------------------------

_onl7C:
		cmpi.b	#$7C,d0
		bne.s	_onlPut
		move.w	d0,-$00000048(a0)
		bra.w	_onlNext
; ---------------------------------------------------------------------------

_onlPut:
		move.w	d0,(a0)+

_onlNext:
		dbf	d7,_onlChar
		rts
; ---------------------------------------------------------------------------

; A/C on the equip screen: the layout entry under the cursor
; (row * 5 + column) - a bit-7 "nothing" placeholder is always
; allowed, a real item only when owned. Store the column in the
; row's slot word, repack all four slot nibbles into
; g_CurrentEquippedItems, and redraw through EquipMenuRefresh
; (inventory5). Unowned picks bounce back silently.
EquipMenuSelect:
		lea	(g_Buffer).l,a1
		lea	$00000018(a1),a0
		lea	$0000001A(a1),a1
		lea	EquipInventoryLayout(pc),a2
		move.w	(a0),d0
		move.w	(a1),d1
		mulu.w	#$0005,d1
		add.w	d1,d0
		move.b	(a2,d0.w),d0
		tst.b	d0
		bmi.w	_emsApply
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	_emsRefuse

_emsApply:
		move.w	(a1),d1
		add.w	d1,d1
		lea	(g_Buffer).l,a2
		lea	$00000010(a2,d1.w),a2
		move.w	(a0),(a2)
		lea	((g_Buffer+$10)).l,a0
		clr.w	d0
		move.b	#$07,d1
		move.w	#$0003,d7

_emsPack:
		move.w	(a0)+,d2
		and.b	d1,d2
		or.b	d2,d0
		ror.w	#$04,d0
		dbf	d7,_emsPack
		lea	(g_CurrentEquippedItems).l,a0
		move.w	d0,(a0)
		trap	#$00			  ; Trap00Handler
		dc.w SND_CursorSelect

		bra.w	EquipMenuRefresh
; ---------------------------------------------------------------------------

_emsRefuse:
		bra.w	EquipMenuRefresh

	modend
