IslandMapRoutines	module
; The island map screen (via j_DisplayIslandMap, d0 = mode):
;   0  animate the boat route dots (departure, CSA_00D2)
;   1  pre-plant the route and show it complete (arrival, CSA_00D3)
;   2  static view until a button press (no caller uses it)
;   3  Friday flies a shrinking orbit over the current town while
;      its name blinks beside her (the shops' "I'll show you the
;      map"); a button press spirals her back out
; The screen: foreground/background map images on planes A/B, the
; current location's name rendered as outlined glyphs (tiles $D+),
; and sprites for the route dots / Friday. The caller's palette is
; saved in the frame and restored on exit.
;
; Stack frame:
;   -$80..-$02 saved palette      -$82 mode
;   -$84 location index           -$85 held-buttons byte
;   -$88 route waypoint index     -$8A dot frame index
;   -$8C dot delay / orbit angle (bit 2 of its low byte -$8B flaps
;        Friday's wings)          -$8E orbit radius
;   -$8F flight phase flags (bit 0/1 fade-in running/done, 2/3 the
;        same for fade-out)       -$92 fade step counter
;   -$96 done flag                -$98 frame tick
DisplayIslandMap:
		link	a6,#-$0098
		andi.w	#$0003,d0
		move.w	d0,-$00000082(a6)
		clr.w	-$00000088(a6)
		clr.w	-$0000008A(a6)
		clr.w	-$0000008C(a6)
		clr.w	-$00000098(a6)
		clr.w	-$00000096(a6)
		lea	(g_Pal0Base).l,a0	  ; save the caller's palette
		lea	-$00000080(a6),a1
		move.w	#$003F,d7

_savePal:
		move.w	(a0)+,(a1)+
		dbf	d7,_savePal
		jsr	(j_FadeOutToDarkness).l
		jsr	(j_EnableVDPSpriteUpdate).l
		lea	MapDots(pc),a0
		lea	(g_Blockset).l,a1
		lea	($00000020).w,a2
		jsr	(j_DecompressAndQueueGfxCopy).l
		jsr	(j_FlushDMACopyQueue).l
		lea	MapFriday(pc),a0
		lea	((g_Blockset+$80)).l,a1
		lea	($000000A0).w,a2
		jsr	(j_DecompressAndQueueGfxCopy).l
		jsr	(j_EnableDMAQueueProcessing).l
		bsr.w	_drawLocationName
		bsr.w	_outlineName
		jsr	(j_WaitUntilVBlank).l
		lea	(g_Buffer).l,a0		  ; outlined name glyphs to the
		lea	($000001A0).w,a1	  ; VRAM $1A0 (tiles $D+)
		move.w	($00000140).w,d0	  ; DMA length: word read from
		moveq	#$00000002,d1		  ; $140 (header name padding,
		jsr	(j_QueueDMAOp).l	  ; $2020) - meant #$0140?
		jsr	(j_FlushDMACopyQueue).l
		lea	IslandMapFg(pc),a0
		lea	(g_Blockset).l,a1
		lea	($00001000).w,a2
		jsr	(j_DecompressAndQueueGfxCopy).l
		jsr	(j_FlushDMACopyQueue).l
		lea	IslandMapBg(pc),a0
		lea	(g_Blockset).l,a1
		lea	($00006000).w,a2
		jsr	(j_DecompressAndQueueGfxCopy).l
		jsr	(j_FlushDMACopyQueue).l
		lea	IslandMapFgMap(pc),a0
		lea	(g_Buffer).l,a1
		bsr.w	DecompTilemap
		lea	(g_InventoryTilemap).l,a1
		move.w	#$0000,d4
		move.w	#$0080,d5
		bsr.w	_reindexTilemap
		lea	(g_InventoryTilemap).l,a0
		lea	($0000C180).l,a1	  ; foreground image on plane A
		move.w	#$0640,d0
		move.w	#$0002,d1
		jsr	(j_QueueDMAOp).l
		jsr	(j_FlushDMACopyQueue).l
		lea	IslandMapBgMap(pc),a0
		lea	(g_Buffer).l,a1
		bsr.w	DecompTilemap
		lea	((g_ForegroundBlocks+$17E)).l,a1
		move.w	#$2000,d4		  ; palette line 1
		move.w	#$0300,d5
		bsr.w	_reindexTilemap
		lea	((g_ForegroundBlocks+$17E)).l,a0
		lea	($0000E180).l,a1	  ; background image on plane B
		move.w	#$0640,d0
		move.w	#$0002,d1
		jsr	(j_QueueDMAOp).l
		jsr	(j_FlushDMACopyQueue).l
		jsr	(j_DisableVDPSpriteUpdate).l
		clr.w	d6
		jsr	(j_FillHScrollData).l
		jsr	(j_FillVSRAM).l
		jsr	(j_FillHScrollDataOffset1).l
		jsr	(j_FillVSRAMOffset1).l
		jsr	(j_ClearVDPSpriteTable).l
		bsr.w	_preplantRoute
		lea	IslandMapFgPal(pc),a0
		lea	(g_Pal0Base).l,a1
		moveq	#$0000000F,d7

_loadPal:
		move.l	(a0)+,(a1)+
		dbf	d7,_loadPal
		jsr	(j_LoadInitialPlayerPalette).l
		jsr	(j_CopyBasePaletteToActivePalette).l
		lea	(g_Pal0Active).l,a0	  ; start from black
		moveq	#$0000000F,d7

_blackPal:
		clr.l	(a0)+
		dbf	d7,_blackPal
		clr.w	d0
		move.b	#$EF,d1
		jsr	(j_MaskVDPReg).l	  ; HInt off
		move.w	-$00000082(a6),d0
		lea	_modeHandlers(pc),a0
		lsl.w	#$02,d0
		movea.l	(a0,d0.w),a0
		jsr	(a0)
		jsr	(j_ClearVDPSpriteTable).l
		lea	(g_Pal0Base).l,a0
		moveq	#$00000039,d7

_clearPal:
		clr.w	(a0)+
		dbf	d7,_clearPal
		jsr	(j_CopyBasePaletteToActivePalette).l
		jsr	(j_FlushDMACopyQueue).l
		lea	-$00000080(a6),a0	  ; restore the caller's palette
		lea	(g_Pal0Base).l,a1
		move.w	#$003F,d7

_restorePal:
		move.w	(a0)+,(a1)+
		dbf	d7,_restorePal
		bsr.w	_busyWait
		clr.l	d0
		move.b	#$10,d1
		jsr	(j_OrVDPReg).l		  ; HInt back on
		unlk	a6
		rts

_busyWait:
		move.w	#$1000,d0

_bwLoop:
		nop
		dbf	d0,_bwLoop
		rts

_modeHandlers:	dc.l _modeBoatRoute
		dc.l _modeBoatRoute
		dc.l _modeStill
		dc.l _modeFridayFlight

; Mode 2: just fade in and hold until a button press.
_modeStill:
		jsr	(j_FadeInFromDarkness).l
		jsr	(j_WaitForNextButtonPress).l
		jsr	(j_FadeOutToDarkness).l
		rts

; Mode 3: Friday orbits the current town. The orbit radius shrinks
; from $C8 towards 8 while the screen fades in; a fresh button
; press (once faded in) starts the fade back out and the radius
; grows again. Ends when all four fade phases are done and the
; radius is back at full.
_modeFridayFlight:
		jsr	(j_InitFadeFromBlackParams).l
		move.b	#$01,-$0000008F(a6)
		move.w	#$001C,-$00000092(a6)
		jsr	(j_UpdateControllerInputs).l
		move.b	(g_Controller1State).l,-$00000085(a6)
		move.w	#$00C8,-$0000008E(a6)
		clr.w	-$00000096(a6)
		move.w	#$0100,d6
		jsr	(j_GenerateRandomNumber).l
		move.w	d7,-$0000008C(a6)	  ; random start angle

_ffLoop:
		jsr	_suppressHeldInputs(pc)
		nop
		tst.b	(g_Controller1State).l
		beq.s	_ffAnimate
		bsr.w	_ffStartExit

_ffAnimate:
		bsr.w	_ffRadius
		bsr.w	_ffDrawSprites
		bsr.w	_ffFadeIn
		bsr.w	_ffFadeOut
		addq.w	#$01,-$00000098(a6)
		jsr	(j_WaitUntilVBlank).l
		move.b	-$0000008F(a6),d0
		andi.b	#$0F,d0
		cmpi.b	#$0F,d0
		bne.s	_ffLoop
		tst.w	-$00000096(a6)
		beq.s	_ffLoop
		rts

; Zeroes the pad state while anything is still held from the
; previous frame, so only fresh presses reach the flight loop.
_suppressHeldInputs:
		jsr	(j_UpdateControllerInputs).l
		lea	(g_Controller1State).l,a0
		lea	-$00000085(a6),a1
		tst.b	(a0)
		bne.s	_shiHeld
		clr.b	(a1)
		rts

_shiHeld:
		tst.b	(a1)
		bne.s	_shiClear
		rts

_shiClear:
		clr.b	(a0)
		rts

; A press only registers once the fade-in has finished (phase bits
; = %0011): start the fade-out.
_ffStartExit:
		move.b	-$0000008F(a6),d0
		andi.b	#$0F,d0
		cmpi.b	#$03,d0
		beq.s	_fseStart
		rts

_fseStart:
		bset	#$02,-$0000008F(a6)
		move.w	#$001C,-$00000092(a6)
		jsr	(j_InitFadeToBlackParams).l
		rts

; Orbit radius: growing +4 back to $C8 during the fade-out (done
; flag once it arrives), otherwise shrinking towards 8 - fast (-4)
; above $14, slow (-2) above 8.
_ffRadius:
		move.w	-$0000008E(a6),d0
		btst	#$02,-$0000008F(a6)
		beq.w	_frShrink
		addq.w	#$04,d0
		cmpi.w	#$00C8,d0
		bcs.s	_frGrow
		move.w	#$FFFF,-$00000096(a6)

_frGrow:
		move.w	d0,-$0000008E(a6)
		rts

_frShrink:
		cmpi.w	#$0009,d0
		bcc.s	_frMid
		moveq	#$00000008,d0
		bra.s	_frSet

; Unreachable leftover.
		rts

_frMid:
		cmpi.w	#$0014,d0
		bcc.s	_frFast
		subq.w	#$02,d0
		bra.s	_frSet

_frFast:
		subq.w	#$04,d0

_frSet:
		move.w	d0,-$0000008E(a6)
		rts

; Advances the palette fade one step on every fourth call.
_fadeTick:
		subq.w	#$01,-$00000092(a6)
		move.w	-$00000092(a6),d0
		andi.b	#$03,d0
		beq.s	_ftStep
		rts

_ftStep:
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		move.w	#$001F,d5
		jsr	(j_DarkenPalette).l
		rts

; While the fade-in phase runs (bits %01), tick it; mark it done
; (bit 1) when the counter expires.
_ffFadeIn:
		move.b	-$0000008F(a6),d0
		andi.b	#$03,d0
		cmpi.b	#$01,d0
		beq.s	_ffiTick
		rts

_ffiTick:
		bsr.s	_fadeTick
		tst.w	-$00000092(a6)
		bne.s	_ffiDone
		bset	#$01,-$0000008F(a6)

_ffiDone:
		rts

; The same for the fade-out phase (bits 2/3).
_ffFadeOut:
		move.b	-$0000008F(a6),d0
		andi.b	#$0C,d0
		cmpi.b	#$04,d0
		beq.s	_ffoTick
		rts

_ffoTick:
		bsr.s	_fadeTick
		tst.w	-$00000092(a6)
		bne.s	_ffoDone
		bset	#$03,-$0000008F(a6)

_ffoDone:
		rts

; Friday (VDP sprite 16, wings flapping with angle bit 2) on her
; orbit, plus the blinking town name sprites beside her.
_ffDrawSprites:
		lea	(g_VDPSpr16_Y).l,a1
		move.w	#$4005,d0
		btst	#$02,-$0000008B(a6)
		beq.s	_fdsTile
		addq.w	#$04,d0

_fdsTile:
		move.w	d0,$00000004(a1)
		move.b	#$05,$00000002(a1)
		move.w	-$00000084(a6),d7
		lsl.w	#$02,d7
		lea	MapFridayCoords(pc),a0
		bsr.w	_ffOrbitPos
		bra.w	_ffNameSprites

; Places Friday at the orbit position: x = cos(angle*4) * radius +
; centre x, y = sin(angle*4) * radius/2 + centre y (a squashed
; ellipse).
_ffOrbitPos:
		move.w	-$0000008C(a6),d0
		lsl.w	#$02,d0
		jsr	(j_Cosine).l
		move.w	-$0000008E(a6),d1
		mulu.w	d0,d1
		lsr.l	#$08,d1
		add.w	(a0,d7.w),d1
		move.w	d1,$00000006(a1)
		move.w	-$0000008C(a6),d0
		lsl.w	#$02,d0
		jsr	(j_Sine).l
		move.w	-$0000008E(a6),d1
		lsr.w	#$01,d1
		mulu.w	d0,d1
		lsr.l	#$08,d1
		add.w	$00000002(a0,d7.w),d1
		move.w	d1,(a1)
		rts

; The town name as 4-cell-wide text sprites (tiles $D/$15 - the
; outlined glyphs; the German build adds a third sprite at $1D for
; its longer names), blinking: hidden while angle mod 64 is in the
; top quarter. Also advances the orbit angle.
_ffNameSprites:
		move.w	-$0000008C(a6),d2
		andi.w	#$003F,d2
		cmpi.w	#$0030,d2
		bcc.s	_fnBlink
		clr.l	d2
		bra.s	_fnDraw

_fnBlink:
		moveq	#$FFFFFFFF,d2

_fnDraw:
		lea	MapTextCoords(pc),a0
		move.w	-$00000084(a6),d0
		lsl.w	#$02,d0
		lea	$00000008(a1),a1
		move.w	#$000D,d1
		move.w	d1,$00000004(a1)
		move.b	#$0D,$00000002(a1)
		move.w	(a0,d0.w),d1
		move.w	d1,$00000006(a1)
		move.w	$00000002(a0,d0.w),d1
		tst.w	d2
		bne.s	_fnHide1
		move.w	d1,(a1)
		bra.s	_fnNext1

_fnHide1:
		move.w	#$FFFF,(a1)

_fnNext1:
		lea	8(a1),a1
		move.w	#$15,d1
		move.w	d1,$4(a1)
		move.b	#$D,$2(a1)
		move.w	(a0,d0.w),d1
		addi.w	#$20,d1
		move.w	d1,$00000006(a1)
		move.w	$00000002(a0,d0.w),d1
		tst.w	d2
	if REGION=DE
		bne.s	_fnHide2
		move.w	d1,(a1)
		bra.s	_fnNext2

_fnHide2:
		move.w	#$FFFF,(a1)

_fnNext2:
		lea	$10(a1),a1
		move.w	#$1D,d1
		move.w	d1,4(a1)
		move.b	#9,2(a1)
		move.w	(a0,d0.w),d1
		addi.w	#$40,d1
		move.w	d1,$00000006(a1)
		move.w	$00000002(a0,d0.w),d1
		tst.w	d2
	endif
		bne.s	_fnHideLast
		move.w	d1,(a1)
		bra.s	_fnDone

_fnHideLast:
		move.w	#$FFFF,(a1)

_fnDone:
		addq.w	#$01,-$0000008C(a6)
		rts

; Per-location {x, y} pairs: Friday's orbit centre and the name
; sprites' position.
MapFridayCoords:dc.w $0178,$00C8		  ; MASSAN
		dc.w $0198,$00F0		  ; GUMI
		dc.w $0168,$0110		  ; RYUMA
		dc.w $0128,$00E8		  ; MERCATOR
		dc.w $00C8,$0100		  ; VERLA
		dc.w $00C0,$00C0		  ; DESTEL
MapTextCoords:	dc.w $0188,$00D8		  ; MASSAN
		dc.w $0180,$00FC		  ; GUMI
		dc.w $0170,$0130		  ; RYUMA
		dc.w $0110,$00D8		  ; MERCATOR
		dc.w $00C0,$00F4		  ; VERLA
		dc.w $00B0,$00DA		  ; DESTEL

; Renders the current location's name (GetIslandMapLocation: a2 =
; string, d7 = length, d6 = location index -> -$84; negative =
; nothing to draw) as glyphs in g_ScreenBuffer.
_drawLocationName:
		move.w	#$0001,(g_TextCursorX).l
		clr.b	(g_TextCursorY).l
		move.b	#$01,(g_TextColour).l
		lea	(g_ScreenBuffer).l,a1
		moveq	#$00000000,d1
		move.w	#$027F,d7

_dlnClear:
		move.l	d1,(a1)+
		dbf	d7,_dlnClear
		jsr	(j_GetIslandMapLocation).l
		ext.w	d6
		move.w	d6,-$00000084(a6)
		bpl.s	_dlnGlyph
		rts

_dlnGlyph:
		clr.w	d0
		move.b	(a2)+,d0
		movem.l	d7/a2,-(sp)
		jsr	(j_DrawTextGlyph).l
		movem.l	(sp)+,d7/a2
		dbf	d7,_dlnGlyph
		rts

; Builds the outlined copy of the rendered name in g_Buffer: every
; glyph pixel ORs the outline colour ($F) into the neighbouring
; nibbles via the _spread helpers (left/right within the byte pair,
; +-$3D crossing a tile column, and the rows above/below at +-4),
; then the original pixels are merged on top of the outline. The
; German build works on a larger canvas for its longer names.
_outlineName:
		lea	(g_Buffer).l,a5
		movea.l	a5,a1
		clr.l	d0
	if REGION=DE
		move.w	#$00C0,d7
	else
		move.w	#$0080,d7
	endif

_onClear:
		move.l	d0,(a1)+
		dbf	d7,_onClear
		moveq	#$0000000F,d0		  ; outline colour, low nibble
		move.b	d0,d1
		lsl.b	#$04,d1			  ; and high nibble
		lea	(g_ScreenBuffer).l,a0
		movea.l	a5,a1
		move.w	#$0080,d7

_onScan:
		bsr.w	_peekHi
		beq.s	_onB1Lo
		bsr.w	_spreadHiEdge

_onB1Lo:
		bsr.w	_peekLo
		beq.s	_onB2
		bsr.w	_spreadLo

_onB2:
		addq.l	#$01,a1
		bsr.w	_peekHi
		beq.s	_onB2Lo
		bsr.w	_spreadHi

_onB2Lo:
		bsr.w	_peekLo
		beq.s	_onB3
		bsr.w	_spreadLo

_onB3:
		addq.l	#$01,a1
		bsr.w	_peekHi
		beq.s	_onB3Lo
		bsr.w	_spreadHi

_onB3Lo:
		bsr.w	_peekLo
		beq.s	_onB4
		bsr.w	_spreadLo

_onB4:
		addq.l	#$01,a1
		bsr.w	_peekHi
		beq.s	_onB4Lo
		bsr.w	_spreadHi

_onB4Lo:
		bsr.w	_peekLo
		beq.s	_onNext
		bsr.w	_spreadLoEdge

_onNext:
		addq.l	#$01,a1
		dbf	d7,_onScan
		lea	(g_ScreenBuffer).l,a0	  ; merge the glyph pixels over
		movea.l	a5,a1			  ; the outline
	if REGION=DE
		move.w	#$02FF,d7
	else
		move.w	#$01FF,d7
	endif
		moveq	#$0000000F,d1
		moveq	#$FFFFFFF0,d2

_onMerge:
		move.b	(a0),d0
		and.b	d2,d0
		beq.s	_onMergeLo
		and.b	d1,(a1)
		or.b	d0,(a1)

_onMergeLo:
		move.b	(a0)+,d0
		and.b	d1,d0
		beq.s	_onMergeNext
		and.b	d2,(a1)
		or.b	d0,(a1)

_onMergeNext:
		addq.l	#$01,a1
		dbf	d7,_onMerge
		rts

; d2 = the source pixel in the high / low nibble (peekLo advances).
_peekHi:
		move.b	(a0),d2
		andi.b	#$F0,d2
		rts

_peekLo:
		move.b	(a0)+,d2
		andi.b	#$0F,d2
		rts

; Spread the outline colour around a set pixel: into the byte to
; the left/right (the Edge variants cross a tile column at +-$3D),
; always finishing with the rows above and below (+-4).
_spreadHi:
		or.b	d0,-$00000001(a1)
		or.b	d0,(a1)
		bra.s	_spreadVert

_spreadLo:
		or.b	d1,(a1)
		or.b	d1,$00000001(a1)
		bra.s	_spreadVert

_spreadHiEdge:
		or.b	d0,-$0000003D(a1)
		or.b	d0,(a1)
		bra.s	_spreadVert

_spreadLoEdge:
		or.b	d1,(a1)
		or.b	d1,$0000003D(a1)

_spreadVert:
		or.b	d1,-$00000004(a1)
		or.b	d1,$00000004(a1)
		rts

; Modes 0/1: fade in and run the route-dot animation until the
; voyage's last waypoint (7) or the table's end, then fade out.
_modeBoatRoute:
		jsr	(j_FadeInFromDarkness).l

_brLoop:
		bsr.w	_dotCountdown
		jsr	(j_EnableDMAQueueProcessing).l
		addq.w	#$01,-$00000098(a6)
		jsr	(j_WaitUntilVBlank).l
		cmpi.w	#$0007,-$00000088(a6)
		beq.w	_brDone
		tst.w	-$00000096(a6)
		beq.s	_brLoop

_brDone:
		jsr	(j_FadeOutToDarkness).l
		rts

; Mode 1: run 36 dot-animation steps up front so the route is
; already drawn when the screen fades in.
_preplantRoute:
		cmpi.w	#$0001,-$00000082(a6)
		beq.s	_ppRun
		rts

_ppRun:
		move.w	#$0023,d7

_ppStep:
		clr.w	-$0000008C(a6)
		move.l	d7,-(sp)
		bsr.w	_nextDotFrame
		move.l	(sp)+,d7
		dbf	d7,_ppStep
		rts

; Steps the current dot's delay; on expiry, its next frame.
_dotCountdown:
		subq.w	#$01,-$0000008C(a6)
		bmi.s	_nextDotFrame
		rts

; Advances the route animation one step: the current waypoint's dot
; sprite takes the next {tile, duration} pair from _dotFrames; the
; $FF terminator completes the dot and moves on to the next
; waypoint (recursing to start it immediately).
_nextDotFrame:
		move.w	-$0000008A(a6),d0
		addq.w	#$01,-$0000008A(a6)
		lea	_dotFrames(pc),a0
		add.w	d0,d0
		clr.w	d1
		move.b	(a0,d0.w),d1
		bpl.s	_ndfSprite
		clr.w	-$0000008A(a6)
		bsr.w	_advanceWaypoint
		tst.w	-$00000096(a6)
		beq.s	_ndfAgain
		rts

_ndfAgain:
		bra.s	_nextDotFrame

_ndfSprite:
		lea	(g_VDPSpr00_Y).l,a1
		move.w	-$00000088(a6),d7
		lsl.w	#$03,d7
		lea	(a1,d7.w),a1
		addi.w	#$2001,d1
		move.w	d1,$00000004(a1)	  ; Tiles
		clr.w	d1
		move.b	$00000001(a0,d0.w),d1
		move.w	d1,-$0000008C(a6)
		lea	_routeWaypoints(pc),a0
		move.w	-$00000088(a6),d0
		add.w	d0,d0
		lea	(a0,d0.w),a0
		clr.w	d1
		move.b	(a0),d1
		addi.w	#$0080,d1
		move.w	d1,$00000006(a1)	  ; X
		clr.w	d1
		move.b	$00000001(a0),d1
		addi.w	#$0090,d1
		move.w	d1,(a1)			  ; Y
		clr.b	$00000002(a1)		  ; Size/Link
		move.w	#$0001,d0
		rts

; Next waypoint; the {0,0} table terminator wraps back to the start
; and raises the done flag.
_advanceWaypoint:
		lea	_routeWaypoints(pc),a5

_awNext:
		addq.w	#$01,-$00000088(a6)
		move.w	-$00000088(a6),d7
		add.w	d7,d7
		tst.b	(a5,d7.w)
		beq.s	_awWrap
		rts

_awWrap:
		move.w	#$FFFF,-$00000088(a6)
		move.w	#$FFFF,-$00000096(a6)
		bra.s	_awNext

; The dot animation: {tile offset, duration} pairs, $FF = done.
_dotFrames:	dc.b $00, $04
		dc.b $01, $06
		dc.b $02, $08
		dc.b $03, $14
		dc.b $FF, $00
; Route waypoint {x, y} pairs (sprite position less $80/$90);
; {0,0} terminates. The mode-0/1 voyage stops at waypoint 7 - the
; later entries are never reached.
_routeWaypoints:dc.b $AC, $7B
		dc.b $B4, $83
		dc.b $BA, $8C
		dc.b $BB, $99
		dc.b $B4, $A3
		dc.b $AB, $AB
		dc.b $9D, $AD
		dc.b $90, $AD
		dc.b $7F, $AB
		dc.b $73, $A6
		dc.b $66, $A1
		dc.b $53, $9B
		dc.b $46, $93
		dc.b $3B, $8B
		dc.b $00, $00

; Copies the decompressed tilemap (byte header: width, height) to
; a1 with a $80-byte row stride, rebasing each cell's tile id by
; d5 - $100 and OR-ing in the d4 attribute bits.
_reindexTilemap:
		lea	(g_Buffer).l,a0
		movea.l	a1,a2
		move.b	(a0)+,d0
		ext.w	d0
		subq.w	#$01,d0
		move.b	(a0)+,d1
		ext.w	d1
		subq.w	#$01,d1

_rtRow:
		movea.l	a1,a2
		move.w	d0,d2

_rtCell:
		move.w	(a0)+,d3
		andi.w	#$03FF,d3
		subi.w	#$0100,d3
		add.w	d5,d3
		or.w	d4,d3
		move.w	d3,(a2)+
		dbf	d2,_rtCell
		lea	$00000080(a1),a1
		dbf	d1,_rtRow
		rts

		modend
