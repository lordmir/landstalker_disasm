ScriptVisualFx	module
; Script-driven screen effects: a raster engine (per-line vertical
; scroll and display blanking over the 160-line play area) and a
; palette engine (per-channel add/subtract with clamping, optionally
; bounded by a saved palette).
;
; _saveVDPState snapshots VDP regs 1/$B/$F, the palette, and the
; base H/V scroll into the g_FxSaved* block, flattens the scroll
; planes and switches to H-scroll mode d0; _restoreVDPState puts it
; all back. _updateFxFrame runs one frame of an effect, its d0 flag
; bits selecting the work: 0 = queue the H-scroll table, 1 = queue
; VSRAM, 4 = refresh the palette, 2 = race the beam writing per-line
; VSRAM offsets from g_FxLineOffsets, 3 = per-line display blanking
; from the g_FxLineMask bitmask.

ScriptFadeToBlack:
		movem.l	d0-a6,-(sp)
		jsr	(j_FadeToBlack).l
		movem.l	(sp)+,d0-a6
		rts

ScriptFadeFromBlack:
		movem.l	d0-a6,-(sp)
		jsr	(j_FadeFromBlack).l
		movem.l	(sp)+,d0-a6
		rts

; ---------------------------------------------------------------------------
; Unreachable leftover: a raster effect rolling a constant offset
; through every line of the play area.
		movem.l	d0-d3/a0,-(sp)
		move.w	#$FFFF,d0
		bsr.w	_initLineMask
		bsr.w	_initLineOffsets
		clr.w	d0
		bsr.w	_saveVDPState
		clr.w	d1
		move.w	#$009F,d2

_orphan1Frame:
		lea	(g_FxLineOffsets).l,a0
		move.w	d1,d3

_orphan1Fill:
		move.w	d1,(a0)+
		dbf	d3,_orphan1Fill
		move.w	#$0004,d0
		bsr.w	_updateFxFrame
		addq.w	#$01,d1
		dbf	d2,_orphan1Frame
		bsr.w	_restoreVDPState
		movem.l	(sp)+,d0-d3/a0
		rts
; ---------------------------------------------------------------------------
; Unreachable leftover.
		bra.w	SpellBook
; ---------------------------------------------------------------------------
; Unreachable leftover: squashes the play area vertically (per-line
; VSRAM offsets scaled down each frame), then crushes it away by
; blanking lines from both ends with _hideFxLine.
		movem.l	d0-a1,-(sp)
		move.w	#$FFFF,d0
		bsr.w	_initLineMask
		bsr.w	_initLineOffsets
		clr.w	d0
		bsr.w	_saveVDPState
		move.w	#$003F,d1

_orphan2Frame:
		lea	(g_FxSavedReg1).l,a0
		move.w	#$009F,d2

_orphan2Line:
		move.w	d2,d3
		subi.w	#$0050,d3
		muls.w	d1,d3
		asr.w	#$06,d3
		addi.w	#$0050,d3
		move.w	d3,-(a0)
		dbf	d2,_orphan2Line
		move.w	#$0004,d0
		bsr.w	_updateFxFrame
		dbf	d1,_orphan2Frame
		move.w	#$0003,d0
		jsr	_setHScrollMode(pc)
		nop
		lea	((g_HorizontalScrollData+$60)).l,a0
		clr.w	d1
		move.w	(g_FxBaseHScroll).l,d2
		move.l	#$009F0000,d7
		move.w	#$004F,d3

_orphan2Crush:
		movea.l	a0,a1
		move.w	#$0050,d4
		move.w	#$009F,d5

_orphan2Scroll:
		move.w	d4,d6
		muls.w	d1,d6
		asr.w	#$06,d6
		add.w	d2,d6
		move.w	d6,(a1)+
		move.w	d6,(a1)+
		subq.w	#$01,d4
		dbf	d5,_orphan2Scroll
		addq.w	#$03,d1
		move.w	d7,d0
		bsr.w	_hideFxLine
		addq.w	#$01,d7
		swap	d7
		move.w	d7,d0
		bsr.w	_hideFxLine
		subq.w	#$01,d7
		swap	d7
		move.w	#$000D,d0
		bsr.w	_updateFxFrame
		dbf	d3,_orphan2Crush
		bsr.w	_restoreVDPState
		movem.l	(sp)+,d0-a1
		rts

; The screen ripple from the Spell Book animation sequence: build a
; decaying double-sine waveform in g_Buffer, pulse the palette up,
; then scroll the waveform through the per-line H-scroll table so
; the play area ripples for $3C0 frames, and settle the palette
; back down.
SpellBook:
		movem.l	d0-a2,-(sp)
		lea	(g_Buffer).l,a0
		clr.w	d0
		move.w	#$045F,d1

_sbClear:
		move.w	d0,(a0)+
		dbf	d1,_sbClear
		lea	((g_Buffer+$140)).l,a0
		lea	_spellBookWave(pc),a1
		movem.w	(a1)+,d1-d7
		bsr.w	_buildWaveTable
		movem.w	(a1)+,d5/d7
		bsr.w	_buildWaveTable
		move.w	#$0003,d0
		bsr.w	_saveVDPState
		move.l	#$00010001,d1
		moveq	#$00000001,d2
		moveq	#$00000001,d3
		moveq	#$00000007,d4
		bsr.w	_palAdd
		lea	(g_Buffer).l,a0
		move.w	#$03BF,d1

_sbFrame:
		movea.l	a0,a1
		lea	((g_HorizontalScrollData+$60)).l,a2
		move.w	#$00A0,d2

_sbLine:
		move.w	(a1)+,d0
		asr.w	#$08,d0
		add.w	(g_FxBaseHScroll).l,d0
		move.w	d0,(a2)+
		move.w	d0,(a2)+
		dbf	d2,_sbLine
		move.w	#$0001,d0
		bsr.w	_updateFxFrame
		addq.l	#$02,a0
		dbf	d1,_sbFrame
		move.l	#$00010001,d1
		moveq	#$00000001,d2
		moveq	#$00000001,d3
		moveq	#$00000007,d4
		bsr.w	_palSubToSaved
		bsr.w	_restoreVDPState
		movem.l	(sp)+,d0-a2
		rts

; ---------------------------------------------------------------------------
; Two _buildWaveTable parameter sets: {phase, step, step accel,
; amplitude, amp step, amp accel, count} then {amp step, count} for
; the second run.
_spellBookWave:	dc.w $0000,$0008,$0002,$0100,$0004,$0000,$027F
		dc.w $FFF0,$009F

; The cure/heal flash: palette lines 0 and 2 surge bright over two
; ramps, then subside back to the saved palette.
CurePaletteEffect:
		movem.l	d0-d4,-(sp)
		move.w	#$0003,d0
		bsr.w	_saveVDPState
		moveq	#$00000005,d2		  ; Palette lines 0 and 2
		moveq	#$00000001,d3
		moveq	#$00000007,d4
		move.l	#$00020100,d1
		bsr.w	_palAdd
		move.l	#$00010102,d1
		bsr.w	_palAdd
		move.l	#$00020202,d1
		bsr.w	_palSubToSaved
		bsr.w	_restoreVDPState
		movem.l	(sp)+,d0-d4
		rts

; Shop no-money effect: fade palette line 0 down by (1,1,1) steps,
; then stash the original line and substitute the darkened palette
; into the saved snapshot - so _restoreVDPState leaves the screen
; dark until NoMoneyBrighten undoes it.
NoMoneyDarken:
		movem.l	d0-d4/a0-a1,-(sp)
		move.w	#$0003,d0
		bsr.w	_saveVDPState
		move.l	#$00010101,d1
		moveq	#$00000001,d2		  ; Palette line 0
		moveq	#$00000002,d3
		moveq	#$00000003,d4
		bsr.w	_palSub
		lea	(g_FxSavedPalette).l,a0
		lea	(g_FxPaletteStash).l,a1
		move.w	#$000F,d1

_nmdStash:
		move.l	(a0)+,(a1)+
		dbf	d1,_nmdStash
		lea	(g_Pal0Base).l,a0
		lea	(g_FxSavedPalette).l,a1
		move.w	#$000F,d1

_nmdSwap:
		move.l	(a0)+,(a1)+
		dbf	d1,_nmdSwap
		bsr.w	_restoreVDPState
		movem.l	(sp)+,d0-d4/a0-a1
		rts

; Undo the no-money darkening: bring the stashed original palette
; back as the bound and brighten line 0 up to it.
NoMoneyBrighten:
		movem.l	d0-d4,-(sp)
		move.w	#$0003,d0
		bsr.w	_saveVDPState
		lea	(g_FxPaletteStash).l,a0
		lea	(g_FxSavedPalette).l,a1
		move.w	#$000F,d1

_nmbRestore:
		move.l	(a0)+,(a1)+
		dbf	d1,_nmbRestore
		move.l	#$00010101,d1
		moveq	#$00000001,d2		  ; Palette line 0
		moveq	#$00000002,d3
		moveq	#$00000003,d4
		bsr.w	_palAddToSaved
		bsr.w	_restoreVDPState
		movem.l	(sp)+,d0-d4
		rts

; Snapshot VDP regs 1/$B/$F, the base palette and the current H/V
; scroll into the g_FxSaved* block, set autoincrement 2, flatten
; both scroll planes to their base values and switch to H-scroll
; mode d0 (0 = full screen, 3 = per line).
_saveVDPState:
		movem.l	d0-d2/a0-a1,-(sp)
		move.l	d0,-(sp)
		lea	(g_FxSavedReg1).l,a0
		moveq	#$00000001,d0
		jsr	(j_GetVDPReg).l
		move.w	d0,(a0)+
		moveq	#$0000000B,d0
		jsr	(j_GetVDPReg).l
		move.w	d0,(a0)+
		moveq	#$0000000F,d0
		jsr	(j_GetVDPReg).l
		move.w	d0,(a0)+
		move.w	#$8F02,d0
		jsr	(j_SetVDPReg).l
		lea	(g_Pal0Base).l,a1
		moveq	#$0000003F,d0

_svPal:
		move.w	(a1)+,(a0)+
		dbf	d0,_svPal
		move.l	(g_HorizontalScrollData).l,(a0)+
		move.l	(g_VSRAMData).l,(a0)+
		bsr.w	_flattenHScroll
		bsr.w	_flattenVScroll
		jsr	(j_QueueHScrollDMAUpdate).l
		jsr	(j_QueueVSRAMUpdate).l
		jsr	(j_FlushDMACopyQueue).l
		move.l	(sp)+,d0
		bsr.s	_setHScrollMode
		movem.l	(sp)+,d0-d2/a0-a1
		rts

; Set the H-scroll mode bits (low 3) of VDP reg $B, keeping the
; rest of the saved register value.
_setHScrollMode:
		movem.l	d0-d1,-(sp)
		move.w	d0,d1
		andi.w	#$0007,d1
		move.w	(g_FxSavedRegB).l,d0
		andi.w	#$FFF8,d0
		or.w	d1,d0
		jsr	(j_SetVDPReg).l
		movem.l	(sp)+,d0-d1
		rts

; Run one frame of an effect; d0 flag bits as in the module header.
; The raster loop tracks the HV counter over lines 0-$9F, and at
; each HBlank writes VDP reg 1 (bit 6 cleared for lines whose
; g_FxLineMask bit is clear - per-line blanking) and VSRAM address 0
; with base + g_FxLineOffsets[line] - line for both planes.
_updateFxFrame:
		movem.l	d0-a2,-(sp)
		move.w	d0,d7
		btst	#$00,d7
		beq.s	_uffVScroll
		jsr	(j_QueueHScrollDMAUpdate).l

_uffVScroll:
		btst	#$01,d7
		beq.s	_uffPalette
		jsr	(j_QueueVSRAMUpdate).l

_uffPalette:
		btst	#$04,d7
		beq.s	_uffFlush
		jsr	(j_CopyBasePaletteToActivePalette).l

_uffFlush:
		jsr	(j_FlushDMACopyQueue).l
		move.w	d7,d0
		andi.w	#$000C,d0
		beq.w	_uffDone
		lea	(VDP_DATA_REG).l,a0
		lea	(VDP_CTRL_REG).l,a1
		lea	(g_FxLineOffsets).l,a2

_uffSync:
		btst	#$02,(VDP_CTRL_REG+1).l
		beq.s	_uffSync

_uffLine:
		clr.w	d0

_uffWaitLine:
		btst	#$02,(VDP_CTRL_REG+1).l
		bne.s	_uffWaitLine
		move.b	(VDP_HVCTR_REG).l,d0
		subi.w	#$0016,d0
		cmpi.w	#$00A0,d0
		bcc.s	_uffSync
		move.w	(g_FxSavedReg1).l,d1
		btst	#$03,d7
		beq.s	_uffVOffset
		bsr.w	_testFxLine
		bne.s	_uffVOffset
		bclr	#$06,d1			  ; Blank this line

_uffVOffset:
		move.w	(g_FxBaseVScroll).l,d2
		btst	#$02,d7
		beq.s	_uffWaitHBlank
		add.w	(a2)+,d2
		sub.w	d0,d2

_uffWaitHBlank:
		btst	#$02,(VDP_CTRL_REG+1).l
		beq.s	_uffWaitHBlank
		move.w	d1,(a1)
		move.w	#$4000,(a1)		  ; VSRAM address 0
		move.w	#$0010,(a1)
		move.w	d2,(a0)
		move.w	d2,(a0)
		cmpi.w	#$009F,d0
		bcs.w	_uffLine

_uffDone:
		movem.l	(sp)+,d0-a2
		rts

; Restore everything _saveVDPState captured.
_restoreVDPState:
		movem.l	d0/a0-a1,-(sp)
		lea	(g_FxSavedReg1).l,a0
		move.w	(a0)+,d0
		jsr	(j_SetVDPReg).l
		move.w	(a0)+,d0
		jsr	(j_SetVDPReg).l
		move.w	(a0)+,d0
		jsr	(j_SetVDPReg).l
		lea	(g_Pal0Base).l,a1
		moveq	#$0000003F,d0

_rvPal:
		move.w	(a0)+,(a1)+
		dbf	d0,_rvPal
		jsr	(j_CopyBasePaletteToActivePalette).l
		move.l	(a0)+,(g_HorizontalScrollData).l
		move.l	(a0)+,(g_VSRAMData).l
		jsr	(j_QueueHScrollDMAUpdate).l
		jsr	(j_QueueVSRAMUpdate).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,d0/a0-a1
		rts

; Fill the whole H-scroll table with the saved base value.
_flattenHScroll:
		movem.l	d0-d1/a0,-(sp)
		lea	(g_HorizontalScrollData).l,a0
		move.w	(g_FxBaseHScroll).l,d0
		move.w	#$00FF,d1

_fhFill:
		move.w	d0,(a0)+
		move.w	d0,(a0)+
		dbf	d1,_fhFill
		movem.l	(sp)+,d0-d1/a0
		rts

; Fill the VSRAM table with the saved base value.
_flattenVScroll:
		movem.l	d0-d1/a0,-(sp)
		lea	(g_VSRAMData).l,a0
		move.w	(g_FxBaseVScroll).l,d0
		move.w	#$0013,d1

_fvFill:
		move.w	d0,(a0)+
		move.w	d0,(a0)+
		dbf	d1,_fvFill
		movem.l	(sp)+,d0-d1/a0
		rts

; Seed g_FxLineOffsets with the identity (line N offset = N, i.e. no
; distortion).
_initLineOffsets:
		movem.l	d0-d1/a0,-(sp)
		lea	(g_FxLineOffsets).l,a0
		clr.w	d0
		move.w	#$009F,d1

_iloFill:
		move.w	d0,(a0)+
		addq.w	#$01,d0
		dbf	d1,_iloFill
		movem.l	(sp)+,d0-d1/a0
		rts

; Leftover: presumably once seeded g_FxLineMask with d0; the fill
; loop is gone and it now does nothing. Only the orphan effects
; call it.
_initLineMask:
		movem.l	d1/a0,-(sp)
		lea	(g_FxLineMask).l,a0
		moveq	#$00000009,d1
		movem.l	(sp)+,d1/a0
		rts

; Flags: NE = line d0's g_FxLineMask bit is set (line visible).
_testFxLine:
		movem.l	d0-d1/a0,-(sp)
		move.w	d0,d1
		asr.w	#$03,d1
		lea	(g_FxLineMask).l,a0
		andi.w	#$0007,d0
		btst	d0,(a0,d1.w)
		movem.l	(sp)+,d0-d1/a0
		rts

; ---------------------------------------------------------------------------
; Unreachable leftover: the bset (show line) counterpart.
		movem.l	d0-d1/a0,-(sp)
		move.w	d0,d1
		asr.w	#$03,d1
		lea	(g_FxLineMask).l,a0
		andi.w	#$0007,d0
		bset	d0,(a0,d1.w)
		movem.l	(sp)+,d0-d1/a0
		rts

; Clear line d0's g_FxLineMask bit (blank the line).
_hideFxLine:
		movem.l	d0-d1/a0,-(sp)
		move.w	d0,d1
		asr.w	#$03,d1
		lea	(g_FxLineMask).l,a0
		andi.w	#$0007,d0
		bclr	d0,(a0,d1.w)
		movem.l	(sp)+,d0-d1/a0
		rts

; The palette engine wrappers: d1 = packed per-channel step bytes
; ($00BBGGRR, matching _unpackColour), d2 = palette line mask
; (bit per line), d3 = frames to sleep between steps, d4 = steps-1.

; Add d1 to the selected lines each step (clamped at $E).
_palAdd:
		move.l	a0,-(sp)
		lea	_palAddOp(pc),a0
		bsr.w	_palIterate
		movea.l	(sp)+,a0
		rts

_palAddOp:
		move.l	d0,-(sp)
		move.w	(a1),d0
		bsr.w	_unpackColour
		bsr.w	_addClampE
		bsr.w	_packColour
		move.w	d0,(a1)
		move.l	(sp)+,d0
		rts

; Subtract d1 each step, but never below the saved palette's colour.
_palSubToSaved:
		move.l	a0,-(sp)
		lea	_palSubToSavedOp(pc),a0
		bsr.w	_palIterate
		movea.l	(sp)+,a0
		rts

_palSubToSavedOp:
		movem.l	d0-d2,-(sp)
		move.w	(a2),d0
		bsr.w	_unpackColour
		move.l	d0,d2
		move.w	(a1),d0
		bsr.w	_unpackColour
		bsr.w	_subClampF
		move.l	d2,d1
		bsr.w	_maxChannels
		bsr.w	_packColour
		move.w	d0,(a1)
		movem.l	(sp)+,d0-d2
		rts

; Subtract d1 each step (clamped at 0).
_palSub:
		move.l	a0,-(sp)
		lea	_palSubOp(pc),a0
		bsr.w	_palIterate
		movea.l	(sp)+,a0
		rts

_palSubOp:
		move.l	d0,-(sp)
		move.w	(a1),d0
		bsr.w	_unpackColour
		bsr.w	_subClampF
		bsr.w	_packColour
		move.w	d0,(a1)
		move.l	(sp)+,d0
		rts

; Add d1 each step, but never above the saved palette's colour.
_palAddToSaved:
		move.l	a0,-(sp)
		lea	_palAddToSavedOp(pc),a0
		bsr.w	_palIterate
		movea.l	(sp)+,a0
		rts

_palAddToSavedOp:
		movem.l	d0-d2,-(sp)
		move.w	(a2),d0
		bsr.w	_unpackColour
		move.l	d0,d2
		move.w	(a1),d0
		bsr.w	_unpackColour
		bsr.w	_addClampE
		move.l	d2,d1
		bsr.w	_minChannels
		bsr.w	_packColour
		move.w	d0,(a1)
		movem.l	(sp)+,d0-d2
		rts

; Run op a0 over colours 1-14 of each palette line selected in d2
; (a1 = live colour, a2 = its saved copy), refresh the palette,
; sleep d3 frames, d4+1 times over.
_palIterate:
		movem.l	d0/d2/d4-d6/a1-a2,-(sp)

_piStep:
		lea	(g_Pal0Base).l,a1
		lea	(g_FxSavedPalette).l,a2
		moveq	#$00000003,d5

_piLine:
		ror.w	#$01,d2
		bcc.s	_piSkipLine
		addq.l	#$02,a1			  ; Colour 0 untouched
		addq.l	#$02,a2
		moveq	#$0000000D,d6

_piColour:
		jsr	(a0)
		addq.l	#$02,a1
		addq.l	#$02,a2
		dbf	d6,_piColour
		addq.l	#$02,a1			  ; Colour 15 untouched
		addq.l	#$02,a2
		bra.s	_piNextLine
; ---------------------------------------------------------------------------

_piSkipLine:
		lea	$00000020(a1),a1
		lea	$00000020(a2),a2

_piNextLine:
		dbf	d5,_piLine
		rol.w	#$04,d2
		jsr	(j_CopyBasePaletteToActivePalette).l
		jsr	(j_EnableDMAQueueProcessing).l
		move.w	d3,d0
		jsr	(j_Sleep).l
		dbf	d4,_piStep
		movem.l	(sp)+,d0/d2/d4-d6/a1-a2
		rts

; ---------------------------------------------------------------------------
; Unreachable leftover.
		move.w	#$FFFF,(Sprite1_X).l
		jsr	(j_WaitUntilVBlank).l
		rts

; Per-channel byte ops on the unpacked $00BBGGRR forms:

; d0 += d1, each channel clamped to 0..$E.
_addClampE:
		movem.l	d1-d2,-(sp)
		moveq	#$00000002,d2

_acChan:
		add.b	d1,d0
		bge.s	_acHigh
		clr.b	d0
		bra.s	_acNext
; ---------------------------------------------------------------------------

_acHigh:
		cmpi.b	#$0E,d0
		ble.s	_acNext
		move.b	#$0E,d0

_acNext:
		ror.l	#$08,d0
		ror.l	#$08,d1
		dbf	d2,_acChan
		ror.l	#$08,d0
		movem.l	(sp)+,d1-d2
		rts

; d0 -= d1, each channel clamped to 0..$F.
_subClampF:
		movem.l	d1-d2,-(sp)
		moveq	#$00000002,d2

_scChan:
		sub.b	d1,d0
		bge.s	_scHigh
		clr.b	d0
		bra.s	_scNext
; ---------------------------------------------------------------------------

_scHigh:
		cmpi.b	#$0F,d0
		ble.s	_scNext
		move.b	#$0F,d0

_scNext:
		ror.l	#$08,d0
		ror.l	#$08,d1
		dbf	d2,_scChan
		ror.l	#$08,d0
		movem.l	(sp)+,d1-d2
		rts

; d0 = per-channel min(d0, d1).
_minChannels:
		movem.l	d1-d2,-(sp)
		moveq	#$00000002,d2

_mnChan:
		cmp.b	d1,d0
		ble.s	_mnNext
		move.b	d1,d0

_mnNext:
		ror.l	#$08,d0
		ror.l	#$08,d1
		dbf	d2,_mnChan
		ror.l	#$08,d0
		movem.l	(sp)+,d1-d2
		rts

; ---------------------------------------------------------------------------
; Unreachable leftovers: add/subtract a fixed (2,2,2) step.
		move.l	d1,-(sp)
		move.l	#$00020202,d1
		bsr.s	_addClampE
		move.l	(sp)+,d1
		rts
; ---------------------------------------------------------------------------
		move.l	d1,-(sp)
		move.l	#$00020202,d1
		bsr.s	_subClampF
		move.l	(sp)+,d1
		rts

; d0 = per-channel max(d0, d1).
_maxChannels:
		movem.l	d1-d2,-(sp)
		moveq	#$00000002,d2

_mxChan:
		cmp.b	d1,d0
		bge.s	_mxNext
		move.b	d1,d0

_mxNext:
		ror.l	#$08,d0
		ror.l	#$08,d1
		dbf	d2,_mxChan
		ror.l	#$08,d0
		movem.l	(sp)+,d1-d2
		rts

; Unpack colour word $0BGR into per-channel bytes $00BBGGRR.
_unpackColour:
		movem.l	d1-d3,-(sp)
		moveq	#$00000000,d1
		moveq	#$00000002,d2

_ucNibble:
		move.b	d0,d3
		andi.b	#$0F,d3
		move.b	d3,d1
		ror.l	#$04,d0
		ror.l	#$08,d1
		dbf	d2,_ucNibble
		ror.l	#$08,d1
		move.l	d1,d0
		movem.l	(sp)+,d1-d3
		rts

; Repack $00BBGGRR bytes into a colour word.
_packColour:
		movem.l	d1-d3,-(sp)
		clr.w	d1
		moveq	#$00000002,d2

_pcNibble:
		move.b	d0,d3
		andi.b	#$0F,d3
		or.b	d3,d1
		ror.l	#$08,d0
		ror.l	#$04,d1
		dbf	d2,_pcNibble
		swap	d1
		ror.w	#$04,d1
		move.w	d1,d0
		movem.l	(sp)+,d1-d3
		rts

; ---------------------------------------------------------------------------
; Unreachable leftover: fill (a0) with randomised words stepped by
; d2.
		movem.l	d1-d3/d6-a0,-(sp)
		move.w	d1,d6

_orphan3Fill:
		jsr	(j_GenerateRandomNumber).l
		add.w	d2,d7
		move.w	d7,(a0)+
		dbf	d3,_orphan3Fill
		movem.l	(sp)+,d1-d3/d6-a0
		rts
; ---------------------------------------------------------------------------
; Unreachable leftover: the single-sine variant of _buildWaveTable.
		ext.l	d4
		ext.l	d5
		ext.l	d6

_orphan4Entry:
		move.w	d1,d0
		asr.w	#$08,d0
		bsr.s	Sine
		muls.w	d4,d0
		asr.l	#$08,d0
		move.w	d0,(a0)+
		add.w	d2,d1
		add.w	d3,d2
		add.l	d5,d4
		add.l	d6,d5
		dbf	d7,_orphan4Entry
		rts

; Build d7+1 waveform words at a0: each entry sin(sin(phase))*amp,
; with phase d1 stepping by d2 (itself accelerating by d3) and
; amplitude d4 stepping by d5 (accelerating by d6).
_buildWaveTable:
		ext.l	d4
		ext.l	d5
		ext.l	d6

_bwtEntry:
		move.w	d1,d0
		asr.w	#$08,d0
		bsr.s	Sine
		bsr.s	Sine
		muls.w	d4,d0
		asr.l	#$08,d0
		move.w	d0,(a0)+
		add.w	d2,d1
		add.w	d3,d2
		add.l	d5,d4
		add.l	d6,d5
		dbf	d7,_bwtEntry
		rts

; d0 = cosine(d0) via the +$40 (90 degree) phase shift; falls
; through to Sine.
Cosine:
		addi.w	#$0040,d0

; d0 = sine of angle d0 ($100 units per turn), sign-extended long
; from SineTable.
Sine:
		move.l	a0,-(sp)
		lea	SineTable(pc),a0
		andi.w	#$00FF,d0
		add.w	d0,d0
		move.w	(a0,d0.w),d0
		ext.l	d0
		movea.l	(sp)+,a0
		rts

	modend
