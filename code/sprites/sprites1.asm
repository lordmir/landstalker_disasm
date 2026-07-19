Sprites1	module
j_LoadSpriteBehaviour:
		jmp	LoadSpriteBehaviour(pc)	  ; D0 = spritedata[0x34] = bytes[4] & 0x03 << 8 | bytes[7]

j_PlayEndCredits:
		jmp	PlayEndCredits(pc)

j_LookupChestContents:
		jmp	LookupChestContents(pc)

j_OpenChest:
		jmp	OpenChest(pc)

j_CheckIfChestOpened:
		jmp	CheckIfChestOpened(pc)

; Unreferenced: reloads the behaviour script of every active sprite.
		lea	(Sprite1_X).l,a5
		moveq	#$E,d7

_reloadLoop:
		tst.w	(a5)
		bmi.s	_reloadDone
		bsr.s	LoadSpriteBehaviour
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,_reloadLoop

_reloadDone:
		rts


; Attaches behaviour script BehaviourLUTIndex to sprite a5: the
; index selects a script by summing the per-script byte lengths in
; SpriteBehaviourOffsets, giving an offset into
; SpriteBehaviourTable. The script's first {command, parameter} byte
; pair is loaded into BehavCmd/BehavParam and the script address
; kept in BehaviourLUTPtr for OnTick to execute.
LoadSpriteBehaviour:
		lea	SpriteBehaviourOffsets(pc),a1
		clr.l	d1
		move.w	BehaviourLUTIndex(a5),d0
		beq.s	_setScript
		subq.w	#$01,d0

_sumLoop:
		clr.l	d2			  ; Accumulate index into master lookup
		move.b	(a1)+,d2
		add.l	d2,d1
		dbf	d0,_sumLoop		  ; Accumulate index into master lookup

_setScript:
		lea	SpriteBehaviourTable(pc),a1
		adda.l	d1,a1
		move.l	a1,BehaviourLUTPtr(a5)
		move.b	(a1)+,BehavCmd(a5)
		move.b	(a1),BehavParam(a5)
		rts

		modend
