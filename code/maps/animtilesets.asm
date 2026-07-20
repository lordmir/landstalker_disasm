AnimTilesets	module
; Animated map tiles (water, lava, machinery...). LoadAnimTiles sets
; up to two animation slots for the room's tileset at room load;
; UpdateAnimTiles ticks every game-loop frame (and during the chest
; opening animation) and DMAs the next frame's tiles into VRAM when a
; slot's delay elapses. Per-slot state, 4 bytes each in three arrays:
;   g_AnimTileState+4n:   {frame delay, frame count, tick, frame}
;   g_AnimTileTargets+4n: {VRAM address, DMA length in words}
;   g_AnimTileGfxPtrs+4n: source graphics address (long)

; Scans AnimatedTilesetIdxs (one byte per 10-byte AnimatedTilesetData
; entry, $FF-terminated) for the current tileset; a tileset listed
; twice gets both slots. Each matching entry provides the VRAM
; target, frame delay/count, and (via the TilesetXXAnimYYPtr pointer
; table) the source graphics address.
LoadAnimTiles:
		lea	(g_AnimTileState).l,a4
		lea	(g_AnimTileTargets).l,a5
		lea	(g_AnimTileGfxPtrs).l,a6
		clr.w	(a5)
		clr.w	$00000004(a5)
		move.b	(g_CurrentTileset).l,d0
		clr.w	d1
		lea	AnimatedTilesetIdxs(pc),a0
		nop

_scanIdxs:
		move.b	(a0)+,d2
		bmi.s	_scanDone
		cmp.b	d2,d0
		beq.s	_match

_nextIdx:
		addq.w	#$01,d1
		bra.s	_scanIdxs

_match:
		move.w	d1,d3
		mulu.w	#$000A,d3
		lea	AnimatedTilesetData(pc),a1
		nop
		move.w	(a1,d3.w),(a5)+		  ; VRAM address
		move.w	$00000002(a1,d3.w),(a5)+  ; DMA length (words)
		move.b	$00000004(a1,d3.w),(a4)+  ; frame delay
		cmpi.w	#ROOM_MERCATOR_DOCKED_SHIP,(g_CurrentRoom).l	  ; Ship
		bne.s	_normalFrames
		move.b	#$02,(a4)+		  ; aboard the docked ship the
		bra.s	_storeGfx		  ; frame count is capped at 2

_normalFrames:
		move.b	$00000005(a1,d3.w),(a4)+  ; frame count

_storeGfx:
		movea.l	$00000006(a1,d3.w),a3	  ; entry holds the address of a
		move.l	(a3),(a6)+		  ; TilesetXXAnimYYPtr; the long
		clr.b	(a4)+			  ; there is the gfx source
		clr.b	(a4)+			  ; clear tick + frame
		bra.s	_nextIdx

_scanDone:
		rts

; Per-frame update: advance both slots, falling through from the
; first into the second with the pointers stepped one slot on.
UpdateAnimTiles:
		lea	(g_AnimTileState).l,a4
		lea	(g_AnimTileTargets).l,a5
		lea	(g_AnimTileGfxPtrs).l,a6
		bsr.s	_updateSlot
		addq.w	#$04,a4
		addq.w	#$04,a5
		addq.w	#$04,a6

; Ticks one slot: waits out the frame delay, then steps to the next
; frame (wrapping at the frame count) and queues a DMA of that
; frame's tiles - source = gfx base + frame * length * 2 bytes.
_updateSlot:
		move.w	(a5),d0
		beq.s	_slotDone		  ; no animation in this slot
		movea.w	d0,a1			  ; a1 = VRAM address
		move.b	$00000002(a4),d0
		addq.b	#$01,d0
		cmp.b	(a4),d0
		bcc.s	_advanceFrame
		addq.b	#$01,$00000002(a4)	  ; still waiting: bump the tick
		bra.s	_slotDone

_advanceFrame:
		clr.b	$00000002(a4)
		move.b	$00000003(a4),d1
		addq.b	#$01,d1
		cmp.b	$00000001(a4),d1
		bcs.s	_queueDma
		move.b	#$FF,$00000003(a4)	  ; wrap to frame 0
		clr.b	d1

_queueDma:
		addq.b	#$01,$00000003(a4)
		ext.w	d1
		add.b	d1,d1
		move.w	$00000002(a5),d0
		mulu.w	d0,d1			  ; d1 = frame * length * 2
		movea.l	(a6),a0
		adda.l	d1,a0
		jsr	(QueueDMAOp).l		  ; d0 - DMA Length
						  ; a0 - DMA Source
						  ; a1 - DMA Copy

_slotDone:
		rts

		modend
