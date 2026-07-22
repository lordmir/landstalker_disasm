Items3	module
; Item use, part 3: the rest of the pre-use handlers, the shared
; exits, and the post-use pass - RunItemPostUse runs after the menu
; has closed and the room reloaded, for the items whose effects
; warp, run cutscenes or swap tiles.

; Garlic: only in Miro's room of Mir's Tower; the effect itself is the
; post-use flag.
ItemUseGarlic:
		cmpi.w	#ROOM_MIRS_TOWER_MIRO,(g_CurrentRoom).l
		bne.w	ReturnFailure
		cmpi.b	#$11,(Player_Y).l
		bhi.w	ReturnFailure
		bra.w	ReturnSuccessAndEnablePostUse
; ---------------------------------------------------------------------------

; Anti Paralyze: cure paralysis.
ItemUseAntiparalyze:
		jsr	(j_GetPlayerStatus).l
		btst	#STATUS_PARALYSIS,d0
		beq.w	ReturnFailure
		bsr.w	ConsumeItem
		move.b	#STATUS_PARALYSIS,d0
		jsr	(j_ClearPlayerStatus).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_HealthRecover2

		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

; Unreachable leftover: turn the player into the dog sprite.
_orphanDogForm:
		move.b	#$01,(Player_AnimCtrl).l
		move.b	#SpriteB_Dog,(Player_SpriteGraphic).l
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

; Einstein Whistle: only on the whistle spot above the Sunstone in
; Greenmaze (and, with FIX_WHISTLE_CHECK, only once); the cutscene
; runs in the post-use pass.
ItemUseEinsteinWhistle:
		cmpi.w	#ROOM_GREENMAZE_SUNSTONE,(g_CurrentRoom).l
		bne.w	ReturnFailure
		move.b	(Player_X).l,d0
		subi.b	#$2F,d0
		cmpi.b	#$04,d0
		bcc.w	ReturnFailure
		move.b	(Player_Y).l,d0
		subi.b	#$1E,d0
		cmpi.b	#$04,d0
		bcc.w	ReturnFailure
	if	FIX_WHISTLE_CHECK
		TestFlag	FLAG_EINSTEIN_WHISTLE_USED
		bne.w	ReturnFailure
	endif
		bra.w	ReturnSuccessAndEnablePostUse
; ---------------------------------------------------------------------------

; Spell Book: no effect - it is just consumed.
ItemUseSpellbook:
		bsr.w	ConsumeItem
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

; Lithograph: never usable (its hint text is read in the menu).
ItemUseLithograph:
		bra.w	ReturnFailure
; ---------------------------------------------------------------------------

; Pawn Ticket: once per game (g_AdditionalFlags+$19 bit 7), trade
; health for gold - one heart at a time for 10 gold each, with a
; chime every 10 frames, until a sliver ($FF) remains.
ItemUsePawnTicket:
		SetFlag	FLAG_PAWN_TICKET_USED
		bne.w	ReturnFailure

_ptDrain:
		move.w	(Player_CurrentHealth).l,d0
		subi.w	#$0100,d0
		bcs.w	_ptDone
		bne.s	_ptStore
		move.w	#$00FF,d0

_ptStore:
		move.w	d0,(Player_CurrentHealth).l
		move.w	#$000A,d0
		jsr	(j_AddGold).l
		jsr	(j_RefreshCurrentHealthHUD).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		jsr	(j_EnableDMAQueueProcessing).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_HealthRecover1

		move.w	#00010,d0
		jsr	(j_Sleep).l
		bra.s	_ptDrain
; ---------------------------------------------------------------------------

_ptDone:
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

; Gola's Eye: only on the statue spot in the mountains, at floor
; height $20, once; the flags are set in the post-use pass.
ItemUseGolasEye:
		cmpi.w	#ROOM_MOUNTAINS_STATUE,(g_CurrentRoom).l
		bne.w	ReturnFailure
		move.b	(Player_X).l,d0
		subi.b	#$37,d0
		cmpi.b	#$03,d0
		bcc.w	ReturnFailure
		move.b	(Player_Y).l,d0
		subi.b	#$2B,d0
		cmpi.b	#$05,d0
		bcc.w	ReturnFailure
		cmpi.b	#$20,(Player_FloorHeight).l
		bne.w	ReturnFailure
		TestFlag	FLAG_GOLAS_EYE_USED
		bne.w	ReturnFailure
		bra.w	ReturnSuccessAndEnablePostUse
; ---------------------------------------------------------------------------

; Death Statue: print its text ($1C) and roll 0-19: 0-7 a random
; status effect (roll & 3), 8-11 a full heal, 12-19 fill the
; rolled bonus item's stock to 9.
ItemUseDeathStatue:
		move.w	#$001C,d0
		jsr	(j_PrintString).l
		move.w	#00020,d6
		bsr.w	GenerateRandomNumber
		cmpi.b	#$08,d7
		bcs.s	_dsStatus
		cmpi.b	#$0C,d7
		bcs.s	_dsHeal
		bra.s	_dsGrant
; ---------------------------------------------------------------------------

_dsStatus:
		andi.b	#$03,d7
		move.w	d7,d0
		jsr	(j_AddStatusEffect).l
		bra.s	_dsConsume
; ---------------------------------------------------------------------------

_dsHeal:
		move.w	#$FFFF,d0
		lea	(Player_X).l,a5
		jsr	(j_AddHealth).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		bra.s	_dsConsume
; ---------------------------------------------------------------------------

_dsGrant:
		subi.w	#$000C,d7
		move.b	DeathStatueItemBonus(pc,d7.w),d0
		move.b	#$09,d1
		jsr	(j_SetItemQuantity).l

_dsConsume:
		bsr.w	ConsumeItem
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------
DeathStatueItemBonus:dc.b ITM_EKEEKE
		dc.b ITM_GOLDENSTATUE
		dc.b ITM_GAIASTATUE
		dc.b ITM_DAHL
		dc.b ITM_DETOXGRASS
		dc.b ITM_MINDREPAIR
		dc.b ITM_RESTORATION
		dc.b ITM_CASINOTICKET
		dcb.b 2,ITM_EKEEKE
; ---------------------------------------------------------------------------

; Dahl: a full heal.
ItemUseDahl:
		move.w	#$FFFF,d0
		lea	(Player_X).l,a5
		jsr	(j_AddHealth).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		bsr.w	ConsumeItem
		trap	#$00			  ; Trap00Handler
		dc.w SND_HealthRecover2

		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

; Restoration: cure poison, confusion and paralysis (needs at
; least one of them).
ItemUseRestoration:
		jsr	(j_GetPlayerStatus).l
		andi.b	#$07,d0
		beq.w	ReturnFailure
		move.b	#$00,d0
		jsr	(j_ClearPlayerStatus).l
		move.b	#$01,d0
		jsr	(j_ClearPlayerStatus).l
		move.b	#$02,d0
		jsr	(j_ClearPlayerStatus).l
		bsr.w	ConsumeItem
		trap	#$00			  ; Trap00Handler
		dc.w SND_HealthRecover2

		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

; Logs: build the raft - each of the two raft rooms has its own
; landing spot and one-time flag.
ItemUseLogs:
		cmpi.w	#ROOM_LABRYNTH_RAFT1,(g_CurrentRoom).l
		bne.s	_logsRaft2
		move.w	(Player_X).l,d0
		andi.w	#$FEFE,d0
		cmpi.w	#$2C2E,d0
		bne.w	ReturnFailure
		SetFlag	FLAG_RAFT1_BUILT
		bne.w	ReturnFailure
		bsr.w	ConsumeItem
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

_logsRaft2:
		cmpi.w	#ROOM_LABRYNTH_RAFT2,(g_CurrentRoom).l
		bne.w	ReturnFailure
		move.b	(Player_X).l,d0
		andi.b	#$FE,d0
		cmpi.w	#$0014,d0
		bne.w	ReturnFailure
		move.b	(Player_Y).l,d0
		subq.b	#$01,d0
		andi.b	#$FE,d0
		cmpi.w	#$0010,d0
		bne.w	ReturnFailure
		SetFlag	FLAG_RAFT2_BUILT
		bne.w	ReturnFailure
		bsr.w	ConsumeItem
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

; Oracle Stone: does nothing (its reading was printed in the
; menu).
ItemUseOracleStone:
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

; Idol Stone: on the spot before the Swamp Shrine entrance, once
; (g_Flags bit 6); the tile swap runs in the post-use pass.
ItemUseIdolStone:
		TestFlag	FLAG_SWAMP_SHRINE_OPENED
		bne.w	ReturnFailure
		cmpi.w	#ROOM_SWAMP_SHRINE_ENTRANCE,(g_CurrentRoom).l
		bne.w	ReturnFailure
		cmpi.b	#$0F,(Player_X).l
		bhi.w	ReturnFailure
		cmpi.b	#$19,(Player_Y).l
		bcs.w	ReturnFailure
		cmpi.b	#$1B,(Player_Y).l
		bhi.w	ReturnFailure
		bra.w	ReturnSuccessAndEnablePostUse
; ---------------------------------------------------------------------------

; Key: standing on a locked-door floor type; the SE/SW door types
; also validate through CheckUnlockDoor. The unlock itself is the
; post-use pass.
ItemUseKey:
		move.b	(Player_GroundType).l,d0
		andi.b	#$3F,d0
		cmpi.b	#FLOOR_LOCKED_DOOR,d0
		bcs.w	ReturnFailure
		cmpi.b	#$1D,d0
		bcs.s	_keyConsume
		cmpi.b	#FLOOR_LOCKED_DOOR_SE,d0
		beq.s	_keyCheckDoor
		cmpi.b	#FLOOR_LOCKED_DOOR_SW,d0
		bne.w	ReturnFailure

_keyCheckDoor:
		jsr	(j_CheckUnlockDoor).l
		bcc.w	ReturnFailure

_keyConsume:
		bsr.s	ConsumeItem
		bra.w	ReturnSuccessAndEnablePostUse
; ---------------------------------------------------------------------------

; Bell: rings out (with the chime) when a Lifestock is somewhere
; in the room.
ItemUseBell:
		bsr.s	CheckForLifestock
		bcc.w	ReturnFailure
		bra.w	ReturnSuccess

; Scan the 15 sprite slots for an item or chest holding a
; Lifestock: carry set (and the chime played) when found. Also
; used by DoorWarp.
CheckForLifestock:
		lea	(Sprite1_X).l,a0
		moveq	#$0000000E,d7

_clsScan:
		tst.w	(a0)
		bmi.s	_clsNone
		cmpi.b	#$7F,X(a0)
		beq.s	_clsNext
		cmpi.b	#SpriteB_Item,SpriteGraphic(a0)
		bne.s	_clsChest
		cmpi.b	#ITM_LIFESTOCK,GoldOrChestContents(a0)
		beq.s	_clsFound
		bra.s	_clsNext
; ---------------------------------------------------------------------------

_clsChest:
		cmpi.b	#SpriteB_Chest,SpriteGraphic(a0)
		bne.s	_clsNext
		cmpi.b	#ITM_LIFESTOCK,GoldOrChestContents(a0)
		beq.s	_clsFound

_clsNext:
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,_clsScan
		bra.s	_clsNone
; ---------------------------------------------------------------------------

_clsFound:
		trap	#$00			  ; Trap00Handler
		dc.w SND_HealthRecover1

		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

_clsNone:
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

; Shortcake: the 50/50 outcome plays out in the post-use pass.
ItemUseShortcake:
		bsr.w	ConsumeItem
		bra.w	ReturnSuccessAndEnablePostUse

; Take one of the item being used and reset the menu window.
ConsumeItem:
		move.b	(g_ItemBeingUsed).l,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		subq.w	#$01,d1
		jsr	(j_CheckAndConsumeItem).l
		bsr.w	ClearInventoryWindow
		rts
; ---------------------------------------------------------------------------

; Shared exits: arming bit 7 of g_ItemBeingUsed makes the item
; match its ($80 | id) entry in PostUseItemTable after the room
; reloads.
ReturnSuccessAndEnablePostUse:
		bset	#$07,(g_ItemBeingUsed).l

ReturnSuccess:
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

ReturnFailure:
		bsr.w	PrintNothingHappenedString
		tst.b	d0
		rts

; The post-use pass, called by the menu (inventory1) once the room
; has reloaded: find g_ItemBeingUsed's entry in PostUseItemTable -
; only armed items match, since the table ids carry bit 7 - and
; run it. Same {bra.w handler, id, $FF} format as the pre-use
; table.
RunItemPostUse:
		move.b	(g_ItemBeingUsed).l,d0
		lea	PostUseItemTable(pc),a0

_puScan:
		move.b	0000000004(a0),d2
		cmpi.b	#$FF,d2
		beq.s	_puDone
		cmp.b	d0,d2
		beq.s	_puRun
		addq.l	#$06,a0
		bra.s	_puScan
; ---------------------------------------------------------------------------

_puRun:
		jmp	(a0)
; ---------------------------------------------------------------------------

_puDone:
		rts
; ---------------------------------------------------------------------------

; Garlic, after the reload: set the flag Miro reacts to.
PostUseGarlic:
		SetFlag	FLAG_GARLIC_USED
		rts
; ---------------------------------------------------------------------------

; Einstein Whistle, after the reload: whistle, warp invisibly to
; the woodcutter's clearing, play cutscene $B7 (Einstein comes
; running), then warp back to the Sunstone spot, restore the BGM
; and set the used flag.
PostUseEinsteinWhistle:
		trap	#$00			  ; Trap00Handler
		dc.w SND_MusicDogWhistle

		move.w	#$0167,d0
		jsr	(j_Sleep).l
		move.l	(Player_X).l,d0
		movem.l	d0,-(sp)
		move.w	#ROOM_GREENMAZE_CUTTER,(g_CurrentRoom).l	  ; Wood cutter	area
		move.w	#$1732,(Player_X).l
		bset	#$06,(Player_InteractFlags).l
		SetFlag	FLAG_EINSTEIN_WHISTLE_USED
		bsr.w	WarpToRoom
		trap	#$00			  ; Trap00Handler
		dc.w SND_MusicDogWhistle

		move.w	#$00B7,d0
		jsr	(FlushDMACopyQueue).l
		jsr	(j_PlayCutsceneScript).l
		move.w	#ROOM_GREENMAZE_SUNSTONE,(g_CurrentRoom).l	  ; Sunstone
		movem.l	(sp)+,d0
		move.l	d0,(Player_X).l
		bclr	#$06,(Player_InteractFlags).l
		ClearFlag	FLAG_EINSTEIN_WHISTLE_USED
		bsr.w	WarpToRoom
		move.b	(g_BGM).l,d0
		trap	#$00			  ; Trap00Handler
		dc.w SND_LoadFromD0

		SetFlag	FLAG_EINSTEIN_WHISTLE_USED
		rts
; ---------------------------------------------------------------------------

; Gola's Eye, after the reload: set its used flag and the story
; flag that opens the way.
PostUseGolasEye:
		SetFlag	FLAG_GOLAS_EYE_USED
		SetFlag	FLAG_SCRATCH_EVENT_DONE
		rts
; ---------------------------------------------------------------------------

; Idol Stone, after the reload: rumble and run the two-stage tile
; swap that opens the shrine entrance, then set its flag.
PostUseIdolStone:
		trap	#$00			  ; Trap00Handler
		dc.w SND_Rumble

		move.b	#$08,d0
		bsr.w	DoTileSwap
		move.w	#$001E,d0
		jsr	(Sleep).l		  ; Sleeps for d0 frames
		move.b	#$10,d0
		bsr.w	DoTileSwap
		SetFlag	FLAG_SWAMP_SHRINE_OPENED
		rts
; ---------------------------------------------------------------------------

; Key, after the reload: unlock the door under the player - the
; SE/SW door types through the UnlockDoor handler, the others with
; a direct tile swap plus a ground-height refresh.
PostUseKey:
		trap	#$00			  ; Trap00Handler
		dc.w SND_DoorLock

		move.b	(Player_GroundType).l,d2
		andi.b	#$3F,d2
		cmpi.b	#FLOOR_LOCKED_DOOR_SE,d2
		beq.s	_pukScripted
		cmpi.b	#FLOOR_LOCKED_DOOR_SW,d2
		beq.s	_pukScripted
		subi.b	#FLOOR_LOCKED_DOOR,d2
		bsr.w	UnlockDoorTileSwap
		move.l	#$00FF0000,d0
		move.w	(Player_HeightmapOffset).l,d0
		movea.l	d0,a0
		move.w	(a0),(Player_GroundHeight).l
		rts
; ---------------------------------------------------------------------------

_pukScripted:
		jsr	(j_UnlockDoor).l
		rts
; ---------------------------------------------------------------------------

; Shortcake, after the reload - a coin flip: cutscene $153 and the
; EkeEke stock filled to 9 plus a full heal, or cutscene $152 with
; health dropped to a sliver ($FF) and the EkeEke stock wiped.
PostUseShortcake:
		move.w	#$0002,d6
		bsr.w	GenerateRandomNumber
		tst.b	d7
		beq.s	_pusBad
		move.w	#$0153,d0
		jsr	(j_FlushDMACopyQueue).l
		jsr	(j_PlayCutsceneScript).l
		move.b	#$00,d0
		move.b	#$09,d1
		jsr	(j_SetItemQuantity).l
		move.w	#$FFFF,d0
		lea	(Player_X).l,a5
		jsr	(j_AddHealth).l
		jsr	(j_UpdateEkeEkeHUD).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		rts
; ---------------------------------------------------------------------------

_pusBad:
		move.w	#$0152,d0
		jsr	(j_FlushDMACopyQueue).l
		jsr	(j_PlayCutsceneScript).l
		move.w	#$00FF,(Player_CurrentHealth).l
		jsr	(j_RefreshCurrentHealthHUD).l
		move.b	#$00,d0
		move.b	#$00,d1
		jsr	(j_SetItemQuantity).l
		jsr	(j_UpdateEkeEkeHUD).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		rts

	modend
