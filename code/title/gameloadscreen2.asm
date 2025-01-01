
; =============== S U B	R O U T	I N E =======================================


sub_F6DC:					  ; CODE XREF: ROM:0000EEC4p
		bsr.w	ClearTextBuffer
		lea	($000042C0).w,a1
		moveq	#$00000003,d7

loc_F6E6:					  ; CODE XREF: sub_F6DC+28j
		movem.l	d7/a1,-(sp)
		lea	(g_ScreenBuffer).l,a0
		move.w	#$01C0,d0
		moveq	#$00000002,d1
		jsr	(j_DoDMACopy_1).l
		movem.l	(sp)+,d7/a1
		lea	$00000380(a1),a1
		dbf	d7,loc_F6E6
		move.w	#$0286,d0
		lea	((g_Buffer+$738)).l,a1
		move.w	#$0021,d7
		bsr.w	sub_F5CA
		moveq	#$00000003,d0

loc_F71C:					  ; CODE XREF: sub_F6DC+48j
		move.l	d0,-(sp)
		bsr.w	sub_F736
		move.l	(sp)+,d0
		dbf	d0,loc_F71C
		bsr.w	sub_F306
		rts
; End of function sub_F6DC


; =============== S U B	R O U T	I N E =======================================


sub_F72E:					  ; CODE XREF: ROM:0000EFB0p
						  ; ROM:0000EFE8p ...
		bsr.s	sub_F736
		bsr.w	sub_F306
		rts
; End of function sub_F72E


; =============== S U B	R O U T	I N E =======================================


sub_F736:					  ; CODE XREF: sub_F6DC+42p
						  ; sub_F72Ep
		move.b	(g_SaveSlot).l,d1
		move.l	d1,-(sp)
		move.b	d0,(g_SaveSlot).l
		cmpi.b	#$01,d0
		bcc.s	loc_F756
		lea	((g_Buffer+$56)).l,a5
		move.w	#$0216,d0
		bra.s	loc_F780
; ---------------------------------------------------------------------------

loc_F756:					  ; CODE XREF: sub_F736+12j
		bne.s	loc_F764
		lea	((g_Buffer+$7A)).l,a5
		move.w	#$0232,d0
		bra.s	loc_F780
; ---------------------------------------------------------------------------

loc_F764:					  ; CODE XREF: sub_F736:loc_F756j
		cmpi.b	#$03,d0
		bcc.s	loc_F776
		lea	((g_Buffer+$376)).l,a5
		move.w	#$024E,d0
		bra.s	loc_F780
; ---------------------------------------------------------------------------

loc_F776:					  ; CODE XREF: sub_F736+32j
		lea	((g_Buffer+$39A)).l,a5
		move.w	#$026A,d0

loc_F780:					  ; CODE XREF: sub_F736+1Ej
						  ; sub_F736+2Cj ...
		bsr.w	sub_F78E
		move.l	(sp)+,d1
		move.b	d1,(g_SaveSlot).l
		rts
; End of function sub_F736


; =============== S U B	R O U T	I N E =======================================


sub_F78E:					  ; CODE XREF: sub_F736:loc_F780p
		move.l	d0,-(sp)
		jsr	(LoadSavedGame).l
		lea	(unk_FF3562).l,a0
		lea	(a5),a1
		moveq	#$00000011,d6
		moveq	#$00000009,d7
		bsr.w	sub_F81A
		move.l	(sp)+,d0
		lea	$00000236(a5),a1
		bsr.w	sub_F578
		lea	$00000056(a5),a1
		move.b	(g_SaveSlot).l,d0
		addq.b	#$01,d0
		bsr.w	sub_F3CC
		move.w	(Player_CurrentHealth).l,d2
		beq.s	loc_F7CC
		addi.w	#$0100,d2

loc_F7CC:					  ; CODE XREF: sub_F78E+38j
		lsr.w	#$08,d2
		beq.w	loc_F808
		lea	$00000108(a5),a1
		bsr.w	sub_F3A6
		lea	$000001A4(a5),a1
		bsr.w	sub_F346
		lea	$000000FC(a5),a1
		bsr.w	sub_F3E0
		bsr.w	sub_F416
		lea	$0000005A(a5),a1
		bsr.w	sub_F448
		lea	$00000068(a5),a1
		bsr.w	sub_F478
		lea	$00000068(a5),a1
		bsr.w	sub_F53C
		rts
; ---------------------------------------------------------------------------

loc_F808:					  ; CODE XREF: sub_F78E+40j
		lea	$000000F2(a5),a0
		lea	$000000F4(a5),a1
		moveq	#$0000000E,d6
		moveq	#$00000003,d7
		bsr.w	sub_F81A
		rts
; End of function sub_F78E


; =============== S U B	R O U T	I N E =======================================


sub_F81A:					  ; CODE XREF: LoadGameSelectMenu+58p
						  ; sub_F78E+14p ...
		movem.l	d6-a1,-(sp)

loc_F81E:					  ; CODE XREF: sub_F81A+18j
		movea.l	a0,a2
		movea.l	a1,a3
		move.w	d6,d5

loc_F824:					  ; CODE XREF: sub_F81A+Cj
		move.w	(a0)+,(a1)+
		dbf	d5,loc_F824
		lea	$00000050(a2),a0
		lea	$00000050(a3),a1
		dbf	d7,loc_F81E
		movem.l	(sp)+,d6-a1
		rts
; End of function sub_F81A

; ---------------------------------------------------------------------------
		move.w	-$0000000A(a6),d0
		addq.w	#$01,-$0000000A(a6)
		andi.b	#$1F,d0
		beq.s	loc_F852
		cmpi.b	#$10,d0
		beq.s	loc_F87C
		rts
; ---------------------------------------------------------------------------

loc_F852:					  ; CODE XREF: ROM:0000F848j
		lea	(g_Pal0Base).l,a0
		lea	$00000020(a0),a1
		moveq	#$0000000F,d7
		move.w	#$0EEE,d1

loc_F862:					  ; CODE XREF: ROM:0000F86Aj
		move.w	(a0)+,d0
		move.w	d1,d2
		sub.w	d0,d2
		move.w	d2,(a1)+
		dbf	d7,loc_F862
		jsr	(CopyBasePalleteToActivePalette).l
		jsr	(EnableDMAQueueProcessing).l
		rts
; ---------------------------------------------------------------------------

loc_F87C:					  ; CODE XREF: ROM:0000F84Ej
		lea	(g_Pal0Base).l,a0
		lea	$00000020(a0),a1
		moveq	#$0000000F,d7

loc_F888:					  ; CODE XREF: ROM:0000F88Aj
		move.w	(a0)+,(a1)+
		dbf	d7,loc_F888
		jsr	(CopyBasePalleteToActivePalette).l
		jsr	(EnableDMAQueueProcessing).l
		rts

; =============== S U B	R O U T	I N E =======================================


sub_F89C:					  ; CODE XREF: sub_1007E:loc_10086p
		bsr.w	sub_F90A
		bcs.s	loc_F8A4
		rts
; ---------------------------------------------------------------------------

loc_F8A4:					  ; CODE XREF: sub_F89C+4j
		lea	(g_Pal1Base).l,a0
		bsr.w	sub_F8C4
		lea	(g_Pal3Base).l,a0
		bra.s	sub_F8C4
; End of function sub_F89C


; =============== S U B	R O U T	I N E =======================================


sub_F8B6:					  ; CODE XREF: ROM:loc_F08Ep
						  ; sub_FA24+3Cp
		bsr.w	sub_F90A
		bcs.s	loc_F8BE
		rts
; ---------------------------------------------------------------------------

loc_F8BE:					  ; CODE XREF: sub_F8B6+4j
		lea	(g_Pal3Base).l,a0
; End of function sub_F8B6


; =============== S U B	R O U T	I N E =======================================


sub_F8C4:					  ; CODE XREF: sub_F89C+Ep
						  ; sub_F89C+18j
		moveq	#$0000000F,d7
; End of function sub_F8C4


; =============== S U B	R O U T	I N E =======================================


sub_F8C6:					  ; CODE XREF: sub_F8C6+32j
						  ; DATA XREF: sub_E48E+28t
		move.w	(a0),d0
		move.w	d0,d1
		andi.w	#$0E00,d1
		subi.w	#$0200,d1
		bpl.s	loc_F8D6
		clr.w	d1

loc_F8D6:					  ; CODE XREF: sub_F8C6+Cj
		move.w	d0,d2
		andi.w	#$00E0,d2
		subi.w	#$0020,d2
		bpl.s	loc_F8E4
		clr.w	d2

loc_F8E4:					  ; CODE XREF: sub_F8C6+1Aj
		move.w	d0,d3
		andi.w	#$000E,d3
		subi.w	#$0002,d3
		bpl.s	loc_F8F2
		clr.w	d3

loc_F8F2:					  ; CODE XREF: sub_F8C6+28j
		or.w	d2,d1
		or.w	d3,d1
		move.w	d1,(a0)+
		dbf	d7,sub_F8C6
		jsr	(CopyBasePalleteToActivePalette).l
		jsr	(EnableDMAQueueProcessing).l
		rts
; End of function sub_F8C6


; =============== S U B	R O U T	I N E =======================================


sub_F90A:					  ; CODE XREF: sub_F89Cp
						  ; sub_F8B6p
		move.w	-$0000000E(a6),d0
		bne.s	loc_F912
		rts
; ---------------------------------------------------------------------------

loc_F912:					  ; CODE XREF: sub_F90A+4j
		subq.w	#$01,d0
		move.w	d0,-$0000000E(a6)
		divu.w	#$0006,d0
		swap	d0
		tst.w	d0
		beq.s	loc_F924
		rts
; ---------------------------------------------------------------------------

loc_F924:					  ; CODE XREF: sub_F90A+16j
		ori	#$01,ccr
		rts
; End of function sub_F90A


; =============== S U B	R O U T	I N E =======================================


sub_F92A:					  ; CODE XREF: ROM:loc_EEF6p
		jsr	(ClearVDPSpriteTable).l
		bsr.w	LoadGameStartPalette
		bsr.w	sub_F202
		bsr.s	sub_F958

loc_F93A:					  ; CODE XREF: sub_F92A+26j
		move.w	#$00B0,d0
		move.w	#$0134,d1
		moveq	#$00000050,d2
		moveq	#$00000003,d3
		clr.w	-$0000000C(a6)
		bsr.w	sub_F9D6
		tst.w	d0
		bmi.s	loc_F93A
		move.w	d0,-$0000000C(a6)
		rts
; End of function sub_F92A


; =============== S U B	R O U T	I N E =======================================


sub_F958:					  ; CODE XREF: ROM:0000EEC8p
						  ; sub_F92A+Ep
		bsr.w	ClearTextBuffer
		move.w	#$0028,(word_FF1194).l
		move.w	#$0043,d1
		bsr.w	j_j_LoadUncompressedString ; Start
		move.w	#$0078,(word_FF1194).l
		move.w	#$0044,d1
		bsr.w	j_j_LoadUncompressedString ; Copy
		move.w	#$00C8,(word_FF1194).l
		move.w	#$0045,d1
		bsr.w	j_j_LoadUncompressedString ; Delete
		bsr.w	DMACopyTextBuffer
		rts
; End of function sub_F958


; =============== S U B	R O U T	I N E =======================================


sub_F992:					  ; CODE XREF: ROM:0000EF94p
						  ; ROM:0000EFC4p
		bsr.w	sub_F1FA
		move.w	#$0090,(word_FF1194).l
		move.w	#$0046,d1
		bsr.w	j_j_LoadUncompressedString
		move.w	#$00D0,(word_FF1194).l
		move.w	#$0047,d1
		bsr.w	j_j_LoadUncompressedString
		jsr	(WaitUntilVBlank).l
		bsr.w	DMACopyTextBuffer
		bsr.w	sub_F218
		move.w	#$0118,d0
		move.w	#$0134,d1
		moveq	#$00000040,d2
		moveq	#$00000002,d3
		bsr.w	sub_F9D6
		rts
; End of function sub_F992


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_F9D6:					  ; CODE XREF: sub_F92A+20p
						  ; sub_F992+3Ep

var_A		= -$A
var_8		= -8
var_6		= -6
var_4		= -4
var_2		= -2

		link	a4,#-$000A
		move.w	d1,var_6(a4)
		move.w	d1,(g_VDPSpr00_Y).l
		move.b	#$05,(g_VDPSpr00_Size).l
		move.w	#$A0AA,(g_VDPSpr00_TileSource).l
		move.w	d0,var_4(a4)
		move.w	d0,(g_VDPSpr00_X).l
		move.w	d2,var_8(a4)
		clr.w	var_2(a4)
		move.w	d3,var_A(a4)
		jsr	(CopyBasePalleteToActivePalette).l
		jsr	(WaitUntilVBlank).l
		bsr.w	sub_F306
		bsr.s	sub_FA24
		move.w	var_2(a4),d0
		unlk	a4
		rts
; End of function sub_F9D6


; =============== S U B	R O U T	I N E =======================================


sub_FA24:					  ; CODE XREF: sub_F9D6+44p
						  ; sub_FA24+46j
		bsr.w	sub_F2E2
		move.b	(g_Controller1State).l,d1
		cmpi.b	#$10,d1
		bcs.s	loc_FA58
		clr.w	-$0000000A(a6)
		jsr	sub_FABC(pc)
		nop
		move.b	(g_Controller1State).l,d1
		andi.b	#$10,d1
		beq.s	loc_FA52
		move.w	#$FFFF,-$00000002(a4)
		rts
; ---------------------------------------------------------------------------

loc_FA52:					  ; CODE XREF: sub_FA24+24j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_CursorSelect
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_FA58:					  ; CODE XREF: sub_FA24+Ej
		bsr.s	loc_FA6C
		move.w	d0,-$00000002(a4)
		bsr.s	sub_FABC
		bsr.w	sub_F8B6
		jsr	(WaitUntilVBlank).l
		bra.s	sub_FA24
; End of function sub_FA24

; ---------------------------------------------------------------------------

loc_FA6C:					  ; CODE XREF: sub_FA24:loc_FA58p
		move.w	-$00000002(a4),d0
		move.w	-$00000008(a4),d1
		move.w	-$0000000A(a4),d2
		move.b	(g_Controller1State).l,d3
		btst	#CTRL_LEFT,d3
		bne.s	loc_FA8C
		btst	#CTRL_RIGHT,d3
		bne.s	loc_FAA2
		rts
; ---------------------------------------------------------------------------

loc_FA8C:					  ; CODE XREF: ROM:0000FA82j
		subq.w	#$01,d0
		bpl.s	loc_FA94
		clr.w	d0
		bra.s	locret_FAA0
; ---------------------------------------------------------------------------

loc_FA94:					  ; CODE XREF: ROM:0000FA8Ej
		sub.w	d1,-$00000004(a4)
		clr.w	-$0000000A(a6)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_CursorMove
; ---------------------------------------------------------------------------

locret_FAA0:					  ; CODE XREF: ROM:0000FA92j
		rts
; ---------------------------------------------------------------------------

loc_FAA2:					  ; CODE XREF: ROM:0000FA88j
		addq.w	#$01,d0
		cmp.w	d2,d0
		bcs.s	loc_FAAE
		move.w	d2,d0
		subq.w	#$01,d0
		bra.s	locret_FABA
; ---------------------------------------------------------------------------

loc_FAAE:					  ; CODE XREF: ROM:0000FAA6j
		add.w	d1,-$00000004(a4)
		clr.w	-$0000000A(a6)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_CursorMove
; ---------------------------------------------------------------------------

locret_FABA:					  ; CODE XREF: ROM:0000FAACj
		rts

; =============== S U B	R O U T	I N E =======================================


sub_FABC:					  ; CODE XREF: sub_FA24+3Ap
						  ; DATA XREF: sub_FA24+14t
		addq.w	#$01,-$0000000A(a6)
		move.w	-$0000000A(a6),d0
		andi.b	#$10,d0
		beq.s	loc_FAD4
		move.w	#$0001,(g_VDPSpr00_X).l
		rts
; ---------------------------------------------------------------------------

loc_FAD4:					  ; CODE XREF: sub_FABC+Cj
		move.w	-$00000004(a4),(g_VDPSpr00_X).l
		move.w	-$00000006(a4),(g_VDPSpr00_Y).l
		rts
; End of function sub_FABC


; =============== S U B	R O U T	I N E =======================================


sub_FAE6:					  ; CODE XREF: ROM:0000EF54p
		move.w	#$FFFF,(g_VDPSpr00_Y).l
		rts
; End of function sub_FAE6


; =============== S U B	R O U T	I N E =======================================


sub_FAF0:					  ; CODE XREF: ROM:0000EFF2p
						  ; sub_F0F8:loc_F116p
		move.w	-$00000002(a6),d0
		move.b	d0,(g_SaveSlot).l
		jsr	(LoadSavedGame).l
		lea	(g_Pal2Base).l,a1
		bsr.w	LoadInitialPlayerPalette
		jsr	(UpdateEquipPal).l
		jsr	(CopyBasePalleteToActivePalette).l
		jsr	(EnableDMAQueueProcessing).l
		rts
; End of function sub_FAF0


; =============== S U B	R O U T	I N E =======================================


LoadInitialPlayerPalette:			  ; CODE XREF: sub_FAF0+16p
						  ; DATA XREF: j_LoadInitialPlayerPalettet
		lea	InitialPlayerPal(pc),a0
		lea	(g_Pal2Base).l,a1
		moveq	#$0000000F,d7

loc_FB2A:					  ; CODE XREF: LoadInitialPlayerPalette+Ej
		move.w	(a0)+,(a1)+
		dbf	d7,loc_FB2A
		rts
; End of function LoadInitialPlayerPalette

; ---------------------------------------------------------------------------
