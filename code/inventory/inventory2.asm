Inventory2	module
; Hand-built DMA queue entries for the menu, textbox and HUD
; tilemaps. Each writes four longs straight into the DMA op queue:
; auto-increment 2 + length high, length low + source mid, source
; low + source high, then the VRAM destination command word. The
; window plane sits at VRAM $F000 ($80 bytes per row): rows 0-2 are
; the HUD, row 3 on is the inventory menu, rows 20-23 the textbox.

; The menu tilemap (g_InventoryTilemap, $4C0 words) into the window
; plane from row 3.
QueueInventoryWinTilemapDMA:
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029404,(a6)+	  ; Auto-increment 2, DMA Length Hi 0x04
		move.l	#$93C0968E,(a6)+	  ; DMA	Length Low 0xC0, DMA Source Mid	0x8E
						  ; DMA	LENGTH 0x04C0
		move.l	#$95C0977F,(a6)+	  ; DMA	Source Lo = 0xC0, DMA Source Hi	= 0x7F
						  ; DMA	SOURCE ADDR = 0xFF1D80 (g_InventoryTilemap)
		move.l	#$71800083,(a6)+	  ; DMA	Dest Addr: VRAM	0xF180
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		rts

; $4C0 words from g_ForegroundBlocks+$17E into plane B from row 3
; (VRAM $E180) - the buffer CheckForMenuOpen blanks behind the
; menu.
QueueInventoryScrBTilemapDMA:
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029404,(a6)+	  ; Auto-increment 2, DMA Length Hi = 0x04
		move.l	#$93C096BE,(a6)+	  ; DMA	Len Lo = 0xC0, DMA Source Mid =	0xBE
						  ; DMA	LENGTH = 0x04C0
		move.l	#$95C0977F,(a6)+	  ; DMA	Source Lo = 0xC0, DMA Source Hi	= 0x7F
						  ; DMA	SOURCE ADDR = 0xFF7D80 (g_ForegroundBlocks+$17E)
		move.l	#$61800083,(a6)+	  ; DMA	DEST ADDR: VRAM	0xE180
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		rts

; The textbox tilemap (g_TextBoxLine1, $200 words = 4 rows) into
; window plane rows 20-23 (VRAM $FA00).
QueueTextboxTilemapDMA:
		movem.l	a6,-(sp)
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029402,(a6)+	  ; Auto-increment 2, DMA Length hi = 2
		move.l	#$93009693,(a6)+	  ; DMA	Length lo = 0, DMA Source mid =	0x93
						  ; DMA	LENGTH = 0x200
		move.l	#$9500977F,(a6)+	  ; DMA	Source Low = 0x00, DMA Source Hi = 0x7F
						  ; DMA	SOURCE ADDR = 0xFF2600 (g_TextBoxLine1)
		move.l	#$7A000083,(a6)+	  ; DMA	DEST ADDR: VRAM	0xFA00
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		movem.l	(sp)+,a6
		rts

; $64 words from g_HUD_Row2+4 to VRAM $F084: just the gauge and
; number area of HUD rows 2-3 (the part RefreshHUD marks dirty).
QueuePartialHUDTilemapDMA:
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029400,(a6)+	  ; Auto-increment 2, DMA Length hi = 0
		move.l	#$9364968E,(a6)+	  ; DMA	Length lo = 0x64, DMA Source mid = 0x8E
						  ; DMA	LENGTH = 0x064
		move.l	#$9542977F,(a6)+	  ; DMA	Source Low = 0x42, DMA Source Hi = 0x7F
						  ; DMA	SOURCE ADDR = 0xFF1C84 (g_HUD_Row2+4)
		move.l	#$70840083,(a6)+	  ; DMA	DEST ADDR = 0xF084
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		rts

; All three HUD rows (g_HUD_Row1, $C0 words) to the top of the
; window plane (VRAM $F000).
QueueFullHUDTilemapDMA:
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029400,(a6)+	  ; Auto-increment 2, DMA Length hi = 0
		move.l	#$93C0968E,(a6)+	  ; DMA	Length lo = 0xC0, DMA Source mid = 0x8E
						  ; DMA	LENGTH = 0x0C0
		move.l	#$9500977F,(a6)+	  ; DMA	Source Low = 0x00, DMA Source Hi = 0x7F
						  ; DMA	SOURCE ADDR = 0xFF1C00 (g_HUD_Row1)
		move.l	#$70000083,(a6)+	  ; DMA	DEST ADDR = 0xF000
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		rts

; The whole 28-row window plane ($700 words from g_HUD_Row1: HUD,
; menu and textbox buffers back to back) to VRAM $F000.
QueueFullWindowTilemapDMA:
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029407,(a6)+	  ; Auto-increment 2, DMA Length hi = 0x07
		move.l	#$9300968E,(a6)+	  ; DMA	Length lo = 0x00, DMA Source mid = 0x8E
						  ; DMA	LENGTH = 0x700
		move.l	#$9500977F,(a6)+	  ; DMA	Source Low = 0x00, DMA Source Hi = 0x7F
						  ; DMA	SOURCE ADDR = 0xFF1C00 (g_HUD_Row1)
		move.l	#$70000083,(a6)+	  ; DMA	DEST ADDR = 0xF000
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l
		rts

	modend
