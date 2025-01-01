
; =============== S U B	R O U T	I N E =======================================


DebugGetAllItems:				  ; DATA XREF: j_DebugGetAllItemst
		movem.l	d0-d1,-(sp)
		move.w	#$003F,d0

loc_2940C:					  ; CODE XREF: DebugGetAllItems:loc_29418j
		bsr.w	GetItemMaxQty
		beq.s	loc_29418
		moveq	#$00000009,d1
		bsr.w	SetItemQuantity

loc_29418:					  ; CODE XREF: DebugGetAllItems+Cj
		dbf	d0,loc_2940C
		movem.l	(sp)+,d0-d1
		rts
; End of function DebugGetAllItems


; =============== S U B	R O U T	I N E =======================================


SetFlagBit:					  ; CODE XREF: SetFlagBitOnTalking+10p
						  ; ROM:0002664Ap ...
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


; =============== S U B	R O U T	I N E =======================================


GetChrName:					  ; CODE XREF: HandleControlChars+A6p
		move.l	d1,-(sp)
		cmpi.w	#01000,d1
		blt.s	loc_29482
		subi.w	#01000,d1
		lea	SpecialCharacterNameTable(pc),a2
		bra.s	loc_29494
; ---------------------------------------------------------------------------

loc_29482:					  ; CODE XREF: GetChrName+6j
		cmpi.w	#NUM_CHAR_NAMES,d1
		blt.s	loc_29490
		clr.w	d1
		lea	DefaultName(pc),a2
		bra.s	loc_29494
; ---------------------------------------------------------------------------

loc_29490:					  ; CODE XREF: GetChrName+16j
		lea	CharacterNameTable(pc),a2

loc_29494:					  ; CODE XREF: GetChrName+10j
						  ; GetChrName+1Ej
		bsr.s	sub_294B6
		move.l	(sp)+,d1
		rts
; End of function GetChrName


; =============== S U B	R O U T	I N E =======================================


LoadUncompressedString:				  ; CODE XREF: HandleControlChars+96p
						  ; GetSaveLocationString:loc_294DEp ...
		move.l	d1,-(sp)
		cmpi.w	#$0040,d1
		bcc.s	loc_294A8
		lea	ItemNameTable(pc),a2
		bra.s	loc_294B0
; ---------------------------------------------------------------------------

loc_294A8:					  ; CODE XREF: LoadUncompressedString+6j
		subi.w	#$0040,d1
		lea	MenuStringTable(pc),a2

loc_294B0:					  ; CODE XREF: LoadUncompressedString+Cj
		bsr.s	sub_294B6
		move.l	(sp)+,d1
		rts
; End of function LoadUncompressedString


; =============== S U B	R O U T	I N E =======================================


sub_294B6:					  ; CODE XREF: GetChrName:loc_29494p
						  ; LoadUncompressedString:loc_294B0p
		move.l	d1,-(sp)
		clr.w	d7

loc_294BA:					  ; CODE XREF: sub_294B6+Cj
		move.b	(a2)+,d7
		subq.w	#$01,d1
		blt.s	loc_294C4
		adda.w	d7,a2
		bra.s	loc_294BA
; ---------------------------------------------------------------------------

loc_294C4:					  ; CODE XREF: sub_294B6+8j
		subq.w	#$01,d7
		move.l	(sp)+,d1
		rts
; End of function sub_294B6


; =============== S U B	R O U T	I N E =======================================


GetSaveLocationString:				  ; DATA XREF: j_GetSaveLocationStringt
		move.l	d1,-(sp)
		lea	SaveGameLocations(pc),a2

loc_294D0:					  ; CODE XREF: GetSaveLocationString+12j
		move.w	(a2)+,d1
		move.w	(a2)+,d7
		blt.s	loc_294DE
		cmp.w	(RmNum2).l,d7
		bne.s	loc_294D0

loc_294DE:					  ; CODE XREF: GetSaveLocationString+Aj
		bsr.w	LoadUncompressedString
		move.l	(sp)+,d1
		rts
; End of function GetSaveLocationString

; ---------------------------------------------------------------------------
