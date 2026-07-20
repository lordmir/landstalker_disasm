ScriptFuncsFlags	module
; Game flag helpers: a flag id is a bit index into the g_Flags
; array - byte id>>3, bit id&7.

SetFlagBit:
		movem.l	d0/a0,-(sp)
		bsr.s	ConvertFlagNumberToBit
		bset	d0,(a0)
		movem.l	(sp)+,d0/a0
		rts

ClearFlagBit:
		movem.l	d0/a0,-(sp)
		bsr.s	ConvertFlagNumberToBit
		bclr	d0,(a0)
		movem.l	(sp)+,d0/a0
		rts

ToggleFlagBit:
		movem.l	d0/a0,-(sp)
		bsr.s	ConvertFlagNumberToBit
		bchg	d0,(a0)
		movem.l	(sp)+,d0/a0
		rts

; Flags: NE = flag d0 is set.
TestFlagBit:
		movem.l	d0/a0,-(sp)
		bsr.s	ConvertFlagNumberToBit
		btst	d0,(a0)
		movem.l	(sp)+,d0/a0
		rts

; Split flag id d0 into a0 = its byte in g_Flags and d0 = the bit.
ConvertFlagNumberToBit:
		move.l	d1,-(sp)
		lea	(g_Flags).l,a0
		move.w	d0,d1
		lsr.w	#$03,d1
		adda.w	d1,a0
		andi.w	#$0007,d0
		move.l	(sp)+,d1
		rts

	modend
