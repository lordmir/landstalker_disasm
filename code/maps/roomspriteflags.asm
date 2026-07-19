RoomSpriteFlags	module
; Room-load appliers that read the persistent story flags (g_Flags)
; and update the room's sprites to match: hiding cleared enemies and
; one-time events, keeping unlocked doors open, pressed switches
; pressed and cut sacred trees gone.

; Hides sprite index d0 (a5 = sprite base, restored to Sprite1
; afterwards).
HideSpriteAtD0:
		ext.w	d0
		lsl.w	#$07,d0
		adda.w	d0,a5
		jsr	(j_HideSprite).l
		lea	(Sprite1_X).l,a5
		rts


; Sets sprite d0's map cell to d1 (X:Y word).
MoveSprite:
		movem.w	d0,-(sp)
		ext.w	d0
		lsl.w	#$07,d0
		move.w	d1,(a5,d0.w)
		movem.w	(sp)+,d0
		rts


; Sets sprite d0's Z to d1.
SetSpriteZ:
		movem.w	d0,-(sp)
		ext.w	d0
		lsl.w	#$07,d0
		move.w	d1,Z(a5,d0.w)
		movem.w	(sp)+,d0
		rts

; Unreferenced: sets bit 7 of sprite d0's FallRate.
		movem.w	d0,-(sp)
		ext.w	d0
		lsl.w	#$07,d0
		bset	#$07,FallRate(a5,d0.w)
		movem.w	(sp)+,d0
		rts


; Sets sprite d0's facing to d1 (0-3 = NE/SE/SW/NW) and refreshes its
; animation.
SetSpriteFacing:
		movem.l	d0/a1,-(sp)
		ext.w	d0
		lsl.w	#$07,d0
		lea	(Sprite1_X).l,a1
		adda.w	d0,a1
		lsl.b	#$06,d1
		andi.b	#$3F,RotationAndSize(a1)  ; clear facing bits
		or.b	d1,RotationAndSize(a1)
		bsr.w	SetSpriteRotationAnimFlags
		movem.l	(sp)+,d0/a1
		rts


CheckRoomFlagsToHideSprites:
		bsr.s	CheckSpriteVisibleFlags
		bsr.s	CheckOneTimeEventFlags
		rts


; Hides sprites according to SpriteVisibilityFlags: 4-byte entries
; {room.w, flag byte.b (bit 7 = hide when the flag is CLEAR instead
; of set), flag bit (top 3 bits) | sprite index (low 5 bits) .b}.
CheckSpriteVisibleFlags:
		lea	SpriteVisibilityFlags(pc),a0
		lea	(g_Flags).l,a1

_svScan:
		move.w	(a0),d0
		bmi.s	_svDone
		cmp.w	(g_CurrentRoom).l,d0
		bne.s	_svNext
		move.b	3(a0),d1
		lsr.b	#$05,d1
		clr.w	d0
		move.b	2(a0),d0
		bpl.s	_svNormal
		andi.b	#$7F,d0
		btst	d1,(a1,d0.w)
		bne.s	_svNext
		bra.s	_svHide

_svNormal:
		btst	d1,(a1,d0.w)
		beq.s	_svNext

_svHide:
		move.b	3(a0),d0
		andi.b	#$1F,d0
		lea	(Sprite1_X).l,a5
		movem.l	a0-a1,-(sp)
		bsr.w	HideSpriteAtD0
		movem.l	(sp)+,a0-a1

_svNext:
		addq.l	#$04,a0
		bra.s	_svScan

_svDone:
		rts


; Hides one-time event sprites: 6-byte OneTimeEventFlags entries add
; a second flag condition - {room.w, flag byte A.b, flag bit A (top
; 3) | sprite index (low 5) .b, flag byte B.b, flag bit B.b}. Here
; the default sense is "condition passes when the flag is CLEAR";
; bit 7 of a flag byte inverts to "when SET". The sprite is hidden
; when both conditions pass. Relies on a1 = g_Flags left by
; CheckSpriteVisibleFlags running immediately before.
CheckOneTimeEventFlags:
		lea	OneTimeEventFlags(pc),a0

_otScan:
		move.w	(a0),d0
		bmi.s	_otDone
		cmp.w	(g_CurrentRoom).l,d0
		bne.s	_otNext
		move.b	3(a0),d1
		lsr.b	#$05,d1
		clr.w	d0
		move.b	2(a0),d0
		bpl.s	_otNormalA
		andi.b	#$7F,d0
		btst	d1,(a1,d0.w)
		beq.s	_otNext
		bra.s	_otCondB

_otNormalA:
		btst	d1,(a1,d0.w)
		bne.s	_otNext

_otCondB:
		move.b	5(a0),d1
		clr.w	d0
		move.b	4(a0),d0
		bpl.s	_otNormalB
		andi.b	#$7F,d0
		btst	d1,(a1,d0.w)
		beq.s	_otNext
		bra.s	_otHide

_otNormalB:
		btst	d1,(a1,d0.w)
		bne.s	_otNext

_otHide:
		move.b	3(a0),d0
		andi.b	#$1F,d0
		lea	(Sprite1_X).l,a5
		movem.l	a0-a1,-(sp)
		bsr.w	HideSpriteAtD0
		movem.l	(sp)+,a0-a1

_otNext:
		addq.l	#$06,a0
		bra.s	_otScan

_otDone:
		rts


; Removes an unlocked door's sprite on room load.
CheckLockedDoorSpriteFlags:
		lea	LockedDoorSpriteFlags(pc),a0
		bra.s	_checkAndHide


; Removes cleared-room sprites on room load; with FIX_SPRITE_HIDE the
; hide extends to every following sprite slot instead of just one.
CheckFlagsToHideMultipleSprites:
		lea	RoomClearFlags(pc),a0

_checkAndHide:
		bsr.s	FindNextRoomFlagMatch
		bcc.s	_hideDone
		btst	d0,(a1,d1.w)
		beq.s	_hideDone

_hideLoop:
		move.w	#$FFFF,(a0,d2.w)	  ; Move offscreen
	if FIX_SPRITE_HIDE
		addi.w	#SPRITE_SIZE,d2
		cmpi.w	#ALL_SPRITES_SIZE,d2
		bne.s	_hideLoop		  ; Move offscreen
	endif

_hideDone:
		rts


; Forces already-pressed permanent switches into their pressed state
; on room load: facing SW, animation 4, behaviour parameter cleared,
; drawn behind (RenderFlags bit 7).
CheckPermanentSwitchFlags:
		lea	PermanentSwitchFlags(pc),a0

_psScan:
		bsr.s	FindNextRoomFlagMatch	  ; Returns:
						  ; d0:	flag bit
						  ; d1:	flag byte
						  ; d2:	offset to sprite table entry
		bcc.s	_psDone
		btst	d0,(a1,d1.w)
		beq.s	_psNext
		andi.b	#$3F,RotationAndSize(a0,d2.w)
		ori.b	#$80,RotationAndSize(a0,d2.w)
		move.w	#$0004,AnimationIndex(a0,d2.w)
		bclr	#$00,StateFlags(a0,d2.w)
		clr.w	BehavParam(a0,d2.w)
		bset	#$07,RenderFlags(a0,d2.w)

_psNext:
		movea.l	a6,a0
		addq.l	#$04,a0
		bra.s	_psScan

_psDone:
		rts


; Returns carry set if this room has a locked door whose unlock flag
; is still clear (i.e. a key is needed); carry clear otherwise.
CheckUnlockDoor:
		lea	LockedDoorSpriteFlags(pc),a0
		bsr.s	FindNextRoomFlagMatch
		bcc.s	_cudNotLocked
		btst	d0,(a1,d1.w)
		bne.s	_cudNotLocked
		ori	#$01,ccr
		rts

_cudNotLocked:
		tst.b	d0
		rts


; Sets this room's door-unlocked flag and moves the door sprite
; offscreen.
UnlockDoor:
		lea	LockedDoorSpriteFlags(pc),a0
		bsr.s	FindNextRoomFlagMatch
		bcc.s	_udDone
		bset	d0,(a1,d1.w)
		move.w	#$FFFF,(a0,d2.w)

_udDone:
		rts


; Scans the 4-byte flag table at a0 ({room.w, flag byte.b, flag bit
; (top 3 bits) | sprite index (low 5 bits) .b}) for g_CurrentRoom.
; On a match returns carry set with d0 = flag bit, d1 = flag byte
; offset, d2 = sprite table offset, a6 = the entry (for resuming the
; scan), a0 = Sprite1 base and a1 = g_Flags; carry clear when the
; table is exhausted.
FindNextRoomFlagMatch:
		move.w	(g_CurrentRoom).l,d0
		lea	(g_Flags).l,a1

_fnScan:
		move.w	(a0),d1
		bmi.s	_fnNoMatch
		cmp.w	d0,d1
		bne.s	_fnNext
		clr.w	d1
		move.b	2(a0),d1
		move.b	3(a0),d0
		lsr.b	#$05,d0
		move.b	3(a0),d2
		andi.w	#$001F,d2
		lsl.w	#$07,d2
		movea.l	a0,a6
		lea	(Sprite1_X).l,a0
		ori	#$01,ccr
		rts

_fnNext:
		addq.l	#$04,a0
		bra.s	_fnScan

_fnNoMatch:
		tst.b	d0
		rts


; Hides the sacred trees already cut in this room: SacredTreeFlags
; entries are {room.w, flag byte.b, flag bit.b}, one per tree in
; sprite order; d7 counts the room's trees so FindTree can locate
; the matching sprite.
CheckSacredTreeFlags:
		lea	SacredTreeFlags(pc),a0
		lea	(g_Flags).l,a2
		clr.w	d7

_stScan:
		move.w	(a0),d0
		bmi.s	_stDone
		cmp.w	(g_CurrentRoom).l,d0
		bne.s	_stNext
		clr.w	d0
		move.b	2(a0),d0
		move.b	3(a0),d1
		btst	d1,(a2,d0.w)
		beq.s	_stCount
		bsr.s	FindTree
		jsr	(j_HideSprite).l

_stCount:
		addq.b	#$01,d7

_stNext:
		addq.l	#$04,a0
		bra.s	_stScan

_stDone:
		rts


; Returns a5 = the (d7+1)-th sprite with the sacred tree graphic.
FindTree:
		movem.w	d7,-(sp)
		lea	(Sprite1_X).l,a5

_ftScan:
		cmpi.b	#SpriteB_SacredTree,SpriteGraphic(a5)
		beq.s	_ftMatch

_ftSkip:
		lea	SPRITE_SIZE(a5),a5
		bra.s	_ftScan

_ftMatch:
		dbf	d7,_ftSkip
		movem.w	(sp)+,d7
		rts


; Called when a sacred tree (a5) is destroyed: counts the tree
; sprites before a5 to get its ordinal, then sets the matching
; SacredTreeFlags entry's flag so the tree stays gone.
SetSacredTreeCutFlag:
		lea	(Sprite1_X).l,a0
		clr.w	d7

_tcCount:
		cmpi.b	#$FF,X(a0)
		beq.s	_tcFindEntry
		cmpa.l	a0,a5
		beq.s	_tcFindEntry
		cmpi.b	#SpriteB_SacredTree,SpriteGraphic(a0)
		bne.s	_tcNext
		addq.b	#$01,d7

_tcNext:
		lea	SPRITE_SIZE(a0),a0
		bra.s	_tcCount

_tcFindEntry:
		lea	SacredTreeFlags(pc),a0
		lea	(g_Flags).l,a2

_tcScan:
		move.w	(a0),d0
		bmi.s	_tcDone
		cmp.w	(g_CurrentRoom).l,d0
		beq.s	_tcMatch

_tcAdvance:
		addq.l	#$04,a0
		bra.s	_tcScan

_tcMatch:
		dbf	d7,_tcAdvance
		clr.w	d0
		move.b	2(a0),d0
		move.b	3(a0),d1
		bset	d1,(a2,d0.w)

_tcDone:
		rts

		modend
