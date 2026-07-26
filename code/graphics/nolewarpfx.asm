NoleWarpEffect	module
_nw_starCount	= -$134		; star spawn seed (stars drawn = /16, max $28)
_nw_whitenOut	= -$132		; warp-out whiten countdown (NoleWarpOutTick)
_nw_whitenIn	= -$130		; warp-in whiten countdown (NoleWarpInTick)
; -$12A/-$12C/-$12E: brighten-ramp current/step/target - only
; touched by the nolewarpupdate.asm helpers
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
; (nolewarpupdate.asm) once the warp-out timer passes its threshold:
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
