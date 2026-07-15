
SetFlagBit:
		movem.l	d0/a0,-(sp)
		bsr.s	ConvertFlagNumberToBit
		bset	d0,(a0)
		movem.l	(sp)+,d0/a0
		rts
; End of function SetFlagBit

; ---------------------------------------------------------------------------

ClearFlagBit:
		movem.l	d0/a0,-(sp)
		bsr.s	ConvertFlagNumberToBit
		bclr	d0,(a0)
		movem.l	(sp)+,d0/a0
		rts
; ---------------------------------------------------------------------------

ToggleFlagBit:
		movem.l	d0/a0,-(sp)
		bsr.s	ConvertFlagNumberToBit
		bchg	d0,(a0)
		movem.l	(sp)+,d0/a0
		rts

; =============== S U B	R O U T	I N E =======================================


TestFlagBit:					  ; CODE XREF: ROM:00024AF8p
						  ; ROM:0002514Cp ...
		movem.l	d0/a0,-(sp)
		bsr.s	ConvertFlagNumberToBit
		btst	d0,(a0)
		movem.l	(sp)+,d0/a0
		rts
; End of function TestFlagBit


; =============== S U B	R O U T	I N E =======================================


ConvertFlagNumberToBit:				  ; CODE XREF: SetFlagBit+4p
						  ; ROM:00029434p ...
		move.l	d1,-(sp)
		lea	(g_Flags).l,a0
		move.w	d0,d1
		lsr.w	#$03,d1
		adda.w	d1,a0
		andi.w	#$0007,d0
		move.l	(sp)+,d1
		rts
; End of function ConvertFlagNumberToBit
