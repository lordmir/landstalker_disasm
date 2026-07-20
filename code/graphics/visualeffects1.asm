VisualEffects1	module
; Full-screen visual effects: palette flashes and the warp
; transitions. Everything here runs synchronously (the game loop is
; paused while an effect plays), driving the VDP directly and
; restoring what it changed on the way out. The Nole warp's tick
; helpers continue in visualeffects2.asm and share NoleWarp's stack
; frame (the _nw_* vars below).

; Run visual effect d0 (VFX_* ids, constants/visualeffects.inc):
;   0,1 - warp-pad darkness sweep (the id is not used by the handler)
;   2   - tree warp out, 3 - tree warp in
;   4   - black flash, 5 - white flash, 6 - red flash
;   7   - Nole/Kazalt warp out, 8 - Nole/Kazalt warp in
;   9,A - as 7,8 with an alternate sparkle centre (cutscene use)
DoVisualEffect:
		movem.l	d0-a6,-(sp)
		lea	VisualFXTable(pc),a0
		move.w	d0,d1
		lsl.l	#$02,d1
		movea.l	(a0,d1.l),a0
		jsr	(a0)
		movem.l	(sp)+,d0-a6
		rts

VisualFXTable:	dc.l WarpPadFx
		dc.l WarpPadFx
		dc.l TreeWarpFx
		dc.l TreeWarpFx
		dc.l BlackFlash
		dc.l WhiteFlash
		dc.l RedFlash
		dc.l NoleWarp
		dc.l NoleWarp
		dc.l NoleWarp
		dc.l NoleWarp

; Warp-pad transition: a banded darkness gradient that sweeps down
; the screen. Builds 8 copies of the palette in g_Buffer, each one
; step darker than the last, then for $51 frames rewrites CRAM
; mid-frame at 8 raster splits whose scanlines follow a parabola
; (max(phase + 6i, 0)^2 / 16) - darkest band first, so the gradient
; accelerates downward as the phase advances. Restores the VDP
; auto-increment on exit.
WarpPadFx:
		lea	(g_Buffer).l,a5
		movea.l	a5,a1
		lea	(g_Pal0Base).l,a0
		moveq	#$00000037,d7

_wpSavePal:
		move.w	(a0)+,(a1)+
		dbf	d7,_wpSavePal
		movea.l	a5,a0
		lea	$00000070(a0),a1
		move.w	#$0187,d7

; Each of the next 7 x $38 words is the entry $70 bytes back with
; every component one step darker (clamped at 0): g_Buffer ends up
; holding the palette at 8 darkness levels.
_wpDarken:
		move.w	(a0)+,d0
		move.w	d0,d1
		move.w	d0,d2
		andi.w	#$0E00,d0
		subi.w	#$0200,d0
		bpl.s	_wpBlueOk
		clr.w	d0

_wpBlueOk:
		andi.w	#$00E0,d1
		subi.w	#$0020,d1
		bpl.s	_wpGreenOk
		clr.w	d1

_wpGreenOk:
		andi.w	#$000E,d2
		subi.w	#$0002,d2
		bpl.s	_wpRedOk
		clr.w	d2

_wpRedOk:
		or.w	d1,d0
		or.w	d2,d0
		move.w	d0,(a1)+
		dbf	d7,_wpDarken
		move.w	#$0000,d7

_wpPass:
		move.w	#$FFE8,d0
		move.w	#$0050,d5

_wpPhase:
		move.w	#$0000,d6

_wpFrame:
		movem.w	d0/d5-d7,-(sp)
		bsr.w	_wpDrawFrame
		movem.w	(sp)+,d0/d5-d7
		dbf	d6,_wpFrame
		addq.w	#$01,d0
		dbf	d5,_wpPhase
		dbf	d7,_wpPass
		move.w	#$8F02,d0
		jsr	(SetVDPReg).l
		rts

; One frame of the sweep, phase d0: fill the row table at
; g_Buffer+$380 with the 8 split scanlines, sync to the top of the
; frame (HV counter $FF), then walk the table blasting the darkest
; palette at the first split down to the lightest at the last.
_wpDrawFrame:
		lea	$00000380(a5),a0
		moveq	#$00000007,d7
		move.w	d0,d1

_dfRow:
		move.w	d1,d2
		bpl.s	_dfSquare
		clr.w	d2

_dfSquare:
		muls.w	d2,d2
		lsr.l	#$04,d2
		cmpi.l	#$000000B7,d2
		bcs.s	_dfStore
		move.b	#$DF,d2

_dfStore:
		move.b	d2,(a0)+
		addi.w	#$0006,d1
		dbf	d7,_dfRow
		jsr	(WaitUntilVBlank).l

_dfSyncHB:
		btst	#$02,(VDP_CTRL_REG+1).l
		beq.s	_dfSyncHB

_dfSyncHBEnd:
		btst	#$02,(VDP_CTRL_REG+1).l
		bne.s	_dfSyncHBEnd
		move.b	(VDP_HVCTR_REG).l,d2
		cmpi.b	#$FF,d2
		bne.s	_dfSyncHB
		lea	$00000380(a5),a4
		moveq	#$00000007,d7
		moveq	#$00000007,d0

_dfBands:
		movem.w	d0/d7,-(sp)
		bsr.w	_wpBlastBand
		movem.w	(sp)+,d0/d7
		bcs.w	_dfDone
		subi.b	#$01,d0
		dbf	d7,_dfBands

_dfDone:
		rts

; One raster band: skip rows above the visible area, otherwise blast
; darkness level d0 & 7's palette into CRAM (56 colours, 28 longs)
; and spin on the HV counter until the beam passes this band's
; scanline. Returns carry set once the beam is past the bottom of
; the screen (ending the frame early).
_wpBlastBand:
		move.b	(a4)+,d1
		cmpi.b	#$17,d1
		bcc.s	_bbWrite
		tst.b	d0
		rts

_bbWrite:
		move.b	d0,d2
		andi.w	#$0007,d2
		mulu.w	#$0070,d2
		lea	(a5,d2.w),a0
		move.l	d1,-(sp)
		lea	(VDP_DATA_REG).l,a1
		lea	(VDP_CTRL_REG).l,a2
		move.l	#$C0000000,(a2)
		movem.l	(a0)+,d0-d7
		move.l	d0,(a1)
		move.l	d1,(a1)
		move.l	d2,(a1)
		move.l	d3,(a1)
		move.l	d4,(a1)
		move.l	d5,(a1)
		move.l	d6,(a1)
		move.l	d7,(a1)
		movem.l	(a0)+,d0-d7
		move.l	d0,(a1)
		move.l	d1,(a1)
		move.l	d2,(a1)
		move.l	d3,(a1)
		move.l	d4,(a1)
		move.l	d5,(a1)
		move.l	d6,(a1)
		move.l	d7,(a1)
		movem.l	(a0)+,d0-d7
		move.l	d0,(a1)
		move.l	d1,(a1)
		move.l	d2,(a1)
		move.l	d3,(a1)
		move.l	d4,(a1)
		move.l	d5,(a1)
		move.l	d6,(a1)
		move.l	d7,(a1)
		movem.l	(a0)+,d0-d3
		move.l	d0,(a1)
		move.l	d1,(a1)
		move.l	d2,(a1)
		move.l	d3,(a1)
		move.l	(sp)+,d1

_bbWaitHB:
		btst	#$02,(VDP_CTRL_REG+1).l
		beq.s	_bbWaitHB

_bbWaitHBEnd:
		btst	#$02,(VDP_CTRL_REG+1).l
		bne.s	_bbWaitHBEnd
		move.b	(VDP_HVCTR_REG).l,d2
		cmpi.b	#$17,d2
		bcs.s	_bbWaitHB
		cmpi.b	#$B7,d2
		bcs.s	_bbCmpRow
		ori	#$01,ccr
		rts

_bbCmpRow:
		addq.b	#$01,d2
		cmp.b	d1,d2
		bcs.s	_bbWaitHB
		tst.b	d0
		rts

; Unreachable leftover: turn the display off (VDP reg 01 = $24).
		move.w	#$8124,(VDP_CTRL_REG).l
		move.w	#$8124,(g_VDPReg01_ModeSet2).l
		rts

; Tree warp transition: line-scroll waves. Saves the palette and
; scroll state, switches the VDP to per-line horizontal scroll, then
; either builds the waves up while the palette darkens (out, id 2)
; or lets them die down while fading in from black (in, id 3); every
; scanline is offset by sin(frame * rate + line * step) * amplitude.
; Restores the scroll mode, scroll data and palette on exit.

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

; Id 4: rebuild the active palette from the base one with every
; colour turned to greyscale (the average of its components).
BlackFlash:
		clr.l	d2
		bra.s	_flashGrey

; Id 5: as BlackFlash but with the greyscale inverted - a white
; flash. Also strobed by the Kazalt warp (ContinueKazaltWarpFx,
; visualeffects2.asm).
WhiteFlash:
		moveq	#$FFFFFFFF,d2

_flashGrey:
		jsr	(CopyBasePaletteToActivePalette).l
		lea	(g_Pal0Active).l,a0
		movea.l	a0,a1
		moveq	#$00000039,d7
		moveq	#$0000000E,d6

_fgColour:
		move.b	(a0)+,d0
		and.l	d6,d0
		move.b	(a0),d1
		and.w	d6,d1
		add.w	d1,d0
		move.b	(a0)+,d1
		lsr.b	#$04,d1
		and.w	d6,d1
		add.w	d1,d0
		divu.w	#$0003,d0
		tst.b	d2
		beq.s	_fgStore
		not.w	d0

_fgStore:
		and.w	d6,d0
		move.b	d0,(a1)+
		move.b	d0,d1
		lsl.b	#$04,d1
		or.b	d1,d0
		move.b	d0,(a1)+
		dbf	d7,_fgColour
		jsr	(j_EnableDMAQueueProcessing).l
		rts

; Id 6: red flash - rebuild the active palette keeping each colour's
; red component but crushing green and blue to at most one step.
RedFlash:
		jsr	(CopyBasePaletteToActivePalette).l
		lea	(g_Pal0Active).l,a0
		moveq	#$00000039,d7

_rfColour:
		move.b	(a0),d0
		lsr.b	#$03,d0
		move.b	d0,(a0)+
		move.b	(a0),d0
		move.b	d0,d1
		lsr.b	#$03,d0
		andi.b	#$20,d0
		andi.b	#$0E,d1
		or.b	d1,d0
		move.b	d0,(a0)+
		dbf	d7,_rfColour
		jsr	(j_EnableDMAQueueProcessing).l
		rts

; Nole/Kazalt warp (ids 7/8; 9/A remap to them with a different
; sparkle centre): the screen whites out while a fountain of sparkle
; sprites rises from the centre (NoleWarpAnimateStars,
; visualeffects2.asm - all the NoleWarp* helpers there share this
; stack frame). Out (7): fade to black, then 600 frames of sparkles
; while the palette ramps up to white; once the timer passes $23A
; the Kazalt strobe kicks in - WhiteFlash alternating with the
; normal palette, the two KazaltWarpPalette colours cycling and
; SND_KazaltWarp restarting every $20 ticks (NoleWarpKazaltFlash
; below). In (8): start from white, 360 frames of sparkles with the
; palette ramping back down, then fade in from black.

_nw_starCount	= -$134		; star spawn seed (stars drawn = /16, max $28)
_nw_whitenOut	= -$132		; warp-out whiten countdown (NoleWarpOutTick)
_nw_whitenIn	= -$130		; warp-in whiten countdown (NoleWarpInTick)
; -$12A/-$12C/-$12E: brighten-ramp current/step/target - only
; touched by the visualeffects2.asm helpers
_nw_timer	= -$128		; effect timer (out counts up, in down)
_nw_effectId	= -$126		; 7 = out, 8 = in (9/A remapped here)
_nw_centreY	= -$124		; sparkle fountain centre (VDP sprite coords)
_nw_centreX	= -$122
_nw_stars	= -$120		; $28 records {radius, angle, age, rate}
_nw_palBackup	= -$80		; saved g_Pal0Base ($80 bytes)

NoleWarp:
		link	a6,#-$0134
		move.w	d0,_nw_effectId(a6)
		cmpi.b	#$09,d0
		bcc.s	_nwAltCentre
		move.w	#$0120,_nw_centreX(a6)
		move.w	#$00F0,_nw_centreY(a6)
		bra.s	_nwInit
; ---------------------------------------------------------------------------

_nwAltCentre:
		move.w	#$0130,_nw_centreX(a6)
		move.w	#$00C8,_nw_centreY(a6)
		subq.w	#$02,_nw_effectId(a6)

_nwInit:
		lea	(g_Pal0Base).l,a0
		lea	_nw_palBackup(a6),a1
		bsr.w	_copyFullPalette
		lea	_nw_stars(a6),a0
		moveq	#$00000027,d7

; Every star starts with age $FF, so each respawns with random
; parameters on its first update.
_nwStarInit:
		clr.w	(a0)+
		move.b	#$FF,(a0)+
		clr.b	(a0)+
		dbf	d7,_nwStarInit
		cmpi.w	#$0007,_nw_effectId(a6)
		bne.s	_nwWarpIn
		clr.w	_nw_timer(a6)
		clr.w	_nw_starCount(a6)
		move.w	#$001C,_nw_whitenOut(a6)
		clr.w	_nw_whitenIn(a6)
		bsr.w	NoleWarpRampUpParams
		jsr	(InitFadeToBlackParams).l
		moveq	#$0000003C,d0
		jsr	(Sleep).l		  ; Sleeps for d0 frames
		bsr.w	_fadeStepSleep
		bsr.w	_fadeStepSleep
		bsr.w	_fadeStepSleep
		moveq	#$0000003C,d0
		jsr	(Sleep).l		  ; Sleeps for d0 frames
		lea	(g_Pal0Active).l,a0
		lea	(g_Pal0Base).l,a1
		bsr.w	_copyFullPalette
		bra.s	_nwStarTile
; ---------------------------------------------------------------------------

; Warp in: seed the star counter from a constant word in the vector
; table (address 300 decimal - surely a leftover), darken 3 steps,
; keep the darkened first palette line as the ramp-down base and
; blank the whole active palette to white.
_nwWarpIn:
		move.w	#$0168,_nw_timer(a6)
		move.w	(0000000300).w,_nw_starCount(a6)
		clr.w	_nw_whitenOut(a6)
		move.w	#$001C,_nw_whitenIn(a6)
		bsr.w	NoleWarpRampDownParams
		jsr	(InitFadeToBlackParams).l
		moveq	#$00000002,d7
		bsr.w	_darkenPasses
		lea	(g_Pal0Active).l,a0
		lea	(g_Pal0Base).l,a1
		moveq	#$0000000F,d7
		bsr.w	_copyPalette
		lea	(g_Pal0Active).l,a0
		move.w	#$0EEE,d0
		moveq	#$0000003F,d7

_nwWhiteFill:
		move.w	d0,(a0)+
		dbf	d7,_nwWhiteFill
		jsr	(QueueFullPaletteDMA).l
		jsr	(FlushDMACopyQueue).l
		moveq	#$0000003B,d7

_nwPreRoll:
		move.l	d7,-(sp)
		bsr.w	NoleWarpAnimateStars
		move.l	(sp)+,d7
		dbf	d7,_nwPreRoll

; Build the 8x8 sparkle tile (a small diamond) in g_Buffer and DMA
; it to VRAM $2000 (tile $100).
_nwStarTile:
		lea	(g_Buffer).l,a0
		move.l	#$0DDD0000,(a0)+
		move.l	#$DEEED000,(a0)+
		move.l	#$0DDD0000,(a0)+
		moveq	#$00000004,d7

_nwTileClr:
		clr.l	(a0)+
		dbf	d7,_nwTileClr
		lea	(g_Buffer).l,a0
		lea	($00002000).w,a1
		moveq	#$00000020,d0
		moveq	#$00000002,d1
		jsr	(QueueDMAOp).l		  ; d0 - DMA Length
						  ; a0 - DMA Source
						  ; a1 - DMA Copy
		jsr	(FlushDMACopyQueue).l
		cmpi.w	#$0007,_nw_effectId(a6)
		bne.s	_nwShortRun
		move.w	#$0258,d7
		bra.s	_nwMainLoop
; ---------------------------------------------------------------------------

_nwShortRun:
		move.w	#$0168,d7

; One frame: animate the sparkles, run both whiten tickers (only the
; active variant's countdown is non-zero), and step the timer - up
; for the warp out (skipping odd values past $1A4, so the Kazalt
; strobe approaches faster), down to zero for the warp in.
_nwMainLoop:
		movem.w	d7,-(sp)
		jsr	(UpdateControllerInputs).l
		bsr.w	NoleWarpAnimateStars
		bsr.w	NoleWarpInTick
		move.w	#$023A,d0
		bsr.w	NoleWarpOutTick
		jsr	(QueueFullPaletteDMA).l
		move.b	(g_Controller1State).l,d1
		jsr	(EnableDMAQueueProcessing).l
		clr.w	d0
		jsr	(Sleep).l		  ; Sleeps for d0 frames
		cmpi.w	#$0007,_nw_effectId(a6)
		bne.s	_nwTimerDown
		move.w	_nw_timer(a6),d0
		addq.w	#$01,d0
		cmpi.w	#$01A4,d0
		bcs.s	_nwStoreTimer
		addq.w	#$01,d0

_nwStoreTimer:
		move.w	d0,_nw_timer(a6)
		bra.s	_nwNext
; ---------------------------------------------------------------------------

_nwTimerDown:
		subq.w	#$01,_nw_timer(a6)
		bpl.s	_nwNext
		clr.w	_nw_timer(a6)

_nwNext:
		movem.w	(sp)+,d7
		dbf	d7,_nwMainLoop
		lea	_nw_palBackup(a6),a0
		lea	(g_Pal0Base).l,a1
		bsr.w	_copyFullPalette
		cmpi.w	#$0007,_nw_effectId(a6)
		bne.s	_nwFadeIn
		lea	(g_Pal0Active).l,a0
		lea	(g_Pal0Base).l,a1
		bsr.w	_copyFullPalette	  ; leftover: undone at _nwDone
		bra.s	_nwDone
; ---------------------------------------------------------------------------

_nwFadeIn:
		moveq	#$0000001E,d0
		jsr	(Sleep).l		  ; Sleeps for d0 frames
		jsr	(InitFadeFromBlackParams).l
		moveq	#$00000003,d7
		bsr.w	_fadeStep
		jsr	(WaitUntilVBlank).l
		bsr.w	_fadeStepSleep
		bsr.w	_fadeStepSleep
		bsr.w	_fadeStepSleep

_nwDone:
		lea	_nw_palBackup(a6),a0
		lea	(g_Pal0Base).l,a1
		bsr.w	_copyFullPalette
		clr.w	(g_Pal0Active).l
		unlk	a6
		rts

; Copy the full 64-colour palette a0 -> a1 (falls through).
_copyFullPalette:
		moveq	#$0000003F,d7

; Copy d7+1 palette words a0 -> a1.
_copyPalette:
		move.w	(a0)+,(a1)+
		dbf	d7,_copyPalette
		rts

; One darken pass, then sleep 19 frames.
_fadeStepSleep:
		clr.w	d7
		bsr.w	_fadeStep
		moveq	#0000000019,d0
		jsr	(Sleep).l		  ; Sleeps for d0 frames
		rts

; d7+1 darken passes over the base palette, then queue the result.
_fadeStep:
		bsr.w	_darkenPasses
		jsr	(QueueFullPaletteDMA).l
		jmp	(EnableDMAQueueProcessing).l

; Darken the first 16 base colours into the active palette with the
; g_PaletteDarken parameters, advancing the current brightness by
; the fade extent; repeats for d7+1 passes.
_darkenPasses:
		move.l	d7,-(sp)
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		move.w	(g_PaletteDarkenCurrentBrightness).l,d3
		move.w	(g_PaletteDarkenExtent).l,d4
		move.w	(g_PaletteDarkenTargetBrightness).l,d7
		moveq	#$0000000F,d5

_dpColour:
		move.w	(a0)+,d0
		jsr	(DarkenColour).l
		move.w	d0,(a1)+
		dbf	d5,_dpColour
		add.w	d4,d3
		move.w	d3,(g_PaletteDarkenCurrentBrightness).l
		move.l	(sp)+,d7
		dbf	d7,_darkenPasses
		rts

; Kazalt-warp colour flash, run by NoleWarpOutTick
; (visualeffects2.asm) once the warp-out timer passes its threshold:
; every $20 timer ticks restart SND_KazaltWarp, and cycle a pair of
; KazaltWarpPalette colours into active palette entries 13-14.
NoleWarpKazaltFlash:
		move.w	_nw_timer(a6),d0
		andi.w	#$001E,d0
		bne.s	_kfSetColours
		trap	#$00			  ; Trap00Handler
		dc.w SND_KazaltWarp

_kfSetColours:
		lsr.w	#$02,d0
		lsl.w	#$02,d0
		lea	KazaltWarpPalette(pc),a0
		lea	(a0,d0.w),a0
		lea	((g_Pal0Active+$1A)).l,a1
		move.l	(a0),(a1)
		rts

	modend
