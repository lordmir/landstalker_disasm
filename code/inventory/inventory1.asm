
; =============== S U B	R O U T	I N E =======================================


CheckForMenuOpen:				  ; CODE XREF: GameLoop+10p

; FUNCTION CHUNK AT 0000774A SIZE 0000001C BYTES

		tst.b	(g_Controller1State).l
		bpl.w	locret_77A4
		btst	#$02,(g_LockPlayerActions).l ; Bit 0: Can't pick up items
						  ; Bit	1: Can't attack
						  ; Bit	2: Can't open menu
		bne.w	locret_77A4
		tst.b	(byte_FF113F).l
		bne.w	locret_77A4
		move.b	(byte_FF1133).l,d0
		beq.s	loc_7654
		cmpi.b	#$17,d0
		bne.w	locret_77A4

loc_7654:					  ; CODE XREF: CheckForMenuOpen+26j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MenuOpen
; ---------------------------------------------------------------------------
		bsr.w	FadeOutToDarkness
		bsr.w	sub_7816
		bsr.w	InitInv
		bsr.w	InitInvDisplay
		jsr	(j_RefreshAndClearTextbox).l
		bsr.w	QueueTextboxTilemapDMA
		bsr.w	FlushDMACopyQueue
		move.w	#$0000,d0
		move.b	#$EF,d1
		bsr.w	MaskVDPReg
		bsr.w	ClearAndRefreshVDPSpriteTableDMA
		clr.w	d6
		bsr.w	FillHScrollDataOffset1
		clr.w	d6
		bsr.w	FillVSRAMOffset1
		bsr.w	FlushDMACopyQueue
		lea	((g_ForegroundBlocks+$180)).l,a0
		move.w	#$04BF,d7

loc_76A0:					  ; CODE XREF: CheckForMenuOpen+80j
		move.w	#$86BC,(a0)+
		dbf	d7,loc_76A0
		bsr.w	QueueInventoryScrBTilemapDMA
		bsr.w	sub_D4AE
		jsr	(j_LoadYesNoPrompt).l
		bsr.w	FadeInFromDarkness
		jsr	(sub_22E8C).l
		bcc.w	sub_7766
		tst.b	d0
		beq.w	loc_774A
		bsr.w	sub_EAD4
		movem.w	d1,-(sp)
		bsr.w	FadeOutToDarkness
		clr.b	d0
		lea	(g_EquippedSword).l,a0
		bsr.s	sub_7718
		bsr.s	sub_7718
		bsr.s	sub_7718
		bsr.s	sub_7718
		bsr.s	UpdatePlayerDefence
		bra.w	loc_776E
; End of function CheckForMenuOpen


; =============== S U B	R O U T	I N E =======================================


UpdatePlayerDefence:				  ; CODE XREF: LoadRoom_0+6Cp
						  ; CheckForMenuOpen+C2p
		clr.w	d0
		move.b	(g_EquippedArmour).l,d0
		subi.b	#ITM_STEELBREAST,d0
		addq.b	#$01,d0
		cmpi.b	#ITM_FIREPROOF,d0
		bcs.s	loc_7702
		clr.b	d0

loc_7702:					  ; CODE XREF: UpdatePlayerDefence+12j
		add.b	d0,d0
		move.w	ArmourDefence(pc,d0.w),(Player_Defence).l
		rts
; End of function UpdatePlayerDefence

; ---------------------------------------------------------------------------
ArmourDefence:	dc.w $0100,$00E6,$00CC,$00B3,$0080

; =============== S U B	R O U T	I N E =======================================


sub_7718:					  ; CODE XREF: CheckForMenuOpen+BAp
						  ; CheckForMenuOpen+BCp ...
		bsr.w	InitInvEquipScreen
		tst.b	d0
		bne.s	loc_7744
		cmp.b	(a0),d1
		beq.s	loc_7744
		clr.w	(g_SwordCharge_0).l
		movem.l	d0-d1/a0,-(sp)
		jsr	(j_RefreshSwordChargeHUD).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		movem.l	(sp)+,d0-d1/a0

loc_7744:					  ; CODE XREF: sub_7718+6j
						  ; sub_7718+Aj
		move.b	d1,(a0)+
		addq.b	#$01,d0
		rts
; End of function sub_7718

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR CheckForMenuOpen

loc_774A:					  ; CODE XREF: CheckForMenuOpen+A2j
		bsr.w	loc_D3BE
		tst.b	d1
		bne.s	sub_7766
		movem.w	d0,-(sp)
		bsr.w	UseItem
		bsr.s	sub_7766
		movem.w	(sp)+,d0
		bsr.w	sub_8BC8
		rts
; END OF FUNCTION CHUNK	FOR CheckForMenuOpen

; =============== S U B	R O U T	I N E =======================================


sub_7766:					  ; CODE XREF: CheckForMenuOpen+9Cj
						  ; CheckForMenuOpen+12Cj ...
		movem.w	d1,-(sp)
		bsr.w	FadeOutToDarkness

loc_776E:					  ; CODE XREF: CheckForMenuOpen+C4j
		bsr.w	sub_D3A8
		bsr.w	UpdateEquipPal
		bsr.w	ClearScrollPlanes
		move.w	#$0000,d0
		move.b	#$10,d1
		bsr.w	OrVDPReg
		move.w	#$9203,d0
		bsr.w	SetVDPReg
		bsr.w	LoadRoom
		bsr.w	sub_8E9C
		bsr.w	LoadMagicSwordGfx
		clr.b	(g_Controller1State).l
		movem.w	(sp)+,d1

locret_77A4:					  ; CODE XREF: CheckForMenuOpen+6j
						  ; CheckForMenuOpen+12j ...
		rts
; End of function sub_7766


; =============== S U B	R O U T	I N E =======================================


LoadMagicSwordGfx:				  ; CODE XREF: j_LoadMagicSwordGfxj
						  ; LoadGame+38p ...
		bsr.w	FlushDMACopyQueue
		move.b	(g_EquippedSword).l,d0
		beq.s	locret_77F2
		lea	MagicSwordGfx(pc),a0
		cmpi.b	#ITM_MAGICSWORD,d0
		beq.s	loc_77DE
		lea	ThunderSwordGfx(pc),a0
		cmpi.b	#ITM_THUNDERSWORD,d0
		beq.s	loc_77DE
		lea	GaiaSwordGfx(pc),a0
		cmpi.b	#ITM_GAIASWORD,d0
		beq.s	loc_77DE
		lea	IceSwordGfx(pc),a0
		cmpi.b	#ITM_ICESWORD,d0
		beq.s	loc_77DE
		lea	CoinFallGfx(pc),a0

loc_77DE:					  ; CODE XREF: LoadMagicSwordGfx+14j
						  ; LoadMagicSwordGfx+1Ej ...
		lea	(g_Buffer).l,a1
		lea	($0000F180).l,a2
		bsr.w	DecompressAndQueueGfxCopy
		bsr.w	FlushDMACopyQueue

locret_77F2:					  ; CODE XREF: LoadMagicSwordGfx+Aj
		rts
; End of function LoadMagicSwordGfx


; =============== S U B	R O U T	I N E =======================================


LoadMagicSwordEffect:				  ; CODE XREF: j_LoadMagicSwordEffectj
		lea	MagicSwordGfx(pc),a0
		cmpi.b	#ITM_MAGICSWORD,d0
		beq.s	loc_780C
		lea	ThunderSwordGfx(pc),a0
		cmpi.b	#ITM_THUNDERSWORD,d0
		beq.s	loc_780C
		lea	IceSwordGfx(pc),a0

loc_780C:					  ; CODE XREF: LoadMagicSwordEffect+8j
						  ; LoadMagicSwordEffect+12j
		lea	(g_Buffer).l,a1
		bra.w	DecompressAndQueueGfxCopy
; End of function LoadMagicSwordEffect


; =============== S U B	R O U T	I N E =======================================


sub_7816:					  ; CODE XREF: CheckForMenuOpen+38p
		lea	InvScreenTilemap(pc),a0
		lea	(g_Buffer).l,a1
		bsr.w	DecompressLZ77Gfx
		lea	((g_Buffer+4)).l,a0
		lea	(g_InventoryTilemap).l,a1
		move.w	#$0012,d7

loc_7834:					  ; CODE XREF: sub_7816+3Aj
		move.w	#$0027,d6

loc_7838:					  ; CODE XREF: sub_7816+32j
		move.w	(a0)+,d0
		ori.w	#$8000,d0
		cmpi.w	#$86BC,d0
		bne.s	loc_7846
		clr.w	d0

loc_7846:					  ; CODE XREF: sub_7816+2Cj
		move.w	d0,(a1)+
		dbf	d6,loc_7838
		adda.w	#$0030,a1
		dbf	d7,loc_7834
		move.w	#$017F,d7

loc_7858:					  ; CODE XREF: sub_7816+46j
		move.w	#$86B4,(a1)+
		dbf	d7,loc_7858
		rts
; End of function sub_7816


; =============== S U B	R O U T	I N E =======================================


InitInvDisplay:					  ; CODE XREF: CheckForMenuOpen+40p
		lea	((g_Pal3Base+$14)).l,a0
		lea	((g_Pal0Base+$14)).l,a1
		moveq	#$00000004,d7

loc_7870:					  ; CODE XREF: InitInvDisplay+10j
		move.w	(a0)+,(a1)+
		dbf	d7,loc_7870
		lea	InvItemPal(pc),a0
		lea	(g_Pal1Base).l,a1
		bsr.w	CopyPalette
		bsr.w	ClearVDPSpriteTable
		bsr.w	QueueInventoryWinTilemapDMA
		move.w	#$921C,d0
		bsr.w	SetVDPReg
		rts
; End of function InitInvDisplay

; ---------------------------------------------------------------------------
