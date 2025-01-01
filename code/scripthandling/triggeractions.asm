; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR ProcessTriggerAction

TriggerComplete:				  ; CODE XREF: ProcessTriggerAction+2B0j
						  ; ROM:00010FB6j ...
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

TriggerCompleteOnD0:				  ; CODE XREF: ProcessTriggerAction+280j
						  ; ROM:00010FCCj ...
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

TA_00:						  ; CODE XREF: ProcessTriggerAction:TriggerActionJumpTablej
		lea	(Sprite1_X).l,a0	  ; First dungeon: boulder trap
		tst.b	FallRate(a0)
		bpl.s	loc_10F82
		tst.b	$000000A0(a0)
		bpl.s	loc_10F82
		tst.b	$00000120(a0)
		bpl.s	loc_10F82
		tst.b	$000001A0(a0)
		bpl.s	loc_10F82
		tst.b	$00000220(a0)
		bpl.s	loc_10F82
		tst.b	$000002A0(a0)
		bmi.w	TriggerCompleteOnD0

loc_10F82:					  ; CODE XREF: ProcessTriggerAction+262j
						  ; ProcessTriggerAction+268j ...
		bclr	#$07,FallRate(a0)
		bclr	#$07,$000000A0(a0)
		bclr	#$07,$00000120(a0)
		bclr	#$07,$000001A0(a0)
		bclr	#$07,$00000220(a0)
		bclr	#$07,$000002A0(a0)
		btst	#$06,(g_AdditionalFlags+$A).l
		bne.w	TriggerComplete
		trap	#$00			  ; Trap00Handler
; END OF FUNCTION CHUNK	FOR ProcessTriggerAction
; ---------------------------------------------------------------------------
		dc.w SND_Rumble
; ---------------------------------------------------------------------------
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_01:						  ; CODE XREF: ROM:00010D0Cj
		lea	(Player_X).l,a0
		moveq	#$0000000F,d7
		move.l	a5,d1
		subi.l	#Player_X,d1

loc_10FCA:					  ; CODE XREF: ROM:00010FE0j
		tst.w	(a0)
		bmi.w	TriggerCompleteOnD0
		move.w	SpriteUnderneath(a0),d0
		bmi.s	loc_10FDC
		cmp.w	d0,d1
		beq.w	TriggerComplete

loc_10FDC:					  ; CODE XREF: ROM:00010FD4j
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,loc_10FCA
		bra.w	TriggerCompleteOnD0
; ---------------------------------------------------------------------------

TA_02:						  ; CODE XREF: ROM:00010D10j
		lea	(Sprite1_X).l,a0
		moveq	#$0000000E,d7

loc_10FF0:					  ; CODE XREF: ROM:00011010j
		move.w	(a0),d0
		bmi.w	TriggerComplete
		tst.b	Flags2(a0)
		bpl.s	loc_1100C
		cmpi.b	#$FF,CurrentHealth(a0)
		beq.s	loc_1100C
		cmpi.w	#$7F7F,d0
		bne.w	TriggerCompleteOnD0

loc_1100C:					  ; CODE XREF: ROM:00010FFAj
						  ; ROM:00011002j
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,loc_10FF0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_03:						  ; CODE XREF: ROM:00010D14j
		tst.b	(Sprite6_Flags2).l
		bpl.w	TriggerComplete
		btst	#$03,(g_Flags+$A).l
		bne.w	TriggerComplete
		bra.w	TriggerCompleteOnD0
; ---------------------------------------------------------------------------

TA_04:						  ; CODE XREF: ROM:00010D18j
		tst.b	(Sprite7_Flags2).l
		bpl.w	TriggerComplete
		btst	#$03,(g_Flags+$A).l
		bne.w	TriggerComplete
		bra.w	TriggerCompleteOnD0
; ---------------------------------------------------------------------------

TA_05:						  ; CODE XREF: ROM:00010D1Cj
		tst.b	(Sprite8_Flags2).l
		bpl.w	TriggerComplete
		btst	#$03,(g_Flags+$A).l
		bne.w	TriggerComplete
		bra.w	TriggerCompleteOnD0
; ---------------------------------------------------------------------------

TA_06:						  ; CODE XREF: ROM:00010D20j
		lea	(Player_X).l,a0
		moveq	#$0000000F,d7
		move.l	a5,d1
		subi.l	#Player_X,d1

loc_11076:					  ; CODE XREF: ROM:0001108Cj
		tst.w	(a0)
		bmi.w	TriggerComplete
		move.w	SpriteUnderneath(a0),d0
		bmi.s	loc_11088
		cmp.w	d0,d1
		beq.w	TriggerCompleteOnD0

loc_11088:					  ; CODE XREF: ROM:00011080j
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,loc_11076
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_07:						  ; CODE XREF: ROM:00010D24j
		cmpi.b	#$0F,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_08:						  ; CODE XREF: ROM:00010D28j
		btst	#$01,(g_Flags+2).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$35,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$1D,(Player_Y).l
		beq.w	TriggerComplete
		cmpi.b	#$1E,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_09:						  ; CODE XREF: ROM:00010D2Cj
		cmpi.b	#$30,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		tst.w	(g_ControllerPlayback).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_0A:						  ; CODE XREF: ROM:00010D30j
		cmpi.b	#$15,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$07,(Player_SubY).l
		bcc.w	TriggerCompleteOnD0
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		bne.w	TriggerCompleteOnD0
		btst	#$02,(g_Flags+2).l
		beq.w	TriggerCompleteOnD0
		move.b	(g_Flags+2).l,d0
		andi.b	#$18,d0
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_0B:						  ; CODE XREF: ROM:00010D34j
		cmpi.w	#$1628,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$07,(Player_SubY).l
		bcs.w	TriggerCompleteOnD0
		move.b	(g_Flags+2).l,d0
		andi.b	#$14,d0
		cmpi.b	#$04,d0
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_0C:						  ; CODE XREF: ROM:00010D38j
		cmpi.w	#$1828,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.w	#$0060,(Player_Z).l
		bne.w	TriggerCompleteOnD0
		tst.w	(Player_AnimAction).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_0D:						  ; CODE XREF: ROM:00010D3Cj
		cmpi.b	#$22,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$20,(Player_FloorHeight).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_0E:						  ; CODE XREF: ROM:00010D40j
		cmpi.b	#$1C,(Player_X).l
		bcs.w	TriggerCompleteOnD0
		cmpi.b	#$13,(Player_Y).l
		bcs.w	TriggerCompleteOnD0
		cmpi.b	#$1E,(Player_X).l
		bhi.w	TriggerCompleteOnD0
		cmpi.b	#$15,(Player_Y).l
		bhi.w	TriggerCompleteOnD0
		tst.w	(Player_FallRate).l
		bne.w	TriggerCompleteOnD0
		cmpi.w	#$0040,(Player_Z).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_0F:						  ; CODE XREF: ROM:00010D44j
		btst	#$05,(g_Flags).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$1E,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$21,(Player_Y).l
		beq.s	loc_1121E
		cmpi.b	#$22,(Player_Y).l
		bne.w	TriggerCompleteOnD0

loc_1121E:					  ; CODE XREF: ROM:00011210j
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_10:						  ; CODE XREF: ROM:00010D48j
		cmpi.b	#$27,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$26,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$08,(Player_SubY).l
		beq.w	TriggerComplete
		cmpi.b	#$07,(Player_SubY).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_11:						  ; CODE XREF: ROM:00010D4Cj
		cmpi.w	#$0008,(Player_Z).l
		bne.w	TriggerCompleteOnD0
		tst.l	(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_12:						  ; CODE XREF: ROM:00010D50j
		cmpi.b	#$27,(Player_Y).l
		bcs.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_13:						  ; CODE XREF: ROM:00010D54j
		cmpi.b	#$20,(Player_Y).l
		bhi.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_14:						  ; CODE XREF: ROM:00010D58j
		move.b	(Player_X).l,d0
		andi.b	#$FE,d0
		cmpi.b	#$34,d0
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$21,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$08,(Player_SubY).l
		beq.w	TriggerComplete
		cmpi.b	#$07,(Player_SubY).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_15:						  ; CODE XREF: ROM:00010D5Cj
		cmpi.w	#$0008,(Player_Z).l
		bne.w	TriggerCompleteOnD0
		tst.l	(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_16:						  ; CODE XREF: ROM:00010D60j
		cmpi.w	#$1819,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$07,(Player_SubX).l
		bcc.w	TriggerCompleteOnD0
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Rumble
; ---------------------------------------------------------------------------
		bclr	#$04,Flags1(a5)
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_17:						  ; CODE XREF: ROM:00010D64j
		cmpi.b	#$0A,(g_ControllerPlayback).l
		bne.w	TriggerCompleteOnD0
		btst	#$01,(g_Flags+4).l
		beq.w	TriggerComplete
		bra.w	TriggerCompleteOnD0
; ---------------------------------------------------------------------------

TA_18:						  ; CODE XREF: ROM:00010D68j
		cmpi.b	#$1C,(Player_X).l
		bcc.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_19:						  ; CODE XREF: ROM:00010D6Cj
		cmpi.b	#$2C,(Player_X).l
		bcs.w	TriggerCompleteOnD0
		cmpi.b	#$21,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_1A:						  ; CODE XREF: ROM:00010D70j
		cmpi.b	#$24,(Player_X).l
		bne.w	TriggerCompleteOnD0
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicKayla
; ---------------------------------------------------------------------------
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_1B:						  ; CODE XREF: ROM:00010D74j
		cmpi.b	#$13,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$21,(Player_Y).l
		bcs.w	TriggerCompleteOnD0
		cmpi.b	#$23,(Player_Y).l
		bhi.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_1C:						  ; CODE XREF: ROM:00010D78j
		cmpi.b	#$0F,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$25,(Player_X).l
		bcs.w	TriggerCompleteOnD0
		cmpi.b	#$28,(Player_X).l
		bhi.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_1D:						  ; CODE XREF: ROM:00010D7Cj
		cmpi.b	#$25,(Player_X).l
		bcs.w	TriggerCompleteOnD0
		cmpi.b	#$27,(Player_X).l
		bhi.w	TriggerCompleteOnD0
		cmpi.b	#$32,(Player_Y).l
		bcs.w	TriggerCompleteOnD0
		cmpi.b	#$34,(Player_Y).l
		bhi.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_1E:						  ; CODE XREF: ROM:00010D80j
		lea	(Player_X).l,a0
		moveq	#$0000000F,d7
		move.l	a5,d1
		subi.l	#Player_X,d1

loc_113FA:					  ; CODE XREF: ROM:00011410j
		tst.w	(a0)
		bmi.w	TriggerComplete
		move.w	SpriteUnderneath(a0),d0
		bmi.s	loc_1140C
		cmp.w	d0,d1
		beq.w	TriggerCompleteOnD0

loc_1140C:					  ; CODE XREF: ROM:00011404j
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,loc_113FA
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_1F:						  ; CODE XREF: ROM:00010D84j
		cmpi.w	#$0180,(Sprite2_SpriteUnderneath).l
		beq.s	loc_11438
		cmpi.w	#$0200,(Sprite2_SpriteUnderneath).l
		beq.s	loc_11438
		cmpi.w	#$0280,(Sprite2_SpriteUnderneath).l
		bne.w	TriggerCompleteOnD0

loc_11438:					  ; CODE XREF: ROM:00011420j
						  ; ROM:0001142Aj
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_20:						  ; CODE XREF: ROM:00010D88j
		move.b	(Sprite2_Action+1).l,d0
		andi.b	#$3F,d0
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$15,(Sprite2_X).l
		bhi.w	TriggerCompleteOnD0
		bne.s	loc_11464
		cmpi.b	#$08,(Sprite2_SubX).l
		bcc.w	TriggerCompleteOnD0

loc_11464:					  ; CODE XREF: ROM:00011456j
		move.b	(Sprite2_FloorHeight).l,d0
		cmp.b	(Sprite2_Z+1).l,d0
		beq.w	TriggerComplete
		bra.w	TriggerCompleteOnD0
; ---------------------------------------------------------------------------

TA_21:						  ; CODE XREF: ROM:00010D8Cj
		move.b	#$01,d0
		cmpi.w	#$0180,(Sprite2_SpriteUnderneath).l
		beq.s	loc_114A4
		move.b	#$02,d0
		cmpi.w	#$0200,(Sprite2_SpriteUnderneath).l
		beq.s	loc_114A4
		move.b	#$03,d0
		cmpi.w	#$0280,(Sprite2_SpriteUnderneath).l
		bne.w	TriggerCompleteOnD0

loc_114A4:					  ; CODE XREF: ROM:00011484j
						  ; ROM:00011492j
		bset	d0,(g_Flags+1).l
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_22:						  ; CODE XREF: ROM:00010D90j
		lea	(Sprite1_X).l,a0
		moveq	#$00000006,d7

loc_114B6:					  ; CODE XREF: ROM:000114D6j
		move.b	$00000023(a0),d0
		andi.b	#$3F,d0
		cmpi.b	#$0E,d0
		bne.w	TriggerCompleteOnD0
		move.b	$00000013(a0),d0
		cmp.b	$00000039(a0),d0
		bne.w	TriggerCompleteOnD0
		lea	$00000080(a0),a0
		dbf	d7,loc_114B6
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_23:						  ; CODE XREF: ROM:00010D94j
		cmpi.b	#$18,(Player_Y).l
		bhi.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_24:						  ; CODE XREF: ROM:00010D98j
		cmpi.w	#$121B,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.w	#$0808,(Player_SubX).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_25:						  ; CODE XREF: ROM:00010D9Cj
		cmpi.b	#$18,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$08,(Player_SubY).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_26:						  ; CODE XREF: ROM:00010DA0j
		cmpi.b	#$16,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$08,(Player_SubX).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_27:						  ; CODE XREF: ROM:00010DA4j
		move.b	(Player_X).l,d0
		andi.b	#$FE,d0
		cmpi.b	#$18,d0
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$0D,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicKayla
; ---------------------------------------------------------------------------
		bset	#$01,(Player_Flags4).l
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_28:						  ; CODE XREF: ROM:00010DA8j
		cmpi.b	#$1B,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$08,(Player_SubY).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_29:						  ; CODE XREF: ROM:00010DACj
		cmpi.b	#$18,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$08,(Player_SubX).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_2A:						  ; CODE XREF: ROM:00010DB0j
		cmpi.b	#$16,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$11,(Player_Y).l
		beq.s	loc_115CA
		cmpi.b	#$12,(Player_Y).l
		bne.w	TriggerCompleteOnD0

loc_115CA:					  ; CODE XREF: ROM:000115BCj
		cmpi.b	#$08,(Player_SubX).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_2B:						  ; CODE XREF: ROM:00010DB4j
		cmpi.b	#$15,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$08,(Player_SubX).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_2C:						  ; CODE XREF: ROM:00010DB8j
		cmpi.b	#$17,(Sprite1_HitBoxZEnd+1).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_2D:						  ; CODE XREF: ROM:00010DBCj
		tst.w	(Player_SpriteUnderneath).l
		bmi.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_2E:						  ; CODE XREF: ROM:00010DC0j
		cmpi.b	#$19,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$20,(Player_FloorHeight).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_2F:						  ; CODE XREF: ROM:00010DC4j
		move.w	(Player_X).l,d0
		andi.w	#$FEFE,d0
		cmpi.w	#$2220,d0
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$10,(Player_Z+1).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_30:						  ; CODE XREF: ROM:00010DC8j
		tst.b	(Sprite1_FallRate).l
		bmi.w	TriggerCompleteOnD0
		tst.b	(Sprite1_Flags2).l
		bmi.w	TriggerCompleteOnD0
		tst.b	(Sprite2_Flags2).l
		bpl.w	TriggerCompleteOnD0
		tst.b	(Sprite3_Flags2).l
		bpl.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_31:						  ; CODE XREF: ROM:00010DCCj
		tst.b	(Sprite2_Flags2).l
		bmi.w	TriggerCompleteOnD0
		tst.b	(Sprite3_Flags2).l
		bpl.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_32:						  ; CODE XREF: ROM:00010DD0j
		tst.b	(Sprite3_Flags2).l
		bmi.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_33:						  ; CODE XREF: ROM:00010DD4j
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
		andi.w	#$2730,d0
		beq.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_34:						  ; CODE XREF: ROM:00010DD8j
		cmpi.w	#$1C14,(Player_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_35:						  ; CODE XREF: ROM:00010DDCj
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
		andi.w	#$0700,d0
		beq.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_36:						  ; CODE XREF: ROM:00010DE0j
		btst	#$04,(g_Flags+$15).l
		bne.w	TriggerCompleteOnD0
		cmpi.w	#$1317,(Player_X).l
		beq.s	loc_11724
		cmpi.w	#$1416,(Player_X).l
		beq.s	loc_11724
		cmpi.w	#$1315,(Player_X).l
		beq.s	loc_11724
		cmpi.w	#$1313,(Player_X).l
		beq.s	loc_11724
		cmpi.w	#$1412,(Player_X).l
		beq.s	loc_11724
		cmpi.w	#$1311,(Player_X).l
		beq.s	loc_11724
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

loc_11724:					  ; CODE XREF: ROM:000116ECj
						  ; ROM:000116F6j ...
		bset	#$04,(g_Flags+$15).l
		bra.w	TriggerCompleteOnD0
; ---------------------------------------------------------------------------

TA_37:						  ; CODE XREF: ROM:00010DE4j
		lea	(Sprite1_X).l,a1
		jsr	(j_CheckIfChestOpened).l
		bne.w	TriggerComplete
		lea	(Sprite2_X).l,a1
		jsr	(j_CheckIfChestOpened).l
		bne.w	TriggerComplete
		lea	(Sprite3_X).l,a1
		jsr	(j_CheckIfChestOpened).l
		bne.w	TriggerComplete
		lea	(Sprite4_X).l,a1
		jsr	(j_CheckIfChestOpened).l
		bne.w	TriggerComplete
		bra.w	TriggerCompleteOnD0
; ---------------------------------------------------------------------------

TA_38:						  ; CODE XREF: ROM:00010DE8j
		tst.b	(Sprite1_Flags2).l
		bmi.w	TriggerCompleteOnD0
		tst.b	(Sprite2_Flags2).l
		bpl.w	TriggerCompleteOnD0
		tst.b	(Sprite3_Flags2).l
		bpl.w	TriggerCompleteOnD0
		tst.b	(Sprite4_Flags2).l
		bpl.w	TriggerCompleteOnD0
		movem.l	a5,-(sp)
		lea	(Sprite2_X).l,a5
		jsr	(j_HideSprite).l
		lea	(Sprite3_X).l,a5
		jsr	(j_HideSprite).l
		lea	(Sprite4_X).l,a5
		jsr	(j_HideSprite).l
		movem.l	(sp)+,a5
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_39:						  ; CODE XREF: ROM:00010DECj
		cmpi.w	#$273D,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.w	#$0018,(Player_Z).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_3A:						  ; CODE XREF: ROM:00010DF0j
		move.b	#ITM_ARMLET,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_3B:						  ; CODE XREF: ROM:00010DF4j
		cmpi.b	#$15,(Player_X).l
		beq.s	loc_11812
		cmpi.b	#$16,(Player_X).l
		bne.w	TriggerCompleteOnD0

loc_11812:					  ; CODE XREF: ROM:00011804j
		cmpi.b	#$1B,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_3C:						  ; CODE XREF: ROM:00010DF8j
		btst	#$00,(g_Flags+1).l
		bne.w	TriggerComplete
		btst	#$07,(g_Flags+$16).l
		bne.w	TriggerComplete
		bra.w	TriggerCompleteOnD0
; ---------------------------------------------------------------------------

TA_3D:						  ; CODE XREF: ROM:00010DFCj
		cmpi.b	#$11,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$08,(Player_SubY).l
		bls.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_3E:						  ; CODE XREF: ROM:00010E00j
		cmpi.b	#$19,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_3F:						  ; CODE XREF: ROM:00010E04j
		cmpi.b	#$20,(Player_FloorHeight).l
		bne.w	TriggerCompleteOnD0
		cmpi.w	#$0020,(Player_Z).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_40:						  ; CODE XREF: ROM:00010E08j
		cmpi.b	#$17,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$15,(Player_Y).l
		bhi.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_41:						  ; CODE XREF: ROM:00010E0Cj
		cmpi.b	#$14,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$16,(Player_Y).l
		bhi.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_42:						  ; CODE XREF: ROM:00010E10j
		cmpi.b	#$17,(Player_X).l
		bhi.w	TriggerCompleteOnD0
		cmpi.b	#$19,(Player_Y).l
		bhi.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_43:						  ; CODE XREF: ROM:00010E14j
		cmpi.w	#$6400,(Sprite9_CurrentHealth).l
		bcc.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_44:						  ; CODE XREF: ROM:00010E18j
		cmpi.w	#$6400,(Sprite4_CurrentHealth).l
		bcc.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_45:						  ; CODE XREF: ROM:00010E1Cj
		move.b	#ITM_PURPLEJEWEL,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_46:						  ; CODE XREF: ROM:00010E20j
		move.b	(Player_X).l,d0
		subi.b	#$31,d0
		cmpi.b	#$03,d0
		bcc.w	TriggerCompleteOnD0
		move.b	(Player_Y).l,d0
		subi.b	#$1B,d0
		cmpi.b	#$03,d0
		bcc.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_47:						  ; CODE XREF: ROM:00010E24j
		move.b	(Player_X).l,d0
		subi.b	#$31,d0
		cmpi.b	#$03,d0
		bcc.w	TriggerComplete
		move.b	(Player_Y).l,d0
		subi.b	#$1B,d0
		cmpi.b	#$03,d0
		bcs.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_48:						  ; CODE XREF: ROM:00010E28j
		cmpi.b	#$FE,(g_ControllerPlaybackTimer).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_49:						  ; CODE XREF: ROM:00010E2Cj
		cmpi.b	#$1F,(Player_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_4A:						  ; CODE XREF: ROM:00010E30j
		cmpi.b	#$11,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_4B:						  ; CODE XREF: ROM:00010E34j
		cmpi.b	#$1C,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$19,(Player_Y).l
		bhi.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_4C:						  ; CODE XREF: ROM:00010E38j
		cmpi.b	#$1F,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_4D:						  ; CODE XREF: ROM:00010E3Cj
		cmpi.b	#$1D,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_4E:						  ; CODE XREF: ROM:00010E40j
		cmpi.b	#$12,(Player_X).l
		bcs.w	TriggerCompleteOnD0
		cmpi.b	#$0F,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_4F:						  ; CODE XREF: ROM:00010E44j
		cmpi.b	#$11,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_50:						  ; CODE XREF: ROM:00010E48j
		cmpi.w	#$272A,(Player_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_51:						  ; CODE XREF: ROM:00010E4Cj
		cmpi.w	#$262E,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$08,(Player_SubX).l
		bcs.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_52:						  ; CODE XREF: ROM:00010E50j
		cmpi.b	#$2C,(Player_X).l
		bcs.w	TriggerCompleteOnD0
		cmpi.b	#$25,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_53:						  ; CODE XREF: ROM:00010E54j
		cmpi.w	#$2225,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$07,(Player_SubY).l
		bcs.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_54:						  ; CODE XREF: ROM:00010E58j
		cmpi.w	#$3715,(Player_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_55:						  ; CODE XREF: ROM:00010E5Cj
		cmpi.w	#$3719,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$06,(Player_SubX).l
		bcs.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_56:						  ; CODE XREF: ROM:00010E60j
		move.b	(Player_X).l,d0
		subi.b	#$2E,d0
		cmpi.b	#$03,d0
		bcc.w	TriggerCompleteOnD0
		move.b	(Player_Y).l,d0
		subq.b	#$01,d0
		andi.b	#$FE,d0
		cmpi.b	#$14,d0
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_57:						  ; CODE XREF: ROM:00010E64j
		move.b	(Player_X).l,d0
		subi.b	#$27,d0
		cmpi.b	#$14,d0
		bcc.w	TriggerComplete
		move.b	(Player_Y).l,d0
		subq.b	#$01,d0
		andi.b	#$FE,d0
		cmpi.b	#$14,d0
		bne.w	TriggerComplete
		bra.w	TriggerCompleteOnD0
; ---------------------------------------------------------------------------

TA_58:						  ; CODE XREF: ROM:00010E68j
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
		andi.b	#$3F,d0
		beq.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_59:						  ; CODE XREF: ROM:00010E6Cj
		cmpi.b	#$23,(Player_X).l
		bne.w	TriggerCompleteOnD0
		move.b	(Player_Y).l,d0
		subi.b	#$15,d0
		cmpi.b	#$02,d0
		bcc.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_5A:						  ; CODE XREF: ROM:00010E70j
		cmpi.w	#$1E1E,(Player_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_5B:						  ; CODE XREF: ROM:00010E74j
		cmpi.w	#$371A,(Player_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_5C:						  ; CODE XREF: ROM:00010E78j
		cmpi.w	#$112D,(Player_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_5D:						  ; CODE XREF: ROM:00010E7Cj
		cmpi.w	#$1816,(Player_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_5E:						  ; CODE XREF: ROM:00010E80j
		cmpi.b	#$2F,(Player_X).l
		bne.w	TriggerCompleteOnD0
		move.b	(Player_Y).l,d0
		subi.b	#$1E,d0
		cmpi.b	#$04,d0
		bcc.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_5F:						  ; CODE XREF: ROM:00010E84j
		move.b	(g_Flags+1).l,d0
		andi.b	#$0F,d0
		cmpi.b	#$0F,d0
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_60:						  ; CODE XREF: ROM:00010E88j
		move.b	#ITM_SUNSTONE,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_61:						  ; CODE XREF: ROM:00010E8Cj
		move.b	(Player_X).l,d0
		andi.b	#$FE,d0
		cmpi.b	#$20,d0
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$28,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_62:						  ; CODE XREF: ROM:00010E90j
		lea	(Sprite1_X).l,a0
		moveq	#$0000000E,d7

loc_11BC4:					  ; CODE XREF: ROM:00011BE4j
		move.w	(a0),d0
		bmi.w	TriggerCompleteOnD0
		tst.b	$0000000C(a0)
		bpl.s	loc_11BE0
		cmpi.b	#$FF,$0000003E(a0)
		beq.s	loc_11BE0
		cmpi.w	#$7F7F,d0
		bne.w	TriggerComplete

loc_11BE0:					  ; CODE XREF: ROM:00011BCEj
						  ; ROM:00011BD6j
		lea	$00000080(a0),a0
		dbf	d7,loc_11BC4
		bra.w	TriggerCompleteOnD0
; ---------------------------------------------------------------------------

TA_63:						  ; CODE XREF: ROM:00010E94j
		cmpi.b	#$1A,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_64:						  ; CODE XREF: ROM:00010E98j
		cmpi.b	#$21,(Player_X).l
		bne.w	TriggerCompleteOnD0
		move.b	(Player_Y).l,d0
		subq.b	#$01,d0
		andi.b	#$FE,d0
		cmpi.b	#$3A,d0
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_65:						  ; CODE XREF: ROM:00010E9Cj
		cmpi.b	#$13,(Player_X).l
		bne.w	TriggerCompleteOnD0
		move.b	(Player_Y).l,d0
		subi.b	#$13,d0
		cmpi.b	#$03,d0
		bcc.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_66:						  ; CODE XREF: ROM:00010EA0j
		cmpi.b	#$10,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		move.b	(Player_X).l,d0
		subi.b	#$15,d0
		cmpi.b	#$02,d0
		bcc.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_67:						  ; CODE XREF: ROM:00010EA4j
		move.b	(Player_X).l,d0
		subi.b	#$2B,d0
		cmpi.b	#$02,d0
		bcc.w	TriggerCompleteOnD0
		cmpi.b	#$17,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_68:						  ; CODE XREF: ROM:00010EA8j
		cmpi.w	#$312B,(Player_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_69:						  ; CODE XREF: ROM:00010EACj
		btst	#$04,(g_AdditionalFlags+$A).l
		bne.w	TriggerCompleteOnD0
		move.b	(Player_X).l,d0
		subi.b	#$22,d0
		cmpi.b	#$03,d0
		bcc.w	TriggerCompleteOnD0
		cmpi.b	#$20,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		cmpi.w	#$0040,(Player_Z).l
		bcs.w	TriggerCompleteOnD0
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_6A:						  ; CODE XREF: ROM:00010EB0j
		lea	(Sprite1_X).l,a0
		cmpi.b	#$7F,(a0)
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$7F,$00000080(a0)
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$7F,$00000100(a0)
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$7F,$00000180(a0)
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$7F,$00000400(a0)
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$7F,$00000480(a0)
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$7F,$00000500(a0)
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$7F,$00000580(a0)
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_6B:						  ; CODE XREF: ROM:00010EB4j
		cmpi.w	#$6400,(Sprite5_CurrentHealth).l
		bcc.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_6C:						  ; CODE XREF: ROM:00010EB8j
		cmpi.w	#$1613,(Player_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_6D:						  ; CODE XREF: ROM:00010EBCj
		cmpi.b	#$29,(Player_X).l
		bcs.w	TriggerCompleteOnD0
		cmpi.b	#$2D,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$F0,(Player_FloorHeight).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_6E:						  ; CODE XREF: ROM:00010EC0j
		cmpi.w	#$6400,(Sprite4_CurrentHealth).l
		bcc.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_6F:						  ; CODE XREF: ROM:00010EC4j
		move.b	#ITM_AXEMAGIC,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_70:						  ; CODE XREF: ROM:00010EC8j
		cmpi.w	#$201D,(Player_X).l
		bne.w	TriggerCompleteOnD0
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		cmpi.b	#$C0,d0
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_71:						  ; CODE XREF: ROM:00010ECCj
		cmpi.w	#$00FE,(g_ControllerPlayback).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_72:						  ; CODE XREF: ROM:00010ED0j
		move.b	#ITM_KEY,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	TriggerCompleteOnD0
		beq.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_73:						  ; CODE XREF: ROM:00010ED4j
		cmpi.w	#$2820,(Player_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_74:						  ; CODE XREF: ROM:00010ED8j
		move.w	(Sprite2_X).l,d0
		cmp.w	(word_FF12F0).l,d0
		beq.w	TriggerCompleteOnD0
		move.w	d0,(word_FF12F0).l
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_75:						  ; CODE XREF: ROM:00010EDCj
		cmpi.b	#$36,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$08,(Player_SubX).l
		bcc.w	TriggerCompleteOnD0
		move.b	(Player_Y).l,d0
		btst	#$00,d0
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_76:						  ; CODE XREF: ROM:00010EE0j
		cmpi.b	#$0E,(Sprite2_X).l
		beq.w	loc_11E74
		cmpi.b	#$0E,(Sprite3_X).l
		beq.w	loc_11E80
		cmpi.b	#$0E,(Sprite4_X).l
		beq.w	loc_11E8C
		cmpi.b	#$0E,(Sprite5_X).l
		beq.w	loc_11E98
		bra.w	TriggerCompleteOnD0
; ---------------------------------------------------------------------------

loc_11E74:					  ; CODE XREF: ROM:00011E48j
		cmpi.w	#$0100,(Player_SpriteUnderneath).l
		beq.s	loc_11EA4
		bra.s	loc_11EB0
; ---------------------------------------------------------------------------

loc_11E80:					  ; CODE XREF: ROM:00011E54j
		cmpi.w	#$0180,(Player_SpriteUnderneath).l
		beq.s	loc_11EA4
		bra.s	loc_11EB0
; ---------------------------------------------------------------------------

loc_11E8C:					  ; CODE XREF: ROM:00011E60j
		cmpi.w	#$0200,(Player_SpriteUnderneath).l
		beq.s	loc_11EA4
		bra.s	loc_11EB0
; ---------------------------------------------------------------------------

loc_11E98:					  ; CODE XREF: ROM:00011E6Cj
		cmpi.w	#$0280,(Player_SpriteUnderneath).l
		beq.s	loc_11EA4
		bra.s	loc_11EB0
; ---------------------------------------------------------------------------

loc_11EA4:					  ; CODE XREF: ROM:00011E7Cj
						  ; ROM:00011E88j ...
		bset	#$03,(g_Flags+1).l
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

loc_11EB0:					  ; CODE XREF: ROM:00011E7Ej
						  ; ROM:00011E8Aj ...
		bclr	#$03,(g_Flags+1).l
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_77:						  ; CODE XREF: ROM:00010EE4j
		btst	#$05,(g_AdditionalFlags+9).l
		beq.w	TriggerCompleteOnD0
		btst	#$01,(g_AdditionalFlags+$B).l
		bne.w	TriggerCompleteOnD0
		cmpi.b	#$14,(Player_X).l
		bne.w	TriggerCompleteOnD0
		move.b	#ITM_LOGS,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	TriggerComplete
		cmpi.b	#$02,d1
		bcc.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_78:						  ; CODE XREF: ROM:00010EE8j
		move.b	#ITM_LANTERN,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_79:						  ; CODE XREF: ROM:00010EECj
		move.w	(Player_X).l,d0
		andi.w	#$FEFE,d0
		cmpi.w	#$2E2E,d0
		bne.w	TriggerCompleteOnD0
		cmpi.w	#$0068,(Player_Z).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_7A:						  ; CODE XREF: ROM:00010EF0j
		move.b	(Player_X).l,d0
		andi.b	#$FE,d0
		cmpi.b	#$16,d0
		bne.w	TriggerCompleteOnD0
		move.b	(Player_Y).l,d0
		subq.b	#$01,d0
		andi.b	#$FE,d0
		cmpi.b	#$10,d0
		bne.w	TriggerCompleteOnD0
		cmpi.w	#$0038,(Player_Z).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_7B:						  ; CODE XREF: ROM:00010EF4j
		cmpi.w	#$0040,(Player_Z).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_7C:						  ; CODE XREF: ROM:00010EF8j
		cmpi.b	#$21,(Player_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_7D:						  ; CODE XREF: ROM:00010EFCj
		cmpi.w	#$6400,(Sprite3_CurrentHealth).l
		bcc.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_7E:						  ; CODE XREF: ROM:00010F00j
		cmpi.b	#$19,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_7F:						  ; CODE XREF: ROM:00010F04j
		cmpi.w	#$6400,(Sprite2_CurrentHealth).l
		bcc.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_80:						  ; CODE XREF: ROM:00010F08j
		cmpi.w	#$2116,(Player_X).l
		bne.w	TriggerCompleteOnD0
		cmpi.w	#$00A0,(Player_Z).l
		bcs.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_81:						  ; CODE XREF: ROM:00010F0Cj
		cmpi.b	#$7F,(Sprite1_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_82:						  ; CODE XREF: ROM:00010F10j
		cmpi.b	#$7F,(Sprite2_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_83:						  ; CODE XREF: ROM:00010F14j
		cmpi.b	#$7F,(Sprite3_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_84:						  ; CODE XREF: ROM:00010F18j
		cmpi.b	#$15,(Player_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_85:						  ; CODE XREF: ROM:00010F1Cj
		cmpi.b	#$11,(Player_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_86:						  ; CODE XREF: ROM:00010F20j
		cmpi.b	#$19,(Player_X).l
		bcc.w	TriggerCompleteOnD0
		cmpi.b	#$16,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		move.b	#ITM_GOLASNAIL,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	TriggerCompleteOnD0
		move.b	#ITM_GOLASHORN,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	TriggerCompleteOnD0
		move.b	#ITM_GOLASFANG,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_87:						  ; CODE XREF: ROM:00010F24j
		cmpi.w	#$6400,(Sprite3_CurrentHealth).l
		bcc.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_88:						  ; CODE XREF: ROM:00010F28j
		cmpi.b	#$1C,(Player_X).l
		beq.s	loc_12096
		cmpi.b	#$1D,(Player_X).l
		bne.w	TriggerCompleteOnD0

loc_12096:					  ; CODE XREF: ROM:00012088j
		cmpi.b	#$16,(Player_Y).l
		beq.w	TriggerComplete
		cmpi.b	#$17,(Player_Y).l
		beq.w	TriggerComplete
		cmpi.b	#$18,(Player_Y).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_89:						  ; CODE XREF: ROM:00010F2Cj
		cmpi.w	#$6400,(Sprite2_CurrentHealth).l
		bcc.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_8A:						  ; CODE XREF: ROM:00010F30j
		tst.b	(byte_FF1142).l
		bne.w	TriggerCompleteOnD0
		tst.b	(g_PlayerAnimation).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
; ---------------------------------------------------------------------------

TA_8B:						  ; CODE XREF: ROM:00010F34j
		cmpi.w	#$3634,(Player_X).l
		bne.w	TriggerCompleteOnD0
		bra.w	TriggerComplete
