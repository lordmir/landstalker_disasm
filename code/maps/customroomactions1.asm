CustomRoomActions    module

; Hand-coded per-room fixups, run while the room's sprites spawn
; (before the table-driven flag appliers in roomspriteflags): moving
; NPCs after story events, hiding companions or guards, waking
; defeated minibosses' rooms, converting the chicken racers, etc.
; One chained room test per special case, spanning this file and
; customroomactions2.asm.
DoCustomRoomActions:
		cmpi.w	#ROOM_MERCATOR_CENTRE,(g_OriginalRoom).l
		bne.s	_Next0
		bclr	#$03,(g_AdditionalFlags+9).l

_Next0:
		cmpi.w	#ROOM_MASSAN_WATERFALL,(g_CurrentRoom).l
		bne.s	_Next1			  ; Gumi
		cmpi.b	#$22,(Player_Y).l
		bcs.s	_waterfallHide
		cmpi.b	#$28,(Player_Y).l
		bcs.w	EndCustomRoomAction

_waterfallHide:
		move.b	#$00,d0
		bsr.w	HideSpriteAtD0
		move.b	#$01,d0
		bsr.w	HideSpriteAtD0
		bra.w	EndCustomRoomAction

_Next1:
		cmpi.w	#ROOM_GUMI,(g_CurrentRoom).l	  ; Gumi
		bne.s	_Next2			  ; Swamp shrine boss room
		btst	#$02,(g_Flags+2).l
		bne.w	EndCustomRoomAction
		move.w	#$FFFF,(Sprite3_X).l
		bra.w	EndCustomRoomAction

_Next2:
		cmpi.w	#ROOM_SWAMP_SHRINE_BOSS,(g_CurrentRoom).l	  ; Swamp shrine boss room
		bne.s	_Next3			  ; Path between Gumi and Ryuma
		btst	#$05,(g_Flags+2).l
		beq.w	EndCustomRoomAction
		move.w	#$FFFF,(Sprite1_X).l
		bra.w	EndCustomRoomAction

_Next3:
		cmpi.w	#ROOM_GUMI_PATH_LANDSLIDE,(g_CurrentRoom).l	  ; Path between Gumi and Ryuma
		bne.s	_Next4			  ; Ryuma entrance to thieve's cave
		btst	#$06,(g_Flags+2).l
		beq.w	EndCustomRoomAction
		move.w	#$2119,(Sprite2_X).l
		clr.w	(Sprite2_Z).l
		bra.w	EndCustomRoomAction

_Next4:
		cmpi.w	#ROOM_THIEVES_CAVE_ENTRANCE,(g_CurrentRoom).l	  ; Ryuma entrance to thieve's cave
		bne.s	_Next5		  ; Thieve's Cave Entrance (with water)
		cmpi.b	#$0F,(Player_Y).l
		beq.s	_caveHideNear
		move.b	#$03,d0
		bra.w	HideSpriteAtD0

_caveHideNear:
		move.b	#$01,d0
		bra.w	HideSpriteAtD0

_Next5:
		cmpi.w	#ROOM_THIEVES_CAVE_FIRST_WATER,(g_CurrentRoom).l	  ; Thieve's Cave Entrance (with water)
		bne.s	_Next6			  ; Thieve's cave entrance (without water)
		cmpi.b	#$24,(Player_Y).l
		bcc.s	_waterHideFar
		move.b	#$05,d0
		bra.w	HideSpriteAtD0

_waterHideFar:
		move.b	#$07,d0
		bra.w	HideSpriteAtD0

_Next6:
		cmpi.w	#ROOM_THIEVES_CAVE_FIRST_NO_WATER,(g_CurrentRoom).l	  ; Thieve's cave entrance (without water)
		bne.s	_Next7			  ; Massan mayor's house
		cmpi.b	#$24,(Player_Y).l
		bcc.s	_dryHideFar
		move.b	#$05,d0
		bra.w	HideSpriteAtD0

_dryHideFar:
		move.b	#$07,d0
		bra.w	HideSpriteAtD0

_Next7:
		cmpi.w	#ROOM_MASSAN_MAYORS_HOUSE,(g_CurrentRoom).l	  ; Massan mayor's house
		bne.s	_Next8			  ; Jar	Lady Upstairs
		tst.b	(g_Flags).l
		bpl.w	EndCustomRoomAction
		move.b	#$02,d0
		bsr.w	HideSpriteAtD0
		lea	(Sprite1_X).l,a1
		move.w	#$1012,X(a1)
		andi.b	#$3F,RotationAndSize(a1)
		btst	#$04,(g_Flags).l
		bne.s	_mayorAltPose
		clr.b	d1
		bsr.w	SetSpriteRotationAnimFlags
		lea	(Sprite2_X).l,a1
		move.w	#$120F,(a1)
		move.b	#$C0,d1
		or.b	d1,RotationAndSize(a1)
		bsr.w	SetSpriteRotationAnimFlags
		bra.w	EndCustomRoomAction

_mayorAltPose:
		andi.b	#$3F,RotationAndSize(a1)
		move.b	#$40,d1
		or.b	d1,RotationAndSize(a1)
		bsr.w	SetSpriteRotationAnimFlags
		lea	(Sprite2_X).l,a1
		move.w	#$1210,(a1)
		andi.b	#$3F,RotationAndSize(a1)
		move.b	#$80,d1
		or.b	d1,RotationAndSize(a1)
		bsr.w	SetSpriteRotationAnimFlags
		bra.w	EndCustomRoomAction

_Next8:
		cmpi.w	#ROOM_MERCATOR_JARS_UPSTAIRS,(g_CurrentRoom).l	  ; Jar	Lady Upstairs
		bne.s	_Next9			  ; Mercator North
		btst	#$03,(g_Flags+3).l
		beq.w	EndCustomRoomAction
		move.b	#$07,d0
		move.w	#$1F23,d1
		bsr.w	MoveSprite
		move.w	#$0010,d1
		bsr.w	SetSpriteZ
		bra.w	EndCustomRoomAction

_Next9:
		cmpi.w	#ROOM_MERCATOR_NORTH,(g_CurrentRoom).l	  ; Mercator North
		bne.s	_Next10			  ; Mercator Harbour
		btst	#$04,(g_Flags+$14).l
		beq.w	EndCustomRoomAction
		move.b	#$00,d0
		move.w	#$3336,d1
		bsr.w	MoveSprite
		bra.w	EndCustomRoomAction

_Next10:
		cmpi.w	#ROOM_MERCATOR_HARBOUR,(g_CurrentRoom).l	  ; Mercator Harbour
		bne.s	_Next11			  ; Castle entrance
		btst	#$05,(g_Flags+$14).l
		beq.w	EndCustomRoomAction
		move.b	#$04,d0
		move.w	#$1E1A,d1
		bsr.w	MoveSprite
		move.w	#$0010,d1
		bsr.w	SetSpriteZ
		bra.w	EndCustomRoomAction

_Next11:
		cmpi.w	#ROOM_CASTLE_ENTRANCE,(g_CurrentRoom).l	  ; Castle entrance
		bne.s	_Next12			  ; Crypt
		btst	#$00,(g_Flags+$14).l
		beq.w	EndCustomRoomAction
		move.b	#$00,d0
		move.w	#$2218,d1
		bsr.w	MoveSprite
		move.b	#$01,d0
		move.w	#$2518,d1
		bsr.w	MoveSprite
		bra.w	EndCustomRoomAction

_Next12:
		cmpi.w	#ROOM_CRYPT_MAIN_HALL,(g_CurrentRoom).l	  ; Crypt
		bne.s	_Next13			  ; Castle
		cmpi.b	#$FF,(g_Flags+$15).l
		bne.s	_cryptHideOff
		bset	#$03,(g_Flags+$16).l
		cmpi.b	#$21,(Player_X).l
		bcs.s	_cryptWestHide
		move.b	#$00,d0
		bsr.w	HideSpriteAtD0
		move.b	#$01,d0
		bsr.w	HideSpriteAtD0
		bra.w	EndCustomRoomAction

_cryptWestHide:
		btst	#$06,(g_Flags+$14).l
		bne.s	_cryptHideOff
		move.b	#$02,d0
		bsr.w	HideSpriteAtD0
		move.b	#$03,d0
		bsr.w	HideSpriteAtD0
		bra.w	EndCustomRoomAction

_cryptHideOff:
		move.b	#$01,d0
		move.w	#$FFFF,d1
		bsr.w	MoveSprite
		bra.w	EndCustomRoomAction

_Next13:
		cmpi.w	#ROOM_CASTLE_MAIN_HALL,(g_CurrentRoom).l	  ; Castle
		bne.s	_Next14			  ; Marsh shrine EkeEke	fall
		btst	#$00,(g_Flags+$14).l
		beq.w	EndCustomRoomAction
		move.b	#$00,d0
		move.w	#$1619,d1
		bsr.w	MoveSprite
		move.w	#$0010,d1
		bsr.w	SetSpriteZ
		move.w	#$0002,d1
		bsr.w	SetSpriteFacing
		bra.w	EndCustomRoomAction

_Next14:
		cmpi.w	#ROOM_SWAMP_SHRINE_EKEEKE_PRIZE,(g_CurrentRoom).l	  ; Marsh shrine EkeEke	fall
		bne.s	_Next15			  ; Prison cell
		btst	#$02,(g_Flags+$A).l
		beq.w	EndCustomRoomAction
		move.b	#$00,d0
		move.w	#$0010,d1
		bsr.w	SetSpriteZ
		bra.w	EndCustomRoomAction

_Next15:
		cmpi.w	#ROOM_CASTLE_PRISON_CELL_4,(g_CurrentRoom).l	  ; Prison cell
		bne.s	_Next16			  ; Mercator Harbour
		move.b	#$00,d0
		btst	#$05,(g_AdditionalFlags).l
		beq.w	HideSpriteAtD0
		btst	#$01,(g_AdditionalFlags+7).l
		bne.w	HideSpriteAtD0
		btst	#$07,(g_AdditionalFlags).l
		beq.w	EndCustomRoomAction
		move.w	#$0F10,d1
		bsr.w	MoveSprite
		bra.w	EndCustomRoomAction

_Next16:
		cmpi.w	#ROOM_MERCATOR_HARBOUR_AFTER_SUNSTONE,(g_CurrentRoom).l	  ; Mercator Harbour
		bne.s	_Next17			  ; Verla mine exit to Destel
		btst	#$05,(g_AdditionalFlags+$A).l
		bne.w	EndCustomRoomAction
		cmpi.b	#$24,(Player_X).l
		bhi.w	EndCustomRoomAction
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		bne.w	EndCustomRoomAction
		move.b	#$00,d0
		move.w	#$0002,d1
		bsr.w	SetSpriteFacing
		ext.w	d0
		lsl.w	#$07,d0
		adda.w	d0,a5
		clr.w	BehavParam(a5)
		bra.w	EndCustomRoomAction

_Next17:
		cmpi.w	#ROOM_VERLA_MINE_PATH_TO_DESTEL,(g_CurrentRoom).l	  ; Verla mine exit to Destel
		bne.s	_Next18			  ; Crypt boss room
		btst	#$00,(g_AdditionalFlags+8).l
		beq.w	EndCustomRoomAction
		move.b	#$00,d0
		move.w	#$0D11,d1
		bsr.w	MoveSprite
		move.b	#$01,d0
		move.w	#$0D15,d1
		bsr.w	MoveSprite
		bra.w	EndCustomRoomAction

_Next18:
		cmpi.w	#ROOM_CRYPT_BOSS,(g_CurrentRoom).l	  ; Crypt boss room
		bne.s	_Next19			  ; Jar	lady
		btst	#$06,(g_Flags+$14).l
		beq.w	EndCustomRoomAction
		move.b	#$01,d0
		move.w	#$0020,d1
		bsr.w	SetSpriteZ
		bra.w	EndCustomRoomAction

_Next19:
		cmpi.w	#ROOM_MERCATOR_JARS_DOWNSTAIRS,(g_CurrentRoom).l	  ; Jar	lady
		bne.s	_Next20			  ; Wholesaler
		move.b	(g_Flags+$13).l,d0
		andi.b	#$E0,d0
		cmpi.b	#$60,d0
		bcs.w	EndCustomRoomAction
		move.b	#$01,d0
		move.w	#$0000,d1
		bsr.w	SetSpriteZ
		bra.w	EndCustomRoomAction

_Next20:
		cmpi.w	#ROOM_MERCATOR_WHOLESALER,(g_CurrentRoom).l	  ; Wholesaler
		bne.s	_Next21			  ; Statue Warp	In Mountains
		lea	(Sprite1_X).l,a0
		btst	#$04,(g_AdditionalFlags+$A).l
		bne.s	_hideAllStock
		btst	#$03,(g_AdditionalFlags+$A).l
		beq.s	_hideFrontStock


; Wholesaler stock control: hides sprites 9-12 (the restricted
; stock), and/or sprites 1-4 below, by pushing their X offscreen.
_hideBackStock:
		move.b	#$7F,(SPRITE_SIZE*8)(a0)
		move.b	#$7F,(SPRITE_SIZE*9)(a0)
		move.b	#$7F,(SPRITE_SIZE*10)(a0)
		move.b	#$7F,(SPRITE_SIZE*11)(a0)
		bra.w	_Done

_hideAllStock:
		bsr.s	_hideBackStock

_hideFrontStock:
		move.b	#$7F,(a0)
		move.b	#$7F,SPRITE_SIZE(a0)
		move.b	#$7F,(SPRITE_SIZE*2)(a0)
		move.b	#$7F,(SPRITE_SIZE*3)(a0)
		bra.w	_Done

_Next21:
		cmpi.w	#ROOM_MOUNTAINS_STATUE,(g_CurrentRoom).l	  ; Statue Warp	In Mountains
		bne.s	_Next22
		btst	#$06,(g_AdditionalFlags+$A).l
		beq.w	_Done
		move.b	#$00,d0
		move.w	#$362D,d1
		bsr.w	MoveSprite
		bra.w	_Done

_Next22:
		cmpi.w	#ROOM_CAVE_GAME_BEGIN,(g_CurrentRoom).l
		bne.s	_Next23
		btst	#$06,(g_AdditionalFlags+$A).l
		beq.w	_Done
		move.b	#$01,d0
		move.w	#$1B2B,d1
		bsr.w	MoveSprite
		bra.w	_Done

; Rooms playing the tree-warp theme ($1D) that are not one of the
; ten big-tree rooms get the hostile-hiding treatment in
; ContinueTreeWarpCheck (customroomactions2.asm).
_Next23:
		cmpi.b	#$1D,(g_BGM).l
		bne.s	_Next24			  ; Verla mine exit tunnel entrance
		lea	BigTreeLocations(pc),a5
		move.w	#$0009,d7
		move.w	(g_CurrentRoom).l,d0

_treeRoomScan:
		cmp.w	(a5)+,d0
		beq.w	_Done
		dbf	d7,_treeRoomScan
		bra.s	ContinueTreeWarpCheck
