
; =============== S U B	R O U T	I N E =======================================

; Church in cave

sub_9EB9C:					  ; DATA XREF: sub_9B00Ct
		cmpi.w	#$0188,(g_RmNum1).l
		beq.s	locret_9EBC4
		move.b	#$FF,GoldOrChestContents(a4)
		clr.w	d0
		move.b	ChestIndex(a4),d0
		move.b	d0,d1
		andi.b	#$07,d1
		lsr.b	#$03,d0
		lea	(g_ChestOpenFlags).l,a0
		bset	d1,(a0,d0.w)

locret_9EBC4:					  ; CODE XREF: sub_9EB9C+8j
		rts
; End of function sub_9EB9C


; =============== S U B	R O U T	I N E =======================================


CheckIfChestOpened:				  ; DATA XREF: j_CheckIfChestOpenedt
		clr.w	d0
		move.b	ChestIndex(a1),d0
		move.b	d0,d1
		andi.b	#$07,d1
		lsr.b	#$03,d0
		lea	(g_ChestOpenFlags).l,a0
		btst	d1,(a0,d0.w)
		rts
; End of function CheckIfChestOpened

