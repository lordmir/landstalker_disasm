
; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

DisplayIslandMap:				  ; DATA XREF: j_DisplayIslandMapt

var_98		= -$98
var_96		= -$96
var_8C		= -$8C
var_8A		= -$8A
var_88		= -$88
var_82		= -$82
var_80		= -$80

		link	a6,#-$0098
		andi.w	#$0003,d0
		move.w	d0,var_82(a6)
		clr.w	var_88(a6)
		clr.w	var_8A(a6)
		clr.w	var_8C(a6)
		clr.w	var_98(a6)
		clr.w	var_96(a6)
		lea	(g_Pal0Base).l,a0
		lea	var_80(a6),a1
		move.w	#$003F,d7

loc_3E682:					  ; CODE XREF: DisplayIslandMap+30j
		move.w	(a0)+,(a1)+
		dbf	d7,loc_3E682
		jsr	(j_FadeOutToDarkness).l
		jsr	(j_EnableVDPSpriteUpdate).l
		lea	MapDots(pc),a0
		lea	(g_Blockset).l,a1
		lea	($00000020).w,a2
		jsr	(j_DecompressAndQueueGfxCopy).l
		jsr	(j_FlushDMACopyQueue).l
		lea	MapFriday(pc),a0
		lea	((g_Blockset+$80)).l,a1
		lea	($000000A0).w,a2
		jsr	(j_DecompressAndQueueGfxCopy).l
		jsr	(j_EnableDMAQueueProcessing).l
		bsr.w	sub_3EB0E
		bsr.w	sub_3EB5E
		jsr	(j_WaitUntilVBlank).l
		lea	(g_Buffer).l,a0
		lea	($000001A0).w,a1
		move.w	($00000140).w,d0	  ; "		     "
		moveq	#$00000002,d1
		jsr	(j_QueueDMAOp).l
		jsr	(j_FlushDMACopyQueue).l
		lea	IslandMapFg(pc),a0
		lea	(g_Blockset).l,a1
		lea	($00001000).w,a2
		jsr	(j_DecompressAndQueueGfxCopy).l
		jsr	(j_FlushDMACopyQueue).l
		lea	IslandMapBg(pc),a0
		lea	(g_Blockset).l,a1
		lea	($00006000).w,a2
		jsr	(j_DecompressAndQueueGfxCopy).l
		jsr	(j_FlushDMACopyQueue).l
		lea	IslandMapFgMap(pc),a0
		lea	(g_Buffer).l,a1
		bsr.w	DecompTilemap
		lea	(g_InventoryTilemap).l,a1
		move.w	#$0000,d4
		move.w	#$0080,d5
		bsr.w	sub_3ED64
		lea	(g_InventoryTilemap).l,a0
		lea	($0000C180).l,a1
		move.w	#$0640,d0
		move.w	#$0002,d1
		jsr	(j_QueueDMAOp).l
		jsr	(j_FlushDMACopyQueue).l
		lea	IslandMapBgMap(pc),a0
		lea	(g_Buffer).l,a1
		bsr.w	DecompTilemap
		lea	((g_ForegroundBlocks+$17E)).l,a1
		move.w	#$2000,d4
		move.w	#$0300,d5
		bsr.w	sub_3ED64
		lea	((g_ForegroundBlocks+$17E)).l,a0
		lea	($0000E180).l,a1
		move.w	#$0640,d0
		move.w	#$0002,d1
		jsr	(j_QueueDMAOp).l
		jsr	(j_FlushDMACopyQueue).l
		jsr	(j_DisableVDPSpriteUpdate).l
		clr.w	d6
		jsr	(j_FillHScrollData).l
		jsr	(j_FillVSRAM).l
		jsr	(j_FillHScrollDataOffset1).l
		jsr	(j_FillVSRAMOffset1).l
		jsr	(j_ClearVDPSpriteTable).l
		bsr.w	sub_3EC76
		lea	IslandMapFgPal(pc),a0
		lea	(g_Pal0Base).l,a1
		moveq	#$0000000F,d7

loc_3E7DC:					  ; CODE XREF: DisplayIslandMap+18Aj
		move.l	(a0)+,(a1)+
		dbf	d7,loc_3E7DC
		jsr	(j_LoadInitialPlayerPalette).l
		jsr	(j_CopyBasePalleteToActivePalette).l
		lea	(g_Pal0Active).l,a0
		moveq	#$0000000F,d7

loc_3E7F6:					  ; CODE XREF: DisplayIslandMap+1A4j
		clr.l	(a0)+
		dbf	d7,loc_3E7F6
		clr.w	d0
		move.b	#$EF,d1
		jsr	(j_MaskVDPReg).l
		move.w	var_82(a6),d0
		lea	off_3E86C(pc),a0
		lsl.w	#$02,d0
		movea.l	(a0,d0.w),a0
		jsr	(a0)
		jsr	(j_ClearVDPSpriteTable).l
		lea	(g_Pal0Base).l,a0
		moveq	#$00000039,d7

loc_3E826:					  ; CODE XREF: DisplayIslandMap+1D4j
		clr.w	(a0)+
		dbf	d7,loc_3E826
		jsr	(j_CopyBasePalleteToActivePalette).l
		jsr	(j_FlushDMACopyQueue).l
		lea	var_80(a6),a0
		lea	(g_Pal0Base).l,a1
		move.w	#$003F,d7

loc_3E846:					  ; CODE XREF: DisplayIslandMap+1F4j
		move.w	(a0)+,(a1)+
		dbf	d7,loc_3E846
		bsr.w	sub_3E860
		clr.l	d0
		move.b	#$10,d1
		jsr	(j_OrVDPReg).l
		unlk	a6
		rts
; End of function DisplayIslandMap


; =============== S U B	R O U T	I N E =======================================


sub_3E860:					  ; CODE XREF: DisplayIslandMap+1F8p
		move.w	#$1000,d0

loc_3E864:					  ; CODE XREF: sub_3E860+6j
		nop
		dbf	d0,loc_3E864
		rts
; End of function sub_3E860

; ---------------------------------------------------------------------------
off_3E86C:	dc.l sub_3EC44			  ; DATA XREF: DisplayIslandMap+1B8t
		dc.l sub_3EC44
		dc.l sub_3E87C
		dc.l sub_3E890

; =============== S U B	R O U T	I N E =======================================


sub_3E87C:					  ; DATA XREF: ROM:0003E874o
		jsr	(j_FadeInFromDarkness).l
		jsr	(j_WaitForNextButtonPress).l
		jsr	(j_FadeOutToDarkness).l
		rts
; End of function sub_3E87C


; =============== S U B	R O U T	I N E =======================================


sub_3E890:					  ; DATA XREF: ROM:0003E878o
		jsr	(j_InitFadeFromBlackParams).l
		move.b	#$01,-$0000008F(a6)
		move.w	#$001C,-$00000092(a6)
		jsr	(j_UpdateControllerInputs).l
		move.b	(g_Controller1State).l,-$00000085(a6)
		move.w	#$00C8,-$0000008E(a6)
		clr.w	-$00000096(a6)
		move.w	#$0100,d6
		jsr	(j_GenerateRandomNumber).l
		move.w	d7,-$0000008C(a6)

loc_3E8C8:					  ; CODE XREF: sub_3E890+70j
						  ; sub_3E890+76j
		jsr	sub_3E90A(pc)
		nop
		tst.b	(g_Controller1State).l
		beq.s	loc_3E8DA
		bsr.w	sub_3E92C

loc_3E8DA:					  ; CODE XREF: sub_3E890+44j
		bsr.w	sub_3E950
		bsr.w	sub_3E9F8
		bsr.w	sub_3E9B8
		bsr.w	sub_3E9D8
		addq.w	#$01,-$00000098(a6)
		jsr	(j_WaitUntilVBlank).l
		move.b	-$0000008F(a6),d0
		andi.b	#$0F,d0
		cmpi.b	#$0F,d0
		bne.s	loc_3E8C8
		tst.w	-$00000096(a6)
		beq.s	loc_3E8C8
		rts
; End of function sub_3E890


; =============== S U B	R O U T	I N E =======================================


sub_3E90A:					  ; DATA XREF: sub_3E890:loc_3E8C8t
		jsr	(j_UpdateControllerInputs).l
		lea	(g_Controller1State).l,a0
		lea	-$00000085(a6),a1
		tst.b	(a0)
		bne.s	loc_3E922
		clr.b	(a1)
		rts
; ---------------------------------------------------------------------------

loc_3E922:					  ; CODE XREF: sub_3E90A+12j
		tst.b	(a1)
		bne.s	loc_3E928
		rts
; ---------------------------------------------------------------------------

loc_3E928:					  ; CODE XREF: sub_3E90A+1Aj
		clr.b	(a0)
		rts
; End of function sub_3E90A


; =============== S U B	R O U T	I N E =======================================


sub_3E92C:					  ; CODE XREF: sub_3E890+46p
		move.b	-$0000008F(a6),d0
		andi.b	#$0F,d0
		cmpi.b	#$03,d0
		beq.s	loc_3E93C
		rts
; ---------------------------------------------------------------------------

loc_3E93C:					  ; CODE XREF: sub_3E92C+Cj
		bset	#$02,-$0000008F(a6)
		move.w	#$001C,-$00000092(a6)
		jsr	(j_InitFadeToBlackParams).l
		rts
; End of function sub_3E92C


; =============== S U B	R O U T	I N E =======================================


sub_3E950:					  ; CODE XREF: sub_3E890:loc_3E8DAp
		move.w	-$0000008E(a6),d0
		btst	#$02,-$0000008F(a6)
		beq.w	loc_3E972
		addq.w	#$04,d0
		cmpi.w	#$00C8,d0
		bcs.s	loc_3E96C
		move.w	#$FFFF,-$00000096(a6)

loc_3E96C:					  ; CODE XREF: sub_3E950+14j
		move.w	d0,-$0000008E(a6)
		rts
; ---------------------------------------------------------------------------

loc_3E972:					  ; CODE XREF: sub_3E950+Aj
		cmpi.w	#$0009,d0
		bcc.s	loc_3E97E
		moveq	#$00000008,d0
		bra.s	loc_3E98A
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_3E97E:					  ; CODE XREF: sub_3E950+26j
		cmpi.w	#$0014,d0
		bcc.s	loc_3E988
		subq.w	#$02,d0
		bra.s	loc_3E98A
; ---------------------------------------------------------------------------

loc_3E988:					  ; CODE XREF: sub_3E950+32j
		subq.w	#$04,d0

loc_3E98A:					  ; CODE XREF: sub_3E950+2Aj
						  ; sub_3E950+36j
		move.w	d0,-$0000008E(a6)
		rts
; End of function sub_3E950


; =============== S U B	R O U T	I N E =======================================


sub_3E990:					  ; CODE XREF: sub_3E9B8:loc_3E9C8p
						  ; sub_3E9D8:loc_3E9E8p
		subq.w	#$01,-$00000092(a6)
		move.w	-$00000092(a6),d0
		andi.b	#$03,d0
		beq.s	loc_3E9A0
		rts
; ---------------------------------------------------------------------------

loc_3E9A0:					  ; CODE XREF: sub_3E990+Cj
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		move.w	#$001F,d5
		jsr	(j_DarkenPalette).l
		rts
; End of function sub_3E990


; =============== S U B	R O U T	I N E =======================================


sub_3E9B8:					  ; CODE XREF: sub_3E890+52p
		move.b	-$0000008F(a6),d0
		andi.b	#$03,d0
		cmpi.b	#$01,d0
		beq.s	loc_3E9C8
		rts
; ---------------------------------------------------------------------------

loc_3E9C8:					  ; CODE XREF: sub_3E9B8+Cj
		bsr.s	sub_3E990
		tst.w	-$00000092(a6)
		bne.s	locret_3E9D6
		bset	#$01,-$0000008F(a6)

locret_3E9D6:					  ; CODE XREF: sub_3E9B8+16j
		rts
; End of function sub_3E9B8


; =============== S U B	R O U T	I N E =======================================


sub_3E9D8:					  ; CODE XREF: sub_3E890+56p
		move.b	-$0000008F(a6),d0
		andi.b	#$0C,d0
		cmpi.b	#$04,d0
		beq.s	loc_3E9E8
		rts
; ---------------------------------------------------------------------------

loc_3E9E8:					  ; CODE XREF: sub_3E9D8+Cj
		bsr.s	sub_3E990
		tst.w	-$00000092(a6)
		bne.s	locret_3E9F6
		bset	#$03,-$0000008F(a6)

locret_3E9F6:					  ; CODE XREF: sub_3E9D8+16j
		rts
; End of function sub_3E9D8


; =============== S U B	R O U T	I N E =======================================


sub_3E9F8:					  ; CODE XREF: sub_3E890+4Ep

; FUNCTION CHUNK AT 0003EA62 SIZE 0000007C BYTES

		lea	(g_VDPSpr16_Y).l,a1
		move.w	#$4005,d0
		btst	#$02,-$0000008B(a6)
		beq.s	loc_3EA0C
		addq.w	#$04,d0

loc_3EA0C:					  ; CODE XREF: sub_3E9F8+10j
		move.w	d0,$00000004(a1)
		move.b	#$05,$00000002(a1)
		move.w	-$00000084(a6),d7
		lsl.w	#$02,d7
		lea	MapFridayCoords(pc),a0	  ; GUMI
						  ; RYUMA
						  ; MERCATOR
						  ; VERLA
						  ; DESTEL
		bsr.w	sub_3EA28
		bra.w	loc_3EA62
; End of function sub_3E9F8


; =============== S U B	R O U T	I N E =======================================


sub_3EA28:					  ; CODE XREF: sub_3E9F8+28p
		move.w	-$0000008C(a6),d0
		lsl.w	#$02,d0
		jsr	(sub_22EEC).l
		move.w	-$0000008E(a6),d1
		mulu.w	d0,d1
		lsr.l	#$08,d1
		add.w	(a0,d7.w),d1
		move.w	d1,$00000006(a1)
		move.w	-$0000008C(a6),d0
		lsl.w	#$02,d0
		jsr	(sub_22EF0).l
		move.w	-$0000008E(a6),d1
		lsr.w	#$01,d1
		mulu.w	d0,d1
		lsr.l	#$08,d1
		add.w	$00000002(a0,d7.w),d1
		move.w	d1,(a1)
		rts
; End of function sub_3EA28

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_3E9F8

loc_3EA62:					  ; CODE XREF: sub_3E9F8+2Cj
		move.w	-$0000008C(a6),d2
		andi.w	#$003F,d2
		cmpi.w	#$0030,d2
		bcc.s	loc_3EA74
		clr.l	d2
		bra.s	loc_3EA76
; ---------------------------------------------------------------------------

loc_3EA74:					  ; CODE XREF: sub_3E9F8+76j
		moveq	#$FFFFFFFF,d2

loc_3EA76:					  ; CODE XREF: sub_3E9F8+7Aj
		lea	MapTextCoords(pc),a0	  ; GUMI
						  ; RYUMA
						  ; MERCATOR
						  ; VERLA
						  ; DESTEL
		move.w	-$00000084(a6),d0
		lsl.w	#$02,d0
		lea	$00000008(a1),a1
		move.w	#$000D,d1
		move.w	d1,$00000004(a1)
		move.b	#$0D,$00000002(a1)
		move.w	(a0,d0.w),d1
		move.w	d1,$00000006(a1)
		move.w	$00000002(a0,d0.w),d1
		tst.w	d2
		bne.s	loc_3EAA6
		move.w	d1,(a1)
		bra.s	loc_3EAAA
; ---------------------------------------------------------------------------

loc_3EAA6:					  ; CODE XREF: sub_3E9F8+A8j
		move.w	#$FFFF,(a1)

loc_3EAAA:					  ; CODE XREF: sub_3E9F8+ACj
		lea	$00000008(a1),a1
		move.w	#$0015,d1
		move.w	d1,$00000004(a1)
		move.b	#$0D,$00000002(a1)
		move.w	(a0,d0.w),d1
		addi.w	#$0020,d1
		move.w	d1,$00000006(a1)
		move.w	$00000002(a0,d0.w),d1
		tst.w	d2
		bne.s	loc_3EAD4
		move.w	d1,(a1)
		bra.s	loc_3EAD8
; ---------------------------------------------------------------------------

loc_3EAD4:					  ; CODE XREF: sub_3E9F8+D6j
		move.w	#$FFFF,(a1)

loc_3EAD8:					  ; CODE XREF: sub_3E9F8+DAj
		addq.w	#$01,-$0000008C(a6)
		rts
; END OF FUNCTION CHUNK	FOR sub_3E9F8
; ---------------------------------------------------------------------------
MapFridayCoords:dc.w $0178,$00C8		  ; DATA XREF: sub_3E9F8+24t
		dc.w $0198,$00F0		  ; GUMI
		dc.w $0168,$0110		  ; RYUMA
		dc.w $0128,$00E8		  ; MERCATOR
		dc.w $00C8,$0100		  ; VERLA
		dc.w $00C0,$00C0		  ; DESTEL
MapTextCoords:	dc.w $0188,$00D8		  ; DATA XREF: sub_3E9F8:loc_3EA76t
		dc.w $0180,$00FC		  ; GUMI
		dc.w $0170,$0130		  ; RYUMA
		dc.w $0110,$00D8		  ; MERCATOR
		dc.w $00C0,$00F4		  ; VERLA
		dc.w $00B0,$00DA		  ; DESTEL

; =============== S U B	R O U T	I N E =======================================


sub_3EB0E:					  ; CODE XREF: DisplayIslandMap+74p
		move.w	#$0001,(word_FF1194).l
		clr.b	(byte_FF1129).l
		move.b	#$01,(byte_FF112A).l
		lea	(g_ScreenBuffer).l,a1
		moveq	#$00000000,d1
		move.w	#$027F,d7

loc_3EB30:					  ; CODE XREF: sub_3EB0E+24j
		move.l	d1,(a1)+
		dbf	d7,loc_3EB30
		jsr	(sub_22F10).l
		ext.w	d6
		move.w	d6,-$00000084(a6)
		bpl.s	loc_3EB46
		rts
; ---------------------------------------------------------------------------

loc_3EB46:					  ; CODE XREF: sub_3EB0E+34j
						  ; sub_3EB0E+4Aj
		clr.w	d0
		move.b	(a2)+,d0
		movem.l	d7/a2,-(sp)
		jsr	(sub_22EFC).l
		movem.l	(sp)+,d7/a2
		dbf	d7,loc_3EB46
		rts
; End of function sub_3EB0E


; =============== S U B	R O U T	I N E =======================================


sub_3EB5E:					  ; CODE XREF: DisplayIslandMap+78p
		lea	(g_Buffer).l,a5
		movea.l	a5,a1
		clr.l	d0
		move.w	#$0080,d7

loc_3EB6C:					  ; CODE XREF: sub_3EB5E+10j
		move.l	d0,(a1)+
		dbf	d7,loc_3EB6C
		moveq	#$0000000F,d0
		move.b	d0,d1
		lsl.b	#$04,d1
		lea	(g_ScreenBuffer).l,a0
		movea.l	a5,a1
		move.w	#$0080,d7

loc_3EB84:					  ; CODE XREF: sub_3EB5E+7Ej
		bsr.w	sub_3EC0C
		beq.s	loc_3EB8E
		bsr.w	sub_3EC2C

loc_3EB8E:					  ; CODE XREF: sub_3EB5E+2Aj
		bsr.w	sub_3EC14
		beq.s	loc_3EB98
		bsr.w	sub_3EC24

loc_3EB98:					  ; CODE XREF: sub_3EB5E+34j
		addq.l	#$01,a1
		bsr.w	sub_3EC0C
		beq.s	loc_3EBA4
		bsr.w	sub_3EC1C

loc_3EBA4:					  ; CODE XREF: sub_3EB5E+40j
		bsr.w	sub_3EC14
		beq.s	loc_3EBAE
		bsr.w	sub_3EC24

loc_3EBAE:					  ; CODE XREF: sub_3EB5E+4Aj
		addq.l	#$01,a1
		bsr.w	sub_3EC0C
		beq.s	loc_3EBBA
		bsr.w	sub_3EC1C

loc_3EBBA:					  ; CODE XREF: sub_3EB5E+56j
		bsr.w	sub_3EC14
		beq.s	loc_3EBC4
		bsr.w	sub_3EC24

loc_3EBC4:					  ; CODE XREF: sub_3EB5E+60j
		addq.l	#$01,a1
		bsr.w	sub_3EC0C
		beq.s	loc_3EBD0
		bsr.w	sub_3EC1C

loc_3EBD0:					  ; CODE XREF: sub_3EB5E+6Cj
		bsr.w	sub_3EC14
		beq.s	loc_3EBDA
		bsr.w	sub_3EC34

loc_3EBDA:					  ; CODE XREF: sub_3EB5E+76j
		addq.l	#$01,a1
		dbf	d7,loc_3EB84
		lea	(g_ScreenBuffer).l,a0
		movea.l	a5,a1
		move.w	#$01FF,d7
		moveq	#$0000000F,d1
		moveq	#$FFFFFFF0,d2

loc_3EBF0:					  ; CODE XREF: sub_3EB5E+A8j
		move.b	(a0),d0
		and.b	d2,d0
		beq.s	loc_3EBFA
		and.b	d1,(a1)
		or.b	d0,(a1)

loc_3EBFA:					  ; CODE XREF: sub_3EB5E+96j
		move.b	(a0)+,d0
		and.b	d1,d0
		beq.s	loc_3EC04
		and.b	d2,(a1)
		or.b	d0,(a1)

loc_3EC04:					  ; CODE XREF: sub_3EB5E+A0j
		addq.l	#$01,a1
		dbf	d7,loc_3EBF0
		rts
; End of function sub_3EB5E


; =============== S U B	R O U T	I N E =======================================


sub_3EC0C:					  ; CODE XREF: sub_3EB5E:loc_3EB84p
						  ; sub_3EB5E+3Cp ...
		move.b	(a0),d2
		andi.b	#$F0,d2
		rts
; End of function sub_3EC0C


; =============== S U B	R O U T	I N E =======================================


sub_3EC14:					  ; CODE XREF: sub_3EB5E:loc_3EB8Ep
						  ; sub_3EB5E:loc_3EBA4p ...
		move.b	(a0)+,d2
		andi.b	#$0F,d2
		rts
; End of function sub_3EC14


; =============== S U B	R O U T	I N E =======================================


sub_3EC1C:					  ; CODE XREF: sub_3EB5E+42p
						  ; sub_3EB5E+58p ...
		or.b	d0,-$00000001(a1)
		or.b	d0,(a1)
		bra.s	loc_3EC3A
; End of function sub_3EC1C


; =============== S U B	R O U T	I N E =======================================


sub_3EC24:					  ; CODE XREF: sub_3EB5E+36p
						  ; sub_3EB5E+4Cp ...
		or.b	d1,(a1)
		or.b	d1,$00000001(a1)
		bra.s	loc_3EC3A
; End of function sub_3EC24


; =============== S U B	R O U T	I N E =======================================


sub_3EC2C:					  ; CODE XREF: sub_3EB5E+2Cp
		or.b	d0,-$0000003D(a1)
		or.b	d0,(a1)
		bra.s	loc_3EC3A
; End of function sub_3EC2C


; =============== S U B	R O U T	I N E =======================================


sub_3EC34:					  ; CODE XREF: sub_3EB5E+78p
		or.b	d1,(a1)
		or.b	d1,$0000003D(a1)

loc_3EC3A:					  ; CODE XREF: sub_3EC1C+6j
						  ; sub_3EC24+6j ...
		or.b	d1,-$00000004(a1)
		or.b	d1,$00000004(a1)
		rts
; End of function sub_3EC34


; =============== S U B	R O U T	I N E =======================================


sub_3EC44:					  ; DATA XREF: ROM:off_3E86Co
						  ; ROM:0003E870o
		jsr	(j_FadeInFromDarkness).l

loc_3EC4A:					  ; CODE XREF: sub_3EC44+28j
		bsr.w	sub_3EC96
		jsr	(j_EnableDMAQueueProcessing).l
		addq.w	#$01,-$00000098(a6)
		jsr	(j_WaitUntilVBlank).l
		cmpi.w	#$0007,-$00000088(a6)
		beq.w	loc_3EC6E
		tst.w	-$00000096(a6)
		beq.s	loc_3EC4A

loc_3EC6E:					  ; CODE XREF: sub_3EC44+20j
		jsr	(j_FadeOutToDarkness).l
		rts
; End of function sub_3EC44


; =============== S U B	R O U T	I N E =======================================


sub_3EC76:					  ; CODE XREF: DisplayIslandMap+178p
		cmpi.w	#$0001,-$00000082(a6)
		beq.s	loc_3EC80
		rts
; ---------------------------------------------------------------------------

loc_3EC80:					  ; CODE XREF: sub_3EC76+6j
		move.w	#$0023,d7

loc_3EC84:					  ; CODE XREF: sub_3EC76+1Aj
		clr.w	-$0000008C(a6)
		move.l	d7,-(sp)
		bsr.w	sub_3EC9E
		move.l	(sp)+,d7
		dbf	d7,loc_3EC84
		rts
; End of function sub_3EC76


; =============== S U B	R O U T	I N E =======================================


sub_3EC96:					  ; CODE XREF: sub_3EC44:loc_3EC4Ap
		subq.w	#$01,-$0000008C(a6)
		bmi.s	sub_3EC9E
		rts
; End of function sub_3EC96


; =============== S U B	R O U T	I N E =======================================


sub_3EC9E:					  ; CODE XREF: sub_3EC76+14p
						  ; sub_3EC96+4j ...
		move.w	-$0000008A(a6),d0
		addq.w	#$01,-$0000008A(a6)
		lea	byte_3ED3C(pc),a0
		add.w	d0,d0
		clr.w	d1
		move.b	(a0,d0.w),d1
		bpl.s	loc_3ECC6
		clr.w	-$0000008A(a6)
		bsr.w	sub_3ED18
		tst.w	-$00000096(a6)
		beq.s	loc_3ECC4
		rts
; ---------------------------------------------------------------------------

loc_3ECC4:					  ; CODE XREF: sub_3EC9E+22j
		bra.s	sub_3EC9E
; ---------------------------------------------------------------------------

loc_3ECC6:					  ; CODE XREF: sub_3EC9E+14j
		lea	(g_VDPSpr00_Y).l,a1
		move.w	-$00000088(a6),d7
		lsl.w	#$03,d7
		lea	(a1,d7.w),a1
		addi.w	#$2001,d1
		move.w	d1,$00000004(a1)	  ; Tiles
		clr.w	d1
		move.b	$00000001(a0,d0.w),d1
		move.w	d1,-$0000008C(a6)
		lea	byte_3ED46(pc),a0
		move.w	-$00000088(a6),d0
		add.w	d0,d0
		lea	(a0,d0.w),a0
		clr.w	d1
		move.b	(a0),d1
		addi.w	#$0080,d1
		move.w	d1,$00000006(a1)	  ; X
		clr.w	d1
		move.b	$00000001(a0),d1
		addi.w	#$0090,d1
		move.w	d1,(a1)			  ; Y
		clr.b	$00000002(a1)		  ; Size/Link
		move.w	#$0001,d0
		rts
; End of function sub_3EC9E


; =============== S U B	R O U T	I N E =======================================


sub_3ED18:					  ; CODE XREF: sub_3EC9E+1Ap
		lea	byte_3ED46(pc),a5

loc_3ED1C:					  ; CODE XREF: sub_3ED18+22j
		addq.w	#$01,-$00000088(a6)
		move.w	-$00000088(a6),d7
		add.w	d7,d7
		tst.b	(a5,d7.w)
		beq.s	loc_3ED2E
		rts
; ---------------------------------------------------------------------------

loc_3ED2E:					  ; CODE XREF: sub_3ED18+12j
		move.w	#$FFFF,-$00000088(a6)
		move.w	#$FFFF,-$00000096(a6)
		bra.s	loc_3ED1C
; End of function sub_3ED18

; ---------------------------------------------------------------------------
byte_3ED3C:	dc.b $00, $04			  ; DATA XREF: sub_3EC9E+8t
		dc.b $01, $06
		dc.b $02, $08
		dc.b $03, $14
		dc.b $FF, $00
byte_3ED46:	dc.b $AC, $7B			  ; DATA XREF: sub_3EC9E+4At
						  ; sub_3ED18t
		dc.b $B4, $83
		dc.b $BA, $8C
		dc.b $BB, $99
		dc.b $B4, $A3
		dc.b $AB, $AB
		dc.b $9D, $AD
		dc.b $90, $AD
		dc.b $7F, $AB
		dc.b $73, $A6
		dc.b $66, $A1
		dc.b $53, $9B
		dc.b $46, $93
		dc.b $3B, $8B
		dc.b $00, $00

; =============== S U B	R O U T	I N E =======================================


sub_3ED64:					  ; CODE XREF: DisplayIslandMap+EEp
						  ; DisplayIslandMap+12Ep
		lea	(g_Buffer).l,a0
		movea.l	a1,a2
		move.b	(a0)+,d0
		ext.w	d0
		subq.w	#$01,d0
		move.b	(a0)+,d1
		ext.w	d1
		subq.w	#$01,d1

loc_3ED78:					  ; CODE XREF: sub_3ED64+30j
		movea.l	a1,a2
		move.w	d0,d2

loc_3ED7C:					  ; CODE XREF: sub_3ED64+28j
		move.w	(a0)+,d3
		andi.w	#$03FF,d3
		subi.w	#$0100,d3
		add.w	d5,d3
		or.w	d4,d3
		move.w	d3,(a2)+
		dbf	d2,loc_3ED7C
		lea	$00000080(a1),a1
		dbf	d1,loc_3ED78
		rts
; End of function sub_3ED64

; ---------------------------------------------------------------------------
