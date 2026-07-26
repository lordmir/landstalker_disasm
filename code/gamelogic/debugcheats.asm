DebugCheats	module
; Room load: rebuilds the fine camera origin (g_CameraFineX/Y) from the
; coarse + sub flattened player position minus Z, then renormalizes the
; coarse/sub bytes from the result.
InitCameraFlattenedCoords:
		move.b	(g_PlayerXFlattened).l,d0
		ext.w	d0
		lsl.w	#$04,d0
		add.b	(g_CameraSubX).l,d0
		move.w	(Player_Z).l,d1
		sub.w	d1,d0
		move.w	d0,(g_CameraFineX).l
		move.w	d0,d2
		andi.b	#$0F,d0
		move.b	d0,(g_CameraSubX).l
		lsr.w	#$04,d2
		move.b	d2,(g_PlayerXFlattened).l
		move.b	(g_PlayerYFlattened).l,d0
		ext.w	d0
		lsl.w	#$04,d0
		add.b	(g_CameraSubY).l,d0
		sub.w	d1,d0
		move.w	d0,(g_CameraFineY).l
		move.w	d0,d2
		andi.b	#$0F,d0
		move.b	d0,(g_CameraSubY).l
		lsr.w	#$04,d2
		move.b	d2,(g_PlayerYFlattened).l
		rts


; Debug pad 2 handling (skipped unless DebugModeEnable): START = warp
; to the next room (landing on the first walkable heightmap cell), B =
; pause until B is pressed again, holding UP = give all items. If the
; g_Flags+8 byte is set it instead locks up looping the dog-transform
; sound (tamper/cheat trap).
CheckForDebugButtons:
		tst.w	(DebugModeEnable).w
		bmi.w	_debugDone
		tst.b	(g_Flags+FLAGBYTE_DOORS_1).l
		beq.s	_chkWarp

_dogLoop:
		trap	#$00			  ; Trap00Handler
		dc.w SND_DogTransform
		move.w	#60,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames
		bra.s	_dogLoop

_chkWarp:
		tst.b	(g_Controller2State).l
		bpl.w	_chkPause
		bsr.w	FadeOutToDarkness

_nextRoom:
		addq.w	#$01,(g_CurrentRoom).l	  ; Debug room warp
		move.w	(g_CurrentRoom).l,d0
		bsr.w	LoadRoomParams
		lea	(g_HeightMap).l,a0

_findFloorTile:
		cmpa.l	#Stack,a0
		bcc.s	_nextRoom		  ; Debug room warp
		move.w	(a0)+,d0
		andi.w	#$403F,d0
		bne.s	_findFloorTile		  ; Find first occupiable tile in room
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
		bra.w	InitRoomDisplayAndFadeIn

_chkPause:
		btst	#CTRL_B,(g_Controller2State).l
		beq.s	_chkItemCheat

_waitBRelease:
		bsr.w	WaitUntilVBlank
		bsr.w	UpdateControllerInputs
		btst	#CTRL_B,(g_Controller2State).l
		bne.s	_waitBRelease

_waitBPress:
		bsr.w	WaitUntilVBlank
		bsr.w	UpdateControllerInputs
		btst	#CTRL_B,(g_Controller2State).l
		beq.s	_waitBPress

_waitBRelease2:
		bsr.w	WaitUntilVBlank
		bsr.w	UpdateControllerInputs
		btst	#CTRL_B,(g_Controller2State).l
		bne.s	_waitBRelease2

_chkItemCheat:
		btst	#CTRL_UP,(g_Controller2State).l


_itemCheat:
		beq.s	_noCheat
		jsr	(j_DebugGetAllItems).l
		rts

_noCheat:
		rts


; Debug: A on pad 2 saves the game on the spot.
CheckForDebugSaveGame:
		tst.w	(DebugModeEnable).w
		bmi.w	_debugDone
		btst	#CTRL_A,(g_Controller2State).l
		beq.w	_chkPause
		bsr.w	SaveGame

_debugDone:
		rts


LoadGameSelectScreen:
		bsr.s	CheckRAM
		move.b	(g_SaveSlot).l,d0
		jsr	(InitGameSelectScreen).l
		jsr	(j_SetUpTextDisplay).l
		rts


; Cold-boot detection: looks for the 'Kan&Makiko' signature at the
; start of RAM; if absent (fresh power-on) writes it and resets the
; save slot.
CheckRAM:
		lea	(RAM_Start).l,a0
		lea	aKanMakiko(pc),a1	  ; "Kan&Makiko"
		moveq	#$9,d7

_sigCompare:
		cmpm.b	(a1)+,(a0)+
		bne.s	_coldBoot
		dbf	d7,_sigCompare
		rts

_coldBoot:
		lea	(RAM_Start).l,a0
		lea	aKanMakiko(pc),a1	  ; "Kan&Makiko"
		moveq	#$9,d7

_sigWrite:
		move.b	(a1)+,(a0)+
		dbf	d7,_sigWrite
		clr.b	(g_SaveSlot).l
		rts

aKanMakiko:	dc.b 'Kan&Makiko'

		modend
