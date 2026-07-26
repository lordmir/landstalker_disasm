; Bit numbers for g_InterruptFlags ($FF0F8B), the deferred-work flags
; shared between the main thread and the VBlank/HBlank handlers in
; system.asm. The main thread raises a bit to request work; the
; interrupt handler tests and clears (bclr) it once done. Bits 2, 5
; and 6 are unused.

INTF_VRAM_COPY:	 equ $00000000	; VRAM copy queue has entries to flush
					; (set: EnableVRAMCopyQueueProcessing,
					;  consumed: ProcessVRAMCopyQueue)
INTF_SPRITE_LOCK: equ $00000001	; Set = VBlank leaves the sprite table
					; alone (RefreshVDPSpriteTable skips its
					; DMA). NB: the Enable/DisableVDPSprite-
					; Update wrappers set/clear this, so
					; their labels read backwards.
INTF_DMA_QUEUE:	 equ $00000003	; DMA op queue has entries to flush
					; (set: EnableDMAQueueProcessing,
					;  consumed: ProcessQueuedDMAOps)
INTF_VRAM_READ:	 equ $00000004	; VRAM read-back pending. Consumed by
					; ProcessVRAMReadOp but never set by
					; any code - the read path is dead.
INTF_FRAME:	 equ $00000007	; Frame update requested: set by
					; WaitUntilVBlank, cleared by the
					; VBlank handler once the frame's
					; VDP work is done.
