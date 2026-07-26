TreeWarpEffect	module
_tw_fadeTimer	 = -$8E		; palette fade countdown (a step every 4)
_tw_phaseStep	 = -$8C		; sine phase advance per scanline
_tw_amplitude	 = -$8A		; wave amplitude (rewritten every frame)
_tw_phaseRate	 = -$88		; sine phase advance per frame
_tw_savedVScroll = -$86
_tw_savedHScroll = -$84
_tw_effectId	 = -$82
_tw_palBackup	 = -$80		; saved g_Pal0Base ($80 bytes)

TreeWarpFx:
		link	a6,#-$008E
		move.w	d0,_tw_effectId(a6)
		move.w	(g_HorizontalScrollData).l,_tw_savedHScroll(a6)
		move.w	(g_VSRAMData).l,_tw_savedVScroll(a6)
		move.w	#$0006,_tw_phaseRate(a6)
		move.w	#$0003,_tw_amplitude(a6)
		move.w	#$0008,_tw_phaseStep(a6)
		move.w	#$001C,_tw_fadeTimer(a6)
		bsr.w	_twSavePalette
		move.w	(g_HorizontalScrollData).l,d6
		jsr	(FillHScrollData).l
		jsr	(FillHScrollDataOffset1).l
		jsr	(FlushDMACopyQueue).l
		moveq	#$0000000B,d0
		moveq	#$00000003,d1
		jsr	(OrVDPReg).l
		cmpi.w	#$0002,_tw_effectId(a6)
		bne.s	_twIn
		bsr.w	_twWavesOut
		bra.s	_twTeardown

_twIn:
		bsr.w	_twWavesIn

_twTeardown:
		moveq	#$0000000B,d0
		moveq	#$0000000C,d1
		jsr	(MaskVDPReg).l
		move.w	_tw_savedHScroll(a6),(g_HorizontalScrollData).l
		move.w	_tw_savedVScroll(a6),(g_VSRAMData).l
		bsr.w	_twRestorePalette
		unlk	a6
		rts

; Warp out: the amplitude grows 1 -> $7F as the frame counter runs
; $FF down to $80, and over the last $20 frames the base palette is
; darkened in place one step every 4 ticks (a cumulative fade-out).
_twWavesOut:
		move.w	#$00FF,d7

_twoFrame:
		move.l	d7,-(sp)
		bsr.w	_twSetAmplitude
		bsr.w	_twAbsFrame
		bsr.w	_twBuildHScroll
		bsr.w	_twFadePulseOut
		jsr	(WaitUntilVBlank).l
		move.l	(sp)+,d7
		subq.w	#$01,d7
		cmpi.w	#$0080,d7
		bcc.s	_twoFrame
		rts

; Warp in: blacks the active palette out, then over $80 frames the
; amplitude shrinks $7F -> 0 while the palette fades in from black
; (a darken step from the base palette every 4 ticks).
_twWavesIn:
		lea	(g_Pal0Active).l,a0
		moveq	#$00000037,d7

_twiClearPal:
		clr.w	(a0)+
		dbf	d7,_twiClearPal
		jsr	(InitFadeFromBlackParams).l
		move.w	#$007F,d7

_twiFrame:
		move.l	d7,-(sp)
		bsr.w	_twSetAmplitude
		bsr.w	_twAbsFrame
		bsr.w	_twBuildHScroll
		bsr.w	_twFadePulseIn
		jsr	(WaitUntilVBlank).l
		move.l	(sp)+,d7
		dbf	d7,_twiFrame
		rts

; Save the base palette into the stack frame.
_twSavePalette:
		lea	(g_Pal0Base).l,a0
		lea	_tw_palBackup(a6),a1
		moveq	#$0000001F,d7

_tspCopy:
		move.l	(a0)+,(a1)+
		dbf	d7,_tspCopy
		rts

; Restore the base palette from the stack frame.
_twRestorePalette:
		lea	(g_Pal0Base).l,a1
		lea	_tw_palBackup(a6),a0
		moveq	#$0000001F,d7

_trpCopy:
		move.l	(a0)+,(a1)+
		dbf	d7,_trpCopy
		rts

; Amplitude for this frame: |low byte of the frame counter d7|,
; clamped to $7F.
_twSetAmplitude:
		move.w	d7,d0
		tst.b	d0
		bpl.s	_tsaPos
		neg.b	d0

_tsaPos:
		ext.w	d0
		cmpi.w	#$0080,d0
		bcs.s	_tsaStore
		move.w	#$007F,d0

_tsaStore:
		move.w	d0,_tw_amplitude(a6)
		rts

; Leftover: computes |low byte of d7| into d0, but the result is
; never used (_twBuildHScroll recomputes its phase from d7).
_twAbsFrame:
		move.w	d7,d0
		tst.b	d0
		bpl.s	_tafPos
		neg.b	d0

_tafPos:
		ext.w	d0
		rts

; Build the per-line H-scroll table: for each of the 256 scanlines,
; offset = sin(frame * rate + line * step) * amplitude / 1024 added
; to the saved base scroll, written for both planes, then queued as
; a DMA update.
_twBuildHScroll:
		move.w	_tw_savedHScroll(a6),d2
		lea	(g_HorizontalScrollData).l,a0
		move.w	d7,d1
		mulu.w	_tw_phaseRate(a6),d1
		move.w	#$00FF,d6

_tbhLine:
		move.w	d1,d0
		jsr	(j_Sine).l
		move.w	_tw_amplitude(a6),d3
		bne.s	_tbhScale
		clr.l	d0
		bra.s	_tbhStore

_tbhScale:
		muls.w	d3,d0

_tbhStore:
		lsr.l	#$08,d0
		lsr.l	#$02,d0
		add.w	d2,d0
		move.w	d0,(a0)+
		move.w	d0,(a0)+
		add.w	_tw_phaseStep(a6),d1
		dbf	d6,_tbhLine
		jsr	(QueueHScrollDMAUpdate).l
		jsr	(j_EnableDMAQueueProcessing).l
		rts

; Warp-out palette fade: idle until the frame counter drops below
; $A0, then every 4th tick of the fade timer darken the base
; palette one step in place (DarkenPaletteStep, cumulative).
_twFadePulseOut:
		cmpi.w	#$00A0,d7
		bcs.s	_tfoActive
		rts

_tfoActive:
		move.w	_tw_fadeTimer(a6),d0
		bne.s	_tfoTick
		rts

_tfoTick:
		subq.w	#$01,d0
		move.w	d0,_tw_fadeTimer(a6)
		andi.w	#$0003,d0
		beq.s	_tfoStep
		rts

_tfoStep:
		moveq	#$00000037,d7
		lea	(g_Pal0Base).l,a0
		move.l	d7,-(sp)
		jsr	(DarkenPaletteStep).l
		move.l	(sp)+,d7
		rts

; Warp-in palette fade: every 4th tick of the fade timer take one
; DarkenPalette step from the base palette into the active one
; (the fade-from-black set up by _twWavesIn).
_twFadePulseIn:
		move.w	_tw_fadeTimer(a6),d0
		bne.s	_tfiTick
		rts

_tfiTick:
		subq.w	#$01,d0
		move.w	d0,_tw_fadeTimer(a6)
		andi.w	#$0003,d0
		beq.s	_tfiStep
		rts

_tfiStep:
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		moveq	#$00000037,d5
		jsr	(DarkenPalette).l
		rts

	modend
