VDPCopy	module

ClearAndRefreshVDPSpriteTableDMA:
		bsr.s	ClearScrollPlanes
		bsr.s	ClearVDPSpriteTable

UpdateVDPSpriteTableDMA:
		lea	(VDP_CTRL_REG).l,a6
		move.w	#$8134,(a6)		  ; #1 - Enable	display, HInt, HV counters
		move.l	#$94019340,(a6)		  ; #20	- DMA Len hi 0x01, #19 - DMA Len lo 0x40
						  ; DMA	LENGTH = 0x140
		move.l	#$968295A8,(a6)		  ; #22	- DMA Src Mid 0x82, #21	DMA Src	Lo 0xA8
		move.l	#$977F5400,(a6)		  ; #23	- DMA Src Hi 0x7F, DMA Dest Lo = 0x1400
						  ; DMA	SRC ADDRESS = 0xFF0550 = VDP Sprite Table
		move.w	#$0083,(g_DMADestHi).l	  ; DMA	Dest Hi	= 0x03
						  ; DMA	DEST ADDRESS = VRAM 0xD400 = Sprite table base
		move.w	(g_DMADestHi).l,(a6)
		move.w	(g_VDPReg01_ModeSet2).l,(a6)
		rts


ClearVDPSpriteTable:
		movem.l	d0-d1/a0,-(sp)
		lea	(g_VDPSpr00_Y).l,a0
		moveq	#$4F,d1
		moveq	#$01,d0

_clrSprLoop:
		move.l	d0,(a0)+
		clr.l	(a0)+
		addq.b	#$01,d0
		dbf	d1,_clrSprLoop
		clr.b	-5(a0)
		movem.l	(sp)+,d0-d1/a0
		rts


ClearScrollPlanes:
		movem.l	d7/a6,-(sp)
		move.w	#$C000,d0
		move.w	#$0FFF,d1
		clr.w	d2
		bsr.w	DoDMAFill		  ; d0 - Fill destination address VDP
						  ; d1 - Fill length bytes
						  ; d2 - Fill pattern
		move.w	#$E000,d0
		move.w	#$0FFF,d1
		clr.w	d2
		bsr.w	DoDMAFill		  ; d0 - Fill destination address VDP
						  ; d1 - Fill length bytes
						  ; d2 - Fill pattern
		movem.l	(sp)+,d7/a6
		rts


WaitUntilVBlank:
		bsr.w	Return
		bsr.w	UpdateFridayAnimation
		bset	#INTF_FRAME,(g_InterruptFlags).l

_vblankWait:
		btst	#INTF_FRAME,(g_InterruptFlags).l
		bne.s	_vblankWait
		rts


; Sleeps for d0	frames.

Sleep:
		movem.w	d0,-(sp)

_sleepLoop:
		bsr.s	WaitUntilVBlank
		dbf	d0,_sleepLoop
		movem.w	(sp)+,d0
		rts


EnableVRAMCopyQueueProcessing:
		bset	#INTF_VRAM_COPY,(g_InterruptFlags).l
		rts


FlushVRAMCopyQueue:
		bsr.s	EnableVRAMCopyQueueProcessing
		bra.w	WaitUntilVBlank


EnableDMAQueueProcessing:
		bset	#INTF_DMA_QUEUE,(g_InterruptFlags).l
		rts


FlushDMACopyQueue:
		bsr.s	EnableDMAQueueProcessing
		bra.w	WaitUntilVBlank


; The routines from here to CopyToPlaneB write tilemap cells (d0 =
; tile word, d5/d6 = cell x/y relative to the scroll position) to
; plane A/B VRAM via the VRAM copy queue, mirroring each write into
; the RAM copies of the planes at $FFC000/$FFE000. They assume a
; 32-cell-wide plane (row stride $40), which doesn't match the
; game's 64-cell setup, and are only reachable through unreferenced
; thunks - leftovers from an earlier engine.
WritePlaneACell:
		movem.l	d7/a4-a5,-(sp)
		movea.l	(g_VRAMCopyQueuePtr).l,a4
		moveq	#$00,d7
		move.w	d7,(a4)+
		bsr.s	CalcPlaneCellAddrs
		move.w	a6,(a4)+

_cellFinish:
		move.w	d0,(a4)+
		move.l	a4,(g_VRAMCopyQueuePtr).l
		move.b	#$01,(g_VRAMCopyQueueLen).l
		clr.l	d7
		move.w	a6,d7
		ori.l	#RAM_Start,d7
		movea.l	d7,a6
		move.w	d0,(a6)
		movem.l	(sp)+,d7/a4-a5
		rts


WritePlaneBCell:
		movem.l	d7/a4-a5,-(sp)
		movea.l	(g_VRAMCopyQueuePtr).l,a4
		moveq	#$00,d7
		move.w	d7,(a4)+		  ; Single word	copy
		bsr.s	CalcPlaneCellAddrs
		bsr.s	SwapPlaneAddr
		move.w	a6,(a4)+
		bra.s	_cellFinish


; Converts cell x/y in d5/d6 into scroll-adjusted VRAM addresses:
; returns a6 with the plane A ($C000-based) address in the low word
; and the plane B ($E000-based) address in the high word.
CalcPlaneCellAddrs:
		movem.l	d5-d7,-(sp)
		lea	($E000).l,a6		  ; 0xE000 - Scroll B data
		lsl.w	#$01,d5
		move.w	(g_HorizontalScrollData+2).l,d7
		lsr.w	#$02,d7
		add.w	d7,d5
		andi.w	#$003E,d5
		lsl.w	#$06,d6
		move.w	(g_VSRAMData+2).l,d7
		lsl.w	#$03,d7
		add.w	d7,d6
		andi.w	#$07C0,d6
		or.w	d6,d5
		adda.w	d5,a6
		bsr.s	SwapPlaneAddr
		movem.l	(sp)+,d5-d6
		movem.l	d5-d6,-(sp)
		adda.l	#$C000,a6
		lsl.w	#$01,d5
		move.w	(g_HorizontalScrollData).l,d7
		lsr.w	#$02,d7
		add.w	d7,d5
		andi.w	#$003E,d5
		lsl.w	#$06,d6
		move.w	(g_VSRAMData).l,d7
		lsl.w	#$03,d7
		add.w	d7,d6
		andi.w	#$07C0,d6
		or.w	d6,d5
		adda.w	d5,a6
		movem.l	(sp)+,d5-d7
		andi.w	#$003E,d5
		andi.w	#$07C0,d6
		rts


; Swaps the two packed plane addresses in a6 (selects plane B).
SwapPlaneAddr:
		movem.l	d7,-(sp)
		move.l	a6,d7
		swap	d7
		movea.l	d7,a6
		movem.l	(sp)+,d7
		rts


; Copies a g_PlaneCopySize rectangle of cells from a4 (g_Buffer for
; the first entry point) to the plane and its RAM mirror, one queued
; row at a time.
CopyBufferToPlaneA:
		lea	(g_Buffer).l,a4

CopyToPlaneA:
		movem.l	d5-d6,-(sp)
		move.w	(g_PlaneCopyXY).l,d5
		lsr.w	#$08,d5
		move.w	(g_PlaneCopyXY).l,d6
		andi.w	#$00FF,d6
		bsr.w	CalcPlaneCellAddrs
		movem.l	(sp)+,d5-d6

_copyRows:
		movem.l	d3-d4/a3-a6,-(sp)
		clr.l	d3
		move.w	a6,d3
		ori.l	#RAM_Start,d3
		movea.l	d3,a3
		movea.l	(g_VRAMCopyQueuePtr).l,a5
		move.w	(g_PlaneCopySize).l,d3
		andi.l	#$FF,d3
		move.b	d3,(g_VRAMCopyQueueLen).l
		subq.w	#$01,d3

_rowLoop:
		movem.l	a3,-(sp)
		move.w	(g_PlaneCopySize).l,d4
		andi.l	#$0000FF00,d4
		lsr.w	#$08,d4
		subq.w	#$01,d4
		move.w	d4,(a5)+
		move.w	a6,(a5)+

_cellLoop:
		move.w	(a4),(a5)+
		move.w	(a4)+,(a3)+
		dbf	d4,_cellLoop
		adda.w	#$0040,a6
		movem.l	(sp)+,a3
		adda.w	#$0040,a3
		dbf	d3,_rowLoop
		movem.l	(sp)+,d3-d4/a3-a6
		bra.w	FlushVRAMCopyQueue

CopyToPlaneB:
		movem.l	d5-d6,-(sp)
		move.w	(g_PlaneCopyXY).l,d5
		lsr.w	#$08,d5
		move.w	(g_PlaneCopyXY).l,d6
		andi.w	#$00FF,d6
		bsr.w	CalcPlaneCellAddrs
		movem.l	(sp)+,d5-d6
		bsr.w	SwapPlaneAddr
		bra.w	_copyRows


; Immediate VRAM DMA with interrupts disabled.
; d0 = DMA Length (words)
; a0 = DMA Source
; a1 = DMA Destination
; Transfers that cross a 128KB source bank are split into two DMAs.

DoDMACopy:
		movem.l	d2/d7,-(sp)
		move	sr,-(sp)
		move	#$2700,sr		  ; Disable interrupts

_dmaChunk:
		movem.l	d0/a0-a1/a6,-(sp)
		lea	(VDP_CTRL_REG).l,a6	  ; VDP	Control
		move.w	(g_VDPReg01_ModeSet2).l,d7
		ori.b	#$10,d7			  ; SET	Enable DMA bit
		move.w	d7,(a6)
		move.l	#$94009300,d2		  ; 94:	DMA Count Hi
						  ; 93:	DMA Count Lo
		move.b	d0,d2			  ; OR with d0 - prepare DMA count
		lsl.l	#$08,d0
		andi.l	#$00FF0000,d0
		or.l	d0,d2
		move.l	d2,(a6)
		move.l	#$96009500,d2		  ; 96:	DMA Source Mid
						  ; 95:	DMA Source Lo
		move.l	a0,d0			  ; a0 - DMA Source Address
		lsr.l	#$01,d0
		move.b	d0,d2
		lsl.l	#$08,d0
		andi.l	#$00FF0000,d0
		or.l	d0,d2
		move.l	d2,(a6)
		move.l	a0,d0
		swap	d0
		lsr.w	#$01,d0
		ori.w	#$9700,d0		  ; 97:	DMA Source Hi
		move.w	d0,(a6)
		move.w	a1,d0			  ; a1:	DMA Destination
		andi.w	#$3FFF,d0
		ori.w	#$4000,d0		  ; 40:	DMA Destination	Lo
		move.w	d0,(a6)
		move.w	a1,d0
		rol.w	#$02,d0
		andi.w	#$0003,d0
		ori.b	#$80,d0
		move.w	d0,(g_DMADestHi).l
		move.w	(g_DMADestHi).l,(a6)	  ; 00:	Destination Hi
		move.w	(g_VDPReg01_ModeSet2).l,(a6)
		movem.l	(sp)+,d0/a0-a1/a6
		clr.l	d2
		move.w	d0,d2
		add.w	d2,d2
		move.l	a0,d7
		swap	d7
		adda.l	d2,a0
		adda.w	d2,a1
		move.l	a0,d2
		swap	d2
		cmp.b	d2,d7
		beq.s	_dmaDone
		swap	d2
		suba.w	d2,a1
		lsr.w	#$01,d2
		move.w	d2,d0
		clr.w	d2
		movea.l	d2,a0
		bra.w	_dmaChunk

_dmaDone:
		move	(sp)+,sr
		movem.l	(sp)+,d2/d7
		rts


; Queues a VRAM DMA (same registers as DoDMACopy) into g_DMAOpQueue
; for ProcessQueuedDMAOps to run during the next VBlank/HBlank,
; splitting on 128KB source bank crossings.
; d0 - DMA Length (words)
; a0 - DMA Source
; a1 - DMA Destination

QueueDMAOp:
		movem.l	d2/d7,-(sp)

_queueChunk:
		movem.l	d0/a0-a1/a6,-(sp)
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.w	#$8F02,(a6)+
		move.l	#$94009300,(a6)+	  ; DMA	LENGTH (Regs #19 and #20)
		movep.w	d0,-$03(a6)
		move.l	a0,d0
		lsr.l	#$01,d0
		move.l	#$96009500,(a6)+	  ; DMA	SOURCE ADDR LOW	(Regs #22 and #21)
		movep.w	d0,-$03(a6)
		move.l	a0,d0
		swap	d0
		lsr.w	#$01,d0
		ori.w	#$9700,d0		  ; DMA	SOURCE ADDR HI (Reg #23)
		move.w	d0,(a6)+
		move.w	a1,d0
		andi.w	#$3FFF,d0
		ori.w	#$4000,d0
		move.w	d0,(a6)+
		move.w	a1,d0
		rol.w	#$02,d0
		andi.w	#$0003,d0
		ori.b	#$80,d0			  ; DMA	DEST ADDRESS
		move.w	d0,(a6)+
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		movem.l	(sp)+,d0/a0-a1/a6
		moveq	#$00,d2
		move.w	d0,d2
		add.w	d2,d2
		move.l	a0,d7
		swap	d7
		adda.l	d2,a0
		adda.w	d2,a1
		move.l	a0,d2
		swap	d2
		cmp.b	d2,d7
		beq.s	_queueDone
		swap	d2
		suba.w	d2,a1
		lsr.w	#$01,d2
		beq.s	_queueDone
		move.w	d2,d0
		clr.w	d2
		movea.l	d2,a0
		bra.w	_queueChunk

_queueDone:
		movem.l	(sp)+,d2/d7
		rts


SetVRAMAddressOnVDP:
		movem.w	d7,-(sp)
		move.w	a6,d7
		andi.w	#$3FFF,d7
		ori.w	#$4000,d7
		move.w	d7,(VDP_CTRL_REG).l
		move.w	a6,d7
		lsr.w	#$08,d7
		lsr.w	#$06,d7
		move.w	d7,(VDP_CTRL_REG).l
		movem.w	(sp)+,d7
		rts


QueueHScrollDMAUpdate:
		movem.l	a6,-(sp)
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029402,(a6)+	  ; Auto-increment = 2,	DMA Len	Hi = 0x02
		move.l	#$93009680,(a6)+	  ; DMA	Length Lo = 0x00, DMA Source Mid = 0x80
						  ; DMA	LENGTH 0x200
		move.l	#$9580977F,(a6)+	  ; DMA	Source Lo = 0x80, DMA Source Hi	= 0x7F
						  ; DMA	SOURCE ADDR = 0xFF0100
		move.l	#$50000083,(a6)+	  ; DMA	Dest VRAM 0xD000 - HScroll Data
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		movem.l	(sp)+,a6
		rts


FillHScrollData:
		movem.l	d7/a6,-(sp)
		lea	(g_HorizontalScrollData).l,a6

_fillHScroll:
		move.w	#$00FF,d7

_fillHLoop:
		move.w	d6,(a6)+
		addq.w	#$02,a6
		dbf	d7,_fillHLoop
		movem.l	(sp)+,d7/a6
		bra.s	QueueHScrollDMAUpdate


FillHScrollDataOffset1:
		movem.l	d7/a6,-(sp)
		lea	((g_HorizontalScrollData+2)).l,a6
		bra.s	_fillHScroll


QueueVSRAMUpdate:
		movem.l	a6,-(sp)
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029400,(a6)+	  ; Auto-increment 2, DMA Len Hi 0
		move.l	#$93289682,(a6)+	  ; DMA	Len Lo 0x28, DMA Source	Mid 0x82
						  ; DMA	LENGTH 0x28
		move.l	#$9580977F,(a6)+	  ; DMA	Source Low 0x80, DMA Source Hi 0x7F
						  ; DMA	SOURCE 0xFF0500	= VSRAM	Table
		move.l	#$40000090,(a6)+	  ; DMA	DEST VSRAM 0x0000
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		movem.l	(sp)+,a6
		rts


FillVSRAM:
		movem.l	d7/a6,-(sp)
		lea	(g_VSRAMData).l,a6

_fillVSRAM:
		move.w	#$0013,d7

_fillVLoop:
		move.w	d6,(a6)+
		addq.w	#$02,a6
		dbf	d7,_fillVLoop
		movem.l	(sp)+,d7/a6
		bra.s	QueueVSRAMUpdate


FillVSRAMOffset1:
		movem.l	d7/a6,-(sp)
		lea	((g_VSRAMData+2)).l,a6
		bra.s	_fillVSRAM


; d0 - Fill destination	address	VDP
; d1 - Fill length bytes
; d2 - Fill pattern

DoDMAFill:
		movem.l	d0-d3,-(sp)
		move.w	(g_VDPReg01_ModeSet2).l,d3
		ori.b	#$10,d3			  ; Enable DMA
		move.w	d3,(VDP_CTRL_REG).l
		move.w	#$8F01,(VDP_CTRL_REG).l	  ; Auto-increment 1
		movem.l	d1,-(sp)
		andi.w	#$00FF,d1
		ori.w	#$9300,d1		  ; DMA	Length Low
		move.w	d1,(VDP_CTRL_REG).l
		movem.l	(sp)+,d1
		lsr.w	#$08,d1
		ori.w	#$9400,d1		  ; DMA	Length Hi
		move.w	d1,(VDP_CTRL_REG).l
		move.w	#$9780,(VDP_CTRL_REG).l	  ; DMA	Source Hi = VRAM-FILL
		movem.l	d0,-(sp)
		andi.w	#$3FFF,d0
		ori.w	#$4000,d0
		move.w	d0,(VDP_CTRL_REG).l	  ; Fill dest low
		movem.l	(sp)+,d0
		rol.w	#$02,d0
		andi.w	#$0003,d0
		ori.w	#$0080,d0
		move.w	d0,(VDP_CTRL_REG).l	  ; Fill dest hi
		move.w	d2,(VDP_DATA_REG).l	  ; Fill pattern

_fillWait:
		move.w	(VDP_CTRL_REG).l,d0
		andi.w	#$0002,d0
		bne.s	_fillWait			  ; Wait until DMA complete
		move.w	(g_VDPReg01_ModeSet2).l,d3
		move.w	d3,(VDP_CTRL_REG).l	  ; Disable DMA
		move.w	#$8F02,(VDP_CTRL_REG).l	  ; Set	auto-increment back to 2
		movem.l	(sp)+,d0-d3
		rts

		modend
