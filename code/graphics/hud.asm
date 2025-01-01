
; =============== S U B	R O U T	I N E =======================================


RefreshAllHUD:					  ; DATA XREF: j_RefreshAllHUDt
		bsr.w	RefreshCurrentHealthHUD
		bsr.w	RefreshMaxHealthHUD
		bsr.w	RefreshGoldHUD
		bsr.w	RefreshSwordChargeHUD
		bsr.w	UpdateEkeEkeHUD
; End of function RefreshAllHUD


; =============== S U B	R O U T	I N E =======================================


MarkHUDForUpdate:				  ; CODE XREF: ROM:00012C4Ap
						  ; ROM:00012DECp ...
		bset	#$07,(g_UpdateHUDFlag).l
		rts
; End of function MarkHUDForUpdate


; =============== S U B	R O U T	I N E =======================================


RefreshCurrentHealthHUD:			  ; CODE XREF: ROM:00012C46p
						  ; ROM:00012DE8p ...
		movem.l	d0-d3/d7-a1,-(sp)
		bsr.w	UpdateCurrentHealthHUD
		bsr.w	UpdateHeartHUD
		movem.l	(sp)+,d0-d3/d7-a1
		rts
; End of function RefreshCurrentHealthHUD


; =============== S U B	R O U T	I N E =======================================


RefreshHUD:					  ; CODE XREF: ROM:00012DF0p
						  ; ROM:00012E7Ep ...
		bclr	#$07,(g_UpdateHUDFlag).l
		beq.s	locret_1694A
		jsr	(j_QueueHUDTilemapDMA).l

locret_1694A:					  ; CODE XREF: RefreshHUD+8j
		rts
; End of function RefreshHUD


; =============== S U B	R O U T	I N E =======================================


sub_1694C:					  ; CODE XREF: UpdateHUDDigits+2p
		ext.w	d0
		move.w	#$66BC,d1
		move.w	#$66BA,d2
		tst.b	d0
		beq.s	locret_16966
		move.w	#$66BF,d1
		add.w	d0,d1
		move.w	#$0010,d2
		add.w	d1,d2

locret_16966:					  ; CODE XREF: sub_1694C+Cj
		rts
; End of function sub_1694C


; =============== S U B	R O U T	I N E =======================================


RefreshMaxHealthHUD:				  ; CODE XREF: RefreshAllHUD+4p
						  ; AddToMaxHealth+4p
						  ; DATA XREF: ...
		movem.l	d0-d3/d7-a1,-(sp)
		bsr.s	UpdateMaxHealthHUD
		bsr.w	UpdateHeartHUD
		movem.l	(sp)+,d0-d3/d7-a1
		rts
; End of function RefreshMaxHealthHUD


; =============== S U B	R O U T	I N E =======================================


UpdateMaxHealthHUD:				  ; CODE XREF: RefreshMaxHealthHUD+4p
		moveq	#$00000000,d7
		move.w	(Player_MaxHealth).l,d7
		beq.s	loc_16986
		addi.w	#$0100,d7

loc_16986:					  ; CODE XREF: UpdateMaxHealthHUD+8j
		lsr.w	#$08,d7
		jsr	(j_ConvertToBase10).l
		lea	(unk_FF0F99).l,a0
		lea	((g_HUD_Row2+$34)).l,a1
		tst.b	(a0)+
		beq.s	loc_169A8
		move.b	#$0A,(a0)
		move.b	#$0A,$00000001(a0)

loc_169A8:					  ; CODE XREF: UpdateMaxHealthHUD+24j
		bsr.w	UpdateHUDDigits
		bsr.w	UpdateHUDDigits
		rts
; End of function UpdateMaxHealthHUD


; =============== S U B	R O U T	I N E =======================================


UpdateCurrentHealthHUD:				  ; CODE XREF: RefreshCurrentHealthHUD+4p
		moveq	#$00000000,d7
		move.w	(Player_CurrentHealth).l,d7
		beq.s	loc_169C0
		addi.w	#$0100,d7

loc_169C0:					  ; CODE XREF: UpdateCurrentHealthHUD+8j
		lsr.w	#$08,d7
		jsr	(j_ConvertToBase10).l
		lea	(unk_FF0F99).l,a0
		lea	((g_HUD_Row2+$2E)).l,a1
		tst.b	(a0)+
		beq.s	loc_169E2
		move.b	#$0A,(a0)
		move.b	#$0A,$00000001(a0)

loc_169E2:					  ; CODE XREF: UpdateCurrentHealthHUD+24j
		bsr.w	UpdateHUDDigits
		bsr.w	UpdateHUDDigits
		rts
; End of function UpdateCurrentHealthHUD


; =============== S U B	R O U T	I N E =======================================


UpdateHeartHUD:					  ; CODE XREF: RefreshCurrentHealthHUD+8p
						  ; RefreshMaxHealthHUD+6p
		bsr.s	InitHeartHUD
		bsr.s	UpdateBigHeartHUD
		bsr.s	UpdateMediumHeartHUD
		bsr.w	UpdateSmallHeartHUD
		rts
; End of function UpdateHeartHUD


; =============== S U B	R O U T	I N E =======================================


InitHeartHUD:					  ; CODE XREF: UpdateHeartHUDp
		move.w	(Player_CurrentHealth).l,d2
		beq.s	loc_16A04
		addi.w	#$0100,d2

loc_16A04:					  ; CODE XREF: InitHeartHUD+6j
		lsr.w	#$08,d2
		move.w	(Player_MaxHealth).l,d3
		beq.s	loc_16A12
		addi.w	#$0100,d3

loc_16A12:					  ; CODE XREF: InitHeartHUD+14j
		lsr.w	#$08,d3
		lea	((g_HUD_Row2+$16)).l,a0
		move.w	#$000B,d7

loc_16A1E:					  ; CODE XREF: InitHeartHUD+30j
		move.w	#$66BA,$00000080(a0)
		move.w	#$66BC,(a0)+
		dbf	d7,loc_16A1E
		rts
; End of function InitHeartHUD


; =============== S U B	R O U T	I N E =======================================


UpdateBigHeartHUD:				  ; CODE XREF: UpdateHeartHUD+2p
		lea	((g_HUD_Row2+$16)).l,a0
		move.w	#$66E3,d0
		cmpi.b	#$33,d2
		bcc.s	loc_16A48
		move.w	#$66E2,d0
		cmpi.b	#$33,d3
		bcs.s	locret_16A64

loc_16A48:					  ; CODE XREF: UpdateBigHeartHUD+Ej
		move.w	d0,d1
		move.w	d0,(a0)
		ori.w	#$0800,d0
		move.w	d0,$00000002(a0)
		addi.w	#$0010,d1
		move.w	d1,$00000080(a0)
		ori.w	#$0800,d1
		move.w	d1,$00000082(a0)

locret_16A64:					  ; CODE XREF: UpdateBigHeartHUD+18j
		rts
; End of function UpdateBigHeartHUD


; =============== S U B	R O U T	I N E =======================================


UpdateMediumHeartHUD:				  ; CODE XREF: UpdateHeartHUD+4p
		lea	((g_HUD_Row2+$24)).l,a0
		cmpi.b	#$33,d2
		bcs.s	loc_16A76
		subi.b	#$32,d2

loc_16A76:					  ; CODE XREF: UpdateMediumHeartHUD+Aj
		cmpi.b	#$0B,d2
		bcc.s	loc_16AC4
		cmpi.b	#$0B,d3
		bcs.w	locret_16B2C
		move.w	#$66E0,d0
		bsr.w	sub_16B22
		move.w	#$66CB,d0
		cmpi.b	#$15,d3
		bcs.s	loc_16AC2
		move.w	#$66CD,d0

loc_16A9A:					  ; CODE XREF: UpdateMediumHeartHUD+78j
		bsr.w	sub_16B22
		move.w	#$66CB,d0
		cmpi.b	#$1F,d3
		bcs.s	loc_16AC2
		move.w	#$66CD,d0

loc_16AAC:					  ; CODE XREF: UpdateMediumHeartHUD+94j
		bsr.s	sub_16B22
		move.w	#$66CB,d0
		cmpi.b	#$29,d3
		bcs.s	loc_16AC2
		move.w	#$66CD,d0

loc_16ABC:					  ; CODE XREF: UpdateMediumHeartHUD+B0j
		bsr.s	sub_16B22
		move.w	#$66CB,d0

loc_16AC2:					  ; CODE XREF: UpdateMediumHeartHUD+2Ej
						  ; UpdateMediumHeartHUD+40j ...
		bra.s	sub_16B22
; ---------------------------------------------------------------------------

loc_16AC4:					  ; CODE XREF: UpdateMediumHeartHUD+14j
		move.w	#$66E1,d0
		bsr.s	sub_16B22
		cmpi.b	#$15,d2
		bcc.s	loc_16AE0
		move.w	#$66CC,d0
		cmpi.b	#$15,d3
		bcs.s	sub_16B22
		move.w	#$66CF,d0
		bra.s	loc_16A9A
; ---------------------------------------------------------------------------

loc_16AE0:					  ; CODE XREF: UpdateMediumHeartHUD+68j
		move.w	#$66CE,d0
		bsr.s	sub_16B22
		cmpi.b	#$1F,d2
		bcc.s	loc_16AFC
		move.w	#$66CC,d0
		cmpi.b	#$1F,d3
		bcs.s	sub_16B22
		move.w	#$66CF,d0
		bra.s	loc_16AAC
; ---------------------------------------------------------------------------

loc_16AFC:					  ; CODE XREF: UpdateMediumHeartHUD+84j
		move.w	#$66CE,d0
		bsr.s	sub_16B22
		cmpi.b	#$29,d2
		bcc.s	loc_16B18
		move.w	#$66CC,d0
		cmpi.b	#$29,d3
		bcs.s	sub_16B22
		move.w	#$66CF,d0
		bra.s	loc_16ABC
; ---------------------------------------------------------------------------

loc_16B18:					  ; CODE XREF: UpdateMediumHeartHUD+A0j
		move.w	#$66CE,d0
		bsr.s	sub_16B22
		move.w	#$66CC,d0
; End of function UpdateMediumHeartHUD


; =============== S U B	R O U T	I N E =======================================


sub_16B22:					  ; CODE XREF: UpdateMediumHeartHUD+22p
						  ; UpdateMediumHeartHUD:loc_16A9Ap ...
		move.w	d0,-(a0)
		addi.w	#$0010,d0
		move.w	d0,$00000080(a0)

locret_16B2C:					  ; CODE XREF: UpdateMediumHeartHUD+1Aj
		rts
; End of function sub_16B22


; =============== S U B	R O U T	I N E =======================================


UpdateSmallHeartHUD:				  ; CODE XREF: UpdateHeartHUD+6p
		clr.w	d0
		move.b	d3,d0
		cmpi.b	#$0A,d0
		bls.s	loc_16B3C
		move.b	#$0A,d0

loc_16B3C:					  ; CODE XREF: UpdateSmallHeartHUD+8j
		mulu.w	#$000A,d0
		lea	loc_16BCE(pc),a1
		lea	((g_HUD_Row2+$24)).l,a0
		moveq	#$00000004,d7
		bsr.w	sub_16CDE
		lea	((g_HUD_Row3+$24)).l,a0
		moveq	#$00000004,d7
		bsr.w	sub_16CDE
		clr.w	d0
		move.b	d2,d0
		beq.s	locret_16BBC
		divu.w	#$000A,d0
		swap	d0
		tst.w	d0
		bne.s	loc_16B70
		move.b	#$0A,d0

loc_16B70:					  ; CODE XREF: UpdateSmallHeartHUD+3Cj
		mulu.w	#$000A,d0
		lea	loc_16BCE(pc),a1
		lea	((g_HUD_Row2+$24)).l,a0
		moveq	#$00000004,d7
		bsr.s	sub_16B8E
		lea	((g_HUD_Row3+$24)).l,a0
		moveq	#$00000004,d7
		bsr.s	sub_16BBE
		rts
; End of function UpdateSmallHeartHUD


; =============== S U B	R O U T	I N E =======================================


sub_16B8E:					  ; CODE XREF: UpdateSmallHeartHUD+52p
						  ; sub_16B8E+24j
		clr.w	d1
		move.b	(a1,d0.w),d1
		cmpi.b	#$0A,d1
		bcs.s	loc_16BB8
		cmpi.b	#$30,d1
		bne.s	loc_16BAA
		cmpi.w	#$66E8,$00000080(a0)
		bne.s	loc_16BAA
		addq.b	#$02,d1

loc_16BAA:					  ; CODE XREF: sub_16B8E+10j
						  ; sub_16B8E+18j
		addi.w	#$66B5,d1
		move.w	d1,(a0)+
		addq.w	#$01,d0
		dbf	d7,sub_16B8E
		rts
; ---------------------------------------------------------------------------

loc_16BB8:					  ; CODE XREF: sub_16B8E+Aj
						  ; sub_16BBE+Aj
		movem.l	(sp)+,d0

locret_16BBC:					  ; CODE XREF: UpdateSmallHeartHUD+32j
		rts
; End of function sub_16B8E


; =============== S U B	R O U T	I N E =======================================


sub_16BBE:					  ; CODE XREF: UpdateSmallHeartHUD+5Cp
						  ; sub_16BBE+14j
		clr.w	d1
		move.b	(a1,d0.w),d1
		cmpi.b	#$0A,d1
		bcs.s	loc_16BB8
		addi.w	#$66B5,d1

loc_16BCE:					  ; DATA XREF: UpdateSmallHeartHUD+12t
						  ; UpdateSmallHeartHUD+46t
		move.w	d1,(a0)+
		addq.w	#$01,d0
		dbf	d7,sub_16BBE
		rts
; End of function sub_16BBE

; ---------------------------------------------------------------------------
SmallHeartTiles:dc.b $30,$08,$08,$08,$08,$06,$06,$06,$06,$06
		dc.b $30,$30,$08,$08,$08,$06,$06,$06,$06,$06
		dc.b $30,$30,$30,$08,$08,$06,$06,$06,$06,$06
		dc.b $30,$30,$30,$30,$08,$06,$06,$06,$06,$06
		dc.b $30,$30,$30,$30,$30,$06,$06,$06,$06,$06
		dc.b $32,$30,$30,$30,$30,$34,$06,$06,$06,$06
		dc.b $32,$32,$30,$30,$30,$34,$34,$06,$06,$06
		dc.b $32,$32,$32,$30,$30,$34,$34,$34,$06,$06
		dc.b $32,$32,$32,$32,$30,$34,$34,$34,$34,$06
		dc.b $32,$32,$32,$32,$32,$34,$34,$34,$34,$34

; =============== S U B	R O U T	I N E =======================================


UpdateEkeEkeHUD:				  ; CODE XREF: LoadPlayerSpecialAnimation+194p
						  ; RefreshAllHUD+10p ...
		moveq	#$00000000,d7
		move.b	#ITM_EKEEKE,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		move.b	d1,d7
		bpl.s	loc_16C4E
		moveq	#$00000000,d7

loc_16C4E:					  ; CODE XREF: UpdateEkeEkeHUD+Ej
		jsr	(j_ConvertToBase10).l
		lea	(unk_FF0F9A).l,a0
		lea	((g_HUD_Row2+$3E)).l,a1
		tst.b	(a0)+
		beq.s	loc_16C68
		move.b	#$0A,(a0)

loc_16C68:					  ; CODE XREF: UpdateEkeEkeHUD+26j
		bsr.w	UpdateHUDDigits
		rts
; End of function UpdateEkeEkeHUD


; =============== S U B	R O U T	I N E =======================================


RefreshGoldHUD:					  ; CODE XREF: RefreshAllHUD+8p
						  ; AddGold:loc_177ECp	...
		movem.l	d0-d2/d7-a1,-(sp)
		moveq	#$00000000,d7
		move.w	(g_Gold).l,d7
		jsr	(j_ConvertToBase10).l
		lea	(unk_FF0F97).l,a0
		lea	((g_HUD_Row2+$42)).l,a1
		tst.b	(a0)+
		beq.s	loc_16CA6
		move.b	#$0A,(a0)
		move.b	#$0A,$00000001(a0)
		move.b	#$0A,$00000002(a0)
		move.b	#$0A,$00000003(a0)

loc_16CA6:					  ; CODE XREF: RefreshGoldHUD+20j
		bsr.s	UpdateHUDDigits
		bsr.s	UpdateHUDDigits
		bsr.s	UpdateHUDDigits
		bsr.s	UpdateHUDDigits
		bsr.w	MarkHUDForUpdate
		movem.l	(sp)+,d0-d2/d7-a1
		rts
; End of function RefreshGoldHUD


; =============== S U B	R O U T	I N E =======================================


UpdateHUDDigits:				  ; CODE XREF: UpdateMaxHealthHUD:loc_169A8p
						  ; UpdateMaxHealthHUD+34p ...
		move.b	(a0)+,d0
		bsr.w	sub_1694C
		move.w	d2,$00000080(a1)
		move.w	d1,(a1)+
		rts
; End of function UpdateHUDDigits


; =============== S U B	R O U T	I N E =======================================


RefreshSwordChargeHUD:				  ; CODE XREF: RefreshAllHUD+Cp
						  ; IncrementSwordCharge:loc_178AEp ...
		clr.w	d0
		move.b	(g_SwordCharge_0).l,d0
		mulu.w	#$0007,d0
		moveq	#$00000006,d7
		lea	((g_HUD_Row2+8)).l,a0
		lea	SwordChargeTiles(pc),a1
; End of function RefreshSwordChargeHUD


; =============== S U B	R O U T	I N E =======================================


sub_16CDE:					  ; CODE XREF: UpdateSmallHeartHUD+1Ep
						  ; UpdateSmallHeartHUD+2Ap ...
		clr.w	d1
		move.b	(a1,d0.w),d1
		addi.w	#$66B4,d1
		move.w	d1,(a0)+
		addq.w	#$01,d0
		dbf	d7,sub_16CDE
		bra.w	MarkHUDForUpdate
; End of function sub_16CDE

; ---------------------------------------------------------------------------
SwordChargeTiles:dc.b $40,$40,$40,$40,$40,$40,$36 ; DATA XREF: RefreshSwordChargeHUD+14t
		dc.b $41,$40,$40,$40,$40,$40,$36
		dc.b $42,$40,$40,$40,$40,$40,$36
		dc.b $43,$40,$40,$40,$40,$40,$36
		dc.b $44,$40,$40,$40,$40,$40,$36
		dc.b $45,$40,$40,$40,$40,$40,$36
		dc.b $46,$40,$40,$40,$40,$40,$36
		dc.b $47,$40,$40,$40,$40,$40,$36
		dc.b $48,$40,$40,$40,$40,$40,$36
		dc.b $49,$41,$40,$40,$40,$40,$36
		dc.b $49,$42,$40,$40,$40,$40,$36
		dc.b $49,$43,$40,$40,$40,$40,$36
		dc.b $49,$44,$40,$40,$40,$40,$36
		dc.b $49,$45,$40,$40,$40,$40,$36
		dc.b $49,$46,$40,$40,$40,$40,$36
		dc.b $49,$47,$40,$40,$40,$40,$36
		dc.b $49,$48,$40,$40,$40,$40,$36
		dc.b $49,$49,$41,$40,$40,$40,$36
		dc.b $49,$49,$42,$40,$40,$40,$36
		dc.b $49,$49,$43,$40,$40,$40,$36
		dc.b $49,$49,$44,$40,$40,$40,$36
		dc.b $49,$49,$45,$40,$40,$40,$36
		dc.b $49,$49,$46,$40,$40,$40,$36
		dc.b $49,$49,$47,$40,$40,$40,$36
		dc.b $49,$49,$48,$40,$40,$40,$36
		dc.b $49,$49,$49,$41,$40,$40,$36
		dc.b $49,$49,$49,$42,$40,$40,$36
		dc.b $49,$49,$49,$43,$40,$40,$36
		dc.b $49,$49,$49,$44,$40,$40,$36
		dc.b $49,$49,$49,$45,$40,$40,$36
		dc.b $49,$49,$49,$46,$40,$40,$36
		dc.b $49,$49,$49,$47,$40,$40,$36
		dc.b $49,$49,$49,$48,$40,$40,$36
		dc.b $49,$49,$49,$49,$41,$40,$36
		dc.b $49,$49,$49,$49,$42,$40,$36
		dc.b $49,$49,$49,$49,$43,$40,$36
		dc.b $49,$49,$49,$49,$44,$40,$36
		dc.b $49,$49,$49,$49,$45,$40,$36
		dc.b $49,$49,$49,$49,$46,$40,$36
		dc.b $49,$49,$49,$49,$47,$40,$36
		dc.b $49,$49,$49,$49,$48,$40,$36
		dc.b $49,$49,$49,$49,$49,$41,$36
		dc.b $49,$49,$49,$49,$49,$42,$36
		dc.b $49,$49,$49,$49,$49,$43,$36
		dc.b $49,$49,$49,$49,$49,$44,$36
		dc.b $49,$49,$49,$49,$49,$45,$36
		dc.b $49,$49,$49,$49,$49,$46,$36
		dc.b $49,$49,$49,$49,$49,$47,$36
		dc.b $49,$49,$49,$49,$49,$48,$36
		dc.b $49,$49,$49,$49,$49,$49,$37
		dc.b $49,$49,$49,$49,$49,$49,$4A
		dc.b $FF
