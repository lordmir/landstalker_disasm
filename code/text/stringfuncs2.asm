
; =============== S U B	R O U T	I N E =======================================


sub_2343A:					  ; DATA XREF: sub_22EE8t
		bsr.s	RefreshAndClearTextbox
		bsr.s	SetTextboxHInt
		jsr	(j_QueueTextboxTilemapDMA).l
		jsr	(j_FlushDMACopyQueue).l
		rts
; End of function sub_2343A


; =============== S U B	R O U T	I N E =======================================


RefreshAndClearTextbox:				  ; CODE XREF: sub_2343Ap
						  ; DATA XREF: j_RefreshAndClearTextboxt
		movem.l	d0-a6,-(sp)
		bsr.s	ReloadTextbox
		bsr.w	ReloadTextboxSprites
		movem.l	(sp)+,d0-a6
		rts
; End of function RefreshAndClearTextbox


; =============== S U B	R O U T	I N E =======================================


SetUpTextDisplay:				  ; DATA XREF: j_SetUpTextDisplayt
		move.w	#$8AB8,d0		  ; HINT on line 184
		move.w	#$0001,d1
		bsr.s	SetVDPForTextbox
		bsr.s	ReloadTextbox
		bra.w	ReloadTextboxSprites
; End of function SetUpTextDisplay


; =============== S U B	R O U T	I N E =======================================


SetTextboxHInt:					  ; CODE XREF: sub_2343A+2p
						  ; DATA XREF: j_SetTextboxHIntt
		bsr.s	TestIfInventoryIsOpen
		bcs.s	loc_23476		  ; Set	HINT to	line 160
		move.w	#$8AB0,d0		  ; Set	HINT to	line 176
		bra.s	loc_2347A
; ---------------------------------------------------------------------------

loc_23476:					  ; CODE XREF: SetTextboxHInt+2j
		move.w	#$8AA0,d0		  ; Set	HINT to	line 160

loc_2347A:					  ; CODE XREF: SetTextboxHInt+8j
		move.w	#$0000,d1
; End of function SetTextboxHInt


; =============== S U B	R O U T	I N E =======================================


SetVDPForTextbox:				  ; CODE XREF: SetUpTextDisplay+8p
		move.w	d1,(g_VDPSpr04_X).l
		move.w	d1,(g_VDPSpr06_X).l
		jsr	(j_WaitUntilVBlank).l
		move.w	d0,(VDP_CTRL_REG).l
		move.w	d0,(g_VDPReg10_HIntLine).l
		rts
; End of function SetVDPForTextbox


; =============== S U B	R O U T	I N E =======================================


TestIfInventoryIsOpen:				  ; CODE XREF: sub_22F7C:loc_22F8Ep
						  ; SetTextboxHIntp ...
		cmpi.w	#$921C,(g_VDPReg18_WindowVPos).l
		rts
; End of function TestIfInventoryIsOpen


; =============== S U B	R O U T	I N E =======================================


ReloadTextbox:					  ; CODE XREF: RefreshAndClearTextbox+4p
						  ; SetUpTextDisplay+Ap ...
		bsr.s	LoadTextboxTilemap
		bsr.s	ClearTextboxTiles
		bsr.w	DMACopyTextboxTiles
		rts
; End of function ReloadTextbox


; =============== S U B	R O U T	I N E =======================================


LoadTextboxTilemap:				  ; CODE XREF: ReloadTextboxp
		clr.w	(g_VDPSpr79_Y).l
		move.w	#$0001,(word_FF1194).l
		move.b	#$01,(byte_FF1129).l
		move.b	#$0B,(byte_FF112A).l
		bsr.s	TestIfInventoryIsOpen
		bcs.s	loc_234E6
		lea	InventoryTextBoxTilemap(pc),a0
		lea	(g_TextBoxLine3).l,a1
		move.w	#$0005,d7
		clr.w	d1
		bra.s	loc_234F8
; ---------------------------------------------------------------------------

loc_234E6:					  ; CODE XREF: LoadTextboxTilemap+20j
		lea	TextBoxTilemap(pc),a0
		lea	(g_TextBoxLine1).l,a1
		move.w	#$0007,d7
		move.w	#$6000,d1

loc_234F8:					  ; CODE XREF: LoadTextboxTilemap+32j
						  ; LoadTextboxTilemap+58j
		move.w	#$0027,d6

loc_234FC:					  ; CODE XREF: LoadTextboxTilemap+50j
		move.w	(a0)+,d0
		or.w	d1,d0
		move.w	d0,(a1)+
		dbf	d6,loc_234FC
		adda.w	#$0030,a1
		dbf	d7,loc_234F8
		rts
; End of function LoadTextboxTilemap


; =============== S U B	R O U T	I N E =======================================


ReloadTextboxSprites:				  ; CODE XREF: RefreshAndClearTextbox+6p
						  ; SetUpTextDisplay+Cj
		lea	TextBoxSprites(pc),a0
		lea	(g_VDPSpr03_Y).l,a1
		move.w	#$000F,d0

loc_2351E:					  ; CODE XREF: ReloadTextboxSprites+10j
		move.w	(a0)+,(a1)+
		dbf	d0,loc_2351E
		rts
; End of function ReloadTextboxSprites


; =============== S U B	R O U T	I N E =======================================


ClearTextboxTiles:				  ; CODE XREF: ReloadTextbox+2p
		tst.b	(byte_FF1128).l
		beq.w	loc_2353A
		nop
		nop
		jsr	(j_WaitUntilVBlank).l

loc_2353A:					  ; CODE XREF: ClearTextboxTiles+6j
		lea	(g_ScreenBuffer).l,a0
		bsr.w	TestIfInventoryIsOpen
		bcs.s	loc_2354C
		move.w	#$08FF,d7
		bra.s	loc_23550
; ---------------------------------------------------------------------------

loc_2354C:					  ; CODE XREF: ClearTextboxTiles+1Ej
		move.w	#$0D7F,d7

loc_23550:					  ; CODE XREF: ClearTextboxTiles+24j
						  ; ClearTextboxTiles+2Ej
		move.w	#$AAAA,(a0)+
		dbf	d7,loc_23550
		rts
; End of function ClearTextboxTiles


; =============== S U B	R O U T	I N E =======================================


DMACopyTextboxTiles:				  ; CODE XREF: sub_22F7C+Ap
						  ; GetNextChar+42p ...
		bsr.w	TestIfInventoryIsOpen
		bcs.s	loc_23566
		move.w	#$0900,d0
		bra.s	loc_2356A
; ---------------------------------------------------------------------------

loc_23566:					  ; CODE XREF: DMACopyTextboxTiles+4j
		move.w	#$0D80,d0

loc_2356A:					  ; CODE XREF: DMACopyTextboxTiles+Aj
		lea	(g_ScreenBuffer).l,a0
		lea	($0000A500).l,a1
		jsr	(j_QueueDMAOp).l
		jmp	(j_FlushDMACopyQueue).l
; End of function DMACopyTextboxTiles


; =============== S U B	R O U T	I N E =======================================


sub_23582:					  ; CODE XREF: sub_22F7C+42p
		moveq	#$00000007,d6

loc_23584:					  ; CODE XREF: sub_23582+6j
		bsr.s	sub_2358E
		bsr.s	DMACopyTextboxTiles
		dbf	d6,loc_23584
		rts
; End of function sub_23582


; =============== S U B	R O U T	I N E =======================================


sub_2358E:					  ; CODE XREF: sub_23582:loc_23584p
		lea	(g_ScreenBuffer).l,a0
		moveq	#$00000023,d7
		bsr.w	TestIfInventoryIsOpen
		bcs.s	loc_235A8

loc_2359C:					  ; CODE XREF: sub_2358E+14j
		bsr.s	sub_235BE
		suba.w	#$11C0,a0
		dbf	d7,loc_2359C
		rts
; ---------------------------------------------------------------------------

loc_235A8:					  ; CODE XREF: sub_2358E+Cj
						  ; sub_2358E+20j
		bsr.s	sub_235B4
		suba.w	#$1AC0,a0
		dbf	d7,loc_235A8
		rts
; End of function sub_2358E


; =============== S U B	R O U T	I N E =======================================


sub_235B4:					  ; CODE XREF: sub_2358E:loc_235A8p
		move.l	$00000900(a0),d0
		move.l	$00000904(a0),d1
		bsr.s	sub_235D4
; End of function sub_235B4


; =============== S U B	R O U T	I N E =======================================


sub_235BE:					  ; CODE XREF: sub_2358E:loc_2359Cp
		move.l	$00000900(a0),d0
		move.l	$00000904(a0),d1
		bsr.s	sub_235D4
		move.l	#$AAAAAAAA,d0
		move.l	#$AAAAAAAA,d1
; End of function sub_235BE


; =============== S U B	R O U T	I N E =======================================


sub_235D4:					  ; CODE XREF: sub_235B4+8p
						  ; sub_235BE+8p
		movea.l	a0,a1
		addq.w	#$08,a1
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	d0,(a0)+
		move.l	d1,(a0)+
		adda.w	#$08C0,a0
		rts
; End of function sub_235D4


; =============== S U B	R O U T	I N E =======================================


sub_235FE:					  ; CODE XREF: ProcessChar+2Cp
						  ; DATA XREF: sub_22EFCt
		movem.w	d1,-(sp)
		move.w	d0,d7
		move.b	(byte_FF112A).l,d1
		bsr.s	sub_23612
		movem.w	(sp)+,d1
		rts
; End of function sub_235FE


; =============== S U B	R O U T	I N E =======================================


sub_23612:					  ; CODE XREF: sub_235FE+Cp
		move.w	d7,(word_FF1192).l
		move.w	#$0007,d4
		cmpi.b	#$00,d7
		beq.s	loc_2366C
		move.w	#$000E,d6
		cmpi.b	#$7B,d7
		beq.s	loc_23632
		cmpi.b	#$7C,d7
		bne.s	PrintChar

loc_23632:					  ; CODE XREF: sub_23612+18j
		move.w	#$0003,d6
		bsr.s	PrintChar
		sub.w	d4,(word_FF1194).l
		rts
; End of function sub_23612


; =============== S U B	R O U T	I N E =======================================


PrintChar:					  ; CODE XREF: sub_23612+1Ej
						  ; sub_23612+24p
		mulu.w	#$001E,d7
		movea.l	(MainFontPtr).l,a0
		adda.l	d7,a0
		bsr.s	sub_23676
		move.w	d6,d7
		clr.w	d4
		move.b	(byte_FF1129).l,d5

loc_23658:					  ; CODE XREF: PrintChar+28j
		bsr.w	sub_2371A
		bsr.w	sub_237AC

loc_23660:					  ; CODE XREF: sub_2371A+8Ej
		bsr.w	sub_23702
		bsr.w	sub_236CC
		dbf	d7,loc_23658

loc_2366C:					  ; CODE XREF: sub_23612+Ej
		addq.w	#$01,d4
		add.w	d4,(word_FF1194).l
		rts
; End of function PrintChar


; =============== S U B	R O U T	I N E =======================================


sub_23676:					  ; CODE XREF: PrintChar+Cp
		move.b	d1,d2
		btst	#$00,(word_FF1194+1).l
		beq.s	loc_2368A
		lsl.b	#$04,d2
		ori.b	#$0A,d2
		bra.s	loc_23690
; ---------------------------------------------------------------------------

loc_2368A:					  ; CODE XREF: sub_23676+Aj
		lsl.b	#$04,d1
		ori.b	#$0A,d1

loc_23690:					  ; CODE XREF: sub_23676+12j
		move.b	(byte_FF1129).l,d0
		move.b	d0,d3
		andi.b	#$30,d0
		lsr.b	#$03,d0
		ext.w	d0
		move.w	Mult0x0900(pc,d0.w),d0
		andi.b	#$0F,d3
		ext.w	d3
		lsl.b	#$02,d3
		add.w	d3,d0
		move.w	(word_FF1194).l,d3
		andi.b	#$F8,d3
		lsl.w	#$03,d3
		add.w	d3,d0
		lea	(g_ScreenBuffer).l,a2
		adda.w	d0,a2
		rts
; End of function sub_23676

; ---------------------------------------------------------------------------
Mult0x0900:	dc.w $0000			  ; DATA XREF: sub_23676+2Ar
		dc.w $0900
		dc.w $1200

; =============== S U B	R O U T	I N E =======================================


sub_236CC:					  ; CODE XREF: PrintChar+24p
		move.w	#$000B,d6
		cmpi.w	#$0080,(word_FF1192).l
		beq.s	loc_236FE
		lea	(word_FF1192).l,a3
		move.w	#$000B,d0
		move.w	#$000D,d6

loc_236E8:					  ; CODE XREF: sub_236CC+2Aj
		cmpi.b	#$0A,-(a3)
		beq.s	loc_236F4
		cmpi.b	#$AA,(a3)
		bne.s	loc_236FA

loc_236F4:					  ; CODE XREF: sub_236CC+20j
		subq.w	#$01,d6
		dbf	d0,loc_236E8

loc_236FA:					  ; CODE XREF: sub_236CC+26j
		cmp.w	d6,d4
		bcc.s	locret_23700

loc_236FE:					  ; CODE XREF: sub_236CC+Cj
		move.w	d6,d4

locret_23700:					  ; CODE XREF: sub_236CC+30j
		rts
; End of function sub_236CC


; =============== S U B	R O U T	I N E =======================================


sub_23702:					  ; CODE XREF: PrintChar:loc_23660p
		adda.w	#$0004,a2
		addq.b	#$01,d5
		cmpi.b	#$10,d5
		beq.s	loc_23714
		cmpi.b	#$20,d5
		bne.s	locret_23718

loc_23714:					  ; CODE XREF: sub_23702+Aj
		adda.w	#$08C4,a2

locret_23718:					  ; CODE XREF: sub_23702+10j
		rts
; End of function sub_23702


; =============== S U B	R O U T	I N E =======================================


sub_2371A:					  ; CODE XREF: PrintChar:loc_23658p
		lea	(unk_FF1186).l,a1
		move.l	#$AA0AAA0A,d0
		btst	#$00,(word_FF1194+1).l
		beq.s	loc_23736
		move.l	#$0AAA0AAA,d0

loc_23736:					  ; CODE XREF: sub_2371A+14j
		move.l	d0,(a1)
		move.l	d0,$00000004(a1)
		move.l	d0,$00000008(a1)
		move.w	(a0)+,d0
		beq.s	loc_237A4
		lsl.w	#$01,d0
		bcc.s	loc_2374A
		move.b	d1,(a1)

loc_2374A:					  ; CODE XREF: sub_2371A+2Cj
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	loc_23752
		move.b	d2,(a1)

loc_23752:					  ; CODE XREF: sub_2371A+34j
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	loc_2375A
		move.b	d1,(a1)

loc_2375A:					  ; CODE XREF: sub_2371A+3Cj
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	loc_23762
		move.b	d2,(a1)

loc_23762:					  ; CODE XREF: sub_2371A+44j
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	loc_2376A
		move.b	d1,(a1)

loc_2376A:					  ; CODE XREF: sub_2371A+4Cj
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	loc_23772
		move.b	d2,(a1)

loc_23772:					  ; CODE XREF: sub_2371A+54j
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	loc_2377A
		move.b	d1,(a1)

loc_2377A:					  ; CODE XREF: sub_2371A+5Cj
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	loc_23782
		move.b	d2,(a1)

loc_23782:					  ; CODE XREF: sub_2371A+64j
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	loc_2378A
		move.b	d1,(a1)

loc_2378A:					  ; CODE XREF: sub_2371A+6Cj
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	loc_23792
		move.b	d2,(a1)

loc_23792:					  ; CODE XREF: sub_2371A+74j
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	loc_2379A
		move.b	d1,(a1)

loc_2379A:					  ; CODE XREF: sub_2371A+7Cj
		addq.w	#$01,a1
		lsl.w	#$01,d0
		bcc.s	locret_237A2
		move.b	d2,(a1)

locret_237A2:					  ; CODE XREF: sub_2371A+84j
		rts
; ---------------------------------------------------------------------------

loc_237A4:					  ; CODE XREF: sub_2371A+28j
		movem.l	(sp)+,d0
		bra.w	loc_23660
; End of function sub_2371A


; =============== S U B	R O U T	I N E =======================================


sub_237AC:					  ; CODE XREF: PrintChar+1Cp

; FUNCTION CHUNK AT 00023836 SIZE 000000AA BYTES

		movem.w	d1,-(sp)
		lea	(unk_FF1186).l,a1
		moveq	#$0000000B,d6

loc_237B8:					  ; CODE XREF: sub_237AC:loc_23828j
		move.b	(a1)+,d0
		cmpi.b	#$0A,d0
		beq.s	loc_23828
		cmpi.b	#$AA,d0
		beq.s	loc_23828
		move.w	(word_FF1194).l,d1
		andi.w	#$0007,d1
		addi.b	#$0B,d1
		sub.w	d6,d1
		lsl.w	#$02,d1
		jmp	loc_237DC(pc,d1.w)
; ---------------------------------------------------------------------------

loc_237DC:					  ; CODE XREF: sub_237AC+2Cj
		bra.w	loc_23832
; ---------------------------------------------------------------------------
		bra.w	loc_23836
; ---------------------------------------------------------------------------
		bra.w	loc_2383E
; ---------------------------------------------------------------------------
		bra.w	loc_23844
; ---------------------------------------------------------------------------
		bra.w	loc_23850
; ---------------------------------------------------------------------------
		bra.w	loc_23856
; ---------------------------------------------------------------------------
		bra.w	loc_23862
; ---------------------------------------------------------------------------
		bra.w	loc_23868
; ---------------------------------------------------------------------------
		bra.w	loc_23874
; ---------------------------------------------------------------------------
		bra.w	loc_2387A
; ---------------------------------------------------------------------------
		bra.w	loc_23886
; ---------------------------------------------------------------------------
		bra.w	loc_2388C
; ---------------------------------------------------------------------------
		bra.w	loc_23898
; ---------------------------------------------------------------------------
		bra.w	loc_2389E
; ---------------------------------------------------------------------------
		bra.w	loc_238AC
; ---------------------------------------------------------------------------
		bra.w	loc_238B4
; ---------------------------------------------------------------------------
		bra.w	loc_238C2
; ---------------------------------------------------------------------------
		bra.w	loc_238CA
; ---------------------------------------------------------------------------
		bra.w	loc_238D8
; ---------------------------------------------------------------------------

loc_23828:					  ; CODE XREF: sub_237AC+12j
						  ; sub_237AC+18j ...
		dbf	d6,loc_237B8
		movem.w	(sp)+,d1
		rts
; ---------------------------------------------------------------------------

loc_23832:					  ; CODE XREF: sub_237AC:loc_237DCj
		move.b	d0,(a2)
		bra.s	loc_23828
; End of function sub_237AC

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_237AC

loc_23836:					  ; CODE XREF: sub_237AC+34j
		andi.b	#$F0,(a2)
		or.b	d0,(a2)
		bra.s	loc_23828
; ---------------------------------------------------------------------------

loc_2383E:					  ; CODE XREF: sub_237AC+38j
		move.b	d0,$00000001(a2)
		bra.s	loc_23828
; ---------------------------------------------------------------------------

loc_23844:					  ; CODE XREF: sub_237AC+3Cj
		andi.b	#$F0,$00000001(a2)
		or.b	d0,$00000001(a2)
		bra.s	loc_23828
; ---------------------------------------------------------------------------

loc_23850:					  ; CODE XREF: sub_237AC+40j
		move.b	d0,$00000002(a2)
		bra.s	loc_23828
; ---------------------------------------------------------------------------

loc_23856:					  ; CODE XREF: sub_237AC+44j
		andi.b	#$F0,$00000002(a2)
		or.b	d0,$00000002(a2)
		bra.s	loc_23828
; ---------------------------------------------------------------------------

loc_23862:					  ; CODE XREF: sub_237AC+48j
		move.b	d0,$00000003(a2)
		bra.s	loc_23828
; ---------------------------------------------------------------------------

loc_23868:					  ; CODE XREF: sub_237AC+4Cj
		andi.b	#$F0,$00000003(a2)
		or.b	d0,$00000003(a2)
		bra.s	loc_23828
; ---------------------------------------------------------------------------

loc_23874:					  ; CODE XREF: sub_237AC+50j
		move.b	d0,$00000040(a2)
		bra.s	loc_23828
; ---------------------------------------------------------------------------

loc_2387A:					  ; CODE XREF: sub_237AC+54j
		andi.b	#$F0,$00000040(a2)
		or.b	d0,$00000040(a2)
		bra.s	loc_23828
; ---------------------------------------------------------------------------

loc_23886:					  ; CODE XREF: sub_237AC+58j
		move.b	d0,$00000041(a2)
		bra.s	loc_23828
; ---------------------------------------------------------------------------

loc_2388C:					  ; CODE XREF: sub_237AC+5Cj
		andi.b	#$F0,$00000041(a2)
		or.b	d0,$00000041(a2)
		bra.s	loc_23828
; ---------------------------------------------------------------------------

loc_23898:					  ; CODE XREF: sub_237AC+60j
		move.b	d0,$00000042(a2)
		bra.s	loc_23828
; ---------------------------------------------------------------------------

loc_2389E:					  ; CODE XREF: sub_237AC+64j
		andi.b	#$F0,$00000042(a2)
		or.b	d0,$00000042(a2)
		bra.w	loc_23828
; ---------------------------------------------------------------------------

loc_238AC:					  ; CODE XREF: sub_237AC+68j
		move.b	d0,$00000043(a2)
		bra.w	loc_23828
; ---------------------------------------------------------------------------

loc_238B4:					  ; CODE XREF: sub_237AC+6Cj
		andi.b	#$F0,$00000043(a2)
		or.b	d0,$00000043(a2)
		bra.w	loc_23828
; ---------------------------------------------------------------------------

loc_238C2:					  ; CODE XREF: sub_237AC+70j
		move.b	d0,$00000080(a2)
		bra.w	loc_23828
; ---------------------------------------------------------------------------

loc_238CA:					  ; CODE XREF: sub_237AC+74j
		andi.b	#$F0,$00000080(a2)
		or.b	d0,$00000080(a2)
		bra.w	loc_23828
; ---------------------------------------------------------------------------

loc_238D8:					  ; CODE XREF: sub_237AC+78j
		move.b	d0,$00000081(a2)
		bra.w	loc_23828
; END OF FUNCTION CHUNK	FOR sub_237AC
; ---------------------------------------------------------------------------
TextBoxSprites:	dc.w $0121, $0304, $8528, $0001	  ; DATA XREF: ReloadTextboxSpritest
		dc.w $0121, $0305, $8528, $0001
		dc.w $0141, $0306, $8528, $0001
		dc.w $0141, $0307, $8528, $0001
