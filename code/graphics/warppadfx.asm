WarpPadEffect	module

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

	modend
