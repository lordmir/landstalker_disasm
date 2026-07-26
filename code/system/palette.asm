Palette	module
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

		modend
