
; =============== S U B	R O U T	I N E =======================================


UpdateEquipPal:					  ; CODE XREF: j_UpdateEquipPalj
						  ; sub_7766+Cp ...
		lea	ArmourPalSwapIdx(pc),a0
		lea	((g_Pal2Base+$16)).l,a1
		lea	ArmourPalSwaps(pc),a2
		move.b	(g_EquippedArmour).l,d0
		bsr.s	UpdateEquipPalEntries
		lea	SwordPalSwapIdx(pc),a0
		lea	SwordPalSwaps(pc),a2
		move.b	(g_EquippedSword).l,d0
		bsr.s	UpdateEquipPalEntries
		rts
; End of function UpdateEquipPal


; =============== S U B	R O U T	I N E =======================================


UpdateEquipPalEntries:				  ; CODE XREF: UpdateEquipPal+14p
						  ; UpdateEquipPal+24p
		clr.w	d1

loc_78E0:					  ; CODE XREF: UpdateEquipPalEntries+Aj
		cmp.b	(a0),d0
		beq.s	loc_78EA
		addq.l	#$01,a0
		addq.w	#$04,d1
		bra.s	loc_78E0
; ---------------------------------------------------------------------------

loc_78EA:					  ; CODE XREF: UpdateEquipPalEntries+4j
		move.w	(a2,d1.w),(a1)+
		move.w	$00000002(a2,d1.w),(a1)+
		rts
; End of function UpdateEquipPalEntries

; ---------------------------------------------------------------------------
SwordPalSwapIdx:dc.b ITM_EKEEKE			  ; DATA XREF: UpdateEquipPal+16t
		dc.b ITM_MAGICSWORD
		dc.b ITM_THUNDERSWORD
		dc.b ITM_ICESWORD
		dc.b ITM_GAIASWORD
		dc.b ITM_FIREPROOF
ArmourPalSwapIdx:dc.b ITM_EKEEKE		  ; DATA XREF: UpdateEquipPalt
		dc.b ITM_STEELBREAST
		dc.b ITM_CHROMEBREAST
		dc.b ITM_SHELLBREAST
		dc.b ITM_HYPERBREAST
		dc.b ITM_EKEEKE
