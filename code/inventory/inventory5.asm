Inventory5	module
; The equip screen: a 4-row x 5-column grid (sword / armour / boots
; / ring rows, candidates from the EquipInventoryLayout table, 5
; item ids per row). The equipment itself is g_CurrentEquippedItems
; - one nibble per slot holding the chosen column. The equipped
; item in each row draws in the normal palette, everything else
; greyed (palette line 2); picking a new item just rewrites the
; slot's nibble. The name drawing and select handler live in
; inventory6.asm (DrawEquipItemNames / EquipMenuSelect, which jumps
; back into EquipMenuRefresh here).
;
; Equip-screen state in g_Buffer: +$10..+$16 = each slot's equipped
; column, +$18/+$1A = the cursor column/row (saved across menus in
; g_EquipCursorPos).

; d0 = slot (0 sword / 1 armour / 2 boots / 3 ring): return the
; equipped item id in d1 - the slot's nibble of
; g_CurrentEquippedItems picks from its EquipInventoryLayout row;
; bit-7 entries (the "nothing" placeholders) return 0.
GetEquippedItem:
		movem.l	d0/a0,-(sp)
		move.w	(g_CurrentEquippedItems).l,d1
		lea	EquipInventoryLayout(pc),a0
		nop
		tst.w	d0
		beq.w	_geiLookup
		subq.w	#$01,d0

_geiSlot:
		lsr.w	#$04,d1
		lea	$00000005(a0),a0
		dbf	d0,_geiSlot

_geiLookup:
		andi.w	#$0007,d1
		move.b	(a0,d1.w),d1
		btst	#$07,d1
		beq.s	_geiDone
		clr.b	d1

_geiDone:
		movem.l	(sp)+,d0/a0
		rts

; Unpack the equip-screen state: each slot's equipped column
; (nibble, clamped below 5) into +$10.., and the saved cursor
; (g_EquipCursorPos: column in bits 0-2, row in bits 3-4) into
; +$18/+$1A.
_initEquipCursor:
		lea	((g_Buffer+$10)).l,a0
		move.w	(g_CurrentEquippedItems).l,d0
		move.b	#$07,d1
		move.b	#$05,d3
		move.w	#$0003,d7

_iecSlot:
		move.b	d0,d2
		and.b	d1,d2
		cmp.b	d3,d2
		bcs.s	_iecStore
		clr.b	d2

_iecStore:
		ext.w	d2
		move.w	d2,(a0)+
		lsr.w	#$04,d0
		dbf	d7,_iecSlot
		lea	(g_Buffer).l,a1
		lea	$00000018(a1),a0
		lea	$0000001A(a1),a1
		lea	(g_EquipCursorPos).l,a2
		move.b	(a2),d0
		andi.w	#$0007,d0
		cmpi.w	#$0005,d0
		bcs.s	_iecCol
		clr.w	d0

_iecCol:
		move.w	d0,(a0)
		move.b	(a2),d0
		lsr.b	#$03,d0
		andi.w	#$0003,d0
		move.w	d0,(a1)
		rts

; B/Start pressed: pack the cursor back into g_EquipCursorPos and
; return the exit code (via inventory3's ReadMenuExitButtons) to
; RunEquipMenu's caller.
_emExit:
		lea	(g_Buffer).l,a1
		lea	$00000018(a1),a0
		lea	$0000001A(a1),a1
		lea	(g_EquipCursorPos).l,a2
		move.w	(a1),d1
		lsl.b	#$03,d1
		andi.b	#$18,d1
		move.w	(a0),d0
		andi.b	#$07,d0
		or.b	d0,d1
		move.b	d1,(a2)
		bra.w	ReadMenuExitButtons
; ---------------------------------------------------------------------------

; Unreachable leftover.
		bsr.w	DrawEquipInventory

; Run the equip screen (the main menu's Equip option; called from
; CheckForMenuOpen). Starts with a debug leftover: with
; DebugModeEnable set and Start held, it plays the end credits
; forever. The loop reads the d-pad through the auto-repeat
; handler, slides the cursor around the 4x5 grid, blinks it while
; idle, confirms through EquipMenuSelect (inventory6, which
; rejoins at EquipMenuRefresh) and leaves through _emExit on
; B/Start.
RunEquipMenu:
		tst.w	(DebugModeEnable).w
		bne.s	EquipMenuRefresh
		jsr	(UpdateControllerInputs).l
		btst	#CTRL_START,(g_Controller1State).l
		beq.s	EquipMenuRefresh

_emCredits:
		jsr	(j_PlayEndCredits).l
		bra.s	_emCredits
; ---------------------------------------------------------------------------

; (Re)draw the whole screen: slot names, icon grid, cursor.
EquipMenuRefresh:
		bsr.w	DrawEquipItemNames
		bsr.w	_drawEquipGrid
		bsr.w	DrawEquipCursor
		bsr.w	WaitMenuButtonsRelease

_emStamp:
		move.w	(g_VBlankCounter).l,d0
		lea	(g_Buffer).l,a0
		move.w	d0,0000000004(a0)
		move.w	d0,$00000002(a0)

_emTick:
		moveq	#$00000006,d0
		bsr.w	UpdateMenuDPadRepeat
		move.b	(g_Controller1State).l,d1
		move.b	d1,d0
		andi.b	#CTRLBF_BSTART,d0	  ; START or B
		bne.w	_emExit
		move.b	d1,d0
		andi.b	#CTRLBF_AC,d0		  ; A or C
		bne.w	EquipMenuSelect
		lea	(g_Buffer).l,a1
		lea	$00000018(a1),a0
		lea	$0000001A(a1),a1
		move.b	d1,d0
		btst	#CTRL_UP,d0
		bne.w	_emUp
		btst	#CTRL_DOWN,d0
		bne.w	_emDown
		btst	#CTRL_LEFT,d0
		bne.w	_emLeft
		btst	#CTRL_RIGHT,d0
		bne.w	_emRight
		bsr.w	GetEquipCursorPos
		clr.b	d2
		bsr.w	DrawEquipCursorSprite
		bra.s	_emTick
; ---------------------------------------------------------------------------

_emUp:
		move.w	(a1),d0
		beq.s	_emUpEnd
		bsr.w	_equipCursorUp

_emUpEnd:
		bra.s	_emStamp
; ---------------------------------------------------------------------------

_emDown:
		cmpi.w	#$0003,(a1)
		beq.s	_emDownEnd
		bsr.w	_equipCursorDown

_emDownEnd:
		bra.w	_emStamp
; ---------------------------------------------------------------------------

_emLeft:
		tst.w	(a0)
		beq.s	_emLeftEnd
		bsr.w	_equipCursorLeft

_emLeftEnd:
		bra.w	_emStamp
; ---------------------------------------------------------------------------

_emRight:
		cmpi.w	#$0004,(a0)
		beq.s	_emRightEnd
		bsr.w	_equipCursorRight

_emRightEnd:
		bra.w	_emStamp

; Slide the cursor one row up (8 4-pixel steps, drawn solid).
_equipCursorUp:
		trap	#$00			  ; Trap00Handler
		dc.w SND_CursorMove

		bsr.w	GetEquipCursorPos
		subq.w	#$01,(a1)
		moveq	#$00000007,d7

_ecuStep:
		subq.w	#$04,d1
		moveq	#$FFFFFFFF,d2
		bsr.w	DrawEquipCursorSprite
		dbf	d7,_ecuStep
		rts

; Slide one row down.
_equipCursorDown:
		trap	#$00			  ; Trap00Handler
		dc.w SND_CursorMove

		bsr.w	GetEquipCursorPos
		addq.w	#$01,(a1)
		moveq	#$00000007,d7

_ecdStep:
		addq.w	#$04,d1
		bsr.w	DrawEquipCursorSprite
		dbf	d7,_ecdStep
		rts

; Slide one column left (8 5-pixel steps).
_equipCursorLeft:
		trap	#$00			  ; Trap00Handler
		dc.w SND_CursorMove

		bsr.w	GetEquipCursorPos
		subq.w	#$01,(a0)
		moveq	#$00000007,d7

_eclStep:
		subq.w	#$05,d0
		bsr.w	DrawEquipCursorSprite
		dbf	d7,_eclStep
		rts

; Slide one column right.
_equipCursorRight:
		trap	#$00			  ; Trap00Handler
		dc.w SND_CursorMove

		bsr.w	GetEquipCursorPos
		addq.w	#$01,(a0)
		moveq	#$00000007,d7

_ecrStep:
		addq.w	#$05,d0
		bsr.w	DrawEquipCursorSprite
		dbf	d7,_ecrStep
		rts

; Build the greyed-out palette line 2 from line 1: darken the blue
; component and keep only a trace of green/red.
InitEquipGreyedOutPal:
		lea	(g_Pal1Base).l,a0
		lea	(g_Pal2Base).l,a1
		moveq	#$0000000F,d7

_gopColour:
		move.b	(a0)+,d0		  ; Only keep blue component, and darken
		subq.b	#$02,d0
		bpl.s	_gopStore
		clr.b	d0

_gopStore:
		move.b	d0,(a1)+
		move.b	(a0)+,d0
		lsr.b	#$03,d0
		andi.b	#$22,d0
		move.b	d0,(a1)+
		dbf	d7,_gopColour
		jsr	(CopyBasePaletteToActivePalette).l
		rts

; Blanks the inventory window tilemap and draws the equip screen
; from EquipInventoryLayout.
DrawEquipInventory:
		bsr.w	_initEquipCursor
		bsr.s	InitEquipGreyedOutPal
		lea	(g_Buffer).l,a1
		lea	$00000084(a1),a0
		move.w	#$A000,d0
		ori.w	#$0000,d0
		move.w	#$0B63,d7

_dedFill:
		move.w	d0,(a0)+
		dbf	d7,_dedFill
		bsr.w	DrawEquipItemNames
		bsr.w	_drawEquipGrid
		rts

; Draw the 4x5 icon grid: rows 4 sub-rows apart from column $A,
; walking the whole EquipInventoryLayout with each row's equipped
; column in d2, then push the window and draw the cursor.
_drawEquipGrid:
		moveq	#$00000001,d1
		moveq	#$00000003,d7
		lea	EquipInventoryLayout(pc),a3
		lea	((g_Buffer+$10)).l,a4

_degRow:
		movem.w	d1/d7,-(sp)
		moveq	#$0000000A,d0
		bsr.w	GetInvWindowPtr
		moveq	#$00000004,d6
		move.w	(a4)+,d2

_degItem:
		move.b	(a3)+,d0
		bsr.w	_drawSlotIcon
		dbf	d6,_degItem
		movem.w	(sp)+,d1/d7
		addq.w	#$04,d1
		dbf	d7,_degRow
		bsr.w	RefreshItemWindow
		bsr.w	GetEquipCursorPos
		moveq	#$00000001,d2
		bsr.w	DrawEquipCursorSprite
		jsr	(j_EnableDMAQueueProcessing).l
		rts

; One grid icon: bit-7 layout entries (the "nothing" placeholders)
; always draw; real items only when owned. The equipped column
; (d2, compared against 4 - d6) draws normal, everything else
; greyed.
_drawSlotIcon:
		tst.b	d0
		bmi.s	_dsiAlways
		move.l	d2,-(sp)
		jsr	(j_GetItemQtyAndMaxQty).l
		move.l	(sp)+,d2
		bra.s	_dsiCheck
; ---------------------------------------------------------------------------

_dsiAlways:
		andi.b	#$7F,d0
		moveq	#$00000001,d1

_dsiCheck:
		tst.w	d1
		bmi.s	_dsiNext
		moveq	#$00000004,d7
		sub.w	d6,d7
		cmp.w	d2,d7
		bne.s	_dsiGreyed
		clr.b	d1
		bra.s	_dsiDraw
; ---------------------------------------------------------------------------

_dsiGreyed:
		moveq	#$00000001,d1

_dsiDraw:
		movem.l	a0,-(sp)
		bsr.w	DrawItemIcon
		movem.l	(sp)+,a0

_dsiNext:
		lea	$0000000A(a0),a0
		rts

	modend
