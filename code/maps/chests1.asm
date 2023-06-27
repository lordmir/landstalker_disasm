
; =============== S U B	R O U T	I N E =======================================


LookupChestContents:				  ; DATA XREF: j_LookupChestContentst
		move.w	(g_RmNum1).l,d0
		jsr	(j_GetOriginalRoomNum).l
		clr.w	d1
		move.b	RoomChestOffsets(pc,d0.w),d1
		add.b	(g_chestCount).l,d1
		lea	ChestContents(pc),a0
		move.b	(a0,d1.w),d0
		move.b	d0,$00000036(a1)	  ; ChestContents
		move.b	d1,$00000037(a1)	  ; ChestIdx
		addq.b	#$01,(g_chestCount).l
		rts
; End of function LookupChestContents

; ---------------------------------------------------------------------------
