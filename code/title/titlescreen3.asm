TitleScreen3	module
; Title screen, part 3 of 3: the remaining build-up palette
; effects, the plane-A reveal of the finished title, and the
; tilemap helpers shared with the title setup (titlescreen1).

; Silhouette collapse (done flag -$18, step counter -$0C): every
; other step, drives palette 0 up toward pure blue and palette 1
; up toward pure yellow via StepPaletteColourUp, leaving a blue
; artwork / yellow logo silhouette. Done after $5A channel
; arrivals.
HandlePaletteScroll2:
		tst.b	-$00000018(a6)
		bpl.s	_hps2Started
		rts
; ---------------------------------------------------------------------------

_hps2Started:
		cmp.w	-$00000002(a6),d0
		bcs.s	_hps2Run
		rts
; ---------------------------------------------------------------------------

_hps2Run:
		move.w	-$0000000C(a6),d0
		ext.l	d0
		clr.l	d6
		andi.b	#$01,d0
		bne.s	_hps2Next
		lea	((g_Pal0Base+2)).l,a0
		moveq	#$0000000E,d7

_hps2LoopBlue:
		lea	_titleBlue(pc),a1
		bsr.s	StepPaletteColourUp
		dbf	d7,_hps2LoopBlue
		lea	((g_Pal1Base+2)).l,a0
		moveq	#$0000000E,d7

_hps2LoopYellow:
		lea	_titleYellow(pc),a1
		bsr.w	StepPaletteColourUp
		dbf	d7,_hps2LoopYellow
		addq.b	#$01,-$0000001D(a6)
		cmpi.b	#$5A,d6
		bcs.s	_hps2Next
		move.b	#$FF,-$00000018(a6)

_hps2Next:
		addq.w	#$01,-$0000000C(a6)
		rts

; ---------------------------------------------------------------------------
_titleBlue:	dc.w $0E00
_titleYellow:	dc.w $00EE

; ---------------------------------------------------------------------------

; Artwork resolve (done flag -$19, step counter -$0E): every 4th
; step, walks the 16 palette-0 colours down toward Title3Palette
; via StepPaletteColourDown. Done after $2D channel arrivals.
FadePal0ToTitle3:
		tst.b	-$00000019(a6)
		bpl.s	_fp0Started
		rts
; ---------------------------------------------------------------------------

_fp0Started:
		cmp.w	-$00000002(a6),d0
		bcs.s	_fp0Run
		rts
; ---------------------------------------------------------------------------

_fp0Run:
		move.w	-$0000000E(a6),d0
		ext.l	d0
		clr.l	d6
		andi.b	#$03,d0
		bne.s	_fp0Next
		lea	(g_Pal0Base).l,a0
		lea	Title3Palette(pc),a1
		moveq	#$0000000F,d7

_fp0Loop:
		bsr.w	StepPaletteColourDown
		dbf	d7,_fp0Loop
		addq.b	#$01,-$0000001D(a6)
		cmpi.b	#$2D,d6
		bcs.s	_fp0Next
		move.b	#$FF,-$00000019(a6)

_fp0Next:
		addq.w	#$01,-$0000000E(a6)
		rts

; ---------------------------------------------------------------------------

; Steps colour (a0) one notch toward target (a1)+: each of the R,
; G, B nibbles drops by 2, clamping at the target, and d6 counts
; how many channels have reached it. Writes the blended colour
; back and advances a0.
StepPaletteColourDown:
		moveq	#$0000000E,d5
		move.w	(a0),d1
		move.w	d1,d2
		move.w	d1,d3
		move.w	(a1),d4
		and.w	d5,d1
		and.w	d5,d4
		subq.w	#$02,d1
		bmi.s	_spdClampR
		cmp.w	d1,d4
		bcs.s	_spdGreen

_spdClampR:
		move.w	d4,d1
		addq.b	#$01,d6

_spdGreen:
		lsl.w	#$04,d5
		move.w	(a1),d4
		and.w	d5,d2
		and.w	d5,d4
		subi.w	#$0020,d2
		bmi.s	_spdClampG
		cmp.w	d2,d4
		bcs.s	_spdBlue

_spdClampG:
		move.w	d4,d2
		addq.b	#$01,d6

_spdBlue:
		lsl.w	#$04,d5
		move.w	(a1)+,d4
		and.w	d5,d3
		and.w	d5,d4
		subi.w	#$0200,d3
		bmi.s	_spdClampB
		cmp.w	d3,d4
		bcs.s	_spdWrite

_spdClampB:
		move.w	d4,d3
		addq.b	#$01,d6

_spdWrite:
		or.w	d2,d1
		or.w	d3,d1
		move.w	d1,(a0)+
		rts

; ---------------------------------------------------------------------------

; One-shot reveal (done flag -$1A), triggered once the silhouette
; collapse (-$18) has finished: loads the finished-title palette
; line 1, blacks out palette 1, then stamps the Title3 tilemap
; over plane A via CopyTitleMapToPlaneA.
RevealTitle3:
		tst.b	-$00000018(a6)
		bmi.s	_rt3Ready
		rts
; ---------------------------------------------------------------------------

_rt3Ready:
		tst.b	-$0000001A(a6)
		bpl.s	_rt3Do
		rts
; ---------------------------------------------------------------------------

_rt3Do:
		lea	Title3PaletteHighlight(pc),a0
		jsr	(j_LoadPaletteToRAM).l
		lea	(g_Pal1Base).l,a0
		moveq	#$0000000F,d7

_rt3Clear:
		clr.w	(a0)+
		dbf	d7,_rt3Clear
		addq.b	#$01,-$0000001A(a6)
		addq.b	#$01,-$0000001D(a6)
		bsr.w	CopyTitleMapToPlaneA
		move.b	#$FF,-$0000001A(a6)
		rts

; ---------------------------------------------------------------------------

; Assembles the finished Title3 tilemap (still in g_Buffer, with
; its width,height header) into the g_TitleCanvasBuffer scratch
; area at a $80-byte row stride, then DMAs $700 words of it to
; plane A and clears plane B. JP/beta use a narrower canvas
; (fixed 40-cell rows); the others take the width from the map.
CopyTitleMapToPlaneA:
		lea	(g_TitleCanvasBuffer).l,a5
		movea.l	a5,a0
	if ((REGION=JP)!(REGION=US_BETA))
		move.w	#$045F,d7
	else
		move.w	#$06FF,d7
	endif

_ctpClear:
		clr.w	(a0)+
		dbf	d7,_ctpClear
		lea	(g_Buffer).l,a0
		clr.w	d6
	if ~((REGION=JP)!(REGION=US_BETA))
		clr.w	d5
	endif
		clr.w	d7
		move.b	(a0)+,d5
		subq.w	#$01,d5
		move.b	(a0)+,d7
		subq.w	#$01,d7
		movea.l	a5,a1

_ctpRow:
		movea.l	a1,a2
		moveq	#$00000027,d6
	if ~((REGION=JP)!(REGION=US_BETA))
		move.w	d5,d6
	endif

_ctpCell:
		move.w	(a0)+,(a1)+
		dbf	d6,_ctpCell
		lea	$00000080(a2),a1
		dbf	d7,_ctpRow
		movea.l	a5,a0
		lea	($0000C000).l,a1
		move.w	#$0700,d0
		moveq	#$00000002,d1
		jsr	(j_QueueDMAOp).l
		move.w	#$E000,d0
		move.w	#$08C0,d1
		clr.l	d2
		jsr	(j_DoDMAFill).l
		rts

; ---------------------------------------------------------------------------

; Logo-palette resolve (done flag -$1B, step counter -$10): every
; 8th step, walks the 16 palette-1 colours up toward Title3Palette
; via StepPaletteColourUp. Done after $30 channel arrivals.
FadePal1ToTitle3:
		tst.b	-$0000001B(a6)
		bpl.s	_fp1Started
		rts
; ---------------------------------------------------------------------------

_fp1Started:
		cmp.w	-$00000002(a6),d0
		bcs.s	_fp1Run
		rts
; ---------------------------------------------------------------------------

_fp1Run:
		move.w	-$00000010(a6),d0
		ext.l	d0
		lea	(g_Pal1Base).l,a0
		lea	Title3Palette(pc),a1
		clr.b	d6
		andi.b	#$07,d0
		bne.s	_fp1Next
		moveq	#$0000000F,d7

_fp1Loop:
		bsr.w	StepPaletteColourUp
		dbf	d7,_fp1Loop
		addq.b	#$01,-$0000001D(a6)
		cmpi.b	#$30,d6
		bcs.s	_fp1Next
		move.b	#$FF,-$0000001B(a6)

_fp1Next:
		addq.w	#$01,-$00000010(a6)
		rts

; ---------------------------------------------------------------------------

; DMAs a decompressed tilemap (g_Buffer: width,height header then
; cells) to VRAM a1 one row at a time, advancing the destination
; by a full plane row ($80) each pass.
CopyTilemapToVDP:
		lea	(g_Buffer).l,a0
		move.b	(a0)+,d0
		ext.w	d0
		move.b	(a0)+,d1
		ext.w	d1
		subq.w	#$01,d1

_ctvRow:
		movem.l	d0-d1/a1,-(sp)
		moveq	#$00000002,d1
		jsr	(j_DoDMACopy).l
		movem.l	(sp)+,d0-d1/a1
		lea	$00000080(a1),a1
		dbf	d1,_ctvRow
		rts

; ---------------------------------------------------------------------------

; Rebases every cell's tile number in the g_Buffer tilemap: minus
; $100 (the base the maps are stored against) plus d0.
ReindexDecompTilemap:
		lea	(g_Buffer).l,a0
		move.b	(a0)+,d7
		ext.w	d7
		subq.w	#$01,d7
		move.b	(a0)+,d6
		ext.w	d6
		subq.w	#$01,d6

_rdtRow:
		move.w	d6,d5

_rdtCell:
		move.w	(a0),d1
		subi.w	#$0100,d1
		add.w	d0,d1
		move.w	d1,(a0)+
		dbf	d5,_rdtCell
		dbf	d7,_rdtRow
		rts

; ---------------------------------------------------------------------------

; ORs the palette bits d2 into every cell of a d6+1 by d7+1 block
; of the g_Buffer tilemap whose top-left is cell (d0,d1). d4 (the
; map's row stride) comes from GetTilePointer.
SetTilemapRectPalette:
		bsr.w	GetTilePointer

_strRow:
		movea.l	a0,a5
		move.w	d6,d5

_strCell:
		move.w	(a0),d0
		andi.w	#$1FFF,d0
		or.w	d2,d0
		move.w	d0,(a0)+
		dbf	d5,_strCell
		lea	(a5,d4.w),a0
		dbf	d7,_strRow
		rts

; ---------------------------------------------------------------------------

; Returns a0 = address of cell (d0,d1) in the g_Buffer tilemap
; (2-byte header, width*2 row stride) and d4 = that row stride.
GetTilePointer:
		lea	(g_Buffer).l,a0
		clr.w	d4
		move.b	(a0)+,d4
		addq.l	#$01,a0
		add.w	d4,d4
		mulu.w	d4,d1
		add.w	d0,d0
		lea	(a0,d1.w),a0
		lea	(a0,d0.w),a0
		rts

; ---------------------------------------------------------------------------

; JP-only Title3 tilemap fixup: shifts a 17 x 5 cell block up and
; left, from (19,14) to (17,13), before the map is copied out.
CopyTitle3BlockJP:
		moveq	#$00000011,d0
		moveq	#$0000000D,d1
		bsr.s	GetTilePointer
		movea.l	a0,a1
		moveq	#$00000013,d0
		moveq	#$0000000E,d1
		bsr.s	GetTilePointer
		moveq	#$00000004,d7

_ctbRow:
		movea.l	a0,a4
		movea.l	a1,a5
		moveq	#$00000010,d5

_ctbCell:
		move.w	(a0)+,(a1)+
		dbf	d5,_ctbCell
		lea	(a4,d4.w),a0
		lea	(a5,d4.w),a1
		dbf	d7,_ctbRow
		rts

		modend
