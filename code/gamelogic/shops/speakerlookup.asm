SpeakerLookup	module
; Finds the sprite whose dialogue field matches talker script id d0
; (the Dialogue word packs script id:6 | sprite id:10). Only sprites
; with InteractFlags bit 4 set are considered. Returns d1 = sprite
; id and carry clear on success; carry set if no sprite matches.
GetSpeakerSpriteId:
		movem.l	d0/d7-a0,-(sp)
		lea	(Sprite1_X).l,a0
		moveq	#$E,d7

_spkScan:
		btst	#IF_TALKABLE,InteractFlags(a0)
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


		modend
