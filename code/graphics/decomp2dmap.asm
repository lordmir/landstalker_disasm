DecompTilemap:					  ; CODE XREF: LoadLithographTilemap+3Ap
						  ; DisplayTitle+11Ap ...
		movem.l	d0-a6,-(sp)
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.l	a1,-(sp)

_GetTileAttrs:					  ; CODE XREF: DecompTilemap:_Continuej
		move.b	(a0)+,d0
		btst	#$02,d0
		beq.s	_Get16BitRunLength
		bsr.w	DecompTM_8bitRLEFill
		bra.s	_Continue
; ---------------------------------------------------------------------------

_Get16BitRunLength:				  ; CODE XREF: DecompTilemap+10j
		bsr.w	DecompTM_16bitRLEFill
		tst.w	d7
		beq.w	_GetTileValues

_Continue:					  ; CODE XREF: DecompTilemap+16j
		bra.s	_GetTileAttrs
; ---------------------------------------------------------------------------

_GetTileValues:					  ; CODE XREF: DecompTilemap+1Ej
		movea.l	(sp)+,a1
		move.b	(a0)+,d0
		bsr.w	DecompTM_RLEFillOR
		move.w	d0,d4			  ; d4 - incremental value
		move.w	d0,d5			  ; d5 - last value

_Loop:						  ; CODE XREF: DecompTilemap:_Continue2j
		move.b	(a0)+,d0
		bmi.s	_Bit7Set		  ; Bit	7 set
		btst	#$06,d0
		bne.s	_Bit7Clear6Set		  ; Bit	6 set

_Bit7Clear6Clear:
		bsr.w	DecompTM_CopySingleWord
		cmpi.w	#$07FF,d0
		beq.w	_Return
		bra.s	_Continue1
; ---------------------------------------------------------------------------

_Bit7Clear6Set:					  ; CODE XREF: DecompTilemap+38j
		bsr.w	DecompTM_RLEFillOR
		move.w	d0,d5			  ; d5 - last value

_Continue1:					  ; CODE XREF: DecompTilemap+46j
		bra.s	_Continue2
; ---------------------------------------------------------------------------

_Bit7Set:					  ; CODE XREF: DecompTilemap+32j
		btst	#$06,d0
		bne.s	_Bit7Set6Set		  ; Bit	6 set

_Bit7Set6Clear:					  ; d5 - last value
		move.w	d5,d1
		bsr.w	DecompTM_FillWithLast
		bra.s	_Continue2
; ---------------------------------------------------------------------------

_Bit7Set6Set:					  ; CODE XREF: DecompTilemap+54j
		move.w	d4,d1			  ; d4 - incremental fill
		bsr.w	DecompTM_IncrementalFill
		move.w	d0,d4

_Continue2:					  ; CODE XREF: DecompTilemap:_Continue1j
						  ; DecompTilemap+5Cj
		bra.s	_Loop
; ---------------------------------------------------------------------------

_Return:					  ; CODE XREF: DecompTilemap+42j
		movem.l	(sp)+,d0-a6
		rts
; End of function DecompTilemap


; =============== S U B	R O U T	I N E =======================================


DecompTM_8bitRLEFill:				  ; CODE XREF: DecompTilemap+12p
		move.b	d0,d7
		andi.w	#$0003,d7
		bra.w	loc_397F0
; End of function DecompTM_8bitRLEFill


; =============== S U B	R O U T	I N E =======================================


DecompTM_16bitRLEFill:				  ; CODE XREF: DecompTilemap:_Get16BitRunLengthp
		move.b	d0,d7
		lsl.w	#$08,d7
		move.b	(a0)+,d7
		andi.w	#$03FF,d7
		bne.s	loc_397F0
		rts
; ---------------------------------------------------------------------------

loc_397F0:					  ; CODE XREF: DecompTM_8bitRLEFill+6j
						  ; DecompTM_16bitRLEFill+Aj
		andi.b	#$F8,d0

_Loop:						  ; CODE XREF: DecompTM_16bitRLEFill+16j
		move.b	d0,(a1)+
		clr.b	(a1)+
		dbf	d7,_Loop
		rts
; End of function DecompTM_16bitRLEFill


; =============== S U B	R O U T	I N E =======================================


DecompTM_CopySingleWord:			  ; CODE XREF: DecompTilemap:_Bit7Clear6Clearp
		lsl.w	#$08,d0
		move.b	(a0)+,d0
		andi.w	#$07FF,d0
		or.w	d0,(a1)+
		rts
; End of function DecompTM_CopySingleWord


; =============== S U B	R O U T	I N E =======================================


DecompTM_RLEFillOR:				  ; CODE XREF: DecompTilemap+28p
						  ; DecompTilemap:_Bit7Clear6Setp
		move.b	d0,d7
		lsr.b	#$03,d7
		andi.w	#$0007,d7
		lsl.w	#$08,d0
		move.b	(a0)+,d0
		bra.s	loc_39820
; End of function DecompTM_RLEFillOR


; =============== S U B	R O U T	I N E =======================================


DecompTM_FillWithLast:				  ; CODE XREF: DecompTilemap+58p
		move.b	d0,d7
		andi.w	#$003F,d7
		move.w	d1,d0

loc_39820:					  ; CODE XREF: DecompTM_RLEFillOR+Cj
		andi.w	#$07FF,d0

_Loop:						  ; CODE XREF: DecompTM_FillWithLast+Ej
		or.w	d0,(a1)+
		dbf	d7,_Loop
		rts
; End of function DecompTM_FillWithLast


; =============== S U B	R O U T	I N E =======================================


DecompTM_IncrementalFill:			  ; CODE XREF: DecompTilemap+60p
		move.b	d0,d7
		andi.w	#$003F,d7
		move.w	d1,d0
		andi.w	#$07FF,d0

_Loop:						  ; CODE XREF: DecompTM_IncrementalFill+10j
		addq.w	#$01,d0
		or.w	d0,(a1)+
		dbf	d7,_Loop
		rts
; End of function DecompTM_IncrementalFill

; ---------------------------------------------------------------------------
		jsr	(j_FadeToBlack).l
; START	OF FUNCTION CHUNK FOR DisplayTitle
