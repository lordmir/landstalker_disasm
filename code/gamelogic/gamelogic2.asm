
; =============== S U B	R O U T	I N E =======================================


sub_2DCE:					  ; CODE XREF: LoadRoom_0+40p
		move.b	(g_PlayerXFlattened).l,d0
		ext.w	d0
		lsl.w	#$04,d0
		add.b	(word_FF1126).l,d0
		move.w	(Player_Z).l,d1
		sub.w	d1,d0
		move.w	d0,(word_FF1200).l
		move.w	d0,d2
		andi.b	#$0F,d0
		move.b	d0,(word_FF1126).l
		lsr.w	#$04,d2
		move.b	d2,(g_PlayerXFlattened).l
		move.b	(g_PlayerYFlattened).l,d0
		ext.w	d0
		lsl.w	#$04,d0
		add.b	(word_FF1126+1).l,d0
		sub.w	d1,d0
		move.w	d0,(word_FF1202).l
		move.w	d0,d2
		andi.b	#$0F,d0
		move.b	d0,(word_FF1126+1).l
		lsr.w	#$04,d2
		move.b	d2,(g_PlayerYFlattened).l
		rts
; End of function sub_2DCE

; ---------------------------------------------------------------------------

CheckForDebugButtons:				  ; CODE XREF: GameLoop+14p
		tst.w	(DebugModeEnable).w
		bmi.w	locret_2F24
		tst.b	(g_Flags+8).l
		beq.s	loc_2E4C

loc_2E3E:					  ; CODE XREF: ROM:00002E4Aj
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_DogTransform
; ---------------------------------------------------------------------------
		move.w	#00060,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames
		bra.s	loc_2E3E
; ---------------------------------------------------------------------------

loc_2E4C:					  ; CODE XREF: ROM:00002E3Cj
		tst.b	(g_Controller2State).l
		bpl.w	loc_2EB8
		bsr.w	FadeOutToDarkness

loc_2E5A:					  ; CODE XREF: ROM:00002E76j
		addq.w	#$01,(g_RmNum1).l	  ; Debug room warp
		move.w	(g_RmNum1).l,d0
		bsr.w	LoadRoomParams
		lea	(g_HeightMap).l,a0

loc_2E70:					  ; CODE XREF: ROM:00002E7Ej
		cmpa.l	#Stack,a0
		bcc.s	loc_2E5A		  ; Debug room warp
		move.w	(a0)+,d0
		andi.w	#$403F,d0
		bne.s	loc_2E70		  ; Find first occupiable tile in room
		move.l	a0,d0
		subq.w	#$02,d0
		subi.l	#g_HeightMap,d0
		divu.w	#$0094,d0
		move.b	d0,(Player_Y).l
		swap	d0
		lsr.b	#$01,d0
		move.b	d0,(Player_X).l
		move.b	#$08,(Player_SubX).l
		move.b	#$08,(Player_SubY).l
		clr.b	d0
		bsr.w	LoadRoom_0
		bra.w	sub_8E9C
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR CheckForDebugSaveGame

loc_2EB8:					  ; CODE XREF: ROM:00002E52j
						  ; CheckForDebugSaveGame+10j
		btst	#CTRL_B,(g_Controller2State).l
		beq.s	loc_2EF8

loc_2EC2:					  ; CODE XREF: CheckForDebugSaveGame-3Aj
		bsr.w	WaitUntilVBlank
		bsr.w	UpdateControllerInputs
		btst	#CTRL_B,(g_Controller2State).l
		bne.s	loc_2EC2

loc_2ED4:					  ; CODE XREF: CheckForDebugSaveGame-28j
		bsr.w	WaitUntilVBlank
		bsr.w	UpdateControllerInputs
		btst	#CTRL_B,(g_Controller2State).l
		beq.s	loc_2ED4

loc_2EE6:					  ; CODE XREF: CheckForDebugSaveGame-16j
		bsr.w	WaitUntilVBlank
		bsr.w	UpdateControllerInputs
		btst	#CTRL_B,(g_Controller2State).l
		bne.s	loc_2EE6

loc_2EF8:					  ; CODE XREF: CheckForDebugSaveGame-4Cj
		btst	#CTRL_UP,(g_Controller2State).l
; END OF FUNCTION CHUNK	FOR CheckForDebugSaveGame

; =============== S U B	R O U T	I N E =======================================


sub_2F00:
		beq.s	locret_2F0A
		jsr	(j_DebugGetAllItems).l
		rts
; ---------------------------------------------------------------------------

locret_2F0A:					  ; CODE XREF: sub_2F00j
		rts
; End of function sub_2F00


; =============== S U B	R O U T	I N E =======================================


CheckForDebugSaveGame:				  ; CODE XREF: GameLoop+18p

; FUNCTION CHUNK AT 00002EB8 SIZE 00000048 BYTES

		tst.w	(DebugModeEnable).w
		bmi.w	locret_2F24
		btst	#CTRL_A,(g_Controller2State).l
		beq.w	loc_2EB8
		bsr.w	SaveGame

locret_2F24:					  ; CODE XREF: ROM:00002E32j
						  ; CheckForDebugSaveGame+4j
		rts
; End of function CheckForDebugSaveGame


; =============== S U B	R O U T	I N E =======================================


LoadGameSelectScreen:				  ; CODE XREF: LoadGame+8p
		bsr.s	CheckRAM
		move.b	(g_SaveSlot).l,d0
		jsr	(InitGameSelectScreen).l
		jsr	(j_SetUpTextDisplay).l
		rts
; End of function LoadGameSelectScreen


; =============== S U B	R O U T	I N E =======================================


CheckRAM:					  ; CODE XREF: LoadGameSelectScreenp
		lea	(RAM_Start).l,a0
		lea	aKanMakiko(pc),a1	  ; "Kan&Makiko"
		moveq	#$00000009,d7

loc_2F48:					  ; CODE XREF: CheckRAM+10j
		cmpm.b	(a1)+,(a0)+
		bne.s	loc_2F52
		dbf	d7,loc_2F48
		rts
; ---------------------------------------------------------------------------

loc_2F52:					  ; CODE XREF: CheckRAM+Ej
		lea	(RAM_Start).l,a0
		lea	aKanMakiko(pc),a1	  ; "Kan&Makiko"
		moveq	#$00000009,d7

loc_2F5E:					  ; CODE XREF: CheckRAM+24j
		move.b	(a1)+,(a0)+
		dbf	d7,loc_2F5E
		clr.b	(g_SaveSlot).l
		rts
; End of function CheckRAM

; ---------------------------------------------------------------------------
aKanMakiko:	dc.b 'Kan&Makiko'                 ; DATA XREF: CheckRAM+6t
						  ; CheckRAM+1Ct

; =============== S U B	R O U T	I N E =======================================


CollisionDetect:				  ; CODE XREF: j_CollisionDetectj
						  ; HandleDirectionalControl+222p ...
		lea	(Player_X).l,a0
		move.w	HitBoxXStart(a0,d0.w),d1  ; Bounding box X start
		move.w	HitBoxXEnd(a0,d0.w),d2	  ; Bounding Box X end
		move.w	HitBoxYStart(a0,d0.w),d3  ; Bounding box Y start
		move.w	HitBoxYEnd(a0,d0.w),d4	  ; Bounding box Y end
		move.w	Z(a0,d0.w),d6		  ; Bounding box Z start
		move.w	HitBoxZEnd(a0,d0.w),d5	  ; Bounding  box Z end
		clr.w	d7
		movea.l	a0,a1

loc_2F98:					  ; CODE XREF: CollisionDetect+6Ej
		cmp.w	d7,d0
		beq.s	loc_2FD8
		tst.w	X(a0)
		bmi.s	loc_2FE6		  ; End	of sprites
		cmp.w	HitBoxXEnd(a0),d1
		bhi.s	loc_2FD8
		cmp.w	HitBoxXStart(a0),d2
		bcs.s	loc_2FD8
		cmp.w	HitBoxYEnd(a0),d3
		bhi.s	loc_2FD8
		cmp.w	HitBoxYStart(a0),d4
		bcs.s	loc_2FD8
		cmp.w	HitBoxZEnd(a0),d6
		bhi.s	loc_2FD8
		cmp.w	Z(a0),d5
		bcs.s	loc_2FD8
		movea.l	a0,a1
		tst.b	Flags1(a0)
		bne.s	loc_2FD8
		cmp.w	SpriteUnderneath(a0),d0
		beq.s	loc_2FD8
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_2FD8:					  ; CODE XREF: CollisionDetect+24j
						  ; CollisionDetect+2Ej ...
		lea	SPRITE_SIZE(a0),a0
		addi.w	#SPRITE_SIZE,d7
		cmpi.w	#$0800,d7
		bcs.s	loc_2F98

loc_2FE6:					  ; CODE XREF: CollisionDetect+28j
		tst.b	d0
		rts
; End of function CollisionDetect


; =============== S U B	R O U T	I N E =======================================


CheckForCollision:				  ; CODE XREF: j_CheckForCollisionj
						  ; HandleDirectionalInput+Ap ...
		lea	(Player_X).l,a0
		move.w	HitBoxXStart(a0,d0.w),d1
		move.w	HitBoxXEnd(a0,d0.w),d2
		move.w	HitBoxYStart(a0,d0.w),d3
		move.w	HitBoxYEnd(a0,d0.w),d4
		move.w	Z(a0,d0.w),d6
		move.w	HitBoxZEnd(a0,d0.w),d5
		clr.w	d7
		movea.l	a0,a1

loc_300C:					  ; CODE XREF: CheckForCollision+68j
		cmp.w	d7,d0
		beq.s	loc_3046
		tst.w	(a0)
		bmi.s	loc_3054
		cmp.w	HitBoxXEnd(a0),d1
		bhi.s	loc_3046
		cmp.w	HitBoxXStart(a0),d2
		bcs.s	loc_3046
		cmp.w	HitBoxYEnd(a0),d3
		bhi.s	loc_3046
		cmp.w	HitBoxYStart(a0),d4
		bcs.s	loc_3046
		cmp.w	HitBoxZEnd(a0),d6
		bhi.s	loc_3046
		cmp.w	Z(a0),d5
		bcs.s	loc_3046
		movea.l	a0,a1
		tst.b	Flags1(a0)
		bne.s	loc_3046
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_3046:					  ; CODE XREF: CheckForCollision+24j
						  ; CheckForCollision+2Ej ...
		lea	SPRITE_SIZE(a0),a0
		addi.w	#SPRITE_SIZE,d7
		cmpi.w	#$0800,d7
		bcs.s	loc_300C

loc_3054:					  ; CODE XREF: CheckForCollision+28j
		tst.b	d0
		rts
; End of function CheckForCollision


; =============== S U B	R O U T	I N E =======================================


sub_3058:					  ; CODE XREF: HandleDirectionalControl:loc_1B48p
						  ; HandleDirectionalControl:loc_1CE0p	...
		lea	(Player_X).l,a0
		move.w	Player_HitBoxXStart-Player_X(a0),d1
		move.w	HitBoxXEnd(a0),d2
		move.w	HitBoxYStart(a0),d3
		move.w	HitBoxYEnd(a0),d4
		move.w	Z(a0),d6
		move.w	HitBoxZEnd(a0),d5
		move.w	#SPRITE_SIZE,d7
		movea.l	a0,a1
		lea	SPRITE_SIZE(a0),a0

loc_3080:					  ; CODE XREF: sub_3058+7Ej
		tst.w	(a0)
		bmi.s	loc_30D8
		tst.b	Flags2(a0)
		bmi.s	loc_30BC

loc_308A:					  ; CODE XREF: sub_3058+70j
		cmp.w	HitBoxXEnd(a0),d1
		bhi.s	loc_30CA
		cmp.w	HitBoxXStart(a0),d2
		bcs.s	loc_30CA
		cmp.w	HitBoxYEnd(a0),d3
		bhi.s	loc_30CA
		cmp.w	HitBoxYStart(a0),d4
		bcs.s	loc_30CA
		cmp.w	HitBoxZEnd(a0),d6
		bhi.s	loc_30CA
		cmp.w	Z(a0),d5
		bcs.s	loc_30CA
		movea.l	a0,a1
		tst.b	Flags1(a0)
		bne.s	loc_30CA
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_30BC:					  ; CODE XREF: sub_3058+30j
		cmpi.w	#$0001,InitFlags4_DropProbability(a0)
		bne.s	loc_30CA
		tst.b	GoldOrChestContents(a0)
		beq.s	loc_308A

loc_30CA:					  ; CODE XREF: sub_3058+36j
						  ; sub_3058+3Cj ...
		lea	SPRITE_SIZE(a0),a0
		addi.w	#SPRITE_SIZE,d7
		cmpi.w	#$0800,d7
		bcs.s	loc_3080

loc_30D8:					  ; CODE XREF: sub_3058+2Aj
		tst.b	d0
		rts
; End of function sub_3058


; =============== S U B	R O U T	I N E =======================================


sub_30DC:					  ; CODE XREF: HandleDirectionalControl+4F6p
		move.w	(Player_HitBoxYEnd).l,d2
		bra.s	loc_30EA
; End of function sub_30DC


; =============== S U B	R O U T	I N E =======================================


sub_30E4:					  ; CODE XREF: HandleDirectionalControl+146p
		move.w	(Player_HitBoxYStart).l,d2

loc_30EA:					  ; CODE XREF: sub_30DC+6j
		move.w	(Player_HitBoxXStart).l,d1
		move.w	(Player_HitBoxXEnd).l,d4
		lsr.w	#$03,d1
		lsr.w	#$03,d4
		andi.b	#$FE,d1
		andi.b	#$FE,d4
		move.w	(Player_Z).l,d3
		lsr.w	#$04,d3
		lea	(g_HeightMap).l,a6
		lsr.w	#$04,d2
		jsr	(MultiplyD2By148).l
		adda.w	d2,a6
		adda.w	d1,a6
		move.b	#$4F,d2
		move.b	(a6),d0
		and.b	d2,d0
		move.b	$00000001(a6),d5
		sub.w	d1,d4
		beq.s	loc_312E
		addq.w	#$02,a6

loc_312E:					  ; CODE XREF: sub_30E4+46j
		move.b	(a6),d1
		and.b	d2,d1
		cmp.b	d0,d3
		bcs.s	locret_313C
		move.b	$00000001(a6),d5
		cmp.b	d1,d3

locret_313C:					  ; CODE XREF: sub_30E4+50j
		rts
; End of function sub_30E4


; =============== S U B	R O U T	I N E =======================================


sub_313E:					  ; CODE XREF: HandleDirectionalControl+67Ap
		move.w	(Player_HitBoxXStart).l,d2
		bra.s	loc_314C
; End of function sub_313E


; =============== S U B	R O U T	I N E =======================================


sub_3146:					  ; CODE XREF: HandleDirectionalControl+360p
		move.w	(Player_HitBoxXEnd).l,d2

loc_314C:					  ; CODE XREF: sub_313E+6j
		move.w	(Player_HitBoxYStart).l,d1
		move.w	(Player_HitBoxYEnd).l,d4
		lsr.w	#$04,d1
		lsr.w	#$04,d4
		sub.w	d1,d4
		move.w	(Player_Z).l,d3
		lsr.w	#$04,d3
		lea	(g_HeightMap).l,a6
		jsr	(MultiplyD1By148).l
		adda.w	d1,a6
		lsr.w	#$03,d2
		andi.b	#$FE,d2
		adda.w	d2,a6
		move.b	#$4F,d2
		move.b	(a6),d0
		and.b	d2,d0
		move.b	$00000001(a6),d5
		tst.w	d4
		beq.s	loc_3190
		lea	$00000094(a6),a6

loc_3190:					  ; CODE XREF: sub_3146+44j
		move.b	(a6),d1
		and.b	d2,d1
		cmp.b	d0,d3
		bcs.s	locret_319E
		move.b	$00000001(a6),d5
		cmp.b	d1,d3

locret_319E:					  ; CODE XREF: sub_3146+50j
		rts
; End of function sub_3146


; =============== S U B	R O U T	I N E =======================================


sub_31A0:					  ; CODE XREF: sub_38Cj
		move.w	HitBoxYEnd(a5),d2
		bra.s	loc_31AA
; End of function sub_31A0


; =============== S U B	R O U T	I N E =======================================


sub_31A6:					  ; CODE XREF: sub_380j
		move.w	HitBoxYStart(a5),d2

loc_31AA:					  ; CODE XREF: sub_31A0+4j
		btst	#$04,GroundHeight(a0)
		bne.s	loc_31F4
		move.w	HitBoxXStart(a5),d1
		move.w	HitBoxXEnd(a5),d4
		lsr.w	#$03,d1
		lsr.w	#$03,d4
		andi.b	#$FE,d1
		andi.b	#$FE,d4
		sub.w	d1,d4
		lsr.w	#$01,d4
		move.w	Z(a5),d3
		lsr.w	#$04,d3
		lea	(g_HeightMap).l,a6
		lsr.w	#$04,d2
		jsr	(MultiplyD2By148).l
		adda.w	d2,a6
		adda.w	d1,a6
		move.b	#$6F,d1

loc_31E6:					  ; CODE XREF: sub_31A6+4Aj
		move.b	(a6),d0
		and.b	d1,d0
		cmp.b	d0,d3
		bcs.s	locret_31F6
		addq.w	#$02,a6
		dbf	d4,loc_31E6

loc_31F4:					  ; CODE XREF: sub_31A6+Aj
						  ; sub_31FE+Aj
		tst.b	d0

locret_31F6:					  ; CODE XREF: sub_31A6+46j
		rts
; End of function sub_31A6


; =============== S U B	R O U T	I N E =======================================


sub_31F8:					  ; CODE XREF: sub_392j
		move.w	HitBoxXStart(a5),d2
		bra.s	loc_3202
; End of function sub_31F8


; =============== S U B	R O U T	I N E =======================================


sub_31FE:					  ; CODE XREF: sub_386j
		move.w	HitBoxXEnd(a5),d2

loc_3202:					  ; CODE XREF: sub_31F8+4j
		btst	#$04,GroundHeight(a0)
		bne.s	loc_31F4
		move.w	HitBoxYStart(a5),d1
		move.w	HitBoxYEnd(a5),d4
		lsr.w	#$04,d1
		lsr.w	#$04,d4
		sub.w	d1,d4
		move.w	Z(a5),d3
		lsr.w	#$04,d3
		lea	(g_HeightMap).l,a6
		jsr	(MultiplyD1By148).l
		adda.w	d1,a6
		lsr.w	#$03,d2
		andi.b	#$FE,d2
		adda.w	d2,a6
		move.b	#$6F,d1

loc_3238:					  ; CODE XREF: sub_31FE+46j
		move.b	(a6),d0
		and.b	d1,d0
		cmp.b	d0,d3
		bcs.s	locret_324A
		lea	$00000094(a6),a6
		dbf	d4,loc_3238
		tst.b	d0

locret_324A:					  ; CODE XREF: sub_31FE+40j
		rts
; End of function sub_31FE


; =============== S U B	R O U T	I N E =======================================


sub_324C:					  ; CODE XREF: sub_21AEp
		lea	(Player_X).l,a0
; End of function sub_324C


; =============== S U B	R O U T	I N E =======================================


sub_3252:					  ; CODE XREF: sub_2232p
		move.w	Z(a0),d6
		bsr.s	TestForFalling
		sub.w	Z(a0),d6
		beq.s	locret_3264
		bset	#$04,Action1(a0)

locret_3264:					  ; CODE XREF: sub_3252+Aj
		rts
; End of function sub_3252


; =============== S U B	R O U T	I N E =======================================


TestForFalling:					  ; CODE XREF: sub_3252+4p
		move.b	(g_RoomMinHeight).l,d4
		andi.w	#$00FF,d4
		cmp.w	Z(a0),d4
		beq.s	locret_32B2
		move.b	FallRate(a0),d0
		bmi.s	locret_32B2
		andi.b	#$1F,d0
		ext.w	d0
		cmpi.b	#$10,d0
		bls.s	loc_328C
		move.b	#$10,d0

loc_328C:					  ; CODE XREF: TestForFalling+20j
		andi.b	#$E0,FallRate(a0)
		clr.w	d2
		move.b	FallAcceleration(pc,d0.w),d2
		addq.b	#$01,d0
		bsr.s	sub_32C6
		cmp.w	d2,d5
		bhi.s	loc_32A6
		clr.b	d0
		move.w	d5,d2
		beq.s	loc_32AE

loc_32A6:					  ; CODE XREF: TestForFalling+38j
		sub.w	d2,Z(a0)
		sub.w	d2,HitBoxZEnd(a0)

loc_32AE:					  ; CODE XREF: TestForFalling+3Ej
		or.b	d0,FallRate(a0)

locret_32B2:					  ; CODE XREF: TestForFalling+Ej
						  ; TestForFalling+14j
		rts
; End of function TestForFalling

; ---------------------------------------------------------------------------
FallAcceleration:dc.b $01, $01,	$01, $02, $02, $02, $02, $03
		dc.b $03, $03, $04, $04, $04, $05, $06,	$07
		dc.b $08, $FF

; =============== S U B	R O U T	I N E =======================================


sub_32C6:					  ; CODE XREF: sub_1858+52p
						  ; TestForFalling+34p
		movem.w	d0/d2/d6-d7,-(sp)
		clr.w	d4
		move.b	FloorHeight(a0),d4
		move.b	Unk6D(a0),d7
		andi.b	#$0F,d7
		beq.s	loc_32E4
		move.w	Z(a0),d7
		bsr.s	sub_3302
		move.b	d4,FloorHeight(a0)

loc_32E4:					  ; CODE XREF: sub_32C6+12j
		movem.w	d4,-(sp)
		bsr.w	sub_338C
		movem.w	(sp)+,d4
		cmp.w	d5,d4
		bcc.s	loc_32F6
		move.w	d5,d4

loc_32F6:					  ; CODE XREF: sub_32C6+2Cj
		move.w	Z(a0),d5
		sub.w	d4,d5
		movem.w	(sp)+,d0/d2/d6-d7
		rts
; End of function sub_32C6


; =============== S U B	R O U T	I N E =======================================


sub_3302:					  ; CODE XREF: sub_3C8j
						  ; sub_2896+26p ...
		clr.b	d0
		btst	#$04,GroundHeight(a0)	  ; 0x10 - Raft	track
		bne.s	loc_331C
		move.b	#$40,d0			  ; 0x40 - out of bounds to all
		cmpa.l	#Player_X,a0
		beq.s	loc_331C
		move.b	#$60,d0			  ; 0x60 = 0x40	| 0x20
						  ; 0x20 = Out of bounds to NPC	only

loc_331C:					  ; CODE XREF: sub_3302+8j
						  ; sub_3302+14j
		clr.w	d4
		move.w	HitBoxXStart(a0),d1
		move.w	HitBoxYStart(a0),d2
		move.w	HitBoxYEnd(a0),d6
		move.w	d2,d5
		lsr.w	#$04,d5
		lsr.w	#$04,d6
		sub.w	d5,d6
		lsr.w	#$04,d2
		jsr	(MultiplyD2By148).l
		lea	(g_HeightMap).l,a6
		adda.w	d2,a6
		move.w	d1,d3
		lsr.w	#$03,d1
		andi.b	#$FE,d1
		adda.w	d1,a6
		move.w	HitBoxXEnd(a0),d5
		lsr.w	#$04,d3
		lsr.w	#$04,d5
		sub.w	d3,d5
		clr.b	d1

loc_3358:					  ; CODE XREF: sub_3302+84j
		movem.l	d5/a6,-(sp)

loc_335C:					  ; CODE XREF: sub_3302+78j
		move.b	(a6),d3
		move.b	d3,d2
		and.b	d0,d2
		beq.s	loc_3368
		move.b	#$01,d1

loc_3368:					  ; CODE XREF: sub_3302+60j
		andi.w	#$000F,d3
		lsl.b	#$04,d3
		cmp.w	d4,d3
		bls.s	loc_3378
		cmp.w	d7,d3
		bhi.s	loc_3378
		move.w	d3,d4

loc_3378:					  ; CODE XREF: sub_3302+6Ej
						  ; sub_3302+72j
		addq.w	#$02,a6
		dbf	d5,loc_335C
		movem.l	(sp)+,d5/a6
		lea	$00000094(a6),a6
		dbf	d6,loc_3358
		rts
; End of function sub_3302


; =============== S U B	R O U T	I N E =======================================


sub_338C:					  ; CODE XREF: sub_32C6+22p
		move.w	HitBoxXStart(a0),d1
		move.w	HitBoxXEnd(a0),d2
		move.w	HitBoxYStart(a0),d3
		move.w	HitBoxYEnd(a0),d4
		move.w	Z(a0),d6
		clr.w	d5
		lea	(Player_X).l,a1
		moveq	#$0000000F,d7

loc_33AA:					  ; CODE XREF: sub_338C+58j
		cmpa.l	a0,a1
		beq.s	loc_33DE
		cmp.w	HitBoxXEnd(a1),d1
		bhi.s	loc_33DE
		cmp.w	HitBoxXStart(a1),d2
		bcs.s	loc_33DE
		cmp.w	HitBoxYEnd(a1),d3
		bhi.s	loc_33DE
		cmp.w	HitBoxYStart(a1),d4
		bcs.s	loc_33DE
		cmp.w	HitBoxZEnd(a1),d6
		bls.s	loc_33DE
		cmp.w	HitBoxZEnd(a1),d5
		bhi.s	loc_33DE
		tst.b	Flags1(a1)
		bne.s	loc_33DE
		move.w	HitBoxZEnd(a1),d5
		addq.w	#$01,d5

loc_33DE:					  ; CODE XREF: sub_338C+20j
						  ; sub_338C+26j ...
		lea	SPRITE_SIZE(a1),a1
		tst.b	(a1)
		dbmi	d7,loc_33AA
		rts
; End of function sub_338C


; =============== S U B	R O U T	I N E =======================================


sub_33EA:					  ; CODE XREF: HandleDirectionalControl+184p
						  ; HandleDirectionalControl+6A4p ...
		move.w	HitBoxXStart(a5),d1
		move.w	HitBoxXEnd(a5),d2
		move.w	HitBoxYStart(a5),d3
		move.w	HitBoxYEnd(a5),d4
		move.w	HitBoxZEnd(a5),d6
		move.w	#$FFFF,d5
		lea	(Player_X).l,a1
		moveq	#$0000000F,d7

loc_340A:					  ; CODE XREF: sub_33EA+60j
		cmpa.l	a5,a1
		beq.s	loc_3444
		btst	#$06,Flags1(a1)
		bne.s	loc_3444
		cmp.w	HitBoxXEnd(a1),d1
		bhi.s	loc_3444
		cmp.w	HitBoxXStart(a1),d2
		bcs.s	loc_3444
		cmp.w	HitBoxYEnd(a1),d3
		bhi.s	loc_3444
		cmp.w	HitBoxYStart(a1),d4
		bcs.s	loc_3444
		cmp.w	Z(a1),d6
		bcc.s	loc_3444
		cmp.w	Z(a1),d5
		bls.s	loc_3444
		tst.b	Flags1(a1)
		bne.s	loc_3444
		move.w	Z(a1),d5

loc_3444:					  ; CODE XREF: sub_33EA+22j
						  ; sub_33EA+2Aj ...
		lea	SPRITE_SIZE(a1),a1
		tst.b	(a1)
		dbmi	d7,loc_340A
		subq.b	#$01,d5
		sub.w	HitBoxZEnd(a5),d5
		rts
; End of function sub_33EA


; =============== S U B	R O U T	I N E =======================================


sub_3456:					  ; CODE XREF: sub_3BCj
						  ; ProcessActionButton+18Cp ...
		movem.l	a5,-(sp)
		move.l	a5,d0
		subi.l	#Player_X,d0
		bsr.w	CheckForCollision
		bcs.s	loc_3482
		movem.l	(sp)+,a0
		move.b	($000000FF).w,d7
		bsr.w	sub_3302
		tst.b	d1
		bne.s	loc_348C
		cmp.w	Z(a0),d4
		bhi.s	loc_348C
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_3482:					  ; CODE XREF: sub_3456+10j
		movem.l	(sp)+,a5
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_348C:					  ; CODE XREF: sub_3456+20j
						  ; sub_3456+26j
		movea.l	#$00000000,a1
		ori	#$01,ccr
		rts
; End of function sub_3456


; =============== S U B	R O U T	I N E =======================================


sub_3498:					  ; CODE XREF: sub_24F4+Cp
		lea	(Player_X).l,a0
		move.w	Z(a5),d0
		subq.w	#$01,d0
		clr.w	(word_FF1800).l
		clr.l	(dword_FF1804).l
		moveq	#$0000000F,d7

loc_34B2:					  ; CODE XREF: sub_3498+9Ej
		cmp.w	HitBoxZEnd(a0),d0
		bne.s	loc_3530
		move.w	HitBoxXStart(a5),d1
		move.w	HitBoxXEnd(a5),d2
		move.w	HitBoxYStart(a5),d3
		move.w	HitBoxYEnd(a5),d4
		cmp.w	HitBoxXEnd(a0),d1
		bhi.s	loc_3530
		cmp.w	HitBoxXStart(a0),d2
		bcs.s	loc_3530
		cmp.w	HitBoxYEnd(a0),d3
		bhi.s	loc_3530
		cmp.w	HitBoxYStart(a0),d4
		bcs.s	loc_3530
		move.w	HitBoxXEnd(a0),d5
		sub.w	d1,d5
		move.w	d2,d6
		sub.w	HitBoxXStart(a0),d6
		cmp.w	d5,d6
		bcc.s	loc_34F2
		move.w	d6,d5

loc_34F2:					  ; CODE XREF: sub_3498+56j
		move.w	HitBoxYEnd(a0),d6
		sub.w	d3,d6
		sub.w	HitBoxYStart(a0),d4
		cmp.w	d6,d4
		bcc.s	loc_3502
		move.w	d4,d6

loc_3502:					  ; CODE XREF: sub_3498+66j
		move.b	RotationAndSize(a5),d4
		andi.b	#$3E,d4
		cmp.b	d4,d5
		bcs.s	loc_3516
		cmp.b	d4,d6
		bcs.s	loc_3516
		move.l	a0,d0
		bra.s	loc_3542
; ---------------------------------------------------------------------------

loc_3516:					  ; CODE XREF: sub_3498+74j
						  ; sub_3498+78j
		move.w	HitBoxYEnd(a5),d4
		add.w	d5,d6
		cmp.w	(word_FF1800).l,d6
		bls.s	loc_3530
		move.w	d6,(word_FF1800).l
		move.l	a0,(dword_FF1804).l

loc_3530:					  ; CODE XREF: sub_3498+1Ej
						  ; sub_3498+34j ...
		lea	SPRITE_SIZE(a0),a0
		tst.b	(a0)
		dbmi	d7,loc_34B2
		move.l	(dword_FF1804).l,d0
		beq.s	loc_354A

loc_3542:					  ; CODE XREF: sub_3498+7Cj
		subi.l	#Player_X,d0
		rts
; ---------------------------------------------------------------------------

loc_354A:					  ; CODE XREF: sub_3498+A8j
		moveq	#$FFFFFFFF,d0
		rts
; End of function sub_3498

