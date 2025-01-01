
; =============== S U B	R O U T	I N E =======================================


GetInvEquipLayout:				  ; CODE XREF: sub_EAD4:loc_EAF2p
						  ; sub_EC34+22p
		lea	(g_Buffer).l,a0
		lea	0000000006(a0),a0
		clr.w	(a0)
		moveq	#$00000002,d1
		lea	EquipInventoryLayout(pc),a3
		lea	(g_Buffer).l,a4
		move.w	#$0003,d7

loc_ED10:					  ; CODE XREF: GetInvEquipLayout+56j
		move.w	#$0001,d0
		movem.w	d1/d7,-(sp)
		bsr.w	sub_D86C
		move.w	#$0008,d7
		bsr.w	sub_ED50
		move.w	$00000010(a4),d0
		andi.l	#$00000007,d0
		move.b	(a3,d0.w),d0
		andi.b	#$7F,d0
		clr.b	d1
		bsr.w	sub_D5E4
		movem.w	(sp)+,d1/d7
		addq.w	#$04,d1
		lea	$00000005(a3),a3
		lea	$00000002(a4),a4
		dbf	d7,loc_ED10
		rts
; End of function GetInvEquipLayout


; =============== S U B	R O U T	I N E =======================================


sub_ED50:					  ; CODE XREF: GetInvEquipLayout+2Cp
		subq.w	#$01,d7
		movem.l	a0,-(sp)
		move.w	#$0001,d5

loc_ED5A:					  ; CODE XREF: sub_ED50+1Ej
		move.w	d7,d6
		movea.l	a0,a1

loc_ED5E:					  ; CODE XREF: sub_ED50+14j
		move.w	#$0014,d0
		move.w	d0,(a0)+
		dbf	d6,loc_ED5E
		movea.l	a1,a0
		lea	$00000048(a0),a0
		dbf	d5,loc_ED5A
		movem.l	(sp)+,a0
		rts
; End of function sub_ED50

; ---------------------------------------------------------------------------
		movem.w	d2,-(sp)
		clr.l	d1
		move.b	#$64,d2
		bsr.w	sub_ED96
		move.b	#$0A,d2
		bsr.w	sub_ED96
		or.b	d0,d1
		movem.w	(sp)+,d2
		rts

; =============== S U B	R O U T	I N E =======================================


sub_ED96:					  ; CODE XREF: ROM:0000ED82p
						  ; ROM:0000ED8Ap ...
		sub.b	d2,d0
		bcs.w	loc_EDA0
		addq.b	#$01,d1
		bra.s	sub_ED96
; ---------------------------------------------------------------------------

loc_EDA0:					  ; CODE XREF: sub_ED96+2j
		add.b	d2,d0
		lsl.l	#$08,d1
		rts
; End of function sub_ED96


; =============== S U B	R O U T	I N E =======================================


sub_EDA6:					  ; CODE XREF: sub_EAD4+26p
		bsr.w	sub_EDC4
; End of function sub_EDA6


; =============== S U B	R O U T	I N E =======================================


sub_EDAA:					  ; CODE XREF: sub_EAD4+98p
						  ; sub_EBA4+10p ...
		move.l	d2,-(sp)
		bsr.w	sub_D902
		moveq	#$FFFFFFFF,d2
		move.w	d2,$00000008(a0)
		move.w	d2,$00000010(a0)
		jsr	(FlushDMACopyQueue).l
		move.l	(sp)+,d2
		rts
; End of function sub_EDAA


; =============== S U B	R O U T	I N E =======================================


sub_EDC4:					  ; CODE XREF: sub_EAD4+92p
						  ; sub_EBA4+4p ...
		lea	((g_Buffer+$18)).l,a0
		lea	((g_Buffer+$1A)).l,a1
		move.w	(a0),d0
		move.w	(a1),d1
		mulu.w	#$0028,d0
		addi.w	#$00E0,d0
		mulu.w	#$0020,d1
		addi.w	#$00A8,d1
		moveq	#$FFFFFFFF,d2
		rts
; End of function sub_EDC4

; ---------------------------------------------------------------------------
		move.w	#$A000,d0

loc_EDEC:					  ; CODE XREF: ROM:loc_EE0Cj
		move.b	(a1)+,d0
		cmpi.b	#$7B,d0
		bne.s	loc_EDFC
		move.w	d0,-$00000048(a0)
		bra.w	loc_EE0C
; ---------------------------------------------------------------------------

loc_EDFC:					  ; CODE XREF: ROM:0000EDF2j
		cmpi.b	#$7C,d0
		bne.s	loc_EE0A
		move.w	d0,-$00000048(a0)
		bra.w	loc_EE0C
; ---------------------------------------------------------------------------

loc_EE0A:					  ; CODE XREF: ROM:0000EE00j
		move.w	d0,(a0)+

loc_EE0C:					  ; CODE XREF: ROM:0000EDF8j
						  ; ROM:0000EE06j
		dbf	d7,loc_EDEC
		rts
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_EAD4

loc_EE12:					  ; CODE XREF: sub_EAD4+5Ej
		lea	(g_Buffer).l,a1
		lea	$00000018(a1),a0
		lea	$0000001A(a1),a1
		lea	EquipInventoryLayout(pc),a2
		move.w	(a0),d0
		move.w	(a1),d1
		mulu.w	#$0005,d1
		add.w	d1,d0
		move.b	(a2,d0.w),d0
		tst.b	d0
		bmi.w	loc_EE44
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	loc_EE80

loc_EE44:					  ; CODE XREF: sub_EAD4+360j
		move.w	(a1),d1
		add.w	d1,d1
		lea	(g_Buffer).l,a2
		lea	$00000010(a2,d1.w),a2
		move.w	(a0),(a2)
		lea	((g_Buffer+$10)).l,a0
		clr.w	d0
		move.b	#$07,d1
		move.w	#$0003,d7

loc_EE64:					  ; CODE XREF: sub_EAD4+398j
		move.w	(a0)+,d2
		and.b	d1,d2
		or.b	d2,d0
		ror.w	#$04,d0
		dbf	d7,loc_EE64
		lea	(g_CurrentEquippedItems).l,a0
		move.w	d0,(a0)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_CursorSelect
; ---------------------------------------------------------------------------
		bra.w	loc_EAF2
; ---------------------------------------------------------------------------

loc_EE80:					  ; CODE XREF: sub_EAD4+36Cj
		bra.w	loc_EAF2
; END OF FUNCTION CHUNK	FOR sub_EAD4
; ---------------------------------------------------------------------------

InitGameSelectScreen:				  ; DATA XREF: LoadGameSelectScreen+8t
		link	a6,#-$001E
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Stop
; ---------------------------------------------------------------------------
		movea.l	a6,a0
		moveq	#$0000001D,d7

loc_EE90:					  ; CODE XREF: ROM:0000EE92j
		clr.b	-(a0)
		dbf	d7,loc_EE90
		ext.w	d0
		move.w	d0,-$00000002(a6)
		move.b	#$0B,(byte_FF112A).l
		clr.w	-$0000000A(a6)
		clr.b	-$00000008(a6)
		jsr	(DisableDisplayAndInts).l
		clr.w	d6
		jsr	(j_FillVSRAM).l
		jsr	(j_FillVSRAMOffset1).l
		bsr.w	LoadGameSelectMenu
		bsr.w	InitGameStartScreen
		bsr.w	sub_F958
		bsr.w	LoadGameStartPalette
		clr.w	d6
		jsr	(j_FillHScrollData).l
		jsr	(j_FillVSRAM).l
		jsr	(j_FillHScrollDataOffset1).l
		jsr	(j_FillVSRAMOffset1).l
		jsr	(EnableDisplayAndInts).l
		jsr	(j_FadeFromBlack).l

loc_EEF6:					  ; CODE XREF: ROM:0000EF16j
						  ; ROM:0000EF74j ...
		bsr.w	sub_F92A
		move.w	#$FFFF,-$00000004(a6)
		move.w	#$FFFF,-$00000006(a6)
		move.w	#$0012,-$0000000E(a6)
		bsr.w	LoadGameStartPalette
		bsr.w	loc_EFF0
		tst.w	d0
		bmi.s	loc_EEF6
		move.w	d0,-$00000004(a6)
		move.b	d0,(g_SaveSlot).l
		move.w	-$0000000C(a6),d0
		cmpi.b	#$01,d0
		beq.w	loc_EF50
		bcc.w	loc_EFB8
		bsr.w	HandleGameStartInput
		jsr	(j_FadeToBlack).l
		move.w	-$00000004(a6),d0
		move.b	d0,(g_SaveSlot).l
		jsr	(LoadSavedGame).l
		unlk	a6
		rts
; ---------------------------------------------------------------------------

loc_EF50:					  ; CODE XREF: ROM:0000EF2Aj
		bsr.w	sub_F250
		bsr.w	sub_FAE6
		bsr.w	ClearTextBuffer
		move.w	#$004B,d1
		bsr.w	j_j_LoadUncompressedString
		jsr	(WaitUntilVBlank).l
		bsr.w	DMACopyTextBuffer

loc_EF6E:					  ; CODE XREF: ROM:0000EF82j
		bsr.w	loc_EFF0
		tst.w	d0
		bmi.w	loc_EEF6
		cmp.w	-$00000004(a6),d0
		bne.s	loc_EF84
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_ErrorBuzz
; ---------------------------------------------------------------------------
		bra.s	loc_EF6E
; ---------------------------------------------------------------------------

loc_EF84:					  ; CODE XREF: ROM:0000EF7Cj
		move.w	d0,-$00000006(a6)
		bsr.w	ClearTextBuffer
		move.w	#$0049,d1
		bsr.w	j_j_LoadUncompressedString
		bsr.w	sub_F992
		tst.w	d0
		bne.w	loc_EEF6
		move.w	-$00000004(a6),d0
		move.w	-$00000006(a6),d1
		jsr	(CopySaveGame).l
		move.w	-$00000006(a6),d0
		bsr.w	sub_F72E
		bra.w	loc_EEF6
; ---------------------------------------------------------------------------

loc_EFB8:					  ; CODE XREF: ROM:0000EF2Ej
		bsr.w	ClearTextBuffer
		move.w	#$004A,d1
		bsr.w	j_j_LoadUncompressedString
		bsr.w	sub_F992
		tst.w	d0
		bne.w	loc_EEF6
		move.w	-$00000004(a6),d0
		move.b	d0,(g_SaveSlot).l
		jsr	(GetCurrentSaveSlot).l
		jsr	(WaitUntilVBlank).l
		move.w	-$00000004(a6),d0
		bsr.w	sub_F72E
		bra.w	loc_EEF6
; ---------------------------------------------------------------------------

loc_EFF0:					  ; CODE XREF: ROM:0000EF10p
						  ; ROM:loc_EF6Ep
		clr.b	d0
		bsr.w	sub_FAF0
		bsr.w	sub_F218
		jsr	(j_WaitUntilVBlank).l
		bsr.w	sub_F306
		clr.b	-$00000019(a6)
		move.l	#byte_F2D1,-$00000016(a6)
		move.b	(g_Controller1State).l,d0
		move.b	d0,-$00000008(a6)

loc_F01A:					  ; CODE XREF: ROM:0000F0A0j
		tst.b	-$00000019(a6)
		beq.s	loc_F024
		clr.b	-$00000019(a6)

loc_F024:					  ; CODE XREF: ROM:0000F01Ej
		bsr.w	sub_F2E2
		move.b	(g_Controller1State).l,d0
		btst	#$04,d0
		bne.s	loc_F0AE
		btst	#$07,d0
		bne.s	loc_F0A4
		btst	#$06,d0
		bne.s	loc_F0A4
		btst	#$05,d0
		bne.s	loc_F0A4
		move.w	-$00000002(a6),d7
		btst	#$00,d0
		beq.s	loc_F056
		bsr.w	sub_F0B2
		bra.s	loc_F07C
; ---------------------------------------------------------------------------

loc_F056:					  ; CODE XREF: ROM:0000F04Ej
		btst	#$01,d0
		beq.s	loc_F062
		bsr.w	sub_F0C0
		bra.s	loc_F07C
; ---------------------------------------------------------------------------

loc_F062:					  ; CODE XREF: ROM:0000F05Aj
		btst	#$02,d0
		beq.s	loc_F06E
		bsr.w	sub_F0CE
		bra.s	loc_F07C
; ---------------------------------------------------------------------------

loc_F06E:					  ; CODE XREF: ROM:0000F066j
		btst	#$03,d0
		beq.s	loc_F07A
		bsr.w	sub_F0DC
		bra.s	loc_F07C
; ---------------------------------------------------------------------------

loc_F07A:					  ; CODE XREF: ROM:0000F072j
		bra.s	loc_F08E
; ---------------------------------------------------------------------------

loc_F07C:					  ; CODE XREF: ROM:0000F054j
						  ; ROM:0000F060j ...
		cmp.w	-$00000002(a6),d7
		beq.s	loc_F086
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_CursorMove
; ---------------------------------------------------------------------------

loc_F086:					  ; CODE XREF: ROM:0000F080j
		bsr.w	sub_F0F8
		bsr.w	sub_F218

loc_F08E:					  ; CODE XREF: ROM:loc_F07Aj
		bsr.w	sub_F8B6
		bsr.w	sub_F13A
		jsr	(WaitUntilVBlank).l
		bsr.w	sub_F306
		bra.w	loc_F01A
; ---------------------------------------------------------------------------

loc_F0A4:					  ; CODE XREF: ROM:0000F038j
						  ; ROM:0000F03Ej ...
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_CursorSelect
; ---------------------------------------------------------------------------
		move.w	-$00000002(a6),d0
		rts
; ---------------------------------------------------------------------------

loc_F0AE:					  ; CODE XREF: ROM:0000F032j
		moveq	#$FFFFFFFF,d0
		rts

; =============== S U B	R O U T	I N E =======================================


sub_F0B2:					  ; CODE XREF: ROM:0000F050p
		move.w	-$00000002(a6),d0
		andi.w	#$0001,d0
		move.w	d0,-$00000002(a6)
		rts
; End of function sub_F0B2


; =============== S U B	R O U T	I N E =======================================


sub_F0C0:					  ; CODE XREF: ROM:0000F05Cp
		move.w	-$00000002(a6),d0
		ori.w	#$0002,d0
		move.w	d0,-$00000002(a6)
		rts
; End of function sub_F0C0


; =============== S U B	R O U T	I N E =======================================


sub_F0CE:					  ; CODE XREF: ROM:0000F068p
		move.w	-$00000002(a6),d0
		andi.w	#$0002,d0
		move.w	d0,-$00000002(a6)
		rts
; End of function sub_F0CE


; =============== S U B	R O U T	I N E =======================================


sub_F0DC:					  ; CODE XREF: ROM:0000F074p
		move.w	-$00000002(a6),d0
		ori.w	#$0001,d0
		move.w	d0,-$00000002(a6)
		rts
; End of function sub_F0DC

; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------
		bsr.w	sub_F282
		move.w	#$0000,d0
		bra.w	sub_F11C

; =============== S U B	R O U T	I N E =======================================


sub_F0F8:					  ; CODE XREF: ROM:loc_F086p
						  ; sub_FFE2+16p
		movea.l	-$00000016(a6),a0
		cmpi.b	#$0F,(a0)
		beq.s	loc_F116
		move.l	#byte_F2DB,-$00000016(a6)
		clr.b	-$00000017(a6)
		clr.b	-$00000018(a6)
		clr.b	-$00000019(a6)

loc_F116:					  ; CODE XREF: sub_F0F8+8j
		bsr.w	sub_FAF0
		rts
; End of function sub_F0F8


; =============== S U B	R O U T	I N E =======================================


sub_F11C:					  ; CODE XREF: ROM:0000F0F4j
						  ; sub_F202+Ap ...
		moveq	#$00000009,d6

loc_F11E:					  ; CODE XREF: sub_F11C+18j
		movea.l	a0,a1
		moveq	#$00000011,d7

loc_F122:					  ; CODE XREF: sub_F11C+10j
		move.w	(a0),d1
		andi.w	#$9FFF,d1
		or.w	d0,d1
		move.w	d1,(a0)+
		dbf	d7,loc_F122
		lea	$00000050(a1),a0
		dbf	d6,loc_F11E
		rts
; End of function sub_F11C


; =============== S U B	R O U T	I N E =======================================


sub_F13A:					  ; CODE XREF: ROM:0000F092p
						  ; sub_F1FA+2p ...
		bsr.w	sub_F18C
		bsr.w	sub_F2A6
		move.w	(a0)+,d4
		add.w	-$00000010(a6),d4
		move.w	(a0)+,d5
		add.w	-$00000012(a6),d5
		move.l	#$00000000,d0
		move.w	#$4400,d1
		lea	(g_VDPSpr04_Y).l,a3
		clr.l	d6
		bset	#$03,d6
		move.w	#$FFFF,d7
		move.w	d7,(a3)
		move.w	d7,$00000008(a3)
		move.w	d7,$00000010(a3)
		move.w	d7,$00000018(a3)
		movem.l	d2-d3/a4-a6,-(sp)
		jsr	(LoadSpriteGfx).l
		jsr	(EnableDMAQueueProcessing).l
		movem.l	(sp)+,d2-d3/a4-a6
		rts
; End of function sub_F13A


; =============== S U B	R O U T	I N E =======================================


sub_F18C:					  ; CODE XREF: sub_F13Ap
						  ; sub_F18C:loc_F1C8j
		movea.l	-$00000016(a6),a0
		clr.w	d2
		move.b	(a0)+,d2
		lsl.w	#$02,d2
		clr.w	d0
		move.b	-$00000017(a6),d0
		clr.w	d3
		move.b	-$00000018(a6),d3

loc_F1A2:					  ; CODE XREF: sub_F18C+46j
		move.b	(a0,d3.w),d1
		bne.s	loc_F1CA
		addq.b	#$01,-$00000019(a6)
		clr.b	-$00000017(a6)
		clr.b	-$00000018(a6)
		lea	byte_F2DB(pc),a0
		nop
		cmpa.l	-$00000016(a6),a0
		bne.s	loc_F1C8
		move.l	#byte_F2D1,-$00000016(a6)

loc_F1C8:					  ; CODE XREF: sub_F18C+32j
		bra.s	sub_F18C
; ---------------------------------------------------------------------------

loc_F1CA:					  ; CODE XREF: sub_F18C+1Aj
		cmp.b	d1,d0
		bcs.s	loc_F1D4
		addq.w	#$01,d3
		clr.w	d0
		bra.s	loc_F1A2
; ---------------------------------------------------------------------------

loc_F1D4:					  ; CODE XREF: sub_F18C+40j
		move.b	d0,-$00000017(a6)
		addq.b	#$01,-$00000017(a6)
		move.b	d3,-$00000018(a6)
		lsl.w	#$02,d3
		rts
; End of function sub_F18C


; =============== S U B	R O U T	I N E =======================================


sub_F1E4:					  ; CODE XREF: sub_F1FAp
						  ; sub_FFE2+26p
		move.l	#byte_F2CE,-$00000016(a6)
		clr.b	-$00000019(a6)
		clr.b	-$00000017(a6)
		clr.b	-$00000018(a6)
		rts
; End of function sub_F1E4


; =============== S U B	R O U T	I N E =======================================


sub_F1FA:					  ; CODE XREF: sub_F992p
		bsr.s	sub_F1E4
		bsr.w	sub_F13A
		rts
; End of function sub_F1FA


; =============== S U B	R O U T	I N E =======================================


sub_F202:					  ; CODE XREF: sub_F92A+Ap
		moveq	#$00000003,d0

loc_F204:					  ; CODE XREF: sub_F202+10j
		move.l	d0,-(sp)
		bsr.w	sub_F282
		clr.l	d0
		bsr.w	sub_F11C
		move.l	(sp)+,d0
		dbf	d0,loc_F204
		rts
; End of function sub_F202


; =============== S U B	R O U T	I N E =======================================


sub_F218:					  ; CODE XREF: ROM:0000EFF6p
						  ; ROM:0000F08Ap ...
		moveq	#$00000003,d0

loc_F21A:					  ; CODE XREF: sub_F218+32j
		move.l	d0,-(sp)
		cmp.w	-$00000002(a6),d0
		beq.s	loc_F23C
		cmp.w	-$00000004(a6),d0
		beq.s	loc_F23C
		cmp.w	-$00000006(a6),d0
		beq.s	loc_F23C
		bsr.w	sub_F282
		move.w	#$6000,d0
		bsr.w	sub_F11C
		bra.s	loc_F248
; ---------------------------------------------------------------------------

loc_F23C:					  ; CODE XREF: sub_F218+8j
						  ; sub_F218+Ej ...
		bsr.w	sub_F282
		move.w	#$0000,d0
		bsr.w	sub_F11C

loc_F248:					  ; CODE XREF: sub_F218+22j
		move.l	(sp)+,d0
		dbf	d0,loc_F21A
		rts
; End of function sub_F218


; =============== S U B	R O U T	I N E =======================================


sub_F250:					  ; CODE XREF: ROM:loc_EF50p
		moveq	#$00000003,d0

loc_F252:					  ; CODE XREF: sub_F250+2Cj
		move.l	d0,-(sp)
		cmp.w	-$00000004(a6),d0
		beq.s	loc_F26E
		cmp.w	-$00000006(a6),d0
		beq.s	loc_F26E
		bsr.w	sub_F282
		move.w	#$0000,d0
		bsr.w	sub_F11C
		bra.s	loc_F27A
; ---------------------------------------------------------------------------

loc_F26E:					  ; CODE XREF: sub_F250+8j
						  ; sub_F250+Ej
		bsr.w	sub_F282
		move.w	#$6000,d0
		bsr.w	sub_F11C

loc_F27A:					  ; CODE XREF: sub_F250+1Cj
		move.l	(sp)+,d0
		dbf	d0,loc_F252
		rts
; End of function sub_F250


; =============== S U B	R O U T	I N E =======================================


sub_F282:					  ; CODE XREF: ROM:0000F0ECp
						  ; sub_F202+4p ...
		lea	SaveGameWindowBegin(pc),a0
		andi.b	#$03,d0
		ext.w	d0
		ext.l	d0
		lsl.l	#$02,d0
		movea.l	(a0,d0.l),a0
		rts
; End of function sub_F282

; ---------------------------------------------------------------------------
SaveGameWindowBegin:dc.l g_Buffer+$56		  ; DATA XREF: sub_F282t
		dc.l g_Buffer+$7A
		dc.l g_Buffer+$376
		dc.l g_Buffer+$39A

; =============== S U B	R O U T	I N E =======================================


sub_F2A6:					  ; CODE XREF: sub_F13A+4p
		move.w	-$00000002(a6),d0
		lea	SaveGameNigelPos(pc),a0
		andi.b	#$03,d0
		ext.w	d0
		ext.l	d0
		lsl.l	#$02,d0
		lea	(a0,d0.l),a0
		rts
; End of function sub_F2A6

; ---------------------------------------------------------------------------
SaveGameNigelPos:dc.w $00A4,$00CC		  ; DATA XREF: sub_F2A6+4t
		dc.w $0134,$00CC
		dc.w $00A4,$011C
		dc.w $0134,$011C
byte_F2CE:	dc.b $01,$01,$00		  ; DATA XREF: sub_F1E4o
byte_F2D1:	dc.b $03,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$00 ; DATA XREF: ROM:0000F008o
						  ; sub_F18C+34o
byte_F2DB:	dc.b $0F,$06,$06,$06,$06,$00,$FF  ; DATA XREF: sub_F0F8+Ao
						  ; sub_F18C+28t

; =============== S U B	R O U T	I N E =======================================


sub_F2E2:					  ; CODE XREF: ROM:loc_F024p
						  ; sub_FA24p ...
		jsr	(j_UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d1
		move.b	-$00000008(a6),d0
		bne.s	loc_F2FA
		move.b	d1,-$00000008(a6)
		bra.s	locret_F304
; ---------------------------------------------------------------------------

loc_F2FA:					  ; CODE XREF: sub_F2E2+10j
		move.b	d1,-$00000008(a6)
		clr.b	(g_Controller1State).l

locret_F304:					  ; CODE XREF: sub_F2E2+16j
		rts
; End of function sub_F2E2


; =============== S U B	R O U T	I N E =======================================


sub_F306:					  ; CODE XREF: ROM:0000F000p
						  ; ROM:0000F09Cp ...
		lea	($0000C000).l,a1
		bra.s	loc_F314
; End of function sub_F306


; =============== S U B	R O U T	I N E =======================================


sub_F30E:					  ; CODE XREF: sub_FF78+44p
		lea	($0000E000).l,a1

loc_F314:					  ; CODE XREF: sub_F306+6j
		lea	(g_Buffer).l,a0
		move.b	(a0)+,d0
		move.b	#$28,d0
		ext.w	d0
		move.b	(a0)+,d1
		move.b	#$1C,d1
		ext.w	d1
		subq.w	#$01,d1

loc_F32C:					  ; CODE XREF: sub_F30E+32j
		movem.l	d0-d1/a1,-(sp)
		moveq	#$00000002,d1
		jsr	(j_DoDMACopy_1).l
		movem.l	(sp)+,d0-d1/a1
		lea	$00000080(a1),a1
		dbf	d1,loc_F32C
		rts
; End of function sub_F30E

