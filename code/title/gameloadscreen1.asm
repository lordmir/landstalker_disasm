GameSelectScreen	module
; The save-slot select screen (reached from the title flow via
; LoadGameSelectScreen): four save windows in a 2x2 grid with a
; Nigel figure standing in the highlighted one. The action bar,
; window drawing and yes/no prompt helpers (sub_F92A, sub_F992,
; sub_F72E...) live in gameloadscreen2-4, which share this
; screen's stack frame and call back into the Nigel and highlight
; routines here.

; Entry, d0 = the initial cursor slot.
;
; Stack frame (shared with the gameloadscreen3/4 helpers):
;   -$02 cursor slot        -$04 first picked slot ($FFFF none)
;   -$06 second slot (copy) -$08 previous controller byte
;   -$0C action from the bar (0 play / 1 copy / 2+ erase)
;   -$0E reset to $12 each pass  -$10/-$12 Nigel x/y offsets
;   -$16.l Nigel anim script     -$17 tick  -$18 frame  -$19 done
InitGameSelectScreen:
		link	a6,#-$001E
		trap	#$00			  ; Trap00Handler
		dc.w SND_Stop

		movea.l	a6,a0
		moveq	#$0000001D,d7

_igsClear:
		clr.b	-(a0)
		dbf	d7,_igsClear
		ext.w	d0
		move.w	d0,-$00000002(a6)
		move.b	#$0B,(g_TextColour).l
		clr.w	-$0000000A(a6)
		clr.b	-$00000008(a6)
		jsr	(DisableDisplayAndInts).l
		clr.w	d6
		jsr	(j_FillVSRAM).l
		jsr	(j_FillVSRAMOffset1).l
		bsr.w	LoadGameSelectMenu
		bsr.w	InitGameStartScreen
		bsr.w	sub_F958
		bsr.w	LoadGameStartPalette
		clr.w	d6
		jsr	(j_FillHScrollData).l
		jsr	(j_FillVSRAM).l
		jsr	(j_FillHScrollDataOffset1).l
		jsr	(j_FillVSRAMOffset1).l
		jsr	(EnableDisplayAndInts).l
		jsr	(j_FadeFromBlack).l

; Main loop: run the action bar (sub_F92A leaves the choice in
; -$0C), then pick a slot; B backs out to the bar, a pick either
; loads the game, starts a copy, or erases.
_igsMain:
		bsr.w	sub_F92A
		move.w	#$FFFF,-$00000004(a6)
		move.w	#$FFFF,-$00000006(a6)
		move.w	#$0012,-$0000000E(a6)
		bsr.w	LoadGameStartPalette
		bsr.w	_pickSlot
		tst.w	d0
		bmi.s	_igsMain
		move.w	d0,-$00000004(a6)
		move.b	d0,(g_SaveSlot).l
		move.w	-$0000000C(a6),d0
		cmpi.b	#$01,d0
		beq.w	_igsCopy
		bcc.w	_igsErase
		bsr.w	HandleGameStartInput
		jsr	(j_FadeToBlack).l
		move.w	-$00000004(a6),d0
		move.b	d0,(g_SaveSlot).l
		jsr	(LoadSavedGame).l
		unlk	a6
		rts
; ---------------------------------------------------------------------------

; Copy: retint the windows (the picked pair on line 3), ask for a
; destination (string $4B), refuse the same slot, confirm (string
; $49 + sub_F992), then CopySaveGame and redraw the destination
; window.
_igsCopy:
		bsr.w	_tintPickedSlots
		bsr.w	sub_FAE6
		bsr.w	ClearTextBuffer
		move.w	#$004B,d1
		bsr.w	j_j_LoadUncompressedString
		jsr	(WaitUntilVBlank).l
		bsr.w	DMACopyTextBuffer

_igsCopyPick:
		bsr.w	_pickSlot
		tst.w	d0
		bmi.w	_igsMain
		cmp.w	-$00000004(a6),d0
		bne.s	_igsCopyConfirm
		trap	#$00			  ; Trap00Handler
		dc.w SND_ErrorBuzz

		bra.s	_igsCopyPick
; ---------------------------------------------------------------------------

_igsCopyConfirm:
		move.w	d0,-$00000006(a6)
		bsr.w	ClearTextBuffer
		move.w	#$0049,d1
		bsr.w	j_j_LoadUncompressedString
		bsr.w	sub_F992
		tst.w	d0
		bne.w	_igsMain
		move.w	-$00000004(a6),d0
		move.w	-$00000006(a6),d1
		jsr	(CopySaveGame).l
		move.w	-$00000006(a6),d0
		bsr.w	sub_F72E
		bra.w	_igsMain
; ---------------------------------------------------------------------------

; Erase: confirm (string $4A), wipe the slot and redraw its
; window.
_igsErase:
		bsr.w	ClearTextBuffer
		move.w	#$004A,d1
		bsr.w	j_j_LoadUncompressedString
		bsr.w	sub_F992
		tst.w	d0
		bne.w	_igsMain
		move.w	-$00000004(a6),d0
		move.b	d0,(g_SaveSlot).l
		jsr	(EraseCurrentSaveslot).l
		jsr	(WaitUntilVBlank).l
		move.w	-$00000004(a6),d0
		bsr.w	sub_F72E
		bra.w	_igsMain
; ---------------------------------------------------------------------------

; Pick a save slot: cursor on the 2x2 grid (up/down/left/right set
; the slot bits directly), Nigel reacting to each move and idling
; between them. Returns d0 = the slot on A/C/Start, or -1 on B.
_pickSlot:
		clr.b	d0
		bsr.w	sub_FAF0
		bsr.w	UpdateSaveSlotHighlights
		jsr	(j_WaitUntilVBlank).l
		bsr.w	CopySaveScreenToPlaneA
		clr.b	-$00000019(a6)
		move.l	#_nigelAnimIdle,-$00000016(a6)
		move.b	(g_Controller1State).l,d0
		move.b	d0,-$00000008(a6)

_psTick:
		tst.b	-$00000019(a6)
		beq.s	_psInput
		clr.b	-$00000019(a6)

_psInput:
		bsr.w	SuppressHeldInputs
		move.b	(g_Controller1State).l,d0
		btst	#$04,d0
		bne.s	_psCancel
		btst	#$07,d0
		bne.s	_psConfirm
		btst	#$06,d0
		bne.s	_psConfirm
		btst	#$05,d0
		bne.s	_psConfirm
		move.w	-$00000002(a6),d7
		btst	#$00,d0
		beq.s	_psDown
		bsr.w	_slotUp
		bra.s	_psMoved
; ---------------------------------------------------------------------------

_psDown:
		btst	#$01,d0
		beq.s	_psLeft
		bsr.w	_slotDown
		bra.s	_psMoved
; ---------------------------------------------------------------------------

_psLeft:
		btst	#$02,d0
		beq.s	_psRight
		bsr.w	_slotLeft
		bra.s	_psMoved
; ---------------------------------------------------------------------------

_psRight:
		btst	#$03,d0
		beq.s	_psNoMove
		bsr.w	_slotRight
		bra.s	_psMoved
; ---------------------------------------------------------------------------

_psNoMove:
		bra.s	_psDraw
; ---------------------------------------------------------------------------

_psMoved:
		cmp.w	-$00000002(a6),d7
		beq.s	_psRedraw
		trap	#$00			  ; Trap00Handler
		dc.w SND_CursorMove

_psRedraw:
		bsr.w	StartSaveNigelAnim
		bsr.w	UpdateSaveSlotHighlights

_psDraw:
		bsr.w	sub_F8B6
		bsr.w	DrawSaveNigel
		jsr	(WaitUntilVBlank).l
		bsr.w	CopySaveScreenToPlaneA
		bra.w	_psTick
; ---------------------------------------------------------------------------

_psConfirm:
		trap	#$00			  ; Trap00Handler
		dc.w SND_CursorSelect

		move.w	-$00000002(a6),d0
		rts
; ---------------------------------------------------------------------------

_psCancel:
		moveq	#$FFFFFFFF,d0
		rts

; The 2x2 slot grid: bit 0 = right column, bit 1 = bottom row.
_slotUp:
		move.w	-$00000002(a6),d0
		andi.w	#$0001,d0
		move.w	d0,-$00000002(a6)
		rts

_slotDown:
		move.w	-$00000002(a6),d0
		ori.w	#$0002,d0
		move.w	d0,-$00000002(a6)
		rts

_slotLeft:
		move.w	-$00000002(a6),d0
		andi.w	#$0002,d0
		move.w	d0,-$00000002(a6)
		rts

_slotRight:
		move.w	-$00000002(a6),d0
		ori.w	#$0001,d0
		move.w	d0,-$00000002(a6)
		rts
; ---------------------------------------------------------------------------

; Unreachable leftovers.
		rts
; ---------------------------------------------------------------------------
		bsr.w	_getWindowPtr
		move.w	#$0000,d0
		bra.w	_tintWindow

; Nigel reacts to a cursor move: switch to the react script
; (unless it is already playing) and restart its counters. Also
; used by the title flow (gameloadscreen3/4).
StartSaveNigelAnim:
		movea.l	-$00000016(a6),a0
		cmpi.b	#$0F,(a0)
		beq.s	_snaDraw
		move.l	#_nigelAnimReact,-$00000016(a6)
		clr.b	-$00000017(a6)
		clr.b	-$00000018(a6)
		clr.b	-$00000019(a6)

_snaDraw:
		bsr.w	sub_FAF0
		rts

; Set the palette bits d0 ($0000 = line 0, $6000 = line 3) across
; a save window's 10 rows x 18 columns (row stride $50).
_tintWindow:
		moveq	#$00000009,d6

_twRow:
		movea.l	a0,a1
		moveq	#$00000011,d7

_twCell:
		move.w	(a0),d1
		andi.w	#$9FFF,d1
		or.w	d0,d1
		move.w	d1,(a0)+
		dbf	d7,_twCell
		lea	$00000050(a1),a0
		dbf	d6,_twRow
		rts

; Advance and draw the Nigel figure: step his animation, place him
; at the cursor slot's spot (SaveGameNigelPos plus the -$10/-$12
; offsets), park sprites 4-7 and load his sprite frame. Also used
; by the title flow.
DrawSaveNigel:
		bsr.w	_advanceNigelAnim
		bsr.w	_getNigelPos
		move.w	(a0)+,d4
		add.w	-$00000010(a6),d4
		move.w	(a0)+,d5
		add.w	-$00000012(a6),d5
		move.l	#$00000000,d0
		move.w	#$4400,d1
		lea	(g_VDPSpr04_Y).l,a3
		clr.l	d6
		bset	#$03,d6
		move.w	#$FFFF,d7
		move.w	d7,(a3)
		move.w	d7,$00000008(a3)
		move.w	d7,$00000010(a3)
		move.w	d7,$00000018(a3)
		movem.l	d2-d3/a4-a6,-(sp)
		jsr	(LoadSpriteGfx).l
		jsr	(EnableDMAQueueProcessing).l
		movem.l	(sp)+,d2-d3/a4-a6
		rts

; Step the animation script at -$16: byte 0 is the base sprite
; frame (returned x4 in d2), the rest per-frame durations
; (0-terminated). At the end of a script, count -$19 up and chain
; the react script back into the idle one. Returns d3 = the
; current frame x4.
_advanceNigelAnim:
		movea.l	-$00000016(a6),a0
		clr.w	d2
		move.b	(a0)+,d2
		lsl.w	#$02,d2
		clr.w	d0
		move.b	-$00000017(a6),d0
		clr.w	d3
		move.b	-$00000018(a6),d3

_anaFrame:
		move.b	(a0,d3.w),d1
		bne.s	_anaTick
		addq.b	#$01,-$00000019(a6)
		clr.b	-$00000017(a6)
		clr.b	-$00000018(a6)
		lea	_nigelAnimReact(pc),a0
		nop
		cmpa.l	-$00000016(a6),a0
		bne.s	_anaRestart
		move.l	#_nigelAnimIdle,-$00000016(a6)

_anaRestart:
		bra.s	_advanceNigelAnim
; ---------------------------------------------------------------------------

_anaTick:
		cmp.b	d1,d0
		bcs.s	_anaStore
		addq.w	#$01,d3
		clr.w	d0
		bra.s	_anaFrame
; ---------------------------------------------------------------------------

_anaStore:
		move.b	d0,-$00000017(a6)
		addq.b	#$01,-$00000017(a6)
		move.b	d3,-$00000018(a6)
		lsl.w	#$02,d3
		rts

; Park Nigel on the static single-frame script. Also used by the
; title flow.
SetSaveNigelStill:
		move.l	#_nigelAnimStill,-$00000016(a6)
		clr.b	-$00000019(a6)
		clr.b	-$00000017(a6)
		clr.b	-$00000018(a6)
		rts

; Still Nigel, drawn immediately (used around the yes/no prompts).
DrawSaveNigelStill:
		bsr.s	SetSaveNigelStill
		bsr.w	DrawSaveNigel
		rts

; Reset all four save windows to palette line 0. Called by the
; title flow.
ClearSaveSlotHighlights:
		moveq	#$00000003,d0

_cshSlot:
		move.l	d0,-(sp)
		bsr.w	_getWindowPtr
		clr.l	d0
		bsr.w	_tintWindow
		move.l	(sp)+,d0
		dbf	d0,_cshSlot
		rts

; Tint every save window to palette line 3 except the cursor slot
; and the picked slots (-$02 / -$04 / -$06), which stay on line 0.
UpdateSaveSlotHighlights:
		moveq	#$00000003,d0

_ushSlot:
		move.l	d0,-(sp)
		cmp.w	-$00000002(a6),d0
		beq.s	_ushBright
		cmp.w	-$00000004(a6),d0
		beq.s	_ushBright
		cmp.w	-$00000006(a6),d0
		beq.s	_ushBright
		bsr.w	_getWindowPtr
		move.w	#$6000,d0
		bsr.w	_tintWindow
		bra.s	_ushNext
; ---------------------------------------------------------------------------

_ushBright:
		bsr.w	_getWindowPtr
		move.w	#$0000,d0
		bsr.w	_tintWindow

_ushNext:
		move.l	(sp)+,d0
		dbf	d0,_ushSlot
		rts

; The copy prompt's inverse: the two picked slots get the line-3
; tint, the rest stay on line 0.
_tintPickedSlots:
		moveq	#$00000003,d0

_hpsSlot:
		move.l	d0,-(sp)
		cmp.w	-$00000004(a6),d0
		beq.s	_hpsPicked
		cmp.w	-$00000006(a6),d0
		beq.s	_hpsPicked
		bsr.w	_getWindowPtr
		move.w	#$0000,d0
		bsr.w	_tintWindow
		bra.s	_hpsNext
; ---------------------------------------------------------------------------

_hpsPicked:
		bsr.w	_getWindowPtr
		move.w	#$6000,d0
		bsr.w	_tintWindow

_hpsNext:
		move.l	(sp)+,d0
		dbf	d0,_hpsSlot
		rts

; a0 = save window d0's spot in the screen buffer.
_getWindowPtr:
		lea	SaveGameWindowBegin(pc),a0
		andi.b	#$03,d0
		ext.w	d0
		ext.l	d0
		lsl.l	#$02,d0
		movea.l	(a0,d0.l),a0
		rts
; ---------------------------------------------------------------------------
SaveGameWindowBegin:dc.l g_Buffer+$56
		dc.l g_Buffer+$7A
		dc.l g_Buffer+$376
		dc.l g_Buffer+$39A

; a0 = the cursor slot's Nigel position (x, y).
_getNigelPos:
		move.w	-$00000002(a6),d0
		lea	SaveGameNigelPos(pc),a0
		andi.b	#$03,d0
		ext.w	d0
		ext.l	d0
		lsl.l	#$02,d0
		lea	(a0,d0.l),a0
		rts
; ---------------------------------------------------------------------------
SaveGameNigelPos:dc.w $00A4,$00CC
		dc.w $0134,$00CC
		dc.w $00A4,$011C
		dc.w $0134,$011C

; Nigel animation scripts: base frame, then per-frame durations
; (0-terminated).
_nigelAnimStill:dc.b $01,$01,$00
_nigelAnimIdle:	dc.b $03,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$00
_nigelAnimReact:dc.b $0F,$06,$06,$06,$06,$00,$FF

; Read the controller, but suppress everything while any input was
; already held on the previous frame (-$08) - only fresh presses
; get through. Also used by the title flow.
SuppressHeldInputs:
		jsr	(j_UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d1
		move.b	-$00000008(a6),d0
		bne.s	_shiHeld
		move.b	d1,-$00000008(a6)
		bra.s	_shiDone
; ---------------------------------------------------------------------------

_shiHeld:
		move.b	d1,-$00000008(a6)
		clr.b	(g_Controller1State).l

_shiDone:
		rts

; DMA the save screen (40 x 28 tiles from g_Buffer+2, $50-byte
; rows) to plane A - or plane B for the title flow's variant
; below. The two size bytes at g_Buffer are read but immediately
; overridden with 40 x 28.
CopySaveScreenToPlaneA:
		lea	($0000C000).l,a1
		bra.s	_cssBody

CopySaveScreenToPlaneB:
		lea	($0000E000).l,a1

_cssBody:
		lea	(g_Buffer).l,a0
		move.b	(a0)+,d0
		move.b	#$28,d0
		ext.w	d0
		move.b	(a0)+,d1
		move.b	#$1C,d1
		ext.w	d1
		subq.w	#$01,d1

_cssRow:
		movem.l	d0-d1/a1,-(sp)
		moveq	#$00000002,d1
		jsr	(j_DoDMACopy).l
		movem.l	(sp)+,d0-d1/a1
		lea	$00000080(a1),a1
		dbf	d1,_cssRow
		rts

	modend
