VisualEffects2	module
; The Nole/Kazalt warp's per-frame helpers, called from NoleWarp and
; its main loop in visualeffects1.asm. They all run with a6 still
; pointing at NoleWarp's stack frame, redeclared here:

_nw_starCount	= -$134		; star spawn seed (stars drawn = /16, max $28)
_nw_whitenOut	= -$132		; warp-out whiten countdown
_nw_whitenIn	= -$130		; warp-in whiten countdown
_nw_rampMax	= -$12E		; brighten ramp: cap passed to BrightenColour
_nw_rampStep	= -$12C		; per-pulse level change
_nw_rampLevel	= -$12A		; current brighten level
_nw_timer	= -$128		; effect timer (out counts up, in down)
_nw_effectId	= -$126		; 7 = out, 8 = in
_nw_centreY	= -$124		; sparkle fountain centre (VDP sprite coords)
_nw_centreX	= -$122
_nw_stars	= -$120		; $28 records {radius, angle, age, rate}

; The Kazalt strobe: once the warp-out timer passes $172 (in
; practice NoleWarpOutTick only calls this past $23A), for 4 frames
; in every 16 the active palette snaps to the WhiteFlash greyscale,
; otherwise back to the base palette.
ContinueKazaltWarpFx:
		move.w	_nw_timer(a6),d0
		cmpi.w	#$0172,d0
		bcc.s	_ckStrobe
		rts
; ---------------------------------------------------------------------------

_ckStrobe:
		lsr.w	#$02,d0
		andi.b	#$03,d0
		cmpi.b	#$01,d0
		bcs.w	WhiteFlash
		jmp	(CopyBasePaletteToActivePalette).l

; Brighten-ramp params for the warp in: start at $C00, falling $200
; a pulse - white stepping down towards the normal palette.
NoleWarpRampDownParams:
		move.w	#$0C00,_nw_rampLevel(a6)
		move.w	#$FE00,_nw_rampStep(a6)
		move.w	#$0E00,_nw_rampMax(a6)
		rts

; Brighten-ramp params for the warp out: start at $200, rising $200
; a pulse - black stepping up towards white.
NoleWarpRampUpParams:
		move.w	#$0200,_nw_rampLevel(a6)
		move.w	#$0200,_nw_rampStep(a6)
		move.w	#$0E00,_nw_rampMax(a6)
		rts

; Warp-out per-frame tick, d0 = strobe threshold ($23A): past the
; threshold, run the Kazalt strobe and colour/sound flash
; (NoleWarpKazaltFlash, visualeffects1.asm). Before it, count the
; whiten timer down from $1C - SND_WarpPad on its first tick, one
; brighten-ramp pass every 4 ticks.
NoleWarpOutTick:
		cmp.w	_nw_timer(a6),d0
		bcs.s	_otWhiten
		bsr.s	ContinueKazaltWarpFx
		bra.w	NoleWarpKazaltFlash
; ---------------------------------------------------------------------------

_otWhiten:
		move.w	_nw_whitenOut(a6),d0
		bne.s	_otActive
		rts
; ---------------------------------------------------------------------------

_otActive:
		cmpi.w	#$001C,d0
		bne.s	_otTick
		trap	#$00			  ; Trap00Handler
		dc.w SND_WarpPad

_otTick:
		subq.w	#$01,d0
		move.w	d0,_nw_whitenOut(a6)
		andi.b	#$03,d0
		beq.w	_brightenPass
		rts

; Warp-in per-frame tick: counts the whiten timer down, one
; (downward) brighten-ramp pass every 4 ticks.
NoleWarpInTick:
		move.w	_nw_whitenIn(a6),d0
		bne.s	_itTick
		rts
; ---------------------------------------------------------------------------

_itTick:
		subq.w	#$01,d0
		move.w	d0,_nw_whitenIn(a6)
		andi.b	#$03,d0
		beq.w	_brightenPass
		rts
; ---------------------------------------------------------------------------

; One ramp pass: brighten all 64 base colours into the active
; palette by the current ramp level (capped at _nw_rampMax), then
; advance the level by the step.
_brightenPass:
		move.w	_nw_rampLevel(a6),d3
		move.w	_nw_rampStep(a6),d4
		move.w	_nw_rampMax(a6),d7
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		moveq	#$0000003F,d5

_bpColour:
		move.w	(a0)+,d0
		jsr	(BrightenColour).l
		move.w	d0,(a1)+
		dbf	d5,_bpColour
		add.w	d4,d3
		move.w	d3,_nw_rampLevel(a6)
		move.w	d4,_nw_rampStep(a6)
		move.w	d7,_nw_rampMax(a6)
		rts

; Park the $28 sparkle sprites offscreen, then - once the timer is
; past $3C - update and draw starCount/16 of them (capped at $28).
; Each star sits at a fixed angle from the centre on a half-height
; ellipse (X = centre + r*sin - r*cos, Y = centre + (r*sin +
; r*cos)/2), its radius shrinking and its age lifting it upward: a
; fountain of rising sparkles. The count creeps up two per frame
; during the warp-out; the warp-in's decrement cancels against the
; final increment, so its count stays wherever it was seeded.
NoleWarpAnimateStars:
		lea	(g_VDPSpr30_Y).l,a0
		moveq	#$00000027,d7

_asPark:
		move.w	#$FFFF,(a0)
		lea	$00000008(a0),a0
		dbf	d7,_asPark
		cmpi.w	#$003C,_nw_timer(a6)
		bcc.s	_asActive
		rts
; ---------------------------------------------------------------------------

_asActive:
		move.w	_nw_starCount(a6),d7
		lsr.w	#$04,d7
		cmpi.w	#$0027,d7
		bcs.s	_asClamped
		move.w	#$0027,d7

_asClamped:
		cmpi.w	#$0007,_nw_effectId(a6)
		bne.s	_asShrink
		addq.w	#$01,_nw_starCount(a6)
		bra.s	_asDraw
; ---------------------------------------------------------------------------

_asShrink:
		subq.w	#$01,_nw_starCount(a6)
		bpl.s	_asDraw
		clr.w	_nw_starCount(a6)

_asDraw:
		lea	(g_VDPSpr30_Y).l,a1
		lea	_nw_stars(a6),a0

_asStar:
		move.l	d7,-(sp)
		bsr.w	_updateStar
		clr.w	d0
		move.b	(a0),d0
		move.w	d0,d1
		movem.w	d0-d1,-(sp)
		clr.w	d5
		move.b	$00000001(a0),d5
		move.w	d5,d0
		jsr	(j_Sine).l
		move.w	d0,d4
		movem.w	(sp)+,d0-d1
		mulu.w	d4,d0
		lsr.l	#$08,d0
		movem.w	d0-d1,-(sp)
		move.w	d5,d0
		jsr	(j_Cosine).l
		move.l	d0,d4
		movem.w	(sp)+,d0-d1
		mulu.w	d4,d1
		lsr.l	#$08,d1
		move.w	d0,d2
		move.w	d1,d3
		add.w	d1,d0
		sub.w	d3,d2
		lsr.w	#$01,d0
		add.w	_nw_centreX(a6),d2
		move.b	$00000003(a0),d1
		addq.b	#$01,d1
		add.b	d1,$00000002(a0)
		move.b	$00000002(a0),d1
		add.w	_nw_centreY(a6),d0
		sub.b	d1,d0
		move.w	d0,(a1)
		move.w	#$8100,$00000004(a1)
		move.w	d2,$00000006(a1)
		lea	$00000008(a1),a1
		lea	$00000004(a0),a0
		move.l	(sp)+,d7
		dbf	d7,_asStar
		addq.w	#$01,_nw_starCount(a6)
		rts

; Respawn a star whose age has passed $A0 - radius $18 + rand(8),
; random angle, age 0, rise rate 2 + rand(2) - then shrink its
; radius by 2 down to a floor of $10.
_updateStar:
		move.b	$00000002(a0),d0
		cmpi.b	#$A0,d0
		bcs.w	_usShrink
		moveq	#$00000008,d6
		jsr	(GenerateRandomNumber).l
		addi.w	#$0018,d7
		move.b	d7,(a0)
		move.w	#$0100,d6
		jsr	(GenerateRandomNumber).l
		move.b	d7,$00000001(a0)
		clr.b	$00000002(a0)
		moveq	#$00000002,d6
		jsr	(GenerateRandomNumber).l
		addq.b	#$02,d7
		move.b	d7,$00000003(a0)

_usShrink:
		subq.b	#$02,(a0)
		cmpi.b	#$10,(a0)
		bcc.s	_usDone
		move.b	#$10,(a0)

_usDone:
		rts

; Unreachable leftover.
		rts

	modend
