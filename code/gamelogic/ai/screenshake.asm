; The mini-earthquake screen shake, used by the stone warrior's
; hammer strikes and by Gola: 8 passes of 8 up-and-down nudges of
; the vertical scroll (VSRAM), amplitude falling from 9 to 2,
; flushing the DMA queue around each one - a blocking effect, so the
; game freezes for the duration.
; This file is included from the middle of stonewarrior.asm (to keep
; the ROM byte order) and deliberately has no module wrapper: its
; local labels belong to the enclosing StoneWarrior module.

ScreenShake:
		moveq	#$00000007,d7
		move.w	#$0009,d0

_shakePass:
		movem.w	d7,-(sp)
		move.w	#$0007,d6

_shakeStep:
		movem.w	d0/d6,-(sp)
		movem.w	d0,-(sp)
		add.w	d0,(g_VSRAMData).l
		add.w	d0,(g_VSRAMData+2).l
		jsr	(j_QueueVSRAMUpdate).l
		jsr	(j_FlushDMACopyQueue).l
		movem.w	(sp)+,d0
		sub.w	d0,(g_VSRAMData).l
		sub.w	d0,(g_VSRAMData+2).l
		jsr	(j_QueueVSRAMUpdate).l
		jsr	(j_FlushDMACopyQueue).l
		movem.w	(sp)+,d0/d6
		dbf	d6,_shakeStep
		subq.w	#$01,d0
		movem.w	(sp)+,d7
		dbf	d7,_shakePass
		rts
