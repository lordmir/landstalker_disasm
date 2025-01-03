
; =============== S U B	R O U T	I N E =======================================


UpdateFrames:					  ; DATA XREF: j_UpdateFramest
		lea	(Sprite1_X).l,a0
		moveq	#$0000000E,d7

loc_103E6:					  ; CODE XREF: UpdateFrames+20j
		move.b	(a0),d0
		bmi.s	locret_10402
		cmpi.b	#$7F,d0
		beq.s	loc_103FA
		movem.l	d7-a0,-(sp)
		bsr.s	UpdateSpriteFrame
		movem.l	(sp)+,d7-a0

loc_103FA:					  ; CODE XREF: UpdateFrames+10j
		lea	$00000080(a0),a0
		dbf	d7,loc_103E6

locret_10402:					  ; CODE XREF: UpdateFrames+Aj
		rts
; End of function UpdateFrames


; =============== S U B	R O U T	I N E =======================================


UpdateSpriteFrame:				  ; CODE XREF: UpdateFrames+16p
						  ; DATA XREF: j_UpdateSpriteFramet
		move.w	PrevAction(a0),d2
		move.w	QueuedAction(a0),d0
		move.w	d0,PrevAction(a0)	  ; D0 - Action
						  ; Idle    - 0000
						  ; Walk NE - 0001
						  ; Walk SW - 0002
						  ; Walk NW - 0004
						  ; Walk SE - 0008
						  ; Fall    - 0010
						  ; Jump    - 0020
						  ; Pick Up - 0040, 0080, 00C0
						  ; Attack  - 0100, 0200, 0300,	0400, (500, 600, 700)
						  ; Climb   - 1000
						  ; TakeDmg - 2000
		btst	#$01,Flags2(a0)
		beq.s	loc_10428
		move.b	Unk48(a0),d1
		andi.b	#$07,d1
		bne.s	loc_10428
		bchg	#$06,Flags2(a0)

loc_10428:					  ; CODE XREF: UpdateSpriteFrame+12j
						  ; UpdateSpriteFrame+1Cj
		move.b	Unk0A(a0),d1
		andi.b	#$7F,d1
		beq.s	loc_1048A
		move.b	AnimFlags(a0),d3
		btst	#$05,d3			  ; HasTakeDamageAnim
		beq.s	loc_10446
		move.w	d0,d1
		andi.w	#$2000,d1
		bne.w	LoadDamageAnimFrame	  ; Bit5: HasDamageAnim

loc_10446:					  ; CODE XREF: UpdateSpriteFrame+36j
		tst.b	Unk0A(a0)
		bmi.s	loc_104B2
		cmpi.b	#$FF,d0			  ; Any	Movement
		beq.w	loc_1051E
		tst.w	d0
		beq.s	LoadIdleAnimFrame	  ; Idle
		btst	#$00,Flags2(a0)
		bne.s	locret_10490
		move.w	d0,d1
		andi.w	#$2000,d1		  ; Take Dmg
		bne.w	LoadDamageAnimFrame	  ; Bit5: HasDamageAnim
		move.w	d0,d1
		andi.w	#$0700,d1		  ; Attack
		bne.w	LoadAttackAnimFrame
		move.w	d0,d1
		andi.w	#$0030,d1		  ; Jump/Fall
		bne.w	LoadJumpAnimFrame
		move.w	d0,d1
		andi.w	#$000F,d1		  ; Walk
		bne.w	LoadWalkAnimFrame
		rts
; ---------------------------------------------------------------------------

loc_1048A:					  ; CODE XREF: UpdateSpriteFrame+2Cj
		andi.b	#$7F,Unk0A(a0)

locret_10490:					  ; CODE XREF: UpdateSpriteFrame+5Aj
						  ; UpdateSpriteFrame+A8j
		rts
; ---------------------------------------------------------------------------

loc_10492:					  ; CODE XREF: ROM:00012762p
						  ; ROM:0001283Ep
		ori.b	#$80,Unk0A(a0)
		move.b	AnimFlags(a0),d3
		bra.s	loc_104B2
; ---------------------------------------------------------------------------

LoadIdleAnimFrame:				  ; CODE XREF: UpdateSpriteFrame+52j
						  ; UpdateSpriteFrame+34Aj
		btst	#$00,d3
		beq.w	loc_1056E
		btst	#$00,Flags2(a0)
		bne.s	locret_10490
		bsr.w	sub_10794

loc_104B2:					  ; CODE XREF: UpdateSpriteFrame+46j
						  ; UpdateSpriteFrame+98j
		clr.w	AnimationFrame(a0)
		move.w	#$0000,d1
		btst	#$06,Flags4(a0)		  ; True for mimic, mushroom
		beq.w	loc_104C8
		move.w	#$0008,d1

loc_104C8:					  ; CODE XREF: UpdateSpriteFrame+BCj
		btst	#$01,d3
		beq.s	GetRotatedFrame		  ; Bit	4 - Do not rotate
		move.w	#$0008,d1

GetRotatedFrame:				  ; CODE XREF: UpdateSpriteFrame+C8j
						  ; UpdateSpriteFrame+144j ...
		btst	#$04,d3			  ; Bit	4 - Do not rotate
		bne.s	GetNWFrame
		move.b	RotationAndSize(a0),d0
		andi.b	#$C0,d0
		beq.s	GetNWFrame
		cmpi.b	#$80,d0
		beq.s	GetNEFrame
		bhi.s	GetSEFrame

GetSWFrame:
		addq.w	#$04,d1
		move.w	d1,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

GetNWFrame:					  ; CODE XREF: UpdateSpriteFrame+D2j
						  ; UpdateSpriteFrame+DCj
		move.w	d1,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

GetSEFrame:					  ; CODE XREF: UpdateSpriteFrame+E4j
		move.w	d1,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

GetNEFrame:					  ; CODE XREF: UpdateSpriteFrame+E2j
		addq.w	#$04,d1
		move.w	d1,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)

locret_1051C:					  ; CODE XREF: UpdateSpriteFrame+120j
		rts
; ---------------------------------------------------------------------------

loc_1051E:					  ; CODE XREF: UpdateSpriteFrame+4Cj
		btst	#$00,Flags2(a0)
		bne.s	locret_1051C
		clr.w	PrevAction(a0)
		bsr.w	sub_10794
		andi.w	#$07C0,d2
		beq.s	loc_10554
		subi.w	#$0040,d2
		lsr.w	#$04,d2
		move.w	d2,AnimationFrame(a0)
		btst	#$01,d3
		beq.s	loc_1054C
		move.w	#$0018,d1
		bra.w	GetRotatedFrame		  ; Bit	4 - Do not rotate
; ---------------------------------------------------------------------------

loc_1054C:					  ; CODE XREF: UpdateSpriteFrame+13Ej
		move.w	#$0010,d1
		bra.w	GetRotatedFrame		  ; Bit	4 - Do not rotate
; ---------------------------------------------------------------------------

loc_10554:					  ; CODE XREF: UpdateSpriteFrame+12Ej
		clr.w	AnimationFrame(a0)
		move.w	#$0000,d1
		btst	#$06,Flags4(a0)		  ; Bit	0 = Invincible / Solid
		beq.w	GetRotatedFrame		  ; Bit	4 - Do not rotate
		move.w	#$0008,d1
		bra.w	GetRotatedFrame		  ; Bit	4 - Do not rotate
; ---------------------------------------------------------------------------

loc_1056E:					  ; CODE XREF: UpdateSpriteFrame+9Ej
		move.b	Unk0D(a0),d0
		move.b	d0,d1
		move.b	Speed(a0),d7
		bne.s	loc_1057E
		move.w	#$0001,d7

loc_1057E:					  ; CODE XREF: UpdateSpriteFrame+174j
		add.b	d7,d1
		neg.b	d7
		and.b	d7,d1
		move.b	d1,Unk0D(a0)
		cmpi.b	#$3F,d0
		bls.s	locret_105AA
		andi.b	#$3F,d0
		move.b	d0,Unk0D(a0)
		move.b	AnimationFrame1(a0),d1
		addq.b	#$04,d1
		andi.b	#$04,d1
		move.b	d1,AnimationFrame1(a0)
		bset	#$07,Unk0A(a0)

locret_105AA:					  ; CODE XREF: UpdateSpriteFrame+188j
		rts
; ---------------------------------------------------------------------------

LoadWalkAnimFrame:				  ; CODE XREF: UpdateSpriteFrame+80j
		btst	#$06,d3
		bne.s	loc_105BC
		btst	#$03,d3
		bne.w	loc_10692
		bra.s	loc_105E6
; ---------------------------------------------------------------------------

loc_105BC:					  ; CODE XREF: UpdateSpriteFrame+1ACj
		move.b	#$1C,d5
		move.w	#$0008,d4
		andi.b	#$0F,d2
		cmp.b	d1,d2
		beq.s	loc_105D2
		move.b	#$08,Unk0D(a0)

loc_105D2:					  ; CODE XREF: UpdateSpriteFrame+1C6j
		move.b	Unk0D(a0),d0
		move.b	d0,d1
		move.b	Speed(a0),d7
		add.b	d7,d7
		bne.s	loc_10616
		move.w	#$0004,d7
		bra.s	loc_10616
; ---------------------------------------------------------------------------

loc_105E6:					  ; CODE XREF: UpdateSpriteFrame+1B6j
		move.b	#$0C,d5
		clr.w	d4
		btst	#$06,Flags4(a0)		  ; Bit	0 = Invincible / Solid
		beq.s	loc_105F8
		move.w	#$0018,d4

loc_105F8:					  ; CODE XREF: UpdateSpriteFrame+1EEj
						  ; UpdateSpriteFrame+2A0j ...
		andi.b	#$0F,d2
		cmp.b	d1,d2
		beq.s	loc_10606
		move.b	#$08,Unk0D(a0)

loc_10606:					  ; CODE XREF: UpdateSpriteFrame+1FAj
		move.b	Unk0D(a0),d0
		move.b	d0,d1
		move.b	Speed(a0),d7
		bne.s	loc_10616
		move.w	#$0002,d7

loc_10616:					  ; CODE XREF: UpdateSpriteFrame+1DAj
						  ; UpdateSpriteFrame+1E0j ...
		btst	#$01,Flags4(a0)		  ; Bit	0 = Invincible / Solid
		beq.s	loc_10622
		sub.b	d7,d1
		bra.s	loc_10624
; ---------------------------------------------------------------------------

loc_10622:					  ; CODE XREF: UpdateSpriteFrame+218j
		add.b	d7,d1

loc_10624:					  ; CODE XREF: UpdateSpriteFrame+21Cj
		neg.b	d7
		and.b	d7,d1
		move.b	d1,Unk0D(a0)
		cmpi.b	#$07,d0
		bls.s	loc_1064E
		andi.b	#$07,d0
		move.b	d0,Unk0D(a0)
		move.b	AnimationFrame1(a0),d0
		move.b	d0,d1
		addq.b	#$04,d1
		and.b	d5,d1
		move.b	d1,AnimationFrame1(a0)
		bset	#$07,Unk0A(a0)

loc_1064E:					  ; CODE XREF: UpdateSpriteFrame+22Cj
		move.b	RotationAndSize(a0),d0
		btst	#$01,Flags4(a0)		  ; Bit	0 = Invincible / Solid
		beq.s	loc_1065E
		eori.b	#$80,d0

loc_1065E:					  ; CODE XREF: UpdateSpriteFrame+254j
		btst	#$04,d3
		bne.s	loc_10676
		andi.b	#$C0,d0
		beq.s	loc_10676
		cmpi.b	#$80,d0
		beq.s	loc_1068E
		bhi.s	loc_10682
		addq.w	#$04,d4
		bra.s	loc_10682
; ---------------------------------------------------------------------------

loc_10676:					  ; CODE XREF: UpdateSpriteFrame+25Ej
						  ; UpdateSpriteFrame+264j ...
		move.w	d4,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_10682:					  ; CODE XREF: UpdateSpriteFrame+26Cj
						  ; UpdateSpriteFrame+270j
		move.w	d4,AnimationIndex(a0)
		bset	#$03,TileSource(a0)

locret_1068C:					  ; CODE XREF: UpdateSpriteFrame+292j
		rts
; ---------------------------------------------------------------------------

loc_1068E:					  ; CODE XREF: UpdateSpriteFrame+26Aj
		addq.w	#$04,d4
		bra.s	loc_10676
; ---------------------------------------------------------------------------

loc_10692:					  ; CODE XREF: UpdateSpriteFrame+1B2j
		btst	#$03,d3
		beq.s	locret_1068C
		move.b	#$04,d5
		clr.w	d4
		btst	#$06,Flags4(a0)		  ; Bit	0 = Invincible / Solid
		beq.w	loc_105F8
		move.w	#$0008,d4
		bra.w	loc_105F8
; ---------------------------------------------------------------------------

LoadAttackAnimFrame:				  ; CODE XREF: UpdateSpriteFrame+6Cj
		bsr.w	sub_10794
		btst	#$06,d3
		bne.s	GetAttackFrame
		move.w	#$0008,d2
		bra.s	loc_106C4
; ---------------------------------------------------------------------------

GetAttackFrame:					  ; CODE XREF: UpdateSpriteFrame+2B4j
		move.w	#$0038,d2

loc_106C4:					  ; CODE XREF: UpdateSpriteFrame+2BAj
		clr.w	AnimationFrame(a0)
		cmpi.w	#$0100,d1
		beq.s	GetRotatedAnimIdx
		move.w	#$0004,AnimationFrame(a0)
		cmpi.w	#$0200,d1
		beq.s	GetRotatedAnimIdx
		move.w	#$0008,AnimationFrame(a0)
		cmpi.w	#$0300,d1
		beq.s	GetRotatedAnimIdx
		move.w	#$000C,AnimationFrame(a0)
		cmpi.w	#$0400,d1
		beq.s	GetRotatedAnimIdx
		move.w	#$0010,AnimationFrame(a0)
		cmpi.w	#$0500,d1
		beq.s	GetRotatedAnimIdx
		move.w	#$0014,AnimationFrame(a0)
		cmpi.w	#$0600,d1
		beq.s	GetRotatedAnimIdx
		move.w	#$0018,AnimationFrame(a0)

GetRotatedAnimIdx:				  ; CODE XREF: UpdateSpriteFrame+2C8j
						  ; UpdateSpriteFrame+2D4j ...
		move.b	RotationAndSize(a0),d0
		btst	#$01,Flags4(a0)		  ; Bit	0 = Invincible / Solid
		beq.s	loc_10720
		eori.b	#$80,d0

loc_10720:					  ; CODE XREF: UpdateSpriteFrame+316j
		andi.b	#$C0,d0
		beq.s	loc_1073E
		cmpi.b	#$80,d0
		beq.s	loc_1073C
		bhi.s	loc_10730
		addq.w	#$04,d2

loc_10730:					  ; CODE XREF: UpdateSpriteFrame+328j
		move.w	d2,AnimationIndex(a0)
		bset	#$03,TileSource(a0)	  ; Set	HFlip
		rts
; ---------------------------------------------------------------------------

loc_1073C:					  ; CODE XREF: UpdateSpriteFrame+326j
		addq.w	#$04,d2

loc_1073E:					  ; CODE XREF: UpdateSpriteFrame+320j
		move.w	d2,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)	  ; Clear HFlip
		rts
; ---------------------------------------------------------------------------

LoadJumpAnimFrame:				  ; CODE XREF: UpdateSpriteFrame+76j
		btst	#$02,d3
		beq.w	LoadIdleAnimFrame
		bsr.w	sub_10794
		clr.w	AnimationFrame(a0)
		btst	#$06,d3
		beq.s	loc_10766
		move.w	#$0020,d2
		bra.s	GetRotatedAnimIdx
; ---------------------------------------------------------------------------

loc_10766:					  ; CODE XREF: UpdateSpriteFrame+35Aj
		move.w	#$0010,d2
		bra.s	GetRotatedAnimIdx
; ---------------------------------------------------------------------------

LoadDamageAnimFrame:				  ; CODE XREF: UpdateSpriteFrame+3Ej
						  ; UpdateSpriteFrame+62j
		btst	#$05,d3			  ; Bit5: HasDamageAnim
		beq.w	locret_1078A
		bsr.w	sub_10794
		clr.w	AnimationFrame(a0)
		btst	#$02,d3
		bne.s	loc_1078C
		move.w	#$0018,d2
		bra.w	GetRotatedAnimIdx
; ---------------------------------------------------------------------------

locret_1078A:					  ; CODE XREF: UpdateSpriteFrame+36Cj
		rts
; ---------------------------------------------------------------------------

loc_1078C:					  ; CODE XREF: UpdateSpriteFrame+37Cj
		move.w	#$0020,d2
		bra.w	GetRotatedAnimIdx
; End of function UpdateSpriteFrame


; =============== S U B	R O U T	I N E =======================================


sub_10794:					  ; CODE XREF: UpdateSpriteFrame+AAp
						  ; UpdateSpriteFrame+126p ...
		cmp.w	d0,d2
		beq.s	loc_107A8
		cmpi.w	#$FFFF,d2
		bne.s	loc_107A0
		clr.w	d2

loc_107A0:					  ; CODE XREF: sub_10794+8j
		bset	#$07,Unk0A(a0)
		rts
; ---------------------------------------------------------------------------

loc_107A8:					  ; CODE XREF: sub_10794+2j
		movem.l	(sp)+,d0
		rts
; End of function sub_10794


; =============== S U B	R O U T	I N E =======================================


LookupSpriteAnimFlags:				  ; CODE XREF: sub_12CAE+4p
						  ; ROM:00016370p
						  ; DATA XREF: ...
		move.b	Unk0A(a1),d1
		andi.b	#$7F,d1
		beq.s	loc_107CE
		move.b	SpriteGraphic(a1),d1
		lea	SpriteAnimFlags(pc),a0

loc_107C0:					  ; CODE XREF: LookupSpriteAnimFlags+1Ej
		move.b	$00000001(a0),d3
		bmi.s	loc_107CE
		cmp.b	(a0),d1
		beq.s	loc_107D2
		addq.l	#$02,a0
		bra.s	loc_107C0
; ---------------------------------------------------------------------------

loc_107CE:					  ; CODE XREF: LookupSpriteAnimFlags+8j
						  ; LookupSpriteAnimFlags+16j
		move.b	#$01,d3

loc_107D2:					  ; CODE XREF: LookupSpriteAnimFlags+1Aj
		move.b	d3,AnimFlags(a1)
		rts
; End of function LookupSpriteAnimFlags

; ---------------------------------------------------------------------------
