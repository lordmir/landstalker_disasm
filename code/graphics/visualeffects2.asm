
; =============== S U B	R O U T	I N E =======================================


ContinueKazaltWarpFx:				  ; CODE XREF: sub_E87A+6p
		move.w	-$00000128(a6),d0
		cmpi.w	#$0172,d0
		bcc.s	loc_E83E
		rts
; ---------------------------------------------------------------------------

loc_E83E:					  ; CODE XREF: ContinueKazaltWarpFx+8j
		lsr.w	#$02,d0
		andi.b	#$03,d0
		cmpi.b	#$01,d0
		bcs.w	WhiteFlash
		jmp	(CopyBasePalleteToActivePalette).l
; End of function ContinueKazaltWarpFx


; =============== S U B	R O U T	I N E =======================================


sub_E852:					  ; CODE XREF: NoleWarp+B4p
		move.w	#$0C00,-$0000012A(a6)
		move.w	#$FE00,-$0000012C(a6)
		move.w	#$0E00,-$0000012E(a6)
		rts
; End of function sub_E852


; =============== S U B	R O U T	I N E =======================================


sub_E866:					  ; CODE XREF: NoleWarp+66p
		move.w	#$0200,-$0000012A(a6)
		move.w	#$0200,-$0000012C(a6)
		move.w	#$0E00,-$0000012E(a6)
		rts
; End of function sub_E866


; =============== S U B	R O U T	I N E =======================================


sub_E87A:					  ; CODE XREF: NoleWarp+164p

; FUNCTION CHUNK AT 0000E7EA SIZE 00000024 BYTES

		cmp.w	-$00000128(a6),d0
		bcs.s	loc_E886
		bsr.s	ContinueKazaltWarpFx
		bra.w	loc_E7EA
; ---------------------------------------------------------------------------

loc_E886:					  ; CODE XREF: sub_E87A+4j
		move.w	-$00000132(a6),d0
		bne.s	loc_E88E
		rts
; ---------------------------------------------------------------------------

loc_E88E:					  ; CODE XREF: sub_E87A+10j
		cmpi.w	#$001C,d0
		bne.s	loc_E898
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_WarpPad
; ---------------------------------------------------------------------------

loc_E898:					  ; CODE XREF: sub_E87A+18j
		subq.w	#$01,d0
		move.w	d0,-$00000132(a6)
		andi.b	#$03,d0
		beq.w	loc_E8C0
		rts
; End of function sub_E87A


; =============== S U B	R O U T	I N E =======================================


sub_E8A8:					  ; CODE XREF: NoleWarp+15Cp
		move.w	-$00000130(a6),d0
		bne.s	loc_E8B0
		rts
; ---------------------------------------------------------------------------

loc_E8B0:					  ; CODE XREF: sub_E8A8+4j
		subq.w	#$01,d0
		move.w	d0,-$00000130(a6)
		andi.b	#$03,d0
		beq.w	loc_E8C0
		rts
; ---------------------------------------------------------------------------

loc_E8C0:					  ; CODE XREF: sub_E87A+28j
						  ; sub_E8A8+12j
		move.w	-$0000012A(a6),d3
		move.w	-$0000012C(a6),d4
		move.w	-$0000012E(a6),d7
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		moveq	#$0000003F,d5

loc_E8DA:					  ; CODE XREF: sub_E8A8+3Cj
		move.w	(a0)+,d0
		jsr	(BrightenColour).l
		move.w	d0,(a1)+
		dbf	d5,loc_E8DA
		add.w	d4,d3
		move.w	d3,-$0000012A(a6)
		move.w	d4,-$0000012C(a6)
		move.w	d7,-$0000012E(a6)
		rts
; End of function sub_E8A8


; =============== S U B	R O U T	I N E =======================================


sub_E8F8:					  ; CODE XREF: NoleWarp+F8p
						  ; NoleWarp+158p
		lea	(g_VDPSpr30_Y).l,a0
		moveq	#$00000027,d7

loc_E900:					  ; CODE XREF: sub_E8F8+10j
		move.w	#$FFFF,(a0)
		lea	$00000008(a0),a0
		dbf	d7,loc_E900
		cmpi.w	#$003C,-$00000128(a6)
		bcc.s	loc_E916
		rts
; ---------------------------------------------------------------------------

loc_E916:					  ; CODE XREF: sub_E8F8+1Aj
		move.w	-$00000134(a6),d7
		lsr.w	#$04,d7
		cmpi.w	#$0027,d7
		bcs.s	loc_E926
		move.w	#$0027,d7

loc_E926:					  ; CODE XREF: sub_E8F8+28j
		cmpi.w	#$0007,-$00000126(a6)
		bne.s	loc_E934
		addq.w	#$01,-$00000134(a6)
		bra.s	loc_E93E
; ---------------------------------------------------------------------------

loc_E934:					  ; CODE XREF: sub_E8F8+34j
		subq.w	#$01,-$00000134(a6)
		bpl.s	loc_E93E
		clr.w	-$00000134(a6)

loc_E93E:					  ; CODE XREF: sub_E8F8+3Aj
						  ; sub_E8F8+40j
		lea	(g_VDPSpr30_Y).l,a1
		lea	-$00000120(a6),a0

loc_E948:					  ; CODE XREF: sub_E8F8+C6j
		move.l	d7,-(sp)
		bsr.w	sub_E9C8
		clr.w	d0
		move.b	(a0),d0
		move.w	d0,d1
		movem.w	d0-d1,-(sp)
		clr.w	d5
		move.b	$00000001(a0),d5
		move.w	d5,d0
		jsr	(sub_22EF0).l
		move.w	d0,d4
		movem.w	(sp)+,d0-d1
		mulu.w	d4,d0
		lsr.l	#$08,d0
		movem.w	d0-d1,-(sp)
		move.w	d5,d0
		jsr	(sub_22EEC).l
		move.l	d0,d4
		movem.w	(sp)+,d0-d1
		mulu.w	d4,d1
		lsr.l	#$08,d1
		move.w	d0,d2
		move.w	d1,d3
		add.w	d1,d0
		sub.w	d3,d2
		lsr.w	#$01,d0
		add.w	-$00000122(a6),d2
		move.b	$00000003(a0),d1
		addq.b	#$01,d1
		add.b	d1,$00000002(a0)
		move.b	$00000002(a0),d1
		add.w	-$00000124(a6),d0
		sub.b	d1,d0
		move.w	d0,(a1)
		move.w	#$8100,$00000004(a1)
		move.w	d2,$00000006(a1)
		lea	$00000008(a1),a1
		lea	$00000004(a0),a0
		move.l	(sp)+,d7
		dbf	d7,loc_E948
		addq.w	#$01,-$00000134(a6)
		rts
; End of function sub_E8F8


; =============== S U B	R O U T	I N E =======================================


sub_E9C8:					  ; CODE XREF: sub_E8F8+52p
		move.b	$00000002(a0),d0
		cmpi.b	#$A0,d0
		bcs.w	loc_EA02
		moveq	#$00000008,d6
		jsr	(GenerateRandomNumber).l
		addi.w	#$0018,d7
		move.b	d7,(a0)
		move.w	#$0100,d6
		jsr	(GenerateRandomNumber).l
		move.b	d7,$00000001(a0)
		clr.b	$00000002(a0)
		moveq	#$00000002,d6
		jsr	(GenerateRandomNumber).l
		addq.b	#$02,d7
		move.b	d7,$00000003(a0)

loc_EA02:					  ; CODE XREF: sub_E9C8+8j
		subq.b	#$02,(a0)
		cmpi.b	#$10,(a0)
		bcc.s	locret_EA0E
		move.b	#$10,(a0)

locret_EA0E:					  ; CODE XREF: sub_E9C8+40j
		rts
; End of function sub_E9C8

; ---------------------------------------------------------------------------
		rts
