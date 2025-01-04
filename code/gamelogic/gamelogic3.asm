; ---------------------------------------------------------------------------

HandleJump:					  ; CODE XREF: sub_21B6+Ep
		move.b	(Player_JumpRate).l,d0
		andi.w	#$001F,d0
		bne.s	loc_3FCE
		move.b	(byte_FF1133).l,d2
		beq.s	loc_3FAC
		cmpi.b	#$17,d2
		bcs.s	locret_400A

loc_3FAC:					  ; CODE XREF: ROM:00003FA4j
		tst.b	(g_LadderClimbJumpState).l
		bne.w	locret_400A
		move.b	(g_Controller1State).l,d2
		andi.b	#CTRLBF_B,d2
		beq.s	locret_400A
		move.b	#$10,(g_LadderClimbJumpState).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Jump
; ---------------------------------------------------------------------------

loc_3FCE:					  ; CODE XREF: ROM:00003F9Cj
		lea	(Player_X).l,a5

; =============== S U B	R O U T	I N E =======================================


sub_3FD4:					  ; CODE XREF: sub_3AAj
		bsr.w	sub_33EA
		move.b	JumpAcceleration(pc,d0.w),d1
		ext.w	d1
		cmp.w	d5,d1
		bhi.s	loc_3FF8
		add.w	d1,Z(a5)
		add.w	d1,HitBoxZEnd(a5)
		andi.b	#$E0,JumpRate(a5)
		addq.b	#$01,d0
		cmpi.b	#$0C,d0
		bcs.s	loc_4000

loc_3FF8:					  ; CODE XREF: sub_3FD4+Cj
		andi.w	#$60E0,FallRate(a5)
		rts
; ---------------------------------------------------------------------------

loc_4000:					  ; CODE XREF: sub_3FD4+22j
		or.b	d0,JumpRate(a5)
		ori.b	#$80,FallRate(a5)

locret_400A:					  ; CODE XREF: ROM:00003FAAj
						  ; ROM:00003FB2j ...
		rts
; End of function sub_3FD4

; ---------------------------------------------------------------------------
JumpAcceleration:dc.b $04, $04,	$03, $03, $03, $02, $02, $02
		dc.b $02, $01, $01, $01, $01, $01, $01,	$01

; =============== S U B	R O U T	I N E =======================================


LoadSprites:					  ; CODE XREF: j_LoadSpritesj
						  ; GameLoop+6Ap ...
		move.l	(loc_403C,pc),(JumpInstr2).l
		move.w	((loc_403C+4),pc),(JumpInstr2+4).l
		bsr.s	ResetVdpSprites
		bsr.w	sub_40F2
		bsr.w	sub_4980
		bsr.w	LoadSpriteFrames
		rts
; End of function LoadSprites

; ---------------------------------------------------------------------------

loc_403C:					  ; DATA XREF: LoadSpritest
						  ; LoadSprites+8t
		jmp	(loc_433E).l

; =============== S U B	R O U T	I N E =======================================


sub_4042:					  ; CODE XREF: LoadRoom_0+54p
						  ; LoadRoom+46p
		move.l	(j_QueueDMAOp_0,pc),(JmpInstr1).l
		move.w	((j_QueueDMAOp_0+4),pc),(JmpInstr1+4).l
		move.l	(loc_409E,pc),(JumpInstr2).l
		move.w	((loc_409E+4),pc),(JumpInstr2+4).l
		bsr.s	ResetVdpSprites
		lea	(Player_X).l,a0
		lea	(unk_FF11DE).l,a1
		clr.w	d0
		moveq	#$0000000F,d7

loc_4074:					  ; CODE XREF: sub_4042+3Ej
		move.w	d0,(a1)+
		addi.w	#$0080,d0
		lea	SPRITE_SIZE(a0),a0
		tst.b	(a0)
		dbmi	d7,loc_4074
		move.w	#$FFFF,(a1)
		bsr.w	sub_4266
		move.l	(j_QueueDMAOp_0,pc),(JmpInstr1).l
		move.w	((j_QueueDMAOp_0+4),pc),(JmpInstr1+4).l
		rts
; End of function sub_4042

; ---------------------------------------------------------------------------

loc_409E:					  ; DATA XREF: sub_4042+10t
						  ; sub_4042+18t
		jmp	(loc_427C).l

; =============== S U B	R O U T	I N E =======================================


ResetVdpSprites:				  ; CODE XREF: LoadSprites+10p
						  ; sub_4042+20p
		lea	(g_VDPSpr16_Y).l,a2
		moveq	#$00000007,d7
		moveq	#$00000000,d0
		move.l	#$000000FF,d1

loc_40B4:					  ; CODE XREF: ResetVdpSprites+30j
		and.l	d1,(a2)+
		move.l	d0,(a2)+
		and.l	d1,(a2)+
		move.l	d0,(a2)+
		and.l	d1,(a2)+
		move.l	d0,(a2)+
		and.l	d1,(a2)+
		move.l	d0,(a2)+
		and.l	d1,(a2)+
		move.l	d0,(a2)+
		and.l	d1,(a2)+
		move.l	d0,(a2)+
		and.l	d1,(a2)+
		move.l	d0,(a2)+
		and.l	d1,(a2)+
		move.l	d0,(a2)+
		dbf	d7,loc_40B4
		lea	(unk_FF11DE).l,a2
		moveq	#$FFFFFFFF,d0
		move.l	d0,(a2)+
		move.l	d0,(a2)+
		move.l	d0,(a2)+
		move.l	d0,(a2)+
		move.l	d0,(a2)+
		move.l	d0,(a2)+
		move.l	d0,(a2)+
		move.l	d0,(a2)+
		rts
; End of function ResetVdpSprites


; =============== S U B	R O U T	I N E =======================================


sub_40F2:					  ; CODE XREF: LoadSprites+12p
		lea	(unk_FF11DE).l,a2
		lea	(Player_X).l,a6
		clr.w	d6
		movea.w	#$0000,a5
		move.w	#$0100,d4
		move.w	#$0200,d5
		bsr.w	sub_4144
		move.w	(word_FF1180).l,d3
		eori.w	#$0001,d3
		movea.w	d3,a5
		lea	(Sprite1_X).l,a6
		move.w	#SPRITE_SIZE,d6
		moveq	#$0000000E,d7

loc_4128:					  ; CODE XREF: sub_40F2+4Cj
		tst.b	(a6)
		bmi.s	locret_4142
		move.l	Unk0E(a6),Unk4E(a6)
		bsr.w	sub_4144
		addi.w	#SPRITE_SIZE,d6
		lea	SPRITE_SIZE(a6),a6
		dbf	d7,loc_4128

locret_4142:					  ; CODE XREF: sub_40F2+38j
		rts
; End of function sub_40F2


; =============== S U B	R O U T	I N E =======================================


sub_4144:					  ; CODE XREF: sub_40F2+1Ap
						  ; sub_40F2+40p
		btst	#$06,Flags2(a6)
		bne.w	loc_41DE
		btst	#$00,Flags1(a6)
		bne.w	loc_41DE
		move.w	Z(a6),d2
		move.w	CentreX(a6),d0
		sub.w	d2,d0
		move.w	CentreY(a6),d1
		sub.w	d2,d1
		sub.w	(word_FF1200).l,d0
		sub.w	(word_FF1202).l,d1
		move.w	d0,d2
		move.w	d1,d3
		add.w	d1,d0
		add.w	d4,d0
		cmp.w	d5,d0
		bcc.s	loc_41DE
		sub.w	d3,d2
		add.w	d4,d2
		cmp.w	d5,d2
		bcc.s	loc_41DE
		sub.w	d4,d2
		addi.w	#$0120,d2
		cmpi.w	#$0060,d2
		bcs.s	loc_41DE
		cmpi.w	#$01E0,d2
		bcc.s	loc_41DE
		sub.w	d4,d0
		add.w	a5,d0
		lsr.w	#$01,d0
		addi.w	#$00E8,d0
		andi.w	#$07FF,d0
		cmpi.w	#$0080,d0
		bcs.s	loc_41DE
		cmpi.w	#$01E0,d0
		bcc.s	loc_41DE
		move.w	d2,Unk0E(a6)
		move.w	d0,Unk10(a6)
		move.w	d6,(a2)+
		move.w	HitBoxXStart(a6),d0
		add.w	HitBoxYStart(a6),d0
		lsr.w	#$01,d0
		clr.w	d1
		move.b	Height(a6),d1
		add.w	d1,d0
		add.w	Z(a6),d0
		add.w	HitBoxZEnd(a6),d0
		move.w	d0,Unk56(a6)
		rts
; ---------------------------------------------------------------------------

loc_41DE:					  ; CODE XREF: sub_4144+6j
						  ; sub_4144+10j ...
		clr.l	Unk0E(a6)
		bclr	#$07,Unk48(a6)
		beq.s	loc_41EE
		move.w	d6,(a2)+
		rts
; ---------------------------------------------------------------------------

loc_41EE:					  ; CODE XREF: sub_4144+A4j
		bclr	#$07,Unk0A(a6)
		rts
; End of function sub_4144


; =============== S U B	R O U T	I N E =======================================


LoadSpriteFrames:				  ; CODE XREF: LoadSprites+1Ap
		bsr.s	InitSpriteLoad

loc_41F8:					  ; CODE XREF: LoadSpriteFrames:loc_420Ej
		move.w	(a3)+,d0
		bmi.s	locret_4212
		lea	(Player_X).l,a1
		adda.w	d0,a1
		btst	#$00,Flags1(a1)
		bne.s	loc_420E
		bsr.s	LoadSpriteFrame

loc_420E:					  ; CODE XREF: LoadSpriteFrames+14j
		dbf	d7,loc_41F8

locret_4212:					  ; CODE XREF: LoadSpriteFrames+4j
		rts
; End of function LoadSpriteFrames


; =============== S U B	R O U T	I N E =======================================


InitSpriteLoad:					  ; CODE XREF: LoadSpriteFramesp
						  ; sub_4266p
		lea	(g_VDPSpr16_Y).l,a2
		lea	(unk_FF11DE).l,a3
		lea	(SpriteGfxPtrPtr).l,a4
		move.w	#$03A8,d2		  ; VDP	RAM Begin
		moveq	#$0000000F,d7		  ; EntityCount
		clr.b	d6
		rts
; End of function InitSpriteLoad


; =============== S U B	R O U T	I N E =======================================


LoadSpriteFrame:				  ; CODE XREF: LoadSpriteFrames+16p
						  ; sub_4266+Ep
		movea.l	(a4),a0
		moveq	#$00000000,d0
		move.b	SpriteGraphic(a1),d0
		lsl.w	#$02,d0
		move.w	$00000006(a4,d0.w),d1
		move.w	$00000004(a4,d0.w),d0
		lsl.w	#$02,d0
		adda.l	d0,a0
		move.w	AnimationIndex(a1),d0
		movea.l	(a0,d0.w),a0
		move.w	AnimationFrame(a1),d0
		movea.l	(a0,d0.w),a0
		movem.l	d7/a1/a3,-(sp)
		jsr	(JumpInstr2).l
		movem.l	(sp)+,d7/a1/a3
		rts
; End of function LoadSpriteFrame


; =============== S U B	R O U T	I N E =======================================


sub_4266:					  ; CODE XREF: sub_4042+46p
		bsr.s	InitSpriteLoad

loc_4268:					  ; CODE XREF: sub_4266+10j
		move.w	(a3)+,d0
		bmi.s	locret_427A
		lea	(Player_X).l,a1
		adda.w	d0,a1
		bsr.s	LoadSpriteFrame
		dbf	d7,loc_4268

locret_427A:					  ; CODE XREF: sub_4266+4j
		rts
; End of function sub_4266

; ---------------------------------------------------------------------------

loc_427C:					  ; CODE XREF: ROM:loc_409Ej
		andi.w	#$F800,TileSource(a1)
		btst	#$04,TileCopySource(a1)	  ; Use	tile data loaded for another sprite
		beq.s	loc_42AA
		move.b	TileCopySource(a1),d1
		andi.w	#$000F,d1		  ; Sprite index to load from
		addq.b	#$01,d1
		lsl.w	#$07,d1
		lea	(Player_X).l,a3
		move.w	TileSource(a3,d1.w),d1
		andi.w	#$07FF,d1
		or.w	d1,TileSource(a1)
		bra.s	loc_42BE
; ---------------------------------------------------------------------------

loc_42AA:					  ; CODE XREF: ROM:00004288j
		or.w	d2,TileSource(a1)
		cmpa.l	#Player_X,a1
		bne.s	loc_42BC
		addi.w	#$002C,d2
		bra.s	loc_42BE
; ---------------------------------------------------------------------------

loc_42BC:					  ; CODE XREF: ROM:000042B4j
		add.w	d1,d2

loc_42BE:					  ; CODE XREF: ROM:000042A8j
						  ; ROM:000042BAj
		movem.w	d2/d6,-(sp)
		movem.l	a1-a2,-(sp)
		bsr.w	sub_45DE
		bsr.w	LoadSpriteTiles
		movem.l	(sp)+,a1-a2
		tst.b	d0
		beq.s	loc_42DC
		bset	#$00,Flags2(a1)

loc_42DC:					  ; CODE XREF: ROM:000042D4j
		bsr.w	sub_4374
		movem.w	(sp)+,d2/d6
		cmpi.w	#$03FF,d2		  ; Flush every	87 tiles
		bcs.s	loc_4318
		bset	#$03,d6
		bne.s	loc_42F6
		bsr.w	FlushDMACopyQueue
		bra.s	loc_4318
; ---------------------------------------------------------------------------

loc_42F6:					  ; CODE XREF: ROM:000042EEj
		cmpi.w	#$0456,d2
		bcs.s	loc_4318
		bset	#$01,d6
		bne.s	loc_4308
		bsr.w	FlushDMACopyQueue
		bra.s	loc_4318
; ---------------------------------------------------------------------------

loc_4308:					  ; CODE XREF: ROM:00004300j
		cmpi.w	#$04AD,d2
		bcs.s	loc_4318
		bset	#$02,d6
		bne.s	loc_4318
		bsr.w	FlushDMACopyQueue

loc_4318:					  ; CODE XREF: ROM:000042E8j
						  ; ROM:000042F4j ...
		tst.w	(DebugModeEnable).w
		bmi.s	locret_4336
		cmpi.w	#$04F4,d2
		bcs.s	locret_4336
		moveq	#$0000000A,d7

loc_4326:					  ; CODE XREF: ROM:00004332j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Throw
; ---------------------------------------------------------------------------
		move.w	#$0003,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames
		dbf	d7,loc_4326

locret_4336:					  ; CODE XREF: ROM:0000431Cj
						  ; ROM:00004322j
		rts
; ---------------------------------------------------------------------------

j_DoDMACopy:					  ; DATA XREF: ROM:0000470Ct
						  ; ROM:00004714t
		jmp	(DoDMACopy).l		  ; d0 = DMA Length
						  ; a0 = DMA Source
						  ; a1 = DMA Destination
; ---------------------------------------------------------------------------

loc_433E:					  ; CODE XREF: ROM:loc_403Cj
		bclr	#$07,Unk48(a1)
		beq.s	loc_434E
		bclr	#$07,Unk0A(a1)
		bra.s	loc_4356
; ---------------------------------------------------------------------------

loc_434E:					  ; CODE XREF: ROM:00004344j
		bclr	#$07,Unk0A(a1)
		beq.s	loc_436A

loc_4356:					  ; CODE XREF: ROM:0000434Cj
		movem.l	a0-a2,-(sp)
		bsr.w	sub_45DE
		bsr.w	LoadSpriteTiles
		movem.l	(sp)+,a0-a2
		bsr.s	sub_4374
		rts
; ---------------------------------------------------------------------------

loc_436A:					  ; CODE XREF: ROM:00004354j
		bsr.s	loc_437A
		rts
; ---------------------------------------------------------------------------

j_QueueDMAOp_0:					  ; DATA XREF: sub_4042t
						  ; sub_4042+8t ...
		jmp	(QueueDMAOp).l		  ; d0 - DMA Length
						  ; a0 - DMA Source
						  ; a1 - DMA Copy

; =============== S U B	R O U T	I N E =======================================


sub_4374:					  ; CODE XREF: ROM:loc_42DCp
						  ; ROM:00004366p
		movem.l	a3-a6,-(sp)
		bra.s	loc_43B2
; ---------------------------------------------------------------------------

loc_437A:					  ; CODE XREF: ROM:loc_436Ap
		movem.l	a3-a6,-(sp)
		bclr	#$06,QueuedAction(a1)
		bne.s	loc_43B2
		btst	#$06,Flags1(a1)
		bne.s	loc_43B2
		move.w	SpriteUnderneath(a1),d0
		bmi.s	loc_43A6
		lea	(Player_X).l,a6
		adda.w	d0,a6
		move.b	Speed(a6),d0
		andi.b	#$0F,d0
		bne.s	loc_43B2

loc_43A6:					  ; CODE XREF: sub_4374+1Ej
		move.b	AnimAction1(a1),d0
		andi.b	#$3F,d0
		beq.w	loc_43B8

loc_43B2:					  ; CODE XREF: sub_4374+4j
						  ; sub_4374+10j ...
		bsr.w	sub_44C4
		bra.s	loc_43D8
; ---------------------------------------------------------------------------

loc_43B8:					  ; CODE XREF: sub_4374+3Aj
		tst.l	Unk4E(a1)
		beq.s	loc_43B2
		move.l	a1,d7
		subi.l	#Player_X,d7
		lsr.w	#$01,d7
		movea.l	d7,a3
		adda.l	#unk_FF1400,a3
		move.w	$00000004(a3),d0
		andi.w	#$8000,d0

loc_43D8:					  ; CODE XREF: sub_4374+42j
		cmpa.l	#Player_X,a1
		bne.s	loc_4420
		move.b	(g_PlayerStatus).l,d1
		andi.b	#$0F,d1
		beq.s	loc_4420
		movem.l	d0/a1-a3,-(sp)
		jsr	(j_LoadStatusGfx).l
		movem.l	(sp)+,d0/a1-a3
		move.w	Unk10(a1),d1
		subi.w	#$0040,d1
		move.w	d1,(a2)+
		move.w	#$0F00,d1
		andi.w	#$00FF,(a2)
		or.w	d1,(a2)+
		move.w	#$4514,d1
		or.w	d0,d1
		move.w	d1,(a2)+
		move.w	Unk0E(a1),d1
		subi.w	#$0010,d1
		move.w	d1,(a2)+

loc_4420:					  ; CODE XREF: sub_4374+6Aj
						  ; sub_4374+76j
		btst	#$01,Flags2(a1)
		beq.s	loc_448C
		move.b	Unk48(a1),d3
		andi.b	#$07,d3
		beq.s	loc_448C
		move.w	#$24C4,d3
		cmpa.l	#Player_X,a1
		beq.s	loc_4442
		move.w	#$478C,d3

loc_4442:					  ; CODE XREF: sub_4374+C8j
		btst	#$00,(byte_FF0F9D).l
		beq.s	loc_4450
		addi.w	#$0018,d3

loc_4450:					  ; CODE XREF: sub_4374+D6j
		or.w	d0,d3
		move.w	Unk10(a1),d2
		subi.w	#$0028,d2
		move.w	d2,(a2)+
		move.b	#$0F,(a2)
		addq.w	#$02,a2
		move.w	d3,(a2)+
		move.w	Unk0E(a1),d1
		subi.w	#$0010,d1
		move.w	d1,(a2)+
		move.w	Unk10(a1),d2
		subi.w	#$0008,d2
		move.w	d2,(a2)+
		move.b	#$0D,(a2)
		addq.w	#$02,a2
		addi.w	#$0010,d3
		move.w	d3,(a2)+
		move.w	d1,(a2)+
		movem.l	(sp)+,a3-a6
		rts
; ---------------------------------------------------------------------------

loc_448C:					  ; CODE XREF: sub_4374+B2j
						  ; sub_4374+BCj
		moveq	#$00000007,d7

loc_448E:					  ; CODE XREF: sub_4374+146j
		move.w	(a3)+,d1
		cmpi.w	#$FFFF,d1
		beq.s	loc_44BE
		add.w	$00000010(a1),d1
		move.w	d1,(a2)+
		move.w	(a3)+,d1
		andi.w	#$0F00,d1
		andi.w	#$00FF,(a2)
		or.w	d1,(a2)+
		move.w	(a3)+,d1
		andi.w	#$7FFF,d1
		or.w	d0,d1
		move.w	d1,(a2)+
		move.w	(a3)+,d1
		add.w	$0000000E(a1),d1
		move.w	d1,(a2)+
		dbf	d7,loc_448E

loc_44BE:					  ; CODE XREF: sub_4374+120j
		movem.l	(sp)+,a3-a6
		rts
; End of function sub_4374


; =============== S U B	R O U T	I N E =======================================


sub_44C4:					  ; CODE XREF: ROM:000003C2j
						  ; sub_4374:loc_43B2p
		clr.w	d0
		move.w	Z(a1),d1
		lsr.w	#$04,d1
		movea.w	HeightmapOffset(a1),a3
		movea.w	a3,a4
		movea.w	a3,a5
		addq.w	#$02,a3
		lea	$00000094(a5),a5
		lea	$00000096(a4),a4
		move.b	SubX(a1),d2
		move.b	SubY(a1),d3
		move.b	RotationAndSize(a1),d4
		andi.b	#$3E,d4
		cmpi.b	#$08,d4
		bls.s	loc_4520
		subq.b	#$08,d4
		add.b	d4,d2
		cmpi.b	#$10,d2
		bcs.s	loc_4504
		addq.w	#$02,a3
		addq.w	#$02,a4
		addq.w	#$02,a5

loc_4504:					  ; CODE XREF: sub_44C4+38j
		add.b	d4,d3
		cmpi.b	#$10,d3
		bcs.s	loc_4518
		lea	$00000094(a3),a3
		lea	$00000094(a4),a4
		lea	$00000094(a5),a5

loc_4518:					  ; CODE XREF: sub_44C4+46j
		andi.b	#$0F,d2
		andi.b	#$0F,d3

loc_4520:					  ; CODE XREF: sub_44C4+2Ej
		cmp.b	d3,d2
		beq.s	loc_454C
		bcs.s	loc_453A
		movea.w	a3,a6
		cmpi.b	#$08,d2
		bne.s	loc_4534
		cmpi.b	#$07,d3
		beq.s	loc_454E

loc_4534:					  ; CODE XREF: sub_44C4+68j
		suba.w	#$0094,a6
		bra.s	loc_454E
; ---------------------------------------------------------------------------

loc_453A:					  ; CODE XREF: sub_44C4+60j
		movea.w	a5,a6
		cmpi.b	#$08,d3
		bne.s	loc_4548
		cmpi.b	#$07,d2
		beq.s	loc_454E

loc_4548:					  ; CODE XREF: sub_44C4+7Cj
		subq.w	#$02,a6
		bra.s	loc_454E
; ---------------------------------------------------------------------------

loc_454C:					  ; CODE XREF: sub_44C4+5Ej
		movea.w	a4,a6

loc_454E:					  ; CODE XREF: sub_44C4+6Ej
						  ; sub_44C4+74j ...
		clr.b	d4
		cmpi.b	#$08,d2
		bls.s	loc_4560
		moveq	#$00000001,d4
		lea	$00000096(a3),a3
		lea	$00000096(a6),a6

loc_4560:					  ; CODE XREF: sub_44C4+90j
		cmpi.b	#$08,d3
		bls.s	loc_457A
		lea	$00000096(a5),a5
		lea	$00000096(a6),a6
		tst.b	d4
		beq.s	loc_457A
		lea	$00000096(a4),a4
		suba.w	#$0096,a6

loc_457A:					  ; CODE XREF: sub_44C4+A0j
						  ; sub_44C4+ACj
		moveq	#$0000000B,d7
		move.b	#$0F,d5

loc_4580:					  ; CODE XREF: sub_44C4+EEj
		move.b	(a3),d4
		and.b	d5,d4
		cmp.b	d1,d4
		bhi.s	loc_45BA
		move.b	(a4),d4
		and.b	d5,d4
		cmp.b	d1,d4
		bhi.s	loc_45BA
		move.b	(a5),d4
		and.b	d5,d4
		cmp.b	d1,d4
		bhi.s	loc_45BA
		move.b	(a6),d4
		and.b	d5,d4
		cmp.b	d1,d4
		bhi.s	loc_45BA
		addq.b	#$01,d1
		lea	$00000096(a3),a3
		lea	$00000096(a4),a4
		lea	$00000096(a5),a5
		lea	$00000096(a6),a6
		dbf	d7,loc_4580
		move.w	#$8000,d0

loc_45BA:					  ; CODE XREF: sub_44C4+C2j
						  ; sub_44C4+CAj ...
		move.l	a1,d7
		subi.l	#Player_X,d7
		lsr.w	#$01,d7
		movea.l	d7,a3
		adda.l	#unk_FF1400,a3
		andi.w	#$7FFF,$00000004(a3)
		or.w	d0,$00000004(a3)
		rts
; End of function sub_44C4

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_45DE

loc_45D8:					  ; CODE XREF: sub_45DE-2j
						  ; sub_45DE+6j
		nop
		nop
		bra.s	loc_45D8
; END OF FUNCTION CHUNK	FOR sub_45DE

; =============== S U B	R O U T	I N E =======================================


sub_45DE:					  ; CODE XREF: ROM:000042C6p
						  ; ROM:0000435Ap

; FUNCTION CHUNK AT 000045D8 SIZE 00000006 BYTES

		cmpa.l	#$60000000,a0
		bhi.s	loc_45D8
		move.l	a1,d1
		subi.l	#Player_X,d1
		lsr.w	#$01,d1
		movea.l	d1,a3
		adda.l	#unk_FF1400,a3
		move.w	TileSource(a1),d0
		move.b	TileSource(a1),d6
		andi.b	#$08,d6
		bsr.s	LoadObjectVDPSprites
		move.w	#$FFFF,(a3)
		rts
; End of function sub_45DE


; =============== S U B	R O U T	I N E =======================================


LoadObjectVDPSprites:				  ; CODE XREF: sub_45DE+26p
						  ; LoadSpriteGfx+34p
		movem.w	d0,-(sp)
		clr.w	d1

loc_4612:					  ; CODE XREF: LoadObjectVDPSprites+66j
		move.b	(a0)+,d3
		add.b	d3,d3
		move.b	d3,d4
		andi.b	#$F8,d3
		ext.w	d3
		move.w	d3,(a3)+
		add.b	d4,d4
		andi.b	#$0C,d4
		move.b	(a0)+,d3
		move.b	d3,d5
		add.b	d3,d3
		andi.b	#$F8,d3
		ext.w	d3
		andi.w	#$0003,d5
		or.b	d4,d5
		move.b	d5,(a3)
		btst	#$03,d6
		beq.s	loc_464A
		neg.w	d3
		addq.b	#$04,d4
		add.b	d4,d4
		ext.w	d4
		sub.w	d4,d3

loc_464A:					  ; CODE XREF: LoadObjectVDPSprites+32j
		andi.w	#$8000,$00000002(a3)
		or.w	d0,$00000002(a3)
		or.b	d6,$00000002(a3)
		move.b	VDPSpriteTileCount(pc,d5.w),d5 ; Sprite	Width/Height to	num tiles
		ext.w	d5
		add.w	d5,d0
		move.w	d3,$00000004(a3)
		addq.w	#$06,a3
		addq.b	#$01,d1
		cmpi.b	#$08,d1
		bcc.s	loc_4674
		tst.b	-$00000001(a0)
		bpl.s	loc_4612

loc_4674:					  ; CODE XREF: LoadObjectVDPSprites+60j
		movem.w	(sp)+,d0
		rts
; End of function LoadObjectVDPSprites

; ---------------------------------------------------------------------------
VDPSpriteTileCount:dc.b	$01, $02, $03, $04
		dc.b $02, $04, $06, $08
		dc.b $03, $06, $09, $0C
		dc.b $04, $08, $0C, $10

; =============== S U B	R O U T	I N E =======================================


LoadSpriteGfx:					  ; CODE XREF: sub_F13A+40p
		move.l	(j_QueueDMAOp_0,pc),(JmpInstr1).l
		move.w	((j_QueueDMAOp_0+4),pc),(JmpInstr1+4).l
		lea	(SpriteGfxPtrPtr).l,a4
		movea.l	(a4),a0
		lsl.w	#$02,d0			  ; Sprite
		move.w	$00000004(a4,d0.w),d0
		lsl.w	#$02,d0
		adda.l	d0,a0
		movea.l	(a0,d2.w),a0		  ; Animation
		movea.l	(a0,d3.w),a0		  ; Frame
		movem.w	d1,-(sp)
		move.w	d1,d0
		movem.l	d4-d5/a3,-(sp)
		bsr.w	LoadObjectVDPSprites
		movea.l	a3,a6
		movem.l	(sp)+,d4-d5/a3

loc_46C8:					  ; CODE XREF: LoadSpriteGfx+48j
		add.w	d4,$00000006(a3)
		add.w	d5,(a3)
		addq.w	#$08,a3
		cmpa.l	a6,a3
		bcs.s	loc_46C8
		movem.w	(sp)+,d0
		bra.s	LoadSpriteTiles
; End of function LoadSpriteGfx


; =============== S U B	R O U T	I N E =======================================


sub_46DA:					  ; CODE XREF: InitInv+32p
		bsr.s	sub_46EE
; End of function sub_46DA


; =============== S U B	R O U T	I N E =======================================


sub_46DC:					  ; CODE XREF: sub_3890+Ap

; FUNCTION CHUNK AT 0000471C SIZE 00000022 BYTES

		move.l	(j_QueueDMAOp_0,pc),(JmpInstr1).l
		move.w	((j_QueueDMAOp_0+4),pc),(JmpInstr1+4).l
		bra.s	LoadSprite
; End of function sub_46DC


; =============== S U B	R O U T	I N E =======================================


sub_46EE:					  ; CODE XREF: sub_46DAp
						  ; ROM:0000470Ap
		move.b	d0,d2
		andi.b	#$07,d0
		lsl.b	#$02,d0
		ext.w	d0
		move.w	d0,d3
		andi.b	#$38,d2
		lsr.b	#$01,d2
		ext.w	d2
		move.l	#$00000023,d0
		rts
; End of function sub_46EE

; ---------------------------------------------------------------------------
		bsr.s	sub_46EE
		move.l	(j_DoDMACopy,pc),(JmpInstr1).l
		move.w	((j_DoDMACopy+4),pc),(JmpInstr1+4).l
; START	OF FUNCTION CHUNK FOR sub_46DC

LoadSprite:					  ; CODE XREF: sub_46DC+10j
		lea	(SpriteGfxPtrPtr).l,a4
		movea.l	(a4),a0
		lsl.w	#$02,d0
		move.w	$00000004(a4,d0.w),d0
		lsl.w	#$02,d0
		adda.l	d0,a0
		movea.l	(a0,d2.w),a0
		movea.l	(a0,d3.w),a0

loc_4736:					  ; CODE XREF: sub_46DC+5Ej
		addq.l	#$01,a0
		tst.b	(a0)+
		bpl.s	loc_4736
		move.w	d1,d0
; END OF FUNCTION CHUNK	FOR sub_46DC

; =============== S U B	R O U T	I N E =======================================


LoadSpriteTiles:				  ; CODE XREF: ROM:000042CAp
						  ; ROM:0000435Ep ...
		movea.l	a0,a6
		lsl.w	#$05,d0
		movea.w	d0,a1

loc_4744:					  ; CODE XREF: LoadSpriteTiles+2Aj
						  ; LoadSpriteTiles+42j
		move.b	(a6)+,d0
		lsl.w	#$08,d0
		move.b	(a6)+,d0
		move.w	d0,d7
		bmi.s	loc_476E
		andi.w	#$2000,d7
		bne.s	loc_4786
		move.w	d0,d7
		andi.w	#$0FFF,d0
		movea.l	a6,a0
		jsr	(JmpInstr1).l
		movea.l	a0,a6
		andi.w	#$4000,d7
		beq.s	loc_4744
		clr.b	d0
		rts
; ---------------------------------------------------------------------------

loc_476E:					  ; CODE XREF: LoadSpriteTiles+Ej
		lea	Zeros(pc),a0
		andi.w	#$0FFF,d0
		jsr	(JmpInstr1).l
		andi.w	#$4000,d7
		beq.s	loc_4744
		clr.b	d0
		rts
; ---------------------------------------------------------------------------

loc_4786:					  ; CODE XREF: LoadSpriteTiles+14j
		movea.l	a6,a0
		movea.l	a1,a2
		lea	(g_Buffer).l,a1
		movem.l	a3,-(sp)
		bsr.w	LoadCompressedGfx	  ; a0 - compressed graphics source
						  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination
		movem.l	(sp)+,a3
		moveq	#$FFFFFFFF,d0
		rts
; End of function LoadSpriteTiles

; ---------------------------------------------------------------------------
Zeros:		dcb.w $F0,$0000			  ; DATA XREF: LoadSpriteTiles:loc_476Et

; =============== S U B	R O U T	I N E =======================================


sub_4980:					  ; CODE XREF: LoadSprites+16p
		bra.w	loc_49BA
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a0
		lea	(unk_FF11DE).l,a2

loc_4990:					  ; CODE XREF: sub_4980+36j
		movea.l	a2,a3
		tst.w	(a3)+
		move.w	(a2),d2
		bmi.s	locret_49B8

loc_4998:					  ; CODE XREF: sub_4980+2Ej
						  ; sub_4980+32j
		move.w	(a3),d3
		bmi.s	loc_49B4
		move.w	Unk56(a0,d2.w),d0
		cmp.w	Unk56(a0,d3.w),d0
		bhi.s	loc_49B0
		move.w	(a2),d0
		move.w	(a3),(a2)
		move.w	d0,(a3)+
		move.w	(a2),d2
		bra.s	loc_4998
; ---------------------------------------------------------------------------

loc_49B0:					  ; CODE XREF: sub_4980+24j
		tst.w	(a3)+
		bra.s	loc_4998
; ---------------------------------------------------------------------------

loc_49B4:					  ; CODE XREF: sub_4980+1Aj
		tst.w	(a2)+
		bra.s	loc_4990
; ---------------------------------------------------------------------------

locret_49B8:					  ; CODE XREF: sub_4980+16j
		rts
; ---------------------------------------------------------------------------

loc_49BA:					  ; CODE XREF: sub_4980j
		bsr.s	sub_49C0
		bsr.s	sub_4A3A
		rts
; End of function sub_4980


; =============== S U B	R O U T	I N E =======================================


sub_49C0:					  ; CODE XREF: sub_4980:loc_49BAp
		lea	(Player_X).l,a0
		lea	(unk_FF11DE).l,a2
		moveq	#$0000000E,d7

loc_49CE:					  ; CODE XREF: sub_49C0+6Aj
		movem.w	d7,-(sp)
		movea.l	a2,a3
		tst.w	(a3)+
		move.w	(a2),d2
		move.w	(a3),d3

loc_49DA:					  ; CODE XREF: sub_49C0+5Ej
		tst.w	d2
		bmi.s	loc_4A30
		tst.w	d3
		bmi.s	loc_4A1A
		tst.w	(a0,d3.w)
		bmi.s	loc_4A22
		move.w	HitBoxXStart(a0,d2.w),d0
		cmp.w	HitBoxXEnd(a0,d3.w),d0
		bcc.s	loc_4A1A
		move.w	HitBoxYStart(a0,d2.w),d0
		cmp.w	HitBoxYEnd(a0,d3.w),d0
		bcc.s	loc_4A1A
		move.w	HitBoxXEnd(a0,d2.w),d0
		cmp.w	HitBoxXStart(a0,d3.w),d0
		bls.s	loc_4A30
		move.w	HitBoxYEnd(a0,d2.w),d0
		cmp.w	HitBoxYStart(a0,d3.w),d0
		bls.s	loc_4A30
		move.w	Z(a0,d2.w),d0
		cmp.w	Z(a0,d3.w),d0
		bcs.s	loc_4A30

loc_4A1A:					  ; CODE XREF: sub_49C0+20j
						  ; sub_49C0+30j ...
		tst.w	(a3)+

loc_4A1C:					  ; CODE XREF: sub_49C0+78j
		move.w	(a3),d3
		dbf	d7,loc_49DA

loc_4A22:					  ; CODE XREF: sub_49C0+26j
		movem.w	(sp)+,d7
		tst.w	(a2)+
		move.w	(a2),d2
		dbf	d7,loc_49CE
		rts
; ---------------------------------------------------------------------------

loc_4A30:					  ; CODE XREF: sub_49C0+1Cj
						  ; sub_49C0+44j ...
		move.w	(a2),d0
		move.w	(a3),(a2)
		move.w	d0,(a3)+
		move.w	(a2),d2
		bra.s	loc_4A1C
; End of function sub_49C0


; =============== S U B	R O U T	I N E =======================================


sub_4A3A:					  ; CODE XREF: sub_4980+3Cp
		lea	(unk_FF11DE).l,a3
		lea	(Player_X).l,a1

loc_4A46:					  ; CODE XREF: sub_4A3A+3Cj
		movea.l	a3,a0
		tst.w	(a3)+
		move.w	(a0)+,d0
		movea.l	a0,a2

loc_4A4E:					  ; CODE XREF: sub_4A3A+1Cj
		move.w	(a0)+,d1
		bmi.s	loc_4A74
		cmp.w	SpriteUnderneath(a1,d1.w),d0
		bne.s	loc_4A4E

loc_4A58:					  ; CODE XREF: sub_4A3A+24j
						  ; sub_4A3A+36j
		move.w	(a2)+,-$00000004(a2)
		cmpa.l	a2,a0
		bne.s	loc_4A58
		move.w	d0,-$00000002(a2)
		move.w	-$00000002(a3),d0
		tst.w	SpriteUnderneath(a1,d0.w)
		bpl.s	loc_4A72
		movea.l	a3,a2
		bra.s	loc_4A58
; ---------------------------------------------------------------------------

loc_4A72:					  ; CODE XREF: sub_4A3A+32j
		tst.w	-(a3)

loc_4A74:					  ; CODE XREF: sub_4A3A+16j
		tst.w	(a3)
		bpl.s	loc_4A46
		rts
; End of function sub_4A3A


; =============== S U B	R O U T	I N E =======================================


DecompressAndQueueGfxCopy:			  ; CODE XREF: j_DecompressAndQueueGfxCopyj
						  ; LoadMagicSwordGfx+44p ...
		movem.l	a2,-(sp)
		movea.l	a1,a2
		bsr.w	DecompressLZ77Gfx
		move.l	a1,d0
		sub.l	a2,d0
		lsr.w	#$01,d0
		movea.l	a2,a0
		movem.l	(sp)+,a1
		bra.w	QueueDMAOp		  ; d0 - DMA Length
; End of function DecompressAndQueueGfxCopy	  ; a0 - DMA Source
						  ; a1 - DMA Copy

; =============== S U B	R O U T	I N E =======================================

; a0 - compressed graphics source
; a1 - decompressed graphics buffer
; a2 - VDP tile	graphics destination

LoadCompressedGfx:				  ; CODE XREF: j_LoadCompressedGfxj
						  ; LoadSpriteTiles+56p ...
		movem.l	a2,-(sp)
		movea.l	a1,a2
		bsr.w	DecompressLZ77Gfx
		move.l	a1,d0
		sub.l	a2,d0
		lsr.w	#$01,d0
		move.w	#$0002,d1
		movea.l	a2,a0
		movem.l	(sp)+,a1
		bra.w	DoDMACopy		  ; d0 = DMA Length
; End of function LoadCompressedGfx		  ; a0 = DMA Source
						  ; a1 = DMA Destination

; =============== S U B	R O U T	I N E =======================================


DecompressLZ77Gfx:				  ; CODE XREF: GetTileset+3Ap
						  ; DecompressAndQueueGfxCopy+6p ...
		moveq	#$0000000F,d4

loc_4AB4:					  ; CODE XREF: DecompressLZ77Gfx+50j
						  ; DecompressLZ77Gfx+5Ej
		moveq	#$00000007,d3
		move.b	(a0)+,d0
		bmi.s	loc_4B04

loc_4ABA:					  ; CODE XREF: DecompressLZ77Gfx+48j
						  ; DecompressLZ77Gfx+5Aj
		clr.w	d1
		move.b	(a0)+,d1
		move.w	d1,d2
		and.b	d4,d1
		add.b	d1,d1
		lsl.w	#$04,d2
		move.b	(a0)+,d2
		tst.w	d2
		beq.s	locret_4B12
		movea.l	a1,a3
		suba.w	d2,a3
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		jmp	loc_4AD8(pc,d1.w)
; ---------------------------------------------------------------------------

loc_4AD8:
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		add.b	d0,d0
		dbmi	d3,loc_4ABA
		dbpl	d3,loc_4B04
		bra.s	loc_4AB4
; ---------------------------------------------------------------------------

loc_4B04:					  ; CODE XREF: DecompressLZ77Gfx+6j
						  ; DecompressLZ77Gfx+4Cj ...
		move.b	(a0)+,(a1)+
		add.b	d0,d0
		dbpl	d3,loc_4B04
		dbmi	d3,loc_4ABA
		bra.s	loc_4AB4
; ---------------------------------------------------------------------------

locret_4B12:					  ; CODE XREF: DecompressLZ77Gfx+18j
		rts
; End of function DecompressLZ77Gfx


; =============== S U B	R O U T	I N E =======================================


sub_4B14:					  ; CODE XREF: ROM:00009714p
						  ; ROM:00009720p ...
		movem.l	d0-d1/a0,-(sp)
		bsr.w	sub_4CF4
		bcs.s	loc_4B4C
		lea	(VDPCopyBlockCmds).l,a1
		lsl.w	#$03,d5
		adda.w	d5,a1
		movea.l	(g_ScreenBufferPtr).l,a0
		move.w	(a1),(a0)+
		clr.l	(a0)+
		move.w	(a1),(a0)+
		clr.l	(a0)+
		addq.l	#$04,a1
		move.w	(a1),(a0)+
		clr.l	(a0)+
		move.w	(a1),(a0)+
		clr.l	(a0)+
		move.l	a0,(g_ScreenBufferPtr).l
		addq.b	#$01,(byte_FF1128).l

loc_4B4C:					  ; CODE XREF: sub_4B14+8j
		movem.l	(sp)+,d0-d1/a0
		rts
; End of function sub_4B14


; =============== S U B	R O U T	I N E =======================================


DoTileSwap:					  ; CODE XREF: j_DoTileSwapj
						  ; sub_4FA8+38p ...
		move.b	(byte_FF1128).l,(byte_FF115A).l
	if ~(REGION=JP)
		clr.b	(byte_FF1128).l
	endif
		movem.w	d0,-(sp)
		bsr.w	LoadTileSwap
		bsr.w	GetMapOffsets
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		move.b	(a0)+,d6
		move.b	(a0)+,d7
		ext.w	d0
		ext.w	d1
		ext.w	d6
		ext.w	d7
		movem.l	a0,-(sp)
		bsr.s	sub_4BA0
		movem.l	(sp)+,a0
		bsr.w	HMTileSwap
		movem.w	(sp)+,d0
		bsr.w	MapTileSwap
		move.b	(byte_FF115A).l,(byte_FF1128).l
		rts
; End of function DoTileSwap


; =============== S U B	R O U T	I N E =======================================


sub_4BA0:					  ; CODE XREF: DoTileSwap+30p
		cmpi.b	#$01,$00000009(a0)
		beq.s	loc_4BF2
		bhi.w	loc_4C40
		move.w	d0,d2
		move.w	d1,d3

loc_4BB0:					  ; CODE XREF: sub_4BA0+4Cj
		movem.l	d0/d2/d6/a1-a2,-(sp)

loc_4BB4:					  ; CODE XREF: sub_4BA0+38j
		bsr.w	sub_4CF4
		bcs.s	loc_4BD0
		movem.w	d0-d1/d5,-(sp)
		move.w	d2,d0
		move.w	d3,d1
		bsr.w	sub_4CF4
		movem.w	(sp)+,d0-d1/d4
		bcs.s	loc_4BD0
		bsr.w	sub_4C94

loc_4BD0:					  ; CODE XREF: sub_4BA0+18j
						  ; sub_4BA0+2Aj
		addq.w	#$02,a1
		addq.w	#$02,a2
		addq.b	#$01,d0
		addq.b	#$01,d2
		dbf	d6,loc_4BB4
		movem.l	(sp)+,d0/d2/d6/a1-a2
		lea	$00000094(a1),a1
		lea	$00000094(a2),a2
		addq.b	#$01,d1
		addq.b	#$01,d3
		dbf	d7,loc_4BB0
		rts
; ---------------------------------------------------------------------------

loc_4BF2:					  ; CODE XREF: sub_4BA0+6j
		move.w	d0,d2
		move.w	d1,d3
		addq.w	#$01,d0
		addq.w	#$02,a1

loc_4BFA:					  ; CODE XREF: sub_4BA0+9Aj
		movem.l	d0/d2/d6/a1-a2,-(sp)

loc_4BFE:					  ; CODE XREF: sub_4BA0+82j
		bsr.w	sub_4CF4
		bcs.s	loc_4C1A
		movem.w	d0-d1/d5,-(sp)
		move.w	d2,d0
		move.w	d3,d1
		bsr.w	sub_4CF4
		movem.w	(sp)+,d0-d1/d4
		bcs.s	loc_4C1A
		bsr.w	sub_4C94

loc_4C1A:					  ; CODE XREF: sub_4BA0+62j
						  ; sub_4BA0+74j
		addq.w	#$02,a1
		addq.w	#$02,a2
		addq.b	#$01,d0
		addq.b	#$01,d2
		dbf	d6,loc_4BFE
		movem.l	(sp)+,d0/d2/d6/a1-a2
		lea	$00000096(a1),a1
		lea	$00000096(a2),a2
		addq.b	#$01,d0
		addq.b	#$01,d2
		addq.b	#$01,d1
		addq.b	#$01,d3
		dbf	d7,loc_4BFA
		rts
; ---------------------------------------------------------------------------

loc_4C40:					  ; CODE XREF: sub_4BA0+8j
		move.w	d0,d2
		move.w	d1,d3
		addq.w	#$01,d3
		lea	$00000094(a2),a2

loc_4C4A:					  ; CODE XREF: sub_4BA0+EEj
		movem.l	d1/d3/d6/a1-a2,-(sp)

loc_4C4E:					  ; CODE XREF: sub_4BA0+D6j
		bsr.w	sub_4CF4
		bcs.s	loc_4C6A
		movem.w	d0-d1/d5,-(sp)
		move.w	d2,d0
		move.w	d3,d1
		bsr.w	sub_4CF4
		movem.w	(sp)+,d0-d1/d4
		bcs.s	loc_4C6A
		bsr.w	sub_4C94

loc_4C6A:					  ; CODE XREF: sub_4BA0+B2j
						  ; sub_4BA0+C4j
		lea	$00000094(a1),a1
		lea	$00000094(a2),a2
		addq.b	#$01,d1
		addq.b	#$01,d3
		dbf	d6,loc_4C4E
		movem.l	(sp)+,d1/d3/d6/a1-a2
		lea	$00000096(a1),a1
		lea	$00000096(a2),a2
		addq.b	#$01,d0
		addq.b	#$01,d2
		addq.b	#$01,d1
		addq.b	#$01,d3
		dbf	d7,loc_4C4A
		rts
; End of function sub_4BA0


; =============== S U B	R O U T	I N E =======================================


sub_4C94:					  ; CODE XREF: sub_4BA0+2Cp
						  ; sub_4BA0+76p ...
		movem.l	d2-d5/a1-a3,-(sp)
		move.w	(a1),d2
		move.w	(a2),d3
		lsl.w	#$03,d2
		lsl.w	#$03,d3
		lea	(VDPCopyBlockCmds).l,a1
		lsl.w	#$03,d4
		adda.w	d4,a1
		lea	(VDPCopyBlockCmds).l,a3
		lsl.w	#$03,d5
		adda.w	d5,a3
		movea.l	(g_ScreenBufferPtr).l,a0
		lea	(g_Blockset).l,a2
		move.w	(a1),(a0)+
		move.l	(a2,d2.w),(a0)+
		addq.w	#$04,a1
		move.w	$00000002(a3),(a0)+
		move.l	(a2,d3.w),(a0)+
		addq.w	#$06,a3
		move.w	(a1),(a0)+
		move.l	$00000004(a2,d2.w),(a0)+
		addq.w	#$04,a1
		move.w	(a3),(a0)+
		move.l	$00000004(a2,d3.w),(a0)+
		addq.w	#$04,a3
		move.l	a0,(g_ScreenBufferPtr).l
		addq.b	#$01,(byte_FF115A).l
		movem.l	(sp)+,d2-d5/a1-a3
		rts
; End of function sub_4C94


; =============== S U B	R O U T	I N E =======================================


sub_4CF4:					  ; CODE XREF: sub_4B14+4p
						  ; sub_4BA0:loc_4BB4p	...
		movem.w	d0-d1/d6-d7,-(sp)
		move.w	(g_BlockTableIndex).l,d5
		move.b	(g_PlayerXFlattened).l,d6
		move.b	(g_PlayerYFlattened).l,d7
		ext.w	d6
		ext.w	d7
		sub.w	d6,d0
		sub.w	d7,d1
		move.w	d0,d6
		move.w	d1,d7
		add.w	d6,d7
		addi.w	#$000C,d7
		cmpi.w	#$0018,d7
		bcc.w	loc_4DB2
		move.w	d0,d6
		move.w	d1,d7
		sub.w	d7,d6
		addi.w	#$000C,d6
		cmpi.w	#$0018,d6
		bcc.w	loc_4DB2
		tst.w	d0
		beq.s	loc_4D6C
		bpl.s	loc_4D58
		neg.w	d0
		subq.w	#$01,d0

loc_4D40:					  ; CODE XREF: sub_4CF4:loc_4D52j
		subq.w	#$01,d5
		move.w	d5,d6
		andi.w	#$001F,d6
		cmpi.w	#$001F,d6
		bne.s	loc_4D52
		addi.w	#$0020,d5

loc_4D52:					  ; CODE XREF: sub_4CF4+58j
		dbf	d0,loc_4D40
		bra.s	loc_4D6C
; ---------------------------------------------------------------------------

loc_4D58:					  ; CODE XREF: sub_4CF4+46j
		subq.w	#$01,d0

loc_4D5A:					  ; CODE XREF: sub_4CF4:loc_4D68j
		addq.w	#$01,d5
		move.w	d5,d6
		andi.w	#$001F,d6
		bne.s	loc_4D68
		subi.w	#$0020,d5

loc_4D68:					  ; CODE XREF: sub_4CF4+6Ej
		dbf	d0,loc_4D5A

loc_4D6C:					  ; CODE XREF: sub_4CF4+44j
						  ; sub_4CF4+62j
		tst.w	d1
		beq.s	loc_4DAA
		bpl.s	loc_4D90
		neg.w	d1
		subq.w	#$01,d1

loc_4D76:					  ; CODE XREF: sub_4CF4:loc_4D8Aj
		subi.w	#$0020,d5
		bpl.s	loc_4D8A
		addi.w	#$0210,d5
		cmpi.w	#$0200,d5
		bcs.s	loc_4D8A
		subi.w	#$0020,d5

loc_4D8A:					  ; CODE XREF: sub_4CF4+86j
						  ; sub_4CF4+90j
		dbf	d1,loc_4D76
		bra.s	loc_4DAA
; ---------------------------------------------------------------------------

loc_4D90:					  ; CODE XREF: sub_4CF4+7Cj
		subq.w	#$01,d1

loc_4D92:					  ; CODE XREF: sub_4CF4:loc_4DA6j
		addi.w	#$0020,d5
		cmpi.w	#$0200,d5
		bcs.s	loc_4DA6
		subi.w	#$0210,d5
		bpl.s	loc_4DA6
		addi.w	#$0020,d5

loc_4DA6:					  ; CODE XREF: sub_4CF4+A6j
						  ; sub_4CF4+ACj
		dbf	d1,loc_4D92

loc_4DAA:					  ; CODE XREF: sub_4CF4+7Aj
						  ; sub_4CF4+9Aj
		movem.w	(sp)+,d0-d1/d6-d7
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_4DB2:					  ; CODE XREF: sub_4CF4+2Cj
						  ; sub_4CF4+3Ej
		movem.w	(sp)+,d0-d1/d6-d7
		ori	#$01,ccr
		rts
; End of function sub_4CF4


; =============== S U B	R O U T	I N E =======================================


GetMapOffsets:					  ; CODE XREF: DoTileSwap+18p
						  ; MapTileSwap+2p ...
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		ext.w	d0
		ext.w	d1
		bsr.s	GetMapCoordOffset	  ; d0 = X
						  ; d1 = Y
		lea	(g_ForegroundBlocks).l,a1
		lea	(g_BackgroundBlocks).l,a2
		adda.w	d1,a1
		adda.w	d1,a2
		rts
; End of function GetMapOffsets


; =============== S U B	R O U T	I N E =======================================


GetHeightmapCoordOffset:			  ; CODE XREF: HMTileSwapp
						  ; HMTileSwap+6p
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		ext.w	d0
		ext.w	d1
		bsr.s	GetMapCoordOffset	  ; d0 = X
						  ; d1 = Y
		lea	(g_HeightMap).l,a1
		adda.w	d1,a1
		rts
; End of function GetHeightmapCoordOffset


; =============== S U B	R O U T	I N E =======================================

; d0 = X
; d1 = Y

GetMapCoordOffset:				  ; CODE XREF: GetMapOffsets+8p
						  ; GetHeightmapCoordOffset+8p
		bsr.w	MultiplyD1By148
		add.w	d0,d1
		add.w	d0,d1
		rts
; End of function GetMapCoordOffset

