
; =============== S U B	R O U T	I N E =======================================


DebugGetAllItems:				  ; DATA XREF: j_DebugGetAllItemst
		movem.l	d0-d1,-(sp)
		move.w	#$003F,d0

loc_2940C:					  ; CODE XREF: DebugGetAllItems:loc_29418j
		bsr.w	GetItemMaxQty
		beq.s	loc_29418
		moveq	#9,d1
		bsr.w	SetItemQuantity

loc_29418:					  ; CODE XREF: DebugGetAllItems+Cj
		dbf	d0,loc_2940C
		movem.l	(sp)+,d0-d1
		rts
; End of function DebugGetAllItems