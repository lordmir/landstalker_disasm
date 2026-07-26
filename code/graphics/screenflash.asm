ScreenFlash	module
; Id 4: rebuild the active palette from the base one with every
; colour turned to greyscale (the average of its components).
BlackFlash:
		clr.l	d2
		bra.s	_flashGrey

; Id 5: as BlackFlash but with the greyscale inverted - a white
; flash. Also strobed by the Kazalt warp (ContinueKazaltWarpFx,
; nolewarpupdate.asm).
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
; nolewarpupdate.asm - all the NoleWarp* helpers there share this
; stack frame). Out (7): fade to black, then 600 frames of sparkles
; while the palette ramps up to white; once the timer passes $23A
; the Kazalt strobe kicks in - WhiteFlash alternating with the
; normal palette, the two KazaltWarpPalette colours cycling and
; SND_KazaltWarp restarting every $20 ticks (NoleWarpKazaltFlash
; below). In (8): start from white, 360 frames of sparkles with the
; palette ramping back down, then fade in from black.

	modend
