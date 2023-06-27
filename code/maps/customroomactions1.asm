
; =============== S U B	R O U T	I N E =======================================

; Mercator North

DoCustomRoomActions:				  ; CODE XREF: CheckFlags+6p
		cmpi.w	#$0276,(RmNum2).l
		bne.s	loc_19B74
		bclr	#$03,(g_Vars+9).l

loc_19B74:					  ; CODE XREF: DoCustomRoomActions+8j
		cmpi.w	#$01AA,(g_RmNum1).l
		bne.s	loc_19BA8		  ; Gumi
		cmpi.b	#$22,(Player_Y).l
		bcs.s	loc_19B94
		cmpi.b	#$28,(Player_Y).l
		bcs.w	locret_1A308

loc_19B94:					  ; CODE XREF: DoCustomRoomActions+24j
		move.b	#$00,d0
		bsr.w	HideSpriteAtD0
		move.b	#$01,d0
		bsr.w	HideSpriteAtD0
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19BA8:					  ; CODE XREF: DoCustomRoomActions+1Aj
		cmpi.w	#$0259,(g_RmNum1).l	  ; Gumi
		bne.s	loc_19BCA		  ; Swamp shrine boss room
		btst	#$02,(g_Flags+2).l
		bne.w	locret_1A308
		move.w	#$FFFF,(Sprite3_X).l
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19BCA:					  ; CODE XREF: DoCustomRoomActions+4Ej
		cmpi.w	#$001C,(g_RmNum1).l	  ; Swamp shrine boss room
		bne.s	loc_19BEC		  ; Path between Gumi and Ryuma
		btst	#$05,(g_Flags+2).l
		beq.w	locret_1A308
		move.w	#$FFFF,(Sprite1_X).l
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19BEC:					  ; CODE XREF: DoCustomRoomActions+70j
		cmpi.w	#$01C1,(g_RmNum1).l	  ; Path between Gumi and Ryuma
		bne.s	loc_19C14		  ; Ryuma entrance to thieve's cave
		btst	#$06,(g_Flags+2).l
		beq.w	locret_1A308
		move.w	#$2119,(Sprite2_X).l
		clr.w	(Sprite2_Z).l
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19C14:					  ; CODE XREF: DoCustomRoomActions+92j
		cmpi.w	#$00B7,(g_RmNum1).l	  ; Ryuma entrance to thieve's cave
		bne.s	loc_19C38		  ; Thieve's Cave Entrance (with water)
		cmpi.b	#$0F,(Player_Y).l
		beq.s	loc_19C30
		move.b	#$03,d0
		bra.w	HideSpriteAtD0
; ---------------------------------------------------------------------------

loc_19C30:					  ; CODE XREF: DoCustomRoomActions+C4j
		move.b	#$01,d0
		bra.w	HideSpriteAtD0
; ---------------------------------------------------------------------------

loc_19C38:					  ; CODE XREF: DoCustomRoomActions+BAj
		cmpi.w	#$00B9,(g_RmNum1).l	  ; Thieve's Cave Entrance (with water)
		bne.s	loc_19C5C		  ; Thieve's cave entrance (without water)
		cmpi.b	#$24,(Player_Y).l
		bcc.s	loc_19C54
		move.b	#$05,d0
		bra.w	HideSpriteAtD0
; ---------------------------------------------------------------------------

loc_19C54:					  ; CODE XREF: DoCustomRoomActions+E8j
		move.b	#$07,d0
		bra.w	HideSpriteAtD0
; ---------------------------------------------------------------------------

loc_19C5C:					  ; CODE XREF: DoCustomRoomActions+DEj
		cmpi.w	#$00BA,(g_RmNum1).l	  ; Thieve's cave entrance (without water)
		bne.s	loc_19C80		  ; Massan mayor's house
		cmpi.b	#$24,(Player_Y).l
		bcc.s	loc_19C78
		move.b	#$05,d0
		bra.w	HideSpriteAtD0
; ---------------------------------------------------------------------------

loc_19C78:					  ; CODE XREF: DoCustomRoomActions+10Cj
		move.b	#$07,d0
		bra.w	HideSpriteAtD0
; ---------------------------------------------------------------------------

loc_19C80:					  ; CODE XREF: DoCustomRoomActions+102j
		cmpi.w	#$0251,(g_RmNum1).l	  ; Massan mayor's house
		bne.s	loc_19D08		  ; Jar	Lady Upstairs
		tst.b	(g_Flags).l
		bpl.w	locret_1A308
		move.b	#$02,d0
		bsr.w	HideSpriteAtD0
		lea	(Sprite1_X).l,a1
		move.w	#$1012,(a1)
		andi.b	#$3F,$00000004(a1)
		btst	#$04,(g_Flags).l
		bne.s	loc_19CD6
		clr.b	d1
		bsr.w	SetSpriteRotationAnimFlags
		lea	(Sprite2_X).l,a1
		move.w	#$120F,(a1)
		move.b	#$C0,d1
		or.b	d1,$00000004(a1)
		bsr.w	SetSpriteRotationAnimFlags
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19CD6:					  ; CODE XREF: DoCustomRoomActions+152j
		andi.b	#$3F,$00000004(a1)
		move.b	#$40,d1
		or.b	d1,$00000004(a1)
		bsr.w	SetSpriteRotationAnimFlags
		lea	(Sprite2_X).l,a1
		move.w	#$1210,(a1)
		andi.b	#$3F,$00000004(a1)
		move.b	#$80,d1
		or.b	d1,$00000004(a1)
		bsr.w	SetSpriteRotationAnimFlags
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19D08:					  ; CODE XREF: DoCustomRoomActions+126j
		cmpi.w	#$02C5,(g_RmNum1).l	  ; Jar	Lady Upstairs
		bne.s	loc_19D36		  ; Mercator North
		btst	#$03,(g_Flags+3).l
		beq.w	locret_1A308
		move.b	#$07,d0
		move.w	#$1F23,d1
		bsr.w	MoveSprite
		move.w	#$0010,d1
		bsr.w	SetSpriteZ
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19D36:					  ; CODE XREF: DoCustomRoomActions+1AEj
		cmpi.w	#$0277,(g_RmNum1).l	  ; Mercator North
		bne.s	loc_19D5C		  ; Mercator Harbour
		btst	#$04,(g_Flags+$14).l
		beq.w	locret_1A308
		move.b	#$00,d0
		move.w	#$3336,d1
		bsr.w	MoveSprite
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19D5C:					  ; CODE XREF: DoCustomRoomActions+1DCj
		cmpi.w	#$0282,(g_RmNum1).l	  ; Mercator Harbour
		bne.s	loc_19D8A		  ; Castle entrance
		btst	#$05,(g_Flags+$14).l
		beq.w	locret_1A308
		move.b	#$04,d0
		move.w	#$1E1A,d1
		bsr.w	MoveSprite
		move.w	#$0010,d1
		bsr.w	SetSpriteZ
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19D8A:					  ; CODE XREF: DoCustomRoomActions+202j
		cmpi.w	#$0038,(g_RmNum1).l	  ; Castle entrance
		bne.s	loc_19DBC		  ; Crypt
		btst	#$00,(g_Flags+$14).l
		beq.w	locret_1A308
		move.b	#$00,d0
		move.w	#$2218,d1
		bsr.w	MoveSprite
		move.b	#$01,d0
		move.w	#$2518,d1
		bsr.w	MoveSprite
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19DBC:					  ; CODE XREF: DoCustomRoomActions+230j
		cmpi.w	#$0287,(g_RmNum1).l	  ; Crypt
		bne.s	loc_19E24		  ; Castle
		cmpi.b	#$FF,(g_Flags+$15).l
		bne.s	loc_19E14
		bset	#$03,(g_Flags+$16).l
		cmpi.b	#$21,(Player_X).l
		bcs.s	loc_19DF6
		move.b	#$00,d0
		bsr.w	HideSpriteAtD0
		move.b	#$01,d0
		bsr.w	HideSpriteAtD0
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19DF6:					  ; CODE XREF: DoCustomRoomActions+27Ej
		btst	#$06,(g_Flags+$14).l
		bne.s	loc_19E14
		move.b	#$02,d0
		bsr.w	HideSpriteAtD0
		move.b	#$03,d0
		bsr.w	HideSpriteAtD0
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19E14:					  ; CODE XREF: DoCustomRoomActions+26Cj
						  ; DoCustomRoomActions+29Cj
		move.b	#$01,d0
		move.w	#$FFFF,d1
		bsr.w	MoveSprite
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19E24:					  ; CODE XREF: DoCustomRoomActions+262j
		cmpi.w	#$003C,(g_RmNum1).l	  ; Castle
		bne.s	loc_19E5A		  ; Marsh shrine EkeEke	fall
		btst	#$00,(g_Flags+$14).l
		beq.w	locret_1A308
		move.b	#$00,d0
		move.w	#$1619,d1
		bsr.w	MoveSprite
		move.w	#$0010,d1
		bsr.w	SetSpriteZ
		move.w	#$0002,d1
		bsr.w	sub_1A356
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19E5A:					  ; CODE XREF: DoCustomRoomActions+2CAj
		cmpi.w	#$0007,(g_RmNum1).l	  ; Marsh shrine EkeEke	fall
		bne.s	loc_19E80		  ; Prison cell
		btst	#$02,(g_Flags+$A).l
		beq.w	locret_1A308
		move.b	#$00,d0
		move.w	#$0010,d1
		bsr.w	SetSpriteZ
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19E80:					  ; CODE XREF: DoCustomRoomActions+300j
		cmpi.w	#$002C,(g_RmNum1).l	  ; Prison cell
		bne.s	loc_19EBE		  ; Mercator Harbour
		move.b	#$00,d0
		btst	#$05,(g_Vars).l
		beq.w	HideSpriteAtD0
		btst	#$01,(g_Vars+7).l
		bne.w	HideSpriteAtD0
		btst	#$07,(g_Vars).l
		beq.w	locret_1A308
		move.w	#$0F10,d1
		bsr.w	MoveSprite
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19EBE:					  ; CODE XREF: DoCustomRoomActions+326j
		cmpi.w	#$0284,(g_RmNum1).l	  ; Mercator Harbour
		bne.s	loc_19F08		  ; Verla mine exit to Destel
		btst	#$05,(g_Vars+$A).l
		bne.w	locret_1A308
		cmpi.b	#$24,(Player_X).l
		bhi.w	locret_1A308
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		bne.w	locret_1A308
		move.b	#$00,d0
		move.w	#$0002,d1
		bsr.w	sub_1A356
		ext.w	d0
		lsl.w	#$07,d0
		adda.w	d0,a5
		clr.w	$0000002A(a5)
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19F08:					  ; CODE XREF: DoCustomRoomActions+364j
		cmpi.w	#$00EC,(g_RmNum1).l	  ; Verla mine exit to Destel
		bne.s	loc_19F3A		  ; Crypt boss room
		btst	#$00,(g_Vars+8).l
		beq.w	locret_1A308
		move.b	#$00,d0
		move.w	#$0D11,d1
		bsr.w	MoveSprite
		move.b	#$01,d0
		move.w	#$0D15,d1
		bsr.w	MoveSprite
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19F3A:					  ; CODE XREF: DoCustomRoomActions+3AEj
		cmpi.w	#$028B,(g_RmNum1).l	  ; Crypt boss room
		bne.s	loc_19F60		  ; Jar	lady
		btst	#$06,(g_Flags+$14).l
		beq.w	locret_1A308
		move.b	#$01,d0
		move.w	#$0020,d1
		bsr.w	SetSpriteZ
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19F60:					  ; CODE XREF: DoCustomRoomActions+3E0j
		cmpi.w	#$02B6,(g_RmNum1).l	  ; Jar	lady
		bne.s	loc_19F8C		  ; Wholesaler
		move.b	(g_Flags+$13).l,d0
		andi.b	#$E0,d0
		cmpi.b	#$60,d0
		bcs.w	locret_1A308
		move.b	#$01,d0
		move.w	#$0000,d1
		bsr.w	SetSpriteZ
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19F8C:					  ; CODE XREF: DoCustomRoomActions+406j
		cmpi.w	#$0295,(g_RmNum1).l	  ; Wholesaler
		bne.s	loc_19FE8		  ; Statue warp	in mountains
		lea	(Sprite1_X).l,a0
		btst	#$04,(g_Vars+$A).l
		bne.s	loc_19FCC
		btst	#$03,(g_Vars+$A).l
		beq.s	loc_19FCE
; End of function DoCustomRoomActions


; =============== S U B	R O U T	I N E =======================================


sub_19FB0:					  ; CODE XREF: sub_19FB0:loc_19FCCp
		move.b	#$7F,$00000400(a0)
		move.b	#$7F,$00000480(a0)
		move.b	#$7F,$00000500(a0)
		move.b	#$7F,$00000580(a0)
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19FCC:					  ; CODE XREF: DoCustomRoomActions+442j
		bsr.s	sub_19FB0

loc_19FCE:					  ; CODE XREF: DoCustomRoomActions+44Cj
		move.b	#$7F,(a0)
		move.b	#$7F,$00000080(a0)
		move.b	#$7F,$00000100(a0)
		move.b	#$7F,$00000180(a0)
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_19FE8:					  ; CODE XREF: DoCustomRoomActions+432j
		cmpi.w	#00486,(g_RmNum1).l	  ; Statue warp	in mountains
		bne.s	loc_1A00E		  ; Statue warp	at game	start
		btst	#$06,(g_Vars+$A).l
		beq.w	locret_1A308
		move.b	#$00,d0
		move.w	#$362D,d1
		bsr.w	MoveSprite
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_1A00E:					  ; CODE XREF: sub_19FB0+40j
		cmpi.w	#$0094,(g_RmNum1).l	  ; Statue warp	at game	start
		bne.s	loc_1A034
		btst	#$06,(g_Vars+$A).l
		beq.w	locret_1A308
		move.b	#$01,d0
		move.w	#$1B2B,d1
		bsr.w	MoveSprite
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_1A034:					  ; CODE XREF: sub_19FB0+66j
		cmpi.b	#SND_MusicTreeWarp,(g_BGM).l
		bne.s	loc_1A0A2		  ; Verla mine exit tunnel entrance
		lea	BigTreeLocations(pc),a5
		move.w	#$0009,d7
		move.w	(g_RmNum1).l,d0

loc_1A04C:					  ; CODE XREF: sub_19FB0+A2j
		cmp.w	(a5)+,d0
		beq.w	locret_1A308
		dbf	d7,loc_1A04C
		bra.s	loc_1A06C
; ---------------------------------------------------------------------------
