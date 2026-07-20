MapDecompress	module
; Room map decompressor. a0 = compressed stream, a1 = destination
; (g_ForegroundBlocks); called from GetTilemap (mapload). The stream
; is MSB-first bits (idiom throughout: d5 = current byte, d6 = bits
; left, reload via dbf d6). Output layout:
;   - 4 header bytes {x offset, y offset, width-1, per-layer
;     height-1}, later consumed by ExtractMap when it spreads the
;     packed layers into the fixed 74-cell-wide buffers;
;   - both block layers packed at the compressed width (foreground
;     then background, contiguous);
;   - the heightmap, written directly at its fixed position.
;
; The block layers are encoded as an LZ-style command skeleton over
; the (zero-initialised) cell grid, then executed:
;   1. gamma-coded gaps place copy commands at chosen cells - prefix
;      codes select the back-offset: 001 = 1 cell, 010 = 2 cells,
;      011 = 1 row, 100 = 2 rows, 101 = 1 row + 1 cell, 11nnn =
;      offset dictionary entry n (8 x 12-bit words from the header);
;      000 places $FFFF, which switches execution to literal mode.
;      A command can also be propagated down the map, one row per
;      step, zigzagging one cell right when directed;
;   2. execution walks the cells: a positive word starts a copy run
;      from that back-offset (running through zero cells until the
;      next command); $FFFF enters literal mode, where each cell is
;      either a brand-new block index (10 = counter A, 11 = counter
;      B, both counters seeded from 10-bit header values and
;      incremented) or a back-reference to an already-used index
;      (00/01: A absolute / B seed-relative, read with just enough
;      bits for the current count). Zero cells resume whichever mode
;      is active via jmp (a1).
DecompressMap1:
		movem.l	d0-a5,-(sp)
		link	a6,#-$0018
		clr.w	d6
		clr.w	d4
		moveq	#$00000007,d7		  ; header: x offset byte

_hdrByte1:
		dbf	d6,_hdrShift1
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_hdrShift1:
		add.b	d5,d5
		addx.w	d4,d4
		dbf	d7,_hdrByte1
		move.b	d4,(a1)+
		clr.w	d4
		moveq	#$00000007,d7		  ; header: y offset byte

_hdrByte2:
		dbf	d6,_hdrShift2
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_hdrShift2:
		add.b	d5,d5
		addx.w	d4,d4
		dbf	d7,_hdrByte2
		move.b	d4,(a1)+
		clr.w	d4
		moveq	#$00000007,d7		  ; header: width-1

_hdrWidth:
		dbf	d6,_hdrShift3
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_hdrShift3:
		add.b	d5,d5
		addx.w	d4,d4
		dbf	d7,_hdrWidth
		move.b	d4,(a1)+
		addq.w	#$01,d4
		add.w	d4,d4			  ; d4 = row stride in bytes
		clr.w	d3
		moveq	#$00000007,d7		  ; header: height-1, counting
						  ; both layers' rows
_hdrHeight:
		dbf	d6,_hdrShift4
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_hdrShift4:
		add.b	d5,d5
		addx.w	d3,d3
		dbf	d7,_hdrHeight
		addq.w	#$01,d3
		lsr.w	#$01,d3
		subq.w	#$01,d3
		move.b	d3,(a1)+		  ; stored: per-layer height-1
		addq.w	#$01,d3
		add.w	d3,d3
		mulu.w	d4,d3			  ; d3 = both layers' size
		lea	(a1,d3.w),a3		  ; a3 = end of packed layers
		move.l	a1,-$00000004(a6)	  ; -4(a6) = packed data start
		lsr.w	#$01,d3
		subq.w	#$01,d3
		movea.l	a3,a2
		moveq	#$00000000,d0

_clearMap:
		move.w	d0,-(a2)
		dbf	d3,_clearMap
		clr.w	d0
		moveq	#$00000009,d7		  ; 10-bit counter B seed

_seedBBits:
		dbf	d6,_seedBShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_seedBShift:
		add.b	d5,d5
		addx.w	d0,d0
		dbf	d7,_seedBBits
		move.w	d0,-$00000016(a6)
		clr.w	d0
		moveq	#$00000009,d7		  ; 10-bit counter A seed

_seedABits:
		dbf	d6,_seedAShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_seedAShift:
		add.b	d5,d5
		addx.w	d0,d0
		dbf	d7,_seedABits
		move.w	d0,-$00000018(a6)
		moveq	#$00000007,d3		  ; 8 x 12-bit offset dictionary
		lea	-$00000014(a6),a2

_dictLoop:
		clr.w	d0
		moveq	#$0000000B,d7

_dictBits:
		dbf	d6,_dictShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_dictShift:
		add.b	d5,d5
		addx.w	d0,d0
		dbf	d7,_dictBits
		move.w	d0,(a2)+
		dbf	d3,_dictLoop
		movea.l	a1,a2
		subq.w	#$02,a2

; Skeleton pass. Gap to the next command cell: z zero bits and a
; stop bit, then z more bits v give a gap of 2^z + v cells (z = 0:
; the next cell).
_nextCmd:
		moveq	#$FFFFFFFF,d1
		moveq	#$00000004,d0

_gapZeros:
		dbf	d6,_gapZeroShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_gapZeroShift:
		add.b	d5,d5
		dbcs	d1,_gapZeros
		negx.w	d1			  ; d1 = z
		dbf	d1,_gapValue
		addq.l	#$02,a2
		bra.w	_placeCmd

_gapValue:
		lsl.w	d1,d0
		lea	(a2,d0.w),a2		  ; + 2^z cells
		clr.w	d0

_gapBits:
		dbf	d6,_gapBitShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_gapBitShift:
		add.b	d5,d5
		addx.w	d0,d0
		dbf	d1,_gapBits
		add.w	d0,d0
		adda.w	d0,a2			  ; + v cells

_placeCmd:
		cmpa.l	a3,a2
		bge.w	_execute
		dbf	d6,_cmdShift1
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_cmdShift1:
		add.b	d5,d5
		bcs.s	_cmd1x
		dbf	d6,_cmdShift2
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_cmdShift2:
		add.b	d5,d5
		bcs.s	_cmd01
		dbf	d6,_cmdShift3
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_cmdShift3:
		add.b	d5,d5
		bcs.s	_cmdPrevCell
		moveq	#$FFFFFFFF,d1		  ; 000: literal-mode marker
		bra.s	_writeCmd

_cmdPrevCell:
		moveq	#$00000002,d1		  ; 001: copy from 1 cell back
		bra.s	_writeCmd

_cmd01:
		dbf	d6,_cmd01Shift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_cmd01Shift:
		add.b	d5,d5
		bcs.s	_cmdUpCell
		moveq	#$00000004,d1		  ; 010: 2 cells back
		bra.s	_writeCmd

_cmdUpCell:
		move.w	d4,d1			  ; 011: 1 row back
		bra.s	_writeCmd

_cmd1x:
		dbf	d6,_cmd1xShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_cmd1xShift:
		add.b	d5,d5
		bcs.s	_cmdDict
		dbf	d6,_cmd10Shift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_cmd10Shift:
		add.b	d5,d5
		bcs.s	_cmdUpRight
		move.w	d4,d1			  ; 100: 2 rows back
		add.w	d1,d1
		bra.s	_writeCmd

_cmdUpRight:
		move.w	d4,d1			  ; 101: 1 row + 1 cell back
		addq.w	#$02,d1
		bra.s	_writeCmd

_cmdDict:
		clr.w	d1			  ; 11nnn: dictionary offset
		moveq	#$00000002,d7

_dictIdxBits:
		dbf	d6,_dictIdxShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_dictIdxShift:
		add.b	d5,d5
		addx.w	d1,d1
		dbf	d7,_dictIdxBits
		add.w	d1,d1
		move.w	-$00000014(a6,d1.w),d1
		add.w	d1,d1

; Store the command, then optionally propagate it down the map: 1 =
; another step (1 row down, plus 1 cell when the zigzag is active),
; 01 = toggle the zigzag and step again, 00 = on to the next command.
_writeCmd:
		move.w	d1,(a2)
		dbf	d6,_extendShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_extendShift:
		add.b	d5,d5
		bcc.w	_nextCmd
		clr.w	d0
		dbf	d6,_extDirShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_extDirShift:
		add.b	d5,d5
		addx.w	d0,d0
		add.w	d0,d0			  ; d0 = zigzag offset (0 or 2)
		movea.l	a2,a1

_extSegment:
		move.w	d0,d3
		add.w	d4,d3

_extStep:
		adda.w	d3,a1
		move.w	d1,(a1)
		dbf	d6,_extShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_extShift:
		add.b	d5,d5
		bcs.s	_extStep
		dbf	d6,_extEndShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_extEndShift:
		add.b	d5,d5
		bcc.w	_nextCmd
		bchg	#$01,d0
		bra.s	_extSegment

; Execution pass. a4/a5 = new-block counters A/B; a1 = resume
; handler for zero cells; $FFFF at the end of the buffer stops the
; final run.
_execute:
		movea.l	-$00000004(a6),a2
		movea.w	-$00000018(a6),a4
		movea.w	-$00000016(a6),a5
		move.w	#$FFFF,(a3)

_execLoop:
		move.w	(a2),d0
		bne.s	_execCmd
		jmp	(a1)

_execCmd:
		bmi.s	_literalMode
		neg.w	d0
		move.w	d0,d2			  ; d2 = negative back-offset
		lea	_copyCell(pc),a1

_copyCell:
		move.w	(a2,d2.w),(a2)+

_copyRun:
		move.w	(a2),d0
		bne.s	_execCmd
		move.w	(a2,d2.w),(a2)+
		move.w	(a2),d0
		bne.s	_execCmd
		move.w	(a2,d2.w),(a2)+
		move.w	(a2),d0
		bne.s	_execCmd
		move.w	(a2,d2.w),(a2)+
		bra.s	_copyRun

_literalMode:
		lea	_litLoop(pc),a1
		nop

_litLoop:
		cmpa.l	a2,a3
		bls.w	_heightmap
		dbf	d6,_litShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_litShift:
		add.b	d5,d5
		bcc.w	_litRef
		dbf	d6,_litNewShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_litNewShift:
		add.b	d5,d5
		bcs.s	_litNewB
		move.w	a4,(a2)+		  ; 10: new index from counter A
		addq.w	#$01,a4
		bra.s	_execLoop

_litNewB:
		move.w	a5,(a2)+		  ; 11: new index from counter B
		addq.w	#$01,a5
		bra.s	_execLoop

_litRef:
		dbf	d6,_litRefShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_litRefShift:
		add.b	d5,d5
		bcs.s	_refB
		clr.w	d0			  ; 00: reference below counter A,
		move.w	a4,d7			  ; read with enough bits for its
		beq.s	_refAWrite		  ; current value

_refABits:
		dbf	d6,_refAShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_refAShift:
		add.b	d5,d5
		addx.w	d0,d0
		lsr.w	#$01,d7
		bne.s	_refABits

_refAWrite:
		move.w	d0,(a2)+
		bra.w	_execLoop

_refB:
		clr.w	d0			  ; 01: reference between counter
		move.w	a5,d7			  ; B's seed and its current value
		sub.w	-$00000016(a6),d7
		beq.s	_refBWrite

_refBBits:
		dbf	d6,_refBShift
		moveq	#$00000007,d6
		move.b	(a0)+,d5

_refBShift:
		add.b	d5,d5
		addx.w	d0,d0
		lsr.w	#$01,d7
		bne.s	_refBBits

_refBWrite:
		add.w	-$00000016(a6),d0
		move.w	d0,(a2)+
		bra.w	_execLoop

; Heightmap: byte-aligned RLE at the fixed offset $5C94 from the
; packed data start (g_HeightMap + $708: a 12-row + 12-cell margin),
; rows at the fixed $94-byte stride. Stream: width byte, height
; byte, then {cell word, run bytes} records - a $FF run byte chains
; into the next byte, and runs continue across row ends.
_heightmap:
		movea.l	-$00000004(a6),a1
		lea	$00005C94(a1),a1
		movea.l	a1,a2
		clr.w	d3
		move.b	(a0)+,d3
		subq.w	#$01,d3
		move.w	d3,d4			  ; d4 = cells per row - 1
		clr.w	d5
		move.b	(a0)+,d5
		subq.w	#$01,d5			  ; d5 = rows - 1

_hmRecord:
		move.b	(a0)+,d0
		lsl.w	#$08,d0
		move.b	(a0)+,d0		  ; d0 = heightmap cell
		clr.w	d1
		clr.w	d2

_hmCount:
		move.b	(a0)+,d1
		add.w	d1,d2
		addq.b	#$01,d1
		beq.s	_hmCount		  ; $FF chains

_hmFill:
		move.w	d0,(a2)+
		dbf	d4,_hmNext
		lea	$00000094(a1),a1	  ; next row
		movea.l	a1,a2
		move.w	d3,d4
		dbf	d5,_hmNext
		bra.s	_done

_hmNext:
		dbf	d2,_hmFill
		bra.s	_hmRecord

_done:
		unlk	a6
		movem.l	(sp)+,d0-a5
		rts

		modend
