
; =============== S U B	R O U T	I N E =======================================


AddStatusEffect:				  ; DATA XREF: j_AddStatusEffectt
		tst.b	d0
		beq.s	loc_17776
		cmpi.b	#STATUS_PARALYSIS,d0
		bne.s	loc_17782

loc_17776:					  ; CODE XREF: AddStatusEffect+2j
		cmpi.b	#ITM_MARSSTONE,(g_EquippedRing).l
		beq.s	locret_177A2
		bra.s	loc_1778C
; ---------------------------------------------------------------------------

loc_17782:					  ; CODE XREF: AddStatusEffect+8j
		cmpi.b	#ITM_MOONSTONE,(g_EquippedRing).l
		beq.s	locret_177A2

loc_1778C:					  ; CODE XREF: AddStatusEffect+14j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Poison			  ; "U		     "
; ---------------------------------------------------------------------------
		bset	d0,(g_PlayerStatus).l
		cmpi.b	#$01,d0
		bcs.s	loc_177A4
		cmpi.b	#$02,d0
		beq.s	loc_177B4

locret_177A2:					  ; CODE XREF: AddStatusEffect+12j
						  ; AddStatusEffect+1Ej
		rts
; ---------------------------------------------------------------------------

loc_177A4:					  ; CODE XREF: AddStatusEffect+2Ej
		clr.b	(byte_FF1148).l
		move.b	#$08,(byte_FF1149).l
		rts
; ---------------------------------------------------------------------------

loc_177B4:					  ; CODE XREF: AddStatusEffect+34j
		move.w	#$04B0,(word_FF12E2).l
		clr.b	(byte_FF114A).l
		rts
; End of function AddStatusEffect


; =============== S U B	R O U T	I N E =======================================


ClearPlayerStatus:				  ; CODE XREF: sub_16420+66p
						  ; sub_16602+90p ...
		bclr	d0,(g_PlayerStatus).l
		rts
; End of function ClearPlayerStatus


; =============== S U B	R O U T	I N E =======================================


GetPlayerStatus:				  ; DATA XREF: j_GetPlayerStatust
		move.b	(g_PlayerStatus).l,d0
		rts
; End of function GetPlayerStatus


; =============== S U B	R O U T	I N E =======================================


GetGold:					  ; DATA XREF: j_GetGoldt
		move.w	(g_Gold).l,d0
		rts
; End of function GetGold


; =============== S U B	R O U T	I N E =======================================


AddGold:					  ; CODE XREF: ROM:00012F0Cp
						  ; DATA XREF: j_AddGoldt ...
		add.w	d0,(g_Gold).l
		bcc.s	loc_177EC
		move.w	#$FFFF,(g_Gold).l

loc_177EC:					  ; CODE XREF: AddGold+6j
		bsr.w	UpdateGoldHUD
		rts
; End of function AddGold


; =============== S U B	R O U T	I N E =======================================


RemoveGold:					  ; CODE XREF: ROM:00012F56p
						  ; DATA XREF: j_RemoveGoldt
		cmp.w	(g_Gold).l,d0
		bhi.s	loc_17808
		sub.w	d0,(g_Gold).l
		bsr.w	UpdateGoldHUD
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_17808:					  ; CODE XREF: RemoveGold+6j
		ori	#$01,ccr
		rts
; End of function RemoveGold


; =============== S U B	R O U T	I N E =======================================


AddHealth:					  ; CODE XREF: ROM:00014774p
						  ; sub_16602+D8p
						  ; DATA XREF: ...
		add.w	CurrentHealth(a5),d0
		bcs.s	loc_1781A
		cmp.w	MaxHealth(a5),d0
		bls.s	loc_1781E

loc_1781A:					  ; CODE XREF: AddHealth+4j
		move.w	MaxHealth(a5),d0

loc_1781E:					  ; CODE XREF: AddHealth+Aj
		move.w	d0,CurrentHealth(a5)
		cmpa.l	#Player_X,a5
		bne.s	locret_1782E
		bsr.w	RefreshCurrentHealthHUD

locret_1782E:					  ; CODE XREF: AddHealth+1Aj
		rts
; End of function AddHealth


; =============== S U B	R O U T	I N E =======================================


RemoveHealth:					  ; CODE XREF: sub_13140+12p
						  ; ROM:000146C2p ...
		sub.w	d0,CurrentHealth(a5)
		bcc.s	loc_1783A
		clr.w	CurrentHealth(a5)

loc_1783A:					  ; CODE XREF: RemoveHealth+4j
		cmpa.l	#Player_X,a5
		bne.s	locret_17846
		bsr.w	RefreshCurrentHealthHUD

locret_17846:					  ; CODE XREF: RemoveHealth+10j
		rts
; End of function RemoveHealth


; =============== S U B	R O U T	I N E =======================================


AddToMaxHealth:					  ; DATA XREF: j_AddToMaxHealtht
		add.w	d0,MaxHealth(a5)
		bsr.w	RefreshMaxHealthHUD
		rts
; End of function AddToMaxHealth


; =============== S U B	R O U T	I N E =======================================


GetMaxHealth:					  ; DATA XREF: j_GetMaxHealtht
		move.w	MaxHealth(a5),d0
		rts
; End of function GetMaxHealth


; =============== S U B	R O U T	I N E =======================================


IncrementSwordCharge:				  ; DATA XREF: j_IncrementSwordCharget
		move.w	(g_GoldenStatueTimer).l,d0
		beq.s	loc_1786C
		subq.w	#$01,(g_GoldenStatueTimer).l
		move.w	#$0A00,d0
		bra.s	loc_1788C
; ---------------------------------------------------------------------------

loc_1786C:					  ; CODE XREF: IncrementSwordCharge+6j
		move.w	#$0060,d0
		cmpi.b	#ITM_VENUSSTONE,(g_EquippedRing).l
		beq.s	loc_1788C
		move.w	#$0040,d0
		cmpi.b	#ITM_SATURNSTONE,(g_EquippedRing).l
		beq.s	loc_1788C
		move.w	#$0020,d0

loc_1788C:					  ; CODE XREF: IncrementSwordCharge+12j
						  ; IncrementSwordCharge+20j ...
		cmpi.w	#$3200,(g_SwordCharge_0).l
		bcc.s	locret_178B2
		add.w	d0,(g_SwordCharge_0).l
		cmpi.w	#$3200,(g_SwordCharge_0).l
		bls.s	loc_178AE
		move.w	#$3200,(g_SwordCharge_0).l

loc_178AE:					  ; CODE XREF: IncrementSwordCharge+4Cj
		bsr.w	sub_16CC6

locret_178B2:					  ; CODE XREF: IncrementSwordCharge+3Cj
		rts
; End of function IncrementSwordCharge


; =============== S U B	R O U T	I N E =======================================


DecreaseSwordCharge:				  ; DATA XREF: j_DecreaseSwordCharget
		sub.w	d0,(g_SwordCharge_0).l
		bpl.s	locret_178C6
		clr.w	(g_SwordCharge_0).l
		bsr.w	sub_16CC6

locret_178C6:					  ; CODE XREF: DecreaseSwordCharge+6j
		rts
; End of function DecreaseSwordCharge


; =============== S U B	R O U T	I N E =======================================


sub_178C8:					  ; DATA XREF: sub_10300t
		lea	(Sprite1_X).l,a5
		moveq	#$0000000E,d7

loc_178D0:					  ; CODE XREF: sub_178C8+28j
		move.b	(a5),d0
		bmi.s	locret_178F4
		movem.l	d7/a5,-(sp)
		tst.b	$0000004C(a5)
		bmi.s	loc_178F6
		cmpi.b	#$7F,d0
		beq.s	loc_178E8
		bsr.w	sub_178FE

loc_178E8:					  ; CODE XREF: sub_178C8+1Aj
						  ; sub_178C8+34j
		movem.l	(sp)+,d7/a5
		lea	$00000080(a5),a5
		dbf	d7,loc_178D0

locret_178F4:					  ; CODE XREF: sub_178C8+Aj
		rts
; ---------------------------------------------------------------------------

loc_178F6:					  ; CODE XREF: sub_178C8+14j
		jsr	(sub_1A4404).l
		bra.s	loc_178E8
; End of function sub_178C8

