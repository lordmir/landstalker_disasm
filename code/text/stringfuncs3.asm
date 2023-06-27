
; =============== S U B	R O U T	I N E =======================================


InitHuffmanDecomp:				  ; CODE XREF: PrintString+1Ap
		move.b	#CHR_55,(g_curDecomprChar).l ; 1st char	is always 55
		clr.w	(word_FF1922).l
		clr.w	(word_FF1920).l
		rts
; End of function InitHuffmanDecomp


; =============== S U B	R O U T	I N E =======================================


DecodeChar:					  ; CODE XREF: GetNextChar+10p
		movem.l	d1-d7/a1-a3,-(sp)
		lea	(word_FF1922).l,a3
		move.w	(a3),d6
		move.w	-$00000002(a3),d7
		clr.w	d1
		move.b	-$00000022(a3),d1
		add.w	d1,d1
		lea	HuffTableOffsets(pc),a1
		move.w	(a1,d1.w),d1
		lea	HuffTables(pc),a1
		adda.w	d1,a1
		movea.l	a1,a2
		clr.w	d3
		clr.w	d5

loc_246DE:					  ; CODE XREF: DecodeChar+42j
						  ; DecodeChar+5Cj
		dbf	d3,_SkipReadingHuffByte
		moveq	#$00000007,d3		  ; D3 - Tree Bit Counter
		move.b	(a1)+,d2		  ; d2 - Tree byte

_SkipReadingHuffByte:				  ; CODE XREF: DecodeChar:loc_246DEj
		add.b	d2,d2
		bcs.s	loc_24710		  ; Next tree bit set? END
		dbf	d6,_SkipReadingStringByte
		moveq	#$00000007,d6		  ; d6 - Src String Bit	Counter
		move.b	(a0)+,d7		  ; d7 - Src String Byte

_SkipReadingStringByte:				  ; CODE XREF: DecodeChar+38j
		add.b	d7,d7
		bcc.s	loc_246DE		  ; Next string	bit clear?
		clr.w	d4			  ; d4 - tree depth

loc_246F8:					  ; CODE XREF: DecodeChar+54j
						  ; DecodeChar+58j
		dbf	d3,_SkipReadingHuffByte1  ; Get	next bit
		moveq	#$00000007,d3
		move.b	(a1)+,d2

_SkipReadingHuffByte1:				  ; CODE XREF: DecodeChar:loc_246F8j
		add.b	d2,d2			  ; Get	next bit
		bcs.s	loc_24708		  ; MSB	set?
		addq.w	#$01,d4			  ; Increment d4 and loop
		bra.s	loc_246F8
; ---------------------------------------------------------------------------

loc_24708:					  ; CODE XREF: DecodeChar+50j
		subq.w	#$01,d5			  ; Decrement d5 - Leaf	index
		dbf	d4,loc_246F8		  ; Decrement d4, loop back if non-zero
		bra.s	loc_246DE
; ---------------------------------------------------------------------------

loc_24710:					  ; CODE XREF: DecodeChar+36j
		move.b	-$00000001(a2,d5.w),d0
		move.w	d6,(a3)
		move.w	d7,-$00000002(a3)
		move.b	d0,-$00000022(a3)
		movem.l	(sp)+,d1-d7/a1-a3
		rts
; End of function DecodeChar


; =============== S U B	R O U T	I N E =======================================


YesNoPrompt:					  ; DATA XREF: j_YesNoPromptt
		bsr.w	sub_24998
		move.w	#$0050,(word_FF1194).l
		move.w	#$0000,d0		  ; Yes
		jsr	(sub_22EC8).l
		move.w	#$00A0,(word_FF1194).l
		move.w	#$0001,d0		  ; No
		jsr	(sub_22EC8).l
		move.b	(byte_FF1129).l,d1
		ext.w	d1
		addi.w	#$0124,d1
		move.b	#$05,(g_VDPSpr02_Size).l
		move.w	#$E524,(g_VDPSpr02_TileSource).l
		move.w	#$00D0,(g_VDPSpr02_X).l
		clr.b	(word_FF1800).l
		clr.b	d2

loc_24778:					  ; CODE XREF: YesNoPrompt+AEj
						  ; YesNoPrompt+DCj ...
		move.w	d1,(g_VDPSpr02_Y).l
		tst.b	(word_FF1800).l
		bpl.s	loc_2478C
		clr.w	(g_VDPSpr02_Y).l

loc_2478C:					  ; CODE XREF: YesNoPrompt+60j
		jsr	(j_WaitUntilVBlank).l
		jsr	(j_WaitForZ80).l
		move.b	(g_Controller1State).l,d0
		and.b	d2,d0
		andi.b	#$70,d0
		beq.s	loc_247AE
		btst	#$04,d0
		bne.s	loc_24822
		bra.s	loc_247D4
; ---------------------------------------------------------------------------

loc_247AE:					  ; CODE XREF: YesNoPrompt+80j
		move.b	(g_Controller1State).l,d2
		eori.b	#$70,d2
		btst	#CTRL_RIGHT,(g_Controller1State).l
		bne.s	loc_247E8
		btst	#CTRL_LEFT,(g_Controller1State).l
		bne.s	loc_24804

loc_247CC:					  ; CODE XREF: YesNoPrompt+CCj
						  ; YesNoPrompt+E8j
		addq.b	#$08,(word_FF1800).l
		bra.s	loc_24778
; ---------------------------------------------------------------------------

loc_247D4:					  ; CODE XREF: YesNoPrompt+88j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MenuOpen
; ---------------------------------------------------------------------------
		clr.w	(g_VDPSpr02_Y).l
		cmpi.w	#$00D1,(g_VDPSpr02_X).l
		rts
; ---------------------------------------------------------------------------

loc_247E8:					  ; CODE XREF: YesNoPrompt+9Cj
		cmpi.w	#$0120,(g_VDPSpr02_X).l
		beq.s	loc_247CC
		move.w	#$0120,(g_VDPSpr02_X).l
		clr.b	(word_FF1800).l
		bra.w	loc_24778
; ---------------------------------------------------------------------------

loc_24804:					  ; CODE XREF: YesNoPrompt+A6j
		cmpi.w	#$00D0,(g_VDPSpr02_X).l
		beq.w	loc_247CC
		move.w	#$00D0,(g_VDPSpr02_X).l
		clr.b	(word_FF1800).l
		bra.w	loc_24778
; ---------------------------------------------------------------------------

loc_24822:					  ; CODE XREF: YesNoPrompt+86j
		clr.w	(g_VDPSpr02_Y).l
		tst.b	d0
		rts
; End of function YesNoPrompt


; =============== S U B	R O U T	I N E =======================================


sub_2482C:					  ; DATA XREF: sub_22E88t
		bsr.w	sub_24998
		bsr.w	ClearTextbox
		move.w	#$0050,(word_FF1194).l
		move.w	#$0002,d0
		jsr	(sub_22EC8).l
		move.w	#$00A0,(word_FF1194).l
		move.w	#$0003,d0
		jsr	(sub_22EC8).l
		move.b	(byte_FF1129).l,d1
		ext.w	d1
		addi.w	#$0134,d1
		move.b	#$05,(g_VDPSpr79_Size).l
		move.w	#$8524,(g_VDPSpr79_TileSource).l
		move.w	#$00D0,(g_VDPSpr79_X).l
		move.w	d1,(g_VDPSpr79_Y).l
		move.w	d1,(word_FF1800).l
		rts
; End of function sub_2482C


; =============== S U B	R O U T	I N E =======================================


sub_2488A:					  ; DATA XREF: sub_22E8Ct
		move.w	(word_FF1800).l,d1
		clr.b	(word_FF1800).l
		clr.b	d2

loc_24898:					  ; CODE XREF: sub_2488A+6Aj
						  ; sub_2488A+C4j ...
		move.w	d1,(g_VDPSpr79_Y).l
		tst.b	(word_FF1800).l
		bpl.s	loc_248AC
		clr.w	(g_VDPSpr79_Y).l

loc_248AC:					  ; CODE XREF: sub_2488A+1Aj
		jsr	(j_WaitUntilVBlank).l
		jsr	(j_WaitForZ80).l
		move.b	(g_Controller1State).l,d0
		and.b	d2,d0
		andi.b	#$70,d0
		beq.s	loc_248D0
		btst	#$04,d0
		bne.w	loc_2498E
		bra.s	loc_248F6
; ---------------------------------------------------------------------------

loc_248D0:					  ; CODE XREF: sub_2488A+3Aj
		move.b	(g_Controller1State).l,d2
		eori.b	#$70,d2
		btst	#CTRL_RIGHT,(g_Controller1State).l
		bne.s	loc_24916
		btst	#CTRL_LEFT,(g_Controller1State).l
		bne.s	loc_24952

loc_248EE:					  ; CODE XREF: sub_2488A+94j
						  ; sub_2488A+D0j
		addq.b	#$08,(word_FF1800).l
		bra.s	loc_24898
; ---------------------------------------------------------------------------

loc_248F6:					  ; CODE XREF: sub_2488A+44j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MenuOpen
; ---------------------------------------------------------------------------
		move.w	d1,(g_VDPSpr79_Y).l
		clr.b	d0
		cmpi.w	#$00D0,(g_VDPSpr79_X).l
		beq.s	loc_24910
		move.b	#$01,d0

loc_24910:					  ; CODE XREF: sub_2488A+80j
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_24916:					  ; CODE XREF: sub_2488A+58j
		cmpi.w	#$0120,(g_VDPSpr79_X).l
		beq.w	loc_248EE
		move.w	#$0120,(g_VDPSpr79_X).l
		move.b	#$05,(g_VDPSpr79_Size).l
		move.w	#$8524,(g_VDPSpr79_TileSource).l
		clr.b	(word_FF1800).l
		movem.w	d1-d2,-(sp)
		jsr	(sub_39E).l
		movem.w	(sp)+,d1-d2
		bra.w	loc_24898
; ---------------------------------------------------------------------------

loc_24952:					  ; CODE XREF: sub_2488A+62j
		cmpi.w	#$00D0,(g_VDPSpr79_X).l
		beq.w	loc_248EE
		move.w	#$00D0,(g_VDPSpr79_X).l
		move.b	#$05,(g_VDPSpr79_Size).l
		move.w	#$8524,(g_VDPSpr79_TileSource).l
		clr.b	(word_FF1800).l
		movem.w	d1-d2,-(sp)
		jsr	(sub_398).l
		movem.w	(sp)+,d1-d2
		bra.w	loc_24898
; ---------------------------------------------------------------------------

loc_2498E:					  ; CODE XREF: sub_2488A+40j
		clr.w	(g_VDPSpr79_Y).l
		tst.b	d0
		rts
; End of function sub_2488A


; =============== S U B	R O U T	I N E =======================================


sub_24998:					  ; CODE XREF: YesNoPromptp
						  ; sub_2482Cp
		lea	RightArrowGfx(pc),a0
		lea	($0000A480).l,a1
		move.w	#$0040,d0
		jsr	(j_QueueDMAOp).l
		jsr	(j_EnableDMAQueueProcessing).l
		rts
; End of function sub_24998

; ---------------------------------------------------------------------------
