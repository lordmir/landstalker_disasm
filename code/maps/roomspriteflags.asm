
; =============== S U B	R O U T	I N E =======================================


HideSpriteAtD0:					  ; CODE XREF: DoCustomRoomActions+36p
						  ; DoCustomRoomActions+3Ep ...
		ext.w	d0
		lsl.w	#$07,d0
		adda.w	d0,a5
		jsr	(j_HideSprite).l
		lea	(Sprite1_X).l,a5
		rts
; End of function HideSpriteAtD0


; =============== S U B	R O U T	I N E =======================================


MoveSprite:					  ; CODE XREF: DoCustomRoomActions+1C4p
						  ; DoCustomRoomActions+1F2p ...
		movem.w	d0,-(sp)
		ext.w	d0
		lsl.w	#$07,d0
		move.w	d1,(a5,d0.w)
		movem.w	(sp)+,d0
		rts
; End of function MoveSprite


; =============== S U B	R O U T	I N E =======================================


SetSpriteZ:					  ; CODE XREF: DoCustomRoomActions+1CCp
						  ; DoCustomRoomActions+220p ...
		movem.w	d0,-(sp)
		ext.w	d0
		lsl.w	#$07,d0
		move.w	d1,$00000012(a5,d0.w)
		movem.w	(sp)+,d0
		rts
; End of function SetSpriteZ

; ---------------------------------------------------------------------------
		movem.w	d0,-(sp)
		ext.w	d0
		lsl.w	#$07,d0
		bset	#$07,$00000020(a5,d0.w)
		movem.w	(sp)+,d0
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A356:					  ; CODE XREF: DoCustomRoomActions+2F0p
						  ; DoCustomRoomActions+394p ...
		movem.l	d0/a1,-(sp)
		ext.w	d0
		lsl.w	#$07,d0
		lea	(Sprite1_X).l,a1
		adda.w	d0,a1
		lsl.b	#$06,d1
		andi.b	#$3F,$00000004(a1)
		or.b	d1,$00000004(a1)
		bsr.w	SetSpriteRotationAnimFlags
		movem.l	(sp)+,d0/a1
		rts
; End of function sub_1A356


; =============== S U B	R O U T	I N E =======================================


CheckRoomFlagsToHideSprites:			  ; CODE XREF: CheckFlags+8p
		bsr.s	CheckSpriteVisibleFlags
		bsr.s	CheckOneTimeEventFlags
		rts
; End of function CheckRoomFlagsToHideSprites


; =============== S U B	R O U T	I N E =======================================


CheckSpriteVisibleFlags:			  ; CODE XREF: CheckRoomFlagsToHideSpritesp
		lea	SpriteVisibilityFlags(pc),a0
		lea	(g_Flags).l,a1

loc_1A38C:					  ; CODE XREF: CheckSpriteVisibleFlags+52j
		move.w	(a0),d0
		bmi.s	locret_1A3D6
		cmp.w	(g_RmNum1).l,d0
		bne.s	loc_1A3D2
		move.b	$00000003(a0),d1
		lsr.b	#$05,d1
		clr.w	d0
		move.b	$00000002(a0),d0
		bpl.s	loc_1A3B2
		andi.b	#$7F,d0
		btst	d1,(a1,d0.w)
		bne.s	loc_1A3D2
		bra.s	loc_1A3B8
; ---------------------------------------------------------------------------

loc_1A3B2:					  ; CODE XREF: CheckSpriteVisibleFlags+22j
		btst	d1,(a1,d0.w)
		beq.s	loc_1A3D2

loc_1A3B8:					  ; CODE XREF: CheckSpriteVisibleFlags+2Ej
		move.b	$00000003(a0),d0
		andi.b	#$1F,d0
		lea	(Sprite1_X).l,a5
		movem.l	a0-a1,-(sp)
		bsr.w	HideSpriteAtD0
		movem.l	(sp)+,a0-a1

loc_1A3D2:					  ; CODE XREF: CheckSpriteVisibleFlags+14j
						  ; CheckSpriteVisibleFlags+2Cj ...
		addq.l	#$04,a0
		bra.s	loc_1A38C
; ---------------------------------------------------------------------------

locret_1A3D6:					  ; CODE XREF: CheckSpriteVisibleFlags+Cj
		rts
; End of function CheckSpriteVisibleFlags


; =============== S U B	R O U T	I N E =======================================


CheckOneTimeEventFlags:				  ; CODE XREF: CheckRoomFlagsToHideSprites+2p
		lea	OneTimeEventFlags(pc),a0

loc_1A3DC:					  ; CODE XREF: CheckOneTimeEventFlags+6Aj
		move.w	(a0),d0
		bmi.s	locret_1A444
		cmp.w	(g_RmNum1).l,d0
		bne.s	loc_1A440
		move.b	$00000003(a0),d1
		lsr.b	#$05,d1
		clr.w	d0
		move.b	$00000002(a0),d0
		bpl.s	loc_1A402
		andi.b	#$7F,d0
		btst	d1,(a1,d0.w)
		beq.s	loc_1A440
		bra.s	loc_1A408
; ---------------------------------------------------------------------------

loc_1A402:					  ; CODE XREF: CheckOneTimeEventFlags+1Cj
		btst	d1,(a1,d0.w)
		bne.s	loc_1A440

loc_1A408:					  ; CODE XREF: CheckOneTimeEventFlags+28j
		move.b	$00000005(a0),d1
		clr.w	d0
		move.b	$00000004(a0),d0
		bpl.s	loc_1A420
		andi.b	#$7F,d0
		btst	d1,(a1,d0.w)
		beq.s	loc_1A440
		bra.s	loc_1A426
; ---------------------------------------------------------------------------

loc_1A420:					  ; CODE XREF: CheckOneTimeEventFlags+3Aj
		btst	d1,(a1,d0.w)
		bne.s	loc_1A440

loc_1A426:					  ; CODE XREF: CheckOneTimeEventFlags+46j
		move.b	$00000003(a0),d0
		andi.b	#$1F,d0
		lea	(Sprite1_X).l,a5
		movem.l	a0-a1,-(sp)
		bsr.w	HideSpriteAtD0
		movem.l	(sp)+,a0-a1

loc_1A440:					  ; CODE XREF: CheckOneTimeEventFlags+Ej
						  ; CheckOneTimeEventFlags+26j	...
		addq.l	#$06,a0
		bra.s	loc_1A3DC
; ---------------------------------------------------------------------------

locret_1A444:					  ; CODE XREF: CheckOneTimeEventFlags+6j
		rts
; End of function CheckOneTimeEventFlags


; =============== S U B	R O U T	I N E =======================================


CheckLockedDoorSpriteFlags:			  ; CODE XREF: CheckFlags+10p
		lea	LockedDoorSpriteFlags(pc),a0
		bra.s	loc_1A450
; End of function CheckLockedDoorSpriteFlags


; =============== S U B	R O U T	I N E =======================================


CheckFlagsToHideMultipleSprites:		  ; CODE XREF: CheckFlags+Cp
		lea	RoomClearFlags(pc),a0

loc_1A450:					  ; CODE XREF: CheckLockedDoorSpriteFlags+4j
		bsr.s	FindNextRoomFlagMatch
		bcc.s	locret_1A46A
		btst	d0,(a1,d1.w)
		beq.s	locret_1A46A

loc_1A45A:					  ; CODE XREF: CheckFlagsToHideMultipleSprites+1Cj
		move.w	#$FFFF,(a0,d2.w)	  ; Move offscreen
	if FIX_SPRITE_HIDE_BUG
		addi.w	#SPRITE_SIZE,d2
		cmpi.w	#ALL_SPRITES_SIZE,d2
		bne.s	loc_1A45A		  ; Move offscreen
	endif

locret_1A46A:					  ; CODE XREF: CheckFlagsToHideMultipleSprites+6j
						  ; CheckFlagsToHideMultipleSprites+Cj
		rts
; End of function CheckFlagsToHideMultipleSprites


; =============== S U B	R O U T	I N E =======================================


CheckPermanentSwitchFlags:			  ; CODE XREF: CheckFlags+14p
		lea	PermanentSwitchFlags(pc),a0

loc_1A470:					  ; CODE XREF: CheckPermanentSwitchFlags+34j
		bsr.s	FindNextRoomFlagMatch	  ; Returns:
						  ; d0:	flag bit
						  ; d1:	flag byte
						  ; d2:	offset to sprite table entry
		bcc.s	locret_1A4A2
		btst	d0,(a1,d1.w)
		beq.s	loc_1A49C
		andi.b	#$3F,RotationAndSize(a0,d2.w)
		ori.b	#$80,RotationAndSize(a0,d2.w)
		move.w	#$0004,AnimationIndex(a0,d2.w)
		bclr	#$00,Flags1(a0,d2.w)
		clr.w	BehavParam(a0,d2.w)
		bset	#$07,Unk48(a0,d2.w)

loc_1A49C:					  ; CODE XREF: CheckPermanentSwitchFlags+Cj
		movea.l	a6,a0
		addq.l	#$04,a0
		bra.s	loc_1A470		  ; Returns:
						  ; d0:	flag bit
						  ; d1:	flag byte
						  ; d2:	offset to sprite table entry
; ---------------------------------------------------------------------------

locret_1A4A2:					  ; CODE XREF: CheckPermanentSwitchFlags+6j
		rts
; End of function CheckPermanentSwitchFlags


; =============== S U B	R O U T	I N E =======================================


CheckUnlockDoor:				  ; DATA XREF: j_CheckUnlockDoort
		lea	LockedDoorSpriteFlags(pc),a0
		bsr.s	FindNextRoomFlagMatch
		bcc.s	loc_1A4B8
		btst	d0,(a1,d1.w)
		bne.s	loc_1A4B8
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A4B8:					  ; CODE XREF: CheckUnlockDoor+6j
						  ; CheckUnlockDoor+Cj
		tst.b	d0
		rts
; End of function CheckUnlockDoor


; =============== S U B	R O U T	I N E =======================================


UnlockDoor:					  ; DATA XREF: j_UnlockDoort
		lea	LockedDoorSpriteFlags(pc),a0
		bsr.s	FindNextRoomFlagMatch
		bcc.s	locret_1A4CE
		bset	d0,(a1,d1.w)
		move.w	#$FFFF,(a0,d2.w)

locret_1A4CE:					  ; CODE XREF: UnlockDoor+6j
		rts
; End of function UnlockDoor


; =============== S U B	R O U T	I N E =======================================


FindNextRoomFlagMatch:				  ; CODE XREF: CheckFlagsToHideMultipleSprites:loc_1A450p
						  ; CheckPermanentSwitchFlags:loc_1A470p ...
		move.w	(g_RmNum1).l,d0
		lea	(g_Flags).l,a1

loc_1A4DC:					  ; CODE XREF: FindNextRoomFlagMatch+3Aj
		move.w	(a0),d1
		bmi.s	loc_1A50C
		cmp.w	d0,d1
		bne.s	loc_1A508
		clr.w	d1
		move.b	$00000002(a0),d1
		move.b	$00000003(a0),d0
		lsr.b	#$05,d0
		move.b	$00000003(a0),d2
		andi.w	#$001F,d2
		lsl.w	#$07,d2
		movea.l	a0,a6
		lea	(Sprite1_X).l,a0
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A508:					  ; CODE XREF: FindNextRoomFlagMatch+12j
		addq.l	#$04,a0
		bra.s	loc_1A4DC
; ---------------------------------------------------------------------------

loc_1A50C:					  ; CODE XREF: FindNextRoomFlagMatch+Ej
		tst.b	d0
		rts
; End of function FindNextRoomFlagMatch


; =============== S U B	R O U T	I N E =======================================


CheckSacredTreeFlags:				  ; CODE XREF: CheckFlags+18p
		lea	SacredTreeFlags(pc),a0
		lea	(g_Flags).l,a2
		clr.w	d7

loc_1A51C:					  ; CODE XREF: CheckSacredTreeFlags+34j
		move.w	(a0),d0
		bmi.s	locret_1A546
		cmp.w	(g_RmNum1).l,d0
		bne.s	loc_1A542
		clr.w	d0
		move.b	$00000002(a0),d0
		move.b	$00000003(a0),d1
		btst	d1,(a2,d0.w)
		beq.s	loc_1A540
		bsr.s	FindTree
		jsr	(j_HideSprite).l

loc_1A540:					  ; CODE XREF: CheckSacredTreeFlags+26j
		addq.b	#$01,d7

loc_1A542:					  ; CODE XREF: CheckSacredTreeFlags+16j
		addq.l	#$04,a0
		bra.s	loc_1A51C
; ---------------------------------------------------------------------------

locret_1A546:					  ; CODE XREF: CheckSacredTreeFlags+Ej
		rts
; End of function CheckSacredTreeFlags


; =============== S U B	R O U T	I N E =======================================


FindTree:					  ; CODE XREF: CheckSacredTreeFlags+28p
		movem.w	d7,-(sp)
		lea	(Sprite1_X).l,a5

loc_1A552:					  ; CODE XREF: FindTree+16j
		cmpi.b	#SpriteB_SacredTree,$0000000B(a5) ; Tree
		beq.s	loc_1A560

loc_1A55A:					  ; CODE XREF: FindTree:loc_1A560j
		lea	$00000080(a5),a5
		bra.s	loc_1A552		  ; Tree
; ---------------------------------------------------------------------------

loc_1A560:					  ; CODE XREF: FindTree+10j
		dbf	d7,loc_1A55A
		movem.w	(sp)+,d7
		rts
; End of function FindTree


; =============== S U B	R O U T	I N E =======================================


sub_1A56A:					  ; CODE XREF: ROM:0001626Cp
		lea	(Sprite1_X).l,a0
		clr.w	d7

loc_1A572:					  ; CODE XREF: sub_1A56A+20j
		cmpi.b	#$FF,X(a0)
		beq.s	loc_1A58C
		cmpa.l	a0,a5
		beq.s	loc_1A58C
		cmpi.b	#SpriteB_SacredTree,SpriteGraphic(a0)
		bne.s	loc_1A586
		addq.b	#$01,d7

loc_1A586:					  ; CODE XREF: sub_1A56A+18j
		lea	SPRITE_SIZE(a0),a0
		bra.s	loc_1A572
; ---------------------------------------------------------------------------

loc_1A58C:					  ; CODE XREF: sub_1A56A+Cj
						  ; sub_1A56A+10j
		lea	SacredTreeFlags(pc),a0
		lea	(g_Flags).l,a2

loc_1A596:					  ; CODE XREF: sub_1A56A+3Aj
		move.w	(a0),d0
		bmi.s	locret_1A5B8
		cmp.w	(g_RmNum1).l,d0
		beq.s	loc_1A5A6

loc_1A5A2:					  ; CODE XREF: sub_1A56A:loc_1A5A6j
		addq.l	#$04,a0
		bra.s	loc_1A596
; ---------------------------------------------------------------------------

loc_1A5A6:					  ; CODE XREF: sub_1A56A+36j
		dbf	d7,loc_1A5A2
		clr.w	d0
		move.b	$00000002(a0),d0
		move.b	$00000003(a0),d1
		bset	d1,(a2,d0.w)

locret_1A5B8:					  ; CODE XREF: sub_1A56A+2Ej
		rts
; End of function sub_1A56A

; ---------------------------------------------------------------------------
