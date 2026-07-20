GameSelectScreen4	module
; The game-start sequence after picking a save on the select screen
; (called from InitGameSelectScreen, whose a6 frame this shares).
; Everything but the picked window is retinted to the fadeable
; palette lines, then for 120 frames the screen slides toward the
; picked window's corner while Nigel swings his sword and the
; palettes darken; any button press skips ahead.

; Own a4 frame: -$02 frame counter, -$06 scroll step count, -$09
; sword swing state (0 pending / 1 playing / $FF done), -$0B
; scroll-done flag.
HandleGameStartInput:

var_2		= -2

		link	a4,#-$000C
		movea.l	a4,a0
		moveq	#$0000000B,d7

_hgsClear:
		clr.b	-(a0)
		dbf	d7,_hgsClear
		clr.b	-$00000019(a6)
		bsr.w	_dimAllButPicked
		move.w	#$0060,-$0000000E(a6)	  ; palette fade budget
		move.w	#$0078,d7		  ; 120 frames

_hgsLoop:
		bsr.w	SuppressHeldInputs
		move.b	(g_Controller1State).l,d0
		cmpi.b	#CTRLBF_B,d0
		bcc.s	_hgsDone		  ; any button: skip
		movem.w	d7,-(sp)
		move.w	#$0000,d0
		bsr.w	_scrollAway
		move.w	#$0046,d0
		bsr.w	_nigelSwing
		bsr.w	DrawSaveNigel
		move.w	#$0004,d0
		bsr.w	_fadeStep
		jsr	(WaitUntilVBlank).l
		addq.w	#$01,var_2(a4)
		movem.w	(sp)+,d7
		dbf	d7,_hgsLoop

_hgsDone:
		unlk	a4
		rts

; Retints the screen so only the picked window stays bright: cells
; still on palette line 0 go to line 3 (the top 22 rows) or line 1
; (the rest), the result is copied to plane B, then the buffer is
; flooded with its first (blank) cell and just the picked window
; redrawn - plane A keeps the bright window over the dimmed copy.
_dimAllButPicked:
		lea	((g_Buffer+2)).l,a0
		move.w	#$6000,d0
		move.w	(a0),d1
		move.w	#$036F,d7

_dabMain:
		move.w	(a0),d2
		and.w	d0,d2
		bne.s	_dabMainNext
		move.w	d0,(a0)

_dabMainNext:
		addq.l	#$02,a0
		dbf	d7,_dabMain
		lea	((g_Buffer+$52)).l,a0
		move.w	#$6000,d0
		move.w	(a0),d1
		move.w	#$0437,d7

_dabRest:
		move.w	(a0),d2
		and.w	d0,d2
		bne.s	_dabRestNext
		ori.w	#$2000,(a0)

_dabRestNext:
		addq.l	#$02,a0
		dbf	d7,_dabRest
		jsr	(WaitUntilVBlank).l
		bsr.w	CopySaveScreenToPlaneB
		lea	((g_Buffer+2)).l,a0
		move.w	#$045E,d7
		move.w	(a0)+,d0

_dabFlood:
		move.w	d0,(a0)+
		dbf	d7,_dabFlood
		jsr	(WaitUntilVBlank).l
		move.w	-$00000002(a6),d0
		bsr.w	RedrawSaveWindow
		rts

; From frame d0 on: play the sword-swing sound and Nigel's react
; animation once, and park him still when it finishes.
_nigelSwing:
		cmp.w	-$00000002(a4),d0
		bcs.s	_nsCheck
		rts

_nsCheck:
		tst.b	-$00000009(a4)
		bpl.s	_nsStart
		rts				  ; already done

_nsStart:
		bne.s	_nsFinish
		trap	#$00			  ; Trap00Handler
		dc.w SND_SwordSwing
		bsr.w	StartSaveNigelAnim
		move.b	#$01,-$00000009(a4)

_nsFinish:
		tst.b	-$00000019(a6)		  ; animation completed?
		beq.s	_nsRts
		bsr.w	SetSaveNigelStill
		move.b	#$FF,-$00000009(a4)

_nsRts:
		rts

; Slides the screen (and Nigel, via the shared -$10/-$12(a6)
; offsets) one step toward the picked window's corner each frame,
; for $24 steps.
_scrollAway:
		tst.b	-$0000000B(a4)
		beq.s	_saCheck
		rts

_saCheck:
		cmp.w	-$00000002(a4),d0
		bcs.s	_saStep
		rts

_saStep:
		lea	_scrollDirs(pc),a0
		move.w	-$00000004(a6),d0
		lsl.w	#$02,d0
		move.w	(a0,d0.w),d1
		move.w	$00000002(a0,d0.w),d2
		add.w	d1,-$00000010(a6)
		add.w	d2,-$00000012(a6)
		move.w	-$00000010(a6),d6
		jsr	(j_FillHScrollData).l
		move.w	-$00000012(a6),d6
		neg.w	d6
		jsr	(j_FillVSRAM).l
		jsr	(j_EnableDMAQueueProcessing).l
		addq.w	#$01,-$00000006(a4)
		move.w	-$00000006(a4),d0
		cmpi.w	#$0024,d0
		bcs.s	_saDone
		addq.b	#$01,-$0000000B(a4)

_saDone:
		rts

; Per-slot screen step {dx, dy}, away from the picked corner.
_scrollDirs:	dc.w $0002,$0001
		dc.w $FFFE,$0001
		dc.w $0002,$FFFF
		dc.w $FFFE,$FFFF

; From frame d0 on, tick the palette fade (lines 1 and 3) each
; frame.
_fadeStep:
		cmp.w	-$00000002(a4),d0
		bcs.s	_fsRun
		rts

_fsRun:
		bsr.w	DarkenMenuPalettes
		rts

		modend
