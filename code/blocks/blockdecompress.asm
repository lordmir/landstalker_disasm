
; =============== S U B	R O U T	I N E =======================================


DecompBigTiles:					  ; DATA XREF: GetBlockset+26t
						  ; GetBlockset+4Ct
		movem.l	d1-a5,-(sp)
		link	a6,#-$0020
		clr.w	d6
		clr.w	d4
		moveq	#$0000000F,d7

loc_D0AA:					  ; CODE XREF: DecompBigTiles+1Aj
		dbf	d6,loc_D0B2
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_D0B2:					  ; CODE XREF: DecompBigTiles:loc_D0AAj
		add.b	d5,d5
		addx.w	d4,d4
		dbf	d7,loc_D0AA
		lsl.w	#$02,d4
		lea	-$00000020(a6),a2
		move.w	#$000F,d3
		clr.w	d0

loc_D0C6:					  ; CODE XREF: DecompBigTiles+2Cj
		move.w	d0,(a2)+
		dbf	d3,loc_D0C6
		movea.l	a1,a2
		clr.w	d3
		clr.w	d7
		bsr.w	sub_D1A4
		dbf	d2,loc_D0E2
		bchg	#$0F,d7
		bsr.w	sub_D1A4

loc_D0E2:					  ; CODE XREF: DecompBigTiles+3Aj
						  ; DecompBigTiles+5Cj
		add.w	d2,d3
		addq.w	#$01,d3

loc_D0E6:					  ; CODE XREF: DecompBigTiles+4Cj
		move.w	d7,(a2)+
		dbf	d2,loc_D0E6
		bchg	#$0F,d7
		cmp.w	d4,d3
		bcc.s	loc_D0FA
		bsr.w	sub_D1A4
		bra.s	loc_D0E2
; ---------------------------------------------------------------------------

loc_D0FA:					  ; CODE XREF: DecompBigTiles+56j
		movea.l	a1,a2
		clr.w	d3
		move.w	#$1000,d7
		bsr.w	sub_D1A4
		dbf	d2,loc_D120
		bsr.w	sub_D1A4

loc_D10E:					  ; CODE XREF: DecompBigTiles+94j
		addq.w	#$01,d3
		add.w	d2,d3

loc_D112:					  ; CODE XREF: DecompBigTiles+78j
		or.w	d7,(a2)+
		dbf	d2,loc_D112
		cmp.w	d4,d3
		bcc.s	loc_D132
		bsr.w	sub_D1A4

loc_D120:					  ; CODE XREF: DecompBigTiles+6Aj
		addq.w	#$01,d2
		adda.w	d2,a2
		adda.w	d2,a2
		add.w	d2,d3
		cmp.w	d4,d3
		bcc.s	loc_D132
		bsr.w	sub_D1A4
		bra.s	loc_D10E
; ---------------------------------------------------------------------------

loc_D132:					  ; CODE XREF: DecompBigTiles+7Ej
						  ; DecompBigTiles+8Ej
		movea.l	a1,a2
		clr.w	d3
		move.w	#$0800,d7
		bsr.s	sub_D1A4
		dbf	d2,loc_D152
		bsr.s	sub_D1A4

loc_D142:					  ; CODE XREF: DecompBigTiles+C4j
		addq.w	#$01,d3
		add.w	d2,d3

loc_D146:					  ; CODE XREF: DecompBigTiles+ACj
		or.w	d7,(a2)+
		dbf	d2,loc_D146
		cmp.w	d4,d3
		bcc.s	loc_D162
		bsr.s	sub_D1A4

loc_D152:					  ; CODE XREF: DecompBigTiles+A0j
		addq.w	#$01,d2
		adda.w	d2,a2
		adda.w	d2,a2
		add.w	d2,d3
		cmp.w	d4,d3
		bcc.s	loc_D162
		bsr.s	sub_D1A4
		bra.s	loc_D142
; ---------------------------------------------------------------------------

loc_D162:					  ; CODE XREF: DecompBigTiles+B2j
						  ; DecompBigTiles+C0j
		clr.w	d0
		movea.l	a1,a2
		move.w	d4,d3
		lsr.w	#$01,d3
		bra.s	loc_D194
; ---------------------------------------------------------------------------

loc_D16C:					  ; CODE XREF: DecompBigTiles:loc_D194j
		bsr.s	sub_D1DC
		or.w	d2,(a2)+
		dbf	d6,loc_D178
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_D178:					  ; CODE XREF: DecompBigTiles+D4j
		add.b	d5,d5
		bcs.s	loc_D180
		bsr.s	sub_D1DC
		bra.s	loc_D192
; ---------------------------------------------------------------------------

loc_D180:					  ; CODE XREF: DecompBigTiles+DEj
		andi.w	#$07FF,d2
		btst	#$03,-$00000002(a2)
		bne.s	loc_D190
		addq.w	#$01,d2
		bra.s	loc_D192
; ---------------------------------------------------------------------------

loc_D190:					  ; CODE XREF: DecompBigTiles+EEj
		subq.w	#$01,d2

loc_D192:					  ; CODE XREF: DecompBigTiles+E2j
						  ; DecompBigTiles+F2j
		or.w	d2,(a2)+

loc_D194:					  ; CODE XREF: DecompBigTiles+CEj
		dbf	d3,loc_D16C
		move.w	d4,d0
		lsr.w	#$02,d0
		unlk	a6
		movem.l	(sp)+,d1-a5
		rts
; End of function DecompBigTiles


; =============== S U B	R O U T	I N E =======================================


sub_D1A4:					  ; CODE XREF: DecompBigTiles+36p
						  ; DecompBigTiles+42p	...
		moveq	#$FFFFFFFF,d1

loc_D1A6:					  ; CODE XREF: sub_D1A4+Cj
		dbf	d6,loc_D1AE
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_D1AE:					  ; CODE XREF: sub_D1A4:loc_D1A6j
		add.b	d5,d5
		dbcs	d1,loc_D1A6
		negx.w	d1
		dbf	d1,loc_D1BE
		clr.w	d2
		rts
; ---------------------------------------------------------------------------

loc_D1BE:					  ; CODE XREF: sub_D1A4+12j
		moveq	#$00000002,d0
		lsl.w	d1,d0
		subq.w	#$01,d0
		move.w	d0,d2
		clr.w	d0

loc_D1C8:					  ; CODE XREF: sub_D1A4+30j
		dbf	d6,loc_D1D0
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_D1D0:					  ; CODE XREF: sub_D1A4:loc_D1C8j
		add.b	d5,d5
		addx.w	d0,d0
		dbf	d1,loc_D1C8
		add.w	d0,d2
		rts
; End of function sub_D1A4


; =============== S U B	R O U T	I N E =======================================


sub_D1DC:					  ; CODE XREF: DecompBigTiles:loc_D16Cp
						  ; DecompBigTiles+E0p
		dbf	d6,loc_D1E4
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_D1E4:					  ; CODE XREF: sub_D1DCj
		add.b	d5,d5
		bcc.w	loc_D236
		clr.w	d2
		moveq	#$00000003,d7

loc_D1EE:					  ; CODE XREF: sub_D1DC+1Ej
		dbf	d6,loc_D1F6
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_D1F6:					  ; CODE XREF: sub_D1DC:loc_D1EEj
		add.b	d5,d5
		addx.w	d2,d2
		dbf	d7,loc_D1EE
		move.w	d2,d1
		beq.w	loc_D256
		add.w	d2,d2
		add.w	d0,d2
		andi.w	#$001E,d2
		move.w	-$00000020(a6,d2.w),-(sp)
		subq.w	#$01,d1

loc_D212:					  ; CODE XREF: sub_D1DC+4Cj
		subq.w	#$02,d2
		andi.w	#$001E,d2
		move.w	-$00000020(a6,d2.w),-(sp)
		addq.w	#$02,d2
		andi.w	#$001E,d2
		move.w	(sp)+,-$00000020(a6,d2.w)
		subq.w	#$02,d2
		dbf	d1,loc_D212
		move.w	(sp)+,-$00000020(a6,d0.w)
		move.w	-$00000020(a6,d0.w),d2
		bra.s	locret_D254
; ---------------------------------------------------------------------------

loc_D236:					  ; CODE XREF: sub_D1DC+Aj
		subq.w	#$02,d0
		clr.w	d2
		moveq	#$0000000A,d7

loc_D23C:					  ; CODE XREF: sub_D1DC+6Cj
		dbf	d6,loc_D244
		moveq	#$00000007,d6
		move.b	(a0)+,d5

loc_D244:					  ; CODE XREF: sub_D1DC:loc_D23Cj
		add.b	d5,d5
		addx.w	d2,d2
		dbf	d7,loc_D23C
		andi.w	#$001F,d0
		move.w	d2,-$00000020(a6,d0.w)

locret_D254:					  ; CODE XREF: sub_D1DC+58j
		rts
; ---------------------------------------------------------------------------

loc_D256:					  ; CODE XREF: sub_D1DC+24j
		move.w	-$00000020(a6,d0.w),d2
		rts
; End of function sub_D1DC

