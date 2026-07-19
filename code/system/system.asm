System	module
; Soft reset straight back to the Sega logo/title.
ResetAll:
		lea	(ResetSP).w,sp
		bra.s	_resetCommon

; End-of-game reset: fades the music out for three seconds first.
EndGame:
		lea	(ResetSP).w,sp
		trap	#$00			  ; Trap00Handler
		dc.w SND_FadeOut0
		move.w	#180,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames

_resetCommon:
		bsr.w	DisableDisplayAndInts
		bsr.s	ResetVDPAndClearRAM
		bsr.s	ClearAndInitGraphics
		jmp	(ResetGame).l

; Death: music fade + fade to black, then reload the last save.
GameOver:
		lea	(ResetSP).w,sp
		trap	#$00			  ; Trap00Handler
		dc.w SND_FadeOut0
		bsr.w	FadeToBlack
		move.w	#180,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames
		bsr.w	DisableDisplayAndInts
		bsr.s	ResetVDPAndClearRAM
		bsr.s	ClearAndInitGraphics
		jmp	(RestartFromSave).l

; Cold-boot tail: full hardware init, region protection check, SRAM
; check, then into the game.
_bootInit:
		bsr.s	ResetVDPAndClearRAM
		bsr.w	InitZ80Driver
		bsr.s	ClearAndInitGraphics
	if	REGION_CHECK
		jsr	(j_CheckRegion).l
	endif
		bsr.w	CheckSRAM
		jmp	(ResetGame).l


; Blanks the display, clears all RAM from the palettes up, then loads
; the full register set from the InitVDPRegs00 table (comments below)
; and DMA-fills VRAM with zero.
ResetVDPAndClearRAM:
		move.w	(InitVDPRegs01,pc),d0	  ; #01	- display off, VInt on,	DMA off
		nop
		bsr.w	SetVDPReg
		move.w	#$3FDE,d0
		lea	(g_Pal0Base).l,a0

_clrRam:
		clr.l	(a0)+
		dbf	d0,_clrRam
		lea	InitVDPRegs00(pc),a0	  ; Disable HInt, Enable HV Counters
		moveq	#$12,d1

_regLoop:
		move.w	(a0)+,d0
		bsr.w	SetVDPReg
		dbf	d1,_regLoop
		clr.w	d0
		clr.w	d1
		clr.w	d2
		bsr.w	DoDMAFill		  ; d0 - Fill destination address VDP
						  ; d1 - Fill length bytes
						  ; d2 - Fill pattern
		rts


ClearAndInitGraphics:
		move.l	#g_VRAMCopyQueue,(g_VRAMCopyQueuePtr).l
		move.l	#g_DMAOpQueue,(g_DMAOpQueuePtr).l
		moveq	#$40,d0
		move.b	d0,(SEGA_CTRL1_CTRL_REG).l
		move.b	d0,(SEGA_CTRL2_CTRL_REG).l
		move.b	d0,(SEGA_EXP_CTRL_REG).l
		lea	(g_HorizontalScrollData).l,a0
		move.w	#$00FF,d0

_clrHScroll:
		move.w	#$0000,(a0)+
		move.w	#$0000,(a0)+
		dbf	d0,_clrHScroll
		lea	(g_VSRAMData).l,a0
		move.w	#$0013,d0

_clrVSRAM:
		move.w	#$0000,(a0)+
		move.w	#$0000,(a0)+
		dbf	d0,_clrVSRAM
		lea	(g_Pal0Base).l,a0
		moveq	#$7F,d1

_clrPal:
		clr.w	(a0)+
		dbf	d1,_clrPal
		bsr.w	ClearVDPSpriteTable
		bsr.w	QueueHScrollDMAUpdate
		bsr.w	QueueVSRAMUpdate
		bsr.w	CopyBasePaletteToActivePalette
		bsr.w	EnableDMAQueueProcessing
		rts

InitVDPRegs00:	dc.w $8004			  ; #00	Disable	HInt, Enable HV	Counters
InitVDPRegs01:	dc.w $8124
		dc.w $8230			  ; #01	Disable	Display, Enable	VInt, Disable DMA, 28V cells
		dc.w $833C			  ; #02	ScrollA	Source 0xC000, #3 Window Source	0xF000
		dc.w $8407			  ; #04	ScrollB	Source 0xE000
		dc.w $856A			  ; #05	Sprite Table Source 0xD400
		dc.w $8600			  ; #06	Reserved 00
		dc.w $8700			  ; #07	Background Palette 0, Colour 0 (BLACK)
		dc.w $8800			  ; #08	Reserved 00
		dc.w $8900			  ; #09	Reserved 00
		dc.w $8A00			  ; #10	Horizontal Interrupt on	Line 0
		dc.w $8B07			  ; #11	Ext Interrupt Disabled,	Vertical 2-Cell	scroll,	Horizontal line	scroll
		dc.w $8C81			  ; #12	40 cell	horizontal, Shadow/HL disabled,	No Interlace
		dc.w $8D34			  ; #13	HScroll	Base Addr 0xD000
		dc.w $8E00			  ; #14	Reserved 00
		dc.w $8F02			  ; #15	Auto Increment 2
		dc.w $9001			  ; #16	Vertical 32 Cell, Horizontal 64	Cell
		dc.w $9100			  ; #17	Window Left 0 Cells
		dc.w $9200			  ; #18	Window Right 0 Cells

; Standard Sega startup shell, driven by the packed SystemInit block:
; on cold boot it satisfies TMSS, loads the VDP registers, copies a
; tiny Z80 stub, clears RAM/CRAM/VSRAM and silences the PSG. A warm
; reset (controller ports already initialised) skips all of it.
EntryPoint:
		tst.l	(SEGA_CTRL1_CTRL_REG0).l
		bne.s	_chkColdBoot
		tst.w	(SEGA_EXP_CTRL_REG0).l

_chkColdBoot:
		bne.s	_skipColdInit
		lea	SystemInit(pc),a5
		movem.w	(a5)+,d5-d7
		movem.l	(a5)+,a0-a4
		move.b	-$10FF(a1),d0
		andi.b	#$0F,d0
		beq.s	_tmssDone
		move.l	#'SEGA',$2F00(a1)

_tmssDone:
		move.w	(a4),d0
		moveq	#$00,d0
		movea.l	d0,a6
		move.l	a6,usp
		moveq	#$17,d1

_vdpRegLoop:
		move.b	(a5)+,d5
		move.w	d5,(a4)
		add.w	d7,d5
		dbf	d1,_vdpRegLoop
		move.l	(a5)+,(a4)
		move.w	d0,(a3)
		move.w	d7,(a1)
		move.w	d7,(a2)

_waitZ80Bus:
		btst	d0,(a1)
		bne.s	_waitZ80Bus
		moveq	#$25,d2

_z80CopyLoop:
		move.b	(a5)+,(a0)+
		dbf	d2,_z80CopyLoop
		move.w	d0,(a2)
		move.w	d0,(a1)
		move.w	d7,(a2)

_clrRamLoop:
		move.l	d0,-(a6)
		dbf	d6,_clrRamLoop
		move.l	(a5)+,(a4)
		move.l	(a5)+,(a4)
		moveq	#$1F,d3

_clrCRAMLoop:
		move.l	d0,(a3)
		dbf	d3,_clrCRAMLoop
		move.l	(a5)+,(a4)
		moveq	#$13,d4

_clrVSRAMLoop:
		move.l	d0,(a3)
		dbf	d4,_clrVSRAMLoop
		moveq	#$03,d5

_psgLoop:
		move.b	(a5)+,$11(a3)
		dbf	d5,_psgLoop
		move.w	d0,(a2)
		movem.l	(a6),d0-a6
		move	#$2700,sr

_skipColdInit:
		bra.s	_waitVDP
SystemInit:	dc.w $8000
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

_waitVDP:
		tst.w	(VDP_CTRL_REG).l

_waitDMALoop:
		move.w	(VDP_CTRL_REG).l,d0
		andi.w	#$0002,d0
		bne.s	_waitDMALoop
		bra.w	_bootInit


InitZ80Driver:
		movem.l	d0-a1,-(sp)
		move.w	#$0100,(Z80_BUSREQ_REG0).l
		move.w	#$0100,(Z80_RESET_REG0).l
		lea	(Z80_MEM).l,a0
		move.w	#$1F80,d7
		lea	(SoundDriver).l,a1

_copyDriverLoop:
		move.b	(a1)+,d0
		bsr.w	WriteAndVerifyReg
		dbf	d7,_copyDriverLoop
		move.w	#$0000,(Z80_RESET_REG0).l
		nop
		nop
		nop
		nop
		move.w	#$0100,(Z80_RESET_REG0).l
		move.w	#$0000,(Z80_BUSREQ_REG0).l
		movem.l	(sp)+,d0-a1
		rts

; Unreferenced leftover fragment.
		bsr.w	WriteAndVerifyReg
		lsr.w	#$08,d0


; Writes d0.b to (a0) until the Z80 memory latches it, then advances.
WriteAndVerifyReg:
		move.b	d0,(a0)
		cmp.b	(a0),d0
		bne.s	WriteAndVerifyReg
		addq.l	#$01,a0
		rts


; trap #0 - play sound: the word following the trap is the sound ID
; ($FFFF = use d0 instead), queued into the first free g_SoundQueue
; slot and sent to the driver by ProcessSoundQueue during VBlank.
Trap00Handler:
		movem.l	d0-d1/a0,-(sp)
		movea.l	$E(sp),a0
		move.w	(a0),d1
		addq.l	#$02,$E(sp)	  ; Get	sound effect ID	and advance PC
		cmpi.w	#$FFFF,d1		  ; FFFF - use d0 rather than hard coded value
		bne.s	_queueSound
		move.w	d0,d1

_queueSound:
		lea	(g_SoundQueue).l,a0
		moveq	#$03,d0

_findSlotLoop:
		tst.w	(a0)+
		dbeq	d0,_findSlotLoop
		move.w	d1,-2(a0)	  ; Queue sound	to be played
		movem.l	(sp)+,d0-d1/a0
		rte


; Exception handlers: stash a type tag and the faulting address, then
; hang in HandleUnexpectedInterrupt.
HandleAddressError:
		move.l	#'ADDR',(ExceptType).l
		move.l	$A(sp),(ExceptAddr).l
		bra.s	HandleUnexpectedInterrupt


HandleIllegalInst:
		move.l	#'BAD ',(ExceptType).l
		move.l	2(sp),(ExceptAddr).l
		bra.s	HandleUnexpectedInterrupt


HandleDiv0:
		move.l	#'ZERO',(ExceptType).l
		move.l	1(sp),(ExceptAddr).l
		bra.s	HandleUnexpectedInterrupt


HandleGenericError:
		move.l	#'OTHR',(ExceptType).l
		move.l	2(sp),(ExceptAddr).l
		bra.w	*+4

HandleUnexpectedInterrupt:
		nop
		nop
		bra.s	HandleUnexpectedInterrupt


HandleIRQ7:
		nop
		bra.s	HandleIRQ7


; trap #1 - run the text command word that follows the trap.
Trap01Handler:
		movem.l	d0/a0,-(sp)
		movea.l	$A(sp),a0
		move.w	(a0),d0
		addq.l	#$02,$A(sp)	  ; Retrieve data from code and	fix sp
		jsr	(j_RunTextCmd).l
		movem.l	(sp)+,d0/a0
		rte


; trap #2 - run a text command fetched from table a0, indexed by the
; word that follows the trap.
Trap02Handler:
		movem.l	d0/a1,-(sp)
		movea.l	$A(sp),a1
		move.w	(a1),d0
		move.w	(a0,d0.w),d0
		addq.l	#$02,$A(sp)
		jsr	(j_RunTextCmd).l
		movem.l	(sp)+,d0/a1
		rte


; Waits frame by frame until the sound driver's ready byte at Z80
; $1303 reads non-zero.
WaitUntilZ80Ready:
		movem.w	d0,-(sp)

_z80WaitFrame:
		bsr.w	WaitUntilVBlank
		move.w	#$0100,(Z80_BUSREQ_REG0).l

_z80BusLoop:
		btst	#$00,(Z80_BUSREQ_REG0).l
		bne.s	_z80BusLoop
		move.b	(Z80_MEM+$1303).l,d0
		move.w	#$0000,(Z80_BUSREQ_REG0).l
		tst.b	d0
		beq.s	_z80WaitFrame
		movem.w	(sp)+,d0
		rts


; Re-sends the current room's music (g_BGM) to the driver.
RestoreBGM:
		movem.w	d0,-(sp)
		bsr.s	WaitUntilZ80Ready
		move.b	(g_BGM).l,d0
		trap	#$00			  ; Trap00Handler
		dc.w SND_LoadFromD0
		movem.w	(sp)+,d0
		rts


; VDP register access goes through the shadow copy of all registers at
; g_VDPReg00_ModeSet1: Get/Set take a full $8rXX command word in d0,
; Or/Mask take a register number in d0 and an OR/AND mask in d1.
GetVDPReg:
		movem.l	a0,-(sp)
		lea	(g_VDPReg00_ModeSet1).l,a0
		add.w	d0,d0
		move.w	(a0,d0.w),d0
		movem.l	(sp)+,a0
		rts


SetVDPReg:
		movem.l	d0-d1/a0,-(sp)
		lea	(g_VDPReg00_ModeSet1).l,a0
		move.w	d0,(VDP_CTRL_REG).l
		move.w	d0,d1
		andi.w	#$7F00,d0
		lsr.w	#$07,d0
		move.w	d1,(a0,d0.w)
		movem.l	(sp)+,d0-d1/a0
		rts


OrVDPReg:
		movem.l	d0-d1/a0,-(sp)
		lea	(g_VDPReg00_ModeSet1).l,a0
		add.w	d0,d0
		or.b	d1,1(a0,d0.w)
		bra.s	_writeReg


MaskVDPReg:
		movem.l	d0-d1/a0,-(sp)
		lea	(g_VDPReg00_ModeSet1).l,a0
		add.w	d0,d0
		and.b	d1,1(a0,d0.w)

_writeReg:
		move.w	(a0,d0.w),d1
		move.w	d1,(VDP_CTRL_REG).l
		movem.l	(sp)+,d0-d1/a0
		rts


EnableDisplay:
		move.w	#$0001,d0
		move.w	#$0040,d1
		bra.s	OrVDPReg

DisableDisplay:
		move.w	#$0001,d0
		move.w	#$00BF,d1
		bra.s	MaskVDPReg


EnableInterrupts:
		move	#$2300,sr
		rts


DisableInterrupts:
		move	#$2700,sr
		rts


EnableDisplayAndInts:
		bsr.s	EnableDisplay
		bra.s	EnableInterrupts


DisableDisplayAndInts:
		bsr.s	DisableInterrupts
		bra.s	DisableDisplay


DisableVDPSpriteUpdate:
		bclr	#$01,(g_InterruptFlags).l
		rts


EnableVDPSpriteUpdate:
		bset	#$01,(g_InterruptFlags).l
		rts


; Copies all four base palettes to the active set, then falls through
; to queue the CRAM DMA.
CopyBasePaletteToActivePalette:
		movem.l	d7/a5-a6,-(sp)
		lea	(g_Pal0Base).l,a5
		lea	(g_Pal0Active).l,a6
		move.w	#$003F,d7

_copyPalLoop:
		move.w	(a5)+,(a6)+
		dbf	d7,_copyPalLoop
		movem.l	(sp)+,d7/a5-a6


QueueFullPaletteDMA:
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


LoadPaletteToRAM:
		lea	(g_Pal0Base).l,a1


CopyPalette:
		move.w	#$000F,d0


WordCopy:
		move.w	(a0)+,(a1)+
		dbf	d0,WordCopy
		rts


InitFadeFromBlackParams:
		move.w	#$0C00,(g_PaletteDarkenCurrentBrightness).l
		move.w	#-$0200,(g_PaletteDarkenExtent).l
		clr.w	(g_PaletteDarkenTargetBrightness).l
		rts


FadeFromBlack:
		bsr.s	InitFadeFromBlackParams
		bra.w	DoChangePaletteBrightness


InitFadeToBlackParams:
		move.w	#$0200,(g_PaletteDarkenCurrentBrightness).l
		move.w	#$0200,(g_PaletteDarkenExtent).l
		clr.w	(g_PaletteDarkenTargetBrightness).l
		rts


FadeToBlack:
		bsr.s	InitFadeToBlackParams

DoChangePaletteBrightness:
		move.w	#$0006,d6

_fadeStepLoop:
		bsr.s	DarkenActivePalette
		move.w	#$0001,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames
		dbf	d6,_fadeStepLoop
		rts


DarkenActivePalette:
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		move.w	#$003F,d5


DarkenPalette:
		move.w	(g_PaletteDarkenCurrentBrightness).l,d3
		move.w	(g_PaletteDarkenExtent).l,d4
		move.w	(g_PaletteDarkenTargetBrightness).l,d7

_darkenLoop:
		move.w	(a0)+,d0
		bsr.s	DarkenColour
		move.w	d0,(a1)+
		dbf	d5,_darkenLoop
		bsr.w	QueueFullPaletteDMA
		bsr.w	EnableDMAQueueProcessing
		add.w	d4,d3
		move.w	d3,(g_PaletteDarkenCurrentBrightness).l
		rts


; d0 = BGR colour word. Subtracts the step in d3 from each 3-bit
; channel (blue step in d3 bits 8-11, shifted down for green then
; red), snapping a channel to d7 when it underflows.
DarkenColour:
		move.w	d0,d1
		andi.w	#$0E00,d1
		sub.w	d3,d1
		andi.w	#$1E00,d1
		cmpi.w	#$1000,d1
		bcs.s	_dkGreen
		move.w	d7,d1

_dkGreen:
		lsr.w	#$04,d3
		move.w	d0,d2
		andi.w	#$00E0,d2
		sub.w	d3,d2
		andi.w	#$01E0,d2
		cmpi.w	#$0100,d2
		bcs.s	_dkRed
		move.w	d7,d2

_dkRed:
		lsr.w	#$04,d3
		andi.w	#$000E,d0
		sub.w	d3,d0
		andi.w	#$001E,d0
		cmpi.w	#$0010,d0
		bcs.s	_dkDone
		move.w	d7,d0

_dkDone:
		lsl.w	#$08,d3
		or.w	d2,d0
		or.w	d1,d0
		rts


FadeFromWhite:
		move.w	#$0C00,d3
		move.w	#-$0200,d4
		move.w	#$0E00,d7
		bra.w	DoWhiteFade

FadeToWhite:
		move.w	#$0200,d3
		move.w	#$0200,d4
		move.w	#$0E00,d7

DoWhiteFade:
		move.w	#$0006,d6

_whStepLoop:
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		move.w	#$003F,d5

_whColourLoop:
		move.w	(a0)+,d0
		bsr.s	BrightenColour
		move.w	d0,(a1)+
		dbf	d5,_whColourLoop
		bsr.w	QueueFullPaletteDMA
		bsr.w	EnableDMAQueueProcessing
		move.w	#$0004,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames
		add.w	d4,d3
		dbf	d6,_whStepLoop
		rts


; As DarkenColour but adding towards the ceiling in d7 (usually $0E
; per channel = white).
BrightenColour:
		move.w	d0,d1
		andi.w	#$0E00,d1
		add.w	d3,d1
		andi.w	#$1E00,d1
		cmpi.w	#$1000,d1
		bcs.s	_brGreen
		move.w	d7,d1

_brGreen:
		lsr.w	#$04,d3
		lsr.w	#$04,d7
		move.w	d0,d2
		andi.w	#$00E0,d2
		add.w	d3,d2
		andi.w	#$01E0,d2
		cmpi.w	#$0100,d2
		bcs.s	_brRed
		move.w	d7,d2

_brRed:
		lsr.w	#$04,d3
		lsr.w	#$04,d7
		andi.w	#$000E,d0
		add.w	d3,d0
		andi.w	#$001E,d0
		cmpi.w	#$0010,d0
		bcs.s	_brDone
		move.w	d7,d0

_brDone:
		lsl.w	#$08,d3
		lsl.w	#$08,d7
		or.w	d2,d0
		or.w	d1,d0
		rts


ClearAndRefreshVDPSpriteTableDMA:
		bsr.s	ClearScrollPlanes
		bsr.s	ClearVDPSpriteTable

UpdateVDPSpriteTableDMA:
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


ClearVDPSpriteTable:
		movem.l	d0-d1/a0,-(sp)
		lea	(g_VDPSpr00_Y).l,a0
		moveq	#$4F,d1
		moveq	#$01,d0

_clrSprLoop:
		move.l	d0,(a0)+
		clr.l	(a0)+
		addq.b	#$01,d0
		dbf	d1,_clrSprLoop
		clr.b	-5(a0)
		movem.l	(sp)+,d0-d1/a0
		rts


ClearScrollPlanes:
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


WaitUntilVBlank:
		bsr.w	Return
		bsr.w	UpdateFridayAnimation
		bset	#$07,(g_InterruptFlags).l

_vblankWait:
		btst	#$07,(g_InterruptFlags).l
		bne.s	_vblankWait
		rts


; Sleeps for d0	frames.

Sleep:
		movem.w	d0,-(sp)

_sleepLoop:
		bsr.s	WaitUntilVBlank
		dbf	d0,_sleepLoop
		movem.w	(sp)+,d0
		rts


EnableVRAMCopyQueueProcessing:
		bset	#$00,(g_InterruptFlags).l
		rts


FlushVRAMCopyQueue:
		bsr.s	EnableVRAMCopyQueueProcessing
		bra.w	WaitUntilVBlank


EnableDMAQueueProcessing:
		bset	#$03,(g_InterruptFlags).l
		rts


FlushDMACopyQueue:
		bsr.s	EnableDMAQueueProcessing
		bra.w	WaitUntilVBlank


; The routines from here to CopyToPlaneB write tilemap cells (d0 =
; tile word, d5/d6 = cell x/y relative to the scroll position) to
; plane A/B VRAM via the VRAM copy queue, mirroring each write into
; the RAM copies of the planes at $FFC000/$FFE000. They assume a
; 32-cell-wide plane (row stride $40), which doesn't match the
; game's 64-cell setup, and are only reachable through unreferenced
; thunks - leftovers from an earlier engine.
WritePlaneACell:
		movem.l	d7/a4-a5,-(sp)
		movea.l	(g_VRAMCopyQueuePtr).l,a4
		moveq	#$00,d7
		move.w	d7,(a4)+
		bsr.s	CalcPlaneCellAddrs
		move.w	a6,(a4)+

_cellFinish:
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


WritePlaneBCell:
		movem.l	d7/a4-a5,-(sp)
		movea.l	(g_VRAMCopyQueuePtr).l,a4
		moveq	#$00,d7
		move.w	d7,(a4)+		  ; Single word	copy
		bsr.s	CalcPlaneCellAddrs
		bsr.s	SwapPlaneAddr
		move.w	a6,(a4)+
		bra.s	_cellFinish


; Converts cell x/y in d5/d6 into scroll-adjusted VRAM addresses:
; returns a6 with the plane A ($C000-based) address in the low word
; and the plane B ($E000-based) address in the high word.
CalcPlaneCellAddrs:
		movem.l	d5-d7,-(sp)
		lea	($E000).l,a6		  ; 0xE000 - Scroll B data
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
		bsr.s	SwapPlaneAddr
		movem.l	(sp)+,d5-d6
		movem.l	d5-d6,-(sp)
		adda.l	#$C000,a6
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


; Swaps the two packed plane addresses in a6 (selects plane B).
SwapPlaneAddr:
		movem.l	d7,-(sp)
		move.l	a6,d7
		swap	d7
		movea.l	d7,a6
		movem.l	(sp)+,d7
		rts


; Copies a g_PlaneCopySize rectangle of cells from a4 (g_Buffer for
; the first entry point) to the plane and its RAM mirror, one queued
; row at a time.
CopyBufferToPlaneA:
		lea	(g_Buffer).l,a4

CopyToPlaneA:
		movem.l	d5-d6,-(sp)
		move.w	(g_PlaneCopyXY).l,d5
		lsr.w	#$08,d5
		move.w	(g_PlaneCopyXY).l,d6
		andi.w	#$00FF,d6
		bsr.w	CalcPlaneCellAddrs
		movem.l	(sp)+,d5-d6

_copyRows:
		movem.l	d3-d4/a3-a6,-(sp)
		clr.l	d3
		move.w	a6,d3
		ori.l	#RAM_Start,d3
		movea.l	d3,a3
		movea.l	(g_VRAMCopyQueuePtr).l,a5
		move.w	(g_PlaneCopySize).l,d3
		andi.l	#$FF,d3
		move.b	d3,(g_VRAMCopyQueueLen).l
		subq.w	#$01,d3

_rowLoop:
		movem.l	a3,-(sp)
		move.w	(g_PlaneCopySize).l,d4
		andi.l	#$0000FF00,d4
		lsr.w	#$08,d4
		subq.w	#$01,d4
		move.w	d4,(a5)+
		move.w	a6,(a5)+

_cellLoop:
		move.w	(a4),(a5)+
		move.w	(a4)+,(a3)+
		dbf	d4,_cellLoop
		adda.w	#$0040,a6
		movem.l	(sp)+,a3
		adda.w	#$0040,a3
		dbf	d3,_rowLoop
		movem.l	(sp)+,d3-d4/a3-a6
		bra.w	FlushVRAMCopyQueue

CopyToPlaneB:
		movem.l	d5-d6,-(sp)
		move.w	(g_PlaneCopyXY).l,d5
		lsr.w	#$08,d5
		move.w	(g_PlaneCopyXY).l,d6
		andi.w	#$00FF,d6
		bsr.w	CalcPlaneCellAddrs
		movem.l	(sp)+,d5-d6
		bsr.w	SwapPlaneAddr
		bra.w	_copyRows


; Immediate VRAM DMA with interrupts disabled.
; d0 = DMA Length (words)
; a0 = DMA Source
; a1 = DMA Destination
; Transfers that cross a 128KB source bank are split into two DMAs.

DoDMACopy:
		movem.l	d2/d7,-(sp)
		move	sr,-(sp)
		move	#$2700,sr		  ; Disable interrupts

_dmaChunk:
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
		beq.s	_dmaDone
		swap	d2
		suba.w	d2,a1
		lsr.w	#$01,d2
		move.w	d2,d0
		clr.w	d2
		movea.l	d2,a0
		bra.w	_dmaChunk

_dmaDone:
		move	(sp)+,sr
		movem.l	(sp)+,d2/d7
		rts


; Queues a VRAM DMA (same registers as DoDMACopy) into g_DMAOpQueue
; for ProcessQueuedDMAOps to run during the next VBlank/HBlank,
; splitting on 128KB source bank crossings.
; d0 - DMA Length (words)
; a0 - DMA Source
; a1 - DMA Destination

QueueDMAOp:
		movem.l	d2/d7,-(sp)

_queueChunk:
		movem.l	d0/a0-a1/a6,-(sp)
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.w	#$8F02,(a6)+
		move.l	#$94009300,(a6)+	  ; DMA	LENGTH (Regs #19 and #20)
		movep.w	d0,-$03(a6)
		move.l	a0,d0
		lsr.l	#$01,d0
		move.l	#$96009500,(a6)+	  ; DMA	SOURCE ADDR LOW	(Regs #22 and #21)
		movep.w	d0,-$03(a6)
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
		moveq	#$00,d2
		move.w	d0,d2
		add.w	d2,d2
		move.l	a0,d7
		swap	d7
		adda.l	d2,a0
		adda.w	d2,a1
		move.l	a0,d2
		swap	d2
		cmp.b	d2,d7
		beq.s	_queueDone
		swap	d2
		suba.w	d2,a1
		lsr.w	#$01,d2
		beq.s	_queueDone
		move.w	d2,d0
		clr.w	d2
		movea.l	d2,a0
		bra.w	_queueChunk

_queueDone:
		movem.l	(sp)+,d2/d7
		rts


SetVRAMAddressOnVDP:
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


QueueHScrollDMAUpdate:
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


FillHScrollData:
		movem.l	d7/a6,-(sp)
		lea	(g_HorizontalScrollData).l,a6

_fillHScroll:
		move.w	#$00FF,d7

_fillHLoop:
		move.w	d6,(a6)+
		addq.w	#$02,a6
		dbf	d7,_fillHLoop
		movem.l	(sp)+,d7/a6
		bra.s	QueueHScrollDMAUpdate


FillHScrollDataOffset1:
		movem.l	d7/a6,-(sp)
		lea	((g_HorizontalScrollData+2)).l,a6
		bra.s	_fillHScroll


QueueVSRAMUpdate:
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


FillVSRAM:
		movem.l	d7/a6,-(sp)
		lea	(g_VSRAMData).l,a6

_fillVSRAM:
		move.w	#$0013,d7

_fillVLoop:
		move.w	d6,(a6)+
		addq.w	#$02,a6
		dbf	d7,_fillVLoop
		movem.l	(sp)+,d7/a6
		bra.s	QueueVSRAMUpdate


FillVSRAMOffset1:
		movem.l	d7/a6,-(sp)
		lea	((g_VSRAMData+2)).l,a6
		bra.s	_fillVSRAM


; d0 - Fill destination	address	VDP
; d1 - Fill length bytes
; d2 - Fill pattern

DoDMAFill:
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

_fillWait:
		move.w	(VDP_CTRL_REG).l,d0
		andi.w	#$0002,d0
		bne.s	_fillWait			  ; Wait until DMA complete
		move.w	(g_VDPReg01_ModeSet2).l,d3
		move.w	d3,(VDP_CTRL_REG).l	  ; Disable DMA
		move.w	#$8F02,(VDP_CTRL_REG).l	  ; Set	auto-increment back to 2
		movem.l	(sp)+,d0-d3
		rts


; d7 = value. Writes ten digit bytes to g_Base10Digits, each stored
; as digit+1 ($02 = '1'); leading zeros are then cleared to $00.
ConvertToBase10:
		movem.l	d5-d7/a5-a6,-(sp)
		lea	PowersOf10(pc),a5
		nop
		lea	(g_Base10Digits).l,a6
		moveq	#$09,d5

_digitLoop:
		clr.b	d6

_divLoop:
		addq.w	#$01,d6
		sub.l	(a5),d7
		bcc.s	_divLoop
		move.b	d6,(a6)+
		add.l	(a5)+,d7
		dbf	d5,_digitLoop
		lea	(g_Base10Digits).l,a6
		moveq	#$08,d6

_zeroLoop:
		cmpi.b	#$01,(a6)
		bne.w	_b10Done
		clr.b	(a6)+
		dbf	d6,_zeroLoop

_b10Done:
		movem.l	(sp)+,d5-d7/a5-a6
		rts

PowersOf10:	dc.l 1000000000
		dc.l 0100000000
		dc.l 0010000000
		dc.l 0001000000
		dc.l 0000100000
		dc.l 0000010000
		dc.l 0000001000
		dc.l 0000000100
		dc.l 0000000010
		dc.l 0000000001


UpdateControllerInputs:
		movem.l	d5-d7/a5-a6,-(sp)
		move	sr,d5
		bsr.w	DisableInterrupts
		move.w	#$0100,(Z80_BUSREQ_REG0).l

_ctrlBusLoop:
		btst	#$00,(Z80_BUSREQ_REG0).l
		bne.s	_ctrlBusLoop
		bsr.s	ReadControllerInput
		move.w	#$0000,(Z80_BUSREQ_REG0).l
		move	d5,sr
		movem.l	(sp)+,d5-d7/a5-a6
		rts


ReadControllerInput:
		lea	(g_Controller1State).l,a5
		lea	(SEGA_CTRL1_DATA_REG).l,a6
		bsr.s	ReadControllerReg
		neg.b	d6
		add.w	d6,(g_RNG).l
		addq.w	#$02,a6


; Standard TH-toggled 3-button pad read; result is inverted so
; pressed = 1. Both raw reads are also summed into g_RNG as entropy.
ReadControllerReg:
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


WaitForButtonPush:
		bsr.s	UpdateControllerInputs
		andi.b	#CTRLBF_ANYBUTTON,(g_Controller1State).l
		bne.s	_wfbDone
		bsr.w	WaitUntilVBlank
		bra.s	WaitForButtonPush

_wfbDone:
		rts


WaitForNextButtonPress:
		bsr.w	UpdateControllerInputs
		andi.b	#CTRLBF_ANYBUTTON,(g_Controller1State).l
		beq.s	_wfnWait
		bsr.w	WaitUntilVBlank
		bra.s	WaitForNextButtonPress

_wfnWait:
		bsr.w	UpdateControllerInputs
		andi.b	#CTRLBF_ANYBUTTON,(g_Controller1State).l
		bne.s	_wfnDone
		bsr.w	WaitUntilVBlank
		bra.s	_wfnWait

_wfnDone:
		rts


; Like UpdateControllerInputs but suppresses the buttons in
; g_InputHoldMask for up to 10 frames. The mask is never set anywhere
; and this is only reachable via an unreferenced thunk - an unused
; debounce leftover.
UpdateControllerInputsMasked:
		movem.l	d7,-(sp)
		bsr.w	UpdateControllerInputs
		move.b	(g_Controller1State).l,d7
		and.b	(g_InputHoldMask).l,d7
		beq.s	_maskReset
		addq.b	#$01,(g_InputHoldTimer).l
		move.b	(g_InputHoldTimer).l,d7
		cmpi.b	#$0A,d7
		bcc.s	_maskReset
		clr.b	(g_Controller1State).l
		movem.l	(sp)+,d7
		rts

_maskReset:
		clr.b	(g_InputHoldMask).l
		clr.b	(g_InputHoldTimer).l
		movem.l	(sp)+,d7
		rts

Wait1SecondOrUntilButtonPushed:
		movem.l	d5,-(sp)
		moveq	#59,d5

_waitBtnLoop:
		bsr.w	UpdateControllerInputs
		andi.b	#CTRLBF_ANYBUTTON,(g_Controller1State).l
		bne.s	_waitBtnDone
		bsr.w	WaitUntilVBlank
		dbf	d5,_waitBtnLoop

_waitBtnDone:
		movem.l	(sp)+,d5
		rts


Wait3SecondsOrUntilButtonPushed:
		movem.l	d5,-(sp)
		move.l	#179,d5
		bra.s	_waitBtnLoop


; Steps g_RNG (seed = seed * 13 + 7) and returns d7 = a random
; number in [0, d6).
GenerateRandomNumber:
		move.w	(g_RNG).l,d7
		mulu.w	#$000D,d7
		addi.w	#$0007,d7
		andi.l	#$0000FFFF,d7
		move.w	d7,(g_RNG).l
		mulu.w	d6,d7
		swap	d7
		rts


; HInt. When the shadow HInt-line register still reads $8AA0 (line
; 160, the textbox split) the handler just re-opens the window to
; full height; otherwise (darkened rooms, HInt on an early line) it
; syncs to the next scanline, blanks the display and writes the
; queued map-block cells (ProcessPendingBlockCopies). Either way, if
; a frame is pending it processes the queued VDP work here instead
; of waiting for VBlank.
HandleHBlankInterrupt:
		bsr.w	DisableInterrupts
		cmpi.w	#$8AA0,(g_VDPReg10_HIntLine).l ; HINT on Line 160
		beq.s	_fullWindow
		movem.l	d0-a6,-(sp)
		move.b	(VDP_HVCTR_REG).l,d0

_hvSyncLoop:
		cmp.b	(VDP_HVCTR_REG).l,d0
		beq.s	_hvSyncLoop
		move.w	#$8124,(VDP_CTRL_REG).l
		move.w	#$8124,(g_VDPReg01_ModeSet2).l
		bsr.w	ProcessPendingBlockCopies

_procQueues:
		btst	#$07,(g_InterruptFlags).l
		beq.s	_hintDone
		bsr.w	ProcessQueuedVDPActions

_hintDone:
		bsr.w	EnableInterrupts
		movem.l	(sp)+,d0-a6
		rte

_fullWindow:
		movem.l	d0-a6,-(sp)
		move.w	#$921C,(VDP_CTRL_REG).l	  ; WINDOW 28 CELLS UP (Fullscreen)
		bra.s	_procQueues


; VBlank. If a frame is pending (flag bit 7, set by WaitUntilVBlank):
; briefly blanks the display, DMAs the sprite table and drains the
; VRAM copy / VRAM read / DMA queues. Always: bumps g_VBlankCounter
; and g_RNG, pumps the sound queue, and advances the play-time clock
; (3600 frames -> minute -> hour).
HandleVBlankInterrupt:
		movem.l	d0-a6,-(sp)
		bclr	#$07,(g_InterruptFlags).l
		beq.s	_vbCounters
		bsr.w	_disableDisplayVBlank
		bsr.w	RefreshVDPSpriteTable
		bsr.s	ProcessQueuedVDPActions

_vbCounters:
		bsr.w	EnableDisplay
		addq.w	#$01,(g_VBlankCounter).l
		addq.w	#$01,(g_RNG).l
		move.w	(g_VDPReg18_WindowVPos).l,(VDP_CTRL_REG).l
		bsr.w	ProcessSoundQueue
		addq.w	#$01,(g_FrameCount).l
		cmpi.w	#3600,(g_FrameCount).l
		bcs.s	_vbDone
		clr.w	(g_FrameCount).l
		addq.w	#$01,(g_MinuteCount).l
		cmpi.w	#60,(g_MinuteCount).l
		bcs.s	_vbDone
		clr.w	(g_MinuteCount).l
		addq.w	#$01,(g_HourCount).l

_vbDone:
		movem.l	(sp)+,d0-a6
		rte


_disableDisplayVBlank:
		andi.b	#$BF,(g_VDPReg01_ModeSet2+1).l
		move.w	(g_VDPReg01_ModeSet2).l,(VDP_CTRL_REG).l
		rts


ProcessQueuedVDPActions:
		bsr.s	ProcessVRAMCopyQueue
		bsr.w	ProcessVRAMReadOp
		bsr.w	ProcessQueuedDMAOps
		rts


ProcessVRAMCopyQueue:
		bclr	#$00,(g_InterruptFlags).l
		beq.w	_cpqDone
		tst.b	(g_VRAMCopyQueueLen).l
		beq.w	_cpqDone
		lea	(g_VRAMCopyQueue).l,a0

_cpqNext:
		move.w	(a0)+,d0		  ; First word - Copy length + Auto Increment
						  ; BIT	15 Clear = AutoIncrement 2
						  ; BIT	14 Clear = AutoIncrement 0x40
						  ; Bit	14 Set	 = AutoIncrement 0x80
						  ; Remainder	 = Copy	length - 1
		move.w	#$8F02,d1		  ; Reg	#15 - Auto-increment 2
		bclr	#$0F,d0
		beq.s	_cpqSetInc		  ; Set	auto-increment on VDP
		move.w	#$8F40,d1		  ; Reg	#15 - Auto increment 0x40
		bclr	#$0E,d0
		beq.s	_cpqSetInc		  ; Set	auto-increment on VDP
		move.w	#$8F80,d1		  ; Reg	#15 - Auto increment 0x80

_cpqSetInc:
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

_cpqData:
		move.w	(a0)+,(VDP_DATA_REG).l	  ; Third+ word	- VRAM Data
		dbf	d0,_cpqData		  ; Copy in VDP	data
		subq.b	#$01,(g_VRAMCopyQueueLen).l
		bne.s	_cpqNext
		move.w	#$8F02,(VDP_CTRL_REG).l	  ; Reset auto-increment value to 2
		move.l	#g_VRAMCopyQueue,(g_VRAMCopyQueuePtr).l

_cpqDone:
		rts


ProcessVRAMReadOp:
		bclr	#$04,(g_InterruptFlags).l
		beq.s	_readDone
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

_readLoop:
		move.w	(VDP_DATA_REG).l,(a0)+
		dbf	d7,_readLoop

_readDone:
		rts


RefreshVDPSpriteTable:
		btst	#$01,(g_InterruptFlags).l
		bne.s	_sprDone
		bsr.w	UpdateVDPSpriteTableDMA

_sprDone:
		rts


ProcessQueuedDMAOps:
		bclr	#$03,(g_InterruptFlags).l
		beq.s	_dmaOpsDone
		tst.b	(g_NumQueuedDMAOps).l
		beq.s	_dmaOpsDone
		move.w	#$0100,(Z80_BUSREQ_REG0).l

_dmaBusLoop:
		btst	#$00,(Z80_BUSREQ_REG0).l
		bne.s	_dmaBusLoop
		lea	(g_DMAOpQueue).l,a0
		lea	(VDP_CTRL_REG).l,a6
		move.w	(g_VDPReg01_ModeSet2).l,d7
		ori.b	#$10,d7
		move.w	d7,(a6)

_dmaOpLoop:
		move.l	(a0)+,(a6)
		move.l	(a0)+,(a6)
		move.l	(a0)+,(a6)
		move.w	(a0)+,(a6)
		move.w	(a0)+,(g_DMADestHi).l
		move.w	(g_DMADestHi).l,(a6)
		subq.b	#$01,(g_NumQueuedDMAOps).l
		bne.s	_dmaOpLoop
		move.w	(g_VDPReg01_ModeSet2).l,(a6)
		move.w	#$8F02,(a6)
		move.w	#$0000,(Z80_BUSREQ_REG0).l
		move.l	#g_DMAOpQueue,(g_DMAOpQueuePtr).l

_dmaOpsDone:
		rts


; Runs every VBlank: forwards one entry from g_SoundQueue (d1 =
; parameter byte, d0 = sound id) to the driver's command ports at
; Z80 $1FFC-$1FFF. Special ids: $FB pops g_BGMStack to resume the
; previous track; >= $FD are sent as-is; $F0 stalls the queue until
; the driver reports ready (g_SndQueueWait); $FC sends its parameter
; to $1FFD. Otherwise: a repeat of the current BGM is dropped; bit 7
; set means "with priority parameter" (sent to $1FFC); ids <= $40 get
; priority $0F; and ids < $40 (music tracks) are pushed onto
; g_BGMStack.
ProcessSoundQueue:
		move.w	#$0100,(Z80_BUSREQ_REG0).l

_sndBusLoop:
		btst	#$00,(Z80_BUSREQ_REG0).l
		bne.s	_sndBusLoop
		tst.b	(g_SndQueueWait).l
		beq.w	_sndCheckQueue
		tst.b	(Z80_MEM+$1283).l
		beq.w	_sndDone
		clr.b	(g_SndQueueWait).l

_sndCheckQueue:
		lea	(g_SoundQueue).l,a0
		move.l	4(a0),d0
		or.l	(a0),d0
		beq.w	_sndDone
		move.b	(a0),d1
		move.b	1(a0),d0
		move.w	2(a0),(a0)+
		move.w	2(a0),(a0)+
		move.w	2(a0),(a0)+
		clr.w	(a0)
		cmpi.b	#$FB,d0
		bne.s	_chkDirectCmd
		tst.b	(g_BGMStackDepth).l
		beq.s	_sendStackTop
		movem.l	d7-a0,-(sp)
		lea	(g_BGMStack).l,a0
		moveq	#$08,d7

_popLoop:
		move.b	1(a0),(a0)+
		dbf	d7,_popLoop
		movem.l	(sp)+,d7-a0
		subq.b	#$01,(g_BGMStackDepth).l

_sendStackTop:
		move.b	(g_BGMStack).l,(Z80_MEM+$1FFF).l
		bra.w	_sndDone

_chkDirectCmd:
		cmpi.b	#$FD,d0
		bcs.s	_chkWaitCmd
		move.b	d0,(Z80_MEM+$1FFF).l
		bra.w	_sndDone

_chkWaitCmd:
		cmpi.b	#$F0,d0
		bne.s	_chkChanCmd
		move.b	#$01,(g_SndQueueWait).l
		bra.w	_sndDone

_chkChanCmd:
		cmpi.b	#$FC,d0
		bne.s	_chkRepeat
		andi.b	#$0F,d1
		move.b	d1,(Z80_MEM+$1FFD).l
		move.b	d0,(Z80_MEM+$1FFF).l
		bra.w	_sndDone

_chkRepeat:
		movem.l	d0,-(sp)
		andi.b	#$7F,d0
		cmp.b	(g_BGMStack).l,d0
		movem.l	(sp)+,d0
		bne.s	_chkSFXFlag
		bra.w	_sndDone

_chkSFXFlag:
		bclr	#$07,d0
		beq.s	_chkLowTrack
		move.b	d1,(Z80_MEM+$1FFC).l
		bra.s	_sendCmd

_chkLowTrack:
		cmpi.b	#$40,d0
		bgt.s	_sendCmd
		move.b	#$0F,(Z80_MEM+$1FFC).l

_sendCmd:
		move.b	d0,(Z80_MEM+$1FFF).l
		cmpi.b	#$40,d0
		bge.s	_sndDone
		movem.l	d7-a0,-(sp)
		lea	(g_InterruptFlags).l,a0
		moveq	#$08,d7

_pushLoop:
		move.b	-2(a0),-(a0)
		dbf	d7,_pushLoop
		move.b	d0,-(a0)
		movem.l	(sp)+,d7-a0
		cmpi.b	#$0A,(g_BGMStackDepth).l
		bge.s	_sndDone
		addq.b	#$01,(g_BGMStackDepth).l

_sndDone:
		move.w	#$0000,(Z80_BUSREQ_REG0).l
		rts


; Unreferenced.
_ret:
		rts

		modend
