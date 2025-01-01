
; =============== S U B	R O U T	I N E =======================================


DisplayTitle:					  ; DATA XREF: j_DisplayTitlet

; FUNCTION CHUNK AT 00039848 SIZE 00000140 BYTES

		bsr.w	DisplayClimaxLogo
		bra.w	DisplayTitleScreen
; End of function DisplayTitle


; =============== S U B	R O U T	I N E =======================================


DecompTilemap:					  ; CODE XREF: LoadLithographTilemap+3Ap
						  ; DisplayTitle+11Ap ...
		movem.l	d0-a6,-(sp)
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.l	a1,-(sp)

_GetTileAttrs:					  ; CODE XREF: DecompTilemap:_Continuej
		move.b	(a0)+,d0
		btst	#$02,d0
		beq.s	_Get16BitRunLength
		bsr.w	DecompTM_8bitRLEFill
		bra.s	_Continue
; ---------------------------------------------------------------------------

_Get16BitRunLength:				  ; CODE XREF: DecompTilemap+10j
		bsr.w	DecompTM_16bitRLEFill
		tst.w	d7
		beq.w	_GetTileValues

_Continue:					  ; CODE XREF: DecompTilemap+16j
		bra.s	_GetTileAttrs
; ---------------------------------------------------------------------------

_GetTileValues:					  ; CODE XREF: DecompTilemap+1Ej
		movea.l	(sp)+,a1
		move.b	(a0)+,d0
		bsr.w	DecompTM_RLEFillOR
		move.w	d0,d4			  ; d4 - incremental value
		move.w	d0,d5			  ; d5 - last value

_Loop:						  ; CODE XREF: DecompTilemap:_Continue2j
		move.b	(a0)+,d0
		bmi.s	_Bit7Set		  ; Bit	7 set
		btst	#$06,d0
		bne.s	_Bit7Clear6Set		  ; Bit	6 set

_Bit7Clear6Clear:
		bsr.w	DecompTM_CopySingleWord
		cmpi.w	#$07FF,d0
		beq.w	_Return
		bra.s	_Continue1
; ---------------------------------------------------------------------------

_Bit7Clear6Set:					  ; CODE XREF: DecompTilemap+38j
		bsr.w	DecompTM_RLEFillOR
		move.w	d0,d5			  ; d5 - last value

_Continue1:					  ; CODE XREF: DecompTilemap+46j
		bra.s	_Continue2
; ---------------------------------------------------------------------------

_Bit7Set:					  ; CODE XREF: DecompTilemap+32j
		btst	#$06,d0
		bne.s	_Bit7Set6Set		  ; Bit	6 set

_Bit7Set6Clear:					  ; d5 - last value
		move.w	d5,d1
		bsr.w	DecompTM_FillWithLast
		bra.s	_Continue2
; ---------------------------------------------------------------------------

_Bit7Set6Set:					  ; CODE XREF: DecompTilemap+54j
		move.w	d4,d1			  ; d4 - incremental fill
		bsr.w	DecompTM_IncrementalFill
		move.w	d0,d4

_Continue2:					  ; CODE XREF: DecompTilemap:_Continue1j
						  ; DecompTilemap+5Cj
		bra.s	_Loop
; ---------------------------------------------------------------------------

_Return:					  ; CODE XREF: DecompTilemap+42j
		movem.l	(sp)+,d0-a6
		rts
; End of function DecompTilemap


; =============== S U B	R O U T	I N E =======================================


DecompTM_8bitRLEFill:				  ; CODE XREF: DecompTilemap+12p
		move.b	d0,d7
		andi.w	#$0003,d7
		bra.w	loc_397F0
; End of function DecompTM_8bitRLEFill


; =============== S U B	R O U T	I N E =======================================


DecompTM_16bitRLEFill:				  ; CODE XREF: DecompTilemap:_Get16BitRunLengthp
		move.b	d0,d7
		lsl.w	#$08,d7
		move.b	(a0)+,d7
		andi.w	#$03FF,d7
		bne.s	loc_397F0
		rts
; ---------------------------------------------------------------------------

loc_397F0:					  ; CODE XREF: DecompTM_8bitRLEFill+6j
						  ; DecompTM_16bitRLEFill+Aj
		andi.b	#$F8,d0

_Loop:						  ; CODE XREF: DecompTM_16bitRLEFill+16j
		move.b	d0,(a1)+
		clr.b	(a1)+
		dbf	d7,_Loop
		rts
; End of function DecompTM_16bitRLEFill


; =============== S U B	R O U T	I N E =======================================


DecompTM_CopySingleWord:			  ; CODE XREF: DecompTilemap:_Bit7Clear6Clearp
		lsl.w	#$08,d0
		move.b	(a0)+,d0
		andi.w	#$07FF,d0
		or.w	d0,(a1)+
		rts
; End of function DecompTM_CopySingleWord


; =============== S U B	R O U T	I N E =======================================


DecompTM_RLEFillOR:				  ; CODE XREF: DecompTilemap+28p
						  ; DecompTilemap:_Bit7Clear6Setp
		move.b	d0,d7
		lsr.b	#$03,d7
		andi.w	#$0007,d7
		lsl.w	#$08,d0
		move.b	(a0)+,d0
		bra.s	loc_39820
; End of function DecompTM_RLEFillOR


; =============== S U B	R O U T	I N E =======================================


DecompTM_FillWithLast:				  ; CODE XREF: DecompTilemap+58p
		move.b	d0,d7
		andi.w	#$003F,d7
		move.w	d1,d0

loc_39820:					  ; CODE XREF: DecompTM_RLEFillOR+Cj
		andi.w	#$07FF,d0

_Loop:						  ; CODE XREF: DecompTM_FillWithLast+Ej
		or.w	d0,(a1)+
		dbf	d7,_Loop
		rts
; End of function DecompTM_FillWithLast


; =============== S U B	R O U T	I N E =======================================


DecompTM_IncrementalFill:			  ; CODE XREF: DecompTilemap+60p
		move.b	d0,d7
		andi.w	#$003F,d7
		move.w	d1,d0
		andi.w	#$07FF,d0

_Loop:						  ; CODE XREF: DecompTM_IncrementalFill+10j
		addq.w	#$01,d0
		or.w	d0,(a1)+
		dbf	d7,_Loop
		rts
; End of function DecompTM_IncrementalFill

; ---------------------------------------------------------------------------
		jsr	(j_FadeToBlack).l
; START	OF FUNCTION CHUNK FOR DisplayTitle

DisplayTitleScreen:				  ; CODE XREF: DisplayTitle+4j
		jsr	(j_DisableDisplayAndInts).l
		move.w	#$8000,d0
		move.w	#$8000,d1
		clr.w	d2
		jsr	(j_DoDMAFill).l
		lea	Title1(pc),a0
		lea	(g_Buffer).l,a1
		lea	(0000000000).w,a2
		jsr	(j_LoadCompressedGfx).l	  ; a0 - compressed graphics source
						  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination
		lea	Title1Map(pc),a0
		lea	(g_Buffer).l,a1
		bsr.w	DecompTilemap
		move.w	#$0000,d0
		bsr.w	ReindexDecompTilemap
		lea	($0000C184).l,a1
		bsr.w	CopyTilemapToVDP
		lea	Title2(pc),a0
		lea	(g_Buffer).l,a1
		lea	($00002000).w,a2
		jsr	(j_LoadCompressedGfx).l	  ; a0 - compressed graphics source
						  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination
		lea	Title2Map(pc),a0
		lea	(g_Buffer).l,a1
		bsr.w	DecompTilemap
		move.w	#$2100,d0
		bsr.w	ReindexDecompTilemap
		lea	($0000E084).l,a1
		bsr.w	CopyTilemapToVDP
		lea	Title3(pc),a0
		lea	(g_Buffer).l,a1
		lea	($00005000).w,a2
		jsr	(j_LoadCompressedGfx).l	  ; a0 - compressed graphics source
						  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination
		lea	Title3Map(pc),a0
		lea	(g_Buffer).l,a1
		bsr.w	DecompTilemap
		move.w	#$0280,d0
		bsr.w	ReindexDecompTilemap
		moveq	#$00000010,d0
		moveq	#$0000000D,d1
		move.w	#$2000,d2
		moveq	#$00000013,d6
		moveq	#$00000004,d7
		bsr.w	sub_39E72
		moveq	#$0000000E,d0
		moveq	#$00000013,d1
		moveq	#$0000000E,d6
		moveq	#$00000000,d7
		bsr.w	sub_39E72
		moveq	#$0000000A,d0
		moveq	#$00000016,d1
		moveq	#$00000013,d6
		moveq	#$00000001,d7
		bsr.w	sub_39E72
		lea	(g_Pal0Base).l,a0
		moveq	#$0000001F,d7

loc_39920:					  ; CODE XREF: DisplayTitle+1C0j
		clr.w	(a0)+
		dbf	d7,loc_39920
		jsr	(j_CopyBasePalleteToActivePalette).l
		jsr	(j_EnableInterrupts).l
		jsr	(j_FlushDMACopyQueue).l
		jsr	(j_EnableDisplay).l
		bsr.w	loc_399CC
		tst.w	d0
		beq.s	loc_39948
		bpl.s	loc_3997C

loc_39948:					  ; CODE XREF: DisplayTitle+1E2j
		bsr.w	sub_39D76
		lea	Title3Palette(pc),a0
		jsr	(j_LoadPaletteToRAM).l
		lea	Title3Palette(pc),a0
		jsr	(j_CopyPalette).l
		jsr	(j_CopyBasePalleteToActivePalette).l
		jsr	(j_FlushDMACopyQueue).l
		bsr.w	WaitForStartGame
		move	sr,-(sp)
		jsr	(j_FadeToBlack).l
		move	(sp)+,ccr
		rts
; ---------------------------------------------------------------------------

loc_3997C:					  ; CODE XREF: DisplayTitle+1E4j
		jsr	(j_FadeToBlack).l
		ori	#$01,ccr
		rts
; END OF FUNCTION CHUNK	FOR DisplayTitle

; =============== S U B	R O U T	I N E =======================================


WaitForStartGame:				  ; CODE XREF: DisplayTitle+20Ap
		move.w	#03599,d7

loc_3998C:					  ; CODE XREF: WaitForStartGame+1Aj
		jsr	(j_UpdateControllerInputs).l
		andi.b	#CTRLBF_ANYBUTTON,(g_Controller1State).l
		beq.s	loc_399AA
		jsr	(j_WaitUntilVBlank).l
		dbf	d7,loc_3998C
		bra.w	loc_399C2
; ---------------------------------------------------------------------------

loc_399AA:					  ; CODE XREF: WaitForStartGame+12j
						  ; WaitForStartGame+36j
		jsr	(j_UpdateControllerInputs).l
		tst.b	(g_Controller1State).l
		bmi.s	loc_399C6
		jsr	(j_WaitUntilVBlank).l
		dbf	d7,loc_399AA

loc_399C2:					  ; CODE XREF: WaitForStartGame+1Ej
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_399C6:					  ; CODE XREF: WaitForStartGame+2Ej
		ori	#$01,ccr
		rts
; End of function WaitForStartGame

; ---------------------------------------------------------------------------

loc_399CC:					  ; CODE XREF: DisplayTitle+1DCp
		link	a6,#-$001E
		movea.l	a6,a0
		moveq	#$0000001D,d7
		clr.b	d0

loc_399D6:					  ; CODE XREF: ROM:000399D8j
		move.b	d0,-(a0)
		dbf	d7,loc_399D6
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicTown
; ---------------------------------------------------------------------------
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicTitle
; ---------------------------------------------------------------------------

loc_399E4:					  ; CODE XREF: ROM:00039A52j
		clr.b	-$0000001D(a6)
		jsr	(j_UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d0
		bne.s	loc_39A54
		move.w	#$0136,d0
		bsr.w	sub_39DD8
		bsr.w	sub_39D3A
		move.w	#$012C,d0
		bsr.w	sub_39CA4
		move.w	#$0118,d0
		bsr.w	sub_39C46
		move.w	#$00DC,d0
		bsr.w	sub_39B3C
		move.w	#$0082,d0
		bsr.w	sub_39BAA
		move.w	#$0000,d0
		bsr.w	sub_39A98
		tst.b	-$0000001D(a6)
		beq.s	loc_39A3C
		jsr	(j_CopyBasePalleteToActivePalette).l
		jsr	(j_EnableDMAQueueProcessing).l

loc_39A3C:					  ; CODE XREF: ROM:00039A2Ej
		jsr	(j_WaitUntilVBlank).l
		addq.w	#$01,-$00000002(a6)
		move.w	#$003C,d0
		bsr.w	sub_39A5C
		tst.b	-$0000001C(a6)
		bpl.s	loc_399E4

loc_39A54:					  ; CODE XREF: ROM:000399F4j
		move.w	-$00000004(a6),d0
		unlk	a6
		rts

; =============== S U B	R O U T	I N E =======================================


sub_39A5C:					  ; CODE XREF: ROM:00039A4Ap
		tst.b	-$00000015(a6)
		bpl.s	locret_39A96
		tst.b	-$00000016(a6)
		bpl.s	locret_39A96
		tst.b	-$00000017(a6)
		bpl.s	locret_39A96
		tst.b	-$00000018(a6)
		bpl.s	locret_39A96
		tst.b	-$00000019(a6)
		bpl.s	locret_39A96
		tst.b	-$0000001A(a6)
		bpl.s	locret_39A96
		addq.w	#$01,-$00000004(a6)
		cmp.w	-$00000004(a6),d0
		bcc.s	locret_39A96
		move.b	#$FF,-$0000001C(a6)
		move.w	#$FFFF,-$00000004(a6)

locret_39A96:					  ; CODE XREF: sub_39A5C+4j
						  ; sub_39A5C+Aj ...
		rts
; End of function sub_39A5C


; =============== S U B	R O U T	I N E =======================================


sub_39A98:					  ; CODE XREF: ROM:00039A26p
		tst.b	-$00000015(a6)
		bpl.s	loc_39AA0
		rts
; ---------------------------------------------------------------------------

loc_39AA0:					  ; CODE XREF: sub_39A98+4j
		cmp.w	-$00000002(a6),d0
		bcs.s	loc_39AA8
		rts
; ---------------------------------------------------------------------------

loc_39AA8:					  ; CODE XREF: sub_39A98+Cj
		move.w	-$00000006(a6),d0
		ext.l	d0
		lea	((g_Pal0Base+2)).l,a0
		lea	TitlePaletteBlueFade(pc),a1
		clr.b	d6
		moveq	#$0000000E,d7

loc_39ABC:					  ; CODE XREF: sub_39A98+28j
		bsr.w	sub_39AD6
		dbf	d7,loc_39ABC
		cmpi.b	#$0E,d6
		bcs.s	loc_39AD0
		move.b	#$FF,-$00000015(a6)

loc_39AD0:					  ; CODE XREF: sub_39A98+30j
		addq.w	#$01,-$00000006(a6)
		rts
; End of function sub_39A98


; =============== S U B	R O U T	I N E =======================================


sub_39AD6:					  ; CODE XREF: sub_39A98:loc_39ABCp
		subi.l	#$00000006,d0
		bmi.s	locret_39B02
		move.l	d0,d1
		divu.w	#$0002,d1
		cmpi.l	#$00010000,d1
		bcc.s	locret_39B02
		move.w	(a1),d2
		cmp.w	d1,d2
		bcc.s	loc_39AF6
		move.w	d2,d1
		addq.b	#$01,d6

loc_39AF6:					  ; CODE XREF: sub_39AD6+1Aj
		add.w	d1,d1
		move.w	$00000002(a1,d1.w),d1
		move.w	d1,(a0)+
		addq.b	#$01,-$0000001D(a6)

locret_39B02:					  ; CODE XREF: sub_39AD6+6j
						  ; sub_39AD6+14j
		rts
; End of function sub_39AD6

; ---------------------------------------------------------------------------
