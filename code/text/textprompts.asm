TextPrompts	module

; The dialogue yes/no choice: print strings 0/1 ("Yes" at buffer X
; $50, "No" at $A0 - $A8 on DE) on the current textbox line and run
; a blinking right-arrow cursor (sprite 2, palette 3) beside them.
; Left/right move between screen X $D0 and $120 ($128 DE); only
; buttons released since the last press register (mask d2). A/C
; confirm, B cancels straight to "No".
; Returns carry set = Yes (see GetYesNoAnswer).
YesNoPrompt:
		bsr.w	_loadRightArrowGfx
		move.w	#$0050,(g_TextCursorX).l
		move.w	#$0000,d0		  ; Yes
		jsr	(j_PrintStringInstantly).l
	if REGION=DE
		move.w	#$00A8,(g_TextCursorX).l
	else
		move.w	#$00A0,(g_TextCursorX).l
	endif
		move.w	#$0001,d0		  ; No
		jsr	(j_PrintStringInstantly).l
		move.b	(g_TextCursorY).l,d1
		ext.w	d1
	if	REGION=JP
		addi.w	#$0128,d1
	else
		addi.w	#$0124,d1
	endif
		move.b	#$05,(g_VDPSpr02_Size).l
		move.w	#$E524,(g_VDPSpr02_TileSource).l
		move.w	#$00D0,(g_VDPSpr02_X).l
		clr.b	(g_Scratch1800).l	  ; Blink timer
		clr.b	d2

_ynTick:
		move.w	d1,(g_VDPSpr02_Y).l
		tst.b	(g_Scratch1800).l
		bpl.s	_ynWait
		clr.w	(g_VDPSpr02_Y).l	  ; Blink off phase

_ynWait:
		jsr	(j_WaitUntilVBlank).l
		jsr	(j_UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d0
		and.b	d2,d0			  ; Fresh presses only
		andi.b	#$70,d0
		beq.s	_ynIdle
		btst	#$04,d0			  ; B
		bne.s	_ynCancel
		bra.s	_ynConfirm
; ---------------------------------------------------------------------------

_ynIdle:
		move.b	(g_Controller1State).l,d2
		eori.b	#$70,d2			  ; Released buttons may register next
		btst	#CTRL_RIGHT,(g_Controller1State).l
		bne.s	_ynRight
		btst	#CTRL_LEFT,(g_Controller1State).l
		bne.s	_ynLeft

_ynBlink:
		addq.b	#$08,(g_Scratch1800).l	  ; 16 frames on, 16 off
		bra.s	_ynTick
; ---------------------------------------------------------------------------

; A/C: the answer is where the arrow is - carry set (X = $D0, on
; "Yes") or clear (on "No").
_ynConfirm:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MenuOpen
; ---------------------------------------------------------------------------
		clr.w	(g_VDPSpr02_Y).l
		cmpi.w	#$00D1,(g_VDPSpr02_X).l
		rts
; ---------------------------------------------------------------------------

_ynRight:
	if REGION=DE
		cmpi.w	#$0128,(g_VDPSpr02_X).l
	else
		cmpi.w	#$0120,(g_VDPSpr02_X).l
	endif
		beq.s	_ynBlink
	if REGION=DE
		move.w	#$0128,(g_VDPSpr02_X).l
	else
		move.w	#$0120,(g_VDPSpr02_X).l
	endif
		clr.b	(g_Scratch1800).l
		bra.w	_ynTick
; ---------------------------------------------------------------------------

_ynLeft:
		cmpi.w	#$00D0,(g_VDPSpr02_X).l
		beq.w	_ynBlink
		move.w	#$00D0,(g_VDPSpr02_X).l
		clr.b	(g_Scratch1800).l
		bra.w	_ynTick
; ---------------------------------------------------------------------------

; B: answer No (tst clears carry).
_ynCancel:
		clr.w	(g_VDPSpr02_Y).l
		tst.b	d0
		rts

; Draw the item menu's action bar: strings 2/3 ("Use" / "Equip") on
; a fresh textbox, with the right-arrow cursor (sprite 79, palette
; 0) parked on the first option. The arrow Y is stashed in
; g_Scratch1800 for RunUseEquipPrompt, whose low byte then becomes
; the blink timer. Called when the menu opens (CheckForMenuOpen).
LoadUseEquipPrompt:
		bsr.w	_loadRightArrowGfx
		bsr.w	ReloadTextbox
		move.w	#$0050,(g_TextCursorX).l
		move.w	#$0002,d0
		jsr	(j_PrintStringInstantly).l
	if REGION=DE
		move.w	#$00A8,(g_TextCursorX).l
	else
		move.w	#$00A0,(g_TextCursorX).l
	endif
		move.w	#$0003,d0
		jsr	(j_PrintStringInstantly).l
		move.b	(g_TextCursorY).l,d1
		ext.w	d1
	if	REGION=JP
		addi.w	#$0138,d1
	else
		addi.w	#$0134,d1
	endif
		move.b	#$05,(g_VDPSpr79_Size).l
		move.w	#$8524,(g_VDPSpr79_TileSource).l
		move.w	#$00D0,(g_VDPSpr79_X).l
		move.w	d1,(g_VDPSpr79_Y).l
		move.w	d1,(g_Scratch1800).l
		rts

; Run the Use/Equip choice (same cursor scheme as YesNoPrompt, on
; sprite 79). Hovering the second option draws the equip inventory
; in the menu window as a preview; moving back clears it again (the
; sprite is re-initialised after each redraw). Returns carry set
; with d0 = 0 (Use) / 1 (Equip), or carry clear on B (close the
; menu). Called from CheckForMenuOpen via j_RunUseEquipPrompt.
RunUseEquipPrompt:
		move.w	(g_Scratch1800).l,d1	  ; Arrow Y from LoadUseEquipPrompt
		clr.b	(g_Scratch1800).l	  ; Now the blink timer
		clr.b	d2

_uepTick:
		move.w	d1,(g_VDPSpr79_Y).l
		tst.b	(g_Scratch1800).l
		bpl.s	_uepWait
		clr.w	(g_VDPSpr79_Y).l	  ; Blink off phase

_uepWait:
		jsr	(j_WaitUntilVBlank).l
		jsr	(j_UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d0
		and.b	d2,d0			  ; Fresh presses only
		andi.b	#$70,d0
		beq.s	_uepIdle
		btst	#$04,d0			  ; B
		bne.w	_uepCancel
		bra.s	_uepConfirm
; ---------------------------------------------------------------------------

_uepIdle:
		move.b	(g_Controller1State).l,d2
		eori.b	#$70,d2			  ; Released buttons may register next
		btst	#CTRL_RIGHT,(g_Controller1State).l
		bne.s	_uepRight
		btst	#CTRL_LEFT,(g_Controller1State).l
		bne.s	_uepLeft

_uepBlink:
		addq.b	#$08,(g_Scratch1800).l
		bra.s	_uepTick
; ---------------------------------------------------------------------------

; A/C: d0 = 0 on the first option (X = $D0, Use) else 1 (Equip),
; carry set = a choice was made.
_uepConfirm:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MenuOpen
; ---------------------------------------------------------------------------
		move.w	d1,(g_VDPSpr79_Y).l
		clr.b	d0
		cmpi.w	#$00D0,(g_VDPSpr79_X).l
		beq.s	_uepAnswer
		move.b	#$01,d0

_uepAnswer:
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

_uepRight:
	if REGION=DE
		cmpi.w	#$0128,(g_VDPSpr79_X).l
	else
		cmpi.w	#$0120,(g_VDPSpr79_X).l
	endif
		beq.w	_uepBlink
	if REGION=DE
		move.w	#$0128,(g_VDPSpr79_X).l
	else
		move.w	#$0120,(g_VDPSpr79_X).l
	endif
		move.b	#$05,(g_VDPSpr79_Size).l
		move.w	#$8524,(g_VDPSpr79_TileSource).l
		clr.b	(g_Scratch1800).l
		movem.w	d1-d2,-(sp)
		jsr	(j_DrawEquipInventory).l  ; Preview the equip screen
		movem.w	(sp)+,d1-d2
		bra.w	_uepTick
; ---------------------------------------------------------------------------

_uepLeft:
		cmpi.w	#$00D0,(g_VDPSpr79_X).l
		beq.w	_uepBlink
		move.w	#$00D0,(g_VDPSpr79_X).l
		move.b	#$05,(g_VDPSpr79_Size).l
		move.w	#$8524,(g_VDPSpr79_TileSource).l
		clr.b	(g_Scratch1800).l
		movem.w	d1-d2,-(sp)
		jsr	(j_ClearInventoryWindow).l ; Clear the preview
		movem.w	(sp)+,d1-d2
		bra.w	_uepTick
; ---------------------------------------------------------------------------

; B: close the menu (tst clears carry).
_uepCancel:
		clr.w	(g_VDPSpr79_Y).l
		tst.b	d0
		rts

; Queue the right-arrow cursor graphics (2 tiles) into VRAM $A480
; (the same slot the dialogue continue arrow uses).
_loadRightArrowGfx:
		lea	RightArrowGfx(pc),a0
		lea	($0000A480).l,a1
		move.w	#$0040,d0
		jsr	(j_QueueDMAOp).l
		jsr	(j_EnableDMAQueueProcessing).l
		rts

	modend
