SystemUtil	module

; d7 = value. Writes ten digit bytes to g_Base10Digits, each stored
; as digit+1 ($02 = '1'); leading zeros are then cleared to $00.
ConvertToBase10:
		movem.l	d5-d7/a5-a6,-(sp)
		lea	PowersOf10(pc),a5
		nop
		lea	(g_Base10Digits).l,a6
		moveq	#$09,d5

_digitLoop:
		clr.b	d6

_divLoop:
		addq.w	#$01,d6
		sub.l	(a5),d7
		bcc.s	_divLoop
		move.b	d6,(a6)+
		add.l	(a5)+,d7
		dbf	d5,_digitLoop
		lea	(g_Base10Digits).l,a6
		moveq	#$08,d6

_zeroLoop:
		cmpi.b	#$01,(a6)
		bne.w	_b10Done
		clr.b	(a6)+
		dbf	d6,_zeroLoop

_b10Done:
		movem.l	(sp)+,d5-d7/a5-a6
		rts

PowersOf10:	dc.l 1000000000
		dc.l 0100000000
		dc.l 0010000000
		dc.l 0001000000
		dc.l 0000100000
		dc.l 0000010000
		dc.l 0000001000
		dc.l 0000000100
		dc.l 0000000010
		dc.l 0000000001


UpdateControllerInputs:
		movem.l	d5-d7/a5-a6,-(sp)
		move	sr,d5
		bsr.w	DisableInterrupts
		move.w	#$0100,(Z80_BUSREQ_REG0).l

_ctrlBusLoop:
		btst	#$00,(Z80_BUSREQ_REG0).l
		bne.s	_ctrlBusLoop
		bsr.s	ReadControllerInput
		move.w	#$0000,(Z80_BUSREQ_REG0).l
		move	d5,sr
		movem.l	(sp)+,d5-d7/a5-a6
		rts


ReadControllerInput:
		lea	(g_Controller1State).l,a5
		lea	(SEGA_CTRL1_DATA_REG).l,a6
		bsr.s	ReadControllerReg
		neg.b	d6
		add.w	d6,(g_RNG).l
		addq.w	#$02,a6


; Standard TH-toggled 3-button pad read; result is inverted so
; pressed = 1. Both raw reads are also summed into g_RNG as entropy.
ReadControllerReg:
		move.b	#$00,(a6)
		nop
		nop
		move.b	(a6),d6
		lsl.b	#$02,d6
		andi.b	#$C0,d6
		move.b	#$40,(a6)
		nop
		nop
		move.b	(a6),d7
		andi.b	#$3F,d7
		or.b	d7,d6
		add.w	d6,(g_RNG).l
		not.b	d6
		move.b	d6,(a5)+
		rts


WaitForButtonPush:
		bsr.s	UpdateControllerInputs
		andi.b	#CTRLBF_ANYBUTTON,(g_Controller1State).l
		bne.s	_wfbDone
		bsr.w	WaitUntilVBlank
		bra.s	WaitForButtonPush

_wfbDone:
		rts


WaitForNextButtonPress:
		bsr.w	UpdateControllerInputs
		andi.b	#CTRLBF_ANYBUTTON,(g_Controller1State).l
		beq.s	_wfnWait
		bsr.w	WaitUntilVBlank
		bra.s	WaitForNextButtonPress

_wfnWait:
		bsr.w	UpdateControllerInputs
		andi.b	#CTRLBF_ANYBUTTON,(g_Controller1State).l
		bne.s	_wfnDone
		bsr.w	WaitUntilVBlank
		bra.s	_wfnWait

_wfnDone:
		rts


; Like UpdateControllerInputs but suppresses the buttons in
; g_InputHoldMask for up to 10 frames. The mask is never set anywhere
; and this is only reachable via an unreferenced thunk - an unused
; debounce leftover.
UpdateControllerInputsMasked:
		movem.l	d7,-(sp)
		bsr.w	UpdateControllerInputs
		move.b	(g_Controller1State).l,d7
		and.b	(g_InputHoldMask).l,d7
		beq.s	_maskReset
		addq.b	#$01,(g_InputHoldTimer).l
		move.b	(g_InputHoldTimer).l,d7
		cmpi.b	#$0A,d7
		bcc.s	_maskReset
		clr.b	(g_Controller1State).l
		movem.l	(sp)+,d7
		rts

_maskReset:
		clr.b	(g_InputHoldMask).l
		clr.b	(g_InputHoldTimer).l
		movem.l	(sp)+,d7
		rts

Wait1SecondOrUntilButtonPushed:
		movem.l	d5,-(sp)
		moveq	#59,d5

_waitBtnLoop:
		bsr.w	UpdateControllerInputs
		andi.b	#CTRLBF_ANYBUTTON,(g_Controller1State).l
		bne.s	_waitBtnDone
		bsr.w	WaitUntilVBlank
		dbf	d5,_waitBtnLoop

_waitBtnDone:
		movem.l	(sp)+,d5
		rts


Wait3SecondsOrUntilButtonPushed:
		movem.l	d5,-(sp)
		move.l	#179,d5
		bra.s	_waitBtnLoop


; Steps g_RNG (seed = seed * 13 + 7) and returns d7 = a random
; number in [0, d6).
GenerateRandomNumber:
		move.w	(g_RNG).l,d7
		mulu.w	#$000D,d7
		addi.w	#$0007,d7
		andi.l	#$0000FFFF,d7
		move.w	d7,(g_RNG).l
		mulu.w	d6,d7
		swap	d7
		rts

		modend
