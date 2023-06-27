
; =============== S U B	R O U T	I N E =======================================


UpdateCreditScroll:				  ; CODE XREF: sub_9ECDC:loc_9ECF8p
		move.w	-$00000002(a6),d0
		andi.b	#$0F,d0
		cmpi.b	#$0F,d0
		beq.s	ScrollCredits1Tile
		rts
; ---------------------------------------------------------------------------

ScrollCredits1Tile:				  ; CODE XREF: UpdateCreditScroll+Cj
		lea	(g_HUD_Row1).l,a0
		lea	g_HUD_Row2-g_HUD_Row1(a0),a1
		move.w	#$013F,d7

loc_9F662:					  ; CODE XREF: UpdateCreditScroll+20j
		move.l	(a1)+,(a0)+
		dbf	d7,loc_9F662
		lea	(g_HUD_Row1).l,a0
		clr.l	d0
		move.w	-$00000002(a6),d0
		lsr.w	#$04,d0
		andi.w	#$001F,d0
		lsl.w	#$07,d0
		ori.w	#$E000,d0
		movea.l	d0,a1
		moveq	#$00000028,d0
		moveq	#$00000002,d1
		jsr	(j_QueueDMAOp).l
		jsr	(j_EnableDMAQueueProcessing).l
		rts
; End of function UpdateCreditScroll


; =============== S U B	R O U T	I N E =======================================


sub_9F694:					  ; CODE XREF: sub_9F6D4+4p
		move.w	#$0001,(word_FF1194).l
		clr.b	(byte_FF1129).l
		clr.b	-$0000000E(a6)
		movem.l	d0/d7-a0,-(sp)
		lea	(g_ScreenBuffer).l,a0
		move.b	(byte_FF1BFA).l,d0
		move.b	d0,d1
		lsl.l	#$08,d0
		or.b	d0,d1
		lsl.l	#$08,d0
		or.b	d0,d1
		lsl.l	#$08,d0
		or.b	d0,d1
		move.w	#$027F,d7

loc_9F6C8:					  ; CODE XREF: sub_9F694+36j
		move.l	d0,(a0)+
		dbf	d7,loc_9F6C8
		movem.l	(sp)+,d0/d7-a0
		rts
; End of function sub_9F694


; =============== S U B	R O U T	I N E =======================================


sub_9F6D4:					  ; CODE XREF: sub_9ED10+4p

; FUNCTION CHUNK AT 0009F82C SIZE 0000005A BYTES

		move.w	d0,-$00000006(a6)
		bsr.s	sub_9F694
		clr.w	d7

loc_9F6DC:					  ; CODE XREF: sub_9F6D4+1Cj
						  ; sub_9F6D4+2Aj ...
		clr.w	d0
		move.b	(a0)+,d0
		beq.w	loc_9F75C
		cmpi.b	#$81,d0
		bne.s	loc_9F6F2
		move.b	#$01,-$0000000E(a6)
		bra.s	loc_9F6DC
; ---------------------------------------------------------------------------

loc_9F6F2:					  ; CODE XREF: sub_9F6D4+14j
		cmpi.b	#$82,d0
		bne.s	loc_9F700
		move.b	#$02,-$0000000E(a6)
		bra.s	loc_9F6DC
; ---------------------------------------------------------------------------

loc_9F700:					  ; CODE XREF: sub_9F6D4+22j
		cmpi.b	#$40,d0
		bcs.w	loc_9F71E
		cmpi.b	#$80,d0
		bcc.w	loc_9F71E
		subi.b	#$3F,d0
		ext.w	d0
		sub.w	d0,(word_FF1194).l
		bra.s	loc_9F6DC
; ---------------------------------------------------------------------------

loc_9F71E:					  ; CODE XREF: sub_9F6D4+30j
						  ; sub_9F6D4+38j
		cmpi.b	#$83,d0
		beq.w	loc_9F82C
		cmpi.b	#$84,d0
		beq.w	loc_9F838
		cmpi.b	#$85,d0
		beq.w	loc_9F844
		cmpi.b	#$86,d0
		beq.w	loc_9F850
		movem.l	d7-a0,-(sp)
		bsr.w	sub_9F886
		movem.l	(sp)+,d7-a0
		move.w	d7,d0
		cmpi.b	#$04,d0
		bcs.s	loc_9F758
		bsr.w	sub_9ECDC
		clr.w	d7

loc_9F758:					  ; CODE XREF: sub_9F6D4+7Cj
		addq.w	#$01,d7
		bra.s	loc_9F6DC
; ---------------------------------------------------------------------------

loc_9F75C:					  ; CODE XREF: sub_9F6D4+Cj
		move.l	a0,-(sp)
		bsr.w	sub_9ECDC
		bsr.w	sub_9F96A
		bsr.w	sub_9F76E
		movea.l	(sp)+,a0
		rts
; End of function sub_9F6D4


; =============== S U B	R O U T	I N E =======================================


sub_9F76E:					  ; CODE XREF: sub_9F6D4+92p
						  ; sub_9F76E+40j
		move.w	-$00000004(a6),d0
		andi.w	#$03FF,d0
		addi.w	#$0200,d0
		move.w	d0,-$00000008(a6)
		clr.l	d1
		move.w	d0,d1
		lsl.w	#$05,d1
		movea.l	d1,a1
		lea	((g_ScreenBuffer+$40)).l,a0
		move.w	(word_FF1194).l,d1
		move.w	d1,d2
		lsr.w	#$02,d1
		andi.b	#$07,d2
		beq.s	loc_9F79E
		addq.w	#$02,d1

loc_9F79E:					  ; CODE XREF: sub_9F76E+2Cj
		move.w	d1,-$0000000A(a6)
		add.w	d1,d0
		cmpi.w	#$0600,d0
		bcs.s	loc_9F7B0
		clr.w	-$00000004(a6)
		bra.s	sub_9F76E
; ---------------------------------------------------------------------------

loc_9F7B0:					  ; CODE XREF: sub_9F76E+3Aj
		add.w	d1,-$00000004(a6)
		lsl.w	#$04,d1
		move.w	d1,d0
		moveq	#$00000002,d1
		jsr	(j_QueueDMAOp).l
		jsr	(j_EnableDMAQueueProcessing).l
		bsr.w	sub_9ECDC
		lea	(g_HUD_Row2).l,a0
		move.w	-$00000006(a6),d0
		tst.b	d0
		bpl.w	loc_9F804
		move.w	d0,d3
		clr.w	d2
		moveq	#$00000014,d0
		cmpi.b	#$FF,d3
		bne.s	loc_9F7E8
		moveq	#$00000028,d0

loc_9F7E8:					  ; CODE XREF: sub_9F76E+76j
		cmpi.b	#$FD,d3
		bne.s	loc_9F7F0
		moveq	#$00000002,d2

loc_9F7F0:					  ; CODE XREF: sub_9F76E+7Ej
		cmpi.b	#$FE,d3
		bne.s	loc_9F7F8
		moveq	#$00000012,d2

loc_9F7F8:					  ; CODE XREF: sub_9F76E+86j
		move.w	-$0000000A(a6),d1
		lsr.w	#$01,d1
		sub.w	d1,d0
		lsr.w	#$01,d0
		add.w	d2,d0

loc_9F804:					  ; CODE XREF: sub_9F76E+68j
		add.w	d0,d0
		lea	(a0,d0.w),a0
		move.w	-$0000000A(a6),d7
		lsr.w	#$01,d7
		subq.w	#$01,d7
		move.w	-$00000008(a6),d0
		ori.w	#$0000,d0

loc_9F81A:					  ; CODE XREF: sub_9F76E+B8j
		move.w	d0,(a0)
		addq.w	#$01,d0
		move.w	d0,$00000080(a0)
		addq.w	#$01,d0
		addq.l	#$02,a0
		dbf	d7,loc_9F81A
		rts
; End of function sub_9F76E

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_9F6D4

loc_9F82C:					  ; CODE XREF: sub_9F6D4+4Ej
		lea	((g_Blockset+2)).l,a2
		moveq	#$00000002,d7
		bra.w	loc_9F858
; ---------------------------------------------------------------------------

loc_9F838:					  ; CODE XREF: sub_9F6D4+56j
		lea	((g_Blockset+$5C)).l,a2
		moveq	#$00000002,d7
		bra.w	loc_9F858
; ---------------------------------------------------------------------------

loc_9F844:					  ; CODE XREF: sub_9F6D4+5Ej
		lea	((g_Blockset+$B6)).l,a2
		moveq	#$00000004,d7
		bra.w	loc_9F858
; ---------------------------------------------------------------------------

loc_9F850:					  ; CODE XREF: sub_9F6D4+66j
		lea	((g_Blockset+$14C)).l,a2
		moveq	#$00000003,d7

loc_9F858:					  ; CODE XREF: sub_9F6D4+160j
						  ; sub_9F6D4+16Cj ...
		move.l	a0,-(sp)
		move.w	-$00000006(a6),d1
		add.w	d1,d1
		lea	(g_HUD_Row2).l,a3
		lea	(a3,d1.w),a3

loc_9F86A:					  ; CODE XREF: sub_9F6D4+1AAj
		movea.l	a2,a4
		movea.l	a3,a5
		moveq	#$0000000E,d6

loc_9F870:					  ; CODE XREF: sub_9F6D4+19Ej
		move.w	(a4)+,(a5)+
		dbf	d6,loc_9F870
		lea	$0000001E(a2),a2
		lea	$00000080(a3),a3
		dbf	d7,loc_9F86A
		movea.l	(sp)+,a0
		rts
; END OF FUNCTION CHUNK	FOR sub_9F6D4

; =============== S U B	R O U T	I N E =======================================


sub_9F886:					  ; CODE XREF: sub_9F6D4+6Ep
		lea	(g_Buffer).l,a0
		tst.b	d0
		beq.w	loc_9F8BA
		cmpi.b	#$80,d0
		bne.s	loc_9F89E
		moveq	#$00000005,d2
		addq.l	#$01,a0
		bra.s	loc_9F8C0
; ---------------------------------------------------------------------------

loc_9F89E:					  ; CODE XREF: sub_9F886+10j
		subq.b	#$01,d0
		beq.w	loc_9F8BA
		subq.b	#$01,d0

loc_9F8A6:					  ; CODE XREF: sub_9F886+30j
		clr.w	d1
		move.b	(a0)+,d1
		beq.w	loc_9F8BA
		mulu.w	#$0004,d1
		lea	(a0,d1.w),a0
		dbf	d0,loc_9F8A6

loc_9F8BA:					  ; CODE XREF: sub_9F886+8j
						  ; sub_9F886+1Aj ...
		clr.w	d2
		move.b	(a0)+,d2
		subq.w	#$01,d2

loc_9F8C0:					  ; CODE XREF: sub_9F886+16j
						  ; sub_9F886+44j
		bsr.w	sub_9F8E0
		addq.w	#$01,(word_FF1194).l
		dbf	d2,loc_9F8C0
		lea	((g_Buffer+1)).l,a0
		bsr.w	sub_9F8E0
		addq.w	#$01,(word_FF1194).l
		rts
; End of function sub_9F886


; =============== S U B	R O U T	I N E =======================================


sub_9F8E0:					  ; CODE XREF: sub_9F886:loc_9F8C0p
						  ; sub_9F886+4Ep
		lea	((g_ScreenBuffer+$40)).l,a1
		move.w	(word_FF1194).l,d0
		move.w	d0,d1
		andi.b	#$F8,d1
		lsl.w	#$03,d1
		lea	(a1,d1.w),a1
		move.w	d0,d1
		andi.w	#$0007,d1
		lsr.w	#$01,d1
		lea	(a1,d1.w),a1
		lea	(unk_FF1BFB).l,a2
		move.b	(a2)+,d5
		move.b	(a2)+,d6
		move.b	(a2)+,d7
		btst	#$00,d0
		bne.s	loc_9F91C
		lsl.b	#$04,d5
		lsl.b	#$04,d6
		lsl.b	#$04,d7

loc_9F91C:					  ; CODE XREF: sub_9F8E0+34j
		move.b	(a0)+,d0
		lsl.l	#$08,d0
		move.b	(a0)+,d0
		lsl.l	#$08,d0
		move.b	(a0)+,d0
		lsl.l	#$08,d0
		move.b	(a0)+,d0
		move.b	-$0000000E(a6),d4
		beq.w	loc_9F94A
		cmpi.b	#$01,d4
		bne.s	loc_9F942
		andi.b	#$FC,d0
		ori.b	#$02,d0
		bra.s	loc_9F94A
; ---------------------------------------------------------------------------

loc_9F942:					  ; CODE XREF: sub_9F8E0+56j
		andi.b	#$F0,d0
		ori.b	#$0E,d0

loc_9F94A:					  ; CODE XREF: sub_9F8E0+4Ej
						  ; sub_9F8E0+60j
		moveq	#$0000000F,d3

loc_9F94C:					  ; CODE XREF: sub_9F8E0+84j
		add.l	d0,d0
		bcs.s	loc_9F958
		add.l	d0,d0
		bcc.s	loc_9F956
		or.b	d5,(a1)

loc_9F956:					  ; CODE XREF: sub_9F8E0+72j
		bra.s	loc_9F962
; ---------------------------------------------------------------------------

loc_9F958:					  ; CODE XREF: sub_9F8E0+6Ej
		add.l	d0,d0
		bcs.s	loc_9F960
		or.b	d6,(a1)
		bra.s	loc_9F962
; ---------------------------------------------------------------------------

loc_9F960:					  ; CODE XREF: sub_9F8E0+7Aj
		or.b	d7,(a1)

loc_9F962:					  ; CODE XREF: sub_9F8E0:loc_9F956j
						  ; sub_9F8E0+7Ej
		addq.l	#$04,a1
		dbf	d3,loc_9F94C
		rts
; End of function sub_9F8E0


; =============== S U B	R O U T	I N E =======================================


sub_9F96A:					  ; CODE XREF: sub_9F6D4+8Ep
		move.w	(word_FF1194).l,d0
		andi.w	#$000F,d0
		bne.s	loc_9F978
		rts
; ---------------------------------------------------------------------------

loc_9F978:					  ; CODE XREF: sub_9F96A+Aj
		moveq	#$00000010,d1
		sub.w	d0,d1
		lsr.w	#$02,d1
		bne.s	loc_9F982
		rts
; ---------------------------------------------------------------------------

loc_9F982:					  ; CODE XREF: sub_9F96A+14j
		move.w	(word_FF1194).l,d0
		andi.w	#$FFF0,d0
		addi.w	#$0010,d0
		move.w	d0,(word_FF1194).l
		lea	((g_ScreenBuffer+$803)).l,a1
		moveq	#$0000000F,d6
		cmpi.b	#$02,d1
		beq.w	loc_9F9DA
		bcc.w	loc_9FA0A

loc_9F9AA:					  ; CODE XREF: sub_9F96A+6Aj
		movea.l	a1,a0
		move.w	#$001F,d7

loc_9F9B0:					  ; CODE XREF: sub_9F96A+62j
		move.b	-$00000001(a0),(a0)
		move.b	-$00000002(a0),-$00000001(a0)
		move.b	-$00000003(a0),-$00000002(a0)
		move.b	-$00000040(a0),-$00000003(a0)
		suba.l	#$00000040,a0
		dbf	d7,loc_9F9B0
		lea	$00000004(a1),a1
		dbf	d6,loc_9F9AA
		rts
; ---------------------------------------------------------------------------

loc_9F9DA:					  ; CODE XREF: sub_9F96A+38j
						  ; sub_9F96A+9Aj
		movea.l	a1,a0
		move.w	#$001F,d7

loc_9F9E0:					  ; CODE XREF: sub_9F96A+92j
		move.b	-$00000002(a0),(a0)
		move.b	-$00000003(a0),-$00000001(a0)
		move.b	-$00000040(a0),-$00000002(a0)
		move.b	-$00000041(a0),-$00000003(a0)
		suba.l	#$00000040,a0
		dbf	d7,loc_9F9E0
		lea	$00000004(a1),a1
		dbf	d6,loc_9F9DA
		rts
; ---------------------------------------------------------------------------

loc_9FA0A:					  ; CODE XREF: sub_9F96A+3Cj
						  ; sub_9F96A+CAj
		movea.l	a1,a0
		move.w	#$001F,d7

loc_9FA10:					  ; CODE XREF: sub_9F96A+C2j
		move.b	-$00000003(a0),(a0)
		move.b	-$00000040(a0),-$00000001(a0)
		move.b	-$00000041(a0),-$00000002(a0)
		move.b	-$00000042(a0),-$00000003(a0)
		suba.l	#$00000040,a0
		dbf	d7,loc_9FA10
		lea	$00000004(a1),a1
		dbf	d6,loc_9FA0A
		rts
; End of function sub_9F96A

; ---------------------------------------------------------------------------
