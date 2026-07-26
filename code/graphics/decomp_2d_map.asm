Decomp2DMap	module
; Decompresses a tilemap from a0 to a1: a width,height byte pair,
; then width*height cell words, built in two passes. Pass 1 fills
; each cell's attribute byte (priority/palette/flip - the top
; five bits of the cell's high byte) from RLE runs:
;   %aaaaa1cc          - run of cc+1 cells
;   %aaaaa0cc cccccccc - run with a 10-bit count (0 = end pass)
; Pass 2 restarts at the first cell and ORs in the 11-bit tile
; numbers:
;   %00vvvvvv vvvvvvvv - one literal value (value $7FF = end)
;   %01rrrvvv vvvvvvvv - run of rrr+1 cells of one value
;   %10rrrrrr          - run of rrrrrr+1 cells of the last value
;   %11rrrrrr          - run, values ascending from the last
;                        %11 run's final value
; (The first entry of pass 2 is decoded in the %01 form.)
DecompTilemap:
		movem.l	d0-a6,-(sp)
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.l	a1,-(sp)

_dtAttrLoop:
		move.b	(a0)+,d0
		btst	#$02,d0
		beq.s	_dtAttr16
		bsr.w	DecompTM_8bitRLEFill
		bra.s	_dtAttrNext
; ---------------------------------------------------------------------------

_dtAttr16:
		bsr.w	DecompTM_16bitRLEFill
		tst.w	d7
		beq.w	_dtValues

_dtAttrNext:
		bra.s	_dtAttrLoop
; ---------------------------------------------------------------------------

_dtValues:
		movea.l	(sp)+,a1
		move.b	(a0)+,d0
		bsr.w	DecompTM_RLEFillOR
		move.w	d0,d4			  ; d4 - incremental value
		move.w	d0,d5			  ; d5 - last value

_dtValLoop:
		move.b	(a0)+,d0
		bmi.s	_dtValHigh
		btst	#$06,d0
		bne.s	_dtValRLE

_dtValWord:
		bsr.w	DecompTM_CopySingleWord
		cmpi.w	#$07FF,d0
		beq.w	_dtDone
		bra.s	_dtValNext1
; ---------------------------------------------------------------------------

_dtValRLE:
		bsr.w	DecompTM_RLEFillOR
		move.w	d0,d5			  ; d5 - last value

_dtValNext1:
		bra.s	_dtValNext2
; ---------------------------------------------------------------------------

_dtValHigh:
		btst	#$06,d0
		bne.s	_dtValIncr

_dtValLast:
		move.w	d5,d1
		bsr.w	DecompTM_FillWithLast
		bra.s	_dtValNext2
; ---------------------------------------------------------------------------

_dtValIncr:
		move.w	d4,d1			  ; d4 - incremental fill
		bsr.w	DecompTM_IncrementalFill
		move.w	d0,d4

_dtValNext2:
		bra.s	_dtValLoop
; ---------------------------------------------------------------------------

_dtDone:
		movem.l	(sp)+,d0-a6
		rts

; ---------------------------------------------------------------------------

; Attribute run, %aaaaa1cc form: cc+1 cells.
DecompTM_8bitRLEFill:
		move.b	d0,d7
		andi.w	#$0003,d7
		bra.w	_rleFill

; ---------------------------------------------------------------------------

; Attribute run, %aaaaa0cc cccccccc form: 10-bit count, 0 ending
; the attribute pass.
DecompTM_16bitRLEFill:
		move.b	d0,d7
		lsl.w	#$08,d7
		move.b	(a0)+,d7
		andi.w	#$03FF,d7
		bne.s	_rleFill
		rts
; ---------------------------------------------------------------------------

_rleFill:
		andi.b	#$F8,d0

_rleLoop:
		move.b	d0,(a1)+
		clr.b	(a1)+
		dbf	d7,_rleLoop
		rts

; ---------------------------------------------------------------------------

; ORs one literal 11-bit tile number into the next cell.
DecompTM_CopySingleWord:
		lsl.w	#$08,d0
		move.b	(a0)+,d0
		andi.w	#$07FF,d0
		or.w	d0,(a1)+
		rts

; ---------------------------------------------------------------------------

; Tile-number run, %01rrrvvv vvvvvvvv form: rrr+1 cells of one
; 11-bit value, OR'd in.
DecompTM_RLEFillOR:
		move.b	d0,d7
		lsr.b	#$03,d7
		andi.w	#$0007,d7
		lsl.w	#$08,d0
		move.b	(a0)+,d0
		bra.s	_orFill

; ---------------------------------------------------------------------------

; Tile-number run, %10rrrrrr form: repeats the last value (d1).
DecompTM_FillWithLast:
		move.b	d0,d7
		andi.w	#$003F,d7
		move.w	d1,d0

_orFill:
		andi.w	#$07FF,d0

_orLoop:
		or.w	d0,(a1)+
		dbf	d7,_orLoop
		rts

; ---------------------------------------------------------------------------

; Tile-number run, %11rrrrrr form: values ascending from the
; last incremental value (d1).
DecompTM_IncrementalFill:
		move.b	d0,d7
		andi.w	#$003F,d7
		move.w	d1,d0
		andi.w	#$07FF,d0

_incLoop:
		addq.w	#$01,d0
		or.w	d0,(a1)+
		dbf	d7,_incLoop
		rts

; ---------------------------------------------------------------------------
		jsr	(j_FadeToBlack).l	  ; Unreachable leftover.

		modend
