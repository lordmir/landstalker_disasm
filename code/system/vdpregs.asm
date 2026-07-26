VDPRegAccess	module

; VDP register access goes through the shadow copy of all registers at
; g_VDPReg00_ModeSet1: Get/Set take a full $8rXX command word in d0,
; Or/Mask take a register number in d0 and an OR/AND mask in d1.
GetVDPReg:
		movem.l	a0,-(sp)
		lea	(g_VDPReg00_ModeSet1).l,a0
		add.w	d0,d0
		move.w	(a0,d0.w),d0
		movem.l	(sp)+,a0
		rts


SetVDPReg:
		movem.l	d0-d1/a0,-(sp)
		lea	(g_VDPReg00_ModeSet1).l,a0
		move.w	d0,(VDP_CTRL_REG).l
		move.w	d0,d1
		andi.w	#$7F00,d0
		lsr.w	#$07,d0
		move.w	d1,(a0,d0.w)
		movem.l	(sp)+,d0-d1/a0
		rts


OrVDPReg:
		movem.l	d0-d1/a0,-(sp)
		lea	(g_VDPReg00_ModeSet1).l,a0
		add.w	d0,d0
		or.b	d1,1(a0,d0.w)
		bra.s	_writeReg


MaskVDPReg:
		movem.l	d0-d1/a0,-(sp)
		lea	(g_VDPReg00_ModeSet1).l,a0
		add.w	d0,d0
		and.b	d1,1(a0,d0.w)

_writeReg:
		move.w	(a0,d0.w),d1
		move.w	d1,(VDP_CTRL_REG).l
		movem.l	(sp)+,d0-d1/a0
		rts


EnableDisplay:
		move.w	#$0001,d0
		move.w	#$0040,d1
		bra.s	OrVDPReg

DisableDisplay:
		move.w	#$0001,d0
		move.w	#$00BF,d1
		bra.s	MaskVDPReg


EnableInterrupts:
		move	#$2300,sr
		rts


DisableInterrupts:
		move	#$2700,sr
		rts


EnableDisplayAndInts:
		bsr.s	EnableDisplay
		bra.s	EnableInterrupts


DisableDisplayAndInts:
		bsr.s	DisableInterrupts
		bra.s	DisableDisplay


DisableVDPSpriteUpdate:
		bclr	#INTF_SPRITE_LOCK,(g_InterruptFlags).l
		rts


EnableVDPSpriteUpdate:
		bset	#INTF_SPRITE_LOCK,(g_InterruptFlags).l
		rts


		modend
