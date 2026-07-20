IntroStringRoutines	module
; The intro/story caption overlay: up to two 16-character lines of
; the large 8x16 font, shown over the scene as sprites 8-15 for a
; set time. Triggered by setting g_IntroStringToDisplay (1-based id
; into IntroStringPointers; id 1 from the game start, 2-$C from
; dialogue script actions).
;
; An IntroStringN asset is: {line1 X, line1 Y, line2 X, line2 Y,
; duration} words, then the character bytes (up to 32: the first 16
; are line 1, the rest line 2), terminated by a byte with bit 7 set.

; Called from the game loop every tick: id pending and no timer =
; render the string and start its timer; timer running = count it
; down and hide sprites 8-15 (and clear the id) when it expires.
CheckAndDisplayIntroString:
		move.b	(g_IntroStringToDisplay).l,d0
		beq.s	_cdisDone
		move.w	(g_IntroStringDisplayTime).l,d1
		bne.w	CheckIntroStringTimer
		andi.w	#$00FF,d0
		lsl.b	#$02,d0
		lea	IntroStringPointers(pc),a2
		movea.l	-0000000004(a2,d0.w),a2	  ; Ids are 1-based
		move.w	(a2)+,d0		  ; Line 1 X
		move.w	(a2)+,d1		  ; Line 1 Y
		move.w	(a2)+,d2		  ; Line 2 X
		move.w	(a2)+,d3		  ; Line 2 Y
		move.w	(a2)+,(g_IntroStringDisplayTime).l
		movem.l	d2-d3,-(sp)
		movem.l	d0-d1,-(sp)
		bsr.s	CopyIntroStringToVDP
		movem.l	(sp)+,d0-d1
		bsr.w	LoadIntroStringLine1Sprites
		movem.l	(sp)+,d0-d1
		bsr.w	LoadIntroStringLine2Sprites

_cdisDone:
		rts
; ---------------------------------------------------------------------------

CheckIntroStringTimer:
		subq.w	#$01,d1
		move.w	d1,(g_IntroStringDisplayTime).l
		bne.s	_ctDone
		lea	(g_VDPSpr08_Y).l,a0
		moveq	#$00000007,d7

_hideSprite:
		clr.w	(a0)
		clr.b	$00000002(a0)
		clr.w	$00000004(a0)
		clr.w	$00000006(a0)
		addq.w	#$08,a0
		dbf	d7,_hideSprite
		clr.b	(g_IntroStringToDisplay).l

_ctDone:
		rts

; Render the characters at a2 into g_Buffer (64 bytes - one 8x16
; two-tile column - each) until a bit-7 terminator, then queue the
; whole $800-byte buffer for DMA to VRAM $F180 (tile $78C).
CopyIntroStringToVDP:
		bsr.s	ClearIntroStringBuffer
		lea	(g_Buffer).l,a1

_cisNextChar:
		bsr.s	GetNextIntroChar
		tst.b	d0
		bmi.s	_cisFlush
		bsr.s	LoadIntroChar
		bra.s	_cisNextChar
; ---------------------------------------------------------------------------

_cisFlush:
		lea	(g_Buffer).l,a0
		lea	($0000F180).l,a1
		move.w	#$0400,d0		  ; DMA length in words
		jmp	(QueueDMAOp).l

; Blank all 32 character cells ($800 bytes) of g_Buffer.
ClearIntroStringBuffer:
		lea	(g_Buffer).l,a1
		move.w	#$01FF,d7

_cibLoop:
		clr.l	(a1)+
		dbf	d7,_cibLoop
		rts

GetNextIntroChar:
		move.b	(a2)+,d0
		rts

; Copy character d0's 64-byte 8x16 glyph from IntroFontPtr into the
; buffer at a1.
LoadIntroChar:
		andi.w	#$00FF,d0
		lsl.w	#$06,d0
		movea.l	(IntroFontPtr).l,a0
		move.l	(a0,d0.w),(a1)+
		move.l	$00000004(a0,d0.w),(a1)+
		move.l	$00000008(a0,d0.w),(a1)+
		move.l	$0000000C(a0,d0.w),(a1)+
		move.l	$00000010(a0,d0.w),(a1)+
		move.l	$00000014(a0,d0.w),(a1)+
		move.l	$00000018(a0,d0.w),(a1)+
		move.l	$0000001C(a0,d0.w),(a1)+
		move.l	$00000020(a0,d0.w),(a1)+
		move.l	$00000024(a0,d0.w),(a1)+
		move.l	$00000028(a0,d0.w),(a1)+
		move.l	$0000002C(a0,d0.w),(a1)+
		move.l	$00000030(a0,d0.w),(a1)+
		move.l	$00000034(a0,d0.w),(a1)+
		move.l	$00000038(a0,d0.w),(a1)+
		move.l	$0000003C(a0,d0.w),(a1)+
		rts

; Place one line of the caption as four 32x16 sprites (4x2 tiles,
; size $0D) at d0/d1: line 1 = sprites 8-11 from tile $78C, line 2 =
; sprites 12-15 from tile $7AC (16 characters later), palette 3 with
; priority. Each sprite advances 8 tiles and 32 pixels.
LoadIntroStringLine1Sprites:
		move.w	#$E78C,d2
		lea	(g_VDPSpr08_Y).l,a0
		bra.s	_lsLine
; ---------------------------------------------------------------------------

LoadIntroStringLine2Sprites:
		move.w	#$E7AC,d2
		lea	(g_VDPSpr12_Y).l,a0

_lsLine:
		moveq	#$00000003,d7

_lsSprite:
		move.w	d1,(a0)+		  ; Y
		move.b	#$0D,(a0)		  ; Size
		addq.l	#$02,a0
		move.w	d2,(a0)+		  ; TileSource
		move.w	d0,(a0)+		  ; X
		addq.w	#$08,d2
		addi.w	#$0020,d0
		dbf	d7,_lsSprite
		rts

	modend
