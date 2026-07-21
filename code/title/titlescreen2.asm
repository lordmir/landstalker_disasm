TitleScreen2	module
; Title screen, part 2 of 3: two of the build-up palette effects
; driven by RunTitleSequence (titlescreen1). Each does nothing
; until its done flag is clear and the frame counter (-$02) has
; passed its start frame, then advances its own step counter.

; Logo-outline ramp (done flag -$16, step counter -$08): brings
; the ten palette-1 colours from $C up along a fixed +$22 per
; step toward $44, one _hpsStep each. Done once all ten reach it.
HandlePaletteScroll:
		tst.b	-$00000016(a6)
		bpl.s	_hpsStarted
		rts
; ---------------------------------------------------------------------------

_hpsStarted:
		cmp.w	-$00000002(a6),d0
		bcs.s	_hpsRun
		rts
; ---------------------------------------------------------------------------

_hpsRun:
		move.w	-$00000008(a6),d0
		ext.l	d0
		lea	((g_Pal1Base+$C)).l,a0
		clr.b	d6
		moveq	#$00000009,d7

_hpsLoop:
		bsr.w	_hpsStep
		dbf	d7,_hpsLoop
		move.l	d6,d7
		move.b	-$00000016(a6),d6
		ext.w	d6
		neg.w	d6
		cmpi.b	#$09,d7
		bcs.s	_hpsNext
		move.b	#$FF,-$00000016(a6)

_hpsNext:
		addq.w	#$01,-$00000008(a6)
		rts

; ---------------------------------------------------------------------------

; One colour: bumps the R and G nibbles by 2 (+$22) toward $44,
; clamping there and counting arrivals in d6 (also latched into
; the done flag). Nothing until step 4/5 (region-dependent).
_hpsStep:
	if ((REGION=UK)!(REGION=DE))
		subi.l	#5,d0
	else
		subi.l	#4,d0
	endif
		bmi.s	_hpsStepDone
		andi.w	#$FFFC,d0
		move.w	(a0),d1
		addi.w	#$0022,d1
		cmpi.w	#$0044,d1
		bcs.s	_hpsStepWrite
		move.w	#$0044,d1
		addq.b	#$01,d6
		move.b	d6,-$00000016(a6)

_hpsStepWrite:
		move.w	d1,(a0)+
		addq.b	#$01,-$0000001D(a6)

_hpsStepDone:
		rts

; ---------------------------------------------------------------------------

; Logo-lettering fade-in (done flag -$17, step counter -$0A):
; every 8th step, walks the five palette-1 colours from $2 up the
; TitlePaletteYellowFade ramp via StepPaletteColourUp. Done once
; 15 channel-arrivals have accumulated.
FadeInYellowPalette:
		tst.b	-$00000017(a6)
		bpl.s	_fiyStarted
		rts
; ---------------------------------------------------------------------------

_fiyStarted:
		cmp.w	-$00000002(a6),d0
		bcs.s	_fiyRun
		rts
; ---------------------------------------------------------------------------

_fiyRun:
		move.w	-$0000000A(a6),d0
		ext.l	d0
		lea	((g_Pal1Base+2)).l,a0
		lea	TitlePaletteYellowFade(pc),a1
		clr.b	d6
		andi.b	#$07,d0
		bne.s	_fiyNext
		moveq	#$00000004,d7

_fiyLoop:
		bsr.w	StepPaletteColourUp
		dbf	d7,_fiyLoop
		addq.b	#$01,-$0000001D(a6)
		cmpi.b	#$0F,d6
		bcs.s	_fiyNext
		move.b	#$FF,-$00000017(a6)

_fiyNext:
		addq.w	#$01,-$0000000A(a6)
		rts

; ---------------------------------------------------------------------------

; Steps colour (a0) one notch toward target (a1)+: each of the R,
; G, B nibbles rises by 2, clamping at the target, and d6 counts
; how many channels have reached it. Writes the blended colour
; back and advances a0.
StepPaletteColourUp:
		move.w	#$000E,d5
		move.w	(a0),d1
		move.w	d1,d2
		move.w	d1,d3
		move.w	(a1),d4
		and.w	d5,d1
		and.w	d5,d4
		addq.w	#$02,d1
		cmp.w	d4,d1
		bcs.s	_spuGreen
		move.w	d4,d1
		addq.b	#$01,d6

_spuGreen:
		lsl.w	#$04,d5
		move.w	(a1),d4
		and.w	d5,d2
		and.w	d5,d4
		addi.w	#$0020,d2
		cmp.w	d4,d2
		bcs.s	_spuBlue
		move.w	d4,d2
		addq.b	#$01,d6

_spuBlue:
		lsl.w	#$04,d5
		move.w	(a1)+,d4
		and.w	d5,d3
		and.w	d5,d4
		addi.w	#$0200,d3
		cmp.w	d4,d3
		bcs.s	_spuWrite
		move.w	d4,d3
		addq.b	#$01,d6

_spuWrite:
		or.w	d2,d1
		or.w	d3,d1
		move.w	d1,(a0)+
		rts

		modend
