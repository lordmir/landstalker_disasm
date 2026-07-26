FloorTypes	module
; Dispatches on the floor type under the player (GroundType & $3F)
; through the jump table below.
ProcessFloorType:
		move.b	(Player_GroundType).l,d0
		andi.w	#$003F,d0
		lsl.b	#$02,d0
		jmp	FloorTypeDispatch(pc,d0.w)


; One entry per FLOOR_* type (floors.inc); most floors do nothing.
FloorTypeDispatch:
		bra.w	_floorDone		  ; Normal
		bra.w	HandleFloorDoorNE	  ; Door NE
		bra.w	HandleFloorDoorSE	  ; Door SE
		bra.w	HandleFloorDoorSW	  ; Door SW
		bra.w	HandleFloorDoorNW	  ; Door NW
		bra.w	HandleFloorStairs	  ; Stairs
		bra.w	HandleFloorDoor		  ; Door
		bra.w	HandleFloorPit		  ; Pit
		bra.w	HandleFloorWarpPad	  ; Warp Pad
		bra.w	_warpExitNW
		bra.w	_floorDone
		bra.w	HandleFloorLadder	  ; Ladder NW
		bra.w	HandleFloorLadder	  ; Ladder NE
		bra.w	_warpExitNE
		bra.w	_floorDone		  ; Counter
		bra.w	HandleFloorElevator	  ; Elevator
		bra.w	HandleFloorSpikes	  ; Spikes
		bra.w	_floorDone		  ; Sign NW #1
		bra.w	_floorDone		  ; Sign NW #2
		bra.w	_floorDone		  ; Sign NW #3
		bra.w	_floorDone		  ; Sign NW #4
		bra.w	_floorDone		  ; Sign NE #1
		bra.w	_floorDone		  ; Sign NE #2
		bra.w	_floorDone		  ; Sign NE #3
		bra.w	_floorDone		  ; Sign NE #4
		bra.w	HandleFloorSwamp	  ; Swamp
		bra.w	_floorDone		  ; Locked Door
		bra.w	_floorDone
		bra.w	_floorDone
		bra.w	_floorDone
		bra.w	_floorDone
		bra.w	_floorDone
		bra.w	_floorDone
		bra.w	_floorDone
		bra.w	_floorDone		  ; Sign NE #5
		bra.w	_floorDone		  ; Sign NE #6
		bra.w	_floorDone		  ; Sign NE #7
		bra.w	_floorDone		  ; Sign NE #8
		bra.w	HandleFloorDoorSE	  ; Locked Door	SE
		bra.w	HandleFloorDoorSW	  ; Locked Door	SW
		bra.w	HandleNoleStaircase	  ; Nole Staircase
		bra.w	HandleLava		  ; Lava
		bra.w	HandleIceNE		  ; Ice	NE
		bra.w	HandleIceSE		  ; Ice	SE
		bra.w	HandleIceSW		  ; Ice	SW
		bra.w	HandleIceNW		  ; Ice	NW
		bra.w	HandleGoddessStatue	  ; Goddess Statue

_floorDone:
		rts

HandleFloorDoorNE:
		cmpi.b	#$07,(Player_SubY).l
		bcc.w	_floorDone
		bsr.w	CheckForDoorNE
		bcc.s	_doorNEGo
		move.w	#$0006,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames

_doorNEGo:
		cmpi.w	#$00FE,(g_ControllerPlayback).l
		beq.w	_doorEnter
		move.b	#$02,d0
		jsr	(j_PlaybackInput).l
		bra.w	_doorEnter

HandleFloorDoorSE:
		cmpi.b	#$09,(Player_SubX).l
		bls.w	_doorSEDone
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		cmpi.b	#$40,d0
		bne.w	_doorSEDone
		move.w	(Player_GroundHeight).l,(g_PrevGroundHeight).l
		cmpi.w	#$00FE,(g_ControllerPlayback).l
		beq.s	_doorSEDone
		move.b	#$00,d0
		jsr	(j_PlaybackInput).l
		bset	#STATUS_FLIP_DIR,(g_PlayerStatus).l

_doorSEDone:
		rts

HandleFloorDoorSW:
		cmpi.b	#$09,(Player_SubY).l
		bls.w	_doorSWDone
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		cmpi.b	#$80,d0
		bne.w	_doorSWDone
		cmpi.w	#$00FE,(g_ControllerPlayback).l
		beq.s	_doorSWGo
		move.b	#$03,d0
		jsr	(j_PlaybackInput).l

_doorSWGo:
		move.w	(Player_GroundHeight).l,(g_PrevGroundHeight).l
		bset	#STATUS_FLIP_DIR,(g_PlayerStatus).l

_doorSWDone:
		rts

HandleFloorDoorNW:
		cmpi.b	#$07,(Player_SubX).l
		bcc.s	_doorDone
		bsr.w	CheckForDoorNW
		bcc.s	_doorNWGo
		move.w	#$0006,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames

_doorNWGo:
		move.b	#$01,d0
		jsr	(j_PlaybackInput).l


_doorEnter:
		move.w	(Player_GroundHeight).l,(g_PrevGroundHeight).l
		bset	#STATUS_FLIP_DIR,(g_PlayerStatus).l
		bsr.w	CheckShopExit
		bsr.s	DoorWarp
		bsr.w	CheckShopEnter

_doorDone:
		rts


; Door sound + fade + room change; WarpToRoom skips the sound,
; WarpToRoomNoFade also skips the fade (caller already faded),
; TransitionToNewRoom additionally invalidates the cached
; tileset/blockset/palette so everything reloads.
DoorWarp:


		trap	#$00			  ; Trap00Handler
		dc.w SND_Door

WarpToRoom:
		bsr.w	FadeOutToDarkness

WarpToRoomNoFade:
		bsr.w	LookupWarpDestination
		clr.b	d0
		bsr.w	LoadRoom_0
		bsr.w	InitRoomDisplayAndFadeIn
		bra.w	CheckBell

TransitionToNewRoom:
		move.b	#$FF,(g_PriBlockset).l
		move.b	#$FF,(g_SecBlockset).l
		move.b	#$FF,(g_CurrentTileset).l
		move.b	#$FF,(g_CurPalIdx).l
		bra.s	WarpToRoom

HandleFloorStairs:
		bsr.w	_chkStandingOnFloor
		bcc.s	_doorDone
		cmpi.w	#ROOM_MERCATOR_WHOLESALER,(g_CurrentRoom).l	  ; Wholesaler
		bne.s	DoorWarp
		jsr	(j_RunShopFarewell).l
		bra.s	DoorWarp

; Scripted door entry: don't re-trigger if the floor we latched last
; was already a door.
_chkCameFromDoor:
		move.b	(g_PrevGroundHeight+1).l,d1
		andi.b	#$3F,d1
		cmpi.b	#FLOOR_DOOR,d1
		beq.s	_noWarp
		cmpi.b	#FLOOR_DOOR_NE,d1
		beq.s	_noWarp
		bra.w	_doorEnter

HandleFloorDoor:
		cmpi.w	#$00FE,(g_ControllerPlayback).l
		beq.s	_chkCameFromDoor
		cmpi.b	#CTRLBF_DOWN,(g_ControllerPlaybackTimer).l
		bne.w	_doorDone
		bra.s	_warpIfNewFloor

; FLOOR_WARP_NW/_NE: invisible directional exits - like the door
; floors (same sub-position gate) but transitioning via the warp
; table without a door animation.
_warpExitNW:
		cmpi.b	#$08,(Player_SubX).l
		bcc.s	_noWarp
		bra.s	_warpIfNewFloor

_warpExitNE:
		cmpi.b	#$08,(Player_SubY).l
		bcc.s	_noWarp

; Generic edge warp: fires only when the previously latched floor was
; not a warp, then latches the current ground word.
_warpIfNewFloor:
		move.b	(g_PrevGroundHeight+1).l,d1
		andi.b	#$3F,d1
		cmpi.b	#FLOOR_WARP,d1
		beq.s	_noWarp
		move.w	(Player_GroundHeight).l,(g_PrevGroundHeight).l
		bra.w	_doorEnter

_noWarp:
		rts

HandleFloorWarpPad:
		move.b	(g_PrevGroundHeight+1).l,d1
		andi.b	#$3F,d1
		cmpi.b	#FLOOR_WARP,d1
		beq.s	_padDone
		bsr.w	_chkStandingOnFloor
		bcc.s	_padDone
		move.w	(Player_GroundHeight).l,(g_PrevGroundHeight).l
		bra.s	_warpGo		  ; Nole warp room

_padDone:
		rts

_warpGo:
		cmpi.w	#ROOM_NOLE_WARP,(g_CurrentRoom).l	  ; Nole warp room
		bne.s	_padWarp
		moveq	#VFX_NOLE_WARP_OUT,d0
		bsr.w	DoVisualEffect		  ; 0,1	- Warp-pad transition
						  ; 2,3	- Tree warp transition
						  ; 4 -	Black flash
						  ; 5 -	White flash
						  ; 6 -	Red flash
						  ; 7 -	Nole warp
						  ;
		bsr.w	LookupWarpDestination
		clr.b	d0
		bsr.w	LoadRoom_0
		bsr.w	InitRoomDisplay
		moveq	#VFX_NOLE_WARP_IN,d0
		bsr.w	DoVisualEffect		  ; 0,1	- Warp-pad transition
						  ; 2,3	- Tree warp transition
						  ; 4 -	Black flash
						  ; 5 -	White flash
						  ; 6 -	Red flash
						  ; 7 -	Nole warp
						  ;
		rts

_padWarp:
		cmpi.b	#SND_MusicTreeWarp,(g_BGM).l
		beq.s	_treeWarp
		trap	#$00			  ; Trap00Handler
		dc.w SND_WarpPad
		bsr.w	WarpPadFx
		bsr.w	LookupWarpDestination
		clr.b	d0
		bsr.w	LoadRoom_0
		bra.w	InitRoomDisplayAndFadeIn

_treeWarp:
		moveq	#VFX_TREE_WARP_OUT,d0
		bsr.w	DoVisualEffect		  ; 0,1	- Warp-pad transition
						  ; 2,3	- Tree warp transition
						  ; 4 -	Black flash
						  ; 5 -	White flash
						  ; 6 -	Red flash
						  ; 7 -	Nole warp
						  ;
		bsr.w	LookupWarpDestination
		clr.b	d0
		bsr.w	LoadRoom_0
		bsr.w	InitRoomDisplay
		moveq	#VFX_TREE_WARP_IN,d0
		bra.w	DoVisualEffect		  ; 0,1	- Warp-pad transition
						  ; 2,3	- Tree warp transition
						  ; 4 -	Black flash
						  ; 5 -	White flash
						  ; 6 -	Red flash
						  ; 7 -	Nole warp
						  ;

; Fall through a pit floor to the room below (g_RoomFallDest), with
; the fall sound unless riding a sprite down.
HandleFloorPit:
		bsr.w	_chkStandingOnFloor
		bcc.s	HandleFloorElevator
		move.w	(g_RoomFallDest).l,d0
		bmi.s	_transDone
		move.w	d0,(g_OriginalRoom).l
		bsr.w	CheckForRoomTransition
		move.w	d0,(g_CurrentRoom).l
		tst.w	(Player_SpriteUnderneath).l
		bpl.s	_pitFall
		trap	#$00			  ; Trap00Handler
		dc.w SND_Fall

_pitFall:
		bsr.w	FadeOutToDarkness
		move.b	#$01,d0
		bsr.w	LoadRoom_0
		bsr.w	InitRoomDisplayAndFadeIn
		bra.w	CheckBell

; Riding a platform above the room's max height transitions to the
; room above (g_RoomClimbDest).
HandleFloorElevator:
		move.b	(Player_Z+1).l,d0
		cmp.b	(g_RoomMaxHeight).l,d0
		bls.s	_transDone
		tst.w	(Player_SpriteUnderneath).l
		bmi.s	_transDone
		move.w	(g_RoomClimbDest).l,d0
		bmi.s	_transDone
		move.w	d0,(g_OriginalRoom).l
		bsr.w	CheckForRoomTransition
		move.w	d0,(g_CurrentRoom).l
		bsr.w	FadeOutToDarkness
		move.b	#$02,d0
		bsr.w	LoadRoom_0
		bsr.w	InitRoomDisplayAndFadeIn
		bra.w	CheckBell

_transDone:
		rts

; A ladder reaching the room's max height climbs into the room above;
; otherwise check the two heightmap cells past the ladder for a pit
; (dropping off the far side).
HandleFloorLadder:
		move.b	(Player_Z+1).l,d0
		cmp.b	(g_RoomMaxHeight).l,d0
		bls.s	_ladderChkPit
		move.w	(g_RoomClimbDest).l,d0
		bmi.s	_ladderChkPit
		move.w	d0,(g_OriginalRoom).l
		bsr.w	CheckForRoomTransition
		move.w	d0,(g_CurrentRoom).l
		bsr.w	FadeOutToDarkness
		move.b	#$03,d0
		bsr.w	LoadRoom_0
		bsr.w	InitRoomDisplayAndFadeIn
		bra.w	CheckBell

_ladderChkPit:
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

; Damage floors: lava $0500 (blocked by Fireproof Boots), spikes
; $0100 (blocked by Iron Boots), swamp $0100. Damage is applied as a
; contact hit while standing on the floor.
HandleLava:
		cmpi.b	#ITM_FIREPROOF,(g_EquippedBoots).l
		beq.s	_floorDmgDone
		move.w	#$0500,d1
		bra.s	_floorDamage

HandleFloorSpikes:
		cmpi.b	#ITM_IRONBOOTS,(g_EquippedBoots).l
		beq.s	_floorDmgDone

HandleFloorSwamp:
		move.w	#$0100,d1

_floorDamage:
		bsr.w	_chkStandingOnFloor
		bcc.s	_floorDmgDone
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_floorDmgDone
		move.b	#$80,(g_PlayerPendingHit).l
		move.w	d1,(Player_AttackStrength).l

_floorDmgDone:
		rts

; The spiral staircase in Nole's crypt: teleports the player half a
; room up (facing SW at the right sub-position) or down (facing NE),
; shifting every coordinate, the heightmap pointer and the camera to
; make the two staircase halves seamless.
HandleNoleStaircase:
		lea	(Player_X).l,a0
		move.b	Player_RotationAndSize-Player_X(a0),d0
		andi.b	#$C0,d0
		beq.w	_noleDown
		cmpi.b	#$80,d0
		bne.w	_noleDone
		move.b	SubY(a0),d0
		andi.b	#$FE,d0
		cmpi.b	#$08,d0
		bne.w	_noleDone
		addi.b	#$11,(a0)
		addi.b	#$0A,(g_PlayerXFlattened).l
		subi.b	#$1C,Y(a0)
		subi.b	#$23,(g_PlayerYFlattened).l
		addi.w	#$0070,Z(a0)
		addi.w	#$0070,HitBoxZEnd(a0)
		move.b	#$09,GroundHeight(a0)
		move.b	#$90,FloorHeight(a0)
		subi.w	#$100E,HeightmapOffset(a0)
		addi.w	#$0110,CentreX(a0)
		addi.w	#$0110,HitBoxXStart(a0)
		addi.w	#$0110,HitBoxXEnd(a0)
		addi.w	#$00A0,(g_CameraFineX).l
		subi.w	#$01C0,CentreY(a0)
		subi.w	#$01C0,HitBoxYStart(a0)
		subi.w	#$01C0,HitBoxYEnd(a0)
		subi.w	#$0230,(g_CameraFineY).l

_noleDone:
		rts

_noleDown:
		move.b	(Player_SubY).l,d0
		andi.b	#$FE,d0
		cmpi.b	#$06,d0
		bne.s	_noleDone
		subi.b	#$11,(a0)
		subi.b	#$0A,(g_PlayerXFlattened).l
		addi.b	#$1C,Y(a0)
		addi.b	#$23,(g_PlayerYFlattened).l
		subi.w	#$0070,Z(a0)
		subi.w	#$0070,HitBoxZEnd(a0)
		move.b	#$02,GroundHeight(a0)
		move.b	#$20,FloorHeight(a0)
		addi.w	#$100E,HeightmapOffset(a0)
		subi.w	#$0110,CentreX(a0)
		subi.w	#$0110,HitBoxXStart(a0)
		subi.w	#$0110,HitBoxXEnd(a0)
		subi.w	#$00A0,(g_CameraFineX).l
		addi.w	#$01C0,CentreY(a0)
		addi.w	#$01C0,HitBoxYStart(a0)
		addi.w	#$01C0,HitBoxYEnd(a0)
		addi.w	#$0230,(g_CameraFineY).l
		rts

; Ice floors force scripted walk input in the slide direction unless
; Snow Spikes are equipped (playback commands $36-$39 = NE/SE/SW/NW).
HandleIceNE:
		cmpi.b	#ITM_SNOWSPIKES,(g_EquippedBoots).l
		beq.s	_iceNEDone
		tst.w	(g_ControllerPlayback).l
		bne.s	_iceNEDone
		move.b	#$36,d0
		jsr	(j_PlaybackInput).l

_iceNEDone:
		rts

HandleIceSE:
		cmpi.b	#ITM_SNOWSPIKES,(g_EquippedBoots).l
		beq.s	_iceSEDone
		tst.w	(g_ControllerPlayback).l
		bne.s	_iceSEDone
		move.b	#$37,d0
		jsr	(j_PlaybackInput).l

_iceSEDone:
		rts

HandleIceSW:
		cmpi.b	#ITM_SNOWSPIKES,(g_EquippedBoots).l
		beq.s	_iceSWDone
		tst.w	(g_ControllerPlayback).l
		bne.s	_iceSWDone
		move.b	#$38,d0
		jsr	(j_PlaybackInput).l

_iceSWDone:
		rts

HandleIceNW:
		cmpi.b	#ITM_SNOWSPIKES,(g_EquippedBoots).l
		beq.s	_iceNWDone
		tst.w	(g_ControllerPlayback).l
		bne.s	_iceNWDone
		move.b	#$39,d0
		jsr	(j_PlaybackInput).l

_iceNWDone:
		rts

; Goddess Statue tile: full heal with white flash + jingle, latched
; via g_PrevGroundHeight so it fires once per visit.
HandleGoddessStatue:
		move.b	(g_PrevGroundHeight+1).l,d1
		andi.b	#$3F,d1
		cmpi.b	#FLOOR_GODDESS_STATUE,d1
		beq.s	_goddessDone
		bsr.w	_chkStandingOnFloor
		bcc.s	_goddessDone
		move.w	(Player_GroundHeight).l,(g_PrevGroundHeight).l
		move.w	(Player_CurrentHealth).l,d0
		cmp.w	(Player_MaxHealth).l,d0
		beq.s	_goddessDone
		move.w	#VFX_WHITE_FLASH,d0
		jsr	(j_DoVisualEffect).l
		jsr	(j_FlushDMACopyQueue).l
		jsr	(j_CopyBasePaletteToActivePalette).l
		jsr	(j_FlushDMACopyQueue).l
		move.w	#$FFFF,d0
		lea	(Player_X).l,a5
		jsr	(j_AddHealth).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_HealthRecover2

_goddessDone:
		rts

; Carry set if the player is actually standing on the ground (Z ==
; ground height) - gates stairs, warps, statues and damage floors so
; jumping over them is safe.
_chkStandingOnFloor:
		clr.w	d0
		move.b	(Player_GroundHeight).l,d0
		lsl.b	#$04,d0
		cmp.w	(Player_Z).l,d0
		bne.s	_notOnFloor
		ori	#$01,ccr
		rts

_notOnFloor:
		tst.b	d0
		rts

; After a room transition: if the Bell is owned, run the Lifestock
; chime check.
CheckBell:
		move.b	#ITM_BELL,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.s	_bellDone
		bsr.w	CheckForLifestock

_bellDone:
		rts


		modend
