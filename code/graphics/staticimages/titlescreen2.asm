
; =============== S U B	R O U T	I N E =======================================


sub_39B3C:					  ; CODE XREF: ROM:00039A16p
		tst.b	-$00000016(a6)
		bpl.s	loc_39B44
		rts
; ---------------------------------------------------------------------------

loc_39B44:					  ; CODE XREF: sub_39B3C+4j
		cmp.w	-$00000002(a6),d0
		bcs.s	loc_39B4C
		rts
; ---------------------------------------------------------------------------

loc_39B4C:					  ; CODE XREF: sub_39B3C+Cj
		move.w	-$00000008(a6),d0
		ext.l	d0
		lea	((g_Pal1Base+$C)).l,a0
		clr.b	d6
		moveq	#$00000009,d7

loc_39B5C:					  ; CODE XREF: sub_39B3C+24j
		bsr.w	sub_39B80
		dbf	d7,loc_39B5C
		move.l	d6,d7
		move.b	-$00000016(a6),d6
		ext.w	d6
		neg.w	d6
		cmpi.b	#$09,d7
		bcs.s	loc_39B7A
		move.b	#$FF,-$00000016(a6)

loc_39B7A:					  ; CODE XREF: sub_39B3C+36j
		addq.w	#$01,-$00000008(a6)
		rts
; End of function sub_39B3C


; =============== S U B	R O U T	I N E =======================================


sub_39B80:					  ; CODE XREF: sub_39B3C:loc_39B5Cp
		subi.l	#$00000004,d0
		bmi.s	locret_39BA8
		andi.w	#$FFFC,d0
		move.w	(a0),d1
		addi.w	#$0022,d1
		cmpi.w	#$0044,d1
		bcs.s	loc_39BA2
		move.w	#$0044,d1
		addq.b	#$01,d6
		move.b	d6,-$00000016(a6)

loc_39BA2:					  ; CODE XREF: sub_39B80+16j
		move.w	d1,(a0)+
		addq.b	#$01,-$0000001D(a6)

locret_39BA8:					  ; CODE XREF: sub_39B80+6j
		rts
; End of function sub_39B80


; =============== S U B	R O U T	I N E =======================================


sub_39BAA:					  ; CODE XREF: ROM:00039A1Ep
		tst.b	-$00000017(a6)
		bpl.s	loc_39BB2
		rts
; ---------------------------------------------------------------------------

loc_39BB2:					  ; CODE XREF: sub_39BAA+4j
		cmp.w	-$00000002(a6),d0
		bcs.s	loc_39BBA
		rts
; ---------------------------------------------------------------------------

loc_39BBA:					  ; CODE XREF: sub_39BAA+Cj
		move.w	-$0000000A(a6),d0
		ext.l	d0
		lea	((g_Pal1Base+2)).l,a0
		lea	TitlePaletteYellowFade(pc),a1
		clr.b	d6
		andi.b	#$07,d0
		bne.s	loc_39BEC
		moveq	#$00000004,d7

loc_39BD4:					  ; CODE XREF: sub_39BAA+2Ej
		bsr.w	sub_39BF2
		dbf	d7,loc_39BD4
		addq.b	#$01,-$0000001D(a6)
		cmpi.b	#$0F,d6
		bcs.s	loc_39BEC
		move.b	#$FF,-$00000017(a6)

loc_39BEC:					  ; CODE XREF: sub_39BAA+26j
						  ; sub_39BAA+3Aj
		addq.w	#$01,-$0000000A(a6)
		rts
; End of function sub_39BAA


; =============== S U B	R O U T	I N E =======================================


sub_39BF2:					  ; CODE XREF: sub_39BAA:loc_39BD4p
						  ; sub_39C46+2Ap ...
		move.w	#$000E,d5
		move.w	(a0),d1
		move.w	d1,d2
		move.w	d1,d3
		move.w	(a1),d4
		and.w	d5,d1
		and.w	d5,d4
		addq.w	#$02,d1
		cmp.w	d4,d1
		bcs.s	loc_39C0C
		move.w	d4,d1
		addq.b	#$01,d6

loc_39C0C:					  ; CODE XREF: sub_39BF2+14j
		lsl.w	#$04,d5
		move.w	(a1),d4
		and.w	d5,d2
		and.w	d5,d4
		addi.w	#$0020,d2
		cmp.w	d4,d2
		bcs.s	loc_39C20
		move.w	d4,d2
		addq.b	#$01,d6

loc_39C20:					  ; CODE XREF: sub_39BF2+28j
		lsl.w	#$04,d5
		move.w	(a1)+,d4
		and.w	d5,d3
		and.w	d5,d4
		addi.w	#$0200,d3
		cmp.w	d4,d3
		bcs.s	loc_39C34
		move.w	d4,d3
		addq.b	#$01,d6

loc_39C34:					  ; CODE XREF: sub_39BF2+3Cj
		or.w	d2,d1
		or.w	d3,d1
		move.w	d1,(a0)+
		rts
; End of function sub_39BF2

; ---------------------------------------------------------------------------
