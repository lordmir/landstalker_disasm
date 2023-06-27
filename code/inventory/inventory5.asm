
; =============== S U B	R O U T	I N E =======================================


sub_EA12:					  ; CODE XREF: sub_7718p
		movem.l	d0/a0,-(sp)
		move.w	(g_CurrentEquippedItems).l,d1
		lea	EquipInventoryLayout(pc),a0
		nop
		tst.w	d0
		beq.w	loc_EA34
		subq.w	#$01,d0

loc_EA2A:					  ; CODE XREF: sub_EA12+1Ej
		lsr.w	#$04,d1
		lea	$00000005(a0),a0
		dbf	d0,loc_EA2A

loc_EA34:					  ; CODE XREF: sub_EA12+12j
		andi.w	#$0007,d1
		move.b	(a0,d1.w),d1
		btst	#$07,d1
		beq.s	loc_EA44
		clr.b	d1

loc_EA44:					  ; CODE XREF: sub_EA12+2Ej
		movem.l	(sp)+,d0/a0
		rts
; End of function sub_EA12


; =============== S U B	R O U T	I N E =======================================


sub_EA4A:					  ; CODE XREF: sub_EC34p
		lea	((g_Buffer+$10)).l,a0
		move.w	(g_CurrentEquippedItems).l,d0
		move.b	#$07,d1
		move.b	#$05,d3
		move.w	#$0003,d7

loc_EA62:					  ; CODE XREF: sub_EA4A+28j
		move.b	d0,d2
		and.b	d1,d2
		cmp.b	d3,d2
		bcs.s	loc_EA6C
		clr.b	d2

loc_EA6C:					  ; CODE XREF: sub_EA4A+1Ej
		ext.w	d2
		move.w	d2,(a0)+
		lsr.w	#$04,d0
		dbf	d7,loc_EA62
		lea	(g_Buffer).l,a1
		lea	g_Buffer+$18-g_Buffer(a1),a0
		lea	$0000001A(a1),a1
		lea	(unk_FF1BF4).l,a2
		move.b	(a2),d0
		andi.w	#$0007,d0
		cmpi.w	#$0005,d0
		bcs.s	loc_EA98
		clr.w	d0

loc_EA98:					  ; CODE XREF: sub_EA4A+4Aj
		move.w	d0,(a0)
		move.b	(a2),d0
		lsr.b	#$03,d0
		andi.w	#$0003,d0
		move.w	d0,(a1)
		rts
; End of function sub_EA4A

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_EAD4

loc_EAA6:					  ; CODE XREF: sub_EAD4+54j
		lea	(g_Buffer).l,a1
		lea	g_Buffer+$18-g_Buffer(a1),a0
		lea	$0000001A(a1),a1
		lea	(unk_FF1BF4).l,a2
		move.w	(a1),d1
		lsl.b	#$03,d1
		andi.b	#$18,d1
		move.w	(a0),d0
		andi.b	#$07,d0
		or.b	d0,d1
		move.b	d1,(a2)
		bra.w	loc_D38A
; END OF FUNCTION CHUNK	FOR sub_EAD4
; ---------------------------------------------------------------------------
		bsr.w	sub_EC34

; =============== S U B	R O U T	I N E =======================================


sub_EAD4:					  ; CODE XREF: CheckForMenuOpen+A6p

; FUNCTION CHUNK AT 0000D38A SIZE 0000001E BYTES
; FUNCTION CHUNK AT 0000EAA6 SIZE 0000002A BYTES
; FUNCTION CHUNK AT 0000EE12 SIZE 00000072 BYTES

		tst.w	(DebugModeEnable).w
		bne.s	loc_EAF2
		jsr	(UpdateControllerInputs).l
		btst	#CTRL_START,(g_Controller1State).l
		beq.s	loc_EAF2

loc_EAEA:					  ; CODE XREF: sub_EAD4+1Cj
		jsr	(j_PlayEndCredits).l
		bra.s	loc_EAEA
; ---------------------------------------------------------------------------

loc_EAF2:					  ; CODE XREF: sub_EAD4+4j
						  ; sub_EAD4+14j ...
		bsr.w	sub_ECF4
		bsr.w	sub_EC60
		bsr.w	sub_EDA6
		bsr.w	sub_D96A

loc_EB02:					  ; CODE XREF: sub_EAD4:loc_EB7Aj
						  ; sub_EAD4:loc_EB86j	...
		move.w	(unk_FF0F9C).l,d0
		lea	(g_Buffer).l,a0
		move.w	d0,g_Buffer+4-g_Buffer(a0)
		move.w	d0,$00000002(a0)

loc_EB16:					  ; CODE XREF: sub_EAD4+9Cj
		moveq	#$00000006,d0
		bsr.w	sub_D88A
		move.b	(g_Controller1State).l,d1
		move.b	d1,d0
		andi.b	#CTRLBF_BSTART,d0	  ; START or B
		bne.w	loc_EAA6
		move.b	d1,d0
		andi.b	#CTRLBF_AC,d0		  ; A or C
		bne.w	loc_EE12
		lea	(g_Buffer).l,a1
		lea	g_Buffer+$18-g_Buffer(a1),a0
		lea	$0000001A(a1),a1
		move.b	d1,d0
		btst	#CTRL_UP,d0
		bne.w	loc_EB72
		btst	#CTRL_DOWN,d0
		bne.w	loc_EB7C
		btst	#CTRL_LEFT,d0
		bne.w	loc_EB8A
		btst	#CTRL_RIGHT,d0
		bne.w	loc_EB96
		bsr.w	sub_EDC4
		clr.b	d2
		bsr.w	sub_EDAA
		bra.s	loc_EB16
; ---------------------------------------------------------------------------

loc_EB72:					  ; CODE XREF: sub_EAD4+76j
		move.w	(a1),d0
		beq.s	loc_EB7A
		bsr.w	sub_EBA4

loc_EB7A:					  ; CODE XREF: sub_EAD4+A0j
		bra.s	loc_EB02
; ---------------------------------------------------------------------------

loc_EB7C:					  ; CODE XREF: sub_EAD4+7Ej
		cmpi.w	#$0003,(a1)
		beq.s	loc_EB86
		bsr.w	sub_EBBE

loc_EB86:					  ; CODE XREF: sub_EAD4+ACj
		bra.w	loc_EB02
; ---------------------------------------------------------------------------

loc_EB8A:					  ; CODE XREF: sub_EAD4+86j
		tst.w	(a0)
		beq.s	loc_EB92
		bsr.w	sub_EBD6

loc_EB92:					  ; CODE XREF: sub_EAD4+B8j
		bra.w	loc_EB02
; ---------------------------------------------------------------------------

loc_EB96:					  ; CODE XREF: sub_EAD4+8Ej
		cmpi.w	#$0004,(a0)
		beq.s	loc_EBA0
		bsr.w	sub_EBEE

loc_EBA0:					  ; CODE XREF: sub_EAD4+C6j
		bra.w	loc_EB02
; End of function sub_EAD4


; =============== S U B	R O U T	I N E =======================================


sub_EBA4:					  ; CODE XREF: sub_EAD4+A2p
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_CursorMove
; ---------------------------------------------------------------------------
		bsr.w	sub_EDC4
		subq.w	#$01,(a1)
		moveq	#$00000007,d7

loc_EBB0:					  ; CODE XREF: sub_EBA4+14j
		subq.w	#$04,d1
		moveq	#$FFFFFFFF,d2
		bsr.w	sub_EDAA
		dbf	d7,loc_EBB0
		rts
; End of function sub_EBA4


; =============== S U B	R O U T	I N E =======================================


sub_EBBE:					  ; CODE XREF: sub_EAD4+AEp
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_CursorMove
; ---------------------------------------------------------------------------
		bsr.w	sub_EDC4
		addq.w	#$01,(a1)
		moveq	#$00000007,d7

loc_EBCA:					  ; CODE XREF: sub_EBBE+12j
		addq.w	#$04,d1
		bsr.w	sub_EDAA
		dbf	d7,loc_EBCA
		rts
; End of function sub_EBBE


; =============== S U B	R O U T	I N E =======================================


sub_EBD6:					  ; CODE XREF: sub_EAD4+BAp
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_CursorMove
; ---------------------------------------------------------------------------
		bsr.w	sub_EDC4
		subq.w	#$01,(a0)
		moveq	#$00000007,d7

loc_EBE2:					  ; CODE XREF: sub_EBD6+12j
		subq.w	#$05,d0
		bsr.w	sub_EDAA
		dbf	d7,loc_EBE2
		rts
; End of function sub_EBD6


; =============== S U B	R O U T	I N E =======================================


sub_EBEE:					  ; CODE XREF: sub_EAD4+C8p
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_CursorMove
; ---------------------------------------------------------------------------
		bsr.w	sub_EDC4
		addq.w	#$01,(a0)
		moveq	#$00000007,d7

loc_EBFA:					  ; CODE XREF: sub_EBEE+12j
		addq.w	#$05,d0
		bsr.w	sub_EDAA
		dbf	d7,loc_EBFA
		rts
; End of function sub_EBEE


; =============== S U B	R O U T	I N E =======================================


InitEquipGreyedOutPal:				  ; CODE XREF: sub_EC34+4p
		lea	(g_Pal1Base).l,a0
		lea	(g_Pal2Base).l,a1
		moveq	#$0000000F,d7

loc_EC14:					  ; CODE XREF: InitEquipGreyedOutPal+22j
		move.b	(a0)+,d0		  ; Only keep blue component, and darken
		subq.b	#$02,d0
		bpl.s	loc_EC1C
		clr.b	d0

loc_EC1C:					  ; CODE XREF: InitEquipGreyedOutPal+12j
		move.b	d0,(a1)+
		move.b	(a0)+,d0
		lsr.b	#$03,d0
		andi.b	#$22,d0
		move.b	d0,(a1)+
		dbf	d7,loc_EC14		  ; Only keep blue component, and darken
		jsr	(CopyBasePalleteToActivePalette).l
		rts
; End of function InitEquipGreyedOutPal


; =============== S U B	R O U T	I N E =======================================


sub_EC34:					  ; CODE XREF: ROM:0000EAD0p
						  ; DATA XREF: sub_39Et
		bsr.w	sub_EA4A
		bsr.s	InitEquipGreyedOutPal
		lea	(g_Buffer).l,a1
		lea	g_Buffer+$84-g_Buffer(a1),a0
		move.w	#$A000,d0
		ori.w	#$0000,d0
		move.w	#$0B63,d7

loc_EC50:					  ; CODE XREF: sub_EC34+1Ej
		move.w	d0,(a0)+
		dbf	d7,loc_EC50
		bsr.w	sub_ECF4
		bsr.w	sub_EC60
		rts
; End of function sub_EC34


; =============== S U B	R O U T	I N E =======================================


sub_EC60:					  ; CODE XREF: sub_EAD4+22p
						  ; sub_EC34+26p
		moveq	#$00000001,d1
		moveq	#$00000003,d7
		lea	EquipInventoryLayout(pc),a3
		lea	((g_Buffer+$10)).l,a4

loc_EC6E:					  ; CODE XREF: sub_EC60+2Cj
		movem.w	d1/d7,-(sp)
		moveq	#$0000000A,d0
		bsr.w	sub_D86C
		moveq	#$00000004,d6
		move.w	(a4)+,d2

loc_EC7C:					  ; CODE XREF: sub_EC60+22j
		move.b	(a3)+,d0
		bsr.w	sub_ECA6
		dbf	d6,loc_EC7C
		movem.w	(sp)+,d1/d7
		addq.w	#$04,d1
		dbf	d7,loc_EC6E
		bsr.w	sub_D828
		bsr.w	sub_EDC4
		moveq	#$00000001,d2
		bsr.w	sub_EDAA
		jsr	(j_EnableDMAQueueProcessing).l
		rts
; End of function sub_EC60


; =============== S U B	R O U T	I N E =======================================


sub_ECA6:					  ; CODE XREF: sub_EC60+1Ep
		tst.b	d0
		bmi.s	loc_ECB6
		move.l	d2,-(sp)
		jsr	(j_GetItemQtyAndMaxQty).l
		move.l	(sp)+,d2
		bra.s	loc_ECBC
; ---------------------------------------------------------------------------

loc_ECB6:					  ; CODE XREF: sub_ECA6+2j
		andi.b	#$7F,d0
		moveq	#$00000001,d1

loc_ECBC:					  ; CODE XREF: sub_ECA6+Ej
		tst.w	d1
		bmi.s	loc_ECDA
		moveq	#$00000004,d7
		sub.w	d6,d7
		cmp.w	d2,d7
		bne.s	loc_ECCC
		clr.b	d1
		bra.s	loc_ECCE
; ---------------------------------------------------------------------------

loc_ECCC:					  ; CODE XREF: sub_ECA6+20j
		moveq	#$00000001,d1

loc_ECCE:					  ; CODE XREF: sub_ECA6+24j
		movem.l	a0,-(sp)
		bsr.w	sub_D642
		movem.l	(sp)+,a0

loc_ECDA:					  ; CODE XREF: sub_ECA6+18j
		lea	$0000000A(a0),a0
		rts
; End of function sub_ECA6

; ---------------------------------------------------------------------------
