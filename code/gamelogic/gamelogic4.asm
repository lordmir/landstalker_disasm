
; =============== S U B	R O U T	I N E =======================================


ProcessFloorType:				  ; CODE XREF: GameLoopp
		move.b	(Player_GroundType).l,d0
		andi.w	#$003F,d0
		lsl.b	#$02,d0
		jmp	sub_604C(pc,d0.w)
; End of function ProcessFloorType


; =============== S U B	R O U T	I N E =======================================


sub_604C:
		bra.w	locret_6108		  ; Normal
; ---------------------------------------------------------------------------
		bra.w	HandleFloorDoorNE	  ; Door NE
; ---------------------------------------------------------------------------
		bra.w	HandleFloorDoorSE	  ; Door SE
; ---------------------------------------------------------------------------
		bra.w	HandleFloorDoorSW	  ; Door SW
; ---------------------------------------------------------------------------
		bra.w	HandleFloorDoorNW	  ; Door NW
; ---------------------------------------------------------------------------
		bra.w	HandleFloorStairs	  ; Stairs
; ---------------------------------------------------------------------------
		bra.w	HandleFloorDoor		  ; Door
; ---------------------------------------------------------------------------
		bra.w	HandleFloorPit		  ; Pit
; ---------------------------------------------------------------------------
		bra.w	HandleFloorWarpPad	  ; Warp Pad
; ---------------------------------------------------------------------------
		bra.w	loc_6290
; ---------------------------------------------------------------------------
		bra.w	locret_6108
; ---------------------------------------------------------------------------
		bra.w	HandleFloorLadder	  ; Ladder NW
; ---------------------------------------------------------------------------
		bra.w	HandleFloorLadder	  ; Ladder NE
; ---------------------------------------------------------------------------
		bra.w	loc_629C
; ---------------------------------------------------------------------------
		bra.w	locret_6108		  ; Counter
; ---------------------------------------------------------------------------
		bra.w	HandleFloorElevator	  ; Elevator
; ---------------------------------------------------------------------------
		bra.w	HandleFloorSpikes	  ; Spikes
; ---------------------------------------------------------------------------
		bra.w	locret_6108		  ; Sign NW #1
; ---------------------------------------------------------------------------
		bra.w	locret_6108		  ; Sign NW #2
; ---------------------------------------------------------------------------
		bra.w	locret_6108		  ; Sign NW #3
; ---------------------------------------------------------------------------
		bra.w	locret_6108		  ; Sign NW #4
; ---------------------------------------------------------------------------
		bra.w	locret_6108		  ; Sign NE #1
; ---------------------------------------------------------------------------
		bra.w	locret_6108		  ; Sign NE #2
; ---------------------------------------------------------------------------
		bra.w	locret_6108		  ; Sign NE #3
; ---------------------------------------------------------------------------
		bra.w	locret_6108		  ; Sign NE #4
; ---------------------------------------------------------------------------
		bra.w	HandleFloorSwamp	  ; Swamp
; ---------------------------------------------------------------------------
		bra.w	locret_6108		  ; Locked Door
; ---------------------------------------------------------------------------
		bra.w	locret_6108
; ---------------------------------------------------------------------------
		bra.w	locret_6108
; ---------------------------------------------------------------------------
		bra.w	locret_6108
; ---------------------------------------------------------------------------
		bra.w	locret_6108
; ---------------------------------------------------------------------------
		bra.w	locret_6108
; ---------------------------------------------------------------------------
		bra.w	locret_6108
; ---------------------------------------------------------------------------
		bra.w	locret_6108
; ---------------------------------------------------------------------------
		bra.w	locret_6108		  ; Sign NE #5
; ---------------------------------------------------------------------------
		bra.w	locret_6108		  ; Sign NE #6
; ---------------------------------------------------------------------------
		bra.w	locret_6108		  ; Sign NE #7
; ---------------------------------------------------------------------------
		bra.w	locret_6108		  ; Sign NE #8
; ---------------------------------------------------------------------------
		bra.w	HandleFloorDoorSE	  ; Locked Door	SE
; ---------------------------------------------------------------------------
		bra.w	HandleFloorDoorSW	  ; Locked Door	SW
; ---------------------------------------------------------------------------
		bra.w	HandleNoleStaircase	  ; Nole Staircase
; ---------------------------------------------------------------------------
		bra.w	HandleLava		  ; Lava
; ---------------------------------------------------------------------------
		bra.w	HandleIceNE		  ; Ice	NE
; ---------------------------------------------------------------------------
		bra.w	HandleIceSE		  ; Ice	SE
; ---------------------------------------------------------------------------
		bra.w	HandleIceSW		  ; Ice	SW
; ---------------------------------------------------------------------------
		bra.w	HandleIceNW		  ; Ice	NW
; ---------------------------------------------------------------------------
		bra.w	HandleGoddessStatue	  ; Goddess Statue
; ---------------------------------------------------------------------------

locret_6108:					  ; CODE XREF: sub_604Cj
						  ; sub_604C+28j ...
		rts
; ---------------------------------------------------------------------------

HandleFloorDoorNE:				  ; CODE XREF: sub_604C+4j
		cmpi.b	#$07,(Player_SubY).l
		bcc.w	locret_6108
		bsr.w	CheckForDoorNE
		bcc.s	loc_6124
		move.w	#$0006,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames

loc_6124:					  ; CODE XREF: sub_604C+CEj
		cmpi.w	#$00FE,(g_ControllerPlayback).l
		beq.w	loc_61EC
		move.b	#$02,d0
		jsr	(j_PlaybackInput).l
		bra.w	loc_61EC
; ---------------------------------------------------------------------------

HandleFloorDoorSE:				  ; CODE XREF: sub_604C+8j
						  ; sub_604C+98j
		cmpi.b	#$09,(Player_SubX).l
		bls.w	locret_6182
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		cmpi.b	#$40,d0
		bne.w	locret_6182
		move.w	(Player_GroundHeight).l,(word_FF1208).l
		cmpi.w	#$00FE,(g_ControllerPlayback).l
		beq.s	locret_6182
		move.b	#$00,d0
		jsr	(j_PlaybackInput).l
		bset	#$07,(g_PlayerStatus).l

locret_6182:					  ; CODE XREF: sub_604C+FAj
						  ; sub_604C+10Cj ...
		rts
; ---------------------------------------------------------------------------

HandleFloorDoorSW:				  ; CODE XREF: sub_604C+Cj
						  ; sub_604C+9Cj
		cmpi.b	#$09,(Player_SubY).l
		bls.w	locret_61C8
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		cmpi.b	#$80,d0
		bne.w	locret_61C8
		cmpi.w	#$00FE,(g_ControllerPlayback).l
		beq.s	loc_61B6
		move.b	#$03,d0
		jsr	(j_PlaybackInput).l

loc_61B6:					  ; CODE XREF: sub_604C+15Ej
		move.w	(Player_GroundHeight).l,(word_FF1208).l
		bset	#$07,(g_PlayerStatus).l

locret_61C8:					  ; CODE XREF: sub_604C+140j
						  ; sub_604C+152j
		rts
; ---------------------------------------------------------------------------

HandleFloorDoorNW:				  ; CODE XREF: sub_604C+10j
		cmpi.b	#$07,(Player_SubX).l
		bcc.s	locret_6208
		bsr.w	CheckForDoorNW
		bcc.s	loc_61E2
		move.w	#$0006,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames

loc_61E2:					  ; CODE XREF: sub_604C+18Cj
		move.b	#$01,d0
		jsr	(j_PlaybackInput).l
; End of function sub_604C

; START	OF FUNCTION CHUNK FOR sub_620A

loc_61EC:					  ; CODE XREF: sub_604C+E0j
						  ; sub_604C+EEj ...
		move.w	(Player_GroundHeight).l,(word_FF1208).l
		bset	#$07,(g_PlayerStatus).l
		bsr.w	sub_9BFE
		bsr.s	sub_620A
		bsr.w	sub_9BD0

locret_6208:					  ; CODE XREF: sub_604C+186j
						  ; sub_620A+40j ...
		rts
; END OF FUNCTION CHUNK	FOR sub_620A

; =============== S U B	R O U T	I N E =======================================


sub_620A:					  ; CODE XREF: sub_620A-8p
						  ; sub_620A+4Aj ...

; FUNCTION CHUNK AT 000061EC SIZE 0000001E BYTES

		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Door
; ---------------------------------------------------------------------------

WarpToRoom:					  ; CODE XREF: j_WarpToRoomj
						  ; sub_620A+3Aj ...
		bsr.w	FadeOutToDarkness

loc_6212:					  ; CODE XREF: sub_42Ej
		bsr.w	sub_A0C2
		clr.b	d0
		bsr.w	LoadRoom_0
		bsr.w	sub_8E9C
		bra.w	CheckBell
; ---------------------------------------------------------------------------

TransitionToNewRoom:				  ; CODE XREF: j_TransitionToNewRoomj
		move.b	#$FF,(g_PriBlockset).l
		move.b	#$FF,(g_SecBlockset).l
		move.b	#$FF,(g_CurrentTileset).l
		move.b	#$FF,(g_CurPalIdx).l
		bra.s	WarpToRoom
; ---------------------------------------------------------------------------

HandleFloorStairs:				  ; CODE XREF: sub_604C+14j
		bsr.w	loc_667C
		bcc.s	locret_6208
		cmpi.w	#$0295,(g_RmNum1).l	  ; Wholesaler
		bne.s	sub_620A
		jsr	(sub_22EA8).l
		bra.s	sub_620A
; ---------------------------------------------------------------------------

loc_625E:					  ; CODE XREF: sub_620A+76j
		move.b	(word_FF1208+1).l,d1
		andi.b	#$3F,d1
		cmpi.b	#$06,d1
		beq.s	locret_62C4
		cmpi.b	#$01,d1
		beq.s	locret_62C4
		bra.w	loc_61EC
; ---------------------------------------------------------------------------

HandleFloorDoor:				  ; CODE XREF: sub_604C+18j
		cmpi.w	#$00FE,(g_ControllerPlayback).l
		beq.s	loc_625E
		cmpi.b	#CTRLBF_DOWN,(g_ControllerPlaybackTimer).l
		bne.w	locret_6208
		bra.s	loc_62A6
; ---------------------------------------------------------------------------

loc_6290:					  ; CODE XREF: sub_604C+24j
		cmpi.b	#$08,(Player_SubX).l
		bcc.s	locret_62C4
		bra.s	loc_62A6
; ---------------------------------------------------------------------------

loc_629C:					  ; CODE XREF: sub_604C+34j
		cmpi.b	#$08,(Player_SubY).l
		bcc.s	locret_62C4

loc_62A6:					  ; CODE XREF: sub_620A+84j
						  ; sub_620A+90j
		move.b	(word_FF1208+1).l,d1
		andi.b	#$3F,d1
		cmpi.b	#FLOOR_WARP,d1
		beq.s	locret_62C4
		move.w	(Player_GroundHeight).l,(word_FF1208).l
		bra.w	loc_61EC
; ---------------------------------------------------------------------------

locret_62C4:					  ; CODE XREF: sub_620A+62j
						  ; sub_620A+68j ...
		rts
; ---------------------------------------------------------------------------

HandleFloorWarpPad:				  ; CODE XREF: sub_604C+20j
		move.b	(word_FF1208+1).l,d1
		andi.b	#$3F,d1
		cmpi.b	#FLOOR_WARP,d1
		beq.s	locret_62E8
		bsr.w	loc_667C
		bcc.s	locret_62E8
		move.w	(Player_GroundHeight).l,(word_FF1208).l
		bra.s	loc_62EA		  ; Nole warp room
; ---------------------------------------------------------------------------

locret_62E8:					  ; CODE XREF: sub_620A+CAj
						  ; sub_620A+D0j
		rts
; ---------------------------------------------------------------------------

loc_62EA:					  ; CODE XREF: sub_620A+DCj
		cmpi.w	#$00AA,(g_RmNum1).l	  ; Nole warp room
		bne.s	loc_6310
		moveq	#$00000007,d0
		bsr.w	DoVisualEffect		  ; 0,1	- Warp-pad transition
						  ; 2,3	- Tree warp transition
						  ; 4 -	Black flash
						  ; 5 -	White flash
						  ; 6 -	Red flash
						  ; 7 -	Nole warp
						  ;
		bsr.w	sub_A0C2
		clr.b	d0
		bsr.w	LoadRoom_0
		bsr.w	InitVDP
		moveq	#$00000008,d0
		bsr.w	DoVisualEffect		  ; 0,1	- Warp-pad transition
						  ; 2,3	- Tree warp transition
						  ; 4 -	Black flash
						  ; 5 -	White flash
						  ; 6 -	Red flash
						  ; 7 -	Nole warp
						  ;
		rts
; ---------------------------------------------------------------------------

loc_6310:					  ; CODE XREF: sub_620A+E8j
		cmpi.b	#SND_MusicTreeWarp,(g_BGM).l
		beq.s	loc_6330
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_WarpPad
; ---------------------------------------------------------------------------
		bsr.w	WarpPadFx
		bsr.w	sub_A0C2
		clr.b	d0
		bsr.w	LoadRoom_0
		bra.w	sub_8E9C
; ---------------------------------------------------------------------------

loc_6330:					  ; CODE XREF: sub_620A+10Ej
		moveq	#$00000002,d0
		bsr.w	DoVisualEffect		  ; 0,1	- Warp-pad transition
						  ; 2,3	- Tree warp transition
						  ; 4 -	Black flash
						  ; 5 -	White flash
						  ; 6 -	Red flash
						  ; 7 -	Nole warp
						  ;
		bsr.w	sub_A0C2
		clr.b	d0
		bsr.w	LoadRoom_0
		bsr.w	InitVDP
		moveq	#$00000003,d0
		bra.w	DoVisualEffect		  ; 0,1	- Warp-pad transition
						  ; 2,3	- Tree warp transition
						  ; 4 -	Black flash
						  ; 5 -	White flash
						  ; 6 -	Red flash
						  ; 7 -	Nole warp
						  ;
; ---------------------------------------------------------------------------

HandleFloorPit:					  ; CODE XREF: sub_604C+1Cj
						  ; sub_620A+216j ...
		bsr.w	loc_667C
		bcc.s	HandleFloorElevator
		move.w	(g_RoomFallDest).l,d0
		bmi.s	locret_63CA
		move.w	d0,(RmNum2).l
		bsr.w	CheckForRoomTransition
		move.w	d0,(g_RmNum1).l
		tst.w	(Player_SpriteUnderneath).l
		bpl.s	loc_6374
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Fall
; ---------------------------------------------------------------------------

loc_6374:					  ; CODE XREF: sub_620A+164j
		bsr.w	FadeOutToDarkness
		move.b	#$01,d0
		bsr.w	LoadRoom_0
		bsr.w	sub_8E9C
		bra.w	CheckBell
; ---------------------------------------------------------------------------

HandleFloorElevator:				  ; CODE XREF: sub_604C+3Cj
						  ; sub_620A+144j
		move.b	(Player_Z+1).l,d0
		cmp.b	(g_RoomMaxHeight).l,d0
		bls.s	locret_63CA
		tst.w	(Player_SpriteUnderneath).l
		bmi.s	locret_63CA
		move.w	(g_RoomClimbDest).l,d0
		bmi.s	locret_63CA
		move.w	d0,(RmNum2).l
		bsr.w	CheckForRoomTransition
		move.w	d0,(g_RmNum1).l
		bsr.w	FadeOutToDarkness
		move.b	#$02,d0
		bsr.w	LoadRoom_0
		bsr.w	sub_8E9C
		bra.w	CheckBell
; ---------------------------------------------------------------------------

locret_63CA:					  ; CODE XREF: sub_620A+14Cj
						  ; sub_620A+18Aj ...
		rts
; ---------------------------------------------------------------------------

HandleFloorLadder:				  ; CODE XREF: sub_604C+2Cj
						  ; sub_604C+30j
		move.b	(Player_Z+1).l,d0
		cmp.b	(g_RoomMaxHeight).l,d0
		bls.s	loc_6406
		move.w	(g_RoomClimbDest).l,d0
		bmi.s	loc_6406
		move.w	d0,(RmNum2).l
		bsr.w	CheckForRoomTransition
		move.w	d0,(g_RmNum1).l
		bsr.w	FadeOutToDarkness
		move.b	#$03,d0
		bsr.w	LoadRoom_0
		bsr.w	sub_8E9C
		bra.w	CheckBell
; ---------------------------------------------------------------------------

loc_6406:					  ; CODE XREF: sub_620A+1CEj
						  ; sub_620A+1D6j
		move.l	#RAM_Start,d0
		move.w	(Player_HeightmapOffset).l,d0
		addq.w	#$02,d0
		movea.l	d0,a0
		move.w	(a0),d0
		andi.b	#$3F,d0
		cmpi.b	#FLOOR_PIT,d0
		beq.w	HandleFloorPit
		move.l	#RAM_Start,d0
		move.w	(Player_HeightmapOffset).l,d0
		addi.w	#$0094,d0
		movea.l	d0,a0
		move.w	(a0),d0
		andi.b	#$3F,d0
		cmpi.b	#FLOOR_PIT,d0
		beq.w	HandleFloorPit
		rts
; ---------------------------------------------------------------------------

HandleLava:					  ; CODE XREF: sub_604C+A4j
		cmpi.b	#ITM_FIREPROOF,(g_EquippedBoots).l
		beq.s	locret_6480
		move.w	#$0500,d1
		bra.s	loc_6464
; ---------------------------------------------------------------------------

HandleFloorSpikes:				  ; CODE XREF: sub_604C+40j
		cmpi.b	#ITM_IRONBOOTS,(g_EquippedBoots).l
		beq.s	locret_6480

HandleFloorSwamp:				  ; CODE XREF: sub_604C+64j
		move.w	#$0100,d1

loc_6464:					  ; CODE XREF: sub_620A+24Aj
		bsr.w	loc_667C
		bcc.s	locret_6480
		tst.b	(byte_FF1142).l
		bne.s	locret_6480
		move.b	#$80,(byte_FF1143).l
		move.w	d1,(Player_AttackStrength).l

locret_6480:					  ; CODE XREF: sub_620A+244j
						  ; sub_620A+254j ...
		rts
; ---------------------------------------------------------------------------

HandleNoleStaircase:				  ; CODE XREF: sub_604C+A0j
		lea	(Player_X).l,a0
		move.b	Player_RotationAndSize-Player_X(a0),d0
		andi.b	#$C0,d0
		beq.w	loc_651A
		cmpi.b	#$80,d0
		bne.w	locret_6518
		move.b	$00000003(a0),d0
		andi.b	#$FE,d0
		cmpi.b	#$08,d0
		bne.w	locret_6518
		addi.b	#$11,(a0)
		addi.b	#$0A,(g_PlayerXFlattened).l
		subi.b	#$1C,$00000001(a0)
		subi.b	#$23,(g_PlayerYFlattened).l
		addi.w	#$0070,$00000012(a0)
		addi.w	#$0070,$00000054(a0)
		move.b	#$09,$00000022(a0)
		move.b	#$90,$00000039(a0)
		subi.w	#$100E,$00000028(a0)
		addi.w	#$0110,$00000014(a0)
		addi.w	#$0110,$00000018(a0)
		addi.w	#$0110,$0000001A(a0)
		addi.w	#$00A0,(word_FF1200).l
		subi.w	#$01C0,$00000016(a0)
		subi.w	#$01C0,$0000001C(a0)
		subi.w	#$01C0,$0000001E(a0)
		subi.w	#$0230,(word_FF1202).l

locret_6518:					  ; CODE XREF: sub_620A+28Ej
						  ; sub_620A+29Ej ...
		rts
; ---------------------------------------------------------------------------

loc_651A:					  ; CODE XREF: sub_620A+286j
		move.b	(Player_SubY).l,d0
		andi.b	#$FE,d0
		cmpi.b	#$06,d0
		bne.s	locret_6518
		subi.b	#$11,(a0)
		subi.b	#$0A,(g_PlayerXFlattened).l
		addi.b	#$1C,$00000001(a0)
		addi.b	#$23,(g_PlayerYFlattened).l
		subi.w	#$0070,$00000012(a0)
		subi.w	#$0070,$00000054(a0)
		move.b	#$02,$00000022(a0)
		move.b	#$20,$00000039(a0)
		addi.w	#$100E,$00000028(a0)
		subi.w	#$0110,$00000014(a0)
		subi.w	#$0110,$00000018(a0)
		subi.w	#$0110,$0000001A(a0)
		subi.w	#$00A0,(word_FF1200).l
		addi.w	#$01C0,$00000016(a0)
		addi.w	#$01C0,$0000001C(a0)
		addi.w	#$01C0,$0000001E(a0)
		addi.w	#$0230,(word_FF1202).l
		rts
; ---------------------------------------------------------------------------

HandleIceNE:					  ; CODE XREF: sub_604C+A8j
		cmpi.b	#ITM_SNOWSPIKES,(g_EquippedBoots).l
		beq.s	locret_65B4
		tst.w	(g_ControllerPlayback).l
		bne.s	locret_65B4
		move.b	#$36,d0
		jsr	(j_PlaybackInput).l

locret_65B4:					  ; CODE XREF: sub_620A+396j
						  ; sub_620A+39Ej
		rts
; ---------------------------------------------------------------------------

HandleIceSE:					  ; CODE XREF: sub_604C+ACj
		cmpi.b	#ITM_SNOWSPIKES,(g_EquippedBoots).l
		beq.s	locret_65D2
		tst.w	(g_ControllerPlayback).l
		bne.s	locret_65D2
		move.b	#$37,d0
		jsr	(j_PlaybackInput).l

locret_65D2:					  ; CODE XREF: sub_620A+3B4j
						  ; sub_620A+3BCj
		rts
; ---------------------------------------------------------------------------

HandleIceSW:					  ; CODE XREF: sub_604C+B0j
		cmpi.b	#ITM_SNOWSPIKES,(g_EquippedBoots).l
		beq.s	locret_65F0
		tst.w	(g_ControllerPlayback).l
		bne.s	locret_65F0
		move.b	#$38,d0
		jsr	(j_PlaybackInput).l

locret_65F0:					  ; CODE XREF: sub_620A+3D2j
						  ; sub_620A+3DAj
		rts
; ---------------------------------------------------------------------------

HandleIceNW:					  ; CODE XREF: sub_604C+B4j
		cmpi.b	#ITM_SNOWSPIKES,(g_EquippedBoots).l
		beq.s	locret_660E
		tst.w	(g_ControllerPlayback).l
		bne.s	locret_660E
		move.b	#$39,d0
		jsr	(j_PlaybackInput).l

locret_660E:					  ; CODE XREF: sub_620A+3F0j
						  ; sub_620A+3F8j
		rts
; ---------------------------------------------------------------------------

HandleGoddessStatue:				  ; CODE XREF: sub_604C+B8j
		move.b	(word_FF1208+1).l,d1
		andi.b	#$3F,d1
		cmpi.b	#FLOOR_GODDESS_STATUE,d1
		beq.s	locret_667A
		bsr.w	loc_667C
		bcc.s	locret_667A
		move.w	(Player_GroundHeight).l,(word_FF1208).l
		move.w	(Player_CurrentHealth).l,d0
		cmp.w	(Player_MaxHealth).l,d0
		beq.s	locret_667A
		move.w	#$0005,d0
		jsr	(j_DoVisualEffect).l
		jsr	(j_FlushDMACopyQueue).l
		jsr	(j_CopyBasePalleteToActivePalette).l
		jsr	(j_FlushDMACopyQueue).l
		move.w	#$FFFF,d0
		lea	(Player_X).l,a5
		jsr	(j_AddHealth).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_HealthRecover2
; ---------------------------------------------------------------------------

locret_667A:					  ; CODE XREF: sub_620A+414j
						  ; sub_620A+41Aj ...
		rts
; ---------------------------------------------------------------------------

loc_667C:					  ; CODE XREF: sub_620A:HandleFloorStairsp
						  ; sub_620A+CCp ...
		clr.w	d0
		move.b	(Player_GroundHeight).l,d0
		lsl.b	#$04,d0
		cmp.w	(Player_Z).l,d0
		bne.s	loc_6694
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_6694:					  ; CODE XREF: sub_620A+482j
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

CheckBell:					  ; CODE XREF: sub_620A+16j
						  ; sub_620A+17Aj ...
		move.b	#ITM_BELL,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.s	locret_66AA
		bsr.w	CheckForLifestock

locret_66AA:					  ; CODE XREF: sub_620A+49Aj
		rts
; End of function sub_620A


; =============== S U B	R O U T	I N E =======================================


ProcessActionButton:				  ; CODE XREF: GameLoop+20p

; FUNCTION CHUNK AT 0000674E SIZE 0000012A BYTES
; FUNCTION CHUNK AT 00006880 SIZE 0000006E BYTES
; FUNCTION CHUNK AT 00006962 SIZE 00000072 BYTES
; FUNCTION CHUNK AT 000069D8 SIZE 00000034 BYTES
; FUNCTION CHUNK AT 00006B30 SIZE 00000090 BYTES

		btst	#$04,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		bne.w	UpdateSwordCharge
		move.b	(g_Controller1State).l,d1
		and.b	d1,(g_SwordButtonMask).l
		move.b	(byte_FF1133).l,d0
		bne.w	loc_674E
		move.b	(byte_FF113F).l,d0
		bne.w	loc_6B30
		tst.b	(g_SwordButtonMask).l
		bne.w	UpdateSwordCharge
		move.b	(g_Controller1State).l,d0
		andi.b	#CTRLBF_AC,d0
		beq.s	UpdateSwordCharge
		btst	#$00,(g_LockPlayerActions).l ; Bit 0: Can't pick up items
						  ; Bit	1: Can't attack
						  ; Bit	2: Can't open menu
		bne.s	loc_66FE
		bsr.w	CheckPickUpEntity
		bcs.s	UpdateSwordCharge

loc_66FE:					  ; CODE XREF: ProcessActionButton+4Aj
		bsr.w	CheckOpenChest
		bcs.s	UpdateSwordCharge
		bsr.w	CheckTalk
		bcs.s	UpdateSwordCharge
		btst	#STATUS_CURSE,(g_PlayerStatus).l ; Curse
		bne.s	UpdateSwordCharge
		btst	#$01,(g_LockPlayerActions).l ; Bit 0: Can't pick up items
						  ; Bit	1: Can't attack
						  ; Bit	2: Can't open menu
		bne.s	UpdateSwordCharge
		bsr.w	SwordSwing
		tst.w	(g_GoldenStatueTimer).l
		bne.s	locret_673C
		tst.b	(g_EquippedSword).l
		beq.s	locret_674C
		move.w	#$6400,d0
		jsr	(j_DecreaseSwordCharge).l

locret_673C:					  ; CODE XREF: ProcessActionButton+7Cj
		rts
; End of function ProcessActionButton


; =============== S U B	R O U T	I N E =======================================


UpdateSwordCharge:				  ; CODE XREF: ProcessActionButton+8j
						  ; ProcessActionButton+32j ...
		tst.b	(g_EquippedSword).l
		beq.s	locret_674C
		jsr	(j_IncrementSwordCharge).l

locret_674C:					  ; CODE XREF: ProcessActionButton+84j
						  ; UpdateSwordCharge+6j
		rts
; End of function UpdateSwordCharge

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR ProcessActionButton

loc_674E:					  ; CODE XREF: ProcessActionButton+1Ej
		movem.w	d0,-(sp)
		bsr.s	UpdateSwordCharge
		movem.w	(sp)+,d0
		lea	(Player_X).l,a1
		move.w	(g_CarriedEntity).l,d1
		cmpi.b	#$7F,(a1,d1.w)
		beq.w	loc_69EE
		addq.b	#$01,d0
		move.b	d0,(byte_FF1133).l
		cmpi.b	#$02,d0
		bne.s	loc_6782
		bset	#$05,Flags1(a1,d1.w)

loc_6782:					  ; CODE XREF: ProcessActionButton+CEj
		andi.w	#$FF3F,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		ori.w	#$0040,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		cmpi.b	#$08,d0
		bcs.w	loc_69FA
		bne.s	loc_67B0
		move.w	(Player_Z).l,d2
		addi.w	#$0018,d2
		move.w	d2,Z(a1,d1.w)
		ori.b	#$80,FallRate(a1,d1.w)

loc_67B0:					  ; CODE XREF: ProcessActionButton+EEj
		andi.w	#$FF3F,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		ori.w	#$0080,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		cmpi.b	#$10,d0
		bcs.w	loc_69FA
		bne.s	loc_67D6
		bset	#$06,Flags1(a1,d1.w)
		bclr	#$05,Flags1(a1,d1.w)

loc_67D6:					  ; CODE XREF: ProcessActionButton+11Cj
		andi.w	#$FF3F,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		ori.w	#$00C0,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		cmpi.b	#$18,d0
		bcs.w	loc_69FA
		bhi.w	loc_6962
		subq.b	#$01,(byte_FF1133).l
		tst.b	(g_SwordButtonMask).l
		bne.w	locret_6A0A
		move.b	(g_Controller1State).l,d0
		andi.b	#$60,d0
		beq.w	locret_6A0A
		move.b	#$60,(g_SwordButtonMask).l
		move.w	(Player_Action).l,d0	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		andi.b	#$30,d0
		beq.s	loc_6880
		adda.w	d1,a1
		movea.l	a1,a5
		addi.w	#$0020,Z(a5)
		addi.w	#$0020,HitBoxZEnd(a5)
		movem.l	d0,-(sp)
		bsr.w	sub_3456
		movem.l	(sp)+,d0
		bcc.s	loc_6850
		subi.w	#$0020,Z(a5)
		subi.w	#$0020,HitBoxZEnd(a5)
		rts
; ---------------------------------------------------------------------------

loc_6850:					  ; CODE XREF: ProcessActionButton+194j
		andi.b	#$20,d0
		move.w	#$0010,(word_FF12E0).l
		addq.b	#$01,(byte_FF1133).l
		move.b	(g_Controller1State).l,d0
		andi.b	#$0F,d0
		beq.s	locret_6876
		move.b	#$17,(word_FF12E0).l

locret_6876:					  ; CODE XREF: ProcessActionButton+1C0j
		rts
; END OF FUNCTION CHUNK	FOR ProcessActionButton
; ---------------------------------------------------------------------------
OffsetTbl:	dc.w -$0094			  ; Up
		dc.w $0002			  ; Left
		dc.w $0094			  ; Down
		dc.w -$0002			  ; Right
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR ProcessActionButton

loc_6880:					  ; CODE XREF: ProcessActionButton+176j
		bsr.w	sub_6A0C
		move.w	(Player_HitBoxZEnd).l,d0
		clr.w	d2
		move.b	Height(a1,d1.w),d2
		sub.w	d2,d0
		move.w	d0,(Player_HitBoxZEnd).l
		bclr	#$06,Flags1(a1,d1.w)
		bclr	#$07,FallRate(a1,d1.w)
		bset	#$06,QueuedAction(a1,d1.w)
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		lsr.b	#$05,d0
		andi.w	#$0006,d0
		move.w	OffsetTbl(pc,d0.w),d0
		add.w	d0,HeightmapOffset(a1,d1.w)
		move.l	#RAM_Start,d0
		move.w	HeightmapOffset(a1,d1.w),d0
		movea.l	d0,a0
		move.w	(a0),GroundHeight(a1,d1.w)
		move.b	(a0),d0
		lsl.b	#$04,d0
		move.b	d0,FloorHeight(a1,d1.w)
		btst	#$03,(g_AdditionalFlags+7).l
		bne.s	loc_68E8
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_NigelDropObj1
; ---------------------------------------------------------------------------

loc_68E8:					  ; CODE XREF: ProcessActionButton+236j
		addq.b	#$01,(byte_FF1133).l
; END OF FUNCTION CHUNK	FOR ProcessActionButton
		andi.b	#$60,(g_Controller1State).l
		clr.w	(word_FF12E0).l
		move.w	(Player_SpriteUnderneath).l,d0
		bmi.s	locret_6960
		lea	(Player_X).l,a0
		adda.w	d0,a0
		move.b	Action1(a0),d0
		andi.b	#$0F,d0
		beq.s	locret_6960
		move.b	Speed(a0),d0
		andi.w	#$000F,d0
		move.b	d0,Speed(a1,d1.w)
		move.b	RotationAndSize(a0),d0
		andi.b	#$C0,d0
		andi.b	#$3F,RotationAndSize(a1,d1.w)
		or.b	d0,RotationAndSize(a1,d1.w)
		move.w	#$0016,d2
		cmpi.b	#$2E,BehavCmd(a1,d1.w)
		bne.s	loc_6944
		move.w	#$0032,d2

loc_6944:					  ; CODE XREF: ROM:0000693Ej
		move.w	d2,BehavParam(a1,d1.w)
		move.b	(Player_RotationAndSize).l,d2
		andi.b	#$C0,d2
		eori.b	#$80,d2
		cmp.b	d0,d2
		bne.s	locret_6960
		move.b	#$FF,$0000002A(a1,d1.w)

locret_6960:					  ; CODE XREF: ROM:00006902j
						  ; ROM:00006914j ...
		rts
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR ProcessActionButton

loc_6962:					  ; CODE XREF: ProcessActionButton+142j
		andi.w	#$FF3F,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		ori.w	#$0080,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		cmpi.b	#$1E,d0
		bcs.w	loc_69FA
		bne.s	loc_69D8
		move.w	(word_FF12E0).l,d0
		beq.s	loc_69FA
		cmpi.b	#$2E,BehavCmd(a1,d1.w)
		bne.s	loc_6996
		cmpi.b	#$10,d0
		bne.s	loc_6996
		move.b	#$2F,d0

loc_6996:					  ; CODE XREF: ProcessActionButton+2DEj
						  ; ProcessActionButton+2E4j
		move.w	d0,BehavParam(a1,d1.w)
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		andi.b	#$3F,RotationAndSize(a1,d1.w)
		or.b	d0,RotationAndSize(a1,d1.w)
		move.w	(Player_HitBoxZEnd).l,d0
		clr.w	d2
		move.b	Height(a1,d1.w),d2
		sub.b	d2,d0
		move.w	d0,(Player_HitBoxZEnd).l
		bclr	#$06,Flags1(a1,d1.w)
		bclr	#$07,FallRate(a1,d1.w)
		move.b	#SND_Throw,d0
		trap	#$00			  ; Trap00Handler
; END OF FUNCTION CHUNK	FOR ProcessActionButton
; ---------------------------------------------------------------------------
		dc.w SND_LoadFromD0
; ---------------------------------------------------------------------------
		bra.s	loc_69FA
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR ProcessActionButton

loc_69D8:					  ; CODE XREF: ProcessActionButton+2CEj
		andi.w	#$FF3F,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		ori.w	#$0040,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		cmpi.b	#$26,d0
		bcs.s	loc_69FA

loc_69EE:					  ; CODE XREF: ProcessActionButton+BEj
		clr.b	(byte_FF1133).l
		clr.w	(g_CarriedEntity).l

loc_69FA:					  ; CODE XREF: ProcessActionButton+EAj
						  ; ProcessActionButton+118j ...
		tst.w	(g_ControllerPlayback).l
		bne.s	locret_6A0A
		andi.b	#$60,(g_Controller1State).l

locret_6A0A:					  ; CODE XREF: ProcessActionButton+152j
						  ; ProcessActionButton+160j ...
		rts
; END OF FUNCTION CHUNK	FOR ProcessActionButton

; =============== S U B	R O U T	I N E =======================================


sub_6A0C:					  ; CODE XREF: ProcessActionButton:loc_6880p
		move.w	#$0010,d0
		movem.l	d1/a1,-(sp)
		adda.w	d1,a1
		movea.l	a1,a5
		addq.w	#$01,Z(a5)
		addq.w	#$01,HitBoxZEnd(a5)
		movem.l	a5,-(sp)
		bsr.s	sub_6A42
		bsr.w	sub_3456
		movem.l	(sp)+,a5
		movem.l	(sp)+,d1/a1
		bcc.s	locret_6A40
		movem.l	(sp)+,d0
		subq.w	#$01,Z(a5)
		subq.w	#$01,HitBoxZEnd(a5)

locret_6A40:					  ; CODE XREF: sub_6A0C+26j
		rts
; End of function sub_6A0C


; =============== S U B	R O U T	I N E =======================================


sub_6A42:					  ; CODE XREF: sub_6A0C+18p
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		beq.s	loc_6A72
		cmpi.b	#$80,d1
		beq.s	loc_6A80
		bhi.s	loc_6A64
		add.w	d0,CentreX(a5)
		add.w	d0,HitBoxXStart(a5)
		add.w	d0,HitBoxXEnd(a5)
		bra.s	loc_6AA4
; ---------------------------------------------------------------------------

loc_6A64:					  ; CODE XREF: sub_6A42+12j
		sub.w	d0,CentreX(a5)
		sub.w	d0,HitBoxXStart(a5)
		sub.w	d0,HitBoxXEnd(a5)
		bra.s	loc_6AA4
; ---------------------------------------------------------------------------

loc_6A72:					  ; CODE XREF: sub_6A42+Aj
		sub.w	d0,CentreY(a5)
		sub.w	d0,HitBoxYStart(a5)
		sub.w	d0,HitBoxYEnd(a5)
		bra.s	loc_6A8C
; ---------------------------------------------------------------------------

loc_6A80:					  ; CODE XREF: sub_6A42+10j
		add.w	d0,CentreY(a5)
		add.w	d0,HitBoxYStart(a5)
		add.w	d0,HitBoxYEnd(a5)

loc_6A8C:					  ; CODE XREF: sub_6A42+3Cj
		move.w	CentreY(a5),d1
		andi.b	#$0F,d1
		move.b	d1,SubY(a5)
		move.w	CentreY(a5),d1
		lsr.w	#$04,d1
		move.b	d1,Y(a5)
		rts
; ---------------------------------------------------------------------------

loc_6AA4:					  ; CODE XREF: sub_6A42+20j
						  ; sub_6A42+2Ej
		move.w	CentreX(a5),d1
		andi.b	#$0F,d1
		move.b	d1,SubX(a5)
		move.w	CentreX(a5),d1
		lsr.w	#$04,d1
		move.b	d1,(a5)
		rts
; End of function sub_6A42


; =============== S U B	R O U T	I N E =======================================


SwordSwing:					  ; CODE XREF: ProcessActionButton+72p
		move.b	#$01,(byte_FF113F).l
		andi.w	#$F8FF,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		ori.w	#$0100,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		tst.w	(g_ControllerPlayback).l
		bne.s	loc_6AE2
		andi.b	#CTRLBF_AC,(g_Controller1State).l

loc_6AE2:					  ; CODE XREF: SwordSwing+1Ej
		move.b	#CTRLBF_AC,(g_SwordButtonMask).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordSwing
; ---------------------------------------------------------------------------
		clr.w	d2
		cmpi.w	#$3200,(g_SwordCharge_0).l
		bcs.s	loc_6B28
		move.b	(g_EquippedSword).l,d1
		cmpi.b	#ITM_MAGICSWORD,d1
		bne.s	loc_6B0C
		move.b	#ITM_MAGICSWORD,d2
		bra.s	loc_6B28
; ---------------------------------------------------------------------------

loc_6B0C:					  ; CODE XREF: SwordSwing+4Aj
		cmpi.b	#ITM_GAIASWORD,d1
		bne.s	loc_6B18
		move.b	#ITM_GAIASWORD,d2
		bra.s	loc_6B28
; ---------------------------------------------------------------------------

loc_6B18:					  ; CODE XREF: SwordSwing+56j
		cmpi.b	#ITM_THUNDERSWORD,d1
		bne.s	loc_6B24
		move.b	#ITM_THUNDERSWORD,d2
		bra.s	loc_6B28
; ---------------------------------------------------------------------------

loc_6B24:					  ; CODE XREF: SwordSwing+62j
		move.b	#ITM_ICESWORD,d2

loc_6B28:					  ; CODE XREF: SwordSwing+3Ej
						  ; SwordSwing+50j ...
		move.w	d2,(g_MagicSwordEffect).l
		rts
; End of function SwordSwing

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR ProcessActionButton

loc_6B30:					  ; CODE XREF: ProcessActionButton+28j
		addq.b	#$01,d0
		move.b	d0,(byte_FF113F).l
		andi.w	#$F8FF,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		ori.w	#$0100,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		cmpi.b	#$05,d0
		bcs.s	loc_6BA2
		bsr.s	sub_6BC0
		bcs.s	loc_6B94
		andi.w	#$F8FF,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		ori.w	#$0200,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		cmpi.b	#$0A,d0
		bcs.s	loc_6BA2
		andi.w	#$F8FF,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		ori.w	#$0300,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		cmpi.b	#$0F,d0
		bcs.s	loc_6BA2
		andi.w	#$F8FF,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		ori.w	#$0400,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		cmpi.b	#$14,d0
		bcs.s	loc_6BA2

loc_6B94:					  ; CODE XREF: ProcessActionButton+4A4j
		andi.w	#$F8FF,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		clr.b	(byte_FF113F).l

loc_6BA2:					  ; CODE XREF: ProcessActionButton+4A0j
						  ; ProcessActionButton+4BAj ...
		move.b	(Player_Action+1).l,d0	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		andi.b	#$30,d0
		bne.s	locret_6BBE
		tst.w	(g_ControllerPlayback).l
		bne.s	locret_6BBE
		andi.b	#$60,(g_Controller1State).l

locret_6BBE:					  ; CODE XREF: ProcessActionButton+500j
						  ; ProcessActionButton+508j
		rts
; END OF FUNCTION CHUNK	FOR ProcessActionButton

; =============== S U B	R O U T	I N E =======================================


sub_6BC0:					  ; CODE XREF: ProcessActionButton+4A2p
		movem.w	d0,-(sp)
		lea	(Player_X).l,a0
		move.l	Player_HitBoxXStart-Player_X(a0),d0
		move.l	HitBoxYStart(a0),d1
		movem.l	d0-d1,-(sp)
		move.b	RotationAndSize(a0),d0
		andi.b	#$C0,d0
		beq.s	loc_6BF4
		cmpi.b	#$80,d0
		bls.s	loc_6C02
		subi.w	#$0010,HitBoxXStart(a0)
		addi.w	#$0010,HitBoxYEnd(a0)
		bra.s	loc_6C0E
; ---------------------------------------------------------------------------

loc_6BF4:					  ; CODE XREF: sub_6BC0+1Ej
		subi.w	#$0010,HitBoxYStart(a0)
		addi.w	#$0010,HitBoxXEnd(a0)
		bra.s	loc_6C0E
; ---------------------------------------------------------------------------

loc_6C02:					  ; CODE XREF: sub_6BC0+24j
		addi.w	#$0010,HitBoxXEnd(a0)
		addi.w	#$0010,HitBoxYEnd(a0)

loc_6C0E:					  ; CODE XREF: sub_6BC0+32j
						  ; sub_6BC0+40j
		move.b	#$FF,d7
		bsr.w	sub_3302
		movem.l	(sp)+,d0-d1
		move.l	d0,HitBoxXStart(a0)
		move.l	d1,HitBoxYStart(a0)
		movem.w	(sp)+,d0
		move.w	Z(a0),d7
		cmp.w	d7,d4
		bhi.s	loc_6C32
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_6C32:					  ; CODE XREF: sub_6BC0+6Cj
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordHit
; End of function sub_6BC0

; ---------------------------------------------------------------------------
		ori	#$01,ccr
		rts

; =============== S U B	R O U T	I N E =======================================


sub_6C3C:					  ; CODE XREF: CheckPickUpEntity:loc_6D14p
						  ; CheckTalk:loc_6E54p ...
		lea	(Player_X).l,a0
		move.b	RotationAndSize(a0),d0
		andi.w	#$00C0,d0		  ; Orientation
		lsr.b	#$03,d0
		move.w	word_6C90(pc,d0.w),d1
		move.w	(a0,d1.w),d2
		add.w	word_6C90+2(pc,d0.w),d2
		move.w	word_6C90+2(pc,d0.w),d3
		move.w	word_6C90+4(pc,d0.w),d1
		move.w	word_6C90+6(pc,d0.w),d0
		movea.w	(a0,d0.w),a2
		movea.w	SubX(a0,d0.w),a3
		addq.w	#$03,a2
		subq.w	#$03,a3
		move.w	Z(a0),d4
		move.w	HitBoxZEnd(a0),d5
		move.l	#RAM_Start,d6
		move.w	HeightmapOffset(a0),d6
		movea.l	d6,a6
		moveq	#$FFFFFFFF,d6
		move.w	#$000E,d7
		lea	SPRITE_SIZE(a0),a0
		rts
; End of function sub_6C3C

; ---------------------------------------------------------------------------
word_6C90:	dc.w $001C,$FFFF,$001E,$0018	  ; 0
		dc.w $001A,$0001,$0018,$001C	  ; 4
		dc.w $001E,$0001,$001C,$0018	  ; 8
		dc.w $0018,$FFFF,$001A,$001C	  ; 12

; =============== S U B	R O U T	I N E =======================================


CheckPickUpEntity:				  ; CODE XREF: ProcessActionButton+4Cp
		lea	(Player_X).l,a5
		bsr.w	sub_3456
		bcc.s	loc_6CC6
		btst	#$05,Flags2(a1)
		bne.w	loc_6DCA

loc_6CC6:					  ; CODE XREF: CheckPickUpEntity+Aj
		lea	(Sprite1_X).l,a4
		moveq	#$0000000E,d7

loc_6CCE:					  ; CODE XREF: CheckPickUpEntity+60j
		tst.w	(a4)
		bmi.s	loc_6D14
		btst	#$00,Flags1(a4)
		bne.s	loc_6D0C
		tst.w	SpriteUnderneath(a4)
		bne.s	loc_6D0C
		btst	#$05,Flags2(a4)
		beq.s	loc_6D0C
		cmpi.b	#$10,BehavCmd(a4)
		beq.s	loc_6D0C
		cmpi.b	#$16,BehavCmd(a4)
		beq.s	loc_6D0C
		clr.w	d0
		move.b	Height(a4),d0
		lea	(Player_X).l,a5
		add.w	d0,Player_HitBoxZEnd-Player_X(a5)
		bra.w	loc_6DDC
; ---------------------------------------------------------------------------

loc_6D0C:					  ; CODE XREF: CheckPickUpEntity+28j
						  ; CheckPickUpEntity+2Ej ...
		lea	SPRITE_SIZE(a4),a4
		dbf	d7,loc_6CCE

loc_6D14:					  ; CODE XREF: CheckPickUpEntity+20j
		bsr.w	sub_6C3C
		add.w	d2,d3

loc_6D1A:					  ; CODE XREF: CheckPickUpEntity+E4j
		tst.w	(a0)
		bmi.s	loc_6D98
		btst	#$05,Flags2(a0)
		beq.s	loc_6D90
		cmpi.b	#$10,BehavCmd(a0)
		beq.s	loc_6D90
		cmpi.b	#$16,BehavCmd(a0)
		beq.s	loc_6D90
		cmp.w	(a0,d1.w),d2
		beq.s	loc_6D42
		cmp.w	(a0,d1.w),d3
		bne.s	loc_6D90

loc_6D42:					  ; CODE XREF: CheckPickUpEntity+8Aj
		btst	#$04,Flags2(a0)
		beq.s	loc_6D6C
		movem.w	d0-d1,-(sp)
		move.b	RotationAndSize(a0),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		movem.w	(sp)+,d0-d1
		bne.s	loc_6D90

loc_6D6C:					  ; CODE XREF: CheckPickUpEntity+98j
		cmpa.w	SubX(a0,d0.w),a2
		bhi.s	loc_6D90
		cmpa.w	(a0,d0.w),a3
		bcs.s	loc_6D90
		cmp.w	HitBoxZEnd(a0),d4
		bcc.s	loc_6D90
		cmp.w	Z(a0),d5
		bls.s	loc_6D90
		cmp.w	Z(a0),d6
		bcs.s	loc_6D90
		move.w	Z(a0),d6
		movea.l	a0,a4

loc_6D90:					  ; CODE XREF: CheckPickUpEntity+74j
						  ; CheckPickUpEntity+7Cj ...
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,loc_6D1A

loc_6D98:					  ; CODE XREF: CheckPickUpEntity+6Cj
		cmpi.b	#$FF,d6
		beq.s	loc_6DC6
		clr.w	d0
		move.b	Height(a4),d0
		lea	(Player_X).l,a5
		add.w	d0,Player_HitBoxZEnd-Player_X(a5)
		bsr.w	sub_3456
		bcc.s	loc_6DDC
		clr.w	d0
		move.b	Height(a4),d0
		sub.w	d0,HitBoxZEnd(a5)
		btst	#$05,Flags2(a1)
		bne.s	loc_6DCA

loc_6DC6:					  ; CODE XREF: CheckPickUpEntity+ECj
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_6DCA:					  ; CODE XREF: CheckPickUpEntity+12j
						  ; CheckPickUpEntity+114j
		movea.l	a1,a4
		clr.w	d0
		move.b	Height(a4),d0
		lea	(Player_X).l,a5
		add.w	d0,Player_HitBoxZEnd-Player_X(a5)

loc_6DDC:					  ; CODE XREF: CheckPickUpEntity+58j
						  ; CheckPickUpEntity+102j
		move.b	#$01,(byte_FF1133).l
		move.l	BehaviourLUTPtr(a4),Unk5E(a4)
		move.b	BehavParam(a4),Unk67(a4)
		move.b	BehavCmd(a4),Unk69(a4)
		move.b	Speed(a4),Unk49(a4)
		suba.l	#Player_X,a4
		move.w	a4,(g_CarriedEntity).l
		clr.b	(g_Controller1State).l
		move.b	#CTRLBF_AC,(g_SwordButtonMask).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_JumpLand
; End of function CheckPickUpEntity

; ---------------------------------------------------------------------------
		ori	#$01,ccr
		rts

; =============== S U B	R O U T	I N E =======================================


CheckTalk:					  ; CODE XREF: ProcessActionButton+58p
		move.w	(Player_Action).l,d0	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		andi.b	#$30,d0
		bne.w	loc_6EEA
		move.b	(Player_GroundType).l,d0
		andi.b	#$3F,d0
		cmpi.b	#FLOOR_SIGN_NW1,d0
		bcs.s	loc_6E46
		cmpi.b	#FLOOR_SIGN_NE4,d0
		bls.w	loc_6FB8

loc_6E46:					  ; CODE XREF: CheckTalk+1Cj
						  ; CheckTalk+188j ...
		cmpi.b	#FLOOR_SIGN_NW5,d0
		bcs.s	loc_6E54
		cmpi.b	#FLOOR_SIGN_NE8,d0
		bls.w	loc_6F70

loc_6E54:					  ; CODE XREF: CheckTalk+2Aj
						  ; CheckTalk+160j ...
		bsr.w	sub_6C3C

loc_6E58:					  ; CODE XREF: CheckTalk+8Cj
						  ; CheckTalk+C2j
		tst.w	(a0)
		bmi.s	loc_6EB0
		btst	#$04,Flags2(a0)
		beq.s	loc_6EA8
		btst	#$00,Flags1(a0)
		bne.s	loc_6EA8
		movea.w	d2,a5
		cmpa.w	(a0,d1.w),a5
		beq.s	loc_6E8C
		adda.w	d3,a5
		cmpa.w	(a0,d1.w),a5
		beq.s	loc_6E8C
		adda.w	d3,a5
		cmpa.w	(a0,d1.w),a5
		beq.s	loc_6E8C
		adda.w	d3,a5
		cmpa.w	(a0,d1.w),a5
		bne.s	loc_6EA8

loc_6E8C:					  ; CODE XREF: CheckTalk+52j
						  ; CheckTalk+5Aj ...
		cmpa.w	SubX(a0,d0.w),a2
		bhi.s	loc_6EA8
		cmpa.w	(a0,d0.w),a3
		bcs.s	loc_6EA8
		cmp.w	HitBoxZEnd(a0),d4
		bcc.s	loc_6EA8
		cmp.w	Z(a0),d5
		bls.s	loc_6EA8
		movea.l	a0,a4
		clr.w	d6

loc_6EA8:					  ; CODE XREF: CheckTalk+42j
						  ; CheckTalk+4Aj ...
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,loc_6E58

loc_6EB0:					  ; CODE XREF: CheckTalk+3Aj
		tst.w	d6
		bpl.w	loc_6EF6
		movem.w	d1/d3-d4,-(sp)
		subi.w	#$0018,d1
		adda.w	word_6EEE(pc,d1.w),a6
		move.b	$00000001(a6),d4
		andi.b	#$3F,d4
		cmpi.b	#$0E,d4
		bne.s	loc_6EE6
		lsl.w	#$04,d3
		add.w	d3,d2
		movem.w	(sp)+,d1/d3-d4
		lea	(Sprite1_X).l,a0
		move.w	#$000E,d7
		bra.w	loc_6E58
; ---------------------------------------------------------------------------

loc_6EE6:					  ; CODE XREF: CheckTalk+AEj
		movem.w	(sp)+,d1/d3-d4

loc_6EEA:					  ; CODE XREF: CheckTalk+Aj
		tst.b	d0
		rts
; ---------------------------------------------------------------------------
word_6EEE:	dc.w $0002
		dc.w -$0002
		dc.w $0094
		dc.w -$0094
; ---------------------------------------------------------------------------

loc_6EF6:					  ; CODE XREF: CheckTalk+92j
		movea.l	a4,a0
		move.l	a0,(dword_FF187C).l
		move.b	RotationAndSize(a0),d0
		movem.l	d0/a0,-(sp)
		move.b	Dialogue(a0),d0
		lsr.b	#$02,d0
		move.b	d0,(g_currentSpeakerScriptID).l
		btst	#$00,Flags2(a0)
		bne.w	loc_6FFA
		andi.b	#$3F,RotationAndSize(a0)
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		or.b	d0,RotationAndSize(a0)
		bsr.w	sub_701A
		bsr.w	LoadSprites
		bsr.w	FlushDMACopyQueue
		jsr	(j_PlayerTalk).l
		bsr.w	sub_700A
		movem.l	(sp)+,d0/a0
		move.b	d0,RotationAndSize(a0)
		bsr.w	sub_701A
		bsr.w	LoadSprites

loc_6F5A:					  ; CODE XREF: CheckTalk+1D6j
						  ; CheckTalk+1E6j
		andi.b	#$60,(g_Controller1State).l
		move.b	#$60,(g_SwordButtonMask).l
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_6F70:					  ; CODE XREF: CheckTalk+30j
		cmpi.b	#FLOOR_SIGN_NE5,d0
		bcc.s	loc_6F86
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		bne.w	loc_6E54
		bra.s	loc_6FAC
; ---------------------------------------------------------------------------

loc_6F86:					  ; CODE XREF: CheckTalk+154j
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmpi.b	#$C0,d1
		bne.w	loc_6E54
		bra.s	loc_6FAC
; ---------------------------------------------------------------------------
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmpi.b	#$C0,d1
		bne.w	loc_6E46

loc_6FAC:					  ; CODE XREF: CheckTalk+164j
						  ; CheckTalk+178j
		subi.b	#FLOOR_SIGN_NE5,d0
		andi.b	#$03,d0
		addq.b	#$04,d0
		bra.s	loc_6FE6
; ---------------------------------------------------------------------------

loc_6FB8:					  ; CODE XREF: CheckTalk+22j
		cmpi.b	#FLOOR_SIGN_NE1,d0
		bcc.s	loc_6FCE
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		bne.w	loc_6E46
		bra.s	loc_6FE0
; ---------------------------------------------------------------------------

loc_6FCE:					  ; CODE XREF: CheckTalk+19Cj
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmpi.b	#$C0,d1
		bne.w	loc_6E46

loc_6FE0:					  ; CODE XREF: CheckTalk+1ACj
		subq.b	#$01,d0
		andi.b	#$03,d0

loc_6FE6:					  ; CODE XREF: CheckTalk+196j
		move.b	d0,(g_currentSpeakerScriptID).l
		jsr	(j_PlayerTalk).l
		bsr.w	sub_700A
		bra.w	loc_6F5A
; ---------------------------------------------------------------------------

loc_6FFA:					  ; CODE XREF: CheckTalk+F8j
		jsr	(j_PlayerTalk).l
		bsr.s	sub_700A
		movem.l	(sp)+,d0/a0
		bra.w	loc_6F5A
; End of function CheckTalk


; =============== S U B	R O U T	I N E =======================================


sub_700A:					  ; CODE XREF: CheckTalk+126p
						  ; CheckTalk+1D2p ...
		move.w	(g_Character).l,d0
		bmi.s	locret_7018
		jsr	(j_ProcessDialogueScriptAction).l

locret_7018:					  ; CODE XREF: sub_700A+6j
		rts
; End of function sub_700A


; =============== S U B	R O U T	I N E =======================================


sub_701A:					  ; CODE XREF: CheckTalk+114p
						  ; CheckTalk+132p
		move.b	RotationAndSize(a0),d0
		addi.b	#$40,d0
		andi.b	#$80,d0
		beq.s	loc_702C
		move.b	#$04,d0

loc_702C:					  ; CODE XREF: sub_701A+Cj
		ext.w	d0
		move.w	d0,AnimationIndex(a0)
		clr.w	AnimationFrame(a0)
		andi.b	#$F7,TileSource(a0)
		move.b	RotationAndSize(a0),d0
		andi.b	#$40,d0
		lsr.b	#$03,d0
		or.b	d0,TileSource(a0)
		ori.b	#$80,Unk0A(a0)
		rts
; End of function sub_701A


; =============== S U B	R O U T	I N E =======================================


CheckOpenChest:					  ; CODE XREF: ProcessActionButton:loc_66FEp
		bsr.w	sub_6C3C
		add.w	d2,d3

loc_7058:					  ; CODE XREF: CheckOpenChest+4Ej
		tst.w	(a0)
		bmi.s	loc_70A4
		cmpi.b	#SpriteB_Chest,SpriteGraphic(a0)
		bne.s	loc_709C
		btst	#$00,Flags1(a0)
		bne.s	loc_709C
		cmp.w	(a0,d1.w),d2
		beq.s	loc_7078
		cmp.w	(a0,d1.w),d3
		bne.s	loc_709C

loc_7078:					  ; CODE XREF: CheckOpenChest+1Ej
		cmpa.w	SubX(a0,d0.w),a2
		bhi.s	loc_709C
		cmpa.w	(a0,d0.w),a3
		bcs.s	loc_709C
		cmp.w	HitBoxZEnd(a0),d4
		bcc.s	loc_709C
		cmp.w	Z(a0),d5
		bls.s	loc_709C
		cmp.w	Z(a0),d6
		bcs.s	loc_709C
		move.w	Z(a0),d6
		movea.l	a0,a4

loc_709C:					  ; CODE XREF: CheckOpenChest+10j
						  ; CheckOpenChest+18j	...
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,loc_7058

loc_70A4:					  ; CODE XREF: CheckOpenChest+8j
		cmpi.b	#$FF,d6
		beq.w	loc_71E2
		move.b	GoldOrChestContents(a4),d0
		bmi.w	loc_71E2
		cmpi.b	#$3F,d0
		beq.w	loc_71E6
		ext.w	d0
		move.w	d0,(word_FF1196).l
		movem.w	d0,-(sp)
		bsr.w	sub_7218
		jsr	(sub_22EE8).l
		movem.w	(sp)+,d0
		cmpi.b	#ITM_LIFESTOCK,d0
		beq.s	loc_7132
		cmpi.b	#ITM_BROADSWORD,d0
		bcs.s	loc_711E
		subi.b	#ITM_BROADSWORD,d0
		ext.w	d0
		add.b	d0,d0
		move.w	GoldAmounts(pc,d0.w),d0
		ext.l	d0
		move.l	d0,(g_PrintNumericDwordValue).l
		jsr	(j_AddGold).l
		jsr	(j_OpenChest).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicChestOpen
; ---------------------------------------------------------------------------
		move.w	#$0015,d0
		jsr	(j_PrintString).l
		bsr.w	RestoreBGM
		bra.s	loc_7190
; ---------------------------------------------------------------------------
GoldAmounts:
		dc.w 00005
		dc.w 00020
		dc.w 00050
		dc.w 00200
; ---------------------------------------------------------------------------

loc_711E:					  ; CODE XREF: CheckOpenChest+8Ej
		jsr	(j_GetItemQtyAndMaxQty).l
		cmpi.b	#$09,d1
		beq.w	loc_71BC
		addq.b	#$01,d1
		bne.s	loc_7132
		addq.b	#$01,d1

loc_7132:					  ; CODE XREF: CheckOpenChest+88j
						  ; CheckOpenChest+DCj
		movem.w	d0-d1,-(sp)
		jsr	(j_OpenChest).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicChestOpen
; ---------------------------------------------------------------------------
		move.w	#$0011,d0
		jsr	(j_PrintString).l
		bsr.w	RestoreBGM
		movem.w	(sp)+,d0-d1
		cmpi.b	#$3E,d0
		beq.s	loc_7176
		jsr	(j_GetItem).l
		tst.b	d0
		bne.s	loc_719C
		jsr	(j_UpdateEkeEkeHUD).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		bra.s	loc_719C
; ---------------------------------------------------------------------------

loc_7176:					  ; CODE XREF: CheckOpenChest+104j
		move.w	#$0100,d0
		lea	(Player_X).l,a5
		jsr	(j_AddToMaxHealth).l
		move.w	#$0100,d0
		jsr	(j_AddHealth).l

loc_7190:					  ; CODE XREF: CheckOpenChest+C2j
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l

loc_719C:					  ; CODE XREF: CheckOpenChest+10Ej
						  ; CheckOpenChest+122j
		move.w	#$000C,AnimationFrame(a4)
		ori.b	#$80,Unk0A(a4)
		bsr.w	LoadSprites
		bsr.w	sub_9DA2
		bsr.w	FlushDMACopyQueue

loc_71B4:					  ; CODE XREF: CheckOpenChest+1C4j
		jsr	(j_SetUpTextDisplay).l
		bra.s	loc_71CE
; ---------------------------------------------------------------------------

loc_71BC:					  ; CODE XREF: CheckOpenChest+D6j
		move.w	#$0012,d0
		jsr	(j_PrintString).l
		jsr	(j_SetUpTextDisplay).l
		bsr.s	sub_7234

loc_71CE:					  ; CODE XREF: CheckOpenChest+168j
		clr.b	(g_Controller1State).l
		move.b	#$60,(g_SwordButtonMask).l
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_71E2:					  ; CODE XREF: CheckOpenChest+56j
						  ; CheckOpenChest+5Ej
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_71E6:					  ; CODE XREF: CheckOpenChest+66j
		move.w	#$0010,AnimationFrame(a4)
		bsr.s	sub_7250
		move.w	#$000C,AnimationFrame(a4)
		bsr.s	sub_7250
		move.b	#$18,Height(a4)
		addq.w	#$08,HitBoxZEnd(a4)
		jsr	(sub_22EE8).l
		jsr	(j_OpenChest).l
		move.w	#$0014,d0
		jsr	(j_PrintString).l
		bra.s	loc_71B4
; End of function CheckOpenChest


; =============== S U B	R O U T	I N E =======================================


sub_7218:					  ; CODE XREF: CheckOpenChest+76p
		move.w	#$0004,AnimationFrame(a4)
		bsr.s	sub_7250
		move.w	#$0008,AnimationFrame(a4)
		bsr.s	sub_7250
		move.b	#$18,Height(a4)
		addq.w	#$08,HitBoxZEnd(a4)
		rts
; End of function sub_7218


; =============== S U B	R O U T	I N E =======================================


sub_7234:					  ; CODE XREF: CheckOpenChest+17Ap
		move.w	#$0004,AnimationFrame(a4)
		bsr.s	sub_7250
		move.w	#$0000,AnimationFrame(a4)
		bsr.s	sub_7250
		move.b	#$10,Height(a4)
		subq.w	#$08,HitBoxZEnd(a4)
		rts
; End of function sub_7234


; =============== S U B	R O U T	I N E =======================================


sub_7250:					  ; CODE XREF: CheckOpenChest+19Ap
						  ; CheckOpenChest+1A2p ...
		ori.b	#$80,Unk0A(a4)
		movem.l	a4,-(sp)
		bsr.w	LoadSprites
		bsr.w	sub_9DA2
		bsr.w	EnableDMAQueueProcessing
		move.w	#$0004,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames
		movem.l	(sp)+,a4
		rts
; End of function sub_7250


; =============== S U B	R O U T	I N E =======================================


sub_7274:					  ; CODE XREF: GameLoop+5Ap
						  ; LoadRoom_0+4Cp

; FUNCTION CHUNK AT 000073AC SIZE 0000021E BYTES
; FUNCTION CHUNK AT 000075D2 SIZE 00000052 BYTES

		lea	(Player_X).l,a0
		cmpi.b	#SpriteB_Nigel,Player_SpriteGraphic-Player_X(a0)
		beq.s	UpdatePlayerSpriteFrame
		jsr	(j_UpdateSpriteFrame).l
		rts
; ---------------------------------------------------------------------------

UpdatePlayerSpriteFrame:			  ; CODE XREF: sub_7274+Cj
		move.w	(Player_AnimAction).l,d2
		move.w	(Player_Action).l,d0	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		move.w	d0,(Player_AnimAction).l
		btst	#$00,Flags2(a0)
		bne.s	locret_72E2
		tst.w	d0
		beq.s	loc_72E4
		move.w	d0,d1
		andi.w	#$2000,d1		  ; Take Damage
		bne.w	PlayerTakeDamage
		move.w	d0,d1
		andi.w	#$0700,d1		  ; Attack
		bne.w	PlayerAttack
		move.w	d0,d1
		andi.w	#$0030,d1		  ; Jump/Fall
		bne.w	PlayerJump
		move.w	d0,d1
		andi.w	#$000F,d1		  ; Move
		bne.w	PlayerMove
		move.w	d0,d1
		andi.w	#$00C0,d1		  ; PickUp/Carry/Throw
		bne.s	PlayerPickUp
		move.w	d0,d1
		andi.w	#$1000,d1		  ; Climb
		bne.w	PlayerClimb

locret_72E2:					  ; CODE XREF: sub_7274+2Ej
		rts
; ---------------------------------------------------------------------------

loc_72E4:					  ; CODE XREF: sub_7274+32j
		bsr.w	sub_739A

loc_72E8:					  ; CODE XREF: sub_3FEj
		clr.w	AnimationFrame(a0)
		move.b	RotationAndSize(a0),d0
		andi.b	#$C0,d0
		beq.s	loc_730C
		cmpi.b	#$80,d0
		beq.s	loc_7324
		bhi.s	loc_7318
		move.w	#$0004,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_730C:					  ; CODE XREF: sub_7274+80j
		clr.w	AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_7318:					  ; CODE XREF: sub_7274+88j
		clr.w	AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_7324:					  ; CODE XREF: sub_7274+86j
		move.w	#$0004,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

PlayerPickUp:					  ; CODE XREF: sub_7274+62j
		bsr.s	sub_739A
		clr.w	AnimationFrame(a0)
		cmpi.w	#$00C0,d1
		beq.s	loc_7350
		move.w	#$0004,AnimationFrame(a0)
		cmpi.w	#$0080,d1
		beq.s	loc_7350
		move.w	#$0008,AnimationFrame(a0)

loc_7350:					  ; CODE XREF: sub_7274+C8j
						  ; sub_7274+D4j
		move.b	RotationAndSize(a0),d0
		andi.b	#$C0,d0
		beq.s	loc_7370
		cmpi.b	#$80,d0
		beq.s	loc_738C
		bhi.s	loc_737E
		move.w	#$0014,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_7370:					  ; CODE XREF: sub_7274+E4j
		move.w	#$0010,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_737E:					  ; CODE XREF: sub_7274+ECj
		move.w	#$0010,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_738C:					  ; CODE XREF: sub_7274+EAj
		move.w	#$0014,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts
; End of function sub_7274


; =============== S U B	R O U T	I N E =======================================


sub_739A:					  ; CODE XREF: sub_7274:loc_72E4p
						  ; sub_7274:PlayerPickUpp ...
		cmp.w	d0,d2
		beq.s	locret_73AA
		bset	#$07,Unk0A(a0)
		bset	#$07,Unk48(a0)

locret_73AA:					  ; CODE XREF: sub_739A+2j
		rts
; End of function sub_739A

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7274

PlayerMove:					  ; CODE XREF: sub_7274+58j
		andi.b	#$0F,d2
		cmp.b	d1,d2
		beq.s	loc_73B8
		clr.b	Unk0D(a0)

loc_73B8:					  ; CODE XREF: sub_7274+13Ej
		move.w	#$0008,AnimationIndex(a0)
		move.w	d0,d1
		andi.b	#$C0,d1
		beq.s	loc_73D6
		cmpi.b	#$18,(byte_FF1133).l
		bcc.s	loc_73D6
		move.w	#$0010,AnimationIndex(a0)

loc_73D6:					  ; CODE XREF: sub_7274+150j
						  ; sub_7274+15Aj
		move.b	Unk0D(a0),d0
		move.b	d0,d1
		move.b	(g_PlayerSpeed+1).l,d7
		bne.s	loc_73E8
		move.w	#$0002,d7

loc_73E8:					  ; CODE XREF: sub_7274+16Ej
		add.b	d7,d1
		neg.b	d7
		and.b	d7,d1
		move.b	d1,Unk0D(a0)
		andi.b	#$07,d0
		bne.s	loc_7426
		move.b	AnimationFrame1(a0),d0
		move.b	d0,d1
		andi.b	#$E0,AnimationFrame1(a0)
		btst	#$01,Flags4(a0)		  ; Bit	0 = Invincible / Solid
		beq.s	loc_7410
		subq.b	#$04,d1
		bra.s	loc_7412
; ---------------------------------------------------------------------------

loc_7410:					  ; CODE XREF: sub_7274+196j
		addq.b	#$04,d1

loc_7412:					  ; CODE XREF: sub_7274+19Aj
		andi.b	#$1C,d1
		or.b	d1,AnimationFrame1(a0)
		bset	#$07,Unk0A(a0)
		bset	#$07,Unk48(a0)

loc_7426:					  ; CODE XREF: sub_7274+182j
		move.b	RotationAndSize(a0),d0
		btst	#$01,Flags4(a0)		  ; Bit	0 = Invincible / Solid
		beq.s	loc_7436
		eori.b	#$80,d0

loc_7436:					  ; CODE XREF: sub_7274+1BCj
		andi.b	#$C0,d0
		beq.s	loc_7452
		cmpi.b	#$80,d0
		beq.s	loc_746E
		bhi.s	loc_7460
		ori.b	#$0C,AnimationIndex1(a0)
		bset	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_7452:					  ; CODE XREF: sub_7274+1C6j
		ori.b	#$08,AnimationIndex1(a0)
		bclr	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_7460:					  ; CODE XREF: sub_7274+1CEj
		ori.b	#$08,AnimationIndex1(a0)
		bset	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_746E:					  ; CODE XREF: sub_7274+1CCj
		ori.b	#$0C,AnimationIndex1(a0)
		bclr	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

PlayerJump:					  ; CODE XREF: sub_7274+4Ej
		bsr.w	sub_739A
		move.b	d0,d1
		clr.w	AnimationFrame(a0)
		andi.b	#$10,d1
		beq.s	loc_7492
		move.w	#$0004,AnimationFrame(a0)

loc_7492:					  ; CODE XREF: sub_7274+216j
		clr.w	AnimationIndex(a0)
		clr.b	Unk0D(a0)
		andi.b	#$C0,d0
		beq.s	loc_74C6
		cmpi.b	#$C0,d0
		beq.s	loc_74C0
		move.w	#$0010,AnimationIndex(a0)
		clr.w	AnimationFrame(a0)
		cmpi.b	#$80,d0
		beq.w	loc_74C6
		move.w	#$0004,AnimationFrame(a0)
		bra.s	loc_74C6
; ---------------------------------------------------------------------------

loc_74C0:					  ; CODE XREF: sub_7274+230j
		move.w	#$0008,AnimationIndex(a0)

loc_74C6:					  ; CODE XREF: sub_7274+22Aj
						  ; sub_7274+240j ...
		move.b	RotationAndSize(a0),d0
		andi.b	#$C0,d0
		beq.s	loc_74E6
		cmpi.b	#$80,d0
		beq.s	loc_7502
		bhi.s	loc_74F4
		addi.w	#$0024,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_74E6:					  ; CODE XREF: sub_7274+25Aj
		addi.w	#$0020,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_74F4:					  ; CODE XREF: sub_7274+262j
		addi.w	#$0020,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_7502:					  ; CODE XREF: sub_7274+260j
		addi.w	#$0024,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

PlayerAttack:					  ; CODE XREF: sub_7274+44j
		bsr.w	sub_739A
		clr.w	AnimationFrame(a0)
		cmpi.w	#$0100,d1
		beq.s	loc_753C
		move.w	#$0004,AnimationFrame(a0)
		cmpi.w	#$0200,d1
		beq.s	loc_753C
		move.w	#$0008,AnimationFrame(a0)
		cmpi.w	#$0300,d1
		beq.s	loc_753C
		move.w	#$000C,AnimationFrame(a0)

loc_753C:					  ; CODE XREF: sub_7274+2A8j
						  ; sub_7274+2B4j ...
		move.b	RotationAndSize(a0),d0
		andi.b	#$C0,d0
		beq.s	loc_755C
		cmpi.b	#$80,d0
		beq.s	loc_7578
		bhi.s	loc_756A
		move.w	#$003C,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_755C:					  ; CODE XREF: sub_7274+2D0j
		move.w	#$0038,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_756A:					  ; CODE XREF: sub_7274+2D8j
		move.w	#$0038,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_7578:					  ; CODE XREF: sub_7274+2D6j
		move.w	#$003C,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

PlayerClimb:					  ; CODE XREF: sub_7274+6Aj
		move.w	#$0040,AnimationIndex(a0)
		btst	#$06,RotationAndSize(a0)
		beq.s	loc_759C
		bset	#$03,TileSource(a0)
		bra.s	loc_75A2
; ---------------------------------------------------------------------------

loc_759C:					  ; CODE XREF: sub_7274+31Ej
		bclr	#$03,TileSource(a0)

loc_75A2:					  ; CODE XREF: sub_7274+326j
		move.b	Unk0D(a0),d0
		andi.b	#$03,d0
		bne.s	locret_75C8
		move.b	Unk0D(a0),d0
		andi.w	#$000C,d0
		lsr.b	#$01,d0
		move.w	FrameNumbers(pc,d0.w),AnimationFrame(a0)
		bset	#$07,Unk0A(a0)
		bset	#$07,Unk48(a0)

locret_75C8:					  ; CODE XREF: sub_7274+336j
		rts
; END OF FUNCTION CHUNK	FOR sub_7274
; ---------------------------------------------------------------------------
FrameNumbers:	dc.w $0000,$0004,$0000,$0008
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7274

PlayerTakeDamage:				  ; CODE XREF: sub_7274+3Aj
		bsr.w	sub_739A
		clr.w	AnimationFrame(a0)
		move.b	RotationAndSize(a0),d0
		andi.b	#$C0,d0
		beq.s	loc_75FA
		cmpi.b	#$80,d0
		beq.s	loc_7616
		bcs.s	loc_7608
		move.w	#$0044,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_75FA:					  ; CODE XREF: sub_7274+36Ej
		move.w	#$0044,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_7608:					  ; CODE XREF: sub_7274+376j
		move.w	#$0048,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts
; ---------------------------------------------------------------------------

loc_7616:					  ; CODE XREF: sub_7274+374j
		move.w	#$0048,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts
; END OF FUNCTION CHUNK	FOR sub_7274
