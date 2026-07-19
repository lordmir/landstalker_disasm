LavaPalette	module
; Animates the lava in the Lake Shrine exterior room: every 16
; frames, writes the next pair of colours from the 8-phase
; LavaPaletteRotation table (incbin'd right after this file) into
; CRAM slots 8 and 9 of palette 0, cycling on g_VBlankCounterLow
; bits 4-6.
CheckAndDoLavaPaletteFx:
		cmpi.w	#ROOM_LAKE_SHRINE_LAVA,(g_CurrentRoom).l	  ; Lake shrine	exterior with lava
		bne.s	_lavaDone
		move.b	(g_VBlankCounterLow).l,d0
		andi.b	#$0F,d0
		bne.s	_lavaDone
		move.b	(g_VBlankCounterLow).l,d0
		andi.w	#$0070,d0
		lsr.b	#$02,d0
		move.l	#$C0100000,(VDP_CTRL_REG).l ; Write CRAM 0x0010
		move.w	LavaPaletteRotation(pc,d0.w),(VDP_DATA_REG).l
		move.l	#$C0120000,(VDP_CTRL_REG).l ; Write CRAM 0x0012
		move.w	LavaPaletteRotation+2(pc,d0.w),(VDP_DATA_REG).l

_lavaDone:
		rts

		modend
