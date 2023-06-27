
; =============== S U B	R O U T	I N E =======================================


sub_39C46:					  ; CODE XREF: ROM:00039A0Ep
		tst.b	-$00000018(a6)
		bpl.s	loc_39C4E
		rts
; ---------------------------------------------------------------------------

loc_39C4E:					  ; CODE XREF: sub_39C46+4j
		cmp.w	-$00000002(a6),d0
		bcs.s	loc_39C56
		rts
; ---------------------------------------------------------------------------

loc_39C56:					  ; CODE XREF: sub_39C46+Cj
		move.w	-$0000000C(a6),d0
		ext.l	d0
		clr.l	d6
		andi.b	#$01,d0
		bne.s	loc_39C9A
		lea	((g_Pal0Base+2)).l,a0
		moveq	#$0000000E,d7

loc_39C6C:					  ; CODE XREF: sub_39C46+2Cj
		lea	Blue(pc),a1
		bsr.s	sub_39BF2
		dbf	d7,loc_39C6C
		lea	((g_Pal1Base+2)).l,a0
		moveq	#$0000000E,d7

loc_39C7E:					  ; CODE XREF: sub_39C46+40j
		lea	Yellow(pc),a1
		bsr.w	sub_39BF2
		dbf	d7,loc_39C7E
		addq.b	#$01,-$0000001D(a6)
		cmpi.b	#$5A,d6
		bcs.s	loc_39C9A
		move.b	#$FF,-$00000018(a6)

loc_39C9A:					  ; CODE XREF: sub_39C46+1Cj
						  ; sub_39C46+4Cj
		addq.w	#$01,-$0000000C(a6)
		rts
; End of function sub_39C46

; ---------------------------------------------------------------------------
Blue:		dc.w $0E00			  ; DATA XREF: sub_39C46:loc_39C6Ct
Yellow:		dc.w $00EE			  ; DATA XREF: sub_39C46:loc_39C7Et

; =============== S U B	R O U T	I N E =======================================


sub_39CA4:					  ; CODE XREF: ROM:00039A06p
		tst.b	-$00000019(a6)
		bpl.s	loc_39CAC
		rts
; ---------------------------------------------------------------------------

loc_39CAC:					  ; CODE XREF: sub_39CA4+4j
		cmp.w	-$00000002(a6),d0
		bcs.s	loc_39CB4
		rts
; ---------------------------------------------------------------------------

loc_39CB4:					  ; CODE XREF: sub_39CA4+Cj
		move.w	-$0000000E(a6),d0
		ext.l	d0
		clr.l	d6
		andi.b	#$03,d0
		bne.s	loc_39CE6
		lea	(g_Pal0Base).l,a0
		lea	Title3Palette(pc),a1
		moveq	#$0000000F,d7

loc_39CCE:					  ; CODE XREF: sub_39CA4+2Ej
		bsr.w	sub_39CEC
		dbf	d7,loc_39CCE
		addq.b	#$01,-$0000001D(a6)
		cmpi.b	#$2D,d6
		bcs.s	loc_39CE6
		move.b	#$FF,-$00000019(a6)

loc_39CE6:					  ; CODE XREF: sub_39CA4+1Cj
						  ; sub_39CA4+3Aj
		addq.w	#$01,-$0000000E(a6)
		rts
; End of function sub_39CA4


; =============== S U B	R O U T	I N E =======================================


sub_39CEC:					  ; CODE XREF: sub_39CA4:loc_39CCEp
		moveq	#$0000000E,d5
		move.w	(a0),d1
		move.w	d1,d2
		move.w	d1,d3
		move.w	(a1),d4
		and.w	d5,d1
		and.w	d5,d4
		subq.w	#$02,d1
		bmi.s	loc_39D02
		cmp.w	d1,d4
		bcs.s	loc_39D06

loc_39D02:					  ; CODE XREF: sub_39CEC+10j
		move.w	d4,d1
		addq.b	#$01,d6

loc_39D06:					  ; CODE XREF: sub_39CEC+14j
		lsl.w	#$04,d5
		move.w	(a1),d4
		and.w	d5,d2
		and.w	d5,d4
		subi.w	#$0020,d2
		bmi.s	loc_39D18
		cmp.w	d2,d4
		bcs.s	loc_39D1C

loc_39D18:					  ; CODE XREF: sub_39CEC+26j
		move.w	d4,d2
		addq.b	#$01,d6

loc_39D1C:					  ; CODE XREF: sub_39CEC+2Aj
		lsl.w	#$04,d5
		move.w	(a1)+,d4
		and.w	d5,d3
		and.w	d5,d4
		subi.w	#$0200,d3
		bmi.s	loc_39D2E
		cmp.w	d3,d4
		bcs.s	loc_39D32

loc_39D2E:					  ; CODE XREF: sub_39CEC+3Cj
		move.w	d4,d3
		addq.b	#$01,d6

loc_39D32:					  ; CODE XREF: sub_39CEC+40j
		or.w	d2,d1
		or.w	d3,d1
		move.w	d1,(a0)+
		rts
; End of function sub_39CEC


; =============== S U B	R O U T	I N E =======================================


sub_39D3A:					  ; CODE XREF: ROM:000399FEp
		tst.b	-$00000018(a6)
		bmi.s	loc_39D42
		rts
; ---------------------------------------------------------------------------

loc_39D42:					  ; CODE XREF: sub_39D3A+4j
		tst.b	-$0000001A(a6)
		bpl.s	loc_39D4A
		rts
; ---------------------------------------------------------------------------

loc_39D4A:					  ; CODE XREF: sub_39D3A+Cj
		lea	Title3PaletteHighlight(pc),a0
		jsr	(j_LoadPaletteToRAM).l
		lea	(g_Pal1Base).l,a0
		moveq	#$0000000F,d7

loc_39D5C:					  ; CODE XREF: sub_39D3A+24j
		clr.w	(a0)+
		dbf	d7,loc_39D5C
		addq.b	#$01,-$0000001A(a6)
		addq.b	#$01,-$0000001D(a6)
		bsr.w	sub_39D76
		move.b	#$FF,-$0000001A(a6)
		rts
; End of function sub_39D3A


; =============== S U B	R O U T	I N E =======================================


sub_39D76:					  ; CODE XREF: DisplayTitle:loc_39948p
						  ; sub_39D3A+30p
		lea	(unk_FF34C2).l,a5
		movea.l	a5,a0
		move.w	#$06FF,d7

loc_39D82:					  ; CODE XREF: sub_39D76+Ej
		clr.w	(a0)+
		dbf	d7,loc_39D82
		lea	(g_Buffer).l,a0
		clr.w	d6
		clr.w	d5
		clr.w	d7
		move.b	(a0)+,d5
		subq.w	#$01,d5
		move.b	(a0)+,d7
		subq.w	#$01,d7
		movea.l	a5,a1

loc_39D9E:					  ; CODE XREF: sub_39D76+38j
		movea.l	a1,a2
		moveq	#$00000027,d6
		move.w	d5,d6

loc_39DA4:					  ; CODE XREF: sub_39D76+30j
		move.w	(a0)+,(a1)+
		dbf	d6,loc_39DA4
		lea	$00000080(a2),a1
		dbf	d7,loc_39D9E
		movea.l	a5,a0
		lea	($0000C000).l,a1
		move.w	#$0700,d0
		moveq	#$00000002,d1
		jsr	(j_QueueDMAOp).l
		move.w	#$E000,d0
		move.w	#$08C0,d1
		clr.l	d2
		jsr	(j_DoDMAFill).l
		rts
; End of function sub_39D76


; =============== S U B	R O U T	I N E =======================================


sub_39DD8:					  ; CODE XREF: ROM:000399FAp
		tst.b	-$0000001B(a6)
		bpl.s	loc_39DE0
		rts
; ---------------------------------------------------------------------------

loc_39DE0:					  ; CODE XREF: sub_39DD8+4j
		cmp.w	-$00000002(a6),d0
		bcs.s	loc_39DE8
		rts
; ---------------------------------------------------------------------------

loc_39DE8:					  ; CODE XREF: sub_39DD8+Cj
		move.w	-$00000010(a6),d0
		ext.l	d0
		lea	(g_Pal1Base).l,a0
		lea	Title3Palette(pc),a1
		clr.b	d6
		andi.b	#$07,d0
		bne.s	loc_39E1A
		moveq	#$0000000F,d7

loc_39E02:					  ; CODE XREF: sub_39DD8+2Ej
		bsr.w	sub_39BF2
		dbf	d7,loc_39E02
		addq.b	#$01,-$0000001D(a6)
		cmpi.b	#$30,d6
		bcs.s	loc_39E1A
		move.b	#$FF,-$0000001B(a6)

loc_39E1A:					  ; CODE XREF: sub_39DD8+26j
						  ; sub_39DD8+3Aj
		addq.w	#$01,-$00000010(a6)
		rts
; End of function sub_39DD8


; =============== S U B	R O U T	I N E =======================================


CopyTilemapToVDP:				  ; CODE XREF: DisplayTitle+12Cp
						  ; DisplayTitle+160p ...
		lea	(g_Buffer).l,a0
		move.b	(a0)+,d0
		ext.w	d0
		move.b	(a0)+,d1
		ext.w	d1
		subq.w	#$01,d1

loc_39E30:					  ; CODE XREF: CopyTilemapToVDP+24j
		movem.l	d0-d1/a1,-(sp)
		moveq	#$00000002,d1
		jsr	(j_DoDMACopy_1).l
		movem.l	(sp)+,d0-d1/a1
		lea	$00000080(a1),a1
		dbf	d1,loc_39E30
		rts
; End of function CopyTilemapToVDP


; =============== S U B	R O U T	I N E =======================================


ReindexDecompTilemap:				  ; CODE XREF: DisplayTitle+122p
						  ; DisplayTitle+156p ...
		lea	(g_Buffer).l,a0
		move.b	(a0)+,d7
		ext.w	d7
		subq.w	#$01,d7
		move.b	(a0)+,d6
		ext.w	d6
		subq.w	#$01,d6

loc_39E5C:					  ; CODE XREF: ReindexDecompTilemap+22j
		move.w	d6,d5

loc_39E5E:					  ; CODE XREF: ReindexDecompTilemap+1Ej
		move.w	(a0),d1
		subi.w	#$0100,d1
		add.w	d0,d1
		move.w	d1,(a0)+
		dbf	d5,loc_39E5E
		dbf	d7,loc_39E5C
		rts
; End of function ReindexDecompTilemap


; =============== S U B	R O U T	I N E =======================================


sub_39E72:					  ; CODE XREF: DisplayTitle+19Ap
						  ; DisplayTitle+1A6p ...
		bsr.w	GetTilePointer

loc_39E76:					  ; CODE XREF: sub_39E72+1Aj
		movea.l	a0,a5
		move.w	d6,d5

loc_39E7A:					  ; CODE XREF: sub_39E72+12j
		move.w	(a0),d0
		andi.w	#$1FFF,d0
		or.w	d2,d0
		move.w	d0,(a0)+
		dbf	d5,loc_39E7A
		lea	(a5,d4.w),a0
		dbf	d7,loc_39E76
		rts
; End of function sub_39E72


; =============== S U B	R O U T	I N E =======================================


GetTilePointer:					  ; CODE XREF: sub_39E72p
						  ; ROM:00039EB2p ...
		lea	(g_Buffer).l,a0
		clr.w	d4
		move.b	(a0)+,d4
		addq.l	#$01,a0
		add.w	d4,d4
		mulu.w	d4,d1
		add.w	d0,d0
		lea	(a0,d1.w),a0
		lea	(a0,d0.w),a0
		rts
; End of function GetTilePointer

; ---------------------------------------------------------------------------
		moveq	#$00000011,d0
		moveq	#$0000000D,d1
		bsr.s	GetTilePointer
		movea.l	a0,a1
		moveq	#$00000013,d0
		moveq	#$0000000E,d1
		bsr.s	GetTilePointer
		moveq	#$00000004,d7

loc_39EBE:					  ; CODE XREF: ROM:00039ED2j
		movea.l	a0,a4
		movea.l	a1,a5
		moveq	#$00000010,d5

loc_39EC4:					  ; CODE XREF: ROM:00039EC6j
		move.w	(a0)+,(a1)+
		dbf	d5,loc_39EC4
		lea	(a4,d4.w),a0
		lea	(a5,d4.w),a1
		dbf	d7,loc_39EBE
		rts
; ---------------------------------------------------------------------------
