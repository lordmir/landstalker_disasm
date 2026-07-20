BlockDecompress	module
; Blockset decompressor. a0 = compressed stream, a1 = destination;
; returns d0 = number of blocks written (8 bytes each: 2x2 tile
; attribute words). Called from GetBlockset (mapload).
;
; The stream is read MSB-first: a 16-bit block count, then the
; attribute planes of all d0*4 tile words in four passes:
;   1. priority (bit 15): alternating runs of $0000/$8000 covering
;      every word - this pass initialises the whole buffer;
;   2. V-flip (bit 12): alternating skip / OR-in runs;
;   3. H-flip (bit 11): alternating skip / OR-in runs;
;   4. tile indices (bits 10-0), encoded per pair of cells.
; Palette bits are never set; blockset tiles always use palette 0.
;
; Run lengths use _readRunLength; indices use _readTileIndex with a
; 16-entry move-to-front ring of recent indices kept in the link
; frame at -$20(a6). Bit-reader registers throughout: d5 = current
; stream byte, d6 = bits left in d5 (dbf-style).
DecompBigTiles:
		movem.l	d1-a5,-(sp)
		link	a6,#-$0020
		clr.w	d6
		clr.w	d4
		moveq	#$0000000F,d7		  ; 16-bit block count -> d4

_cntBits:
		dbf	d6,_cntShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_cntShift:
		add.b	d5,d5
		addx.w	d4,d4
		dbf	d7,_cntBits
		lsl.w	#$02,d4			  ; d4 = total tile words
		lea	-$00000020(a6),a2	  ; clear the recent-index ring
		move.w	#$000F,d3
		clr.w	d0

_clearRing:
		move.w	d0,(a2)+
		dbf	d3,_clearRing

; Pass 1: priority. d7 alternates $0000/$8000; each run of r+1 words
; is written with the current value. A zero first run starts with
; priority set.
		movea.l	a1,a2
		clr.w	d3			  ; d3 = words covered so far
		clr.w	d7
		bsr.w	_readRunLength
		dbf	d2,_priRun
		bchg	#$0F,d7
		bsr.w	_readRunLength

_priRun:
		add.w	d2,d3
		addq.w	#$01,d3

_priFill:
		move.w	d7,(a2)+
		dbf	d2,_priFill
		bchg	#$0F,d7
		cmp.w	d4,d3
		bcc.s	_vfPlane
		bsr.w	_readRunLength
		bra.s	_priRun

; Pass 2: V-flip. Alternating runs: skip r words, then OR $1000 into
; the next r+1 words. A zero first run starts with a flipped run.
_vfPlane:
		movea.l	a1,a2
		clr.w	d3
		move.w	#$1000,d7
		bsr.w	_readRunLength
		dbf	d2,_vfSkip
		bsr.w	_readRunLength

_vfRun:
		addq.w	#$01,d3
		add.w	d2,d3

_vfFill:
		or.w	d7,(a2)+
		dbf	d2,_vfFill
		cmp.w	d4,d3
		bcc.s	_hfPlane
		bsr.w	_readRunLength

_vfSkip:
		addq.w	#$01,d2
		adda.w	d2,a2
		adda.w	d2,a2
		add.w	d2,d3
		cmp.w	d4,d3
		bcc.s	_hfPlane
		bsr.w	_readRunLength
		bra.s	_vfRun

; Pass 3: H-flip, same scheme ORing $0800.
_hfPlane:
		movea.l	a1,a2
		clr.w	d3
		move.w	#$0800,d7
		bsr.s	_readRunLength
		dbf	d2,_hfSkip
		bsr.s	_readRunLength

_hfRun:
		addq.w	#$01,d3
		add.w	d2,d3

_hfFill:
		or.w	d7,(a2)+
		dbf	d2,_hfFill
		cmp.w	d4,d3
		bcc.s	_tilePlane
		bsr.s	_readRunLength

_hfSkip:
		addq.w	#$01,d2
		adda.w	d2,a2
		adda.w	d2,a2
		add.w	d2,d3
		cmp.w	d4,d3
		bcc.s	_tilePlane
		bsr.s	_readRunLength
		bra.s	_hfRun

; Pass 4: tile indices, one cell pair per iteration. The first cell's
; index is always encoded; a following 1 bit makes the second cell
; the first index +1 - or -1 when the first cell is H-flipped (bit 3
; of its high byte), so mirrored pairs count backwards. A 0 bit means
; the second index is encoded normally.
_tilePlane:
		clr.w	d0			  ; d0 = ring head offset
		movea.l	a1,a2
		move.w	d4,d3
		lsr.w	#$01,d3			  ; d3 = pair count
		bra.s	_pairNext

_pairLoop:
		bsr.s	_readTileIndex
		or.w	d2,(a2)+
		dbf	d6,_pairSecond
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_pairSecond:
		add.b	d5,d5
		bcs.s	_pairDelta
		bsr.s	_readTileIndex
		bra.s	_pairWrite

_pairDelta:
		andi.w	#$07FF,d2
		btst	#$03,-$00000002(a2)	  ; first cell H-flipped?
		bne.s	_pairDec
		addq.w	#$01,d2
		bra.s	_pairWrite

_pairDec:
		subq.w	#$01,d2

_pairWrite:
		or.w	d2,(a2)+

_pairNext:
		dbf	d3,_pairLoop
		move.w	d4,d0
		lsr.w	#$02,d0			  ; d0 = block count
		unlk	a6
		movem.l	(sp)+,d1-a5
		rts

; Reads an Elias-gamma-style run length into d2: z zero bits and a
; stop bit select the magnitude class, then z value bits follow;
; d2 = (2^z - 1) + value. z = 0 gives 0.
_readRunLength:
		moveq	#$FFFFFFFF,d1

_rlZeros:
		dbf	d6,_rlZeroShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_rlZeroShift:
		add.b	d5,d5
		dbcs	d1,_rlZeros
		negx.w	d1			  ; d1 = z
		dbf	d1,_rlValue
		clr.w	d2
		rts

_rlValue:
		moveq	#$00000002,d0
		lsl.w	d1,d0
		subq.w	#$01,d0			  ; d0 = 2^z - 1
		move.w	d0,d2
		clr.w	d0

_rlBits:
		dbf	d6,_rlBitShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_rlBitShift:
		add.b	d5,d5
		addx.w	d0,d0
		dbf	d1,_rlBits
		add.w	d0,d2
		rts

; Reads one tile index into d2 using the move-to-front ring at
; -$20(a6) (16 words, head at offset d0):
;   0 + 11 bits: new index - the head slides back (d0 -= 2) and the
;     value is stored there;
;   1 + 4-bit slot: reuse a recent index; slot 0 repeats the head,
;     other slots are rotated to the head first.
_readTileIndex:
		dbf	d6,_tiShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_tiShift:
		add.b	d5,d5
		bcc.w	_tiNew
		clr.w	d2
		moveq	#$00000003,d7		  ; 4-bit ring slot -> d2

_tiSlotBits:
		dbf	d6,_tiSlotShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_tiSlotShift:
		add.b	d5,d5
		addx.w	d2,d2
		dbf	d7,_tiSlotBits
		move.w	d2,d1
		beq.w	_tiRepeatHead
		add.w	d2,d2
		add.w	d0,d2
		andi.w	#$001E,d2		  ; d2 = referenced slot offset
		move.w	-$00000020(a6,d2.w),-(sp)
		subq.w	#$01,d1

_tiMtfLoop:
		subq.w	#$02,d2			  ; shift the entries between the
		andi.w	#$001E,d2		  ; head and the slot down by one
		move.w	-$00000020(a6,d2.w),-(sp)
		addq.w	#$02,d2
		andi.w	#$001E,d2
		move.w	(sp)+,-$00000020(a6,d2.w)
		subq.w	#$02,d2
		dbf	d1,_tiMtfLoop
		move.w	(sp)+,-$00000020(a6,d0.w)	  ; referenced value to the head
		move.w	-$00000020(a6,d0.w),d2
		bra.s	_tiDone

_tiNew:
		subq.w	#$02,d0			  ; new head slot
		clr.w	d2
		moveq	#$0000000A,d7		  ; 11-bit index -> d2

_tiNewBits:
		dbf	d6,_tiNewShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_tiNewShift:
		add.b	d5,d5
		addx.w	d2,d2
		dbf	d7,_tiNewBits
		andi.w	#$001F,d0
		move.w	d2,-$00000020(a6,d0.w)

_tiDone:
		rts

_tiRepeatHead:
		move.w	-$00000020(a6,d0.w),d2
		rts

		modend
