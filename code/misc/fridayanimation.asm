FridayAnim	module
; Friday overlay animation, run every frame from WaitUntilVBlank.
; Friday here is not an entity but a single hardware sprite
; (gVDPSprFriday_*, tiles at VRAM $7F0) drawn over the scene during
; cutscenes. Dialogue script actions and the Eke-Eke revival drive her
; by writing a state to g_FridayAnimation1; g_FridayAnimation2 holds
; the state to enter when the current move finishes. Callers use the
; FRIDAY_* constants (constants/fridayanim.inc). States (an odd value
; starts the move and is bumped to the even running value):
;   $00      hidden/off (also skipped while the screen is blanked or
;            the inventory window is open)
;   $01-$10  fly up from the bottom of the screen, swaying
;   $11-$20  hover: one figure-of-eight circuit
;   $21      snap to the perch position (cutscene code polls for $21
;            as "Friday has arrived/finished")
;   $22      flap wings in place
;   $23-$24  frozen
;   $25-$30  shake: jitter one pixel diagonally
;   $31-$40  fly down, swaying, then hide (sprite Y cleared)
;   $41-$50  cast spell: sparkle frames, SND_FridayMagic at $1E, then
;            strobe CRAM colours 0/$1E white; ends at the perch
;   $51-$6E  waypoint-path playback, one state pair per path:
;            $51/$52 = FridayAnimation1 ... $6D/$6E = FridayAnimation15.
;            Path data: {startY.w, startX.w} then records of
;            {steps.w, targetX.w, targetY.w}, negative steps = end.

UpdateFridayAnimation:

		movem.l	d0-a6,-(sp)
		move.b	(g_FridayAnimation1).l,d0
		beq.w	_done
		cmpi.w	#$8A18,(g_VDPReg10_HIntLine).l ; Screen	Blanked
		beq.w	_done
		cmpi.w	#$921C,(g_VDPReg18_WindowVPos).l ; Inventory open
		beq.w	_done
		cmpi.b	#$10,d0
		bls.w	_flyUp
		cmpi.b	#$20,d0
		bls.w	_hover
		cmpi.b	#$21,d0
		bls.w	_perch
		cmpi.b	#$22,d0
		bls.w	_flapWings
		cmpi.b	#$24,d0
		bls.w	_done
		cmpi.b	#$30,d0
		bls.w	_shake
		cmpi.b	#$40,d0
		bls.w	_flyDown
		cmpi.b	#$50,d0
		bls.w	_spell
		cmpi.b	#$52,d0
		bls.w	_path1
		cmpi.b	#$54,d0
		bls.w	_path2
		cmpi.b	#$56,d0
		bls.w	_path3
		cmpi.b	#$58,d0
		bls.w	_path4
		cmpi.b	#$5A,d0
		bls.w	_path5
		cmpi.b	#$5C,d0
		bls.w	_path6
		cmpi.b	#$5E,d0
		bls.w	_path7
		cmpi.b	#$60,d0
		bls.w	_path8
		cmpi.b	#$62,d0
		bls.w	_path9
		cmpi.b	#$64,d0
		bls.w	_path10
		cmpi.b	#$66,d0
		bls.w	_path11
		cmpi.b	#$68,d0
		bls.w	_path12
		cmpi.b	#$6A,d0
		bls.w	_path13
		cmpi.b	#$6C,d0
		bls.w	_path14
		cmpi.b	#$6E,d0
		bls.w	_path15
		clr.b	(g_FridayAnimation1).l

_done:
		movem.l	(sp)+,d0-a6
		rts

_flyUp:
		cmpi.b	#$01,d0
		bhi.s	_flyUpStep
		clr.b	(g_FridayAnimFramecount).l
		move.b	#$02,(g_FridayAnimation1).l
		lea	(gVDPSprFriday_Y).l,a0
		move.w	#$00C8,(a0)+
		move.w	#$0A08,(a0)+
		move.w	#$C7F0,(a0)+
		move.w	#$0118,(a0)+
		bra.s	_done

_flyUpStep:
		subq.w	#$02,(gVDPSprFriday_Y).l
		bsr.s	CalcFridaySway
		bsr.s	ApplyFridaySwayX
		bra.w	_flapWings

; d0 = signed X sway offset for this tick (triangle wave over
; FridaySwayTable, one full swing per $40 framecount ticks);
; advances the framecount by 4.
CalcFridaySway:
		clr.w	d0
		move.b	(g_FridayAnimFramecount).l,d0
		addq.b	#$04,(g_FridayAnimFramecount).l
		lsr.b	#$02,d0
		cmpi.b	#$08,d0
		bcs.s	_swayLookup
		eori.b	#$0F,d0

_swayLookup:
		move.b	FridaySwayTable(pc,d0.w),d0
		rts

; Applies the sway: X = $118 + d0. After $40 framecount ticks the
; move is over and the next state is taken from g_FridayAnimation2.
ApplyFridaySwayX:
		ext.w	d0
		addi.w	#$0118,d0
		move.w	d0,(gVDPSprFriday_X).l
		cmpi.b	#$40,(g_FridayAnimFramecount).l
		bls.s	_swayRts
		clr.b	(g_FridayAnimation1).l
		move.b	(g_FridayAnimation2).l,(g_FridayAnimation1).l

_swayRts:
		rts

; Quarter-wave of X offsets for the sway/hover movement.
FridaySwayTable:	dc.b -$03,-$07,-$0A,-$0C,-$0D,-$0E,-$0F,-$10

_hover:
		cmpi.b	#$11,d0
		bhi.s	_hoverStep
		clr.b	(g_FridayAnimFramecount).l
		move.b	#$12,(g_FridayAnimation1).l

_hoverStep:
		move.b	(g_FridayAnimFramecount).l,d0
		addq.b	#$04,(g_FridayAnimFramecount).l
		lsr.b	#$02,d0
		cmpi.b	#$20,d0
		bcc.s	_hoverEnd
		andi.w	#$001F,d0
		cmpi.b	#$08,d0
		bcs.s	_hoverDescend
		cmpi.b	#$10,d0
		bcs.s	_hoverMirror1
		cmpi.b	#$18,d0
		bcs.s	_hoverAscend
		bra.s	_hoverMirror2

_hoverMirror1:
		andi.b	#$07,d0
		eori.b	#$07,d0

_hoverDescend:
		addq.w	#$01,(gVDPSprFriday_Y).l
		move.b	FridaySwayTable(pc,d0.w),d0
		neg.b	d0
		bra.s	_hoverSetX

_hoverMirror2:
		eori.b	#$0F,d0

_hoverAscend:
		andi.b	#$07,d0
		subq.w	#$01,(gVDPSprFriday_Y).l
		move.b	FridaySwayTable(pc,d0.w),d0

_hoverSetX:
		ext.w	d0
		addi.w	#$0118,d0
		move.w	d0,(gVDPSprFriday_X).l
		bra.s	_flapWings

_hoverEnd:
		move.b	(g_FridayAnimation2).l,(g_FridayAnimation1).l
		bra.w	_done

_shake:
		move.b	(g_FridayAnimation2).l,(g_FridayAnimation1).l
		addq.b	#$01,(g_FridayAnimFramecount).l
		lea	(gVDPSprFriday_Y).l,a0
		btst	#$00,(g_FridayAnimFramecount).l
		beq.s	_shakeBack
		addq.w	#$01,(a0)
		addq.w	#$01,6(a0)		; gVDPSprFriday_X
		bra.s	_flapWings

_shakeBack:
		subq.w	#$01,(a0)
		subq.w	#$01,6(a0)		; gVDPSprFriday_X
		bra.s	_flapWings

_perch:
		lea	(gVDPSprFriday_Y).l,a0
		move.w	#$00A6,(a0)+
		move.w	#$0A08,(a0)+
		move.w	#$C7F0,(a0)+
		move.w	#$0115,(a0)+
		move.b	(g_FridayAnimation2).l,(g_FridayAnimation1).l
		addq.b	#$01,(g_FridayAnimFramecount).l

_flapWings:
		move.b	(g_FridayAnimFramecount).l,d3
		andi.w	#$000C,d3
		bsr.w	LoadFridayFrame
		bra.w	_done

_flyDown:
		cmpi.b	#$31,d0
		bhi.w	_flyDownStep
		clr.b	(g_FridayAnimFramecount).l
		move.b	#$32,(g_FridayAnimation1).l
		clr.b	(g_FridayAnimation2).l

_flyDownStep:
		addq.w	#$02,(gVDPSprFriday_Y).l
		bsr.w	CalcFridaySway
		neg.b	d0
		bsr.w	ApplyFridaySwayX
		tst.b	(g_FridayAnimation1).l
		bne.s	_flyDownFlap
		clr.w	(gVDPSprFriday_Y).l
		bra.w	_done

_flyDownFlap:
		bra.s	_flapWings

_spell:
		cmpi.b	#$41,d0
		bhi.w	_spellStep
		clr.b	(g_FridayAnimFramecount).l
		move.b	#$42,(g_FridayAnimation1).l

_spellStep:
		move.b	(g_FridayAnimFramecount).l,d0
		addq.b	#$01,(g_FridayAnimFramecount).l
		move.w	#$0008,d2
		tst.b	d0
		bne.s	_spellMid
		clr.w	d3
		bra.s	_spellFrame

_spellMid:
		cmpi.b	#$0A,d0
		bne.s	_spellChk
		move.w	#$0004,d3
		bra.s	_spellFrame

_spellChk:
		cmpi.b	#$1E,d0
		bcs.w	_done
		bne.s	_spellFlash
		trap	#$00			  ; Trap00Handler
		dc.w SND_FridayMagic
		move.w	#$0008,d3
		bra.s	_spellFrame

_spellFlash:
		cmpi.b	#$3C,d0
		bcc.s	_spellEnd
		clr.w	d1
		btst	#$00,d0
		bne.s	_flashWrite
		move.w	#$0EEE,d1

_flashWrite:
		move.l	#$C0000000,(VDP_CTRL_REG).l
		move.w	d1,(VDP_DATA_REG).l
		move.l	#$C01E0000,(VDP_CTRL_REG).l
		move.w	d1,(VDP_DATA_REG).l
		bra.w	_done

_spellEnd:
		move.b	#FRIDAY_PERCH,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l
		bra.w	_done

_spellFrame:
		bsr.s	LoadFridayTiles
		bra.w	_done

; Queues Friday's 4-tile wing frame d3 (falls through with d2 = 4;
; the spell states call LoadFridayTiles with d2 = 8 for the
; double-size sparkle frames).
LoadFridayFrame:
		move.w	#$0004,d2

; DMA-queues d2 tiles of Friday graphic $63, frame offset d3, into
; the overlay sprite's VRAM slot ($7F0).
LoadFridayTiles:
		move.l	#$63,d0
		move.w	#$07F0,d1
		bsr.w	LoadSpriteTilesQueued
		bra.w	EnableDMAQueueProcessing

_path1:
		lea	FridayAnimation1(pc),a1
		move.b	#$51,d1
		bra.w	_pathInit

_path2:
		lea	FridayAnimation2(pc),a1
		move.b	#$53,d1
		bra.w	_pathInit

_path3:
		lea	FridayAnimation3(pc),a1
		move.b	#$55,d1
		bra.s	_pathInit

_path4:
		lea	FridayAnimation4(pc),a1
		move.b	#$57,d1
		bra.s	_pathInit

_path5:
		lea	FridayAnimation5(pc),a1
		move.b	#$59,d1
		bra.s	_pathInit

_path6:
		lea	FridayAnimation6(pc),a1
		move.b	#$5B,d1
		bra.s	_pathInit

_path7:
		lea	FridayAnimation7(pc),a1
		move.b	#$5D,d1
		bra.s	_pathInit

_path8:
		lea	FridayAnimation8(pc),a1
		move.b	#$5F,d1
		bra.s	_pathInit

_path9:
		lea	FridayAnimation9(pc),a1
		move.b	#$61,d1
		bra.s	_pathInit

_path10:
		lea	FridayAnimation10(pc),a1
		move.b	#$63,d1
		bra.s	_pathInit

_path11:
		lea	FridayAnimation11(pc),a1
		move.b	#$65,d1
		bra.s	_pathInit

_path12:
		lea	FridayAnimation12(pc),a1
		move.b	#$67,d1
		bra.s	_pathInit

_path13:
		lea	FridayAnimation13(pc),a1
		move.b	#$69,d1
		bra.s	_pathInit

_path14:
		lea	FridayAnimation14(pc),a1
		move.b	#$6B,d1
		bra.s	_pathInit

_path15:
		lea	FridayAnimation15(pc),a1
		move.b	#$6D,d1

_pathInit:
		cmp.b	d1,d0
		bhi.s	_pathRun
		clr.b	(g_FridayAnimFramecount).l
		addq.b	#$01,(g_FridayAnimation1).l
		lea	(gVDPSprFriday_Y).l,a0
		move.w	(a1)+,(a0)+
		move.w	#$0A08,(a0)+
		move.w	#$C7F0,(a0)+
		move.w	(a1)+,(a0)+
		move.l	a1,(g_FridayAnimPtr).l
		clr.w	(g_FridayPathSteps).l

_pathRun:
		movea.l	(g_FridayAnimPtr).l,a1
		tst.w	(g_FridayPathSteps).l
		bne.s	_pathStep
		move.w	(a1)+,d0
		bmi.s	_pathEnd
		move.w	d0,(g_FridayPathSteps).l
		addq.w	#$01,(g_FridayPathSteps).l
		addq.w	#$04,a1
		move.l	a1,(g_FridayAnimPtr).l

_pathStep:
		bsr.s	CalcFridayPathDeltas
		subq.w	#$01,(g_FridayPathSteps).l
		move.w	(g_FridayPathDX).l,d0
		add.w	d0,(gVDPSprFriday_X).l
		move.w	(g_FridayPathDY).l,d0
		add.w	d0,(gVDPSprFriday_Y).l
		move.b	(g_FridayAnimFramecount).l,d0
		addq.b	#$04,(g_FridayAnimFramecount).l
		bra.w	_flapWings

; From the current waypoint record (a1 points just past it):
; g_FridayPathDX/DY = (target - current position) / steps.
CalcFridayPathDeltas:
		move.w	(g_FridayPathSteps).l,d0
		move.w	-4(a1),d2
		move.w	(gVDPSprFriday_X).l,d1
		sub.w	d2,d1
		ext.l	d1
		divs.w	d0,d1
		neg.w	d1
		move.w	d1,(g_FridayPathDX).l
		move.w	-2(a1),d2
		move.w	(gVDPSprFriday_Y).l,d1
		sub.w	d2,d1
		ext.l	d1
		divs.w	d0,d1
		neg.w	d1
		move.w	d1,(g_FridayPathDY).l
		rts

_pathEnd:
		move.b	(g_FridayAnimation2).l,(g_FridayAnimation1).l
		bra.w	_flapWings

		modend
