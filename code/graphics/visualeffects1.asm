
; =============== S U B	R O U T	I N E =======================================

; 0,1 -	Warp-pad transition
; 2,3 -	Tree warp transition
; 4 - Black flash
; 5 - White flash
; 6 - Red flash
; 7 - Nole warp
;

DoVisualEffect:					  ; CODE XREF: sub_620A+ECp
						  ; sub_620A+100p ...
		movem.l	d0-a6,-(sp)
		lea	VisualFXTable(pc),a0
		move.w	d0,d1
		lsl.l	#$02,d1
		movea.l	(a0,d1.l),a0
		jsr	(a0)
		movem.l	(sp)+,d0-a6
		rts
; End of function DoVisualEffect

; ---------------------------------------------------------------------------
VisualFXTable:	dc.l WarpPadFx			  ; DATA XREF: DoVisualEffect+4t
		dc.l WarpPadFx
		dc.l TreeWarpFx
		dc.l TreeWarpFx
		dc.l BlackFlash
		dc.l WhiteFlash
		dc.l RedFlash
		dc.l NoleWarp
		dc.l NoleWarp
		dc.l NoleWarp
		dc.l NoleWarp

; =============== S U B	R O U T	I N E =======================================


WarpPadFx:					  ; CODE XREF: sub_620A+114p
						  ; DATA XREF: sub_44Ct ...
		lea	(g_Buffer).l,a5
		movea.l	a5,a1
		lea	(g_Pal0Base).l,a0
		moveq	#$00000037,d7

loc_E164:					  ; CODE XREF: WarpPadFx+12j
		move.w	(a0)+,(a1)+
		dbf	d7,loc_E164
		movea.l	a5,a0
		lea	$00000070(a0),a1
		move.w	#$0187,d7

loc_E174:					  ; CODE XREF: WarpPadFx+50j
		move.w	(a0)+,d0
		move.w	d0,d1
		move.w	d0,d2
		andi.w	#$0E00,d0
		subi.w	#$0200,d0
		bpl.s	loc_E186
		clr.w	d0

loc_E186:					  ; CODE XREF: WarpPadFx+2Ej
		andi.w	#$00E0,d1
		subi.w	#$0020,d1
		bpl.s	loc_E192
		clr.w	d1

loc_E192:					  ; CODE XREF: WarpPadFx+3Aj
		andi.w	#$000E,d2
		subi.w	#$0002,d2
		bpl.s	loc_E19E
		clr.w	d2

loc_E19E:					  ; CODE XREF: WarpPadFx+46j
		or.w	d1,d0
		or.w	d2,d0
		move.w	d0,(a1)+
		dbf	d7,loc_E174
		move.w	#$0000,d7

loc_E1AC:					  ; CODE XREF: WarpPadFx+7Aj
		move.w	#$FFE8,d0
		move.w	#$0050,d5

loc_E1B4:					  ; CODE XREF: WarpPadFx+76j
		move.w	#$0000,d6

loc_E1B8:					  ; CODE XREF: WarpPadFx+70j
		movem.w	d0/d5-d7,-(sp)
		bsr.w	sub_E1DE
		movem.w	(sp)+,d0/d5-d7
		dbf	d6,loc_E1B8
		addq.w	#$01,d0
		dbf	d5,loc_E1B4
		dbf	d7,loc_E1AC
		move.w	#$8F02,d0
		jsr	(SetVDPReg).l
		rts
; End of function WarpPadFx


; =============== S U B	R O U T	I N E =======================================


sub_E1DE:					  ; CODE XREF: WarpPadFx+68p
		lea	$00000380(a5),a0
		moveq	#$00000007,d7
		move.w	d0,d1

loc_E1E6:					  ; CODE XREF: sub_E1DE+24j
		move.w	d1,d2
		bpl.s	loc_E1EC
		clr.w	d2

loc_E1EC:					  ; CODE XREF: sub_E1DE+Aj
		muls.w	d2,d2
		lsr.l	#$04,d2
		cmpi.l	#$000000B7,d2
		bcs.s	loc_E1FC
		move.b	#$DF,d2

loc_E1FC:					  ; CODE XREF: sub_E1DE+18j
		move.b	d2,(a0)+
		addi.w	#$0006,d1
		dbf	d7,loc_E1E6
		jsr	(WaitUntilVBlank).l

loc_E20C:					  ; CODE XREF: sub_E1DE+36j
						  ; sub_E1DE+4Cj
		btst	#$02,(VDP_CTRL_REG+1).l
		beq.s	loc_E20C

loc_E216:					  ; CODE XREF: sub_E1DE+40j
		btst	#$02,(VDP_CTRL_REG+1).l
		bne.s	loc_E216
		move.b	(VDP_HVCTR_REG).l,d2
		cmpi.b	#$FF,d2
		bne.s	loc_E20C
		lea	$00000380(a5),a4
		moveq	#$00000007,d7
		moveq	#$00000007,d0

loc_E234:					  ; CODE XREF: sub_E1DE+6Aj
		movem.w	d0/d7,-(sp)
		bsr.w	sub_E24E
		movem.w	(sp)+,d0/d7
		bcs.w	locret_E24C
		subi.b	#$01,d0
		dbf	d7,loc_E234

locret_E24C:					  ; CODE XREF: sub_E1DE+62j
		rts
; End of function sub_E1DE


; =============== S U B	R O U T	I N E =======================================


sub_E24E:					  ; CODE XREF: sub_E1DE+5Ap
		move.b	(a4)+,d1
		cmpi.b	#$17,d1
		bcc.s	loc_E25A
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_E25A:					  ; CODE XREF: sub_E24E+6j
		move.b	d0,d2
		andi.w	#$0007,d2
		mulu.w	#$0070,d2
		lea	(a5,d2.w),a0
		move.l	d1,-(sp)
		lea	(VDP_DATA_REG).l,a1
		lea	(VDP_CTRL_REG).l,a2
		move.l	#$C0000000,(a2)
		movem.l	(a0)+,d0-d7
		move.l	d0,(a1)
		move.l	d1,(a1)
		move.l	d2,(a1)
		move.l	d3,(a1)
		move.l	d4,(a1)
		move.l	d5,(a1)
		move.l	d6,(a1)
		move.l	d7,(a1)
		movem.l	(a0)+,d0-d7
		move.l	d0,(a1)
		move.l	d1,(a1)
		move.l	d2,(a1)
		move.l	d3,(a1)
		move.l	d4,(a1)
		move.l	d5,(a1)
		move.l	d6,(a1)
		move.l	d7,(a1)
		movem.l	(a0)+,d0-d7
		move.l	d0,(a1)
		move.l	d1,(a1)
		move.l	d2,(a1)
		move.l	d3,(a1)
		move.l	d4,(a1)
		move.l	d5,(a1)
		move.l	d6,(a1)
		move.l	d7,(a1)
		movem.l	(a0)+,d0-d3
		move.l	d0,(a1)
		move.l	d1,(a1)
		move.l	d2,(a1)
		move.l	d3,(a1)
		move.l	(sp)+,d1

loc_E2C6:					  ; CODE XREF: sub_E24E+80j
						  ; sub_E24E+96j ...
		btst	#$02,(VDP_CTRL_REG+1).l
		beq.s	loc_E2C6

loc_E2D0:					  ; CODE XREF: sub_E24E+8Aj
		btst	#$02,(VDP_CTRL_REG+1).l
		bne.s	loc_E2D0
		move.b	(VDP_HVCTR_REG).l,d2
		cmpi.b	#$17,d2
		bcs.s	loc_E2C6
		cmpi.b	#$B7,d2
		bcs.s	loc_E2F2
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_E2F2:					  ; CODE XREF: sub_E24E+9Cj
		addq.b	#$01,d2
		cmp.b	d1,d2
		bcs.s	loc_E2C6
		tst.b	d0
		rts
; End of function sub_E24E

; ---------------------------------------------------------------------------
		move.w	#$8124,(VDP_CTRL_REG).l
		move.w	#$8124,(g_VDPReg01_ModeSet2).l
		rts

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

TreeWarpFx:					  ; DATA XREF: ROM:0000E130o
						  ; ROM:0000E134o

var_8E		= -$8E
var_8C		= -$8C
var_8A		= -$8A
var_88		= -$88
var_86		= -$86
var_84		= -$84
var_82		= -$82

		link	a6,#-$008E
		move.w	d0,var_82(a6)
		move.w	(g_HorizontalScrollData).l,var_84(a6)
		move.w	(g_VSRAMData).l,var_86(a6)
		move.w	#$0006,var_88(a6)
		move.w	#$0003,var_8A(a6)
		move.w	#$0008,var_8C(a6)
		move.w	#$001C,var_8E(a6)
		bsr.w	sub_E3F8
		move.w	(g_HorizontalScrollData).l,d6
		jsr	(FillHScrollData).l
		jsr	(FillHScrollDataOffset1).l
		jsr	(FlushDMACopyQueue).l
		moveq	#$0000000B,d0
		moveq	#$00000003,d1
		jsr	(OrVDPReg).l
		cmpi.w	#$0002,var_82(a6)
		bne.s	loc_E372
		bsr.w	sub_E398
		bra.s	loc_E376
; ---------------------------------------------------------------------------

loc_E372:					  ; CODE XREF: TreeWarpFx+5Cj
		bsr.w	sub_E3C0

loc_E376:					  ; CODE XREF: TreeWarpFx+62j
		moveq	#$0000000B,d0
		moveq	#$0000000C,d1
		jsr	(MaskVDPReg).l
		move.w	var_84(a6),(g_HorizontalScrollData).l
		move.w	var_86(a6),(g_VSRAMData).l
		bsr.w	sub_E40C
		unlk	a6
		rts
; End of function TreeWarpFx


; =============== S U B	R O U T	I N E =======================================


sub_E398:					  ; CODE XREF: TreeWarpFx+5Ep
		move.w	#$00FF,d7

loc_E39C:					  ; CODE XREF: sub_E398+24j
		move.l	d7,-(sp)
		bsr.w	sub_E420
		bsr.w	sub_E43A
		bsr.w	sub_E446
		bsr.w	sub_E48E
		jsr	(WaitUntilVBlank).l
		move.l	(sp)+,d7
		subq.w	#$01,d7
		cmpi.w	#$0080,d7
		bcc.s	loc_E39C
		rts
; End of function sub_E398


; =============== S U B	R O U T	I N E =======================================


sub_E3C0:					  ; CODE XREF: TreeWarpFx:loc_E372p
		lea	(g_Pal0Active).l,a0
		moveq	#$00000037,d7

loc_E3C8:					  ; CODE XREF: sub_E3C0+Aj
		clr.w	(a0)+
		dbf	d7,loc_E3C8
		jsr	(InitFadeFromBlackParams).l
		move.w	#$007F,d7

loc_E3D8:					  ; CODE XREF: sub_E3C0+32j
		move.l	d7,-(sp)
		bsr.w	sub_E420
		bsr.w	sub_E43A
		bsr.w	sub_E446
		bsr.w	sub_E4C0
		jsr	(WaitUntilVBlank).l
		move.l	(sp)+,d7
		dbf	d7,loc_E3D8
		rts
; End of function sub_E3C0


; =============== S U B	R O U T	I N E =======================================


sub_E3F8:					  ; CODE XREF: TreeWarpFx+30p
		lea	(g_Pal0Base).l,a0
		lea	-$00000080(a6),a1
		moveq	#$0000001F,d7

loc_E404:					  ; CODE XREF: sub_E3F8+Ej
		move.l	(a0)+,(a1)+
		dbf	d7,loc_E404
		rts
; End of function sub_E3F8


; =============== S U B	R O U T	I N E =======================================


sub_E40C:					  ; CODE XREF: TreeWarpFx+82p
		lea	(g_Pal0Base).l,a1
		lea	-$00000080(a6),a0
		moveq	#$0000001F,d7

loc_E418:					  ; CODE XREF: sub_E40C+Ej
		move.l	(a0)+,(a1)+
		dbf	d7,loc_E418
		rts
; End of function sub_E40C


; =============== S U B	R O U T	I N E =======================================


sub_E420:					  ; CODE XREF: sub_E398+6p
						  ; sub_E3C0+1Ap
		move.w	d7,d0
		tst.b	d0
		bpl.s	loc_E428
		neg.b	d0

loc_E428:					  ; CODE XREF: sub_E420+4j
		ext.w	d0
		cmpi.w	#$0080,d0
		bcs.s	loc_E434
		move.w	#$007F,d0

loc_E434:					  ; CODE XREF: sub_E420+Ej
		move.w	d0,-$0000008A(a6)
		rts
; End of function sub_E420


; =============== S U B	R O U T	I N E =======================================


sub_E43A:					  ; CODE XREF: sub_E398+Ap
						  ; sub_E3C0+1Ep
		move.w	d7,d0
		tst.b	d0
		bpl.s	loc_E442
		neg.b	d0

loc_E442:					  ; CODE XREF: sub_E43A+4j
		ext.w	d0
		rts
; End of function sub_E43A


; =============== S U B	R O U T	I N E =======================================


sub_E446:					  ; CODE XREF: sub_E398+Ep
						  ; sub_E3C0+22p
		move.w	-$00000084(a6),d2
		lea	(g_HorizontalScrollData).l,a0
		move.w	d7,d1
		mulu.w	-$00000088(a6),d1
		move.w	#$00FF,d6

loc_E45A:					  ; CODE XREF: sub_E446+36j
		move.w	d1,d0
		jsr	(sub_22EF0).l
		move.w	-$0000008A(a6),d3
		bne.s	loc_E46C
		clr.l	d0
		bra.s	loc_E46E
; ---------------------------------------------------------------------------

loc_E46C:					  ; CODE XREF: sub_E446+20j
		muls.w	d3,d0

loc_E46E:					  ; CODE XREF: sub_E446+24j
		lsr.l	#$08,d0
		lsr.l	#$02,d0
		add.w	d2,d0
		move.w	d0,(a0)+
		move.w	d0,(a0)+
		add.w	-$0000008C(a6),d1
		dbf	d6,loc_E45A
		jsr	(QueueHScrollDMAUpdate).l
		jsr	(j_EnableDMAQueueProcessing).l
		rts
; End of function sub_E446


; =============== S U B	R O U T	I N E =======================================


sub_E48E:					  ; CODE XREF: sub_E398+12p
		cmpi.w	#$00A0,d7
		bcs.s	loc_E496
		rts
; ---------------------------------------------------------------------------

loc_E496:					  ; CODE XREF: sub_E48E+4j
		move.w	-$0000008E(a6),d0
		bne.s	loc_E49E
		rts
; ---------------------------------------------------------------------------

loc_E49E:					  ; CODE XREF: sub_E48E+Cj
		subq.w	#$01,d0
		move.w	d0,-$0000008E(a6)
		andi.w	#$0003,d0
		beq.s	loc_E4AC
		rts
; ---------------------------------------------------------------------------

loc_E4AC:					  ; CODE XREF: sub_E48E+1Aj
		moveq	#$00000037,d7
		lea	(g_Pal0Base).l,a0
		move.l	d7,-(sp)
		jsr	(sub_F8C6).l
		move.l	(sp)+,d7
		rts
; End of function sub_E48E


; =============== S U B	R O U T	I N E =======================================


sub_E4C0:					  ; CODE XREF: sub_E3C0+26p
		move.w	-$0000008E(a6),d0
		bne.s	loc_E4C8
		rts
; ---------------------------------------------------------------------------

loc_E4C8:					  ; CODE XREF: sub_E4C0+4j
		subq.w	#$01,d0
		move.w	d0,-$0000008E(a6)
		andi.w	#$0003,d0
		beq.s	loc_E4D6
		rts
; ---------------------------------------------------------------------------

loc_E4D6:					  ; CODE XREF: sub_E4C0+12j
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		moveq	#$00000037,d5
		jsr	(DarkenPalette).l
		rts
; End of function sub_E4C0


; =============== S U B	R O U T	I N E =======================================


BlackFlash:					  ; DATA XREF: ROM:0000E138o
		clr.l	d2
		bra.s	loc_E4F2
; ---------------------------------------------------------------------------

WhiteFlash:					  ; CODE XREF: ContinueKazaltWarpFx+16j
						  ; DATA XREF: ROM:0000E13Co
		moveq	#$FFFFFFFF,d2

loc_E4F2:					  ; CODE XREF: BlackFlash+2j
		jsr	(CopyBasePalleteToActivePalette).l
		lea	(g_Pal0Active).l,a0
		movea.l	a0,a1
		moveq	#$00000039,d7
		moveq	#$0000000E,d6

loc_E504:					  ; CODE XREF: BlackFlash+40j
		move.b	(a0)+,d0
		and.l	d6,d0
		move.b	(a0),d1
		and.w	d6,d1
		add.w	d1,d0
		move.b	(a0)+,d1
		lsr.b	#$04,d1
		and.w	d6,d1
		add.w	d1,d0
		divu.w	#$0003,d0
		tst.b	d2
		beq.s	loc_E520
		not.w	d0

loc_E520:					  ; CODE XREF: BlackFlash+30j
		and.w	d6,d0
		move.b	d0,(a1)+
		move.b	d0,d1
		lsl.b	#$04,d1
		or.b	d1,d0
		move.b	d0,(a1)+
		dbf	d7,loc_E504
		jsr	(j_EnableDMAQueueProcessing).l
		rts
; End of function BlackFlash


; =============== S U B	R O U T	I N E =======================================


RedFlash:					  ; DATA XREF: ROM:0000E140o
		jsr	(CopyBasePalleteToActivePalette).l
		lea	(g_Pal0Active).l,a0
		moveq	#$00000039,d7

loc_E546:					  ; CODE XREF: RedFlash+26j
		move.b	(a0),d0
		lsr.b	#$03,d0
		move.b	d0,(a0)+
		move.b	(a0),d0
		move.b	d0,d1
		lsr.b	#$03,d0
		andi.b	#$20,d0
		andi.b	#$0E,d1
		or.b	d1,d0
		move.b	d0,(a0)+
		dbf	d7,loc_E546
		jsr	(j_EnableDMAQueueProcessing).l
		rts
; End of function RedFlash


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

NoleWarp:					  ; DATA XREF: ROM:0000E144o
						  ; ROM:0000E148o ...

var_134		= -$134
var_132		= -$132
var_130		= -$130
var_128		= -$128
var_126		= -$126
var_124		= -$124
var_122		= -$122
var_120		= -$120
var_80		= -$80

		link	a6,#-$0134
		move.w	d0,var_126(a6)
		cmpi.b	#$09,d0
		bcc.s	loc_E586
		move.w	#$0120,var_122(a6)
		move.w	#$00F0,var_124(a6)
		bra.s	loc_E596
; ---------------------------------------------------------------------------

loc_E586:					  ; CODE XREF: NoleWarp+Cj
		move.w	#$0130,var_122(a6)
		move.w	#$00C8,var_124(a6)
		subq.w	#$02,var_126(a6)

loc_E596:					  ; CODE XREF: NoleWarp+1Aj
		lea	(g_Pal0Base).l,a0
		lea	var_80(a6),a1
		bsr.w	sub_E780
		lea	var_120(a6),a0
		moveq	#$00000027,d7

loc_E5AA:					  ; CODE XREF: NoleWarp+48j
		clr.w	(a0)+
		move.b	#$FF,(a0)+
		clr.b	(a0)+
		dbf	d7,loc_E5AA
		cmpi.w	#$0007,var_126(a6)
		bne.s	loc_E608
		clr.w	var_128(a6)
		clr.w	var_134(a6)
		move.w	#$001C,var_132(a6)
		clr.w	var_130(a6)
		bsr.w	sub_E866
		jsr	(InitFadeToBlackParams).l
		moveq	#$0000003C,d0
		jsr	(Sleep).l		  ; Sleeps for d0 frames
		bsr.w	sub_E78A
		bsr.w	sub_E78A
		bsr.w	sub_E78A
		moveq	#$0000003C,d0
		jsr	(Sleep).l		  ; Sleeps for d0 frames
		lea	(g_Pal0Active).l,a0
		lea	(g_Pal0Base).l,a1
		bsr.w	sub_E780
		bra.s	loc_E66C
; ---------------------------------------------------------------------------

loc_E608:					  ; CODE XREF: NoleWarp+52j
		move.w	#$0168,var_128(a6)
		move.w	(0000000300).w,var_134(a6)
		clr.w	var_132(a6)
		move.w	#$001C,var_130(a6)
		bsr.w	sub_E852
		jsr	(InitFadeToBlackParams).l
		moveq	#$00000002,d7
		bsr.w	sub_E7AA
		lea	(g_Pal0Active).l,a0
		lea	(g_Pal0Base).l,a1
		moveq	#$0000000F,d7
		bsr.w	sub_E782
		lea	(g_Pal0Active).l,a0
		move.w	#$0EEE,d0
		moveq	#$0000003F,d7

loc_E64C:					  ; CODE XREF: NoleWarp+E4j
		move.w	d0,(a0)+
		dbf	d7,loc_E64C
		jsr	(QueueFullPaletteDMA).l
		jsr	(FlushDMACopyQueue).l
		moveq	#$0000003B,d7

loc_E660:					  ; CODE XREF: NoleWarp+FEj
		move.l	d7,-(sp)
		bsr.w	sub_E8F8
		move.l	(sp)+,d7
		dbf	d7,loc_E660

loc_E66C:					  ; CODE XREF: NoleWarp+9Cj
		lea	(g_Buffer).l,a0
		move.l	#$0DDD0000,(a0)+
		move.l	#$DEEED000,(a0)+
		move.l	#$0DDD0000,(a0)+
		moveq	#$00000004,d7

loc_E686:					  ; CODE XREF: NoleWarp+11Ej
		clr.l	(a0)+
		dbf	d7,loc_E686
		lea	(g_Buffer).l,a0
		lea	($00002000).w,a1
		moveq	#$00000020,d0
		moveq	#$00000002,d1
		jsr	(QueueDMAOp).l		  ; d0 - DMA Length
						  ; a0 - DMA Source
						  ; a1 - DMA Copy
		jsr	(FlushDMACopyQueue).l
		cmpi.w	#$0007,var_126(a6)
		bne.s	loc_E6B4
		move.w	#$0258,d7
		bra.s	loc_E6B8
; ---------------------------------------------------------------------------

loc_E6B4:					  ; CODE XREF: NoleWarp+142j
		move.w	#$0168,d7

loc_E6B8:					  ; CODE XREF: NoleWarp+148j
						  ; NoleWarp+1ACj
		movem.w	d7,-(sp)
		jsr	(UpdateControllerInputs).l
		bsr.w	sub_E8F8
		bsr.w	sub_E8A8
		move.w	#$023A,d0
		bsr.w	sub_E87A
		jsr	(QueueFullPaletteDMA).l
		move.b	(g_Controller1State).l,d1
		jsr	(EnableDMAQueueProcessing).l
		clr.w	d0
		jsr	(Sleep).l		  ; Sleeps for d0 frames
		cmpi.w	#$0007,var_126(a6)
		bne.s	loc_E708
		move.w	var_128(a6),d0
		addq.w	#$01,d0
		cmpi.w	#$01A4,d0
		bcs.s	loc_E702
		addq.w	#$01,d0

loc_E702:					  ; CODE XREF: NoleWarp+194j
		move.w	d0,var_128(a6)
		bra.s	loc_E712
; ---------------------------------------------------------------------------

loc_E708:					  ; CODE XREF: NoleWarp+188j
		subq.w	#$01,var_128(a6)
		bpl.s	loc_E712
		clr.w	var_128(a6)

loc_E712:					  ; CODE XREF: NoleWarp+19Cj
						  ; NoleWarp+1A2j
		movem.w	(sp)+,d7
		dbf	d7,loc_E6B8
		lea	var_80(a6),a0
		lea	(g_Pal0Base).l,a1
		bsr.w	sub_E780
		cmpi.w	#$0007,var_126(a6)
		bne.s	loc_E742
		lea	(g_Pal0Active).l,a0
		lea	(g_Pal0Base).l,a1
		bsr.w	sub_E780
		bra.s	loc_E768
; ---------------------------------------------------------------------------

loc_E742:					  ; CODE XREF: NoleWarp+1C4j
		moveq	#$0000001E,d0
		jsr	(Sleep).l		  ; Sleeps for d0 frames
		jsr	(InitFadeFromBlackParams).l
		moveq	#$00000003,d7
		bsr.w	sub_E79A
		jsr	(WaitUntilVBlank).l
		bsr.w	sub_E78A
		bsr.w	sub_E78A
		bsr.w	sub_E78A

loc_E768:					  ; CODE XREF: NoleWarp+1D6j
		lea	var_80(a6),a0
		lea	(g_Pal0Base).l,a1
		bsr.w	sub_E780
		clr.w	(g_Pal0Active).l
		unlk	a6
		rts
; End of function NoleWarp


; =============== S U B	R O U T	I N E =======================================


sub_E780:					  ; CODE XREF: NoleWarp+36p
						  ; NoleWarp+98p ...
		moveq	#$0000003F,d7
; End of function sub_E780


; =============== S U B	R O U T	I N E =======================================


sub_E782:					  ; CODE XREF: NoleWarp+D2p
						  ; sub_E782+2j
		move.w	(a0)+,(a1)+
		dbf	d7,sub_E782
		rts
; End of function sub_E782


; =============== S U B	R O U T	I N E =======================================


sub_E78A:					  ; CODE XREF: NoleWarp+78p
						  ; NoleWarp+7Cp ...
		clr.w	d7
		bsr.w	sub_E79A
		moveq	#0000000019,d0
		jsr	(Sleep).l		  ; Sleeps for d0 frames
		rts
; End of function sub_E78A


; =============== S U B	R O U T	I N E =======================================


sub_E79A:					  ; CODE XREF: NoleWarp+1E8p
						  ; sub_E78A+2p
		bsr.w	sub_E7AA
		jsr	(QueueFullPaletteDMA).l
		jmp	(EnableDMAQueueProcessing).l
; End of function sub_E79A


; =============== S U B	R O U T	I N E =======================================


sub_E7AA:					  ; CODE XREF: NoleWarp+C0p
						  ; sub_E79Ap ...
		move.l	d7,-(sp)
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		move.w	(g_PaletteDarkenCurrentBrightness).l,d3
		move.w	(g_PaletteDarkenExtent).l,d4
		move.w	(g_PaletteDarkenTargetBrightness).l,d7
		moveq	#$0000000F,d5

loc_E7CC:					  ; CODE XREF: sub_E7AA+2Cj
		move.w	(a0)+,d0
		jsr	(DarkenColour).l
		move.w	d0,(a1)+
		dbf	d5,loc_E7CC
		add.w	d4,d3
		move.w	d3,(g_PaletteDarkenCurrentBrightness).l
		move.l	(sp)+,d7
		dbf	d7,sub_E7AA
		rts
; End of function sub_E7AA

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_E87A

loc_E7EA:					  ; CODE XREF: sub_E87A+8j
		move.w	-$00000128(a6),d0
		andi.w	#$001E,d0
		bne.s	loc_E7F8
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_KazaltWarp
; ---------------------------------------------------------------------------

loc_E7F8:					  ; CODE XREF: sub_E87A-88j
		lsr.w	#$02,d0
		lsl.w	#$02,d0
		lea	KazaltWarpPalette(pc),a0
		lea	(a0,d0.w),a0
		lea	((g_Pal0Active+$1A)).l,a1
		move.l	(a0),(a1)
		rts
; END OF FUNCTION CHUNK	FOR sub_E87A
; ---------------------------------------------------------------------------
