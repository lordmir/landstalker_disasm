
; =============== S U B	R O U T	I N E =======================================


FadeToBlack_0:					  ; CODE XREF: ROM:00025030p
						  ; ROM:00025082p
		movem.l	d0-a6,-(sp)
		jsr	(j_FadeToBlack).l
		movem.l	(sp)+,d0-a6
		rts
; End of function FadeToBlack_0


; =============== S U B	R O U T	I N E =======================================


FadeFromBlack_0:				  ; CODE XREF: ROM:0002509Cp
		movem.l	d0-a6,-(sp)
		jsr	(j_FadeFromBlack).l
		movem.l	(sp)+,d0-a6
		rts
; End of function FadeFromBlack_0

; ---------------------------------------------------------------------------
		movem.l	d0-d3/a0,-(sp)
		move.w	#$FFFF,d0
		bsr.w	sub_29F60
		bsr.w	sub_29F42
		clr.w	d0
		bsr.w	sub_29D52
		clr.w	d1
		move.w	#$009F,d2

loc_29B08:					  ; CODE XREF: ROM:00029B20j
		lea	(unk_FF193E).l,a0
		move.w	d1,d3

loc_29B10:					  ; CODE XREF: ROM:00029B12j
		move.w	d1,(a0)+
		dbf	d3,loc_29B10
		move.w	#$0004,d0
		bsr.w	sub_29DE6
		addq.w	#$01,d1
		dbf	d2,loc_29B08
		bsr.w	sub_29EA4
		movem.l	(sp)+,d0-d3/a0
		rts
; ---------------------------------------------------------------------------
		bra.w	SpellBook
; ---------------------------------------------------------------------------
		movem.l	d0-a1,-(sp)
		move.w	#$FFFF,d0
		bsr.w	sub_29F60
		bsr.w	sub_29F42
		clr.w	d0
		bsr.w	sub_29D52
		move.w	#$003F,d1

loc_29B4C:					  ; CODE XREF: ROM:00029B72j
		lea	(word_FF1A7E).l,a0
		move.w	#$009F,d2

loc_29B56:					  ; CODE XREF: ROM:00029B66j
		move.w	d2,d3
		subi.w	#$0050,d3
		muls.w	d1,d3
		asr.w	#$06,d3
		addi.w	#$0050,d3
		move.w	d3,-(a0)
		dbf	d2,loc_29B56
		move.w	#$0004,d0
		bsr.w	sub_29DE6
		dbf	d1,loc_29B4C
		move.w	#$0003,d0
		jsr	sub_29DC4(pc)
		nop
		lea	((g_HorizontalScrollData+$60)).l,a0
		clr.w	d1
		move.w	(word_FF1B04).l,d2
		move.l	#$009F0000,d7
		move.w	#$004F,d3

loc_29B98:					  ; CODE XREF: ROM:00029BD2j
		movea.l	a0,a1
		move.w	#$0050,d4
		move.w	#$009F,d5

loc_29BA2:					  ; CODE XREF: ROM:00029BB0j
		move.w	d4,d6
		muls.w	d1,d6
		asr.w	#$06,d6
		add.w	d2,d6
		move.w	d6,(a1)+
		move.w	d6,(a1)+
		subq.w	#$01,d4
		dbf	d5,loc_29BA2
		addq.w	#$03,d1
		move.w	d7,d0
		bsr.w	sub_29FAA
		addq.w	#$01,d7
		swap	d7
		move.w	d7,d0
		bsr.w	sub_29FAA
		subq.w	#$01,d7
		swap	d7
		move.w	#$000D,d0
		bsr.w	sub_29DE6
		dbf	d3,loc_29B98
		bsr.w	sub_29EA4
		movem.l	(sp)+,d0-a1
		rts

; =============== S U B	R O U T	I N E =======================================


SpellBook:					  ; CODE XREF: ROM:00025124p
						  ; ROM:00029B2Ej
						  ; DATA XREF: ...
		movem.l	d0-a2,-(sp)
		lea	(g_Buffer).l,a0
		clr.w	d0
		move.w	#$045F,d1

loc_29BF0:					  ; CODE XREF: SpellBook+12j
		move.w	d0,(a0)+
		dbf	d1,loc_29BF0
		lea	((g_Buffer+$140)).l,a0
		lea	word_29C78(pc),a1
		movem.w	(a1)+,d1-d7
		bsr.w	sub_2A206
		movem.w	(a1)+,d5/d7
		bsr.w	sub_2A206
		move.w	#$0003,d0
		bsr.w	sub_29D52
		move.l	#$00010001,d1
		moveq	#$00000001,d2
		moveq	#$00000001,d3
		moveq	#$00000007,d4
		bsr.w	sub_29FC6
		lea	(g_Buffer).l,a0
		move.w	#$03BF,d1

loc_29C32:					  ; CODE XREF: SpellBook+7Aj
		movea.l	a0,a1
		lea	((g_HorizontalScrollData+$60)).l,a2
		move.w	#$00A0,d2

loc_29C3E:					  ; CODE XREF: SpellBook+6Cj
		move.w	(a1)+,d0
		asr.w	#$08,d0
		add.w	(word_FF1B04).l,d0
		move.w	d0,(a2)+
		move.w	d0,(a2)+
		dbf	d2,loc_29C3E
		move.w	#$0001,d0
		bsr.w	sub_29DE6
		addq.l	#$02,a0
		dbf	d1,loc_29C32
		move.l	#$00010001,d1
		moveq	#$00000001,d2
		moveq	#$00000001,d3
		moveq	#$00000007,d4
		bsr.w	sub_29FEA
		bsr.w	sub_29EA4
		movem.l	(sp)+,d0-a2
		rts
; End of function SpellBook

; ---------------------------------------------------------------------------
word_29C78:	dc.w $0000,$0008,$0002,$0100,$0004,$0000,$027F ; DATA XREF: SpellBook+1Ct
		dc.w $FFF0,$009F

; =============== S U B	R O U T	I N E =======================================


CurePaletteEffect:					  ; CODE XREF: ROM:00024FC4p
		movem.l	d0-d4,-(sp)
		move.w	#$0003,d0
		bsr.w	sub_29D52
		moveq	#$00000005,d2
		moveq	#$00000001,d3
		moveq	#$00000007,d4
		move.l	#$00020100,d1
		bsr.w	sub_29FC6
		move.l	#$00010102,d1
		bsr.w	sub_29FC6
		move.l	#$00020202,d1
		bsr.w	sub_29FEA
		bsr.w	sub_29EA4
		movem.l	(sp)+,d0-d4
		rts
; End of function sub_29C8A


; =============== S U B	R O U T	I N E =======================================


sub_29CC4:					  ; CODE XREF: ROM:00029018p
		movem.l	d0-d4/a0-a1,-(sp)
		move.w	#$0003,d0
		bsr.w	sub_29D52
		move.l	#$00010101,d1
		moveq	#$00000001,d2
		moveq	#$00000002,d3
		moveq	#$00000003,d4
		bsr.w	sub_2A020
		lea	(unk_FF1A84).l,a0
		lea	(unk_FF1B0C).l,a1
		move.w	#$000F,d1

loc_29CF0:					  ; CODE XREF: sub_29CC4+2Ej
		move.l	(a0)+,(a1)+
		dbf	d1,loc_29CF0
		lea	(g_Pal0Base).l,a0
		lea	(unk_FF1A84).l,a1
		move.w	#$000F,d1

loc_29D06:					  ; CODE XREF: sub_29CC4+44j
		move.l	(a0)+,(a1)+
		dbf	d1,loc_29D06
		bsr.w	sub_29EA4
		movem.l	(sp)+,d0-d4/a0-a1
		rts
; End of function sub_29CC4


; =============== S U B	R O U T	I N E =======================================


sub_29D16:					  ; CODE XREF: sub_29026+Ap
		movem.l	d0-d4,-(sp)
		move.w	#$0003,d0
		bsr.w	sub_29D52
		lea	(unk_FF1B0C).l,a0
		lea	(unk_FF1A84).l,a1
		move.w	#$000F,d1

loc_29D32:					  ; CODE XREF: sub_29D16+1Ej
		move.l	(a0)+,(a1)+
		dbf	d1,loc_29D32
		move.l	#$00010101,d1
		moveq	#$00000001,d2
		moveq	#$00000002,d3
		moveq	#$00000003,d4
		bsr.w	sub_2A044
		bsr.w	sub_29EA4
		movem.l	(sp)+,d0-d4
		rts
; End of function sub_29D16


; =============== S U B	R O U T	I N E =======================================


sub_29D52:					  ; CODE XREF: ROM:00029AFEp
						  ; ROM:00029B44p ...
		movem.l	d0-d2/a0-a1,-(sp)
		move.l	d0,-(sp)
		lea	(word_FF1A7E).l,a0
		moveq	#$00000001,d0
		jsr	(j_GetVDPReg).l
		move.w	d0,(a0)+
		moveq	#$0000000B,d0
		jsr	(j_GetVDPReg).l
		move.w	d0,(a0)+
		moveq	#$0000000F,d0
		jsr	(j_GetVDPReg).l
		move.w	d0,(a0)+
		move.w	#$8F02,d0
		jsr	(j_SetVDPReg).l
		lea	(g_Pal0Base).l,a1
		moveq	#$0000003F,d0

loc_29D8E:					  ; CODE XREF: sub_29D52+3Ej
		move.w	(a1)+,(a0)+
		dbf	d0,loc_29D8E
		move.l	(g_HorizontalScrollData).l,(a0)+
		move.l	(g_VSRAMData).l,(a0)+
		bsr.w	sub_29EFE
		bsr.w	sub_29F20
		jsr	(j_QueueHScrollDMAUpdate).l
		jsr	(j_QueueVSRAMUpdate).l
		jsr	(j_FlushDMACopyQueue).l
		move.l	(sp)+,d0
		bsr.s	sub_29DC4
		movem.l	(sp)+,d0-d2/a0-a1
		rts
; End of function sub_29D52


; =============== S U B	R O U T	I N E =======================================


sub_29DC4:					  ; CODE XREF: sub_29D52+6Ap
						  ; DATA XREF: ROM:00029B7At
		movem.l	d0-d1,-(sp)
		move.w	d0,d1
		andi.w	#$0007,d1
		move.w	(word_FF1A80).l,d0
		andi.w	#$FFF8,d0
		or.w	d1,d0
		jsr	(j_SetVDPReg).l
		movem.l	(sp)+,d0-d1
		rts
; End of function sub_29DC4


; =============== S U B	R O U T	I N E =======================================


sub_29DE6:					  ; CODE XREF: ROM:00029B1Ap
						  ; ROM:00029B6Ep ...
		movem.l	d0-a2,-(sp)
		move.w	d0,d7
		btst	#$00,d7
		beq.s	loc_29DF8
		jsr	(j_QueueHScrollDMAUpdate).l

loc_29DF8:					  ; CODE XREF: sub_29DE6+Aj
		btst	#$01,d7
		beq.s	loc_29E04
		jsr	(j_QueueVSRAMUpdate).l

loc_29E04:					  ; CODE XREF: sub_29DE6+16j
		btst	#$04,d7
		beq.s	loc_29E10
		jsr	(j_CopyBasePalleteToActivePalette).l

loc_29E10:					  ; CODE XREF: sub_29DE6+22j
		jsr	(j_FlushDMACopyQueue).l
		move.w	d7,d0
		andi.w	#$000C,d0
		beq.w	loc_29E9E
		lea	(VDP_DATA_REG).l,a0
		lea	(VDP_CTRL_REG).l,a1
		lea	(unk_FF193E).l,a2

loc_29E32:					  ; CODE XREF: sub_29DE6+54j
						  ; sub_29DE6+70j
		btst	#$02,(VDP_CTRL_REG+1).l
		beq.s	loc_29E32

loc_29E3C:					  ; CODE XREF: sub_29DE6+B4j
		clr.w	d0

loc_29E3E:					  ; CODE XREF: sub_29DE6+60j
		btst	#$02,(VDP_CTRL_REG+1).l
		bne.s	loc_29E3E
		move.b	(VDP_HVCTR_REG).l,d0
		subi.w	#$0016,d0
		cmpi.w	#$00A0,d0
		bcc.s	loc_29E32
		move.w	(word_FF1A7E).l,d1
		btst	#$03,d7
		beq.s	loc_29E6E
		bsr.w	sub_29F72
		bne.s	loc_29E6E
		bclr	#$06,d1

loc_29E6E:					  ; CODE XREF: sub_29DE6+7Cj
						  ; sub_29DE6+82j
		move.w	(word_FF1B08).l,d2
		btst	#$02,d7
		beq.s	loc_29E7E
		add.w	(a2)+,d2
		sub.w	d0,d2

loc_29E7E:					  ; CODE XREF: sub_29DE6+92j
						  ; sub_29DE6+A0j
		btst	#$02,(VDP_CTRL_REG+1).l
		beq.s	loc_29E7E
		move.w	d1,(a1)
		move.w	#$4000,(a1)
		move.w	#$0010,(a1)
		move.w	d2,(a0)
		move.w	d2,(a0)
		cmpi.w	#$009F,d0
		bcs.w	loc_29E3C

loc_29E9E:					  ; CODE XREF: sub_29DE6+36j
		movem.l	(sp)+,d0-a2
		rts
; End of function sub_29DE6


; =============== S U B	R O U T	I N E =======================================


sub_29EA4:					  ; CODE XREF: ROM:00029B24p
						  ; ROM:00029BD6p ...
		movem.l	d0/a0-a1,-(sp)
		lea	(word_FF1A7E).l,a0
		move.w	(a0)+,d0
		jsr	(j_SetVDPReg).l
		move.w	(a0)+,d0
		jsr	(j_SetVDPReg).l
		move.w	(a0)+,d0
		jsr	(j_SetVDPReg).l
		lea	(g_Pal0Base).l,a1
		moveq	#$0000003F,d0

loc_29ECE:					  ; CODE XREF: sub_29EA4+2Cj
		move.w	(a0)+,(a1)+
		dbf	d0,loc_29ECE
		jsr	(j_CopyBasePalleteToActivePalette).l
		move.l	(a0)+,(g_HorizontalScrollData).l
		move.l	(a0)+,(g_VSRAMData).l
		jsr	(j_QueueHScrollDMAUpdate).l
		jsr	(j_QueueVSRAMUpdate).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,d0/a0-a1
		rts
; End of function sub_29EA4


; =============== S U B	R O U T	I N E =======================================


sub_29EFE:					  ; CODE XREF: sub_29D52+4Ep
		movem.l	d0-d1/a0,-(sp)
		lea	(g_HorizontalScrollData).l,a0
		move.w	(word_FF1B04).l,d0
		move.w	#$00FF,d1

loc_29F12:					  ; CODE XREF: sub_29EFE+18j
		move.w	d0,(a0)+
		move.w	d0,(a0)+
		dbf	d1,loc_29F12
		movem.l	(sp)+,d0-d1/a0
		rts
; End of function sub_29EFE


; =============== S U B	R O U T	I N E =======================================


sub_29F20:					  ; CODE XREF: sub_29D52+52p
		movem.l	d0-d1/a0,-(sp)
		lea	(g_VSRAMData).l,a0
		move.w	(word_FF1B08).l,d0
		move.w	#$0013,d1

loc_29F34:					  ; CODE XREF: sub_29F20+18j
		move.w	d0,(a0)+
		move.w	d0,(a0)+
		dbf	d1,loc_29F34
		movem.l	(sp)+,d0-d1/a0
		rts
; End of function sub_29F20


; =============== S U B	R O U T	I N E =======================================


sub_29F42:					  ; CODE XREF: ROM:00029AF8p
						  ; ROM:00029B3Ep
		movem.l	d0-d1/a0,-(sp)
		lea	(unk_FF193E).l,a0
		clr.w	d0
		move.w	#$009F,d1

loc_29F52:					  ; CODE XREF: sub_29F42+14j
		move.w	d0,(a0)+
		addq.w	#$01,d0
		dbf	d1,loc_29F52
		movem.l	(sp)+,d0-d1/a0
		rts
; End of function sub_29F42


; =============== S U B	R O U T	I N E =======================================


sub_29F60:					  ; CODE XREF: ROM:00029AF4p
						  ; ROM:00029B3Ap
		movem.l	d1/a0,-(sp)
		lea	(unk_FF192A).l,a0
		moveq	#$00000009,d1
		movem.l	(sp)+,d1/a0
		rts
; End of function sub_29F60


; =============== S U B	R O U T	I N E =======================================


sub_29F72:					  ; CODE XREF: sub_29DE6+7Ep
		movem.l	d0-d1/a0,-(sp)
		move.w	d0,d1
		asr.w	#$03,d1
		lea	(unk_FF192A).l,a0
		andi.w	#$0007,d0
		btst	d0,(a0,d1.w)
		movem.l	(sp)+,d0-d1/a0
		rts
; End of function sub_29F72

; ---------------------------------------------------------------------------
		movem.l	d0-d1/a0,-(sp)
		move.w	d0,d1
		asr.w	#$03,d1
		lea	(unk_FF192A).l,a0
		andi.w	#$0007,d0
		bset	d0,(a0,d1.w)
		movem.l	(sp)+,d0-d1/a0
		rts

; =============== S U B	R O U T	I N E =======================================


sub_29FAA:					  ; CODE XREF: ROM:00029BB8p
						  ; ROM:00029BC2p
		movem.l	d0-d1/a0,-(sp)
		move.w	d0,d1
		asr.w	#$03,d1
		lea	(unk_FF192A).l,a0
		andi.w	#$0007,d0
		bclr	d0,(a0,d1.w)
		movem.l	(sp)+,d0-d1/a0
		rts
; End of function sub_29FAA


; =============== S U B	R O U T	I N E =======================================


sub_29FC6:					  ; CODE XREF: SpellBook+44p
						  ; sub_29C8A+18p ...
		move.l	a0,-(sp)
		lea	sub_29FD4(pc),a0
		bsr.w	sub_2A07A
		movea.l	(sp)+,a0
		rts
; End of function sub_29FC6


; =============== S U B	R O U T	I N E =======================================


sub_29FD4:					  ; DATA XREF: sub_29FC6+2t
		move.l	d0,-(sp)
		move.w	(a1),d0
		bsr.w	sub_2A186
		bsr.w	sub_2A0E2
		bsr.w	sub_2A1A8
		move.w	d0,(a1)
		move.l	(sp)+,d0
		rts
; End of function sub_29FD4


; =============== S U B	R O U T	I N E =======================================


sub_29FEA:					  ; CODE XREF: SpellBook+8Ap
						  ; sub_29C8A+2Cp
		move.l	a0,-(sp)
		lea	sub_29FF8(pc),a0
		bsr.w	sub_2A07A
		movea.l	(sp)+,a0
		rts
; End of function sub_29FEA


; =============== S U B	R O U T	I N E =======================================


sub_29FF8:					  ; DATA XREF: sub_29FEA+2t
		movem.l	d0-d2,-(sp)
		move.w	(a2),d0
		bsr.w	sub_2A186
		move.l	d0,d2
		move.w	(a1),d0
		bsr.w	sub_2A186
		bsr.w	sub_2A10A
		move.l	d2,d1
		bsr.w	sub_2A16A
		bsr.w	sub_2A1A8
		move.w	d0,(a1)
		movem.l	(sp)+,d0-d2
		rts
; End of function sub_29FF8


; =============== S U B	R O U T	I N E =======================================


sub_2A020:					  ; CODE XREF: sub_29CC4+18p
		move.l	a0,-(sp)
		lea	sub_2A02E(pc),a0
		bsr.w	sub_2A07A
		movea.l	(sp)+,a0
		rts
; End of function sub_2A020


; =============== S U B	R O U T	I N E =======================================


sub_2A02E:					  ; DATA XREF: sub_2A020+2t
		move.l	d0,-(sp)
		move.w	(a1),d0
		bsr.w	sub_2A186
		bsr.w	sub_2A10A
		bsr.w	sub_2A1A8
		move.w	d0,(a1)
		move.l	(sp)+,d0
		rts
; End of function sub_2A02E


; =============== S U B	R O U T	I N E =======================================


sub_2A044:					  ; CODE XREF: sub_29D16+2Ep
		move.l	a0,-(sp)
		lea	sub_2A052(pc),a0
		bsr.w	sub_2A07A
		movea.l	(sp)+,a0
		rts
; End of function sub_2A044


; =============== S U B	R O U T	I N E =======================================


sub_2A052:					  ; DATA XREF: sub_2A044+2t
		movem.l	d0-d2,-(sp)
		move.w	(a2),d0
		bsr.w	sub_2A186
		move.l	d0,d2
		move.w	(a1),d0
		bsr.w	sub_2A186
		bsr.w	sub_2A0E2
		move.l	d2,d1
		bsr.w	sub_2A132
		bsr.w	sub_2A1A8
		move.w	d0,(a1)
		movem.l	(sp)+,d0-d2
		rts
; End of function sub_2A052


; =============== S U B	R O U T	I N E =======================================


sub_2A07A:					  ; CODE XREF: sub_29FC6+6p
						  ; sub_29FEA+6p ...
		movem.l	d0/d2/d4-d6/a1-a2,-(sp)

loc_2A07E:					  ; CODE XREF: sub_2A07A+4Ej
		lea	(g_Pal0Base).l,a1
		lea	(unk_FF1A84).l,a2
		moveq	#$00000003,d5

loc_2A08C:					  ; CODE XREF: sub_2A07A:loc_2A0AEj
		ror.w	#$01,d2
		bcc.s	loc_2A0A6
		addq.l	#$02,a1
		addq.l	#$02,a2
		moveq	#$0000000D,d6

loc_2A096:					  ; CODE XREF: sub_2A07A+22j
		jsr	(a0)
		addq.l	#$02,a1
		addq.l	#$02,a2
		dbf	d6,loc_2A096
		addq.l	#$02,a1
		addq.l	#$02,a2
		bra.s	loc_2A0AE
; ---------------------------------------------------------------------------

loc_2A0A6:					  ; CODE XREF: sub_2A07A+14j
		lea	$00000020(a1),a1
		lea	$00000020(a2),a2

loc_2A0AE:					  ; CODE XREF: sub_2A07A+2Aj
		dbf	d5,loc_2A08C
		rol.w	#$04,d2
		jsr	(j_CopyBasePalleteToActivePalette).l
		jsr	(j_EnableDMAQueueProcessing).l
		move.w	d3,d0
		jsr	(j_Sleep).l
		dbf	d4,loc_2A07E
		movem.l	(sp)+,d0/d2/d4-d6/a1-a2
		rts
; End of function sub_2A07A

; ---------------------------------------------------------------------------
		move.w	#$FFFF,(Sprite1_X).l
		jsr	(j_WaitUntilVBlank).l
		rts

; =============== S U B	R O U T	I N E =======================================


sub_2A0E2:					  ; CODE XREF: sub_29FD4+8p
						  ; sub_2A052+12p ...
		movem.l	d1-d2,-(sp)
		moveq	#$00000002,d2

loc_2A0E8:					  ; CODE XREF: sub_2A0E2+1Cj
		add.b	d1,d0
		bge.s	loc_2A0F0
		clr.b	d0
		bra.s	loc_2A0FA
; ---------------------------------------------------------------------------

loc_2A0F0:					  ; CODE XREF: sub_2A0E2+8j
		cmpi.b	#$0E,d0
		ble.s	loc_2A0FA
		move.b	#$0E,d0

loc_2A0FA:					  ; CODE XREF: sub_2A0E2+Cj
						  ; sub_2A0E2+12j
		ror.l	#$08,d0
		ror.l	#$08,d1
		dbf	d2,loc_2A0E8
		ror.l	#$08,d0
		movem.l	(sp)+,d1-d2
		rts
; End of function sub_2A0E2


; =============== S U B	R O U T	I N E =======================================


sub_2A10A:					  ; CODE XREF: sub_29FF8+12p
						  ; sub_2A02E+8p ...
		movem.l	d1-d2,-(sp)
		moveq	#$00000002,d2

loc_2A110:					  ; CODE XREF: sub_2A10A+1Cj
		sub.b	d1,d0
		bge.s	loc_2A118
		clr.b	d0
		bra.s	loc_2A122
; ---------------------------------------------------------------------------

loc_2A118:					  ; CODE XREF: sub_2A10A+8j
		cmpi.b	#$0F,d0
		ble.s	loc_2A122
		move.b	#$0F,d0

loc_2A122:					  ; CODE XREF: sub_2A10A+Cj
						  ; sub_2A10A+12j
		ror.l	#$08,d0
		ror.l	#$08,d1
		dbf	d2,loc_2A110
		ror.l	#$08,d0
		movem.l	(sp)+,d1-d2
		rts
; End of function sub_2A10A


; =============== S U B	R O U T	I N E =======================================


sub_2A132:					  ; CODE XREF: sub_2A052+18p
		movem.l	d1-d2,-(sp)
		moveq	#$00000002,d2

loc_2A138:					  ; CODE XREF: sub_2A132+10j
		cmp.b	d1,d0
		ble.s	loc_2A13E
		move.b	d1,d0

loc_2A13E:					  ; CODE XREF: sub_2A132+8j
		ror.l	#$08,d0
		ror.l	#$08,d1
		dbf	d2,loc_2A138
		ror.l	#$08,d0
		movem.l	(sp)+,d1-d2
		rts
; End of function sub_2A132

; ---------------------------------------------------------------------------
		move.l	d1,-(sp)
		move.l	#$00020202,d1
		bsr.s	sub_2A0E2
		move.l	(sp)+,d1
		rts
; ---------------------------------------------------------------------------
		move.l	d1,-(sp)
		move.l	#$00020202,d1
		bsr.s	sub_2A10A
		move.l	(sp)+,d1
		rts

; =============== S U B	R O U T	I N E =======================================


sub_2A16A:					  ; CODE XREF: sub_29FF8+18p
		movem.l	d1-d2,-(sp)
		moveq	#$00000002,d2

loc_2A170:					  ; CODE XREF: sub_2A16A+10j
		cmp.b	d1,d0
		bge.s	loc_2A176
		move.b	d1,d0

loc_2A176:					  ; CODE XREF: sub_2A16A+8j
		ror.l	#$08,d0
		ror.l	#$08,d1
		dbf	d2,loc_2A170
		ror.l	#$08,d0
		movem.l	(sp)+,d1-d2
		rts
; End of function sub_2A16A


; =============== S U B	R O U T	I N E =======================================


sub_2A186:					  ; CODE XREF: sub_29FD4+4p
						  ; sub_29FF8+6p ...
		movem.l	d1-d3,-(sp)
		moveq	#$00000000,d1
		moveq	#$00000002,d2

loc_2A18E:					  ; CODE XREF: sub_2A186+14j
		move.b	d0,d3
		andi.b	#$0F,d3
		move.b	d3,d1
		ror.l	#$04,d0
		ror.l	#$08,d1
		dbf	d2,loc_2A18E
		ror.l	#$08,d1
		move.l	d1,d0
		movem.l	(sp)+,d1-d3
		rts
; End of function sub_2A186


; =============== S U B	R O U T	I N E =======================================


sub_2A1A8:					  ; CODE XREF: sub_29FD4+Cp
						  ; sub_29FF8+1Cp ...
		movem.l	d1-d3,-(sp)
		clr.w	d1
		moveq	#$00000002,d2

loc_2A1B0:					  ; CODE XREF: sub_2A1A8+14j
		move.b	d0,d3
		andi.b	#$0F,d3
		or.b	d3,d1
		ror.l	#$08,d0
		ror.l	#$04,d1
		dbf	d2,loc_2A1B0
		swap	d1
		ror.w	#$04,d1
		move.w	d1,d0
		movem.l	(sp)+,d1-d3
		rts
; End of function sub_2A1A8

; ---------------------------------------------------------------------------
		movem.l	d1-d3/d6-a0,-(sp)
		move.w	d1,d6

loc_2A1D2:					  ; CODE XREF: ROM:0002A1DCj
		jsr	(j_GenerateRandomNumber).l
		add.w	d2,d7
		move.w	d7,(a0)+
		dbf	d3,loc_2A1D2
		movem.l	(sp)+,d1-d3/d6-a0
		rts
; ---------------------------------------------------------------------------
		ext.l	d4
		ext.l	d5
		ext.l	d6

loc_2A1EC:					  ; CODE XREF: ROM:0002A200j
		move.w	d1,d0
		asr.w	#$08,d0
		bsr.s	sub_2A22C
		muls.w	d4,d0
		asr.l	#$08,d0
		move.w	d0,(a0)+
		add.w	d2,d1
		add.w	d3,d2
		add.l	d5,d4
		add.l	d6,d5
		dbf	d7,loc_2A1EC
		rts

; =============== S U B	R O U T	I N E =======================================


sub_2A206:					  ; CODE XREF: SpellBook+24p
						  ; SpellBook+2Cp
		ext.l	d4
		ext.l	d5
		ext.l	d6

loc_2A20C:					  ; CODE XREF: sub_2A206+1Cj
		move.w	d1,d0
		asr.w	#$08,d0
		bsr.s	sub_2A22C
		bsr.s	sub_2A22C
		muls.w	d4,d0
		asr.l	#$08,d0
		move.w	d0,(a0)+
		add.w	d2,d1
		add.w	d3,d2
		add.l	d5,d4
		add.l	d6,d5
		dbf	d7,loc_2A20C
		rts
; End of function sub_2A206


; =============== S U B	R O U T	I N E =======================================


sub_2A228:					  ; DATA XREF: sub_22EECt
		addi.w	#$0040,d0
; End of function sub_2A228


; =============== S U B	R O U T	I N E =======================================


sub_2A22C:					  ; CODE XREF: ROM:0002A1F0p
						  ; sub_2A206+Ap ...
		move.l	a0,-(sp)
		lea	SineTable(pc),a0
		andi.w	#$00FF,d0
		add.w	d0,d0
		move.w	(a0,d0.w),d0
		ext.l	d0
		movea.l	(sp)+,a0
		rts
; End of function sub_2A22C

; ---------------------------------------------------------------------------
