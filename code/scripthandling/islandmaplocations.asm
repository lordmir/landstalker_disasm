
; =============== S U B	R O U T	I N E =======================================


GetIslandMapLocation:				  ; DATA XREF: sub_22F10t
		move.l	d1,-(sp)
		clr.w	d1
		lea	IslandMapLocations(pc),a2

loc_2951E:					  ; CODE XREF: GetIslandMapLocation+16j
		move.b	(a2)+,d1
		move.b	(a2)+,d6
		move.w	(a2)+,d7
		blt.s	loc_2952E
		cmp.w	(RmNum2).l,d7
		bne.s	loc_2951E

loc_2952E:					  ; CODE XREF: GetIslandMapLocation+Ej
		bsr.w	LoadUncompressedString
		move.l	(sp)+,d1
		rts
; End of function GetIslandMapLocation

; ---------------------------------------------------------------------------
