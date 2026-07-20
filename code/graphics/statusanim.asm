StatusAnim	module
; Streams the animated status-effect icon graphics for the marker
; drawn above the player's head (the sprite piece gamelogic3 adds
; at tile $514 when any status bit is set). d1 = the player's
; status bits; the highest-priority active effect wins: curse >
; paralysis > confusion > poison. Every 8th call the next frame is
; decompressed to g_Buffer and copied to VRAM $A280 - the poison,
; confusion and paralysis icons cycle 4 frames, the curse icon 2.
; While the H-int line is set to $18 the copy runs synchronously
; (j_LoadCompressedGfx) instead of through the DMA queue.
LoadStatusGfx:
		move.b	(g_StatusAnimCounter).l,d0
		addq.b	#$01,(g_StatusAnimCounter).l
		andi.b	#$07,d0
		bne.s	_done
		move.b	#$08,d0
		lea	CurseAnim(pc),a0
		btst	#STATUS_CURSE,d1
		bne.s	_pickFrame
		move.b	#$18,d0
		lea	ParalysisAnim(pc),a0
		btst	#STATUS_PARALYSIS,d1
		bne.s	_pickFrame
		lea	ConfusionAnim(pc),a0
		btst	#STATUS_CONFUSION,d1
		bne.s	_pickFrame
		lea	PoisonAnim(pc),a0

; Frame = (counter & mask) / 2: a longword offset into the effect's
; pointer table (mask $18 = 4 frames, $08 = 2), advancing one frame
; per 8 calls.
_pickFrame:
		moveq	#$00000000,d1
		move.b	(g_StatusAnimCounter).l,d1
		and.b	d0,d1
		lsr.b	#$01,d1
		adda.l	d1,a0
		movea.l	(a0),a0
		lea	(g_Buffer).l,a1
		lea	($0000A280).l,a2
		cmpi.b	#$18,(g_VDPReg10_HIntLine+1).l
		beq.s	_loadNow
		jmp	(j_DecompressAndQueueGfxCopy).l
; ---------------------------------------------------------------------------

_loadNow:
		jsr	(j_LoadCompressedGfx).l	  ; a0 - compressed graphics source
						  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination

_done:
		rts

	modend
