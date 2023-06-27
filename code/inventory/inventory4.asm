
; =============== S U B	R O U T	I N E =======================================


sub_D584:					  ; CODE XREF: sub_D50C+26p
		jsr	(j_GetItemQtyAndMaxQty).l
		cmpi.w	#$FFFF,d1
		bne.s	loc_D592
		rts
; ---------------------------------------------------------------------------

loc_D592:					  ; CODE XREF: sub_D584+Aj
		tst.w	d1
		beq.s	loc_D59A
		clr.l	d1
		bra.s	loc_D59C
; ---------------------------------------------------------------------------

loc_D59A:					  ; CODE XREF: sub_D584+10j
		moveq	#$00000001,d1

loc_D59C:					  ; CODE XREF: sub_D584+14j
		movem.w	d1,-(sp)
		bsr.w	sub_D642
		movem.w	(sp)+,d1
		lea	-$000000D6(a0),a0
		movem.l	a0,-(sp)
		bsr.s	sub_D5E4
		jsr	(j_GetItemQtyAndMaxQty).l
		movem.l	(sp)+,a0
		tst.w	d2
		bne.s	locret_D5C6
		lea	$0000005A(a0),a0
		bsr.s	sub_D5C8

locret_D5C6:					  ; CODE XREF: sub_D584+3Aj
		rts
; End of function sub_D584


; =============== S U B	R O U T	I N E =======================================


sub_D5C8:					  ; CODE XREF: sub_D584+40p
		tst.b	d1
		beq.s	loc_D5D2
		move.w	#$A000,d0
		bra.s	loc_D5D6
; ---------------------------------------------------------------------------

loc_D5D2:					  ; CODE XREF: sub_D5C8+2j
		move.w	#$C000,d0

loc_D5D6:					  ; CODE XREF: sub_D5C8+8j
		move.b	#$55,d0
		move.w	d0,(a0)+
		move.b	d1,d0
		addq.b	#$01,d0
		move.w	d0,(a0)+
		rts
; End of function sub_D5C8


; =============== S U B	R O U T	I N E =======================================


sub_D5E4:					  ; CODE XREF: sub_D584+2Cp
						  ; sub_ECF4+44p
		movem.w	d0-d1,-(sp)
		exg	d0,d1
		jsr	(j_LoadUncompressedString).l
		movea.l	a0,a1
		tst.b	d0
		bne.s	loc_D5FC
		move.w	#$A000,d0
		bra.s	loc_D600
; ---------------------------------------------------------------------------

loc_D5FC:					  ; CODE XREF: sub_D5E4+10j
		move.w	#$C000,d0

loc_D600:					  ; CODE XREF: sub_D5E4+16j
						  ; sub_D5E4:loc_D634j
		move.b	(a2)+,d0
		cmpi.b	#$69,d0
		bne.s	loc_D616
		move.b	#$48,d0
		move.w	d0,(a0)
		lea	$00000048(a1),a0
		bra.w	loc_D634
; ---------------------------------------------------------------------------

loc_D616:					  ; CODE XREF: sub_D5E4+22j
		cmpi.b	#$6A,d0
		bne.s	loc_D624
		lea	$00000048(a1),a0
		bra.w	loc_D634
; ---------------------------------------------------------------------------

loc_D624:					  ; CODE XREF: sub_D5E4+36j
		cmpi.b	#$6B,d0
		bne.s	loc_D632
		lea	$00000048(a1),a0
		bra.w	loc_D634
; ---------------------------------------------------------------------------

loc_D632:					  ; CODE XREF: sub_D5E4+44j
		move.w	d0,(a0)+

loc_D634:					  ; CODE XREF: sub_D5E4+2Ej
						  ; sub_D5E4+3Cj ...
		dbf	d7,loc_D600
		lea	$00000012(a1),a0
		movem.w	(sp)+,d0-d1
		rts
; End of function sub_D5E4


; =============== S U B	R O U T	I N E =======================================


sub_D642:					  ; CODE XREF: sub_D584+1Cp
						  ; sub_ECA6+2Cp
		movem.w	d0-d1,-(sp)
		tst.b	d1
		bne.s	loc_D652
		move.w	#$A0BC,d1
		bra.w	loc_D656
; ---------------------------------------------------------------------------

loc_D652:					  ; CODE XREF: sub_D642+6j
		move.w	#$C0BC,d1

loc_D656:					  ; CODE XREF: sub_D642+Cj
		andi.w	#$003F,d0
		mulu.w	#$0010,d0
		add.w	d1,d0
		moveq	#$00000003,d7

loc_D662:					  ; CODE XREF: sub_D642+3Cj
		move.w	d0,(a0)
		addq.w	#$04,d0
		move.w	d0,$00000002(a0)
		addq.w	#$04,d0
		move.w	d0,$00000004(a0)
		addq.w	#$04,d0
		move.w	d0,$00000006(a0)
		subi.w	#$000B,d0
		lea	$00000048(a0),a0
		dbf	d7,loc_D662
		lea	$00000008(a0),a0
		movem.w	(sp)+,d0-d1
		rts
; End of function sub_D642


; =============== S U B	R O U T	I N E =======================================


sub_D68C:					  ; CODE XREF: ROM:0000D42Cp
						  ; ROM:0000D456p
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_CursorMove
; ---------------------------------------------------------------------------
		bsr.w	sub_D730
		lea	((g_Buffer+$C)).l,a0
		subq.w	#$01,(a0)
		moveq	#$00000007,d7

loc_D69E:					  ; CODE XREF: sub_D68C+18j
		bsr.w	sub_D714
		subq.w	#$04,d1
		dbf	d7,loc_D69E
		rts
; End of function sub_D68C


; =============== S U B	R O U T	I N E =======================================


sub_D6AA:					  ; CODE XREF: ROM:0000D462p
						  ; ROM:0000D48Ep
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_CursorMove
; ---------------------------------------------------------------------------
		bsr.w	sub_D730
		lea	((g_Buffer+$C)).l,a0
		addq.w	#$01,(a0)
		moveq	#$00000007,d7

loc_D6BC:					  ; CODE XREF: sub_D6AA+18j
		bsr.w	sub_D714
		addq.w	#$04,d1
		dbf	d7,loc_D6BC
		rts
; End of function sub_D6AA

; ---------------------------------------------------------------------------

loc_D6C8:					  ; CODE XREF: ROM:0000D4A6p
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_CursorMove
; ---------------------------------------------------------------------------
		bsr.w	sub_D730
		lea	($00FF2C0A).l,a0
		subq.w	#$01,(a0)
		moveq	#$0000000B,d7

loc_D6DA:					  ; CODE XREF: ROM:0000D6E2j
		bsr.w	sub_D714
		subi.w	#$000C,d0
		dbf	d7,loc_D6DA
		bsr.w	sub_D710
		rts
; ---------------------------------------------------------------------------

loc_D6EC:					  ; CODE XREF: ROM:0000D49Ap
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_CursorMove
; ---------------------------------------------------------------------------
		bsr.w	sub_D710
		lea	((g_Buffer+$A)).l,a0
		addq.w	#$01,(a0)
		moveq	#$0000000B,d7

loc_D6FE:					  ; CODE XREF: ROM:0000D706j
		bsr.w	sub_D714
		addi.w	#$000C,d0
		dbf	d7,loc_D6FE
		bsr.w	sub_D710
		rts

; =============== S U B	R O U T	I N E =======================================


sub_D710:					  ; CODE XREF: ROM:0000D6E6p
						  ; ROM:0000D6F0p ...
		bsr.w	sub_D730
; End of function sub_D710


; =============== S U B	R O U T	I N E =======================================


sub_D714:					  ; CODE XREF: ROM:0000D420p
						  ; sub_D50C+4Ap ...
		movem.w	d0-d1/d7,-(sp)
		move.l	d2,-(sp)
		bsr.w	sub_D902
		move.l	(sp)+,d2
		bsr.w	sub_D756
		jsr	(WaitUntilVBlank).l
		movem.w	(sp)+,d0-d1/d7
		rts
; End of function sub_D714


; =============== S U B	R O U T	I N E =======================================


sub_D730:					  ; CODE XREF: ROM:loc_D41Ap
						  ; sub_D50C+44p ...
		lea	((g_Buffer+$A)).l,a0
		move.w	(a0),d0
		lea	((g_Buffer+$C)).l,a1
		move.w	(a1),d1
		mulu.w	#$0088,d0
		addi.w	#$00A0,d0
		mulu.w	#$0020,d1
		addi.w	#$00A0,d1
		move.b	#$FF,d2
		rts
; End of function sub_D730


; =============== S U B	R O U T	I N E =======================================


sub_D756:					  ; CODE XREF: sub_D714+Cp
		clr.w	d2
		lea	(g_VDPSpr01_Y).l,a0
		lea	(g_Buffer).l,a1
		move.w	g_Buffer+4-g_Buffer(a1),d3
		move.w	(unk_FF0F9C).l,d4
		sub.w	d3,d4
		andi.b	#$3F,d4
		cmpi.b	#$20,d4
		bcc.s	loc_D77C
		clr.b	d4

loc_D77C:					  ; CODE XREF: sub_D756+22j
		move.w	#$80B8,d3
		move.b	#$05,d2
		move.w	#$0098,(a0)
		tst.w	$00000006(a1)
		bne.s	loc_D790
		clr.w	(a0)

loc_D790:					  ; CODE XREF: sub_D756+36j
		tst.b	d4
		beq.s	loc_D796
		clr.w	(a0)

loc_D796:					  ; CODE XREF: sub_D756+3Cj
		move.b	d2,$00000002(a0)
		move.w	d3,$00000004(a0)
		move.w	#$008E,$00000006(a0)
		lea	$00000008(a0),a0
		move.w	#$0120,(a0)
		move.w	$00000008(a1),d0
		subi.w	#$0011,d0
		move.w	$00000006(a1),d1
		cmp.w	d0,d1
		bcs.s	loc_D7BE
		clr.w	(a0)

loc_D7BE:					  ; CODE XREF: sub_D756+64j
		tst.b	d4
		beq.s	loc_D7C4
		clr.w	(a0)

loc_D7C4:					  ; CODE XREF: sub_D756+6Aj
		move.b	d2,$00000002(a0)
		bset	#$0C,d3
		move.w	d3,$00000004(a0)
		move.w	#$008E,$00000006(a0)
		move.w	$00000016(a0),$0000000E(a0)
		rts
; End of function sub_D756


; =============== S U B	R O U T	I N E =======================================


sub_D7DE:					  ; CODE XREF: ROM:0000D436p
						  ; ROM:loc_D440p ...
		lea	(g_Buffer).l,a1
		lea	g_Buffer+6-g_Buffer(a1),a0
		subq.w	#$01,(a0)
		bpl.s	loc_D7F2
		clr.w	(a0)
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_D7F2:					  ; CODE XREF: sub_D7DE+Cj
		bra.s	loc_D814
; ---------------------------------------------------------------------------

loc_D7F4:					  ; CODE XREF: ROM:0000D46Cp
						  ; ROM:loc_D476p ...
		lea	(g_Buffer).l,a1
		lea	g_Buffer+6-g_Buffer(a1),a0
		move.w	$00000008(a1),d0
		subi.w	#$0011,d0
		move.w	(a0),d1
		cmp.w	d0,d1
		bcs.s	loc_D812
		move.w	d0,(a0)
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_D812:					  ; CODE XREF: sub_D7DE+2Cj
		addq.w	#$01,(a0)

loc_D814:					  ; CODE XREF: sub_D7DE:loc_D7F2j
		bsr.w	sub_D828
		bsr.w	sub_D710
		jsr	(WaitUntilVBlank).l
		ori	#$01,ccr
		rts
; End of function sub_D7DE


; =============== S U B	R O U T	I N E =======================================


sub_D828:					  ; CODE XREF: sub_D50C+40p
						  ; sub_D7DE:loc_D814p	...
		lea	(g_Buffer).l,a1
		lea	g_Buffer+6-g_Buffer(a1),a0
		move.w	(a0),d0
		lea	$00000084(a1),a0
		mulu.w	#$0048,d0
		ext.l	d0
		adda.l	d0,a0
		lea	((g_InventoryTilemap+$84)).l,a1
		move.w	#$0010,d7

loc_D84A:					  ; CODE XREF: sub_D828+32j
		movea.l	a1,a2
		move.w	#$0023,d6

loc_D850:					  ; CODE XREF: sub_D828+2Aj
		move.w	(a0)+,(a1)+
		dbf	d6,loc_D850
		lea	$00000080(a2),a1
		dbf	d7,loc_D84A
		jsr	(QueueInventoryWinTilemapDMA).l
		jsr	(j_EnableDMAQueueProcessing).l
		rts
; End of function sub_D828


; =============== S U B	R O U T	I N E =======================================


sub_D86C:					  ; CODE XREF: sub_D50C+1Ap
						  ; sub_EC60+14p ...
		movem.w	d0-d1,-(sp)
		lea	(g_Buffer).l,a1
		lea	g_Buffer+$84-g_Buffer(a1),a0
		mulu.w	#$0048,d1
		add.w	d0,d1
		add.w	d0,d1
		adda.l	d1,a0
		movem.w	(sp)+,d0-d1
		rts
; End of function sub_D86C


; =============== S U B	R O U T	I N E =======================================


sub_D88A:					  ; CODE XREF: ROM:0000D3C8p
						  ; sub_EAD4+44p
		movem.w	d0,-(sp)
		jsr	(UpdateControllerInputs).l
		movem.w	(sp)+,d4
		move.w	(unk_FF0F9C).l,d2
		lea	(g_Buffer).l,a1
		move.b	(a1),d1
		lea	(g_Controller1State).l,a0
		move.b	(a0),d0
		andi.b	#CTRLBF_DIRECTION,d0
		andi.b	#CTRLBF_DIRECTION,d1
		eor.b	d0,d1
		and.b	d0,d1
		beq.s	loc_D8BE
		move.b	d1,d0

loc_D8BE:					  ; CODE XREF: sub_D88A+30j
		move.b	$00000001(a1),d1
		andi.b	#$0F,d1
		cmp.b	d1,d0
		beq.s	loc_D8E0
		move.b	(a0),d1
		andi.b	#$F0,d1
		or.b	d1,d0
		move.b	(a0),(a1)
		move.b	d0,$00000001(a1)
		move.b	d0,(a0)
		move.w	d2,$00000002(a1)
		rts
; ---------------------------------------------------------------------------

loc_D8E0:					  ; CODE XREF: sub_D88A+3Ej
		move.b	$00000001(a1),d1
		andi.b	#$0F,d1
		move.w	d2,d0
		sub.w	$00000002(a1),d0
		cmp.w	d4,d0
		bcc.s	loc_D8F4
		clr.b	d1

loc_D8F4:					  ; CODE XREF: sub_D88A+66j
		move.b	(a0),d0
		andi.b	#$F0,d0
		or.b	d1,d0
		move.b	(a0),(a1)
		move.b	d0,(a0)
		rts
; End of function sub_D88A


; =============== S U B	R O U T	I N E =======================================


sub_D902:					  ; CODE XREF: sub_D714+6p
						  ; sub_EDAA+2p
		cmpi.b	#$01,d2
		bne.s	loc_D90A
		moveq	#$FFFFFFFF,d0

loc_D90A:					  ; CODE XREF: sub_D902+4j
		tst.b	d2
		bne.s	loc_D92C
		lea	(g_Buffer).l,a0
		move.w	g_Buffer+4-g_Buffer(a0),d2
		move.w	(unk_FF0F9C).l,d3
		sub.w	d2,d3
		andi.b	#$1F,d3
		cmpi.b	#$10,d3
		bcs.s	loc_D92C
		moveq	#$FFFFFFFF,d0

loc_D92C:					  ; CODE XREF: sub_D902+Aj
						  ; sub_D902+26j
		lea	(g_VDPSpr00_Y).l,a0
		move.w	d0,g_VDPSpr00_X-g_VDPSpr00_Y(a0)
		move.w	d1,(a0)
		move.b	#$0F,$00000002(a0)
		move.w	#$A0A8,d2
		move.w	d2,$00000004(a0)
		rts
; End of function sub_D902

; ---------------------------------------------------------------------------

loc_D948:					  ; CODE XREF: ROM:0000D966j
		movem.w	d0,-(sp)
		jsr	(WaitUntilVBlank).l
		jsr	(UpdateControllerInputs).l
		movem.w	(sp)+,d0
		move.b	(g_Controller1State).l,d1
		andi.b	#$F0,d1
		bne.s	loc_D948
		rts

; =============== S U B	R O U T	I N E =======================================


sub_D96A:					  ; CODE XREF: ROM:0000D3C2p
						  ; sub_D96A+10j ...
		jsr	(UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d0
		andi.b	#CTRLBF_BUTTONS,d0
		bne.s	sub_D96A
		jsr	(WaitUntilVBlank).l
		jsr	(UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d0
		andi.b	#CTRLBF_BUTTONS,d0
		bne.s	sub_D96A
		rts
; End of function sub_D96A


; =============== S U B	R O U T	I N E =======================================


sub_D996:					  ; CODE XREF: sub_D25C+Ap
		lea	((g_Buffer+$84)).l,a0
		lea	MenuCursor2BPP(pc),a1
		move.b	#$00,d3
		move.b	#$05,d4
		move.b	#$0A,d5
		move.b	#$0F,d6
		moveq	#$0000000F,d7

loc_D9B2:					  ; CODE XREF: sub_D996+24j
		move.l	d7,-(sp)
		bsr.w	Expand2BPPGfx
		move.l	(sp)+,d7
		dbf	d7,loc_D9B2
		lea	ArrowGraphic2BPP(pc),a1
		move.b	#$00,d3
		move.b	#$0B,d4
		move.b	#$0E,d5
		move.b	#$0F,d6
		bsr.w	Expand2BPPGfx
		bsr.w	Expand2BPPGfx
		bsr.w	Expand2BPPGfx
		bsr.w	Expand2BPPGfx
		lea	((g_Buffer+$84)).l,a0
		lea	($00001500).w,a1
		move.w	#$0140,d0
		move.w	#$0002,d1
		jsr	(DoDMACopy).l		  ; d0 = DMA Length
						  ; a0 = DMA Source
						  ; a1 = DMA Destination
		rts
; End of function sub_D996


; =============== S U B	R O U T	I N E =======================================


sub_D9FC:					  ; CODE XREF: sub_D25C+6p
						  ; DATA XREF: ROM:00000422t
		lea	((g_Buffer+$84)).l,a0
		lea	MenuFont(pc),a1
		move.b	#$01,d2
		move.b	#$00,d3
		bsr.w	Expand1bppTo4bpp
		move.w	#$009E,d6

loc_DA16:					  ; CODE XREF: sub_D9FC+1Ej
		bsr.w	Expand1bppTo4bpp
		dbf	d6,loc_DA16
		move.b	#$0A,d3
		move.b	#$0A,d4
		move.b	#$01,d5
		move.b	d3,d6
		bsr.w	sub_DA62
		move.b	#$0A,d3
		move.b	#$0A,d4
		move.b	#$03,d5
		move.b	d3,d6
		bsr.w	sub_DA62
		lea	((g_Buffer+$84)).l,a0
		lea	(0000000000).w,a1
		move.w	#$0A80,d0
		move.w	#$0002,d1
		jsr	(QueueDMAOp).l		  ; d0 - DMA Length
						  ; a0 - DMA Source
						  ; a1 - DMA Copy
		jsr	(FlushDMACopyQueue).l
		rts
; End of function sub_D9FC


; =============== S U B	R O U T	I N E =======================================


sub_DA62:					  ; CODE XREF: sub_D9FC+30p
						  ; sub_D9FC+42p
		lea	Unused1_2BPP(pc),a1
		bsr.w	Expand2BPPGfx
		lea	(Unused1_2BPP+6)(pc),a1
		bsr.w	Expand2BPPGfx
		lea	Unused2_2BPP(pc),a1
		bsr.w	Expand2BPPGfx
		lea	(Unused2_2BPP+4)(pc),a1
		bsr.w	Expand2BPPGfx
		rts
; End of function sub_DA62


; =============== S U B	R O U T	I N E =======================================


Expand2BPPGfx:					  ; CODE XREF: sub_D996+1Ep
						  ; sub_D996+3Cp ...
		move.w	#$0007,d7

loc_DA88:					  ; CODE XREF: Expand2BPPGfx+2Aj
		clr.l	d1
		move.w	(a1)+,d0
		bsr.w	Get2BitPixel
		bsr.w	Get2BitPixel
		bsr.w	Get2BitPixel
		bsr.w	Get2BitPixel
		bsr.w	Get2BitPixel
		bsr.w	Get2BitPixel
		bsr.w	Get2BitPixel
		bsr.w	Get2BitPixel
		move.l	d1,(a0)+
		dbf	d7,loc_DA88
		rts
; End of function Expand2BPPGfx


; =============== S U B	R O U T	I N E =======================================


Get2BitPixel:					  ; CODE XREF: Expand2BPPGfx+8p
						  ; Expand2BPPGfx+Cp ...
		rol.l	#$04,d1
		add.w	d0,d0
		bcs.w	loc_DACA
		add.w	d0,d0
		bcs.w	loc_DAC6
		or.b	d3,d1
		rts
; ---------------------------------------------------------------------------

loc_DAC6:					  ; CODE XREF: Get2BitPixel+Aj
		or.b	d4,d1
		rts
; ---------------------------------------------------------------------------

loc_DACA:					  ; CODE XREF: Get2BitPixel+4j
		add.w	d0,d0
		bcs.w	loc_DAD4
		or.b	d5,d1
		rts
; ---------------------------------------------------------------------------

loc_DAD4:					  ; CODE XREF: Get2BitPixel+18j
		or.b	d6,d1
		rts
; End of function Get2BitPixel


; =============== S U B	R O U T	I N E =======================================


Expand1bppTo4bpp:				  ; CODE XREF: sub_D9FC+12p
						  ; sub_D9FC:loc_DA16p
		move.w	#$0007,d7

loc_DADC:					  ; CODE XREF: Expand1bppTo4bpp+Ej
		move.b	(a1)+,d0
		bsr.w	sub_DAEC
		bsr.w	sub_DAEC
		dbf	d7,loc_DADC
		rts
; End of function Expand1bppTo4bpp


; =============== S U B	R O U T	I N E =======================================


sub_DAEC:					  ; CODE XREF: Expand1bppTo4bpp+6p
						  ; Expand1bppTo4bpp+Ap
		clr.w	d1
		bsr.w	sub_DAFA
		bsr.w	sub_DAFA
		move.w	d1,(a0)+
		rts
; End of function sub_DAEC


; =============== S U B	R O U T	I N E =======================================


sub_DAFA:					  ; CODE XREF: sub_DAEC+2p
						  ; sub_DAEC+6p
		rol.w	#$04,d1
		add.b	d0,d0
		bcc.s	loc_DB04
		or.b	d2,d1
		bra.s	loc_DB06
; ---------------------------------------------------------------------------

loc_DB04:					  ; CODE XREF: sub_DAFA+4j
		or.b	d3,d1

loc_DB06:					  ; CODE XREF: sub_DAFA+8j
		rol.w	#$04,d1
		add.b	d0,d0
		bcc.s	loc_DB10
		or.b	d2,d1
		bra.s	locret_DB12
; ---------------------------------------------------------------------------

loc_DB10:					  ; CODE XREF: sub_DAFA+10j
		or.b	d3,d1

locret_DB12:					  ; CODE XREF: sub_DAFA+14j
		rts
; End of function sub_DAFA


; =============== S U B	R O U T	I N E =======================================


sub_DB14:					  ; CODE XREF: ROM:0000DB60p
		jsr	(j_RefreshAndClearTextbox).l
		jsr	(j_QueueTextboxTilemapDMA).l
		jsr	(FlushDMACopyQueue).l
		rts
; End of function sub_DB14

; ---------------------------------------------------------------------------

loc_DB28:					  ; CODE XREF: ROM:0000D3E2j
		bsr.w	sub_D710
		lea	(g_Buffer).l,a0
		move.w	$00000006(a0),d1
		lsr.w	#$02,d1
		move.w	$0000000C(a0),d0
		add.w	d0,d1
		add.w	d1,d1
		move.w	$0000000A(a0),d0
		add.w	d1,d0
		lea	$0000005C(a0),a0
		move.b	(a0,d0.w),d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		beq.s	loc_DBBC
		cmpi.w	#$FFFF,d1
		beq.s	loc_DBBC
		move.l	d0,-(sp)
		bsr.s	sub_DB14
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_CursorSelect
; ---------------------------------------------------------------------------
		move.l	(sp)+,d0
		ext.w	d0
		move.w	d0,(word_FF1196).l
		movem.w	d0,-(sp)
		jsr	(j_GetItemUseStringIdx).l
		move.w	d1,d0
		jsr	(j_PrintString).l
		bsr.w	sub_D96A
		movem.w	(sp)+,d0
		move.l	d0,-(sp)
		cmpi.b	#$30,d0
		bne.s	loc_DB9A
		bsr.w	sub_DBC4
		bra.w	loc_DBB6
; ---------------------------------------------------------------------------

loc_DB9A:					  ; CODE XREF: ROM:0000DB90j
		cmpi.b	#$18,d0
		bne.s	loc_DBA8
		bsr.w	sub_DC10
		bra.w	loc_DBB6
; ---------------------------------------------------------------------------

loc_DBA8:					  ; CODE XREF: ROM:0000DB9Ej
		cmpi.b	#$24,d0
		bne.s	loc_DBB6
		bsr.w	sub_DC1C
		bra.w	*+4
; ---------------------------------------------------------------------------

loc_DBB6:					  ; CODE XREF: ROM:0000DB96j
						  ; ROM:0000DBA4j ...
		move.l	(sp)+,d0
		bra.w	loc_D34C
; ---------------------------------------------------------------------------

loc_DBBC:					  ; CODE XREF: ROM:0000DB56j
						  ; ROM:0000DB5Cj
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_ErrorBuzz
; ---------------------------------------------------------------------------
		bra.w	loc_D3C6

; =============== S U B	R O U T	I N E =======================================


sub_DBC4:					  ; CODE XREF: ROM:0000DB92p
		lea	(g_RoomVisitedFlags).l,a0
		move.w	#00642,d0
		clr.b	d1
		moveq	#$00000003,d7

loc_DBD2:					  ; CODE XREF: sub_DBC4:loc_DBE2j
		btst	d1,(a0)
		beq.s	loc_DBD8
		addq.l	#$01,d7

loc_DBD8:					  ; CODE XREF: sub_DBC4+10j
		addq.b	#$01,d1
		andi.b	#$07,d1
		bne.s	loc_DBE2
		addq.l	#$01,a0

loc_DBE2:					  ; CODE XREF: sub_DBC4+1Aj
		dbf	d0,loc_DBD2
		mulu.w	#00100,d7
		divu.w	#00642,d7
		andi.l	#$0000FFFF,d7
		cmpi.l	#0000000100,d7
		bcs.s	loc_DBFE
		moveq	#0000000100,d7

loc_DBFE:					  ; CODE XREF: sub_DBC4+36j
		move.l	d7,(g_PrintNumericDwordValue).l
		move.w	#$0019,d0
		jsr	(j_PrintString).l
		rts
; End of function sub_DBC4


; =============== S U B	R O U T	I N E =======================================


sub_DC10:					  ; CODE XREF: ROM:0000DBA0p
		move.w	#$001A,d0
		jsr	(j_PrintString).l
		rts
; End of function sub_DC10


; =============== S U B	R O U T	I N E =======================================


sub_DC1C:					  ; CODE XREF: ROM:0000DBAEp
		move.w	#$001B,d0
		jsr	(j_PrintString).l
		rts
; End of function sub_DC1C


; =============== S U B	R O U T	I N E =======================================


sub_DC28:					  ; CODE XREF: sub_D308+3Ep
		lea	InventoryItems(pc),a0
		lea	((g_Buffer+$5C)).l,a1
		movea.l	a1,a2
		moveq	#$00000027,d7
		clr.w	d6

loc_DC38:					  ; CODE XREF: sub_DC28+14j
		move.b	#$FF,(a2)+
		dbf	d7,loc_DC38
		moveq	#$00000027,d7

loc_DC42:					  ; CODE XREF: sub_DC28+2Cj
		move.b	(a0),d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.s	loc_DC52
		move.b	(a0),(a1)+
		addq.w	#$01,d6

loc_DC52:					  ; CODE XREF: sub_DC28+24j
		addq.l	#$01,a0
		dbf	d7,loc_DC42
		lsr.w	#$01,d6
		bcc.s	loc_DC5E
		addq.w	#$01,d6

loc_DC5E:					  ; CODE XREF: sub_DC28+32j
		lsl.w	#$02,d6
		addq.w	#$01,d6
		cmpi.w	#$0012,d6
		bcc.s	loc_DC6C
		move.w	#$0011,d6

loc_DC6C:					  ; CODE XREF: sub_DC28+3Ej
		lea	((g_Buffer+8)).l,a0
		move.w	d6,(a0)
		rts
; End of function sub_DC28

; ---------------------------------------------------------------------------
