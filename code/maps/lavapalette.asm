
; =============== S U B	R O U T	I N E =======================================


CheckAndDoLavaPaletteFx:			  ; DATA XREF: GameLoop+7Ct
		cmpi.w	#$020C,(g_RmNum1).l	  ; Lake shrine	exterior with lava
		bne.s	locret_260C
		move.b	(byte_FF0F9D).l,d0
		andi.b	#$0F,d0
		bne.s	locret_260C
		move.b	(byte_FF0F9D).l,d0
		andi.w	#$0070,d0
		lsr.b	#$02,d0
		move.l	#$C0100000,(VDP_CTRL_REG).l ; Write CRAM 0x0010
		move.w	LavaPaletteRotation(pc,d0.w),(VDP_DATA_REG).l
		move.l	#$C0120000,(VDP_CTRL_REG).l ; Write CRAM 0x0012
		move.w	LavaPaletteRotation+2(pc,d0.w),(VDP_DATA_REG).l

locret_260C:					  ; CODE XREF: CheckAndDoLavaPaletteFx+8j
						  ; CheckAndDoLavaPaletteFx+14j
		rts
; End of function CheckAndDoLavaPaletteFx

; ---------------------------------------------------------------------------
