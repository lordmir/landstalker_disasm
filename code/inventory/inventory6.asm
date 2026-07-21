
; =============== S U B	R O U T	I N E =======================================


GetInvEquipLayout:				  ; CODE XREF: sub_EAD4:loc_EAF2p
						  ; sub_EC34+22p
		lea	(g_Buffer).l,a0
		lea	0000000006(a0),a0
		clr.w	(a0)
	if	REGION=JP
		move.w  #3,d1
	elseif	((REGION=FR)!(REGION=DE))
		moveq	#1,d1
	else
		moveq	#$2,d1
	endif
		lea	EquipInventoryLayout(pc),a3
		lea	(g_Buffer).l,a4
		move.w	#$0003,d7

loc_ED10:					  ; CODE XREF: GetInvEquipLayout+56j
		move.w	#$0001,d0
		movem.w	d1/d7,-(sp)
		bsr.w	sub_D86C
	if ((REGION=FR)!(REGION=DE))
		move.w	#9,d7
	else
		move.w	#8,d7
	endif
		bsr.w	sub_ED50
		move.w	$00000010(a4),d0
		andi.l	#$00000007,d0
		move.b	(a3,d0.w),d0
		andi.b	#$7F,d0
		clr.b	d1
		bsr.w	sub_D5E4
		movem.w	(sp)+,d1/d7
		addq.w	#$04,d1
		lea	$00000005(a3),a3
		lea	$00000002(a4),a4
		dbf	d7,loc_ED10
		rts
; End of function GetInvEquipLayout


; =============== S U B	R O U T	I N E =======================================


sub_ED50:					  ; CODE XREF: GetInvEquipLayout+2Cp
		subq.w	#$01,d7
		movem.l	a0,-(sp)
	if ((REGION=FR)!(REGION=DE))
		move.w	#3,d5
	else
		move.w	#1,d5
	endif

loc_ED5A:					  ; CODE XREF: sub_ED50+1Ej
		move.w	d7,d6
		movea.l	a0,a1

loc_ED5E:					  ; CODE XREF: sub_ED50+14j
	if ~(REGION=JP)
		move.w	#$0014,d0
	endif
		move.w	d0,(a0)+
		dbf	d6,loc_ED5E
		movea.l	a1,a0
	if REGION=JP
		lea		-$00000048(a0),a0
	else
		lea	$00000048(a0),a0
	endif
		dbf	d5,loc_ED5A
		movem.l	(sp)+,a0
		rts
; End of function sub_ED50

; ---------------------------------------------------------------------------
		movem.w	d2,-(sp)
		clr.l	d1
		move.b	#$64,d2
		bsr.w	sub_ED96
		move.b	#$0A,d2
		bsr.w	sub_ED96
		or.b	d0,d1
		movem.w	(sp)+,d2
		rts

; =============== S U B	R O U T	I N E =======================================


sub_ED96:					  ; CODE XREF: ROM:0000ED82p
						  ; ROM:0000ED8Ap ...
		sub.b	d2,d0
		bcs.w	loc_EDA0
		addq.b	#$01,d1
		bra.s	sub_ED96
; ---------------------------------------------------------------------------

loc_EDA0:					  ; CODE XREF: sub_ED96+2j
		add.b	d2,d0
		lsl.l	#$08,d1
		rts
; End of function sub_ED96


; =============== S U B	R O U T	I N E =======================================


sub_EDA6:					  ; CODE XREF: sub_EAD4+26p
		bsr.w	sub_EDC4
; End of function sub_EDA6


; =============== S U B	R O U T	I N E =======================================


sub_EDAA:					  ; CODE XREF: sub_EAD4+98p
						  ; sub_EBA4+10p ...
		move.l	d2,-(sp)
		bsr.w	sub_D902
		moveq	#$FFFFFFFF,d2
		move.w	d2,$00000008(a0)
		move.w	d2,$00000010(a0)
		jsr	(FlushDMACopyQueue).l
		move.l	(sp)+,d2
		rts
; End of function sub_EDAA


; =============== S U B	R O U T	I N E =======================================


sub_EDC4:					  ; CODE XREF: sub_EAD4+92p
						  ; sub_EBA4+4p ...
		lea	((g_Buffer+$18)).l,a0
		lea	((g_Buffer+$1A)).l,a1
		move.w	(a0),d0
		move.w	(a1),d1
		mulu.w	#$0028,d0
		addi.w	#$00E0,d0
		mulu.w	#$0020,d1
		addi.w	#$00A8,d1
		moveq	#$FFFFFFFF,d2
		rts
; End of function sub_EDC4

; ---------------------------------------------------------------------------
		move.w	#$A000,d0

loc_EDEC:					  ; CODE XREF: ROM:loc_EE0Cj
		move.b	(a1)+,d0
		cmpi.b	#$7B,d0
		bne.s	loc_EDFC
		move.w	d0,-$00000048(a0)
		bra.w	loc_EE0C
; ---------------------------------------------------------------------------

loc_EDFC:					  ; CODE XREF: ROM:0000EDF2j
		cmpi.b	#$7C,d0
		bne.s	loc_EE0A
		move.w	d0,-$00000048(a0)
		bra.w	loc_EE0C
; ---------------------------------------------------------------------------

loc_EE0A:					  ; CODE XREF: ROM:0000EE00j
		move.w	d0,(a0)+

loc_EE0C:					  ; CODE XREF: ROM:0000EDF8j
						  ; ROM:0000EE06j
		dbf	d7,loc_EDEC
		rts
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_EAD4

loc_EE12:					  ; CODE XREF: sub_EAD4+5Ej
		lea	(g_Buffer).l,a1
		lea	$00000018(a1),a0
		lea	$0000001A(a1),a1
		lea	EquipInventoryLayout(pc),a2
		move.w	(a0),d0
		move.w	(a1),d1
		mulu.w	#$0005,d1
		add.w	d1,d0
		move.b	(a2,d0.w),d0
		tst.b	d0
		bmi.w	loc_EE44
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	loc_EE80

loc_EE44:					  ; CODE XREF: sub_EAD4+360j
		move.w	(a1),d1
		add.w	d1,d1
		lea	(g_Buffer).l,a2
		lea	$00000010(a2,d1.w),a2
		move.w	(a0),(a2)
		lea	((g_Buffer+$10)).l,a0
		clr.w	d0
		move.b	#$07,d1
		move.w	#$0003,d7

loc_EE64:					  ; CODE XREF: sub_EAD4+398j
		move.w	(a0)+,d2
		and.b	d1,d2
		or.b	d2,d0
		ror.w	#$04,d0
		dbf	d7,loc_EE64
		lea	(g_CurrentEquippedItems).l,a0
		move.w	d0,(a0)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_CursorSelect
; ---------------------------------------------------------------------------
		bra.w	loc_EAF2
; ---------------------------------------------------------------------------

loc_EE80:					  ; CODE XREF: sub_EAD4+36Cj
		bra.w	loc_EAF2
; END OF FUNCTION CHUNK	FOR sub_EAD4
; ---------------------------------------------------------------------------
