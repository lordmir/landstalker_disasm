Inventory3	module
; The item screen of the inventory menu: setup (InitInv), the item
; grid drawing, and the interactive cursor loop (RunItemMenu). The
; cursor, scrolling and select handlers it threads through live in
; inventory4.asm, which jumps back into ItemMenuLoop /
; ItemMenuExit here.
;
; While the menu is open, g_Buffer doubles as its state block:
; +4 the vblank counter at open, +6 the selected slot * 4, +$A/+$C
; the cursor position restored from g_InvCursorPos, +$E the
; palette-dim marker, +$10 the cursor column the nav loop tests,
; +$1C the saved palette line 1, +$5C the 40-byte item list (2
; columns x 20 rows) and +$84 the window tilemap working copy.

; Open the item screen: build the item list (inventory4), clear
; the icon VRAM and stream in all 63 item icons ($10 tiles apart,
; flushing the queue every 4), save palette line 1 into the state
; block, load the menu's palette line 0 and stamp the opening
; time. The FR/DE builds keep their larger menu font, so the icon
; tiles live at different VRAM addresses.
InitInv:
		jsr	(WaitUntilVBlank).l
		bsr.w	LoadMenuFont
		bsr.w	LoadMenuCursorGfx
		jsr	(WaitUntilVBlank).l
	if REGION=FR
		move.w	#$A880,d0
	elseif REGION=DE
		move.w	#$A000,d0
	else
		move.w	#$8F80,d0
	endif
		move.w	#$0800,d1
		clr.w	d2
		jsr	(DoDMAFill).l		  ; d0 - Fill destination address VDP
						  ; d1 - Fill length bytes
						  ; d2 - Fill pattern
	if REGION=FR
		move.w	#$0144,d1
	elseif REGION=DE
		move.w	#$140,d1
	else
		move.w	#$00BC,d1
	endif
		clr.w	d0
		move.w	#$003E,d7

_iiIcon:
		movem.w	d0-d1/d7,-(sp)
		jsr	(LoadItemIconGfx).l
		movem.w	(sp)+,d0-d1/d7
		addq.w	#$01,d0
		addi.w	#$0010,d1
		movem.w	d7,-(sp)
		andi.b	#$03,d7
		bne.s	_iiNext
		jsr	(FlushDMACopyQueue).l

_iiNext:
		movem.w	(sp)+,d7
		dbf	d7,_iiIcon
		lea	(g_Pal1Base).l,a0
		lea	(g_Buffer).l,a1
		lea	$0000001C(a1),a2
		moveq	#$0000001F,d7

_iiSavePal1:
		move.w	(a0)+,(a2)+
		dbf	d7,_iiSavePal1
		clr.w	$0000000E(a1)
		lea	InvPalette1(pc),a0
		lea	(g_Pal0Base).l,a1
		moveq	#$00000007,d7

_iiPal0:
		move.w	(a0)+,(a1)+
		dbf	d7,_iiPal0
		lea	(g_Buffer).l,a0
		move.w	(g_VBlankCounter).l,0000000004(a0)
		rts

; Load the greyed-out item palette into line 2 (used for icons the
; player cannot select).
_loadGreyedPal2:
		lea	InvPalette2_GreyedOut(pc),a0
		lea	(g_Pal2Base).l,a1
		moveq	#$00000007,d7

_gpCopy:
		move.l	(a0)+,(a1)+
		dbf	d7,_gpCopy
		rts

; Rebuild the cursor state from its saved copy: g_InvSelectedSlot
; (reset to 0 if past $10) becomes the slot word at +6, and
; g_InvCursorPos unpacks into the column (+$A, bit 0) and row
; (+$C, bits 1-2); BuildOwnedItemList (inventory4) then applies it.
_restoreCursor:
		move.b	(g_InvSelectedSlot).l,d0
		andi.w	#$001F,d0
		cmpi.b	#$11,d0
		bcs.s	_rcSlotOk
		clr.w	d0

_rcSlotOk:
		mulu.w	#$0004,d0
		lea	((g_Buffer+6)).l,a0
		move.w	d0,(a0)
		move.b	(g_InvCursorPos).l,d1
		clr.w	d0
		lsr.b	#$01,d1
		bcc.s	_rcRow
		addq.w	#$01,d0

_rcRow:
		ext.w	d1
		lea	((g_Buffer+$A)).l,a0
		move.w	d0,(a0)
		lea	((g_Buffer+$C)).l,a0
		move.w	d1,(a0)
		bsr.w	BuildOwnedItemList
		rts

; Leave the item menu: pack the cursor back into g_InvSelectedSlot
; / g_InvCursorPos (so the menu reopens where it closed), then
; fall through to return the exit code. Also jumped to from the
; select handler in inventory4.
ItemMenuExit:
		movem.w	d0,-(sp)
		lea	((g_Buffer+6)).l,a0
		move.w	(a0),d0
		lsr.b	#$02,d0
		lea	(g_InvSelectedSlot).l,a0
		move.b	d0,(a0)
		lea	((g_Buffer+$A)).l,a0
		move.w	(a0),d0
		andi.b	#$01,d0
		lea	((g_Buffer+$C)).l,a0
		move.w	(a0),d1
		andi.b	#$03,d1
		add.b	d1,d1
		or.b	d1,d0
		lea	(g_InvCursorPos).l,a0
		move.b	d0,(a0)
		movem.w	(sp)+,d0

; d1 = 2 if Start is held, 1 if B, else 0. Also used on its own by
; the save-prompt code in inventory5.
ReadMenuExitButtons:
		move.b	(g_Controller1State).l,d1
		btst	#CTRL_START,d1
		beq.s	_rebB
		moveq	#$00000002,d1
		bra.s	_rebDone
; ---------------------------------------------------------------------------

_rebB:
		btst	#CTRL_B,d1
		beq.s	_rebNone
		moveq	#$00000001,d1
		bra.s	_rebDone
; ---------------------------------------------------------------------------

_rebNone:
		moveq	#$00000000,d1

_rebDone:
		rts

; Restore palette line 1 from the copy InitInv saved in the state
; block (called while the menu closes).
RestoreSavedPal1:
		lea	((g_Buffer+$1C)).l,a0
		lea	(g_Pal1Base).l,a1
		moveq	#$0000001F,d7

_rspCopy:
		move.w	(a0)+,(a1)+
		dbf	d7,_rspCopy
		rts

; The item screen's interactive loop. Runs until B/Start backs out
; (via ItemMenuExit; d1 = the exit code) or the select handler in
; inventory4 (ItemMenuSelect, on A/C) picks an item - it rejoins at
; ItemMenuLoop to keep browsing or leaves through ItemMenuExit
; with d1 = 0 and the item in d0. The cursor roams a 2 x 4 window
; over the 2 x 20 item grid: in the outer rows up/down scroll the
; list instead (four sub-row steps per item row, SND_CursorMove
; per step), falling back to a plain cursor move at the ends.
RunItemMenu:
		bsr.w	ClearInventoryWindow
		bsr.w	WaitMenuButtonsRelease

ItemMenuLoop:
		moveq	#$0000000F,d0
		bsr.w	UpdateMenuDPadRepeat
		move.b	(g_Controller1State).l,d1
		move.b	d1,d0
		andi.b	#CTRLBF_BSTART,d0
		bne.w	ItemMenuExit
		move.b	d1,d0
		andi.b	#CTRLBF_AC,d0
		bne.w	ItemMenuSelect
		lea	(g_Buffer).l,a1
		lea	0000000010(a1),a0
		lea	$0000000C(a1),a1
		move.b	(g_Controller1State).l,d0
		btst	#CTRL_UP,d0
		bne.w	_imUp
		btst	#CTRL_DOWN,d0
		bne.w	_imDown
		btst	#CTRL_LEFT,d0
		bne.w	_imLeft
		btst	#CTRL_RIGHT,d0
		bne.w	_imRight

_imRedraw:
		bsr.w	GetInvCursorPos
		clr.l	d2
		bsr.w	UpdateInvCursorSprites

_imNext:
		bra.s	ItemMenuLoop
; ---------------------------------------------------------------------------

_imUp:
		cmpi.w	#$0002,(a1)
		bcs.s	_imScrollUp
		bsr.w	InvCursorUp
		bra.s	_imNext
; ---------------------------------------------------------------------------

_imScrollUp:
		movem.l	a0-a1,-(sp)
		bsr.w	InvScrollUp
		bcc.s	_imUpSteps
		trap	#$00			  ; Trap00Handler
		dc.w SND_CursorMove

_imUpSteps:
		bsr.w	InvScrollUp
		bsr.w	InvScrollUp
		bsr.w	InvScrollUp
		movem.l	(sp)+,a0-a1
		bcs.s	_imNext
		move.w	(a1),d0
		beq.s	_imRedraw
		bsr.w	InvCursorUp
		bra.s	_imNext
; ---------------------------------------------------------------------------

_imDown:
		cmpi.w	#$0002,(a1)
		bcc.s	_imScrollDown
		bsr.w	InvCursorDown
		bra.s	_imNext
; ---------------------------------------------------------------------------

_imScrollDown:
		movem.l	a0-a1,-(sp)
		bsr.w	InvScrollDown
		bcc.s	_imDownSteps
		trap	#$00			  ; Trap00Handler
		dc.w SND_CursorMove

_imDownSteps:
		bsr.w	InvScrollDown
		bsr.w	InvScrollDown
		bsr.w	InvScrollDown
		movem.l	(sp)+,a0-a1
		bcs.s	_imNext
		cmpi.w	#$0003,(a1)
		bcc.s	_imRedraw
		bsr.w	InvCursorDown
		bra.s	_imNext
; ---------------------------------------------------------------------------

_imRight:
		cmpi.w	#$0001,(a0)
		bcc.s	_imRedraw
		bsr.w	InvCursorRight
		bra.s	_imNext
; ---------------------------------------------------------------------------

_imLeft:
		move.w	(a0),d0
		beq.w	_imRedraw
		bsr.w	InvCursorLeft
		bra.w	_imNext

; Reset the inventory window to the plain item-grid view: restore
; the saved cursor, blank the window tilemap working copy and the
; plane B blocks, redraw all 40 item slots, reload the greyed-out
; palette, and un-dim the palette if a submenu had dimmed it
; (state +$E), then flush the DMA queue.
ClearInventoryWindow:
		bsr.w	_restoreCursor
		lea	(g_Buffer).l,a1
		lea	$00000084(a1),a0
		move.w	(a0),d0			  ; leftover: d0 is
		move.w	#$A000,d0		  ; overwritten, and the
		ori.w	#$0000,d0		  ; ori is a no-op
		move.w	#$0B63,d7

_ciwFillWin:
		move.w	d0,(a0)+
		dbf	d7,_ciwFillWin
		bsr.w	_drawItemGrid
		lea	((g_ForegroundBlocks+$204)).l,a0
		move.w	(a0)+,d0
		move.w	#$043E,d7

_ciwFillB:
		move.w	d0,(a0)+
		dbf	d7,_ciwFillB
		bsr.w	QueueInventoryScrBTilemapDMA
		bsr.w	_loadGreyedPal2
		lea	((g_Buffer+$E)).l,a0
		move.w	(a0),d0
		move.w	#$FFFF,(a0)
		tst.w	d0
		beq.s	_ciwFlush
		jsr	(CopyBasePaletteToActivePalette).l

_ciwFlush:
		jsr	(FlushDMACopyQueue).l
		rts

; Draw all 40 item slots: 20 rows (4 units apart) of 2 columns (x
; = 2 and $13), item ids read from the state block's list at +$5C;
; GetInvWindowPtr positions each slot and PopulateItemSlot draws its icon
; and quantity. Ends by refreshing the cursor.
_drawItemGrid:
		move.w	#$0000,d1
		move.w	#$0013,d6
		lea	((g_Buffer+$5C)).l,a2

_dgRow:
		move.w	#$0002,d0
		move.w	#$0001,d7

_dgSlot:
		movem.w	d0-d1/d6-d7,-(sp)
		bsr.w	GetInvWindowPtr
		clr.w	d0
		move.b	(a2)+,d0
		movem.l	a2,-(sp)
		bsr.w	PopulateItemSlot
		movem.l	(sp)+,a2
		movem.w	(sp)+,d0-d1/d6-d7
		addi.w	#$0011,d0
		dbf	d7,_dgSlot
		addq.w	#$04,d1
		dbf	d6,_dgRow
		bsr.w	RefreshItemWindow
		bsr.w	GetInvCursorPos
		moveq	#$00000001,d2
		bsr.w	UpdateInvCursorSprites
		rts

	modend
