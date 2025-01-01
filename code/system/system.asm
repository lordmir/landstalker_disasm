; ---------------------------------------------------------------------------

ResetAll:					  ; CODE XREF: ROM:000016C6j
		lea	(ResetSP).w,sp
		bra.s	loc_4CE
; ---------------------------------------------------------------------------

EndGame:					  ; DATA XREF: ROM:j_EndGamet
		lea	(ResetSP).w,sp
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut0
; ---------------------------------------------------------------------------
		move.w	#00180,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames

loc_4CE:					  ; CODE XREF: ROM:000004BCj
		bsr.w	DisableDisplayAndInts
		bsr.s	ResetVDPAndClearRAM
		bsr.s	ClearAndInitGraphics
		jmp	(ResetGame).l
; ---------------------------------------------------------------------------

GameOver:					  ; CODE XREF: ROM:000016D8j
		lea	(ResetSP).w,sp
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut0
; ---------------------------------------------------------------------------
		bsr.w	FadeToBlack
		move.w	#00180,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames
		bsr.w	DisableDisplayAndInts
		bsr.s	ResetVDPAndClearRAM
		bsr.s	ClearAndInitGraphics
		jmp	(loc_16CA).l
; ---------------------------------------------------------------------------

loc_4FE:					  ; CODE XREF: ROM:000006F6j
		bsr.s	ResetVDPAndClearRAM
		bsr.w	InitZ80Driver
		bsr.s	ClearAndInitGraphics
		jsr	(j_CheckRegion).l
		bsr.w	CheckSRAM
		jmp	(ResetGame).l

; =============== S U B	R O U T	I N E =======================================


ResetVDPAndClearRAM:				  ; CODE XREF: ROM:000004D2p
						  ; ROM:000004F4p ...
		move.w	(InitVDPRegs01,pc),d0	  ; #01	Disable	Display, Enable	VInt, Disable DMA, 28V cells
						  ; #02	ScrollA	Source 0xC000, #3 Window Source	0xF000
						  ; #04	ScrollB	Source 0xE000
						  ; #05	Sprite Table Source 0xD400
						  ; #06	Reserved 00
						  ; #07	Background Palette 0, Colour 0 (BLACK)
						  ; #08	Reserved 00
						  ; #09	Reserved 00
						  ; #10	Horizontal Interrupt on	Line 0
						  ; #11	Ext Interrupt Disabled,	Vertival 2-Cell	scroll,	Horizontal line	scroll
						  ; #12	40 cell	horizontal, Shadow/HL disabled,	No Interlace
						  ; #13	HScroll	Base Addr 0xD000
						  ; #14	Reserved 00
						  ; #15	Auto Increment 2
						  ; #16	Vertical 32 Cell, Horizontal 64	Cell
						  ; #17	Window Left 0 Cells
						  ; #18	Window Right 0 Cells
		nop
		bsr.w	SetVDPReg
		move.w	#$3FDE,d0
		lea	(g_Pal0Base).l,a0

loc_52A:					  ; CODE XREF: ResetVDPAndClearRAM+16j
		clr.l	(a0)+
		dbf	d0,loc_52A
		lea	InitVDPRegs00(pc),a0	  ; Disable HInt, Enable HV Counters
		moveq	#$00000012,d1

loc_536:					  ; CODE XREF: ResetVDPAndClearRAM+26j
		move.w	(a0)+,d0
		bsr.w	SetVDPReg
		dbf	d1,loc_536
		clr.w	d0
		clr.w	d1
		clr.w	d2
		bsr.w	DoDMAFill		  ; d0 - Fill destination address VDP
						  ; d1 - Fill length bytes
						  ; d2 - Fill pattern
		rts
; End of function ResetVDPAndClearRAM


; =============== S U B	R O U T	I N E =======================================


ClearAndInitGraphics:				  ; CODE XREF: ROM:000004D4p
						  ; ROM:000004F6p ...
		move.l	#g_VRAMCopyQueue,(g_VRAMCopyQueuePtr).l
		move.l	#g_DMAOpQueue,(g_DMAOpQueuePtr).l
		moveq	#$00000040,d0
		move.b	d0,(SEGA_CTRL1_CTRL_REG).l
		move.b	d0,(SEGA_CTRL2_CTRL_REG).l
		move.b	d0,(SEGA_EXP_CTRL_REG).l
		lea	(g_HorizontalScrollData).l,a0
		move.w	#$00FF,d0

loc_57E:					  ; CODE XREF: ClearAndInitGraphics+3Aj
		move.w	#$0000,(a0)+
		move.w	#$0000,(a0)+
		dbf	d0,loc_57E
		lea	(g_VSRAMData).l,a0
		move.w	#$0013,d0

loc_594:					  ; CODE XREF: ClearAndInitGraphics+50j
		move.w	#$0000,(a0)+
		move.w	#$0000,(a0)+
		dbf	d0,loc_594
		lea	(g_Pal0Base).l,a0
		moveq	#$0000007F,d1

loc_5A8:					  ; CODE XREF: ClearAndInitGraphics+5Ej
		clr.w	(a0)+
		dbf	d1,loc_5A8
		bsr.w	ClearVDPSpriteTable
		bsr.w	QueueHScrollDMAUpdate
		bsr.w	QueueVSRAMUpdate
		bsr.w	CopyBasePalleteToActivePalette
		bsr.w	EnableDMAQueueProcessing
		rts
; End of function ClearAndInitGraphics

; ---------------------------------------------------------------------------
InitVDPRegs00:	dc.w $8004			  ; DATA XREF: ResetVDPAndClearRAM+1At
						  ; Disable HInt, Enable HV Counters
InitVDPRegs01:	dc.w $8124			  ; DATA XREF: ResetVDPAndClearRAMt
		dc.w $8230			  ; #01	Disable	Display, Enable	VInt, Disable DMA, 28V cells
		dc.w $833C			  ; #02	ScrollA	Source 0xC000, #3 Window Source	0xF000
		dc.w $8407			  ; #04	ScrollB	Source 0xE000
		dc.w $856A			  ; #05	Sprite Table Source 0xD400
		dc.w $8600			  ; #06	Reserved 00
		dc.w $8700			  ; #07	Background Palette 0, Colour 0 (BLACK)
		dc.w $8800			  ; #08	Reserved 00
		dc.w $8900			  ; #09	Reserved 00
		dc.w $8A00			  ; #10	Horizontal Interrupt on	Line 0
		dc.w $8B07			  ; #11	Ext Interrupt Disabled,	Vertival 2-Cell	scroll,	Horizontal line	scroll
		dc.w $8C81			  ; #12	40 cell	horizontal, Shadow/HL disabled,	No Interlace
		dc.w $8D34			  ; #13	HScroll	Base Addr 0xD000
		dc.w $8E00			  ; #14	Reserved 00
		dc.w $8F02			  ; #15	Auto Increment 2
		dc.w $9001			  ; #16	Vertical 32 Cell, Horizontal 64	Cell
		dc.w $9100			  ; #17	Window Left 0 Cells
		dc.w $9200			  ; #18	Window Right 0 Cells
; ---------------------------------------------------------------------------

EntryPoint:					  ; DATA XREF: ROM:ResetPCo
		tst.l	(SEGA_CTRL1_CTRL_REG0).l
		bne.s	loc_5F8
		tst.w	(SEGA_EXP_CTRL_REG0).l

loc_5F8:					  ; CODE XREF: ROM:000005F0j
		bne.s	loc_676
		lea	SystemInit(pc),a5
		movem.w	(a5)+,d5-d7
		movem.l	(a5)+,a0-a4
		move.b	-$000010FF(a1),d0
		andi.b	#$0F,d0
		beq.s	loc_618
		move.l	#'SEGA',$00002F00(a1)

loc_618:					  ; CODE XREF: ROM:0000060Ej
		move.w	(a4),d0
		moveq	#$00000000,d0
		movea.l	d0,a6
		move.l	a6,usp
		moveq	#$00000017,d1

loc_622:					  ; CODE XREF: ROM:00000628j
		move.b	(a5)+,d5
		move.w	d5,(a4)
		add.w	d7,d5
		dbf	d1,loc_622
		move.l	(a5)+,(a4)
		move.w	d0,(a3)
		move.w	d7,(a1)
		move.w	d7,(a2)

loc_634:					  ; CODE XREF: ROM:00000636j
		btst	d0,(a1)
		bne.s	loc_634
		moveq	#$00000025,d2

loc_63A:					  ; CODE XREF: ROM:0000063Cj
		move.b	(a5)+,(a0)+
		dbf	d2,loc_63A
		move.w	d0,(a2)
		move.w	d0,(a1)
		move.w	d7,(a2)

loc_646:					  ; CODE XREF: ROM:00000648j
		move.l	d0,-(a6)
		dbf	d6,loc_646
		move.l	(a5)+,(a4)
		move.l	(a5)+,(a4)
		moveq	#$0000001F,d3

loc_652:					  ; CODE XREF: ROM:00000654j
		move.l	d0,(a3)
		dbf	d3,loc_652
		move.l	(a5)+,(a4)
		moveq	#$00000013,d4

loc_65C:					  ; CODE XREF: ROM:0000065Ej
		move.l	d0,(a3)
		dbf	d4,loc_65C
		moveq	#$00000003,d5

loc_664:					  ; CODE XREF: ROM:00000668j
		move.b	(a5)+,$00000011(a3)
		dbf	d5,loc_664
		move.w	d0,(a2)
		movem.l	(a6),d0-a6
		move	#$2700,sr

loc_676:					  ; CODE XREF: ROM:loc_5F8j
		bra.s	loc_6E4
; ---------------------------------------------------------------------------
SystemInit:	dc.w $8000			  ; DATA XREF: ROM:000005FAt
		dc.w $3FFF
		dc.w $0100
		dc.l Z80_MEM
		dc.l Z80_BUSREQ_REG0
		dc.l Z80_RESET_REG0
		dc.l VDP_DATA_REG
		dc.l VDP_CTRL_REG
		dc.b $04,$14,$30,$3C,$07,$6C,$00,$00
		dc.b $00,$00,$FF,$00,$81,$37,$00,$01
		dc.b $01,$00,$00,$FF,$FF,$00,$00,$80
		dc.l $40000080
		dc.b $AF,$01,$D9,$1F,$11,$27,$00,$21
		dc.b $26,$00,$F9,$77,$ED,$B0,$DD,$E1
		dc.b $FD,$E1,$ED,$47,$ED,$4F,$D1,$E1
		dc.b $F1,$08,$D9,$C1,$D1,$E1,$F1,$F9
		dc.b $F3,$ED,$56,$36,$E9,$E9
		dc.l $81048F02
		dc.l $C0000000
		dc.l $40000010
		dc.b $9F,$BF,$DF,$FF
; ---------------------------------------------------------------------------

loc_6E4:					  ; CODE XREF: ROM:loc_676j
		tst.w	(VDP_CTRL_REG).l

loc_6EA:					  ; CODE XREF: ROM:000006F4j
		move.w	(VDP_CTRL_REG).l,d0
		andi.w	#$0002,d0
		bne.s	loc_6EA
		bra.w	loc_4FE

; =============== S U B	R O U T	I N E =======================================


InitZ80Driver:					  ; CODE XREF: ROM:00000500p
		movem.l	d0-a1,-(sp)
		move.w	#$0100,(Z80_BUSREQ_REG0).l
		move.w	#$0100,(Z80_RESET_REG0).l
		lea	(Z80_MEM).l,a0
		move.w	#$1F80,d7
		lea	(SoundDriver).l,a1

loc_71E:					  ; CODE XREF: InitZ80Driver+2Aj
		move.b	(a1)+,d0
		bsr.w	WriteAndVerifyReg
		dbf	d7,loc_71E
		move.w	#$0000,(Z80_RESET_REG0).l
		nop
		nop
		nop
		nop
		move.w	#$0100,(Z80_RESET_REG0).l
		move.w	#$0000,(Z80_BUSREQ_REG0).l
		movem.l	(sp)+,d0-a1
		rts
; End of function InitZ80Driver

; ---------------------------------------------------------------------------
		bsr.w	WriteAndVerifyReg
		lsr.w	#$08,d0

; =============== S U B	R O U T	I N E =======================================


WriteAndVerifyReg:				  ; CODE XREF: InitZ80Driver+26p
						  ; ROM:0000074Ep ...
		move.b	d0,(a0)
		cmp.b	(a0),d0
		bne.s	WriteAndVerifyReg
		addq.l	#$01,a0
		rts
; End of function WriteAndVerifyReg


; =============== S U B	R O U T	I N E =======================================

; Play sound

Trap00Handler:					  ; DATA XREF: ROM:Trap00o
		movem.l	d0-d1/a0,-(sp)
		movea.l	$0000000E(sp),a0
		move.w	(a0),d1
		addq.l	#$02,$0000000E(sp)	  ; Get	sound effect ID	and advance PC
		cmpi.w	#$FFFF,d1		  ; FFFF - use d0 rather than hard coded value
		bne.s	loc_774
		move.w	d0,d1

loc_774:					  ; CODE XREF: Trap00Handler+12j
		lea	(unk_FF0FA0).l,a0
		moveq	#$00000003,d0

loc_77C:					  ; CODE XREF: Trap00Handler+20j
		tst.w	(a0)+
		dbeq	d0,loc_77C
		move.w	d1,-$00000002(a0)	  ; Queue sound	to be played
		movem.l	(sp)+,d0-d1/a0
		rte
; End of function Trap00Handler


; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn

HandleAddressError:				  ; DATA XREF: ROM:AddressErroro

arg_6		=  $A

		move.l	#'ADDR',(ExceptType).l
		move.l	arg_6(sp),(ExceptAddr).l
		bra.s	HandleUnexpectedInterrupt
; End of function HandleAddressError


; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn

HandleIllegalInst:				  ; DATA XREF: ROM:IllegalInstro
		move.l	#'BAD ',(ExceptType).l
		move.l	$00000002(sp),(ExceptAddr).l
		bra.s	HandleUnexpectedInterrupt
; End of function HandleIllegalInst


; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn

HandleDiv0:					  ; DATA XREF: ROM:DivBy0o
		move.l	#'ZERO',(ExceptType).l
		move.l	$00000001(sp),(ExceptAddr).l
		bra.s	HandleUnexpectedInterrupt
; End of function HandleDiv0


; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn

HandleGenericError:				  ; DATA XREF: ROM:BusErroro
						  ; ROM:CHKInstro ...
		move.l	#'OTHR',(ExceptType).l
		move.l	$00000002(sp),(ExceptAddr).l
		bra.w	*+4
; ---------------------------------------------------------------------------

HandleUnexpectedInterrupt:			  ; CODE XREF: HandleAddressError+12j
						  ; HandleIllegalInst+12j ...
		nop
		nop
		bra.s	HandleUnexpectedInterrupt
; End of function HandleGenericError

; ---------------------------------------------------------------------------

HandleIRQ7:					  ; CODE XREF: ROM:000007E6j
						  ; DATA XREF: ROM:IRQ7o
		nop
		bra.s	HandleIRQ7

; =============== S U B	R O U T	I N E =======================================


Trap01Handler:					  ; DATA XREF: ROM:Trap01o
		movem.l	d0/a0,-(sp)
		movea.l	$0000000A(sp),a0
		move.w	(a0),d0
		addq.l	#$02,$0000000A(sp)	  ; Retrieve data from code and	fix sp
		jsr	(j_RunTextCmd).l
		movem.l	(sp)+,d0/a0
		rte
; End of function Trap01Handler


; =============== S U B	R O U T	I N E =======================================


Trap02Handler:					  ; DATA XREF: ROM:Trap02o
		movem.l	d0/a1,-(sp)
		movea.l	$0000000A(sp),a1
		move.w	(a1),d0
		move.w	(a0,d0.w),d0
		addq.l	#$02,$0000000A(sp)
		jsr	(j_RunTextCmd).l
		movem.l	(sp)+,d0/a1
		rte
; End of function Trap02Handler


; =============== S U B	R O U T	I N E =======================================


WaitUntilZ80Ready:				  ; CODE XREF: ROM:00000856p
						  ; DATA XREF: ROM:00000470t
		movem.w	d0,-(sp)

loc_824:					  ; CODE XREF: WaitUntilZ80Ready+2Aj
		bsr.w	WaitUntilVBlank
		move.w	#$0100,(Z80_BUSREQ_REG0).l

loc_830:					  ; CODE XREF: WaitUntilZ80Ready+18j
		btst	#$00,(Z80_BUSREQ_REG0).l
		bne.s	loc_830
		move.b	(Z80_MEM+$1303).l,d0
		move.w	#$0000,(Z80_BUSREQ_REG0).l
		tst.b	d0
		beq.s	loc_824
		movem.w	(sp)+,d0
		rts
; End of function WaitUntilZ80Ready

; ---------------------------------------------------------------------------

RestoreBGM:					  ; CODE XREF: CheckOpenChest+BEp
						  ; CheckOpenChest+F8p
						  ; DATA XREF: ...
		movem.w	d0,-(sp)
		bsr.s	WaitUntilZ80Ready
		move.b	(g_BGM).l,d0
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_LoadFromD0
; ---------------------------------------------------------------------------
		movem.w	(sp)+,d0
		rts

; =============== S U B	R O U T	I N E =======================================


GetVDPReg:					  ; CODE XREF: j_GetVDPRegj
		movem.l	a0,-(sp)
		lea	(g_VDPReg00_ModeSet1).l,a0
		add.w	d0,d0
		move.w	(a0,d0.w),d0
		movem.l	(sp)+,a0
		rts
; End of function GetVDPReg


; =============== S U B	R O U T	I N E =======================================


SetVDPReg:					  ; CODE XREF: j_SetVDPRegj
						  ; ResetVDPAndClearRAM+6p ...
		movem.l	d0-d1/a0,-(sp)
		lea	(g_VDPReg00_ModeSet1).l,a0
		move.w	d0,(VDP_CTRL_REG).l
		move.w	d0,d1
		andi.w	#$7F00,d0
		lsr.w	#$07,d0
		move.w	d1,(a0,d0.w)
		movem.l	(sp)+,d0-d1/a0
		rts
; End of function SetVDPReg


; =============== S U B	R O U T	I N E =======================================


OrVDPReg:					  ; CODE XREF: j_OrVDPRegj
						  ; EnableDisplay+8j ...
		movem.l	d0-d1/a0,-(sp)
		lea	(g_VDPReg00_ModeSet1).l,a0
		add.w	d0,d0
		or.b	d1,$00000001(a0,d0.w)
		bra.s	loc_8C2
; End of function OrVDPReg


; =============== S U B	R O U T	I N E =======================================


MaskVDPReg:					  ; CODE XREF: j_MaskVDPRegj
						  ; DisableDisplayAndInts-12j ...
		movem.l	d0-d1/a0,-(sp)
		lea	(g_VDPReg00_ModeSet1).l,a0
		add.w	d0,d0
		and.b	d1,$00000001(a0,d0.w)

loc_8C2:					  ; CODE XREF: OrVDPReg+10j
		move.w	(a0,d0.w),d1
		move.w	d1,(VDP_CTRL_REG).l
		movem.l	(sp)+,d0-d1/a0
		rts
; End of function MaskVDPReg


; =============== S U B	R O U T	I N E =======================================


EnableDisplay:					  ; CODE XREF: j_EnableDisplayj
						  ; EnableDisplayAndIntsp ...
		move.w	#$0001,d0
		move.w	#$0040,d1
		bra.s	OrVDPReg
; End of function EnableDisplay

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR DisableDisplayAndInts

DisableDisplay:					  ; CODE XREF: ROM:00000218j
						  ; DisableDisplayAndInts+2j
		move.w	#$0001,d0
		move.w	#$00BF,d1
		bra.s	MaskVDPReg
; END OF FUNCTION CHUNK	FOR DisableDisplayAndInts

; =============== S U B	R O U T	I N E =======================================


EnableInterrupts:				  ; CODE XREF: j_EnableInterruptsj
						  ; EnableDisplayAndInts+2j ...
		move	#$2300,sr
		rts
; End of function EnableInterrupts


; =============== S U B	R O U T	I N E =======================================


DisableInterrupts:				  ; CODE XREF: j_DisableInterruptsj
						  ; DisableDisplayAndIntsp ...
		move	#$2700,sr
		rts
; End of function DisableInterrupts


; =============== S U B	R O U T	I N E =======================================


EnableDisplayAndInts:				  ; CODE XREF: j_EnableDisplayAndIntsj
						  ; ROM:00008DB4p ...
		bsr.s	EnableDisplay
		bra.s	EnableInterrupts
; End of function EnableDisplayAndInts


; =============== S U B	R O U T	I N E =======================================


DisableDisplayAndInts:				  ; CODE XREF: j_DisableDisplayAndIntsj
						  ; ROM:loc_4CEp ...

; FUNCTION CHUNK AT 000008DC SIZE 0000000A BYTES

		bsr.s	DisableInterrupts
		bra.s	DisableDisplay
; End of function DisableDisplayAndInts


; =============== S U B	R O U T	I N E =======================================


DisableVDPSpriteUpdate:				  ; CODE XREF: j_DisableVDPSpriteUpdatej
						  ; ROM:00008DC2p
		bclr	#$01,(g_InterruptFlags).l
		rts
; End of function DisableVDPSpriteUpdate


; =============== S U B	R O U T	I N E =======================================


EnableVDPSpriteUpdate:				  ; CODE XREF: j_EnableVDPSpriteUpdatej
		bset	#$01,(g_InterruptFlags).l
		rts
; End of function EnableVDPSpriteUpdate


; =============== S U B	R O U T	I N E =======================================


CopyBasePalleteToActivePalette:			  ; CODE XREF: j_CopyBasePalleteToActivePalettej
						  ; ClearAndInitGraphics+6Ep ...
		movem.l	d7/a5-a6,-(sp)
		lea	(g_Pal0Base).l,a5
		lea	(g_Pal0Active).l,a6
		move.w	#$003F,d7

loc_922:					  ; CODE XREF: CopyBasePalleteToActivePalette+16j
		move.w	(a5)+,(a6)+
		dbf	d7,loc_922
		movem.l	(sp)+,d7/a5-a6
; End of function CopyBasePalleteToActivePalette


; =============== S U B	R O U T	I N E =======================================


QueueFullPaletteDMA:				  ; CODE XREF: j_QueueFullPaletteDMAj
						  ; DarkenPalette+1Cp ...
		movem.l	a6,-(sp)
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029400,(a6)+	  ; #15	- Auto-increment 2, #20	- DMA Len hi 0
		move.l	#$93409687,(a6)+	  ; #19	- DMA Len lo 0x40, #22 - DMA source mid	0x87
		move.l	#$9568977F,(a6)+	  ; #21	- DMA source low 0x68, #23 - DMA source	hi 0x7F
		move.l	#$C0000080,(a6)+	  ; DMA	Dest - CRAM
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		movem.l	(sp)+,a6		  ; DMA	Transfer 128 bytes from	address	0xFF0ED0
		rts
; End of function QueueFullPaletteDMA


; =============== S U B	R O U T	I N E =======================================


LoadPaletteToRAM:				  ; CODE XREF: j_LoadPaletteToRAMj
		lea	(g_Pal0Base).l,a1
; End of function LoadPaletteToRAM


; =============== S U B	R O U T	I N E =======================================


CopyPalette:					  ; CODE XREF: j_CopyPalettej
						  ; InitInvDisplay+1Ep
		move.w	#$000F,d0
; End of function CopyPalette


; =============== S U B	R O U T	I N E =======================================


WordCopy:					  ; CODE XREF: ROM:00000332j
						  ; WordCopy+2j ...
		move.w	(a0)+,(a1)+
		dbf	d0,WordCopy
		rts
; End of function WordCopy


; =============== S U B	R O U T	I N E =======================================


InitFadeFromBlackParams:			  ; CODE XREF: j_InitFadeFromBlackParamsj
						  ; FadeFromBlackp ...
		move.w	#$0C00,(g_PaletteDarkenCurrentBrightness).l
		move.w	#-$0200,(g_PaletteDarkenExtent).l
		clr.w	(g_PaletteDarkenTargetBrightness).l
		rts
; End of function InitFadeFromBlackParams


; =============== S U B	R O U T	I N E =======================================


FadeFromBlack:					  ; CODE XREF: j_FadeFromBlackj
						  ; ROM:00008DF0j
		bsr.s	InitFadeFromBlackParams
		bra.w	DoChangePaletteBrightness
; End of function FadeFromBlack


; =============== S U B	R O U T	I N E =======================================


InitFadeToBlackParams:				  ; CODE XREF: j_InitFadeToBlackParamsj
						  ; FadeToBlackp ...
		move.w	#$0200,(g_PaletteDarkenCurrentBrightness).l
		move.w	#$0200,(g_PaletteDarkenExtent).l
		clr.w	(g_PaletteDarkenTargetBrightness).l
		rts
; End of function InitFadeToBlackParams


; =============== S U B	R O U T	I N E =======================================


FadeToBlack:					  ; CODE XREF: j_FadeToBlackj
						  ; ROM:000004E4p
		bsr.s	InitFadeToBlackParams

DoChangePaletteBrightness:			  ; CODE XREF: FadeFromBlack+2j
		move.w	#$0006,d6

loc_9AE:					  ; CODE XREF: FadeToBlack+10j
		bsr.s	DarkenActivePalette
		move.w	#$0001,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames
		dbf	d6,loc_9AE
		rts
; End of function FadeToBlack


; =============== S U B	R O U T	I N E =======================================


DarkenActivePalette:				  ; CODE XREF: ROM:00000374j
						  ; FadeToBlack:loc_9AEp
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		move.w	#$003F,d5
; End of function DarkenActivePalette


; =============== S U B	R O U T	I N E =======================================


DarkenPalette:					  ; CODE XREF: j_DarkenPalettej
						  ; FadeInFromDarkness+2Ap ...
		move.w	(g_PaletteDarkenCurrentBrightness).l,d3
		move.w	(g_PaletteDarkenExtent).l,d4
		move.w	(g_PaletteDarkenTargetBrightness).l,d7

loc_9E0:					  ; CODE XREF: DarkenPalette+18j
		move.w	(a0)+,d0
		bsr.s	DarkenColour
		move.w	d0,(a1)+
		dbf	d5,loc_9E0
		bsr.w	QueueFullPaletteDMA
		bsr.w	EnableDMAQueueProcessing
		add.w	d4,d3
		move.w	d3,(g_PaletteDarkenCurrentBrightness).l
		rts
; End of function DarkenPalette


; =============== S U B	R O U T	I N E =======================================


DarkenColour:					  ; CODE XREF: DarkenPalette+14p
						  ; sub_E7AA+24p
		move.w	d0,d1
		andi.w	#$0E00,d1
		sub.w	d3,d1
		andi.w	#$1E00,d1
		cmpi.w	#$1000,d1
		bcs.s	loc_A10
		move.w	d7,d1

loc_A10:					  ; CODE XREF: DarkenColour+10j
		lsr.w	#$04,d3
		move.w	d0,d2
		andi.w	#$00E0,d2
		sub.w	d3,d2
		andi.w	#$01E0,d2
		cmpi.w	#$0100,d2
		bcs.s	loc_A26
		move.w	d7,d2

loc_A26:					  ; CODE XREF: DarkenColour+26j
		lsr.w	#$04,d3
		andi.w	#$000E,d0
		sub.w	d3,d0
		andi.w	#$001E,d0
		cmpi.w	#$0010,d0
		bcs.s	loc_A3A
		move.w	d7,d0

loc_A3A:					  ; CODE XREF: DarkenColour+3Aj
		lsl.w	#$08,d3
		or.w	d2,d0
		or.w	d1,d0
		rts
; End of function DarkenColour


; =============== S U B	R O U T	I N E =======================================


FadeFromWhite:					  ; CODE XREF: j_FadeFromWhitej
		move.w	#$0C00,d3
		move.w	#-$0200,d4
		move.w	#$0E00,d7
		bra.w	DoWhiteFade
; ---------------------------------------------------------------------------

FadeToWhite:					  ; CODE XREF: j_FadeToWhitej
		move.w	#$0200,d3
		move.w	#$0200,d4
		move.w	#$0E00,d7

DoWhiteFade:					  ; CODE XREF: FadeFromWhite+Cj
		move.w	#$0006,d6

loc_A62:					  ; CODE XREF: FadeFromWhite+4Cj
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		move.w	#$003F,d5

loc_A72:					  ; CODE XREF: FadeFromWhite+36j
		move.w	(a0)+,d0
		bsr.s	BrightenColour
		move.w	d0,(a1)+
		dbf	d5,loc_A72
		bsr.w	QueueFullPaletteDMA
		bsr.w	EnableDMAQueueProcessing
		move.w	#$0004,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames
		add.w	d4,d3
		dbf	d6,loc_A62
		rts
; End of function FadeFromWhite


; =============== S U B	R O U T	I N E =======================================


BrightenColour:					  ; CODE XREF: FadeFromWhite+32p
						  ; sub_E8A8+34p
		move.w	d0,d1
		andi.w	#$0E00,d1
		add.w	d3,d1
		andi.w	#$1E00,d1
		cmpi.w	#$1000,d1
		bcs.s	loc_AA8
		move.w	d7,d1

loc_AA8:					  ; CODE XREF: BrightenColour+10j
		lsr.w	#$04,d3
		lsr.w	#$04,d7
		move.w	d0,d2
		andi.w	#$00E0,d2
		add.w	d3,d2
		andi.w	#$01E0,d2
		cmpi.w	#$0100,d2
		bcs.s	loc_AC0
		move.w	d7,d2

loc_AC0:					  ; CODE XREF: BrightenColour+28j
		lsr.w	#$04,d3
		lsr.w	#$04,d7
		andi.w	#$000E,d0
		add.w	d3,d0
		andi.w	#$001E,d0
		cmpi.w	#$0010,d0
		bcs.s	loc_AD6
		move.w	d7,d0

loc_AD6:					  ; CODE XREF: BrightenColour+3Ej
		lsl.w	#$08,d3
		lsl.w	#$08,d7
		or.w	d2,d0
		or.w	d1,d0
		rts
; End of function BrightenColour


; =============== S U B	R O U T	I N E =======================================


ClearAndRefreshVDPSpriteTableDMA:		  ; CODE XREF: j_CopyVDPSpriteTableDMAj
						  ; LoadGame+Cp ...
		bsr.s	ClearScrollPlanes
		bsr.s	ClearVDPSpriteTable

UpdateVDPSpriteTableDMA:			  ; CODE XREF: ROM:0000026Cj
						  ; RefreshVDPSpriteTable+Ap
		lea	(VDP_CTRL_REG).l,a6
		move.w	#$8134,(a6)		  ; #1 - Enable	display, HInt, HV counters
		move.l	#$94019340,(a6)		  ; #20	- DMA Len hi 0x01, #19 - DMA Len lo 0x40
						  ; DMA	LENGTH = 0x140
		move.l	#$968295A8,(a6)		  ; #22	- DMA Src Mid 0x82, #21	DMA Src	Lo 0xA8
		move.l	#$977F5400,(a6)		  ; #23	- DMA Src Hi 0x7F, DMA Dest Lo = 0x1400
						  ; DMA	SRC ADDRESS = 0xFF0550 = VDP Sprite Table
		move.w	#$0083,(g_DMADestHi).l	  ; DMA	Dest Hi	= 0x03
						  ; DMA	DEST ADDRESS = VRAM 0xD400 = Sprite table base
		move.w	(g_DMADestHi).l,(a6)
		move.w	(g_VDPReg01_ModeSet2).l,(a6)
		rts
; End of function ClearAndRefreshVDPSpriteTableDMA


; =============== S U B	R O U T	I N E =======================================


ClearVDPSpriteTable:				  ; CODE XREF: j_ClearVDPSpriteTablej
						  ; ClearAndInitGraphics+62p ...
		movem.l	d0-d1/a0,-(sp)
		lea	(g_VDPSpr00_Y).l,a0
		moveq	#$0000004F,d1
		moveq	#$00000001,d0

loc_B24:					  ; CODE XREF: ClearVDPSpriteTable+14j
		move.l	d0,(a0)+
		clr.l	(a0)+
		addq.b	#$01,d0
		dbf	d1,loc_B24
		clr.b	-$00000005(a0)
		movem.l	(sp)+,d0-d1/a0
		rts
; End of function ClearVDPSpriteTable


; =============== S U B	R O U T	I N E =======================================


ClearScrollPlanes:				  ; CODE XREF: ROM:00000260j
						  ; ClearAndRefreshVDPSpriteTableDMAp ...
		movem.l	d7/a6,-(sp)
		move.w	#$C000,d0
		move.w	#$0FFF,d1
		clr.w	d2
		bsr.w	DoDMAFill		  ; d0 - Fill destination address VDP
						  ; d1 - Fill length bytes
						  ; d2 - Fill pattern
		move.w	#$E000,d0
		move.w	#$0FFF,d1
		clr.w	d2
		bsr.w	DoDMAFill		  ; d0 - Fill destination address VDP
						  ; d1 - Fill length bytes
						  ; d2 - Fill pattern
		movem.l	(sp)+,d7/a6
		rts
; End of function ClearScrollPlanes


; =============== S U B	R O U T	I N E =======================================


WaitUntilVBlank:				  ; CODE XREF: j_WaitUntilVBlankj
						  ; WaitUntilZ80Ready:loc_824p	...
		bsr.w	Return
		bsr.w	UpdateFridayAnimation
		bset	#$07,(g_InterruptFlags).l

loc_B6E:					  ; CODE XREF: WaitUntilVBlank+18j
		btst	#$07,(g_InterruptFlags).l
		bne.s	loc_B6E
		rts
; End of function WaitUntilVBlank


; =============== S U B	R O U T	I N E =======================================

; Sleeps for d0	frames

Sleep:						  ; CODE XREF: j_Sleepj
						  ; ROM:000004CAp ...
		movem.w	d0,-(sp)

loc_B7E:					  ; CODE XREF: Sleep+6j
		bsr.s	WaitUntilVBlank
		dbf	d0,loc_B7E
		movem.w	(sp)+,d0
		rts
; End of function Sleep


; =============== S U B	R O U T	I N E =======================================


EnableVRAMCopyQueueProcessing:			  ; CODE XREF: j_EnableProcessingOfVRAMCopyQueuej
						  ; ROM:FlushVRAMCopyQueuep ...
		bset	#$00,(g_InterruptFlags).l
		rts
; End of function EnableVRAMCopyQueueProcessing

; ---------------------------------------------------------------------------

FlushVRAMCopyQueue:				  ; CODE XREF: ROM:0000029Cj
						  ; ROM:00000CF8j
		bsr.s	EnableVRAMCopyQueueProcessing
		bra.w	WaitUntilVBlank

; =============== S U B	R O U T	I N E =======================================


EnableDMAQueueProcessing:			  ; CODE XREF: j_EnableDMAQueueProcessingj
						  ; ClearAndInitGraphics+72p ...
		bset	#$03,(g_InterruptFlags).l
		rts
; End of function EnableDMAQueueProcessing


; =============== S U B	R O U T	I N E =======================================


FlushDMACopyQueue:				  ; CODE XREF: j_FlushDMACopyQueuej
						  ; LoadRoom_0+50p ...
		bsr.s	EnableDMAQueueProcessing
		bra.w	WaitUntilVBlank
; End of function FlushDMACopyQueue


; =============== S U B	R O U T	I N E =======================================


sub_BAA:					  ; CODE XREF: ROM:0000027Ej
		movem.l	d7/a4-a5,-(sp)
		movea.l	(g_VRAMCopyQueuePtr).l,a4
		moveq	#$00000000,d7
		move.w	d7,(a4)+
		bsr.s	sub_BF6
		move.w	a6,(a4)+

loc_BBC:					  ; CODE XREF: ROM:00000BF4j
		move.w	d0,(a4)+
		move.l	a4,(g_VRAMCopyQueuePtr).l
		move.b	#$01,(g_VRAMCopyQueueLen).l
		clr.l	d7
		move.w	a6,d7
		ori.l	#RAM_Start,d7
		movea.l	d7,a6
		move.w	d0,(a6)
		movem.l	(sp)+,d7/a4-a5
		rts
; End of function sub_BAA

; ---------------------------------------------------------------------------

loc_BE0:					  ; CODE XREF: ROM:00000284j
		movem.l	d7/a4-a5,-(sp)
		movea.l	(g_VRAMCopyQueuePtr).l,a4
		moveq	#$00000000,d7
		move.w	d7,(a4)+		  ; Single word	copy
		bsr.s	sub_BF6
		bsr.s	sub_C66
		move.w	a6,(a4)+
		bra.s	loc_BBC

; =============== S U B	R O U T	I N E =======================================


sub_BF6:					  ; CODE XREF: ROM:0000028Aj
						  ; sub_BAA+Ep	...
		movem.l	d5-d7,-(sp)
		lea	($0000E000).l,a6	  ; 0xE000 - Scroll B data
		lsl.w	#$01,d5
		move.w	(g_HorizontalScrollData+2).l,d7
		lsr.w	#$02,d7
		add.w	d7,d5
		andi.w	#$003E,d5
		lsl.w	#$06,d6
		move.w	(g_VSRAMData+2).l,d7
		lsl.w	#$03,d7
		add.w	d7,d6
		andi.w	#$07C0,d6
		or.w	d6,d5
		adda.w	d5,a6
		bsr.s	sub_C66
		movem.l	(sp)+,d5-d6
		movem.l	d5-d6,-(sp)
		adda.l	#$0000C000,a6
		lsl.w	#$01,d5
		move.w	(g_HorizontalScrollData).l,d7
		lsr.w	#$02,d7
		add.w	d7,d5
		andi.w	#$003E,d5
		lsl.w	#$06,d6
		move.w	(g_VSRAMData).l,d7
		lsl.w	#$03,d7
		add.w	d7,d6
		andi.w	#$07C0,d6
		or.w	d6,d5
		adda.w	d5,a6
		movem.l	(sp)+,d5-d7
		andi.w	#$003E,d5
		andi.w	#$07C0,d6
		rts
; End of function sub_BF6


; =============== S U B	R O U T	I N E =======================================


sub_C66:					  ; CODE XREF: ROM:00000BF0p
						  ; sub_BF6+2Ep ...
		movem.l	d7,-(sp)
		move.l	a6,d7
		swap	d7
		movea.l	d7,a6
		movem.l	(sp)+,d7
		rts
; End of function sub_C66

; ---------------------------------------------------------------------------

loc_C76:					  ; CODE XREF: ROM:000002AEj
		lea	(g_Buffer).l,a4

loc_C7C:					  ; CODE XREF: ROM:000002BAj
		movem.l	d5-d6,-(sp)
		move.w	(word_FF0FAC).l,d5
		lsr.w	#$08,d5
		move.w	(word_FF0FAC).l,d6
		andi.w	#$00FF,d6
		bsr.w	sub_BF6
		movem.l	(sp)+,d5-d6

loc_C9A:					  ; CODE XREF: ROM:00000D1Ej
		movem.l	d3-d4/a3-a6,-(sp)
		clr.l	d3
		move.w	a6,d3
		ori.l	#RAM_Start,d3
		movea.l	d3,a3
		movea.l	(g_VRAMCopyQueuePtr).l,a5
		move.w	(word_FF0FAE).l,d3
		andi.l	#$000000FF,d3
		move.b	d3,(g_VRAMCopyQueueLen).l
		subq.w	#$01,d3

loc_CC4:					  ; CODE XREF: ROM:00000CF0j
		movem.l	a3,-(sp)
		move.w	(word_FF0FAE).l,d4
		andi.l	#$0000FF00,d4
		lsr.w	#$08,d4
		subq.w	#$01,d4
		move.w	d4,(a5)+
		move.w	a6,(a5)+

loc_CDC:					  ; CODE XREF: ROM:00000CE0j
		move.w	(a4),(a5)+
		move.w	(a4)+,(a3)+
		dbf	d4,loc_CDC
		adda.w	#$0040,a6
		movem.l	(sp)+,a3
		adda.w	#$0040,a3
		dbf	d3,loc_CC4
		movem.l	(sp)+,d3-d4/a3-a6
		bra.w	FlushVRAMCopyQueue
; ---------------------------------------------------------------------------

loc_CFC:					  ; CODE XREF: ROM:000002B4j
		movem.l	d5-d6,-(sp)
		move.w	(word_FF0FAC).l,d5
		lsr.w	#$08,d5
		move.w	(word_FF0FAC).l,d6
		andi.w	#$00FF,d6
		bsr.w	sub_BF6
		movem.l	(sp)+,d5-d6
		bsr.w	sub_C66
		bra.w	loc_C9A

; =============== S U B	R O U T	I N E =======================================

; d0 = DMA Length
; a0 = DMA Source
; a1 = DMA Destination

DoDMACopy:					  ; CODE XREF: j_DoDMACopy_1j
						  ; GetTileset+5Cp ...
		movem.l	d2/d7,-(sp)
		move	sr,-(sp)
		move	#$2700,sr		  ; Disable interrupts

loc_D2C:					  ; CODE XREF: DoDMACopy+A8j
		movem.l	d0/a0-a1/a6,-(sp)
		lea	(VDP_CTRL_REG).l,a6	  ; VDP	Control
		move.w	(g_VDPReg01_ModeSet2).l,d7
		ori.b	#$10,d7			  ; SET	Enable DMA bit
		move.w	d7,(a6)
		move.l	#$94009300,d2		  ; 94:	DMA Count Hi
						  ; 93:	DMA Count Lo
		move.b	d0,d2			  ; OR with d0 - prepare DMA count
		lsl.l	#$08,d0
		andi.l	#$00FF0000,d0
		or.l	d0,d2
		move.l	d2,(a6)
		move.l	#$96009500,d2		  ; 96:	DMA Source Mid
						  ; 95:	DMA Source Lo
		move.l	a0,d0			  ; a0 - DMA Source Address
		lsr.l	#$01,d0
		move.b	d0,d2
		lsl.l	#$08,d0
		andi.l	#$00FF0000,d0
		or.l	d0,d2
		move.l	d2,(a6)
		move.l	a0,d0
		swap	d0
		lsr.w	#$01,d0
		ori.w	#$9700,d0		  ; 97:	DMA Source Hi
		move.w	d0,(a6)
		move.w	a1,d0			  ; a1:	DMA Destination
		andi.w	#$3FFF,d0
		ori.w	#$4000,d0		  ; 40:	DMA Destination	Lo
		move.w	d0,(a6)
		move.w	a1,d0
		rol.w	#$02,d0
		andi.w	#$0003,d0
		ori.b	#$80,d0
		move.w	d0,(g_DMADestHi).l
		move.w	(g_DMADestHi).l,(a6)	  ; 00:	Destination Hi
		move.w	(g_VDPReg01_ModeSet2).l,(a6)
		movem.l	(sp)+,d0/a0-a1/a6
		clr.l	d2
		move.w	d0,d2
		add.w	d2,d2
		move.l	a0,d7
		swap	d7
		adda.l	d2,a0
		adda.w	d2,a1
		move.l	a0,d2
		swap	d2
		cmp.b	d2,d7
		beq.s	loc_DCE
		swap	d2
		suba.w	d2,a1
		lsr.w	#$01,d2
		move.w	d2,d0
		clr.w	d2
		movea.l	d2,a0
		bra.w	loc_D2C
; ---------------------------------------------------------------------------

loc_DCE:					  ; CODE XREF: DoDMACopy+9Aj
		move	(sp)+,sr
		movem.l	(sp)+,d2/d7
		rts
; End of function DoDMACopy


; =============== S U B	R O U T	I N E =======================================

; d0 - DMA Length
; a0 - DMA Source
; a1 - DMA Copy

QueueDMAOp:					  ; CODE XREF: j_QueueDMAOpj
						  ; ROM:j_QueueDMAOp_0j ...
		movem.l	d2/d7,-(sp)

loc_DDA:					  ; CODE XREF: QueueDMAOp+84j
		movem.l	d0/a0-a1/a6,-(sp)
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.w	#$8F02,(a6)+
		move.l	#$94009300,(a6)+	  ; DMA	LENGTH (Regs #19 and #20)
		movep.w	d0,-$0003(a6)
		move.l	a0,d0
		lsr.l	#$01,d0
		move.l	#$96009500,(a6)+	  ; DMA	SOURCE ADDR LOW	(Regs #22 and #21)
		movep.w	d0,-$0003(a6)
		move.l	a0,d0
		swap	d0
		lsr.w	#$01,d0
		ori.w	#$9700,d0		  ; DMA	SOURCE ADDR HI (Reg #23)
		move.w	d0,(a6)+
		move.w	a1,d0
		andi.w	#$3FFF,d0
		ori.w	#$4000,d0
		move.w	d0,(a6)+
		move.w	a1,d0
		rol.w	#$02,d0
		andi.w	#$0003,d0
		ori.b	#$80,d0			  ; DMA	DEST ADDRESS
		move.w	d0,(a6)+
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		movem.l	(sp)+,d0/a0-a1/a6
		moveq	#$00000000,d2
		move.w	d0,d2
		add.w	d2,d2
		move.l	a0,d7
		swap	d7
		adda.l	d2,a0
		adda.w	d2,a1
		move.l	a0,d2
		swap	d2
		cmp.b	d2,d7
		beq.s	loc_E5E
		swap	d2
		suba.w	d2,a1
		lsr.w	#$01,d2
		beq.s	loc_E5E
		move.w	d2,d0
		clr.w	d2
		movea.l	d2,a0
		bra.w	loc_DDA
; ---------------------------------------------------------------------------

loc_E5E:					  ; CODE XREF: QueueDMAOp+74j
						  ; QueueDMAOp+7Cj
		movem.l	(sp)+,d2/d7
		rts
; End of function QueueDMAOp

; ---------------------------------------------------------------------------

SetVRAMAddressOnVDP:				  ; CODE XREF: ROM:00000290j
		movem.w	d7,-(sp)
		move.w	a6,d7
		andi.w	#$3FFF,d7
		ori.w	#$4000,d7
		move.w	d7,(VDP_CTRL_REG).l
		move.w	a6,d7
		lsr.w	#$08,d7
		lsr.w	#$06,d7
		move.w	d7,(VDP_CTRL_REG).l
		movem.w	(sp)+,d7
		rts

; =============== S U B	R O U T	I N E =======================================


QueueHScrollDMAUpdate:				  ; CODE XREF: j_QueueHScrollDMAUpdatej
						  ; ClearAndInitGraphics+66p ...
		movem.l	a6,-(sp)
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029402,(a6)+	  ; Auto-increment = 2,	DMA Len	Hi = 0x02
		move.l	#$93009680,(a6)+	  ; DMA	Length Lo = 0x00, DMA Source Mid = 0x80
						  ; DMA	LENGTH 0x200
		move.l	#$9580977F,(a6)+	  ; DMA	Source Lo = 0x80, DMA Source Hi	= 0x7F
						  ; DMA	SOURCE ADDR = 0xFF0100
		move.l	#$50000083,(a6)+	  ; DMA	Dest VRAM 0xD000 - HScroll Data
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		movem.l	(sp)+,a6
		rts
; End of function QueueHScrollDMAUpdate


; =============== S U B	R O U T	I N E =======================================


FillHScrollData:				  ; CODE XREF: j_FillHScrollDataj
						  ; InitScrollRegs+26p	...
		movem.l	d7/a6,-(sp)
		lea	(g_HorizontalScrollData).l,a6

loc_EC8:					  ; CODE XREF: FillHScrollDataOffset1+Aj
		move.w	#$00FF,d7

loc_ECC:					  ; CODE XREF: FillHScrollData+12j
		move.w	d6,(a6)+
		addq.w	#$02,a6
		dbf	d7,loc_ECC
		movem.l	(sp)+,d7/a6
		bra.s	QueueHScrollDMAUpdate
; End of function FillHScrollData


; =============== S U B	R O U T	I N E =======================================


FillHScrollDataOffset1:				  ; CODE XREF: j_FillHScrollDataOffset1j
						  ; CheckForMenuOpen+64p ...
		movem.l	d7/a6,-(sp)
		lea	((g_HorizontalScrollData+2)).l,a6
		bra.s	loc_EC8
; End of function FillHScrollDataOffset1


; =============== S U B	R O U T	I N E =======================================


QueueVSRAMUpdate:				  ; CODE XREF: j_QueueVSRAMUpdatej
						  ; ClearAndInitGraphics+6Ap ...
		movem.l	a6,-(sp)
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029400,(a6)+	  ; Auto-increment 2, DMA Len Hi 0
		move.l	#$93289682,(a6)+	  ; DMA	Len Lo 0x28, DMA Source	Mid 0x82
						  ; DMA	LENGTH 0x28
		move.l	#$9580977F,(a6)+	  ; DMA	Source Low 0x80, DMA Source Hi 0x7F
						  ; DMA	SOURCE 0xFF0500	= VSRAM	Table
		move.l	#$40000090,(a6)+	  ; DMA	DEST VSRAM 0x0000
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		movem.l	(sp)+,a6
		rts
; End of function QueueVSRAMUpdate


; =============== S U B	R O U T	I N E =======================================


FillVSRAM:					  ; CODE XREF: j_FillVSRAMj
						  ; InitScrollRegs+46p
		movem.l	d7/a6,-(sp)
		lea	(g_VSRAMData).l,a6

loc_F24:					  ; CODE XREF: FillVSRAMOffset1+Aj
		move.w	#$0013,d7

loc_F28:					  ; CODE XREF: FillVSRAM+12j
		move.w	d6,(a6)+
		addq.w	#$02,a6
		dbf	d7,loc_F28
		movem.l	(sp)+,d7/a6
		bra.s	QueueVSRAMUpdate
; End of function FillVSRAM


; =============== S U B	R O U T	I N E =======================================


FillVSRAMOffset1:				  ; CODE XREF: j_FillVSRAMOffset1j
						  ; CheckForMenuOpen+6Ap ...
		movem.l	d7/a6,-(sp)
		lea	((g_VSRAMData+2)).l,a6
		bra.s	loc_F24
; End of function FillVSRAMOffset1


; =============== S U B	R O U T	I N E =======================================

; d0 - Fill destination	address	VDP
; d1 - Fill length bytes
; d2 - Fill pattern

DoDMAFill:					  ; CODE XREF: j_DoDMAFillj
						  ; ResetVDPAndClearRAM+30p ...
		movem.l	d0-d3,-(sp)
		move.w	(g_VDPReg01_ModeSet2).l,d3
		ori.b	#$10,d3			  ; Enable DMA
		move.w	d3,(VDP_CTRL_REG).l
		move.w	#$8F01,(VDP_CTRL_REG).l	  ; Auto-increment 1
		movem.l	d1,-(sp)
		andi.w	#$00FF,d1
		ori.w	#$9300,d1		  ; DMA	Length Low
		move.w	d1,(VDP_CTRL_REG).l
		movem.l	(sp)+,d1
		lsr.w	#$08,d1
		ori.w	#$9400,d1		  ; DMA	Length Hi
		move.w	d1,(VDP_CTRL_REG).l
		move.w	#$9780,(VDP_CTRL_REG).l	  ; DMA	Source Hi = VRAM-FILL
		movem.l	d0,-(sp)
		andi.w	#$3FFF,d0
		ori.w	#$4000,d0
		move.w	d0,(VDP_CTRL_REG).l	  ; Fill dest low
		movem.l	(sp)+,d0
		rol.w	#$02,d0
		andi.w	#$0003,d0
		ori.w	#$0080,d0
		move.w	d0,(VDP_CTRL_REG).l	  ; Fill dest hi
		move.w	d2,(VDP_DATA_REG).l	  ; Fill pattern

loc_FB4:					  ; CODE XREF: DoDMAFill+7Cj
		move.w	(VDP_CTRL_REG).l,d0
		andi.w	#$0002,d0
		bne.s	loc_FB4			  ; Wait until DMA complete
		move.w	(g_VDPReg01_ModeSet2).l,d3
		move.w	d3,(VDP_CTRL_REG).l	  ; Disable DMA
		move.w	#$8F02,(VDP_CTRL_REG).l	  ; Set	auto-increment back to 2
		movem.l	(sp)+,d0-d3
		rts
; End of function DoDMAFill


; =============== S U B	R O U T	I N E =======================================


ConvertToBase10:				  ; CODE XREF: j_ConvertToBase10j
		movem.l	d5-d7/a5-a6,-(sp)
		lea	PowersOf10(pc),a5
		nop
		lea	(unk_FF0F92).l,a6
		moveq	#$00000009,d5

loc_FEC:					  ; CODE XREF: ConvertToBase10+1Ej
		clr.b	d6

loc_FEE:					  ; CODE XREF: ConvertToBase10+18j
		addq.w	#$01,d6
		sub.l	(a5),d7
		bcc.s	loc_FEE
		move.b	d6,(a6)+
		add.l	(a5)+,d7
		dbf	d5,loc_FEC
		lea	(unk_FF0F92).l,a6
		moveq	#$00000008,d6

loc_1004:					  ; CODE XREF: ConvertToBase10+34j
		cmpi.b	#$01,(a6)
		bne.w	loc_1012
		clr.b	(a6)+
		dbf	d6,loc_1004

loc_1012:					  ; CODE XREF: ConvertToBase10+2Ej
		movem.l	(sp)+,d5-d7/a5-a6
		rts
; End of function ConvertToBase10

; ---------------------------------------------------------------------------
PowersOf10:	dc.l 1000000000			  ; DATA XREF: ConvertToBase10+4t
		dc.l 0100000000
		dc.l 0010000000
		dc.l 0001000000
		dc.l 0000100000
		dc.l 0000010000
		dc.l 0000001000
		dc.l 0000000100
		dc.l 0000000010
		dc.l 0000000001

; =============== S U B	R O U T	I N E =======================================


UpdateControllerInputs:				  ; CODE XREF: j_UpdateControllerInputsj
						  ; ROM:WaitForButtonPushp ...
		movem.l	d5-d7/a5-a6,-(sp)
		move	sr,d5
		bsr.w	DisableInterrupts
		move.w	#$0100,(Z80_BUSREQ_REG0).l

loc_1052:					  ; CODE XREF: UpdateControllerInputs+1Aj
		btst	#$00,(Z80_BUSREQ_REG0).l
		bne.s	loc_1052
		bsr.s	ReadControllerInput
		move.w	#$0000,(Z80_BUSREQ_REG0).l
		move	d5,sr
		movem.l	(sp)+,d5-d7/a5-a6
		rts
; End of function UpdateControllerInputs


; =============== S U B	R O U T	I N E =======================================


ReadControllerInput:				  ; CODE XREF: UpdateControllerInputs+1Cp
		lea	(g_Controller1State).l,a5
		lea	(SEGA_CTRL1_DATA_REG).l,a6
		bsr.s	ReadControllerReg
		neg.b	d6
		add.w	d6,(g_RNG).l
		addq.w	#$02,a6
; End of function ReadControllerInput


; =============== S U B	R O U T	I N E =======================================


ReadControllerReg:				  ; CODE XREF: ReadControllerInput+Cp
		move.b	#$00,(a6)
		nop
		nop
		move.b	(a6),d6
		lsl.b	#$02,d6
		andi.b	#$C0,d6
		move.b	#$40,(a6)
		nop
		nop
		move.b	(a6),d7
		andi.b	#$3F,d7
		or.b	d7,d6
		add.w	d6,(g_RNG).l
		not.b	d6
		move.b	d6,(a5)+
		rts
; End of function ReadControllerReg

; ---------------------------------------------------------------------------

WaitForButtonPush:				  ; CODE XREF: ROM:00000344j
						  ; ROM:000010C2j
		bsr.s	UpdateControllerInputs
		andi.b	#CTRLBF_ANYBUTTON,(g_Controller1State).l
		bne.s	locret_10C4
		bsr.w	WaitUntilVBlank
		bra.s	WaitForButtonPush
; ---------------------------------------------------------------------------

locret_10C4:					  ; CODE XREF: ROM:000010BCj
		rts

; =============== S U B	R O U T	I N E =======================================


WaitForNextButtonPress:				  ; CODE XREF: j_WaitForNextButtonPressj
						  ; WaitForNextButtonPress+12j
		bsr.w	UpdateControllerInputs
		andi.b	#CTRLBF_ANYBUTTON,(g_Controller1State).l
		beq.s	loc_10DA
		bsr.w	WaitUntilVBlank
		bra.s	WaitForNextButtonPress
; ---------------------------------------------------------------------------

loc_10DA:					  ; CODE XREF: WaitForNextButtonPress+Cj
						  ; WaitForNextButtonPress+26j
		bsr.w	UpdateControllerInputs
		andi.b	#CTRLBF_ANYBUTTON,(g_Controller1State).l
		bne.s	locret_10EE
		bsr.w	WaitUntilVBlank
		bra.s	loc_10DA
; ---------------------------------------------------------------------------

locret_10EE:					  ; CODE XREF: WaitForNextButtonPress+20j
		rts
; End of function WaitForNextButtonPress

; ---------------------------------------------------------------------------

loc_10F0:					  ; CODE XREF: ROM:00000350j
		movem.l	d7,-(sp)
		bsr.w	UpdateControllerInputs
		move.b	(g_Controller1State).l,d7
		and.b	(byte_FF0F90).l,d7
		beq.s	loc_1124
		addq.b	#$01,(byte_FF0F91).l
		move.b	(byte_FF0F91).l,d7
		cmpi.b	#$0A,d7
		bcc.s	loc_1124
		clr.b	(g_Controller1State).l
		movem.l	(sp)+,d7
		rts
; ---------------------------------------------------------------------------

loc_1124:					  ; CODE XREF: ROM:00001104j
						  ; ROM:00001116j
		clr.b	(byte_FF0F90).l
		clr.b	(byte_FF0F91).l
		movem.l	(sp)+,d7
		rts
; ---------------------------------------------------------------------------

Wait1SecondOrUntilButtonPushed:			  ; CODE XREF: ROM:00000356j
		movem.l	d5,-(sp)
		moveq	#0000000059,d5
; START	OF FUNCTION CHUNK FOR Wait3SecondsOrUntilButtonPushed

loc_113C:					  ; CODE XREF: Wait3SecondsOrUntilButtonPushed-Aj
						  ; Wait3SecondsOrUntilButtonPushed+Aj
		bsr.w	UpdateControllerInputs
		andi.b	#CTRLBF_ANYBUTTON,(g_Controller1State).l
		bne.s	loc_1152
		bsr.w	WaitUntilVBlank
		dbf	d5,loc_113C

loc_1152:					  ; CODE XREF: Wait3SecondsOrUntilButtonPushed-10j
		movem.l	(sp)+,d5
		rts
; END OF FUNCTION CHUNK	FOR Wait3SecondsOrUntilButtonPushed

; =============== S U B	R O U T	I N E =======================================


Wait3SecondsOrUntilButtonPushed:		  ; CODE XREF: j_Wait3SecondsOrUntilButtonPushedj

; FUNCTION CHUNK AT 0000113C SIZE 0000001C BYTES

		movem.l	d5,-(sp)
		move.l	#0000000179,d5
		bra.s	loc_113C
; End of function Wait3SecondsOrUntilButtonPushed


; =============== S U B	R O U T	I N E =======================================


GenerateRandomNumber:				  ; CODE XREF: j_GenerateRandomNumberj
						  ; ROM:00008988p ...
		move.w	(g_RNG).l,d7
		mulu.w	#$000D,d7
		addi.w	#$0007,d7
		andi.l	#$0000FFFF,d7
		move.w	d7,(g_RNG).l
		mulu.w	d6,d7
		swap	d7
		rts
; End of function GenerateRandomNumber


; =============== S U B	R O U T	I N E =======================================


HandleHBlankInterrupt:				  ; DATA XREF: ROM:HBlank_Interrupto
		bsr.w	DisableInterrupts
		cmpi.w	#$8AA0,(g_VDPReg10_HIntLine).l ; HINT on Line 160
		beq.s	loc_11D0
		movem.l	d0-a6,-(sp)
		move.b	(VDP_HVCTR_REG).l,d0

loc_119C:					  ; CODE XREF: HandleHBlankInterrupt+1Ej
		cmp.b	(VDP_HVCTR_REG).l,d0
		beq.s	loc_119C
		move.w	#$8124,(VDP_CTRL_REG).l
		move.w	#$8124,(g_VDPReg01_ModeSet2).l
		bsr.w	sub_2686

loc_11B8:					  ; CODE XREF: HandleHBlankInterrupt+58j
		btst	#$07,(g_InterruptFlags).l
		beq.s	loc_11C6
		bsr.w	ProcessQueuedVDPActions

loc_11C6:					  ; CODE XREF: HandleHBlankInterrupt+3Cj
		bsr.w	EnableInterrupts
		movem.l	(sp)+,d0-a6
		rte
; ---------------------------------------------------------------------------

loc_11D0:					  ; CODE XREF: HandleHBlankInterrupt+Cj
		movem.l	d0-a6,-(sp)
		move.w	#$921C,(VDP_CTRL_REG).l	  ; WINDOW 28 CELLS UP (Fullscreen)
		bra.s	loc_11B8
; End of function HandleHBlankInterrupt


; =============== S U B	R O U T	I N E =======================================


HandleVBlankInterrupt:				  ; DATA XREF: ROM:VBlank_Interrupto
		movem.l	d0-a6,-(sp)
		bclr	#$07,(g_InterruptFlags).l
		beq.s	loc_11F6
		bsr.w	DisableDisplay_0
		bsr.w	RefreshVDPSpriteTable
		bsr.s	ProcessQueuedVDPActions

loc_11F6:					  ; CODE XREF: HandleVBlankInterrupt+Cj
		bsr.w	EnableDisplay
		addq.w	#$01,(unk_FF0F9C).l
		addq.w	#$01,(g_RNG).l
		move.w	(g_VDPReg18_WindowVPos).l,(VDP_CTRL_REG).l
		bsr.w	sub_13B6
		addq.w	#$01,(g_FrameCount).l
		cmpi.w	#03600,(g_FrameCount).l
		bcs.s	loc_1246
		clr.w	(g_FrameCount).l
		addq.w	#$01,(g_MinuteCount).l
		cmpi.w	#00060,(g_MinuteCount).l
		bcs.s	loc_1246
		clr.w	(g_MinuteCount).l
		addq.w	#$01,(g_HourCount).l

loc_1246:					  ; CODE XREF: HandleVBlankInterrupt+44j
						  ; HandleVBlankInterrupt+5Aj
		movem.l	(sp)+,d0-a6
		rte
; End of function HandleVBlankInterrupt


; =============== S U B	R O U T	I N E =======================================


DisableDisplay_0:				  ; CODE XREF: HandleVBlankInterrupt+Ep
		andi.b	#$BF,(g_VDPReg01_ModeSet2+1).l
		move.w	(g_VDPReg01_ModeSet2).l,(VDP_CTRL_REG).l
		rts
; End of function DisableDisplay_0


; =============== S U B	R O U T	I N E =======================================


ProcessQueuedVDPActions:			  ; CODE XREF: HandleHBlankInterrupt+3Ep
						  ; HandleVBlankInterrupt+16p
		bsr.s	ProcessVRAMCopyQueue
		bsr.w	ProcessVRAMReadOp
		bsr.w	ProcessQueuedDMAOps
		rts
; End of function ProcessQueuedVDPActions


; =============== S U B	R O U T	I N E =======================================


ProcessVRAMCopyQueue:				  ; CODE XREF: ProcessQueuedVDPActionsp
		bclr	#$00,(g_InterruptFlags).l
		beq.w	locret_12EE
		tst.b	(g_VRAMCopyQueueLen).l
		beq.w	locret_12EE
		lea	(g_VRAMCopyQueue).l,a0

loc_1288:					  ; CODE XREF: ProcessVRAMCopyQueue+6Ej
		move.w	(a0)+,d0		  ; First word - Copy length + Auto Increment
						  ; BIT	15 Clear = AutoIncrement 2
						  ; BIT	14 Clear = AutoIncrement 0x40
						  ; Bit	14 Set	 = AutoIncrement 0x80
						  ; Remainder	 = Copy	length - 1
		move.w	#$8F02,d1		  ; Reg	#15 - Auto-increment 2
		bclr	#$0F,d0
		beq.s	loc_12A2		  ; Set	auto-increment on VDP
		move.w	#$8F40,d1		  ; Reg	#15 - Auto increment 0x40
		bclr	#$0E,d0
		beq.s	loc_12A2		  ; Set	auto-increment on VDP
		move.w	#$8F80,d1		  ; Reg	#15 - Auto increment 0x80

loc_12A2:					  ; CODE XREF: ProcessVRAMCopyQueue+26j
						  ; ProcessVRAMCopyQueue+30j
		move.w	d1,(VDP_CTRL_REG).l	  ; Set	auto-increment on VDP
		move.w	(a0)+,d2		  ; Second word	- VRAM Write address
		move.w	d2,d1
		andi.w	#$3FFF,d2
		ori.w	#$4000,d2		  ; Set	VRAM WRITE address
		move.w	d2,(VDP_CTRL_REG).l
		clr.w	d2
		lsl.w	#$01,d1
		roxl.w	#$01,d2
		lsl.w	#$01,d1
		roxl.w	#$01,d2
		move.w	d2,(VDP_CTRL_REG).l	  ; Copy VRAM High address

loc_12CA:					  ; CODE XREF: ProcessVRAMCopyQueue+64j
		move.w	(a0)+,(VDP_DATA_REG).l	  ; Third+ word	- VRAM Data
		dbf	d0,loc_12CA		  ; Copy in VDP	data
		subq.b	#$01,(g_VRAMCopyQueueLen).l
		bne.s	loc_1288		  ; First word - Copy length + Auto Increment
						  ; BIT	15 Clear = AutoIncrement 2
						  ; BIT	14 Clear = AutoIncrement 0x40
						  ; Bit	14 Set	 = AutoIncrement 0x80
						  ; Remainder	 = Copy	length - 1
		move.w	#$8F02,(VDP_CTRL_REG).l	  ; Reset auto-increment value to 2
		move.l	#g_VRAMCopyQueue,(g_VRAMCopyQueuePtr).l

locret_12EE:					  ; CODE XREF: ProcessVRAMCopyQueue+8j
						  ; ProcessVRAMCopyQueue+12j
		rts
; End of function ProcessVRAMCopyQueue


; =============== S U B	R O U T	I N E =======================================


ProcessVRAMReadOp:				  ; CODE XREF: ProcessQueuedVDPActions+2p
		bclr	#$04,(g_InterruptFlags).l
		beq.s	locret_132E
		lea	(g_VRAMCopyQueue).l,a0
		move.w	#$8F02,(VDP_CTRL_REG).l	  ; Set	auto-increment to 2
		move.w	(a0),d7
		andi.w	#$3FFF,d7
		move.w	d7,(VDP_CTRL_REG).l
		move.w	(a0)+,d7
		rol.w	#$02,d7
		andi.w	#$0003,d7
		move.w	d7,(VDP_CTRL_REG).l
		move.w	(a0)+,d7

loc_1324:					  ; CODE XREF: ProcessVRAMReadOp+3Aj
		move.w	(VDP_DATA_REG).l,(a0)+
		dbf	d7,loc_1324

locret_132E:					  ; CODE XREF: ProcessVRAMReadOp+8j
		rts
; End of function ProcessVRAMReadOp


; =============== S U B	R O U T	I N E =======================================


RefreshVDPSpriteTable:				  ; CODE XREF: HandleVBlankInterrupt+12p
		btst	#$01,(g_InterruptFlags).l
		bne.s	locret_133E
		bsr.w	UpdateVDPSpriteTableDMA

locret_133E:					  ; CODE XREF: RefreshVDPSpriteTable+8j
		rts
; End of function RefreshVDPSpriteTable


; =============== S U B	R O U T	I N E =======================================


ProcessQueuedDMAOps:				  ; CODE XREF: ProcessQueuedVDPActions+6p
		bclr	#$03,(g_InterruptFlags).l
		beq.s	locret_13B4
		tst.b	(g_NumQueuedDMAOps).l
		beq.s	locret_13B4
		move.w	#$0100,(Z80_BUSREQ_REG0).l

loc_135A:					  ; CODE XREF: ProcessQueuedDMAOps+22j
		btst	#$00,(Z80_BUSREQ_REG0).l
		bne.s	loc_135A
		lea	(g_DMAOpQueue).l,a0
		lea	(VDP_CTRL_REG).l,a6
		move.w	(g_VDPReg01_ModeSet2).l,d7
		ori.b	#$10,d7
		move.w	d7,(a6)

loc_137C:					  ; CODE XREF: ProcessQueuedDMAOps+56j
		move.l	(a0)+,(a6)
		move.l	(a0)+,(a6)
		move.l	(a0)+,(a6)
		move.w	(a0)+,(a6)
		move.w	(a0)+,(g_DMADestHi).l
		move.w	(g_DMADestHi).l,(a6)
		subq.b	#$01,(g_NumQueuedDMAOps).l
		bne.s	loc_137C
		move.w	(g_VDPReg01_ModeSet2).l,(a6)
		move.w	#$8F02,(a6)
		move.w	#$0000,(Z80_BUSREQ_REG0).l
		move.l	#g_DMAOpQueue,(g_DMAOpQueuePtr).l

locret_13B4:					  ; CODE XREF: ProcessQueuedDMAOps+8j
						  ; ProcessQueuedDMAOps+10j
		rts
; End of function ProcessQueuedDMAOps


; =============== S U B	R O U T	I N E =======================================


sub_13B6:					  ; CODE XREF: HandleVBlankInterrupt+32p
		move.w	#$0100,(Z80_BUSREQ_REG0).l

loc_13BE:					  ; CODE XREF: sub_13B6+10j
		btst	#$00,(Z80_BUSREQ_REG0).l
		bne.s	loc_13BE
		tst.b	(byte_FF0F7F).l
		beq.w	loc_13E2
		tst.b	(Z80_MEM+$1283).l
		beq.w	loc_14E6
		clr.b	(byte_FF0F7F).l

loc_13E2:					  ; CODE XREF: sub_13B6+18j
		lea	(unk_FF0FA0).l,a0
		move.l	0000000004(a0),d0
		or.l	(a0),d0
		beq.w	loc_14E6
		move.b	(a0),d1
		move.b	$00000001(a0),d0
		move.w	$00000002(a0),(a0)+
		move.w	$00000002(a0),(a0)+
		move.w	$00000002(a0),(a0)+
		clr.w	(a0)
		cmpi.b	#$FB,d0
		bne.s	loc_1440
		tst.b	(byte_FF0F80).l
		beq.s	loc_1432
		movem.l	d7-a0,-(sp)
		lea	(byte_FF0F81).l,a0
		moveq	#$00000008,d7

loc_1420:					  ; CODE XREF: sub_13B6+6Ej
		move.b	$00000001(a0),(a0)+
		dbf	d7,loc_1420
		movem.l	(sp)+,d7-a0
		subq.b	#$01,(byte_FF0F80).l

loc_1432:					  ; CODE XREF: sub_13B6+5Cj
		move.b	(byte_FF0F81).l,(Z80_MEM+$1FFF).l
		bra.w	loc_14E6
; ---------------------------------------------------------------------------

loc_1440:					  ; CODE XREF: sub_13B6+54j
		cmpi.b	#$FD,d0
		bcs.s	loc_1450
		move.b	d0,(Z80_MEM+$1FFF).l
		bra.w	loc_14E6
; ---------------------------------------------------------------------------

loc_1450:					  ; CODE XREF: sub_13B6+8Ej
		cmpi.b	#$F0,d0
		bne.s	loc_1462
		move.b	#$01,(byte_FF0F7F).l
		bra.w	loc_14E6
; ---------------------------------------------------------------------------

loc_1462:					  ; CODE XREF: sub_13B6+9Ej
		cmpi.b	#$FC,d0
		bne.s	loc_147C
		andi.b	#$0F,d1
		move.b	d1,(Z80_MEM+$1FFD).l
		move.b	d0,(Z80_MEM+$1FFF).l
		bra.w	loc_14E6
; ---------------------------------------------------------------------------

loc_147C:					  ; CODE XREF: sub_13B6+B0j
		movem.l	d0,-(sp)
		andi.b	#$7F,d0
		cmp.b	(byte_FF0F81).l,d0
		movem.l	(sp)+,d0
		bne.s	loc_1494
		bra.w	loc_14E6
; ---------------------------------------------------------------------------

loc_1494:					  ; CODE XREF: sub_13B6+D8j
		bclr	#$07,d0
		beq.s	loc_14A2
		move.b	d1,(Z80_MEM+$1FFC).l
		bra.s	loc_14B0
; ---------------------------------------------------------------------------

loc_14A2:					  ; CODE XREF: sub_13B6+E2j
		cmpi.b	#$40,d0
		bgt.s	loc_14B0
		move.b	#$0F,(Z80_MEM+$1FFC).l

loc_14B0:					  ; CODE XREF: sub_13B6+EAj
						  ; sub_13B6+F0j
		move.b	d0,(Z80_MEM+$1FFF).l
		cmpi.b	#$40,d0
		bge.s	loc_14E6
		movem.l	d7-a0,-(sp)
		lea	(g_InterruptFlags).l,a0
		moveq	#$00000008,d7

loc_14C8:					  ; CODE XREF: sub_13B6+116j
		move.b	-$00000002(a0),-(a0)
		dbf	d7,loc_14C8
		move.b	d0,-(a0)
		movem.l	(sp)+,d7-a0
		cmpi.b	#$0A,(byte_FF0F80).l
		bge.s	loc_14E6
		addq.b	#$01,(byte_FF0F80).l

loc_14E6:					  ; CODE XREF: sub_13B6+22j
						  ; sub_13B6+38j ...
		move.w	#$0000,(Z80_BUSREQ_REG0).l
		rts
; End of function sub_13B6


; =============== S U B	R O U T	I N E =======================================


nullsub_2:
		rts
; End of function nullsub_2

