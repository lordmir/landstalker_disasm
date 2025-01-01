
; =============== S U B	R O U T	I N E =======================================


InitInv:					  ; CODE XREF: CheckForMenuOpen+3Cp
		jsr	(WaitUntilVBlank).l
		bsr.w	sub_D9FC
		bsr.w	sub_D996
		jsr	(WaitUntilVBlank).l
		move.w	#$8F80,d0
		move.w	#$0800,d1
		clr.w	d2
		jsr	(DoDMAFill).l		  ; d0 - Fill destination address VDP
						  ; d1 - Fill length bytes
						  ; d2 - Fill pattern
		move.w	#$00BC,d1
		clr.w	d0
		move.w	#$003E,d7

loc_D28A:					  ; CODE XREF: InitInv+56j
		movem.w	d0-d1/d7,-(sp)
		jsr	(sub_46DA).l
		movem.w	(sp)+,d0-d1/d7
		addq.w	#$01,d0
		addi.w	#$0010,d1
		movem.w	d7,-(sp)
		andi.b	#$03,d7
		bne.s	loc_D2AE
		jsr	(FlushDMACopyQueue).l

loc_D2AE:					  ; CODE XREF: InitInv+4Aj
		movem.w	(sp)+,d7
		dbf	d7,loc_D28A
		lea	(g_Pal1Base).l,a0
		lea	(g_Buffer).l,a1
		lea	$0000001C(a1),a2
		moveq	#$0000001F,d7

loc_D2C8:					  ; CODE XREF: InitInv+6Ej
		move.w	(a0)+,(a2)+
		dbf	d7,loc_D2C8
		clr.w	$0000000E(a1)
		lea	InvPalette1(pc),a0
		lea	(g_Pal0Base).l,a1
		moveq	#$00000007,d7

loc_D2DE:					  ; CODE XREF: InitInv+84j
		move.w	(a0)+,(a1)+
		dbf	d7,loc_D2DE
		lea	(g_Buffer).l,a0
		move.w	(unk_FF0F9C).l,0000000004(a0)
		rts
; End of function InitInv


; =============== S U B	R O U T	I N E =======================================


sub_D2F4:					  ; CODE XREF: sub_D4AE+3Cp
		lea	InvPalette2_GreyedOut(pc),a0
		lea	(g_Pal2Base).l,a1
		moveq	#$00000007,d7

loc_D300:					  ; CODE XREF: sub_D2F4+Ej
		move.l	(a0)+,(a1)+
		dbf	d7,loc_D300
		rts
; End of function sub_D2F4


; =============== S U B	R O U T	I N E =======================================


sub_D308:					  ; CODE XREF: sub_D4AEp
		move.b	(byte_FF1BF2).l,d0
		andi.w	#$001F,d0
		cmpi.b	#$11,d0
		bcs.s	loc_D31A
		clr.w	d0

loc_D31A:					  ; CODE XREF: sub_D308+Ej
		mulu.w	#$0004,d0
		lea	((g_Buffer+6)).l,a0
		move.w	d0,(a0)
		move.b	(byte_FF1BF3).l,d1
		clr.w	d0
		lsr.b	#$01,d1
		bcc.s	loc_D334
		addq.w	#$01,d0

loc_D334:					  ; CODE XREF: sub_D308+28j
		ext.w	d1
		lea	((g_Buffer+$A)).l,a0
		move.w	d0,(a0)
		lea	((g_Buffer+$C)).l,a0
		move.w	d1,(a0)
		bsr.w	sub_DC28
		rts
; End of function sub_D308

; ---------------------------------------------------------------------------

loc_D34C:					  ; CODE XREF: ROM:0000D3D8j
						  ; ROM:0000DBB8j
		movem.w	d0,-(sp)
		lea	((g_Buffer+6)).l,a0
		move.w	(a0),d0
		lsr.b	#$02,d0
		lea	(byte_FF1BF2).l,a0
		move.b	d0,(a0)
		lea	((g_Buffer+$A)).l,a0
		move.w	(a0),d0
		andi.b	#$01,d0
		lea	((g_Buffer+$C)).l,a0
		move.w	(a0),d1
		andi.b	#$03,d1
		add.b	d1,d1
		or.b	d1,d0
		lea	(byte_FF1BF3).l,a0
		move.b	d0,(a0)
		movem.w	(sp)+,d0
; START	OF FUNCTION CHUNK FOR sub_EAD4

loc_D38A:					  ; CODE XREF: sub_EAD4-8j
		move.b	(g_Controller1State).l,d1
		btst	#CTRL_START,d1
		beq.s	loc_D39A
		moveq	#$00000002,d1
		bra.s	locret_D3A6
; ---------------------------------------------------------------------------

loc_D39A:					  ; CODE XREF: sub_EAD4-1740j
		btst	#CTRL_B,d1
		beq.s	loc_D3A4
		moveq	#$00000001,d1
		bra.s	locret_D3A6
; ---------------------------------------------------------------------------

loc_D3A4:					  ; CODE XREF: sub_EAD4-1736j
		moveq	#$00000000,d1

locret_D3A6:					  ; CODE XREF: sub_EAD4-173Cj
						  ; sub_EAD4-1732j
		rts
; END OF FUNCTION CHUNK	FOR sub_EAD4

; =============== S U B	R O U T	I N E =======================================


sub_D3A8:					  ; CODE XREF: sub_7766:loc_776Ep
		lea	((g_Buffer+$1C)).l,a0
		lea	(g_Pal1Base).l,a1
		moveq	#$0000001F,d7

loc_D3B6:					  ; CODE XREF: sub_D3A8+10j
		move.w	(a0)+,(a1)+
		dbf	d7,loc_D3B6
		rts
; End of function sub_D3A8

; ---------------------------------------------------------------------------

loc_D3BE:					  ; CODE XREF: CheckForMenuOpen:loc_774Ap
		bsr.w	sub_D4AE
		bsr.w	sub_D96A

loc_D3C6:					  ; CODE XREF: ROM:loc_D424j
						  ; ROM:0000DBC0j
		moveq	#$0000000F,d0
		bsr.w	sub_D88A
		move.b	(g_Controller1State).l,d1
		move.b	d1,d0
		andi.b	#CTRLBF_BSTART,d0
		bne.w	loc_D34C
		move.b	d1,d0
		andi.b	#CTRLBF_AC,d0
		bne.w	loc_DB28
		lea	(g_Buffer).l,a1
		lea	0000000010(a1),a0
		lea	$0000000C(a1),a1
		move.b	(g_Controller1State).l,d0
		btst	#CTRL_UP,d0
		bne.w	loc_D426
		btst	#CTRL_DOWN,d0
		bne.w	loc_D45C
		btst	#CTRL_LEFT,d0
		bne.w	loc_D4A0
		btst	#CTRL_RIGHT,d0
		bne.w	loc_D494

loc_D41A:					  ; CODE XREF: ROM:0000D454j
						  ; ROM:0000D48Cj ...
		bsr.w	sub_D730
		clr.l	d2
		bsr.w	sub_D714

loc_D424:					  ; CODE XREF: ROM:0000D430j
						  ; ROM:0000D450j ...
		bra.s	loc_D3C6
; ---------------------------------------------------------------------------

loc_D426:					  ; CODE XREF: ROM:0000D3FEj
		cmpi.w	#$0002,(a1)
		bcs.s	loc_D432
		bsr.w	sub_D68C
		bra.s	loc_D424
; ---------------------------------------------------------------------------

loc_D432:					  ; CODE XREF: ROM:0000D42Aj
		movem.l	a0-a1,-(sp)
		bsr.w	sub_D7DE
		bcc.s	loc_D440
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_CursorMove
; ---------------------------------------------------------------------------

loc_D440:					  ; CODE XREF: ROM:0000D43Aj
		bsr.w	sub_D7DE
		bsr.w	sub_D7DE
		bsr.w	sub_D7DE
		movem.l	(sp)+,a0-a1
		bcs.s	loc_D424
		move.w	(a1),d0
		beq.s	loc_D41A
		bsr.w	sub_D68C
		bra.s	loc_D424
; ---------------------------------------------------------------------------

loc_D45C:					  ; CODE XREF: ROM:0000D406j
		cmpi.w	#$0002,(a1)
		bcc.s	loc_D468
		bsr.w	sub_D6AA
		bra.s	loc_D424
; ---------------------------------------------------------------------------

loc_D468:					  ; CODE XREF: ROM:0000D460j
		movem.l	a0-a1,-(sp)
		bsr.w	loc_D7F4
		bcc.s	loc_D476
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
word_D474:	dc.w SND_CursorMove
; ---------------------------------------------------------------------------

loc_D476:					  ; CODE XREF: ROM:0000D470j
		bsr.w	loc_D7F4
		bsr.w	loc_D7F4
		bsr.w	loc_D7F4
		movem.l	(sp)+,a0-a1
		bcs.s	loc_D424
		cmpi.w	#$0003,(a1)
		bcc.s	loc_D41A
		bsr.w	sub_D6AA
		bra.s	loc_D424
; ---------------------------------------------------------------------------

loc_D494:					  ; CODE XREF: ROM:0000D416j
		cmpi.w	#$0001,(a0)
		bcc.s	loc_D41A
		bsr.w	loc_D6EC
		bra.s	loc_D424
; ---------------------------------------------------------------------------

loc_D4A0:					  ; CODE XREF: ROM:0000D40Ej
		move.w	(a0),d0
		beq.w	loc_D41A
		bsr.w	loc_D6C8
		bra.w	loc_D424

; =============== S U B	R O U T	I N E =======================================


sub_D4AE:					  ; CODE XREF: CheckForMenuOpen+88p
						  ; ConsumeItem+14p ...
		bsr.w	sub_D308
		lea	(g_Buffer).l,a1
		lea	$00000084(a1),a0
		move.w	(a0),d0
		move.w	#$A000,d0
		ori.w	#$0000,d0
		move.w	#$0B63,d7

loc_D4CA:					  ; CODE XREF: sub_D4AE+1Ej
		move.w	d0,(a0)+
		dbf	d7,loc_D4CA
		bsr.w	sub_D50C
		lea	((g_ForegroundBlocks+$204)).l,a0
		move.w	(a0)+,d0
		move.w	#$043E,d7

loc_D4E0:					  ; CODE XREF: sub_D4AE+34j
		move.w	d0,(a0)+
		dbf	d7,loc_D4E0
		bsr.w	QueueInventoryScrBTilemapDMA
		bsr.w	sub_D2F4
		lea	((g_Buffer+$E)).l,a0
		move.w	(a0),d0
		move.w	#$FFFF,(a0)
		tst.w	d0
		beq.s	loc_D504
		jsr	(CopyBasePalleteToActivePalette).l

loc_D504:					  ; CODE XREF: sub_D4AE+4Ej
		jsr	(FlushDMACopyQueue).l
		rts
; End of function sub_D4AE


; =============== S U B	R O U T	I N E =======================================


sub_D50C:					  ; CODE XREF: sub_D4AE+22p
		move.w	#$0000,d1
		move.w	#$0013,d6
		lea	((g_Buffer+$5C)).l,a2

loc_D51A:					  ; CODE XREF: sub_D50C+3Cj
		move.w	#$0002,d0
		move.w	#$0001,d7

loc_D522:					  ; CODE XREF: sub_D50C+36j
		movem.w	d0-d1/d6-d7,-(sp)
		bsr.w	sub_D86C
		clr.w	d0
		move.b	(a2)+,d0
		movem.l	a2,-(sp)
		bsr.w	PopulateItemSlot
		movem.l	(sp)+,a2
		movem.w	(sp)+,d0-d1/d6-d7
		addi.w	#$0011,d0
		dbf	d7,loc_D522
		addq.w	#$04,d1
		dbf	d6,loc_D51A
		bsr.w	sub_D828
		bsr.w	sub_D730
		moveq	#$00000001,d2
		bsr.w	sub_D714
		rts
; End of function sub_D50C

; ---------------------------------------------------------------------------
