; ---------------------------------------------------------------------------
		lea	(Sprite1_X).l,a0

; =============== S U B	R O U T	I N E =======================================


sub_9BD0:					  ; CODE XREF: sub_620A-6p
		move.b	(Player_RotationAndSize).l,d0
		addi.b	#$40,d0
		andi.b	#$C0,d0
		cmpi.b	#$80,d0
		bcc.s	locret_9BFC
		lea	Shops(pc),a0

loc_9BE8:					  ; CODE XREF: sub_9BD0+22j
		move.w	(a0)+,d0
		bmi.s	locret_9BFC
		cmp.w	(g_RmNum1).l,d0
		bne.s	loc_9BE8
		jsr	(sub_22EA4).l
		nop

locret_9BFC:					  ; CODE XREF: sub_9BD0+12j
						  ; sub_9BD0+1Aj
		rts
; End of function sub_9BD0


; =============== S U B	R O U T	I N E =======================================


sub_9BFE:					  ; CODE XREF: sub_620A-Cp
		move.b	(Player_RotationAndSize).l,d0
		addi.b	#$40,d0
		andi.b	#$C0,d0
		cmpi.b	#$80,d0
		bcs.s	locret_9C40
		lea	Shops(pc),a0

loc_9C16:					  ; CODE XREF: sub_9BFE+22j
		move.w	(a0)+,d0
		bmi.s	locret_9C40
		cmp.w	(g_RmNum1).l,d0
		bne.s	loc_9C16
		move.b	(Player_Action+1).l,d0	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6, Bit7 - Pick up / Put down
						  ; Bit8-Bit10 - Sword swing
						  ; Bit12 - Ladder Climb
		andi.b	#$C0,d0
		cmpi.b	#$C0,d0
		bne.s	loc_9C3A
		jsr	(sub_22EB4).l
		rts
; ---------------------------------------------------------------------------

loc_9C3A:					  ; CODE XREF: sub_9BFE+32j
		jsr	(sub_22EA8).l

locret_9C40:					  ; CODE XREF: sub_9BFE+12j
						  ; sub_9BFE+1Aj
		rts
; End of function sub_9BFE

; ---------------------------------------------------------------------------
