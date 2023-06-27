
; =============== S U B	R O U T	I N E =======================================


sub_85F2:					  ; CODE XREF: CheckForMenuOpen+132p
		move.b	d0,(byte_FF1152).l
		lea	PreUseItemTable(pc),a0

loc_85FC:					  ; CODE XREF: sub_85F2+1Ej
		move.b	0000000004(a0),d2
		cmpi.b	#$FF,d2
		beq.s	PrintNothingHappenedString
		andi.b	#$7F,d2
		cmp.b	d0,d2
		beq.s	loc_8612
		addq.l	#$06,a0
		bra.s	loc_85FC
; ---------------------------------------------------------------------------

loc_8612:					  ; CODE XREF: sub_85F2+1Aj
		jmp	(a0)
; ---------------------------------------------------------------------------

PrintNothingHappenedString:			  ; CODE XREF: sub_85F2+12j
						  ; ROM:ReturnFailurep
		move.w	#$0016,d0
		jsr	(j_PrintString).l
		rts
; End of function sub_85F2

