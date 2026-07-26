ItemPostUse	module

; The post-use pass, called by the menu (inventorymenu) once the room
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
		bset	#IF_NO_DRAW,(Player_InteractFlags).l
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
		bclr	#IF_NO_DRAW,(Player_InteractFlags).l
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
