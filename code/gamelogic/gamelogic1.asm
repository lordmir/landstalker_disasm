; ---------------------------------------------------------------------------

ResetGame:					  ; CODE XREF: ROM:000004D6j
						  ; ROM:00000510j
		lea	(ResetSP).w,sp
		jsr	(j_DisplaySegaLogo).l
		jsr	(j_DisplayTitle).l
		bcc.w	ResetAll

loc_16CA:					  ; CODE XREF: ROM:000004F8j
		bsr.w	LoadGame
		bsr.w	StartGame

loc_16D2:					  ; CODE XREF: ROM:000016D6j
		bsr.w	GameLoop
		bcc.s	loc_16D2
		bra.w	GameOver

; =============== S U B	R O U T	I N E =======================================


GameLoop:					  ; CODE XREF: ROM:loc_16D2p
		bsr.w	ProcessFloorType
		andi.w	#$1000,(Player_Action).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		bsr.w	ProcessControlScript
		bsr.w	CheckForMenuOpen
		bsr.w	CheckForDebugButtons
		bsr.w	CheckForDebugSaveGame
		bsr.w	CheckForLadderClimb
		bsr.w	ProcessActionButton
		bsr.w	HandleDirectionalInput
		jsr	(j_HandleAttack).l
		jsr	(sub_10358).l
		bsr.w	sub_24F4
		bsr.w	sub_21DE
		jsr	(j_UpdateEntities).l
		bsr.w	sub_2540
		bsr.w	sub_1858
		bsr.w	sub_17EE
		jsr	(sub_103D8).l
		jsr	(sub_1034C).l
		bsr.w	sub_7274
		jsr	(j_UpdateFrames).l
		jsr	(j_LoadPlayerSpecialAnimation).l
		jsr	(LoadSprites).l
		jsr	(sub_9DA2).l
		jsr	(sub_10380).l
		jsr	CheckAndDoLavaPaletteFx(pc)
		nop
		jsr	(CheckAndDisplayIntroString).l
		jsr	(j_RefreshHUD).l
		bsr.w	sub_249A
		bsr.w	EnableVRAMCopyQueueProcessing
		bsr.w	EnableDMAQueueProcessing
		move.w	(SlowDown).w,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames
		jsr	(sub_10384).l
		tst.b	d0
		rts
; End of function GameLoop


; =============== S U B	R O U T	I N E =======================================


ProcessControlScript:				  ; CODE XREF: GameLoop+Cp
		move.w	(g_ControllerPlayback).l,d0
		beq.s	loc_17C6
		move.b	(g_ControllerPlayback).l,(g_Controller1State).l
		cmpi.b	#$FE,d0
		beq.s	locret_17BE
		subq.b	#$01,d0
		bne.s	loc_17B8
		movea.l	(g_InputPlaybackAddr).l,a0
		move.b	(a0)+,d0
		bmi.s	loc_17C0
		lsl.w	#$08,d0
		move.b	(a0)+,d0
		move.l	a0,(g_InputPlaybackAddr).l

loc_17B8:					  ; CODE XREF: ProcessControlScript+1Aj
		move.w	d0,(g_ControllerPlayback).l

locret_17BE:					  ; CODE XREF: ProcessControlScript+16j
		rts
; ---------------------------------------------------------------------------

loc_17C0:					  ; CODE XREF: ProcessControlScript+24j
		clr.w	(g_ControllerPlayback).l

loc_17C6:					  ; CODE XREF: ProcessControlScript+6j
		tst.b	(g_PlayerAnimation).l
		bne.s	loc_17E6
		bsr.w	UpdateControllerInputs
		btst	#$02,(g_PlayerStatus).l
		beq.s	locret_17E4
		andi.b	#CTRLBF_START,(g_Controller1State).l

locret_17E4:					  ; CODE XREF: ProcessControlScript+52j
		rts
; ---------------------------------------------------------------------------

loc_17E6:					  ; CODE XREF: ProcessControlScript+44j
		clr.b	(g_Controller1State).l
		rts
; End of function ProcessControlScript


; =============== S U B	R O U T	I N E =======================================


sub_17EE:					  ; CODE XREF: GameLoop+4Ap

; FUNCTION CHUNK AT 0000192A SIZE 0000000C BYTES

		move.w	(Player_SpriteUnderneath).l,d0
		bmi.s	locret_1856
		lea	(Player_X).l,a0
		adda.w	d0,a0
		move.w	(g_PlayerSpeed).l,d2
		move.b	Speed(a0),d0
		andi.w	#$000F,d0
		beq.s	locret_1856
		move.w	d0,(g_PlayerSpeed).l
		bset	#$03,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		move.b	Action1(a0),d1
		move.b	#$09,d0
		lsr.b	#$01,d1
		bcs.w	loc_192A
		move.b	#$06,d0
		lsr.b	#$01,d1
		bcs.w	loc_192A
		move.b	#$05,d0
		lsr.b	#$01,d1
		bcs.w	loc_192A
		move.b	#$0A,d0
		lsr.b	#$01,d1
		bcs.w	loc_192A
		move.w	d2,(g_PlayerSpeed).l
		bclr	#$03,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage

locret_1856:					  ; CODE XREF: sub_17EE+6j
						  ; sub_17EE+1Ej
		rts
; End of function sub_17EE


; =============== S U B	R O U T	I N E =======================================


sub_1858:					  ; CODE XREF: GameLoop+46p

; FUNCTION CHUNK AT 00002242 SIZE 000001AE BYTES
; FUNCTION CHUNK AT 000023F2 SIZE 00000018 BYTES

		move.w	(Player_SpriteUnderneath).l,d0
		bmi.s	locret_18C2
		lea	(Player_X).l,a0
		adda.w	d0,a0
		btst	#$05,Action1(a0)
		beq.s	loc_188E
		move.w	HitBoxZEnd(a0),d7
		sub.w	(Player_Z).l,d7
		addq.w	#$01,d7
		beq.s	locret_18C2
		add.w	d7,(Player_Z).l
		add.w	d7,(Player_HitBoxZEnd).l
		bra.w	loc_2326
; ---------------------------------------------------------------------------

loc_188E:					  ; CODE XREF: sub_1858+16j
		btst	#$04,Action1(a0)
		beq.s	locret_18C2
		move.w	(Player_Z).l,d7
		sub.w	HitBoxZEnd(a0),d7
		subq.w	#$01,d7
		beq.s	locret_18C2
		lea	(Player_X).l,a0
		bsr.w	sub_32C6
		move.b	d5,d7
		beq.s	locret_18C2
		sub.w	d7,(Player_Z).l
		sub.w	d7,(Player_HitBoxZEnd).l
		bra.w	loc_2242
; ---------------------------------------------------------------------------

locret_18C2:					  ; CODE XREF: sub_1858+6j
						  ; sub_1858+24j ...
		rts
; End of function sub_1858


; =============== S U B	R O U T	I N E =======================================


HandleDirectionalInput:				  ; CODE XREF: GameLoop+24p
		bclr	#$06,(g_PlayerStatus).l
		clr.w	d0
		bsr.w	CheckForCollision
		bcc.s	loc_18DC
		bset	#$06,(g_PlayerStatus).l

loc_18DC:					  ; CODE XREF: HandleDirectionalInput+Ej
		tst.w	(DebugModeEnable).w
		bmi.s	loc_18F4
		move.w	#$0008,(g_PlayerSpeed).l
		btst	#CTRL_C,(g_Controller2State).l
		bne.s	loc_18FC

loc_18F4:					  ; CODE XREF: HandleDirectionalInput+1Cj
		move.w	#$0002,(g_PlayerSpeed).l

loc_18FC:					  ; CODE XREF: HandleDirectionalInput+2Ej
		move.b	(g_Controller1State).l,d0
		lea	(Player_X).l,a5
		andi.b	#$0F,d0
		tst.w	(g_ControllerPlayback).l
		bne.s	loc_1922
		move.b	(g_PlayerStatus).l,d1
		andi.b	#$02,d1			  ; Confusion
		lsl.b	#$03,d1
		or.b	d1,d0

loc_1922:					  ; CODE XREF: HandleDirectionalInput+4Ej
						  ; sub_17EE+146j
		lsl.b	#$02,d0
		ext.w	d0
		jmp	HandleDirectionalControl(pc,d0.w)
; End of function HandleDirectionalInput

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_17EE

loc_192A:					  ; CODE XREF: sub_17EE+38j
						  ; sub_17EE+42j ...
		lea	(Player_X).l,a5
		andi.b	#$0F,d0
		bra.s	loc_1922
; END OF FUNCTION CHUNK	FOR sub_17EE

; =============== S U B	R O U T	I N E =======================================


HandleDirectionalControl:

; FUNCTION CHUNK AT 00001B7E SIZE 00000188 BYTES
; FUNCTION CHUNK AT 00001D16 SIZE 00000172 BYTES
; FUNCTION CHUNK AT 00001E98 SIZE 0000018A BYTES
; FUNCTION CHUNK AT 00002024 SIZE 0000006A BYTES
; FUNCTION CHUNK AT 0000209E SIZE 000000DA BYTES

		bra.w	locret_19B6		  ; No input
; ---------------------------------------------------------------------------
		bra.w	HandleUpButton		  ; UP selected
; ---------------------------------------------------------------------------
		bra.w	HandleDownButton	  ; DOWN selected
; ---------------------------------------------------------------------------
		bra.w	locret_19B6		  ; UP + DOWN selected
; ---------------------------------------------------------------------------
		bra.w	HandleLeftButton	  ; LEFT selected
; ---------------------------------------------------------------------------
		bra.w	HandleUpLeft		  ; UP + LEFT selected
; ---------------------------------------------------------------------------
		bra.w	HandleDownLeft		  ; DOWN + LEFT	selected
; ---------------------------------------------------------------------------
		bra.w	locret_19B6		  ; UP + DOWN +	LEFT selected
; ---------------------------------------------------------------------------
		bra.w	HandleRightButton	  ; RIGHT selected
; ---------------------------------------------------------------------------
		bra.w	HandleUpRight		  ; RIGHT + UP selected
; ---------------------------------------------------------------------------
		bra.w	HandleDownRight		  ; RIGHT + DOWN selected
; ---------------------------------------------------------------------------
		bra.w	locret_19B6		  ; RIGHT + UP + DOWN selected
; ---------------------------------------------------------------------------
		bra.w	locret_19B6		  ; RIGHT + LEFT selected
; ---------------------------------------------------------------------------
		bra.w	locret_19B6		  ; RIGHT + LEFT + UP selected
; ---------------------------------------------------------------------------
		bra.w	locret_19B6		  ; RIGHT + LEFT + DOWN	selected
; ---------------------------------------------------------------------------
		bra.w	locret_19B6		  ; RIGHT + LEFT + UP +	DOWN selected
; ---------------------------------------------------------------------------
		bra.w	locret_19B6		  ; No input, confusion
; ---------------------------------------------------------------------------
		bra.w	HandleDownButton	  ; UP selected, confusion
; ---------------------------------------------------------------------------
		bra.w	HandleUpButton		  ; DOWN selected, confusion
; ---------------------------------------------------------------------------
		bra.w	locret_19B6		  ; UP + DOWN selected,	confusion
; ---------------------------------------------------------------------------
		bra.w	HandleRightButton	  ; LEFT selected, confusion
; ---------------------------------------------------------------------------
		bra.w	HandleDownRight		  ; LEFT + UP selected,	confusion
; ---------------------------------------------------------------------------
		bra.w	HandleUpRight		  ; LEFT + DOWN	selected, confusion
; ---------------------------------------------------------------------------
		bra.w	locret_19B6		  ; LEFT + UP +	DOWN selected, confusion
; ---------------------------------------------------------------------------
		bra.w	HandleLeftButton	  ; RIGHT selected, confusion
; ---------------------------------------------------------------------------
		bra.w	HandleDownLeft		  ; RIGHT + UP selected, confusion
; ---------------------------------------------------------------------------
		bra.w	HandleUpLeft		  ; RIGHT + DOWN selected, confusion
; ---------------------------------------------------------------------------
		bra.w	locret_19B6		  ; RIGHT + UP + DOWN selected,	confusion
; ---------------------------------------------------------------------------
		bra.w	locret_19B6		  ; RIGHT + LEFT selected, confusion
; ---------------------------------------------------------------------------
		bra.w	locret_19B6		  ; RIGHT + LEFT + UP selected,	confusion
; ---------------------------------------------------------------------------
		bra.w	locret_19B6		  ; RIGHT + LEFT + DOWN	selected, confusion
; ---------------------------------------------------------------------------
		bra.w	*+4			  ; RIGHT + LEFT + UP +	DOWN selected, confusion
; ---------------------------------------------------------------------------

locret_19B6:					  ; CODE XREF: HandleDirectionalControlj
						  ; HandleDirectionalControl+Cj ...
		rts
; ---------------------------------------------------------------------------

HandleUpButton:					  ; CODE XREF: HandleDirectionalControl+4j
						  ; HandleDirectionalControl+48j
		tst.b	(g_PlayerStatus).l
		bmi.s	loc_19CE
		btst	#$06,RotationAndSize(a5)
		beq.w	HandleUpRight		  ; Travel in the NE (-Y) direction
		bra.w	HandleUpLeft		  ; Travel in the NW (-X) direction
; ---------------------------------------------------------------------------

loc_19CE:					  ; CODE XREF: HandleDirectionalControl+88j
		btst	#$06,RotationAndSize(a5)
		beq.w	HandleUpLeft		  ; Travel in the NW (-X) direction
		bra.w	HandleUpRight		  ; Travel in the NE (-Y) direction
; ---------------------------------------------------------------------------

HandleRightButton:				  ; CODE XREF: HandleDirectionalControl+20j
						  ; HandleDirectionalControl+50j
		tst.b	(g_PlayerStatus).l
		bmi.s	loc_19F2
		btst	#$06,RotationAndSize(a5)
		beq.w	HandleUpRight		  ; Travel in the NE (-Y) direction
		bra.w	HandleDownRight		  ; Travel in the SE (+X) direction
; ---------------------------------------------------------------------------

loc_19F2:					  ; CODE XREF: HandleDirectionalControl+ACj
		btst	#$06,RotationAndSize(a5)
		beq.w	HandleDownRight		  ; Travel in the SE (+X) direction
		bra.w	HandleUpRight		  ; Travel in the NE (-Y) direction
; ---------------------------------------------------------------------------

HandleDownButton:				  ; CODE XREF: HandleDirectionalControl+8j
						  ; HandleDirectionalControl+44j
		tst.b	(g_PlayerStatus).l
		bmi.s	loc_1A16
		btst	#$06,RotationAndSize(a5)
		beq.w	HandleDownLeft		  ; Travel in the SW (+Y) direction
		bra.w	HandleDownRight		  ; Travel in the SE (+X) direction
; ---------------------------------------------------------------------------

loc_1A16:					  ; CODE XREF: HandleDirectionalControl+D0j
		btst	#$06,RotationAndSize(a5)
		beq.w	HandleDownRight		  ; Travel in the SE (+X) direction
		bra.w	HandleDownLeft		  ; Travel in the SW (+Y) direction
; ---------------------------------------------------------------------------

HandleLeftButton:				  ; CODE XREF: HandleDirectionalControl+10j
						  ; HandleDirectionalControl+60j
		tst.b	(g_PlayerStatus).l
		bmi.s	loc_1A3A
		btst	#$06,RotationAndSize(a5)
		beq.w	HandleDownLeft		  ; Travel in the SW (+Y) direction
		bra.w	HandleUpLeft		  ; Travel in the NW (-X) direction
; ---------------------------------------------------------------------------

loc_1A3A:					  ; CODE XREF: HandleDirectionalControl+F4j
		btst	#$06,RotationAndSize(a5)
		beq.w	HandleUpLeft		  ; Travel in the NW (-X) direction
		bra.w	HandleDownLeft		  ; Travel in the SW (+Y) direction
; ---------------------------------------------------------------------------

HandleUpRight:					  ; CODE XREF: HandleDirectionalControl+24j
						  ; HandleDirectionalControl+58j ...
		tst.w	(g_ControllerPlayback).l  ; Travel in the NE (-Y) direction
		bne.s	loc_1A58
		bclr	#$07,(g_PlayerStatus).l

loc_1A58:					  ; CODE XREF: HandleDirectionalControl+118j
		move.w	HitBoxYStart(a5),d1
		move.w	(g_PlayerSpeed).l,d0
		sub.w	d0,HitBoxYStart(a5)
		sub.w	d0,HitBoxYEnd(a5)
		move.w	HitBoxYStart(a5),d0
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.w	loc_1B36
		bsr.w	sub_30E4
		bcc.w	loc_1B36
		btst	#$03,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		beq.s	loc_1A98
		btst	#$04,GroundHeight(a0)
		bne.w	loc_1B36

loc_1A98:					  ; CODE XREF: HandleDirectionalControl+156j
		bsr.w	sub_1B6E
		move.b	SubX(a5),d2
		addq.b	#$01,d2
		andi.b	#$FE,d2
		cmpi.b	#$08,d2
		bne.s	loc_1B0A
		move.b	GroundType(a5),d2
		andi.b	#$3F,d2
		cmpi.b	#FLOOR_LADDER_NE,d2
		bne.s	loc_1B0A
		bsr.w	sub_33EA
		tst.w	d5
		bne.s	loc_1AC4
		rts
; ---------------------------------------------------------------------------

loc_1AC4:					  ; CODE XREF: HandleDirectionalControl+18Aj
		addq.w	#$01,Z(a5)
		addq.w	#$01,HitBoxZEnd(a5)
		bset	#$04,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		bne.s	loc_1AE6
		clr.w	AnimationFrame(a5)
		move.b	#$FF,Unk0D(a5)
		andi.b	#$E0,JumpRate(a5)

loc_1AE6:					  ; CODE XREF: HandleDirectionalControl+19Ej
		andi.b	#$3F,RotationAndSize(a5)
		addq.b	#$01,Unk0D(a5)
		clr.b	FallRate(a5)
		move.b	(byte_FF0F9D).l,d7
		andi.b	#$03,d7
		bne.s	loc_1B04
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_JumpLand
; ---------------------------------------------------------------------------

loc_1B04:					  ; CODE XREF: HandleDirectionalControl+1C8j
		moveq	#$00000001,d7
		bra.w	loc_2326
; ---------------------------------------------------------------------------

loc_1B0A:					  ; CODE XREF: HandleDirectionalControl+174j
						  ; HandleDirectionalControl+182j
		bclr	#$04,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		move.w	#$0001,(g_PlayerSpeed).l
		andi.b	#$3F,d5
		cmpi.b	#$0E,d5
		beq.w	loc_1C38
		cmp.b	d0,d3
		bcc.w	HandleUpLeft		  ; Travel in the NW (-X) direction
		cmp.b	d1,d3
		bcc.w	HandleDownRight		  ; Travel in the SE (+X) direction
		bra.w	loc_1C38
; ---------------------------------------------------------------------------

loc_1B36:					  ; CODE XREF: HandleDirectionalControl+142j
						  ; HandleDirectionalControl+14Aj ...
		bclr	#$04,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		clr.w	d0
		tst.b	(byte_FF1142).l
		beq.s	loc_1B4E

loc_1B48:					  ; CODE XREF: HandleDirectionalControl+220j
		bsr.w	sub_3058
		bra.s	loc_1B5C
; ---------------------------------------------------------------------------

loc_1B4E:					  ; CODE XREF: HandleDirectionalControl+210j
		btst	#$06,(g_PlayerStatus).l
		bne.s	loc_1B48
		bsr.w	CollisionDetect

loc_1B5C:					  ; CODE XREF: HandleDirectionalControl+216j
		bcc.s	loc_1B7E
		tst.b	Flags2(a0)
		bpl.s	loc_1B68
		bsr.w	sub_25B2

loc_1B68:					  ; CODE XREF: HandleDirectionalControl+22Cj
		bsr.s	sub_1B6E
		bra.w	loc_1C38
; End of function HandleDirectionalControl


; =============== S U B	R O U T	I N E =======================================


sub_1B6E:					  ; CODE XREF: HandleDirectionalControl:loc_1A98p
						  ; HandleDirectionalControl:loc_1B68p	...
		move.w	(g_PlayerSpeed).l,d2
		add.w	d2,HitBoxYStart(a5)
		add.w	d2,HitBoxYEnd(a5)
		rts
; End of function sub_1B6E

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR HandleDirectionalControl

loc_1B7E:					  ; CODE XREF: HandleDirectionalControl:loc_1B5Cj
		btst	#$04,Flags1(a5)
		beq.s	loc_1B8E
		lsr	(g_PlayerSpeed).l
		bsr.s	sub_1B6E

loc_1B8E:					  ; CODE XREF: HandleDirectionalControl+24Ej
		move.w	CentreY(a5),d0
		move.b	d0,d1
		sub.w	(g_PlayerSpeed).l,d0
		move.w	d0,CentreY(a5)
		andi.b	#$0F,d0
		move.b	d0,SubY(a5)
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.s	loc_1BD0
		subq.b	#$01,(Player_Y).l
		subi.w	#$0094,(Player_HeightmapOffset).l
		movea.w	HeightmapOffset(a5),a6
		move.w	GroundHeight(a5),(word_FF1208).l
		move.w	(a6),GroundHeight(a5)

loc_1BD0:					  ; CODE XREF: HandleDirectionalControl+27Aj
		move.w	(word_FF1202).l,d0
		move.b	d0,d1
		sub.w	(g_PlayerSpeed).l,d0
		move.w	d0,(word_FF1202).l
		andi.b	#$0F,d0
		move.b	d0,(word_FF1126+1).l
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.s	loc_1C30
		subq.b	#$01,(g_PlayerYFlattened).l
		subi.w	#$0020,(g_BlockTableIndex).l
		bpl.s	loc_1C24
		addi.w	#$0210,(g_BlockTableIndex).l
		cmpi.w	#$0200,(g_BlockTableIndex).l
		bcs.s	loc_1C24
		subi.w	#$0020,(g_BlockTableIndex).l

loc_1C24:					  ; CODE XREF: HandleDirectionalControl+2D2j
						  ; HandleDirectionalControl+2E4j
		jsr	(LoadRightTiles).l
		jsr	(LoadTopTiles).l

loc_1C30:					  ; CODE XREF: HandleDirectionalControl+2C2j
		bsr.w	sub_240A
		bsr.w	sub_2436

loc_1C38:					  ; CODE XREF: HandleDirectionalControl+1ECj
						  ; HandleDirectionalControl+1FCj ...
		bclr	#$03,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		bne.s	locret_1C5A
		andi.b	#$3F,(Player_RotationAndSize).l
		bset	#$00,(Player_Action+1).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		bset	#$00,(Player_Unk6D).l

locret_1C5A:					  ; CODE XREF: HandleDirectionalControl+30Aj
		rts
; ---------------------------------------------------------------------------

HandleDownRight:				  ; CODE XREF: HandleDirectionalControl+28j
						  ; HandleDirectionalControl+54j ...
		tst.w	(g_ControllerPlayback).l  ; Travel in the SE (+X) direction
		bne.s	loc_1C6C
		bclr	#$07,(g_PlayerStatus).l

loc_1C6C:					  ; CODE XREF: HandleDirectionalControl+32Cj
		bclr	#$04,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		move.w	HitBoxXEnd(a5),d1
		move.w	(g_PlayerSpeed).l,d0
		add.w	d0,HitBoxXStart(a5)
		add.w	d0,HitBoxXEnd(a5)
		move.w	HitBoxXEnd(a5),d0
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bls.s	loc_1CD6
		bsr.w	sub_3146
		bcc.s	loc_1CD6
		btst	#$03,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		beq.s	loc_1CB0
		btst	#$04,GroundHeight(a0)
		bne.w	loc_1CD6

loc_1CB0:					  ; CODE XREF: HandleDirectionalControl+36Ej
		bsr.s	sub_1D06
		move.w	#$0001,(g_PlayerSpeed).l
		andi.b	#$3F,d5
		cmpi.b	#$0E,d5
		beq.w	loc_1DC6
		cmp.b	d0,d3
		bcc.w	HandleUpRight		  ; Travel in the NE (-Y) direction
		cmp.b	d1,d3
		bcc.w	HandleDownLeft		  ; Travel in the SW (+Y) direction
		bra.w	loc_1DC6
; ---------------------------------------------------------------------------

loc_1CD6:					  ; CODE XREF: HandleDirectionalControl+35Ej
						  ; HandleDirectionalControl+364j ...
		clr.w	d0
		tst.b	(byte_FF1142).l
		beq.s	loc_1CE6

loc_1CE0:					  ; CODE XREF: HandleDirectionalControl+3B8j
		bsr.w	sub_3058
		bra.s	loc_1CF4
; ---------------------------------------------------------------------------

loc_1CE6:					  ; CODE XREF: HandleDirectionalControl+3A8j
		btst	#$06,(g_PlayerStatus).l
		bne.s	loc_1CE0
		bsr.w	CollisionDetect

loc_1CF4:					  ; CODE XREF: HandleDirectionalControl+3AEj
		bcc.s	loc_1D16
		tst.b	Flags2(a0)
		bpl.s	loc_1D00
		bsr.w	sub_25B2

loc_1D00:					  ; CODE XREF: HandleDirectionalControl+3C4j
		bsr.s	sub_1D06
		bra.w	loc_1DC6
; END OF FUNCTION CHUNK	FOR HandleDirectionalControl

; =============== S U B	R O U T	I N E =======================================


sub_1D06:					  ; CODE XREF: HandleDirectionalControl:loc_1CB0p
						  ; HandleDirectionalControl:loc_1D00p	...
		move.w	(g_PlayerSpeed).l,d2
		sub.w	d2,HitBoxXStart(a5)
		sub.w	d2,HitBoxXEnd(a5)
		rts
; End of function sub_1D06

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR HandleDirectionalControl

loc_1D16:					  ; CODE XREF: HandleDirectionalControl:loc_1CF4j
		btst	#$04,Flags1(a5)
		beq.s	loc_1D26
		lsr	(g_PlayerSpeed).l
		bsr.s	sub_1D06

loc_1D26:					  ; CODE XREF: HandleDirectionalControl+3E6j
		move.w	CentreX(a5),d0
		move.b	d0,d1
		add.w	(g_PlayerSpeed).l,d0
		move.w	d0,CentreX(a5)
		andi.b	#$0F,d0
		move.b	d0,SubX(a5)
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d1,d0
		bcc.s	loc_1D66
		addq.b	#$01,(Player_X).l
		addi.w	#$0002,HeightmapOffset(a5)
		movea.w	HeightmapOffset(a5),a6
		move.w	GroundHeight(a5),(word_FF1208).l
		move.w	(a6),GroundHeight(a5)

loc_1D66:					  ; CODE XREF: HandleDirectionalControl+412j
		move.w	(word_FF1200).l,d0
		move.b	d0,d1
		add.w	(g_PlayerSpeed).l,d0
		move.w	d0,(word_FF1200).l
		andi.b	#$0F,d0
		move.b	d0,(word_FF1126).l
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d1,d0
		bcc.s	loc_1DBE
		addq.b	#$01,(g_PlayerXFlattened).l
		move.w	(g_BlockTableIndex).l,d0
		addq.w	#$01,d0
		move.w	d0,(g_BlockTableIndex).l
		andi.w	#$001F,d0
		bne.s	loc_1DB2
		subi.w	#$0020,(g_BlockTableIndex).l

loc_1DB2:					  ; CODE XREF: HandleDirectionalControl+472j
		jsr	(LoadRightTiles).l
		jsr	(LoadBottomTiles).l

loc_1DBE:					  ; CODE XREF: HandleDirectionalControl+458j
		bsr.w	sub_2452
		bsr.w	sub_2436

loc_1DC6:					  ; CODE XREF: HandleDirectionalControl+38Cj
						  ; HandleDirectionalControl+39Cj ...
		bclr	#$03,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		bne.s	locret_1DF0
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$40,(Player_RotationAndSize).l
		bset	#$03,(Player_Action+1).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		bset	#$03,(Player_Unk6D).l

locret_1DF0:					  ; CODE XREF: HandleDirectionalControl+498j
		rts
; ---------------------------------------------------------------------------

HandleDownLeft:					  ; CODE XREF: HandleDirectionalControl+18j
						  ; HandleDirectionalControl+64j ...
		tst.w	(g_ControllerPlayback).l  ; Travel in the SW (+Y) direction
		bne.s	loc_1E02
		bclr	#$07,(g_PlayerStatus).l

loc_1E02:					  ; CODE XREF: HandleDirectionalControl+4C2j
		bclr	#$04,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		move.w	HitBoxYEnd(a5),d1
		move.w	(g_PlayerSpeed).l,d0
		add.w	d0,HitBoxYStart(a5)
		add.w	d0,HitBoxYEnd(a5)
		move.w	HitBoxYEnd(a5),d0
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bls.s	loc_1E58
		bsr.w	sub_30DC
		bcc.s	loc_1E58
		bsr.s	sub_1E88
		move.w	#$0001,(g_PlayerSpeed).l
		andi.b	#$3F,d5
		cmpi.b	#$0E,d5
		beq.w	loc_1F50
		cmp.b	d0,d3
		bcc.w	HandleUpLeft		  ; Travel in the NW (-X) direction
		cmp.b	d1,d3
		bcc.w	HandleDownRight		  ; Travel in the SE (+X) direction
		bra.w	loc_1F50
; ---------------------------------------------------------------------------

loc_1E58:					  ; CODE XREF: HandleDirectionalControl+4F4j
						  ; HandleDirectionalControl+4FAj
		clr.w	d0
		tst.b	(byte_FF1142).l
		beq.s	loc_1E68

loc_1E62:					  ; CODE XREF: HandleDirectionalControl+53Aj
		bsr.w	sub_3058
		bra.s	loc_1E76
; ---------------------------------------------------------------------------

loc_1E68:					  ; CODE XREF: HandleDirectionalControl+52Aj
		btst	#$06,(g_PlayerStatus).l
		bne.s	loc_1E62
		bsr.w	CollisionDetect

loc_1E76:					  ; CODE XREF: HandleDirectionalControl+530j
		bcc.s	loc_1E98
		tst.b	Flags2(a0)
		bpl.s	loc_1E82
		bsr.w	sub_25B2

loc_1E82:					  ; CODE XREF: HandleDirectionalControl+546j
		bsr.s	sub_1E88
		bra.w	loc_1F50
; END OF FUNCTION CHUNK	FOR HandleDirectionalControl

; =============== S U B	R O U T	I N E =======================================


sub_1E88:					  ; CODE XREF: HandleDirectionalControl+4FCp
						  ; HandleDirectionalControl:loc_1E82p	...
		move.w	(g_PlayerSpeed).l,d2
		sub.w	d2,HitBoxYStart(a5)
		sub.w	d2,HitBoxYEnd(a5)
		rts
; End of function sub_1E88

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR HandleDirectionalControl

loc_1E98:					  ; CODE XREF: HandleDirectionalControl:loc_1E76j
		btst	#$04,Flags1(a5)
		beq.s	loc_1EA8
		lsr	(g_PlayerSpeed).l
		bsr.s	sub_1E88

loc_1EA8:					  ; CODE XREF: HandleDirectionalControl+568j
		move.w	CentreY(a5),d0
		move.b	d0,d1
		add.w	(g_PlayerSpeed).l,d0
		move.w	d0,CentreY(a5)
		andi.b	#$0F,d0
		move.b	d0,SubY(a5)
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d1,d0
		bcc.s	loc_1EE8
		addq.b	#$01,(Player_Y).l
		addi.w	#$0094,HeightmapOffset(a5)
		movea.w	HeightmapOffset(a5),a6
		move.w	GroundHeight(a5),(word_FF1208).l
		move.w	(a6),GroundHeight(a5)

loc_1EE8:					  ; CODE XREF: HandleDirectionalControl+594j
		move.w	(word_FF1202).l,d0
		move.b	d0,d1
		add.w	(g_PlayerSpeed).l,d0
		move.w	d0,(word_FF1202).l
		andi.b	#$0F,d0
		move.b	d0,(word_FF1126+1).l
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d1,d0
		bcc.s	loc_1F48
		addq.b	#$01,(g_PlayerYFlattened).l
		addi.w	#$0020,(g_BlockTableIndex).l
		cmpi.w	#$0200,(g_BlockTableIndex).l
		bcs.s	loc_1F3C
		subi.w	#$0210,(g_BlockTableIndex).l
		bpl.s	loc_1F3C
		addi.w	#$0020,(g_BlockTableIndex).l

loc_1F3C:					  ; CODE XREF: HandleDirectionalControl+5F2j
						  ; HandleDirectionalControl+5FCj
		jsr	(LoadBottomTiles).l
		jsr	(LoadLeftTiles).l

loc_1F48:					  ; CODE XREF: HandleDirectionalControl+5DAj
		bsr.w	sub_2452
		bsr.w	sub_247E

loc_1F50:					  ; CODE XREF: HandleDirectionalControl+50Ej
						  ; HandleDirectionalControl+51Ej ...
		bclr	#$03,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		bne.s	locret_1F7A
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$80,(Player_RotationAndSize).l
		bset	#$01,(Player_Action+1).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		bset	#$01,(Player_Unk6D).l

locret_1F7A:					  ; CODE XREF: HandleDirectionalControl+622j
		rts
; ---------------------------------------------------------------------------

HandleUpLeft:					  ; CODE XREF: HandleDirectionalControl+14j
						  ; HandleDirectionalControl+68j ...
		tst.w	(g_ControllerPlayback).l  ; Travel in the NW (-X) direction
		bne.s	loc_1F8C
		bclr	#$07,(g_PlayerStatus).l

loc_1F8C:					  ; CODE XREF: HandleDirectionalControl+64Cj
		move.w	HitBoxXStart(a5),d1
		move.w	(g_PlayerSpeed).l,d0
		sub.w	d0,HitBoxXStart(a5)
		sub.w	d0,HitBoxXEnd(a5)
		move.w	HitBoxXStart(a5),d0
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.w	loc_2056
		bsr.w	sub_313E
		bcc.w	loc_2056
		bsr.w	sub_208E
		move.b	SubX(a5),d2
		addq.b	#$01,d2
		andi.b	#$FE,d2
		cmpi.b	#$08,d2
		bne.s	loc_202A
		move.b	GroundType(a5),d2
		andi.b	#$3F,d2
		cmpi.b	#FLOOR_LADDER_NW,d2
		bne.s	loc_202A
		bsr.w	sub_33EA
		tst.w	d5
		bne.s	loc_1FE4
		rts
; ---------------------------------------------------------------------------

loc_1FE4:					  ; CODE XREF: HandleDirectionalControl+6AAj
		addq.w	#$01,Z(a5)
		addq.w	#$01,HitBoxZEnd(a5)
		bset	#$04,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		bne.s	loc_2006
		clr.w	AnimationFrame(a5)
		move.b	#$FF,Unk0D(a5)
		andi.w	#$60E0,FallRate(a5)

loc_2006:					  ; CODE XREF: HandleDirectionalControl+6BEj
		ori.b	#$C0,RotationAndSize(a5)
		addq.b	#$01,Unk0D(a5)
		clr.b	FallRate(a5)
		move.b	(byte_FF0F9D).l,d7
		andi.b	#$03,d7
		bne.s	loc_2024
		trap	#$00			  ; Trap00Handler
; END OF FUNCTION CHUNK	FOR HandleDirectionalControl
; ---------------------------------------------------------------------------
		dc.w SND_JumpLand
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR HandleDirectionalControl

loc_2024:					  ; CODE XREF: HandleDirectionalControl+6E8j
		moveq	#$00000001,d7
		bra.w	loc_2326
; ---------------------------------------------------------------------------

loc_202A:					  ; CODE XREF: HandleDirectionalControl+694j
						  ; HandleDirectionalControl+6A2j
		bclr	#$04,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		move.w	#$0001,(g_PlayerSpeed).l
		andi.b	#$3F,d5
		cmpi.b	#$0E,d5
		beq.w	loc_2154
		cmp.b	d0,d3
		bcc.w	HandleUpRight		  ; Travel in the NE (-Y) direction
		cmp.b	d1,d3
		bcc.w	HandleDownLeft		  ; Travel in the SW (+Y) direction
		bra.w	loc_2154
; ---------------------------------------------------------------------------

loc_2056:					  ; CODE XREF: HandleDirectionalControl+676j
						  ; HandleDirectionalControl+67Ej
		bclr	#$04,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		clr.w	d0
		tst.b	(byte_FF1142).l
		beq.s	loc_206E

loc_2068:					  ; CODE XREF: HandleDirectionalControl+740j
		bsr.w	sub_3058
		bra.s	loc_207C
; ---------------------------------------------------------------------------

loc_206E:					  ; CODE XREF: HandleDirectionalControl+730j
		btst	#$06,(g_PlayerStatus).l
		bne.s	loc_2068
		bsr.w	CollisionDetect

loc_207C:					  ; CODE XREF: HandleDirectionalControl+736j
		bcc.s	loc_209E
		tst.b	Flags2(a0)
		bpl.s	loc_2088
		bsr.w	sub_25B2

loc_2088:					  ; CODE XREF: HandleDirectionalControl+74Cj
		bsr.s	sub_208E
		bra.w	loc_2154
; END OF FUNCTION CHUNK	FOR HandleDirectionalControl

; =============== S U B	R O U T	I N E =======================================


sub_208E:					  ; CODE XREF: HandleDirectionalControl+682p
						  ; HandleDirectionalControl:loc_2088p	...
		move.w	(g_PlayerSpeed).l,d2
		add.w	d2,HitBoxXStart(a5)
		add.w	d2,HitBoxXEnd(a5)
		rts
; End of function sub_208E

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR HandleDirectionalControl

loc_209E:					  ; CODE XREF: HandleDirectionalControl:loc_207Cj
		btst	#$04,Flags1(a5)
		beq.w	loc_20B0
		lsr	(g_PlayerSpeed).l
		bsr.s	sub_208E

loc_20B0:					  ; CODE XREF: HandleDirectionalControl+76Ej
		move.w	CentreX(a5),d0
		move.b	d0,d1
		sub.w	(g_PlayerSpeed).l,d0
		move.w	d0,CentreX(a5)
		andi.b	#$0F,d0
		move.b	d0,SubX(a5)
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.s	loc_20F0
		subq.b	#$01,(Player_X).l
		subi.w	#$0002,HeightmapOffset(a5)
		movea.w	HeightmapOffset(a5),a6
		move.w	GroundHeight(a5),(word_FF1208).l
		move.w	(a6),GroundHeight(a5)

loc_20F0:					  ; CODE XREF: HandleDirectionalControl+79Cj
		move.w	(word_FF1200).l,d0
		move.b	d0,d1
		sub.w	(g_PlayerSpeed).l,d0
		move.w	d0,(word_FF1200).l
		andi.b	#$0F,d0
		move.b	d0,(word_FF1126).l
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.s	loc_214C
		subq.b	#$01,(g_PlayerXFlattened).l
		move.w	(g_BlockTableIndex).l,d0
		subq.w	#$01,d0
		move.w	d0,(g_BlockTableIndex).l
		andi.w	#$001F,d0
		cmpi.w	#$001F,d0
		bne.s	loc_2140
		addi.w	#$0020,(g_BlockTableIndex).l

loc_2140:					  ; CODE XREF: HandleDirectionalControl+800j
		jsr	(LoadTopTiles).l
		jsr	(LoadLeftTiles).l

loc_214C:					  ; CODE XREF: HandleDirectionalControl+7E2j
		bsr.w	sub_240A
		bsr.w	sub_247E

loc_2154:					  ; CODE XREF: HandleDirectionalControl+70Cj
						  ; HandleDirectionalControl+71Cj ...
		bclr	#$03,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		bne.s	locret_2176
		ori.b	#$C0,(Player_RotationAndSize).l
		bset	#$02,(Player_Action+1).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		bset	#$02,(Player_Unk6D).l

locret_2176:					  ; CODE XREF: HandleDirectionalControl+826j
		rts
; END OF FUNCTION CHUNK	FOR HandleDirectionalControl

; =============== S U B	R O U T	I N E =======================================


CheckForLadderClimb:				  ; CODE XREF: GameLoop+1Cp
		move.b	(g_Controller1State).l,d1
		and.b	d1,(g_LadderClimbJumpState).l
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
		bne.s	locret_21AC
		bsr.s	sub_21AE
		tst.b	d7
		bne.w	loc_2242
		btst	#$04,(Player_Unk2F).l
		beq.s	loc_21A4
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_LadderClimb
; ---------------------------------------------------------------------------

loc_21A4:					  ; CODE XREF: CheckForLadderClimb+26j
		bsr.s	sub_21B6
		tst.b	d7
		bne.w	loc_2326

locret_21AC:					  ; CODE XREF: CheckForLadderClimb+14j
		rts
; End of function CheckForLadderClimb


; =============== S U B	R O U T	I N E =======================================


sub_21AE:					  ; CODE XREF: CheckForLadderClimb+16p
		bsr.w	sub_324C
		move.w	d6,d7
		rts
; End of function sub_21AE


; =============== S U B	R O U T	I N E =======================================


sub_21B6:					  ; CODE XREF: CheckForLadderClimb:loc_21A4p
		lea	(Player_X).l,a0
		move.w	Z(a0),d7
		movem.w	d7,-(sp)
		bsr.w	HandleJump
		movem.w	(sp)+,d6
		move.w	Z(a0),d7
		sub.w	d6,d7
		beq.s	locret_21DC
		bset	#$05,(Player_Action+1).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage

locret_21DC:					  ; CODE XREF: sub_21B6+1Cj
		rts
; End of function sub_21B6


; =============== S U B	R O U T	I N E =======================================


sub_21DE:					  ; CODE XREF: GameLoop+38p
		lea	(Sprite1_X).l,a0
		moveq	#$0000000E,d7

loc_21E6:					  ; CODE XREF: sub_21DE+4Ej
		cmpi.b	#SPR_MUMMY3,SpriteType(a0)
		bne.s	loc_21FC
		tst.b	Unk4D(a0)
		beq.s	loc_21FC
		andi.w	#$6700,QueuedAction(a0)
		bra.s	loc_2202
; ---------------------------------------------------------------------------

loc_21FC:					  ; CODE XREF: sub_21DE+Ej
						  ; sub_21DE+14j
		andi.w	#$6000,QueuedAction(a0)

loc_2202:					  ; CODE XREF: sub_21DE+1Cj
		move.b	(a0),d0
		bmi.s	locret_2230
		cmpi.b	#$7F,d0
		beq.s	loc_2228
		movem.l	d7-a0,-(sp)
		bsr.s	sub_2232
		tst.b	d7
		beq.s	loc_2222
		movem.l	(sp)+,d7-a0
		bset	#$04,Action1(a0)
		bra.s	loc_2228
; ---------------------------------------------------------------------------

loc_2222:					  ; CODE XREF: sub_21DE+36j
		bsr.s	sub_223A
		movem.l	(sp)+,d7-a0

loc_2228:					  ; CODE XREF: sub_21DE+2Cj
						  ; sub_21DE+42j
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,loc_21E6

locret_2230:					  ; CODE XREF: sub_21DE+26j
		rts
; End of function sub_21DE


; =============== S U B	R O U T	I N E =======================================


sub_2232:					  ; CODE XREF: sub_21DE+32p
		bsr.w	sub_3252
		move.w	d6,d7
		rts
; End of function sub_2232


; =============== S U B	R O U T	I N E =======================================


sub_223A:					  ; CODE XREF: sub_21DE:loc_2222p
		jsr	(sub_103D2).l
		rts
; End of function sub_223A

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1858

loc_2242:					  ; CODE XREF: sub_1858+66j
						  ; CheckForLadderClimb+1Aj
		clr.b	d1
		move.w	(word_FF1200).l,d2
		move.b	d2,d3
		add.w	d7,d2
		move.w	d2,(word_FF1200).l
		andi.b	#$0F,d2
		move.b	d2,(word_FF1126).l
		andi.b	#$08,d2
		andi.b	#$08,d3
		cmp.b	d3,d2
		bcc.s	loc_229C
		addq.b	#$01,(g_PlayerXFlattened).l
		move.w	(g_BlockTableIndex).l,d0
		addq.w	#$01,d0
		move.w	d0,(g_BlockTableIndex).l
		andi.w	#$001F,d0
		bne.s	loc_228C
		subi.w	#$0020,(g_BlockTableIndex).l

loc_228C:					  ; CODE XREF: sub_1858+A2Aj
		movem.w	d7,-(sp)
		jsr	(LoadBottomTiles).l
		movem.w	(sp)+,d7
		moveq	#$00000001,d1

loc_229C:					  ; CODE XREF: sub_1858+A10j
		move.w	(word_FF1202).l,d2
		move.b	d2,d3
		add.w	d7,d2
		move.w	d2,(word_FF1202).l
		andi.b	#$0F,d2
		move.b	d2,(word_FF1126+1).l
		andi.b	#$08,d2
		andi.b	#$08,d3
		cmp.b	d3,d2
		bcc.s	loc_230C
		addq.b	#$01,(g_PlayerYFlattened).l
		addi.w	#$0020,(g_BlockTableIndex).l
		cmpi.w	#$0200,(g_BlockTableIndex).l
		bcs.s	loc_22EC
		subi.w	#$0210,(g_BlockTableIndex).l
		bpl.s	loc_22EC
		addi.w	#$0020,(g_BlockTableIndex).l

loc_22EC:					  ; CODE XREF: sub_1858+A80j
						  ; sub_1858+A8Aj
		movem.w	d7,-(sp)
		tst.b	d1
		bne.s	loc_22FA
		jsr	(LoadLeftTiles).l

loc_22FA:					  ; CODE XREF: sub_1858+A9Aj
		jsr	(LoadBottomTiles).l
		movem.w	(sp)+,d7
		add.w	d7,d7
		bsr.w	sub_2458
		rts
; ---------------------------------------------------------------------------

loc_230C:					  ; CODE XREF: sub_1858+A68j
		tst.b	d1
		beq.s	loc_231E
		movem.w	d7,-(sp)
		jsr	(LoadRightTiles).l
		movem.w	(sp)+,d7

loc_231E:					  ; CODE XREF: sub_1858+AB6j
		add.w	d7,d7
		bsr.w	sub_2458
		rts
; ---------------------------------------------------------------------------

loc_2326:					  ; CODE XREF: sub_1858+32j
						  ; HandleDirectionalControl+1D0j ...
		clr.b	d1
		move.w	(word_FF1200).l,d2
		move.b	d2,d3
		sub.w	d7,d2
		move.w	d2,(word_FF1200).l
		andi.b	#$0F,d2
		move.b	d2,(word_FF1126).l
		andi.b	#$08,d2
		andi.b	#$08,d3
		cmp.b	d2,d3
		bcc.s	loc_2384
		subq.b	#$01,(g_PlayerXFlattened).l
		move.w	(g_BlockTableIndex).l,d0
		subq.w	#$01,d0
		move.w	d0,(g_BlockTableIndex).l
		andi.w	#$001F,d0
		cmpi.w	#$001F,d0
		bne.s	loc_2374
		addi.w	#$0020,(g_BlockTableIndex).l

loc_2374:					  ; CODE XREF: sub_1858+B12j
		movem.w	d7,-(sp)
		jsr	(LoadTopTiles).l
		movem.w	(sp)+,d7
		moveq	#$00000001,d1

loc_2384:					  ; CODE XREF: sub_1858+AF4j
		move.w	(word_FF1202).l,d2
		move.w	d2,d3
		sub.w	d7,d2
		move.w	d2,(word_FF1202).l
		andi.b	#$0F,d2
		move.b	d2,(word_FF1126+1).l
		andi.b	#$08,d2
		andi.b	#$08,d3
		cmp.b	d2,d3
		bcc.s	loc_23F2
		subq.b	#$01,(g_PlayerYFlattened).l
		subi.w	#$0020,(g_BlockTableIndex).l
		bpl.s	loc_23D4
		addi.w	#$0210,(g_BlockTableIndex).l
		cmpi.w	#$0200,(g_BlockTableIndex).l
		bcs.s	loc_23D4
		subi.w	#$0020,(g_BlockTableIndex).l

loc_23D4:					  ; CODE XREF: sub_1858+B60j
						  ; sub_1858+B72j
		movem.w	d7,-(sp)
		tst.b	d1
		bne.s	loc_23E2
		jsr	(LoadRightTiles).l

loc_23E2:					  ; CODE XREF: sub_1858+B82j
		jsr	(LoadTopTiles).l
		movem.w	(sp)+,d7
		add.w	d7,d7
		bsr.s	sub_2410
; END OF FUNCTION CHUNK	FOR sub_1858

; =============== S U B	R O U T	I N E =======================================


nullsub_4:
		rts
; End of function nullsub_4

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1858

loc_23F2:					  ; CODE XREF: sub_1858+B50j
		tst.b	d1
		beq.s	loc_2404
		movem.w	d7,-(sp)
		jsr	(LoadLeftTiles).l
		movem.w	(sp)+,d7

loc_2404:					  ; CODE XREF: sub_1858+B9Cj
		add.w	d7,d7
		bsr.s	sub_2410
		rts
; END OF FUNCTION CHUNK	FOR sub_1858

; =============== S U B	R O U T	I N E =======================================


sub_240A:					  ; CODE XREF: HandleDirectionalControl:loc_1C30p
						  ; HandleDirectionalControl:loc_214Cp
		move.w	(g_PlayerSpeed).l,d7
; End of function sub_240A


; =============== S U B	R O U T	I N E =======================================


sub_2410:					  ; CODE XREF: sub_1858+B96p
						  ; sub_1858+BAEp
		subq.w	#$01,d7

loc_2412:					  ; CODE XREF: sub_2410:loc_2428j
		eori.w	#$0001,(word_FF1180).l
		bne.s	loc_2428
		subq.w	#$01,(g_VSRAMData).l
		subq.w	#$01,(g_VSRAMData+2).l

loc_2428:					  ; CODE XREF: sub_2410+Aj
		dbf	d7,loc_2412
		move.b	#$01,(g_PlayerMoving).l
		rts
; End of function sub_2410


; =============== S U B	R O U T	I N E =======================================


sub_2436:					  ; CODE XREF: HandleDirectionalControl+2FEp
						  ; HandleDirectionalControl+48Cp
		move.w	(g_PlayerSpeed).l,d7
		sub.w	d7,(g_HorizontalScrollData).l
		sub.w	d7,(g_HorizontalScrollData+2).l
		move.b	#$01,(g_PlayerMoving).l
		rts
; End of function sub_2436


; =============== S U B	R O U T	I N E =======================================


sub_2452:					  ; CODE XREF: HandleDirectionalControl:loc_1DBEp
						  ; HandleDirectionalControl:loc_1F48p
		move.w	(g_PlayerSpeed).l,d7
; End of function sub_2452


; =============== S U B	R O U T	I N E =======================================


sub_2458:					  ; CODE XREF: sub_1858+AAEp
						  ; sub_1858+AC8p
		subq.w	#$01,d7

loc_245A:					  ; CODE XREF: sub_2458:loc_2470j
		eori.w	#$0001,(word_FF1180).l
		beq.s	loc_2470
		addq.w	#$01,(g_VSRAMData).l
		addq.w	#$01,(g_VSRAMData+2).l

loc_2470:					  ; CODE XREF: sub_2458+Aj
		dbf	d7,loc_245A
		move.b	#$01,(g_PlayerMoving).l
		rts
; End of function sub_2458


; =============== S U B	R O U T	I N E =======================================


sub_247E:					  ; CODE XREF: HandleDirectionalControl+616p
						  ; HandleDirectionalControl+81Ap
		move.w	(g_PlayerSpeed).l,d7
		add.w	d7,(g_HorizontalScrollData).l
		add.w	d7,(g_HorizontalScrollData+2).l
		move.b	#$01,(g_PlayerMoving).l
		rts
; End of function sub_247E


; =============== S U B	R O U T	I N E =======================================


sub_249A:					  ; CODE XREF: sub_404j
						  ; GameLoop+8Ep
		tst.b	(g_PlayerMoving).l
		beq.s	locret_24F2
		clr.b	(g_PlayerMoving).l
		movea.l	(g_VRAMCopyQueuePtr).l,a0
		move.w	#$0001,(a0)+
		move.w	#$D000,(a0)+
		move.l	(g_HorizontalScrollData).l,(a0)+
		move.l	a0,(g_VRAMCopyQueuePtr).l
		addq.b	#$01,(g_VRAMCopyQueueLen).l
		movea.l	(g_DMAOpQueuePtr).l,a6
		move.l	#$8F029400,(a6)+
		move.l	#$93029682,(a6)+
		move.l	#$9580977F,(a6)+
		move.l	#$40000090,(a6)+
		move.l	a6,(g_DMAOpQueuePtr).l
		addq.b	#$01,(g_NumQueuedDMAOps).l

locret_24F2:					  ; CODE XREF: sub_249A+6j
		rts
; End of function sub_249A


; =============== S U B	R O U T	I N E =======================================


sub_24F4:					  ; CODE XREF: GameLoop+34p
		lea	(Player_X).l,a5
		moveq	#$0000000F,d7

loc_24FC:					  ; CODE XREF: sub_24F4+3Ej
						  ; sub_24F4+48j
		movem.w	d7,-(sp)
		bsr.w	sub_3498
		movem.w	(sp)+,d7
		bra.s	loc_250E
; ---------------------------------------------------------------------------

loc_250A:					  ; CODE XREF: sub_24F4+38j
						  ; sub_24F4+46j
		move.w	#$FFFF,d0

loc_250E:					  ; CODE XREF: sub_24F4+14j
		move.w	d0,SpriteUnderneath(a5)
		bne.s	loc_2520
		tst.b	Flags2(a5)
		bpl.s	loc_2520
		movea.l	a5,a0
		bsr.w	sub_25B2

loc_2520:					  ; CODE XREF: sub_24F4+1Ej
						  ; sub_24F4+24j
		lea	SPRITE_SIZE(a5),a5
		move.w	(a5),d0
		bmi.s	locret_253E
		cmpi.b	#$7F,d0
		beq.s	loc_250A
		tst.w	BehavParam(a5)
		bne.s	loc_24FC
		btst	#$05,Flags2(a5)
		beq.s	loc_250A
		bra.s	loc_24FC
; ---------------------------------------------------------------------------

locret_253E:					  ; CODE XREF: sub_24F4+32j
		rts
; End of function sub_24F4


; =============== S U B	R O U T	I N E =======================================


sub_2540:					  ; CODE XREF: GameLoop+42p
		lea	(Player_X).l,a5
		moveq	#$0000000F,d7

loc_2548:					  ; CODE XREF: sub_2540+6Cj
		move.w	(a5),d0
		bmi.s	locret_25B0
		move.w	SpriteUnderneath(a5),d1
		bmi.s	loc_25A8
		cmpi.b	#$7F,d0
		beq.s	loc_25A8
		lea	(Player_X).l,a0
		adda.w	d1,a0
		move.w	Z(a5),d0
		subq.w	#$01,d0
		move.w	HitBoxXStart(a5),d1
		move.w	HitBoxXEnd(a5),d2
		move.w	HitBoxYStart(a5),d3
		move.w	HitBoxYEnd(a5),d4
		cmp.w	HitBoxXEnd(a0),d1
		bhi.s	loc_25A2
		cmp.w	HitBoxXStart(a0),d2
		bcs.s	loc_25A2
		cmp.w	HitBoxYEnd(a0),d3
		bhi.s	loc_25A2
		cmp.w	HitBoxYStart(a0),d4
		bcs.s	loc_25A2
		cmpa.l	#Player_X,a5
		bne.s	loc_25A8
		tst.b	Flags2(a0)
		bpl.s	loc_25A8
		bsr.w	sub_25B2
		bra.s	loc_25A8
; ---------------------------------------------------------------------------

loc_25A2:					  ; CODE XREF: sub_2540+3Aj
						  ; sub_2540+40j ...
		move.w	#$FFFF,SpriteUnderneath(a5)

loc_25A8:					  ; CODE XREF: sub_2540+10j
						  ; sub_2540+16j ...
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,loc_2548

locret_25B0:					  ; CODE XREF: sub_2540+Aj
		rts
; End of function sub_2540


; =============== S U B	R O U T	I N E =======================================


sub_25B2:					  ; CODE XREF: HandleDirectionalControl+22Ep
						  ; HandleDirectionalControl+3C6p ...
		move.w	AttackStrength(a0),(Player_AttackStrength).l
		beq.s	locret_25C4
		move.b	#$80,(byte_FF1143).l

locret_25C4:					  ; CODE XREF: sub_25B2+8j
		rts
; End of function sub_25B2

