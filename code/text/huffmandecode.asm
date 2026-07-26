HuffmanDecode	module
; The huffman string decoder, the dialogue yes/no prompt and the
; item menu's Use/Equip prompt.

; Reset the decoder for a new string: the tree context starts as
; CHR_STR_BEGIN (every string follows one) with no bits buffered.
InitHuffmanDecomp:
		move.b	#CHR_STR_BEGIN,(g_HuffPrevChar).l
		clr.w	(g_HuffSrcBitCount).l
		clr.w	(g_HuffSrcByte).l
		rts

; Decode one character from the compressed stream at a0 (left
; pointing past the last byte consumed). The encoding is contextual:
; the previous character (g_HuffPrevChar) selects a tree through
; HuffTableOffsets/HuffTables. A tree is a bit stream - 0 = internal
; node, 1 = leaf - with its leaf characters stored in reverse order
; in the bytes just before the tree.
;
; Walk: at each internal node read one source bit; 0 descends into
; the next subtree, 1 skips it whole (d4 tracks depth, d5 counts the
; leaves passed). Landing on a leaf bit ends the walk: the character
; is the |d5|'th byte before the tree start. The partial source byte
; and its bit count persist across calls (g_HuffSrcByte /
; g_HuffSrcBitCount, accessed via a3; -$22(a3) = g_HuffPrevChar).
DecodeChar:
		movem.l	d1-d7/a1-a3,-(sp)
		lea	(g_HuffSrcBitCount).l,a3
		move.w	(a3),d6
		move.w	-$00000002(a3),d7	  ; g_HuffSrcByte
		clr.w	d1
		move.b	-$00000022(a3),d1	  ; g_HuffPrevChar picks the tree
		add.w	d1,d1
		lea	HuffTableOffsets(pc),a1
		move.w	(a1,d1.w),d1
		lea	HuffTables(pc),a1
		adda.w	d1,a1
		movea.l	a1,a2			  ; a2 - tree start (chars before it)
		clr.w	d3
		clr.w	d5			  ; d5 - leaf index (negative)

_dcNextNode:
		dbf	d3,_SkipReadingHuffByte
		moveq	#$00000007,d3		  ; d3 - Tree bit counter
		move.b	(a1)+,d2		  ; d2 - Tree byte

_SkipReadingHuffByte:
		add.b	d2,d2
		bcs.s	_dcLeaf			  ; Tree bit set: landed on our leaf
		dbf	d6,_SkipReadingStringByte
		moveq	#$00000007,d6		  ; d6 - Src String Bit	Counter
		move.b	(a0)+,d7		  ; d7 - Src String Byte

_SkipReadingStringByte:
		add.b	d7,d7
		bcc.s	_dcNextNode		  ; Source bit clear: descend
		clr.w	d4			  ; d4 - skipped subtree depth

_dcSkipTree:
		dbf	d3,_SkipReadingHuffByte1  ; Get	next tree bit
		moveq	#$00000007,d3
		move.b	(a1)+,d2

_SkipReadingHuffByte1:
		add.b	d2,d2
		bcs.s	_dcSkipLeaf
		addq.w	#$01,d4			  ; Internal node: one level deeper
		bra.s	_dcSkipTree
; ---------------------------------------------------------------------------

_dcSkipLeaf:
		subq.w	#$01,d5			  ; Pass this subtree's leaf
		dbf	d4,_dcSkipTree		  ; Pop; subtree done when depth runs out
		bra.s	_dcNextNode
; ---------------------------------------------------------------------------

_dcLeaf:
		move.b	-$00000001(a2,d5.w),d0	  ; Leaf chars stored backwards before the tree
		move.w	d6,(a3)
		move.w	d7,-$00000002(a3)
		move.b	d0,-$00000022(a3)	  ; New context char
		movem.l	(sp)+,d1-d7/a1-a3
		rts
	modend
