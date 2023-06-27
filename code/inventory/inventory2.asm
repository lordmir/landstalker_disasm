
; =============== S U B	R O U T	I N E =======================================


QueueInventoryWinTilemapDMA:			  ; CODE XREF: ROM:00000452j
						  ; InitInvDisplay+26p	...
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029404,(a6)+	  ; Auto-increment 2, DMA Length Hi 0x04
		move.l	#$93C0968E,(a6)+	  ; DMA	Length Low 0xC0, DMA Source Mid	0x8E
						  ; DMA	LENGTH 0x04C0
		move.l	#$95C0977F,(a6)+	  ; DMA	Source Lo = 0xC0, DMA Source Hi	= 0x7F
						  ; DMA	SOURCE ADDR = 0xFF1D80
		move.l	#$71800083,(a6)+	  ; DMA	Dest Addr: VRAM	0xF180
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		rts
; End of function QueueInventoryWinTilemapDMA


; =============== S U B	R O U T	I N E =======================================


QueueInventoryScrBTilemapDMA:			  ; CODE XREF: ROM:00000458j
						  ; CheckForMenuOpen+84p ...
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029404,(a6)+	  ; Auto-increment 2, DMA Length Hi = 0x04
		move.l	#$93C096BE,(a6)+	  ; DMA	Len Lo = 0xC0, DMA Source Mid =	0xBE
						  ; DMA	LENGTH = 0x04C0
		move.l	#$95C0977F,(a6)+	  ; DMA	Source Lo = 0xC0, DMA Source Hi	= 0x7F
						  ; DMA	SOURCE ADDR = 0xFF7D80
		move.l	#$61800083,(a6)+	  ; DMA	DEST ADDR: VRAM	0xE180
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		rts
; End of function QueueInventoryScrBTilemapDMA


; =============== S U B	R O U T	I N E =======================================


QueueTextboxTilemapDMA:				  ; CODE XREF: j_QueueTextboxTilemapDMAj
						  ; CheckForMenuOpen+4Ap
		movem.l	a6,-(sp)
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029402,(a6)+	  ; Auto-increment 2, DMA Length hi = 2
		move.l	#$93009693,(a6)+	  ; DMA	Length lo = 0, DMA Source mid =	0x93
						  ; DMA	LENGTH = 0x200
		move.l	#$9500977F,(a6)+	  ; DMA	Source Low = 0x00, DMA Source Hi = 0x7F
						  ; DMA	SOURCE ADDR = 0xFF2600
		move.l	#$7A000083,(a6)+	  ; DMA	DEST ADDR: VSRAM 0xFA00
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		movem.l	(sp)+,a6
		rts
; End of function QueueTextboxTilemapDMA


; =============== S U B	R O U T	I N E =======================================


QueuePartialHUDTilemapDMA:			  ; CODE XREF: j_QueueHUDTilemapDMAj
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029400,(a6)+	  ; Auto-increment 2, DMA Length hi = 0
		move.l	#$9364968E,(a6)+	  ; DMA	Length lo = 0x64, DMA Source mid = 0x8E
						  ; DMA	LENGTH = 0x064
		move.l	#$9542977F,(a6)+	  ; DMA	Source Low = 0x42, DMA Source Hi = 0x7F
						  ; DMA	SOURCE ADDR = 0xFF1C84
		move.l	#$70840083,(a6)+	  ; DMA	DEST ADDR = 0xF084
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		rts
; End of function QueuePartialHUDTilemapDMA


; =============== S U B	R O U T	I N E =======================================


QueueFullHUDTilemapDMA:				  ; CODE XREF: j_QueueFullHUDTilemapDMAj
						  ; ROM:00008DBAp
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029400,(a6)+	  ; Auto-increment 2, DMA Length hi = 0
		move.l	#$93C0968E,(a6)+	  ; DMA	Length lo = 0xC0, DMA Source mid = 0x8E
						  ; DMA	LENGTH = 0x0C0
		move.l	#$9500977F,(a6)+	  ; DMA	Source Low = 0x00, DMA Source Hi = 0x7F
						  ; DMA	SOURCE ADDR = 0xFF1C00
		move.l	#$70000083,(a6)+	  ; DMA	DEST ADDR = 0xF000
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		rts
; End of function QueueFullHUDTilemapDMA

; ---------------------------------------------------------------------------

QueueFullWindowTilemapDMA:
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029407,(a6)+	  ; Auto-increment 2, DMA Length hi = 0x07
		move.l	#$9300968E,(a6)+	  ; DMA	Length lo = 0x00, DMA Source mid = 0x8E
						  ; DMA	LENGTH = 0x700
		move.l	#$9500977F,(a6)+	  ; DMA	Source Low = 0x00, DMA Source Hi = 0x7F
						  ; DMA	SOURCE ADDR = 0xFF1C00
		move.l	#$70000083,(a6)+	  ; DMA	DEST ADDR = 0xF000
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		rts
; ---------------------------------------------------------------------------
