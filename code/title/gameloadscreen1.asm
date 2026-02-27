
; =============== S U B	R O U T	I N E =======================================


GetPlayTimeDigits:				  ; CODE XREF: sub_F78E+50p
		moveq	#$00000000,d7
		move.w	(g_HourCount).l,d7
		mulu.w	#00100,d7
		add.w	(g_MinuteCount).l,d7
		jsr	(j_ConvertToBase10).l
		lea	(unk_FF0F96).l,a0
		bsr.s	sub_F374
		bsr.s	sub_F374
		bsr.s	sub_F374
		bsr.s	sub_F38C
		addq.l	#$02,a1
		bsr.s	sub_F38C
		bsr.s	sub_F38C
		rts
; End of function GetPlayTimeDigits


; =============== S U B	R O U T	I N E =======================================


sub_F374:					  ; CODE XREF: GetPlayTimeDigits+1Ep
						  ; GetPlayTimeDigits+20p ...
		move.b	(a0)+,d0
		ext.w	d0
		beq.s	loc_F37C
		add.w	d0,d0

loc_F37C:					  ; CODE XREF: sub_F374+4j
		addi.w	#$0080,d0
		move.w	d0,(a1)+
		beq.s	loc_F386
		addq.w	#$01,d0

loc_F386:					  ; CODE XREF: sub_F374+Ej
		move.w	d0,$0000004E(a1)
		rts
; End of function sub_F374


; =============== S U B	R O U T	I N E =======================================


sub_F38C:					  ; CODE XREF: GetPlayTimeDigits+24p
						  ; GetPlayTimeDigits+28p ...
		move.b	(a0)+,d0
		ext.w	d0
		bne.s	loc_F394
		addq.b	#$01,d0

loc_F394:					  ; CODE XREF: sub_F38C+4j
		add.b	d0,d0
		ext.w	d0
		addi.w	#$0080,d0
		move.w	d0,(a1)+
		addq.w	#$01,d0
		move.w	d0,$0000004E(a1)
		rts
; End of function sub_F38C


; =============== S U B	R O U T	I N E =======================================


sub_F3A6:					  ; CODE XREF: sub_F78E+48p
		move.w	(g_Gold).l,d7
	if FIX_GOLD_CAP
		cmpi.w	#$2710,d7
		bcs.s	loc_F3B6
		move.w	#$270F,d7
	endif

loc_F3B6:					  ; CODE XREF: sub_F3A6+Aj
		jsr	(j_ConvertToBase10).l
		lea	(unk_FF0F98).l,a0
		bsr.s	sub_F374
		bsr.s	sub_F374
		bsr.s	sub_F374
		bsr.s	sub_F38C
		rts
; End of function sub_F3A6


; =============== S U B	R O U T	I N E =======================================


sub_F3CC:					  ; CODE XREF: sub_F78E+2Ep
		clr.w	d7
		move.b	d0,d7
		jsr	(j_ConvertToBase10).l
		lea	(unk_FF0F9B).l,a0
		bsr.s	sub_F38C
		rts
; End of function sub_F3CC


; =============== S U B	R O U T	I N E =======================================


sub_F3E0:					  ; CODE XREF: sub_F78E+58p
		bsr.s	sub_F416
		move.l	d3,-(sp)
		move.b	d2,d7
		ext.w	d7
		jsr	(j_ConvertToBase10).l
		lea	(unk_FF0F9A).l,a0
	if	REGION=JP
		bsr.s	sub_F374
	else
		bsr.w	sub_F374
	endif
		bsr.s	sub_F38C
		addq.l	#$02,a1
		move.l	(sp)+,d7
		ext.w	d7
		jsr	(j_ConvertToBase10).l
		lea	(unk_FF0F9A).l,a0
		bsr.w	sub_F374
	if	REGION=JP
		bsr.s	sub_F38C
	else
		bsr.w	sub_F38C
	endif
		rts
; End of function sub_F3E0


; =============== S U B	R O U T	I N E =======================================


sub_F416:					  ; CODE XREF: sub_F3E0p
						  ; sub_F78E+5Cp
		clr.l	d2
		move.w	(Player_CurrentHealth).l,d2
		beq.s	loc_F424
		addi.w	#$0100,d2

loc_F424:					  ; CODE XREF: sub_F416+8j
		lsr.w	#$08,d2
		clr.l	d3
		move.w	(Player_MaxHealth).l,d3
		beq.s	loc_F434
		addi.w	#$0100,d3

loc_F434:					  ; CODE XREF: sub_F416+18j
		lsr.w	#$08,d3
		cmpi.w	#$0064,d2
		bcs.s	loc_F43E
		moveq	#$00000063,d2

loc_F43E:					  ; CODE XREF: sub_F416+24j
		cmpi.w	#$0064,d3
		bcs.s	locret_F446
		moveq	#$00000063,d3

locret_F446:					  ; CODE XREF: sub_F416+2Cj
		rts
; End of function sub_F416


; =============== S U B	R O U T	I N E =======================================


sub_F448:					  ; CODE XREF: sub_F78E+64p
		move.w	#$0098,d0
		move.b	#$33,d1
		cmp.b	d1,d2
		bcc.s	loc_F45C
		move.w	#$0096,d0
		cmp.b	d1,d3
		bcs.s	locret_F476

loc_F45C:					  ; CODE XREF: sub_F448+Aj
		move.w	d0,d1
		move.w	d0,(a1)
		ori.w	#$0800,d0
		move.w	d0,$00000002(a1)
		addq.w	#$01,d1
		move.w	d1,$00000050(a1)
		ori.w	#$0800,d1
		move.w	d1,$00000052(a1)

locret_F476:					  ; CODE XREF: sub_F448+12j
		rts
; End of function sub_F448


; =============== S U B	R O U T	I N E =======================================


sub_F478:					  ; CODE XREF: sub_F78E+6Cp
		cmpi.b	#$33,d2
		bcs.s	loc_F482
		subi.b	#$32,d2

loc_F482:					  ; CODE XREF: sub_F478+4j
		cmpi.b	#$0B,d2
		bcc.w	loc_F4D4
		cmpi.b	#$0B,d3
		bcs.w	locret_F53A
		move.w	#$00A4,d0
		bsr.w	sub_F532
		move.w	#$009A,d0
		cmpi.b	#$15,d3
		bcs.s	loc_F4D0
		move.w	#$009E,d0

loc_F4A8:					  ; CODE XREF: sub_F478+76j
		bsr.w	sub_F532
		move.w	#$009A,d0
		cmpi.b	#$1F,d3
		bcs.s	loc_F4D0
		move.w	#$009E,d0

loc_F4BA:					  ; CODE XREF: sub_F478+92j
		bsr.s	sub_F532
		move.w	#$009A,d0
		cmpi.b	#$29,d3
		bcs.s	loc_F4D0
		move.w	#$009E,d0

loc_F4CA:					  ; CODE XREF: sub_F478+AEj
		bsr.s	sub_F532
		move.w	#$009A,d0

loc_F4D0:					  ; CODE XREF: sub_F478+2Aj
						  ; sub_F478+3Cj ...
		bsr.s	sub_F532
		rts
; ---------------------------------------------------------------------------

loc_F4D4:					  ; CODE XREF: sub_F478+Ej
		move.w	#$00A6,d0
		bsr.s	sub_F532
		cmpi.b	#$15,d2
		bcc.s	loc_F4F0
		move.w	#$009C,d0
		cmpi.b	#$15,d3
		bcs.s	sub_F532
		move.w	#$00A2,d0
		bra.s	loc_F4A8
; ---------------------------------------------------------------------------

loc_F4F0:					  ; CODE XREF: sub_F478+66j
		move.w	#$00A0,d0
		bsr.s	sub_F532
		cmpi.b	#$1F,d2
		bcc.s	loc_F50C
		move.w	#$009C,d0
		cmpi.b	#$1F,d3
		bcs.s	sub_F532
		move.w	#$00A2,d0
		bra.s	loc_F4BA
; ---------------------------------------------------------------------------

loc_F50C:					  ; CODE XREF: sub_F478+82j
		move.w	#$00A0,d0
		bsr.s	sub_F532
		cmpi.b	#$29,d2
		bcc.s	loc_F528
		move.w	#$009C,d0
		cmpi.b	#$29,d3
		bcs.s	sub_F532
		move.w	#$00A2,d0
		bra.s	loc_F4CA
; ---------------------------------------------------------------------------

loc_F528:					  ; CODE XREF: sub_F478+9Ej
		move.w	#$00A0,d0
		bsr.s	sub_F532
		move.w	#$009C,d0
; End of function sub_F478


; =============== S U B	R O U T	I N E =======================================


sub_F532:					  ; CODE XREF: sub_F478+1Ep
						  ; sub_F478:loc_F4A8p	...
		move.w	d0,-(a1)
		addq.w	#$01,d0
		move.w	d0,$00000050(a1)

locret_F53A:					  ; CODE XREF: sub_F478+16j
		rts
; End of function sub_F532


; =============== S U B	R O U T	I N E =======================================


sub_F53C:					  ; CODE XREF: sub_F78E+74p
		addi.w	#$000A,d2
		divu.w	#$000A,d2
		swap	d2
		tst.w	d2
		bne.s	loc_F54C
		moveq	#$0000000A,d2

loc_F54C:					  ; CODE XREF: sub_F53C+Cj
		move.w	#$00A8,d0
		move.w	#$00A9,d1
		moveq	#$00000001,d6

loc_F556:					  ; CODE XREF: sub_F53C+36j
		moveq	#$00000004,d7

loc_F558:					  ; CODE XREF: sub_F53C+2Ej
		tst.b	d3
		beq.s	locret_F576
		subq.b	#$01,d3
		move.w	d0,(a1)
		tst.b	d2
		beq.s	loc_F568
		subq.b	#$01,d2
		move.w	d1,(a1)

loc_F568:					  ; CODE XREF: sub_F53C+26j
		addq.l	#$02,a1
		dbf	d7,loc_F558
		lea	$00000046(a1),a1
		dbf	d6,loc_F556

locret_F576:					  ; CODE XREF: sub_F53C+1Ej
		rts
; End of function sub_F53C


; =============== S U B	R O U T	I N E =======================================


sub_F578:					  ; CODE XREF: sub_F78E+1Ep
		move.w	#$000D,d7
		bsr.w	sub_F5CA
		bsr.w	ClearTextBuffer
		move.w	#$0070,(word_FF1194).l
		move.l	d0,-(sp)
		jsr	(j_GetSaveLocationString).l
		bsr.w	sub_F61E
		move.l	(sp)+,d0
		andi.w	#$03FF,d0
		lsl.w	#$05,d0
		movea.w	d0,a1
		move.w	(word_FF1194).l,d1
		subi.w	#$0070,d1
		lsr.w	#$03,d1
		addq.w	#$01,d1
		lsl.w	#$06,d1
		lea	(g_ScreenBuffer).l,a0
		lea	(a0,d1.w),a0
		move.w	#$01C0,d0
		moveq	#$00000002,d1
		jsr	(j_DoDMACopy_1).l
		rts
; End of function sub_F578


; =============== S U B	R O U T	I N E =======================================


sub_F5CA:					  ; CODE XREF: sub_F578+4p
						  ; InitGameStartScreen+3Ap
		move.w	d0,d1

loc_F5CC:					  ; CODE XREF: sub_F5CA+Cj
		move.w	d1,(a1)+
		addq.w	#$01,d1
		move.w	d1,$0000004E(a1)
		addq.w	#$01,d1
		dbf	d7,loc_F5CC
		rts
; End of function sub_F5CA


; =============== S U B	R O U T	I N E =======================================


DMACopyTextBuffer:				  ; CODE XREF: ROM:0000EF6Ap
						  ; sub_F958+34p ...
		lea	(g_ScreenBuffer).l,a0
		lea	($000050C0).w,a1
		move.w	#$0480,d0
		moveq	#$00000002,d1
		jsr	(j_DoDMACopy_1).l
		rts
; End of function DMACopyTextBuffer


; =============== S U B	R O U T	I N E =======================================


ClearTextBuffer:				  ; CODE XREF: ROM:0000EF58p
						  ; ROM:0000EF88p ...
		clr.w	(word_FF1194).l
		clr.b	(byte_FF1129).l
		lea	(g_ScreenBuffer).l,a1
		move.l	#$AAAAAAAA,d1
		move.w	#$027F,d7

loc_F610:					  ; CODE XREF: ClearTextBuffer+1Ej
		move.l	d1,(a1)+
		dbf	d7,loc_F610
		rts
; End of function ClearTextBuffer


; =============== S U B	R O U T	I N E =======================================


j_j_LoadUncompressedString:			  ; CODE XREF: ROM:0000EF60p
						  ; ROM:0000EF90p ...
		jsr	(j_LoadUncompressedString).l
; End of function j_j_LoadUncompressedString


; =============== S U B	R O U T	I N E =======================================


sub_F61E:					  ; CODE XREF: sub_F578+1Cp
						  ; sub_F61E+12j
		clr.w	d0
		move.b	(a2)+,d0
		movem.l	d7/a2,-(sp)
		jsr	(sub_22EFC).l
		movem.l	(sp)+,d7/a2
		dbf	d7,sub_F61E
		rts
; End of function sub_F61E


; =============== S U B	R O U T	I N E =======================================


LoadGameSelectMenu:				  ; CODE XREF: ROM:0000EEC0p
		move.w	#$0000,d0
		move.w	#$0000,d1
		clr.w	d2
		jsr	(j_DoDMAFill).l
		lea	LoadGameScreenCharsCmp(pc),a0
		lea	(g_Buffer).l,a1
		lea	($00001000).w,a2
		jsr	(j_LoadCompressedGfx).l	  ; a0 - compressed graphics source
						  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination
		lea	LoadGameScreenGfxCmp(pc),a0
		lea	(g_Buffer).l,a1
		lea	($00002000).w,a2
		jsr	(j_LoadCompressedGfx).l	  ; a0 - compressed graphics source
						  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination
		lea	LoadGameScreenTilemapCmp(pc),a0
		lea	(g_Buffer).l,a1
		jsr	(j_DecompTilemap).l
		lea	((g_Buffer+$56)).l,a0
		lea	(unk_FF3562).l,a1
		moveq	#$00000011,d6
		moveq	#$00000009,d7
		bsr.w	sub_F81A
		rts
; End of function LoadGameSelectMenu


; =============== S U B	R O U T	I N E =======================================


LoadGameStartPalette:				  ; CODE XREF: ROM:0000EECCp
						  ; ROM:0000EF0Cp ...
		lea	GameStartPalette(pc),a0
		lea	(g_Pal0Base).l,a1
		bsr.s	CopyPalette_0
		lea	(g_Pal0Base).l,a0
		lea	$00000020(a0),a1
		bsr.w	CopyPalette_0
		lea	$00000040(a0),a1
; End of function LoadGameStartPalette


; =============== S U B	R O U T	I N E =======================================


CopyPalette_0:					  ; CODE XREF: LoadGameStartPalette+Ap
						  ; LoadGameStartPalette+16p
		moveq	#$0000000F,d7

loc_F6B4:					  ; CODE XREF: CopyPalette_0+4j
		move.w	(a0)+,(a1)+
		dbf	d7,loc_F6B4
		rts
; End of function CopyPalette_0

; ---------------------------------------------------------------------------
