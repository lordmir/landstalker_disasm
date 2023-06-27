
; =============== S U B	R O U T	I N E =======================================


UpdateFridayAnimation:				  ; CODE XREF: WaitUntilVBlank+4p

; FUNCTION CHUNK AT 000036C2 SIZE 00000172 BYTES
; FUNCTION CHUNK AT 0000383C SIZE 00000050 BYTES
; FUNCTION CHUNK AT 000038A2 SIZE 0000011C BYTES
; FUNCTION CHUNK AT 000039F6 SIZE 0000000E BYTES

		movem.l	d0-a6,-(sp)
		move.b	(g_FridayAnimation1).l,d0
		beq.w	loc_3632
		cmpi.w	#$8A18,(g_VDPReg10_HIntLine).l ; Screen	Blanked
		beq.w	loc_3632
		cmpi.w	#$921C,(g_VDPReg18_WindowVPos).l ; Inventory open
		beq.w	loc_3632
		cmpi.b	#$10,d0
		bls.w	loc_3638
		cmpi.b	#$20,d0
		bls.w	loc_36C2
		cmpi.b	#$21,d0
		bls.w	loc_3776
		cmpi.b	#$22,d0
		bls.w	loc_379C
		cmpi.b	#$24,d0
		bls.w	loc_3632
		cmpi.b	#$30,d0
		bls.w	loc_3746
		cmpi.b	#$40,d0
		bls.w	loc_37AE
		cmpi.b	#$50,d0
		bls.w	loc_37EE
		cmpi.b	#$52,d0
		bls.w	loc_38A2
		cmpi.b	#$54,d0
		bls.w	loc_38AE
		cmpi.b	#$56,d0
		bls.w	loc_38BA
		cmpi.b	#$58,d0
		bls.w	loc_38C4
		cmpi.b	#$5A,d0
		bls.w	loc_38CE
		cmpi.b	#$5C,d0
		bls.w	loc_38D8
		cmpi.b	#$5E,d0
		bls.w	loc_38E2
		cmpi.b	#$60,d0
		bls.w	loc_38EC
		cmpi.b	#$62,d0
		bls.w	loc_38F6
		cmpi.b	#$64,d0
		bls.w	loc_3900
		cmpi.b	#$66,d0
		bls.w	loc_390A
		cmpi.b	#$68,d0
		bls.w	loc_3914
		cmpi.b	#$6A,d0
		bls.w	loc_391E
		cmpi.b	#$6C,d0
		bls.w	loc_3928
		cmpi.b	#$6E,d0
		bls.w	loc_3932
		clr.b	(g_FridayAnimation1).l

loc_3632:					  ; CODE XREF: UpdateFridayAnimation+Aj
						  ; UpdateFridayAnimation+16j ...
		movem.l	(sp)+,d0-a6
		rts
; ---------------------------------------------------------------------------

loc_3638:					  ; CODE XREF: UpdateFridayAnimation+2Aj
		cmpi.b	#$01,d0
		bhi.s	loc_3664
		clr.b	(g_FridayAnimFramecount).l
		move.b	#$02,(g_FridayAnimation1).l
		lea	(gVDPSprFriday_Y).l,a0
		move.w	#$00C8,(a0)+
		move.w	#$0A08,(a0)+
		move.w	#$C7F0,(a0)+
		move.w	#$0118,(a0)+
		bra.s	loc_3632
; ---------------------------------------------------------------------------

loc_3664:					  ; CODE XREF: UpdateFridayAnimation+EEj
		subq.w	#$02,(gVDPSprFriday_Y).l
		bsr.s	sub_3672
		bsr.s	sub_3692
		bra.w	loc_379C
; End of function UpdateFridayAnimation


; =============== S U B	R O U T	I N E =======================================


sub_3672:					  ; CODE XREF: UpdateFridayAnimation+11Cp
						  ; UpdateFridayAnimation+282p
		clr.w	d0
		move.b	(g_FridayAnimFramecount).l,d0
		addq.b	#$04,(g_FridayAnimFramecount).l
		lsr.b	#$02,d0
		cmpi.b	#$08,d0
		bcs.s	loc_368C
		eori.b	#$0F,d0

loc_368C:					  ; CODE XREF: sub_3672+14j
		move.b	byte_36BA(pc,d0.w),d0
		rts
; End of function sub_3672


; =============== S U B	R O U T	I N E =======================================


sub_3692:					  ; CODE XREF: UpdateFridayAnimation+11Ep
						  ; UpdateFridayAnimation+288p
		ext.w	d0
		addi.w	#$0118,d0
		move.w	d0,(gVDPSprFriday_X).l
		cmpi.b	#$40,(g_FridayAnimFramecount).l
		bls.s	locret_36B8
		clr.b	(g_FridayAnimation1).l
		move.b	(g_FridayAnimation2).l,(g_FridayAnimation1).l

locret_36B8:					  ; CODE XREF: sub_3692+14j
		rts
; End of function sub_3692

; ---------------------------------------------------------------------------
byte_36BA:	dc.b -$03,-$07,-$0A,-$0C,-$0D,-$0E,-$0F,-$10
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR UpdateFridayAnimation

loc_36C2:					  ; CODE XREF: UpdateFridayAnimation+32j
		cmpi.b	#$11,d0
		bhi.s	loc_36D6
		clr.b	(g_FridayAnimFramecount).l
		move.b	#$12,(g_FridayAnimation1).l

loc_36D6:					  ; CODE XREF: UpdateFridayAnimation+178j
		move.b	(g_FridayAnimFramecount).l,d0
		addq.b	#$04,(g_FridayAnimFramecount).l
		lsr.b	#$02,d0
		cmpi.b	#$20,d0
		bcc.s	loc_3738
		andi.w	#$001F,d0
		cmpi.b	#$08,d0
		bcs.s	loc_370A
		cmpi.b	#$10,d0
		bcs.s	loc_3702
		cmpi.b	#$18,d0
		bcs.s	loc_371C
		bra.s	loc_3718
; ---------------------------------------------------------------------------

loc_3702:					  ; CODE XREF: UpdateFridayAnimation+1AAj
		andi.b	#$07,d0
		eori.b	#$07,d0

loc_370A:					  ; CODE XREF: UpdateFridayAnimation+1A4j
		addq.w	#$01,(gVDPSprFriday_Y).l
		move.b	byte_36BA(pc,d0.w),d0
		neg.b	d0
		bra.s	loc_372A
; ---------------------------------------------------------------------------

loc_3718:					  ; CODE XREF: UpdateFridayAnimation+1B2j
		eori.b	#$0F,d0

loc_371C:					  ; CODE XREF: UpdateFridayAnimation+1B0j
		andi.b	#$07,d0
		subq.w	#$01,(gVDPSprFriday_Y).l
		move.b	byte_36BA(pc,d0.w),d0

loc_372A:					  ; CODE XREF: UpdateFridayAnimation+1C8j
		ext.w	d0
		addi.w	#$0118,d0
		move.w	d0,(gVDPSprFriday_X).l
		bra.s	loc_379C
; ---------------------------------------------------------------------------

loc_3738:					  ; CODE XREF: UpdateFridayAnimation+19Aj
		move.b	(g_FridayAnimation2).l,(g_FridayAnimation1).l
		bra.w	loc_3632
; ---------------------------------------------------------------------------

loc_3746:					  ; CODE XREF: UpdateFridayAnimation+52j
		move.b	(g_FridayAnimation2).l,(g_FridayAnimation1).l
		addq.b	#$01,(g_FridayAnimFramecount).l
		lea	(gVDPSprFriday_Y).l,a0
		btst	#$00,(g_FridayAnimFramecount).l
		beq.s	loc_376E
		addq.w	#$01,(a0)
		addq.w	#$01,$00000006(a0)
		bra.s	loc_379C
; ---------------------------------------------------------------------------

loc_376E:					  ; CODE XREF: UpdateFridayAnimation+216j
		subq.w	#$01,(a0)
		subq.w	#$01,$00000006(a0)
		bra.s	loc_379C
; ---------------------------------------------------------------------------

loc_3776:					  ; CODE XREF: UpdateFridayAnimation+3Aj
		lea	(gVDPSprFriday_Y).l,a0
		move.w	#$00A6,(a0)+
		move.w	#$0A08,(a0)+
		move.w	#$C7F0,(a0)+
		move.w	#$0115,(a0)+
		move.b	(g_FridayAnimation2).l,(g_FridayAnimation1).l
		addq.b	#$01,(g_FridayAnimFramecount).l

loc_379C:					  ; CODE XREF: UpdateFridayAnimation+42j
						  ; UpdateFridayAnimation+120j	...
		move.b	(g_FridayAnimFramecount).l,d3
		andi.w	#$000C,d3
		bsr.w	sub_388C
		bra.w	loc_3632
; ---------------------------------------------------------------------------

loc_37AE:					  ; CODE XREF: UpdateFridayAnimation+5Aj
		cmpi.b	#$31,d0
		bhi.w	loc_37CA
		clr.b	(g_FridayAnimFramecount).l
		move.b	#$32,(g_FridayAnimation1).l
		clr.b	(g_FridayAnimation2).l

loc_37CA:					  ; CODE XREF: UpdateFridayAnimation+264j
		addq.w	#$02,(gVDPSprFriday_Y).l
		bsr.w	sub_3672
		neg.b	d0
		bsr.w	sub_3692
		tst.b	(g_FridayAnimation1).l
		bne.s	loc_37EC
		clr.w	(gVDPSprFriday_Y).l
		bra.w	loc_3632
; ---------------------------------------------------------------------------

loc_37EC:					  ; CODE XREF: UpdateFridayAnimation+292j
		bra.s	loc_379C
; ---------------------------------------------------------------------------

loc_37EE:					  ; CODE XREF: UpdateFridayAnimation+62j
		cmpi.b	#$41,d0
		bhi.w	loc_3804
		clr.b	(g_FridayAnimFramecount).l
		move.b	#$42,(g_FridayAnimation1).l

loc_3804:					  ; CODE XREF: UpdateFridayAnimation+2A4j
		move.b	(g_FridayAnimFramecount).l,d0
		addq.b	#$01,(g_FridayAnimFramecount).l
		move.w	#$0008,d2
		tst.b	d0
		bne.s	loc_381C
		clr.w	d3
		bra.s	loc_3886
; ---------------------------------------------------------------------------

loc_381C:					  ; CODE XREF: UpdateFridayAnimation+2C8j
		cmpi.b	#$0A,d0
		bne.s	loc_3828
		move.w	#$0004,d3
		bra.s	loc_3886
; ---------------------------------------------------------------------------

loc_3828:					  ; CODE XREF: UpdateFridayAnimation+2D2j
		cmpi.b	#$1E,d0
		bcs.w	loc_3632
		bne.s	loc_383C
		trap	#$00			  ; Trap00Handler
; END OF FUNCTION CHUNK	FOR UpdateFridayAnimation
; ---------------------------------------------------------------------------
		dc.w SND_FridayMagic
; ---------------------------------------------------------------------------
		move.w	#$0008,d3
		bra.s	loc_3886
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR UpdateFridayAnimation

loc_383C:					  ; CODE XREF: UpdateFridayAnimation+2E2j
		cmpi.b	#$3C,d0
		bcc.s	loc_3872
		clr.w	d1
		btst	#$00,d0
		bne.s	loc_384E
		move.w	#$0EEE,d1

loc_384E:					  ; CODE XREF: UpdateFridayAnimation+2FAj
		move.l	#$C0000000,(VDP_CTRL_REG).l
		move.w	d1,(VDP_DATA_REG).l
		move.l	#$C01E0000,(VDP_CTRL_REG).l
		move.w	d1,(VDP_DATA_REG).l
		bra.w	loc_3632
; ---------------------------------------------------------------------------

loc_3872:					  ; CODE XREF: UpdateFridayAnimation+2F2j
		move.b	#$21,(g_FridayAnimation1).l
		move.b	#$21,(g_FridayAnimation2).l
		bra.w	loc_3632
; ---------------------------------------------------------------------------

loc_3886:					  ; CODE XREF: UpdateFridayAnimation+2CCj
						  ; UpdateFridayAnimation+2D8j	...
		bsr.s	sub_3890
		bra.w	loc_3632
; END OF FUNCTION CHUNK	FOR UpdateFridayAnimation

; =============== S U B	R O U T	I N E =======================================


sub_388C:					  ; CODE XREF: UpdateFridayAnimation+258p
		move.w	#$0004,d2
; End of function sub_388C


; =============== S U B	R O U T	I N E =======================================


sub_3890:					  ; CODE XREF: UpdateFridayAnimation:loc_3886p
		move.l	#$00000063,d0
		move.w	#$07F0,d1
		bsr.w	sub_46DC
		bra.w	EnableDMAQueueProcessing
; End of function sub_3890

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR UpdateFridayAnimation

loc_38A2:					  ; CODE XREF: UpdateFridayAnimation+6Aj
		lea	FridayAnimation1(pc),a1
		move.b	#$51,d1
		bra.w	loc_393A
; ---------------------------------------------------------------------------

loc_38AE:					  ; CODE XREF: UpdateFridayAnimation+72j
		lea	FridayAnimation2(pc),a1
		move.b	#$53,d1
		bra.w	loc_393A
; ---------------------------------------------------------------------------

loc_38BA:					  ; CODE XREF: UpdateFridayAnimation+7Aj
		lea	FridayAnimation3(pc),a1
		move.b	#$55,d1
		bra.s	loc_393A
; ---------------------------------------------------------------------------

loc_38C4:					  ; CODE XREF: UpdateFridayAnimation+82j
		lea	FridayAnimation4(pc),a1
		move.b	#$57,d1
		bra.s	loc_393A
; ---------------------------------------------------------------------------

loc_38CE:					  ; CODE XREF: UpdateFridayAnimation+8Aj
		lea	FridayAnimation5(pc),a1
		move.b	#$59,d1
		bra.s	loc_393A
; ---------------------------------------------------------------------------

loc_38D8:					  ; CODE XREF: UpdateFridayAnimation+92j
		lea	FridayAnimation6(pc),a1
		move.b	#$5B,d1
		bra.s	loc_393A
; ---------------------------------------------------------------------------

loc_38E2:					  ; CODE XREF: UpdateFridayAnimation+9Aj
		lea	FridayAnimation7(pc),a1
		move.b	#$5D,d1
		bra.s	loc_393A
; ---------------------------------------------------------------------------

loc_38EC:					  ; CODE XREF: UpdateFridayAnimation+A2j
		lea	FridayAnimation8(pc),a1
		move.b	#$5F,d1
		bra.s	loc_393A
; ---------------------------------------------------------------------------

loc_38F6:					  ; CODE XREF: UpdateFridayAnimation+AAj
		lea	FridayAnimation9(pc),a1
		move.b	#$61,d1
		bra.s	loc_393A
; ---------------------------------------------------------------------------

loc_3900:					  ; CODE XREF: UpdateFridayAnimation+B2j
		lea	FridayAnimation10(pc),a1
		move.b	#$63,d1
		bra.s	loc_393A
; ---------------------------------------------------------------------------

loc_390A:					  ; CODE XREF: UpdateFridayAnimation+BAj
		lea	FridayAnimation11(pc),a1
		move.b	#$65,d1
		bra.s	loc_393A
; ---------------------------------------------------------------------------

loc_3914:					  ; CODE XREF: UpdateFridayAnimation+C2j
		lea	FridayAnimation12(pc),a1
		move.b	#$67,d1
		bra.s	loc_393A
; ---------------------------------------------------------------------------

loc_391E:					  ; CODE XREF: UpdateFridayAnimation+CAj
		lea	FridayAnimation13(pc),a1
		move.b	#$69,d1
		bra.s	loc_393A
; ---------------------------------------------------------------------------

loc_3928:					  ; CODE XREF: UpdateFridayAnimation+D2j
		lea	FridayAnimation14(pc),a1
		move.b	#$6B,d1
		bra.s	loc_393A
; ---------------------------------------------------------------------------

loc_3932:					  ; CODE XREF: UpdateFridayAnimation+DAj
		lea	FridayAnimation15(pc),a1
		move.b	#$6D,d1

loc_393A:					  ; CODE XREF: UpdateFridayAnimation+35Cj
						  ; UpdateFridayAnimation+368j	...
		cmp.b	d1,d0
		bhi.s	loc_3968
		clr.b	(g_FridayAnimFramecount).l
		addq.b	#$01,(g_FridayAnimation1).l
		lea	(gVDPSprFriday_Y).l,a0
		move.w	(a1)+,(a0)+
		move.w	#$0A08,(a0)+
		move.w	#$C7F0,(a0)+
		move.w	(a1)+,(a0)+
		move.l	a1,(g_FridayAnimPtr).l
		clr.w	(word_FF12E6).l

loc_3968:					  ; CODE XREF: UpdateFridayAnimation+3EEj
		movea.l	(g_FridayAnimPtr).l,a1
		tst.w	(word_FF12E6).l
		bne.s	loc_398E
		move.w	(a1)+,d0
		bmi.s	loc_39F6
		move.w	d0,(word_FF12E6).l
		addq.w	#$01,(word_FF12E6).l
		addq.w	#$04,a1
		move.l	a1,(g_FridayAnimPtr).l

loc_398E:					  ; CODE XREF: UpdateFridayAnimation+426j
		bsr.s	sub_39BE
		subq.w	#$01,(word_FF12E6).l
		move.w	(word_FF12E8).l,d0
		add.w	d0,(gVDPSprFriday_X).l
		move.w	(word_FF12EA).l,d0
		add.w	d0,(gVDPSprFriday_Y).l
		move.b	(g_FridayAnimFramecount).l,d0
		addq.b	#$04,(g_FridayAnimFramecount).l
		bra.w	loc_379C
; END OF FUNCTION CHUNK	FOR UpdateFridayAnimation

; =============== S U B	R O U T	I N E =======================================


sub_39BE:					  ; CODE XREF: UpdateFridayAnimation:loc_398Ep
		move.w	(word_FF12E6).l,d0
		move.w	-$00000004(a1),d2
		move.w	(gVDPSprFriday_X).l,d1
		sub.w	d2,d1
		ext.l	d1
		divs.w	d0,d1
		neg.w	d1
		move.w	d1,(word_FF12E8).l
		move.w	-$00000002(a1),d2
		move.w	(gVDPSprFriday_Y).l,d1
		sub.w	d2,d1
		ext.l	d1
		divs.w	d0,d1
		neg.w	d1
		move.w	d1,(word_FF12EA).l
		rts
; End of function sub_39BE

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR UpdateFridayAnimation

loc_39F6:					  ; CODE XREF: UpdateFridayAnimation+42Aj
		move.b	(g_FridayAnimation2).l,(g_FridayAnimation1).l
		bra.w	loc_379C
; END OF FUNCTION CHUNK	FOR UpdateFridayAnimation
; ---------------------------------------------------------------------------
