Startup	module
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

		modend
