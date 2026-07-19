RegionChk	module
; Region protection (assembled into the US/FR/EUR/DE builds only):
; compares bits 7-6 of the hardware version register - bit 7 =
; overseas console, bit 6 = PAL - against the value this build
; expects ($80 = overseas NTSC, $C0 = overseas PAL). On a mismatch it
; draws the region error text with SystemFont and hangs. Japanese
; (domestic) consoles fail on either build since bit 7 reads 0.
CheckRegion:
	if NTSC
		move.b	#$80,d1
	else
		move.b	#$C0,d1
	endif
		bne.s	_chkVersion		  ; always taken (d1 non-zero);
		rts				  ; "0 = no check" leftover

_chkVersion:
		move.b	(SEGA_VERSION_REG).l,d0
		andi.b	#$C0,d0
		cmp.b	d0,d1
		bne.s	_wrongRegion
		rts

_wrongRegion:
		jsr	(j_DisableDisplayAndInts).l
		lea	RegionErrorLine1(pc),a0
		lea	((g_ForegroundBlocks+$886)).l,a1
		bsr.w	DrawErrorString
	if NTSC
		move.b	#$80,d1
	else
		move.b	#$C0,d1
	endif
		cmpi.b	#$80,d1
		bne.s	_palMsg
		lea	RegionErrorNTSC(pc),a0
		lea	((g_ForegroundBlocks+$A06)).l,a1
		bsr.w	DrawErrorString
		bra.s	_line3

_palMsg:
		lea	RegionErrorPAL(pc),a0
		lea	((g_ForegroundBlocks+$A06)).l,a1
		bsr.w	DrawErrorString

_line3:
		lea	RegionErrorLine3(pc),a0
		lea	((g_ForegroundBlocks+$B86)).l,a1
		bsr.w	DrawErrorString
		jsr	(j_EnableDisplayAndInts).l
		lea	((g_ForegroundBlocks+$3FE)).l,a0
		lea	($C000).l,a1
		move.w	#$0800,d0
		moveq	#$2,d1
		jsr	(j_QueueDMAOp).l
		lea	SystemFont(pc),a0
		nop
		lea	($400).w,a1
		move.w	#$03B0,d0
		moveq	#$2,d1
		jsr	(j_QueueDMAOp).l
		move.w	#$0EEE,(g_Pal0Active+2).l
		clr.l	(g_Pal0Active+4).l
		clr.l	(g_Pal0Active+8).l
		clr.l	(g_Pal0Active+$C).l
		clr.l	(g_Pal0Active+$10).l
		clr.l	(g_Pal0Active+$14).l
		clr.l	(g_Pal0Active+$18).l
		clr.l	(g_Pal0Active+$1C).l
		jsr	(j_QueueFullPaletteDMA).l
		jsr	(j_EnableDMAQueueProcessing).l

_hangLoop:
		jsr	(j_WaitUntilVBlank).l
		bra.s	_hangLoop


; Writes the zero-terminated byte string at a0 into the tilemap
; buffer at a1, one word (tile index) per character.
DrawErrorString:
		clr.w	d0
		move.b	(a0)+,d0
		bne.s	_writeChar
		rts

_writeChar:
		move.w	d0,(a1)+
		bra.s	DrawErrorString

		modend
