Shops2	module
; Finds the sprite whose dialogue field matches talker script id d0
; (the Dialogue word packs script id:6 | sprite id:10). Only sprites
; with InteractFlags bit 4 set are considered. Returns d1 = sprite
; id and carry clear on success; carry set if no sprite matches.
GetSpeakerSpriteId:
		movem.l	d0/d7-a0,-(sp)
		lea	(Sprite1_X).l,a0
		moveq	#$E,d7

_spkScan:
		btst	#$04,InteractFlags(a0)
		beq.s	_spkNext
		move.b	Dialogue(a0),d1
		lsr.b	#$02,d1
		cmp.b	d1,d0
		beq.s	_spkFound

_spkNext:
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,_spkScan
		movem.l	(sp)+,d0/d7-a0
		ori	#$01,ccr
		rts

_spkFound:
		move.w	Dialogue(a0),d1
		andi.w	#$03FF,d1
		movem.l	(sp)+,d0/d7-a0
		tst.b	d0
		rts


; Marks the current room's shop as having sold its one Life Stock.
; No-op (carry set) if the room has no LifestockSoldFlags entry.
SetLifestockSoldFlag:
		movem.l	d0-d1/a0,-(sp)
		bsr.s	ReadLifestockSoldFlag
		bcs.s	_setDone
		bset	d1,(a0,d0.w)
		tst.b	d0

_setDone:
		movem.l	(sp)+,d0-d1/a0
		rts


; Looks up the current room in the LifestockSoldFlags table (entries
; {room.w, flag byte offset.b, bit.b}, negative room terminates).
; Returns a0 = g_Flags, d0 = byte offset, d1 = bit number and carry
; clear; carry set if the room has no entry.
ReadLifestockSoldFlag:
		lea	LifestockSoldFlags(pc),a0

_lsScan:
		move.w	(a0),d0
		bmi.s	_lsEnd
		cmp.w	(g_CurrentRoom).l,d0
		beq.s	_lsFound
		addq.l	#$04,a0
		bra.s	_lsScan

_lsFound:
		move.b	2(a0),d0
		ext.w	d0
		move.b	3(a0),d1
		lea	(g_Flags).l,a0
		tst.b	d0
		rts

_lsEnd:
		ori	#$01,ccr
		rts


; Tests whether the current room's shop has already sold its Life
; Stock: Z clear if sold; carry set if the room has no entry.
CheckIfLifestockSold:
		movem.l	d0-d1/a0,-(sp)
		bsr.s	ReadLifestockSoldFlag
		bcs.s	_chkDone
		tst.b	d0
		btst	d1,(a0,d0.w)

_chkDone:
		movem.l	(sp)+,d0-d1/a0
		rts

		modend
