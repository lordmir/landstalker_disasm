TitleScreen1	module
; Title screen, part 1 of 3 (split by the incbin'd title assets;
; see titlescreen.asm): screen setup and the build-up driver.
; Parts 2/3 hold the palette effects.

; Loads the three title layers: Title1 (the artwork, tiles from
; 0, plane A), Title2 (the logo, tiles from $100 on palette line
; 1, plane B) and Title3 (the finished title, tiles from $280),
; whose tilemap stays in g_Buffer with its region-specific logo/
; subtitle cells marked as palette line 1. All palettes start
; black; RunTitleSequence then fades the layers in, and
; RevealTitle3 (titlescreen3) stamps the Title3 map over plane A.
DisplayTitleScreen:
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
		lea	($0000C184).l,a1	  ; plane A
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
		move.w	#$2100,d0		  ; tiles from $100, palette 1
		bsr.w	ReindexDecompTilemap
		lea	($0000E084).l,a1	  ; plane B
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
	if REGION=JP
		moveq	#$00000013,d0		  ; palette line 1 on the logo
		moveq	#$0000000E,d1		  ; cells (position and size
		move.w	#$2000,d2		  ; differ per region)
		moveq	#$0000000E,d6
		moveq	#$00000002,d7
	elseif REGION=DE
		moveq	#$00000010,d0		  ; palette line 1 on the logo
		moveq	#$0000000D,d1		  ; cells (position and size
		move.w	#$2000,d2		  ; differ per region)
		moveq	#$00000014,d6
		moveq	#$00000004,d7
	elseif REGION=US_BETA
		moveq	#$00000013,d0		  ; palette line 1 on the logo
		moveq	#$0000000B,d1		  ; cells (position and size
		move.w	#$2000,d2		  ; differ per region)
		moveq	#$0000000C,d6
		moveq	#$00000005,d7
	else
		moveq	#$00000010,d0		  ; palette line 1 on the logo
		moveq	#$0000000D,d1		  ; cells (position and size
		move.w	#$2000,d2		  ; differ per region)
		moveq	#$00000013,d6
		moveq	#$00000004,d7
	endif
		bsr.w	SetTilemapRectPalette
	if REGION=FR
		moveq	#$0000000C,d0		  ; and on the subtitle cells
		moveq	#$00000012,d1
		moveq	#$0000000F,d6
		moveq	#$00000001,d7
	elseif REGION=DE
		moveq	#$0000000E,d0		  ; and on the subtitle cells
		moveq	#$00000013,d1
		moveq	#$0000000E,d6
		moveq	#$00000001,d7
	elseif REGION=US_BETA
		moveq	#$00000013,d0		  ; and on the subtitle cells
		moveq	#$0000000E,d1
		moveq	#$00000011,d6
		moveq	#$00000002,d7
	else
		moveq	#$0000000E,d0		  ; and on the subtitle cells
		moveq	#$00000013,d1
		moveq	#$0000000E,d6
		moveq	#$00000000,d7
	endif
		bsr.w	SetTilemapRectPalette
	if REGION=US_BETA
		moveq	#$0000000E,d0		  ; beta marks one more strip
		moveq	#$00000013,d1
		moveq	#$0000000E,d6
		moveq	#$00000000,d7
		bsr.w	SetTilemapRectPalette
	endif
		moveq	#$0000000A,d0		  ; and the 20 x 2 strip at
		moveq	#$00000016,d1		  ; (10,22)
		moveq	#$00000013,d6
		moveq	#$00000001,d7
		bsr.w	SetTilemapRectPalette
	if REGION=JP
		bsr.w	CopyTitle3BlockJP
	endif
		lea	(g_Pal0Base).l,a0
		moveq	#$0000001F,d7

_clearPal:
		clr.w	(a0)+
		dbf	d7,_clearPal
		jsr	(j_CopyBasePaletteToActivePalette).l
		jsr	(j_EnableInterrupts).l
		jsr	(j_FlushDMACopyQueue).l
		jsr	(j_EnableDisplay).l
		bsr.w	RunTitleSequence
		tst.w	d0
		beq.s	_finalTitle
		bpl.s	_startGame

; Pressed mid-sequence (0) or timed out ($FFFF): show the
; finished title and give the player ~60s to press Start.
_finalTitle:
		bsr.w	CopyTitleMapToPlaneA
		lea	Title3Palette(pc),a0
		jsr	(j_LoadPaletteToRAM).l
		lea	Title3Palette(pc),a0
		jsr	(j_CopyPalette).l
		jsr	(j_CopyBasePaletteToActivePalette).l
		jsr	(j_FlushDMACopyQueue).l
		bsr.w	WaitForStartGame
		move	sr,-(sp)		  ; keep WaitForStartGame's
		jsr	(j_FadeToBlack).l	  ; carry across the fade
		move	(sp)+,ccr
		rts
; ---------------------------------------------------------------------------

; A button was pressed just after the sequence finished: treat
; it as Start.
_startGame:
		jsr	(j_FadeToBlack).l
		ori	#$01,ccr
		rts

; ---------------------------------------------------------------------------

; Waits ~60s (3599 frames) on the finished title, first for all
; buttons to be released, then for Start. Returns carry set if
; Start was pressed, clear on timeout.
WaitForStartGame:
		move.w	#03599,d7

_wsRelease:
		jsr	(j_UpdateControllerInputs).l
		andi.b	#CTRLBF_ANYBUTTON,(g_Controller1State).l
		beq.s	_wsWaitStart
		jsr	(j_WaitUntilVBlank).l
		dbf	d7,_wsRelease
		bra.w	_wsTimeout
; ---------------------------------------------------------------------------

_wsWaitStart:
		jsr	(j_UpdateControllerInputs).l
		tst.b	(g_Controller1State).l
		bmi.s	_wsStart
		jsr	(j_WaitUntilVBlank).l
		dbf	d7,_wsWaitStart

_wsTimeout:
		tst.b	d0			  ; clears carry
		rts
; ---------------------------------------------------------------------------

_wsStart:
		ori	#$01,ccr
		rts

; ---------------------------------------------------------------------------

; The title build-up. A frame counter (-$02) drives the palette
; effects in titlescreen2/3; each switches on once the counter
; passes its start frame (NTSC/PAL differ) and raises a done
; flag when finished:
;   >0    FadeInBluePalette    - artwork sweeps in, blue-tinted
;   >130  FadeInYellowPalette  - logo lettering fades in yellow
;   >220  HandlePaletteScroll  - logo outline colours ramp up
;   >280  HandlePaletteScroll2 - everything collapses to a blue
;                                artwork / yellow logo silhouette
;   >300  FadePal0ToTitle3     - artwork resolves to the finished
;   >310  FadePal1ToTitle3       title palette, and RevealTitle3
;                                stamps the finished tilemap
; Exits on any button press, or $3C frames after the effects all
; finish. Returns d0 = 0 (pressed mid-sequence), 1..$3C (pressed
; in the grace period after it) or $FFFF (timed out).
; Frame: -$02 frame counter, -$04 idle counter, -$06..-$10 step
; counters and -$15..-$1B done flags for the effects, -$1C
; sequence done, -$1D count of colours written this frame
; (nonzero = base palette needs recopying).
RunTitleSequence:
		link	a6,#-$001E
		movea.l	a6,a0
		moveq	#$0000001D,d7
		clr.b	d0

_rsClear:
		move.b	d0,-(a0)
		dbf	d7,_rsClear
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicTown
; ---------------------------------------------------------------------------
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicTitle
; ---------------------------------------------------------------------------

_rsLoop:
		clr.b	-$0000001D(a6)
		jsr	(j_UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d0
		bne.s	_rsExit
	if NTSC
		move.w	#310,d0
	else
		move.w	#280,d0
	endif
		bsr.w	FadePal1ToTitle3
		bsr.w	RevealTitle3
	if NTSC
		move.w	#300,d0
	else
		move.w	#270,d0
	endif
		bsr.w	FadePal0ToTitle3
	if NTSC
		move.w	#280,d0
	else
		move.w	#250,d0
	endif
		bsr.w	HandlePaletteScroll2
	if NTSC
		move.w	#220,d0
	else
		move.w	#176,d0
	endif
		bsr.w	HandlePaletteScroll
	if NTSC
		move.w	#130,d0
	else
		move.w	#120,d0
	endif
		bsr.w	FadeInYellowPalette
		move.w	#$0000,d0
		bsr.w	FadeInBluePalette
		tst.b	-$0000001D(a6)
		beq.s	_rsWait
		jsr	(j_CopyBasePaletteToActivePalette).l
		jsr	(j_EnableDMAQueueProcessing).l

_rsWait:
		jsr	(j_WaitUntilVBlank).l
		addq.w	#$01,-$00000002(a6)
		move.w	#$003C,d0
		bsr.w	_idleCheck
		tst.b	-$0000001C(a6)
		bpl.s	_rsLoop

_rsExit:
		move.w	-$00000004(a6),d0
		unlk	a6
		rts

; ---------------------------------------------------------------------------

; Once every done flag from -$15 to -$1A is set, counts idle
; frames in -$04; past d0 of them, flags the sequence finished
; (-$1C) and leaves -$04 = $FFFF.
_idleCheck:
		tst.b	-$00000015(a6)
		bpl.s	_icDone
		tst.b	-$00000016(a6)
		bpl.s	_icDone
		tst.b	-$00000017(a6)
		bpl.s	_icDone
		tst.b	-$00000018(a6)
		bpl.s	_icDone
		tst.b	-$00000019(a6)
		bpl.s	_icDone
		tst.b	-$0000001A(a6)
		bpl.s	_icDone
		addq.w	#$01,-$00000004(a6)
		cmp.w	-$00000004(a6),d0
		bcc.s	_icDone
		move.b	#$FF,-$0000001C(a6)
		move.w	#$FFFF,-$00000004(a6)

_icDone:
		rts

; ---------------------------------------------------------------------------

; From frame -$06 on, sweeps the 15 artwork colours (palette 0)
; down the TitlePaletteBlueFade ramp, each colour one table entry
; per two frames and trailing the previous colour by three
; entries; a colour sticks at the table's last entry (first word
; = entry count). Done (-$15) once 14 colours have arrived.
FadeInBluePalette:
		tst.b	-$00000015(a6)
		bpl.s	_fbpStarted
		rts
; ---------------------------------------------------------------------------

_fbpStarted:
		cmp.w	-$00000002(a6),d0
		bcs.s	_fbpRun
		rts
; ---------------------------------------------------------------------------

_fbpRun:
		move.w	-$00000006(a6),d0
		ext.l	d0
		lea	((g_Pal0Base+2)).l,a0
		lea	TitlePaletteBlueFade(pc),a1
		clr.b	d6
		moveq	#$0000000E,d7

_fbpLoop:
		bsr.w	_fbpStep
		dbf	d7,_fbpLoop
		cmpi.b	#$0E,d6
		bcs.s	_fbpNext
		move.b	#$FF,-$00000015(a6)

_fbpNext:
		addq.w	#$01,-$00000006(a6)
		rts

; ---------------------------------------------------------------------------

; One colour: nothing until step 6*n, then table entry (step -
; 6*n)/2, writing only on even differences and clamping to the
; table's end (d6 counts arrivals).
_fbpStep:
		subi.l	#$00000006,d0
		bmi.s	_fbpStepDone
		move.l	d0,d1
		divu.w	#$0002,d1
		cmpi.l	#$00010000,d1
		bcc.s	_fbpStepDone
		move.w	(a1),d2
		cmp.w	d1,d2
		bcc.s	_fbpWrite
		move.w	d2,d1
		addq.b	#$01,d6

_fbpWrite:
		add.w	d1,d1
		move.w	$00000002(a1,d1.w),d1
		move.w	d1,(a0)+
		addq.b	#$01,-$0000001D(a6)

_fbpStepDone:
		rts

		modend
