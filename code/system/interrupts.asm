Interrupts	module

; HInt. When the shadow HInt-line register still reads $8AA0 (line
; 160, the textbox split) the handler just re-opens the window to
; full height; otherwise (darkened rooms, HInt on an early line) it
; syncs to the next scanline, blanks the display and writes the
; queued map-block cells (ProcessPendingBlockCopies). Either way, if
; a frame is pending it processes the queued VDP work here instead
; of waiting for VBlank.
HandleHBlankInterrupt:
		bsr.w	DisableInterrupts
		cmpi.w	#$8AA0,(g_VDPReg10_HIntLine).l ; HINT on Line 160
		beq.s	_fullWindow
		movem.l	d0-a6,-(sp)
		move.b	(VDP_HVCTR_REG).l,d0

_hvSyncLoop:
		cmp.b	(VDP_HVCTR_REG).l,d0
		beq.s	_hvSyncLoop
		move.w	#$8124,(VDP_CTRL_REG).l
		move.w	#$8124,(g_VDPReg01_ModeSet2).l
		bsr.w	ProcessPendingBlockCopies

_procQueues:
		btst	#INTF_FRAME,(g_InterruptFlags).l
		beq.s	_hintDone
		bsr.w	ProcessQueuedVDPActions

_hintDone:
		bsr.w	EnableInterrupts
		movem.l	(sp)+,d0-a6
		rte

_fullWindow:
		movem.l	d0-a6,-(sp)
		move.w	#$921C,(VDP_CTRL_REG).l	  ; WINDOW 28 CELLS UP (Fullscreen)
		bra.s	_procQueues


; VBlank. If a frame is pending (flag bit 7, set by WaitUntilVBlank):
; briefly blanks the display, DMAs the sprite table and drains the
; VRAM copy / VRAM read / DMA queues. Always: bumps g_VBlankCounter
; and g_RNG, pumps the sound queue, and advances the play-time clock
; (3600 frames -> minute -> hour).
HandleVBlankInterrupt:
		movem.l	d0-a6,-(sp)
		bclr	#INTF_FRAME,(g_InterruptFlags).l
		beq.s	_vbCounters
		bsr.w	_disableDisplayVBlank
		bsr.w	RefreshVDPSpriteTable
		bsr.s	ProcessQueuedVDPActions

_vbCounters:
		bsr.w	EnableDisplay
		addq.w	#$01,(g_VBlankCounter).l
		addq.w	#$01,(g_RNG).l
		move.w	(g_VDPReg18_WindowVPos).l,(VDP_CTRL_REG).l
		bsr.w	ProcessSoundQueue
		addq.w	#$01,(g_FrameCount).l
		cmpi.w	#3600,(g_FrameCount).l
		bcs.s	_vbDone
		clr.w	(g_FrameCount).l
		addq.w	#$01,(g_MinuteCount).l
		cmpi.w	#60,(g_MinuteCount).l
		bcs.s	_vbDone
		clr.w	(g_MinuteCount).l
		addq.w	#$01,(g_HourCount).l

_vbDone:
		movem.l	(sp)+,d0-a6
		rte


_disableDisplayVBlank:
		andi.b	#$BF,(g_VDPReg01_ModeSet2+1).l
		move.w	(g_VDPReg01_ModeSet2).l,(VDP_CTRL_REG).l
		rts


ProcessQueuedVDPActions:
		bsr.s	ProcessVRAMCopyQueue
		bsr.w	ProcessVRAMReadOp
		bsr.w	ProcessQueuedDMAOps
		rts


ProcessVRAMCopyQueue:
		bclr	#INTF_VRAM_COPY,(g_InterruptFlags).l
		beq.w	_cpqDone
		tst.b	(g_VRAMCopyQueueLen).l
		beq.w	_cpqDone
		lea	(g_VRAMCopyQueue).l,a0

_cpqNext:
		move.w	(a0)+,d0		  ; First word - Copy length + Auto Increment
						  ; BIT	15 Clear = AutoIncrement 2
						  ; BIT	14 Clear = AutoIncrement 0x40
						  ; Bit	14 Set	 = AutoIncrement 0x80
						  ; Remainder	 = Copy	length - 1
		move.w	#$8F02,d1		  ; Reg	#15 - Auto-increment 2
		bclr	#$0F,d0
		beq.s	_cpqSetInc		  ; Set	auto-increment on VDP
		move.w	#$8F40,d1		  ; Reg	#15 - Auto increment 0x40
		bclr	#$0E,d0
		beq.s	_cpqSetInc		  ; Set	auto-increment on VDP
		move.w	#$8F80,d1		  ; Reg	#15 - Auto increment 0x80

_cpqSetInc:
		move.w	d1,(VDP_CTRL_REG).l	  ; Set	auto-increment on VDP
		move.w	(a0)+,d2		  ; Second word	- VRAM Write address
		move.w	d2,d1
		andi.w	#$3FFF,d2
		ori.w	#$4000,d2		  ; Set	VRAM WRITE address
		move.w	d2,(VDP_CTRL_REG).l
		clr.w	d2
		lsl.w	#$01,d1
		roxl.w	#$01,d2
		lsl.w	#$01,d1
		roxl.w	#$01,d2
		move.w	d2,(VDP_CTRL_REG).l	  ; Copy VRAM High address

_cpqData:
		move.w	(a0)+,(VDP_DATA_REG).l	  ; Third+ word	- VRAM Data
		dbf	d0,_cpqData		  ; Copy in VDP	data
		subq.b	#$01,(g_VRAMCopyQueueLen).l
		bne.s	_cpqNext
		move.w	#$8F02,(VDP_CTRL_REG).l	  ; Reset auto-increment value to 2
		move.l	#g_VRAMCopyQueue,(g_VRAMCopyQueuePtr).l

_cpqDone:
		rts


ProcessVRAMReadOp:
		bclr	#INTF_VRAM_READ,(g_InterruptFlags).l
		beq.s	_readDone
		lea	(g_VRAMCopyQueue).l,a0
		move.w	#$8F02,(VDP_CTRL_REG).l	  ; Set	auto-increment to 2
		move.w	(a0),d7
		andi.w	#$3FFF,d7
		move.w	d7,(VDP_CTRL_REG).l
		move.w	(a0)+,d7
		rol.w	#$02,d7
		andi.w	#$0003,d7
		move.w	d7,(VDP_CTRL_REG).l
		move.w	(a0)+,d7

_readLoop:
		move.w	(VDP_DATA_REG).l,(a0)+
		dbf	d7,_readLoop

_readDone:
		rts


RefreshVDPSpriteTable:
		btst	#INTF_SPRITE_LOCK,(g_InterruptFlags).l
		bne.s	_sprDone
		bsr.w	UpdateVDPSpriteTableDMA

_sprDone:
		rts


ProcessQueuedDMAOps:
		bclr	#INTF_DMA_QUEUE,(g_InterruptFlags).l
		beq.s	_dmaOpsDone
		tst.b	(g_NumQueuedDMAOps).l
		beq.s	_dmaOpsDone
		move.w	#$0100,(Z80_BUSREQ_REG0).l

_dmaBusLoop:
		btst	#$00,(Z80_BUSREQ_REG0).l
		bne.s	_dmaBusLoop
		lea	(g_DMAOpQueue).l,a0
		lea	(VDP_CTRL_REG).l,a6
		move.w	(g_VDPReg01_ModeSet2).l,d7
		ori.b	#$10,d7
		move.w	d7,(a6)

_dmaOpLoop:
		move.l	(a0)+,(a6)
		move.l	(a0)+,(a6)
		move.l	(a0)+,(a6)
		move.w	(a0)+,(a6)
		move.w	(a0)+,(g_DMADestHi).l
		move.w	(g_DMADestHi).l,(a6)
		subq.b	#$01,(g_NumQueuedDMAOps).l
		bne.s	_dmaOpLoop
		move.w	(g_VDPReg01_ModeSet2).l,(a6)
		move.w	#$8F02,(a6)
		move.w	#$0000,(Z80_BUSREQ_REG0).l
		move.l	#g_DMAOpQueue,(g_DMAOpQueuePtr).l

_dmaOpsDone:
		rts


; Runs every VBlank: forwards one entry from g_SoundQueue (d1 =
; parameter byte, d0 = sound id) to the driver's command ports at
; Z80 $1FFC-$1FFF. Special ids: $FB pops g_BGMStack to resume the
; previous track; >= $FD are sent as-is; $F0 stalls the queue until
; the driver reports ready (g_SndQueueWait); $FC sends its parameter
; to $1FFD. Otherwise: a repeat of the current BGM is dropped; bit 7
; set means "with priority parameter" (sent to $1FFC); ids <= $40 get
; priority $0F; and ids < $40 (music tracks) are pushed onto
; g_BGMStack.
ProcessSoundQueue:
		move.w	#$0100,(Z80_BUSREQ_REG0).l

_sndBusLoop:
		btst	#$00,(Z80_BUSREQ_REG0).l
		bne.s	_sndBusLoop
		tst.b	(g_SndQueueWait).l
		beq.w	_sndCheckQueue
		tst.b	(Z80_MEM+$1283).l
		beq.w	_sndDone
		clr.b	(g_SndQueueWait).l

_sndCheckQueue:
		lea	(g_SoundQueue).l,a0
		move.l	4(a0),d0
		or.l	(a0),d0
		beq.w	_sndDone
		move.b	(a0),d1
		move.b	1(a0),d0
		move.w	2(a0),(a0)+
		move.w	2(a0),(a0)+
		move.w	2(a0),(a0)+
		clr.w	(a0)
		cmpi.b	#$FB,d0
		bne.s	_chkDirectCmd
		tst.b	(g_BGMStackDepth).l
		beq.s	_sendStackTop
		movem.l	d7-a0,-(sp)
		lea	(g_BGMStack).l,a0
		moveq	#$08,d7

_popLoop:
		move.b	1(a0),(a0)+
		dbf	d7,_popLoop
		movem.l	(sp)+,d7-a0
		subq.b	#$01,(g_BGMStackDepth).l

_sendStackTop:
		move.b	(g_BGMStack).l,(Z80_MEM+$1FFF).l
		bra.w	_sndDone

_chkDirectCmd:
		cmpi.b	#$FD,d0
		bcs.s	_chkWaitCmd
		move.b	d0,(Z80_MEM+$1FFF).l
		bra.w	_sndDone

_chkWaitCmd:
		cmpi.b	#$F0,d0
		bne.s	_chkChanCmd
		move.b	#$01,(g_SndQueueWait).l
		bra.w	_sndDone

_chkChanCmd:
		cmpi.b	#$FC,d0
		bne.s	_chkRepeat
		andi.b	#$0F,d1
		move.b	d1,(Z80_MEM+$1FFD).l
		move.b	d0,(Z80_MEM+$1FFF).l
		bra.w	_sndDone

_chkRepeat:
		movem.l	d0,-(sp)
		andi.b	#$7F,d0
		cmp.b	(g_BGMStack).l,d0
		movem.l	(sp)+,d0
		bne.s	_chkSFXFlag
		bra.w	_sndDone

_chkSFXFlag:
		bclr	#$07,d0
		beq.s	_chkLowTrack
		move.b	d1,(Z80_MEM+$1FFC).l
		bra.s	_sendCmd

_chkLowTrack:
		cmpi.b	#$40,d0
		bgt.s	_sendCmd
		move.b	#$0F,(Z80_MEM+$1FFC).l

_sendCmd:
		move.b	d0,(Z80_MEM+$1FFF).l
		cmpi.b	#$40,d0
		bge.s	_sndDone
		movem.l	d7-a0,-(sp)
		lea	(g_InterruptFlags).l,a0
		moveq	#$08,d7

_pushLoop:
		move.b	-2(a0),-(a0)
		dbf	d7,_pushLoop
		move.b	d0,-(a0)
		movem.l	(sp)+,d7-a0
		cmpi.b	#$0A,(g_BGMStackDepth).l
		bge.s	_sndDone
		addq.b	#$01,(g_BGMStackDepth).l

_sndDone:
		move.w	#$0000,(Z80_BUSREQ_REG0).l
		rts


; Unreferenced.
_ret:
		rts

		modend
