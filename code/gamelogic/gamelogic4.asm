GameLogic4	module
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
		bset	#$07,(g_PlayerStatus).l

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
		bset	#$07,(g_PlayerStatus).l

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
		bset	#$07,(g_PlayerStatus).l
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


; A/C button handling: while airborne only the charge meter updates;
; while carrying (g_CarryPhase != 0) runs the carry state machine;
; otherwise tries pick-up, chest, talk, then sword swing (blocked by
; curse and g_LockPlayerActions bit 1). Swinging with a full meter
; costs $6400 of charge.
ProcessActionButton:


		btst	#$04,(Player_Action).l
		bne.w	UpdateSwordCharge
		move.b	(g_Controller1State).l,d1
		and.b	d1,(g_SwordButtonMask).l
		move.b	(g_CarryPhase).l,d0
		bne.w	_carryUpdate
		move.b	(g_SwordSwingFrame).l,d0
		bne.w	_swingAdvance
		tst.b	(g_SwordButtonMask).l
		bne.w	UpdateSwordCharge
		move.b	(g_Controller1State).l,d0
		andi.b	#CTRLBF_AC,d0
		beq.s	UpdateSwordCharge
		btst	#$00,(g_LockPlayerActions).l ; Bit 0: Can't pick up items
						  ; Bit	1: Can't attack
						  ; Bit	2: Can't open menu
		bne.s	_chkChest
		bsr.w	CheckPickUpEntity
		bcs.s	UpdateSwordCharge

_chkChest:
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
		bne.s	_pabRet
		tst.b	(g_EquippedSword).l
		beq.s	_uscDone
		move.w	#$6400,d0
		jsr	(j_DecreaseSwordCharge).l

_pabRet:
		rts


; Per-tick charge meter fill while a sword is equipped.
UpdateSwordCharge:
		tst.b	(g_EquippedSword).l
		beq.s	_uscDone
		jsr	(j_IncrementSwordCharge).l

_uscDone:
		rts


; Carry state machine, driven by g_CarryPhase (see ram.inc): advances
; the pickup animation, lifts the object to Z+$18 at phase 8, moves it
; to "held overhead" at $10, then holds at $17 until A/C arms a throw
; ($0010 drop / $1710 directional throw into g_ThrowBehaviour, C
; button only after a position check under FIX_COLL_2), and executes
; it through the put-down/throw phases.
_carryUpdate:
		movem.w	d0,-(sp)
		bsr.s	UpdateSwordCharge
		movem.w	(sp)+,d0
		lea	(Player_X).l,a1
		move.w	(g_CarriedEntity).l,d1
		cmpi.b	#$7F,(a1,d1.w)
		beq.w	_carryEnd
		addq.b	#$01,d0
		move.b	d0,(g_CarryPhase).l
		cmpi.b	#$02,d0
		bne.s	_carryPhase1
		bset	#$05,StateFlags(a1,d1.w)

_carryPhase1:
		andi.w	#$FF3F,(Player_Action).l
		ori.w	#$0040,(Player_Action).l
		cmpi.b	#$08,d0
		bcs.w	_eatAC
		bne.s	_carryLift
		move.w	(Player_Z).l,d2
		addi.w	#$0018,d2
		move.w	d2,Z(a1,d1.w)
		ori.b	#$80,FallRate(a1,d1.w)

_carryLift:
		andi.w	#$FF3F,(Player_Action).l
		ori.w	#$0080,(Player_Action).l
		cmpi.b	#$10,d0
		bcs.w	_eatAC
		bne.s	_carryHold
		bset	#$06,StateFlags(a1,d1.w)
		bclr	#$05,StateFlags(a1,d1.w)

_carryHold:
		andi.w	#$FF3F,(Player_Action).l
		ori.w	#$00C0,(Player_Action).l
		cmpi.b	#$18,d0
		bcs.w	_eatAC
		bhi.w	_throwPhase
		subq.b	#$01,(g_CarryPhase).l
		tst.b	(g_SwordButtonMask).l
		bne.w	_pabDone
		move.b	(g_Controller1State).l,d0
		andi.b	#CTRLBF_AC,d0
		beq.w	_pabDone
		move.b	#CTRLBF_AC,(g_SwordButtonMask).l
		move.w	(Player_Action).l,d0
		andi.b	#$30,d0
		beq.s	_putDown
	if FIX_COLL_2
		adda.w	d1,a1
		movea.l	a1,a5
		addi.w	#$0020,Z(a5)
		addi.w	#$0020,HitBoxZEnd(a5)
		movem.l	d0,-(sp)
		bsr.w	ValidateSpritePosition
		movem.l	(sp)+,d0
		bcc.s	_armThrow
		subi.w	#$0020,Z(a5)
		subi.w	#$0020,HitBoxZEnd(a5)
		rts
	endif
_armThrow:	
		andi.b	#CTRLBF_C,d0
		move.w	#BHV_THROWN_OBJECT,(g_ThrowBehaviour).l
		addq.b	#$01,(g_CarryPhase).l
		move.b	(g_Controller1State).l,d0
		andi.b	#$0F,d0
		beq.s	_armDone
		move.b	#THROWPHASE_THROW,(g_ThrowBehaviour).l

_armDone:
		rts
OffsetTbl:	dc.w -$0094			  ; Up
		dc.w $0002			  ; Left
		dc.w $0094			  ; Down
		dc.w -$0002			  ; Right

_putDown:
		bsr.w	_placeCarriedFwd
		move.w	(Player_HitBoxZEnd).l,d0
		clr.w	d2
		move.b	Height(a1,d1.w),d2
		sub.w	d2,d0
		move.w	d0,(Player_HitBoxZEnd).l
		bclr	#$06,StateFlags(a1,d1.w)
		bclr	#$07,FallRate(a1,d1.w)
		bset	#ACTBH_REFRESH,QueuedAction(a1,d1.w)
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
		TestFlag	FLAG_INTRO_IN_PROGRESS
		bne.s	_dropDone
		trap	#$00			  ; Trap00Handler
		dc.w SND_NigelDropObj1

_dropDone:
		addq.b	#$01,(g_CarryPhase).l
		andi.b	#CTRLBF_AC,(g_Controller1State).l
		clr.w	(g_ThrowBehaviour).l
		move.w	(Player_SpriteUnderneath).l,d0
		bmi.s	_putDone
		lea	(Player_X).l,a0
		adda.w	d0,a0
		move.b	Action1(a0),d0
		andi.b	#$0F,d0
		beq.s	_putDone
		move.b	Speed(a0),d0
		andi.w	#$000F,d0
		move.b	d0,Speed(a1,d1.w)
		move.b	RotationAndSize(a0),d0
		andi.b	#DIR_MASK,d0
		andi.b	#$3F,RotationAndSize(a1,d1.w)
		or.b	d0,RotationAndSize(a1,d1.w)
		move.w	#BHV_PUT_DOWN_OBJECT,d2
		cmpi.b	#BHV_SHOP_ITEM,BehavCmd(a1,d1.w)
		bne.s	_dropParam
		move.w	#BHV_PUT_DOWN_SHOP_ITEM,d2

_dropParam:
		move.w	d2,BehavParam(a1,d1.w)
		move.b	(Player_RotationAndSize).l,d2
		andi.b	#$C0,d2
		eori.b	#DIR_FLIP,d2
		cmp.b	d0,d2
		bne.s	_putDone
		move.b	#PUTDOWNPHASE_DELAY,BehavParam(a1,d1.w)

_putDone:
		rts

_throwPhase:
		andi.w	#$FF3F,(Player_Action).l
		ori.w	#$0080,(Player_Action).l
		cmpi.b	#$1E,d0
		bcs.w	_eatAC
		bne.s	_throwTail
		move.w	(g_ThrowBehaviour).l,d0
		beq.s	_eatAC
		cmpi.b	#BHV_SHOP_ITEM,BehavCmd(a1,d1.w)
		bne.s	_throwSet
		cmpi.b	#BHV_THROWN_OBJECT,d0
		bne.s	_throwSet
		move.b	#BHV_THROWN_SHOP_ITEM,d0

_throwSet:
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
		bclr	#$06,StateFlags(a1,d1.w)
		bclr	#$07,FallRate(a1,d1.w)
		move.b	#SND_Throw,d0
		trap	#$00			  ; Trap00Handler
		dc.w SND_LoadFromD0
		bra.s	_eatAC

_throwTail:
		andi.w	#$FF3F,(Player_Action).l
		ori.w	#$0040,(Player_Action).l
		cmpi.b	#$26,d0
		bcs.s	_eatAC

_carryEnd:
		clr.b	(g_CarryPhase).l
		clr.w	(g_CarriedEntity).l

_eatAC:
		tst.w	(g_ControllerPlayback).l
		bne.s	_pabDone
		andi.b	#CTRLBF_AC,(g_Controller1State).l

_pabDone:
		rts


; Try to place the carried sprite one step in front of the player:
; raise it, move it forward (_moveEntityFwd) and validate the spot;
; restores Z if blocked (carry set).
_placeCarriedFwd:
		move.w	#$0010,d0
		movem.l	d1/a1,-(sp)
		adda.w	d1,a1
		movea.l	a1,a5
		addq.w	#$01,Z(a5)
		addq.w	#$01,HitBoxZEnd(a5)
		movem.l	a5,-(sp)
		bsr.s	_moveEntityFwd
		bsr.w	ValidateSpritePosition
		movem.l	(sp)+,a5
		movem.l	(sp)+,d1/a1
		bcc.s	_pcfDone
		movem.l	(sp)+,d0
		subq.w	#$01,Z(a5)
		subq.w	#$01,HitBoxZEnd(a5)

_pcfDone:
		rts


; Move entity a5 by d0 units in the player's facing direction,
; renormalizing its coarse/sub coordinates.
_moveEntityFwd:
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		beq.s	_mefNE
		cmpi.b	#$80,d1
		beq.s	_mefSW
		bhi.s	_mefNW
		add.w	d0,CentreX(a5)
		add.w	d0,HitBoxXStart(a5)
		add.w	d0,HitBoxXEnd(a5)
		bra.s	_mefSetX

_mefNW:
		sub.w	d0,CentreX(a5)
		sub.w	d0,HitBoxXStart(a5)
		sub.w	d0,HitBoxXEnd(a5)
		bra.s	_mefSetX

_mefNE:
		sub.w	d0,CentreY(a5)
		sub.w	d0,HitBoxYStart(a5)
		sub.w	d0,HitBoxYEnd(a5)
		bra.s	_mefSetY

_mefSW:
		add.w	d0,CentreY(a5)
		add.w	d0,HitBoxYStart(a5)
		add.w	d0,HitBoxYEnd(a5)

_mefSetY:
		move.w	CentreY(a5),d1
		andi.b	#$0F,d1
		move.b	d1,SubY(a5)
		move.w	CentreY(a5),d1
		lsr.w	#$04,d1
		move.b	d1,Y(a5)
		rts

_mefSetX:
		move.w	CentreX(a5),d1
		andi.b	#$0F,d1
		move.b	d1,SubX(a5)
		move.w	CentreX(a5),d1
		lsr.w	#$04,d1
		move.b	d1,(a5)
		rts


; Starts a sword swing: frame counter, attack action, swing sound;
; if the charge meter is full, primes g_ChargedSword with the
; equipped sword's item id for the release on frame $0B.
SwordSwing:
		move.b	#$01,(g_SwordSwingFrame).l
		andi.w	#$F8FF,(Player_Action).l
		ori.w	#ACT_ATTACK1,(Player_Action).l
		tst.w	(g_ControllerPlayback).l
		bne.s	_swingSnd
		andi.b	#CTRLBF_AC,(g_Controller1State).l

_swingSnd:
		move.b	#CTRLBF_AC,(g_SwordButtonMask).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_SwordSwing
		clr.w	d2
		cmpi.w	#$3200,(g_SwordChargeMeter).l
		bcs.s	_primeSword
		move.b	(g_EquippedSword).l,d1
		cmpi.b	#ITM_MAGICSWORD,d1
		bne.s	_chkGaia
		move.b	#ITM_MAGICSWORD,d2
		bra.s	_primeSword

_chkGaia:
		cmpi.b	#ITM_GAIASWORD,d1
		bne.s	_chkThunder2
		move.b	#ITM_GAIASWORD,d2
		bra.s	_primeSword

_chkThunder2:
		cmpi.b	#ITM_THUNDERSWORD,d1
		bne.s	_primeIce
		move.b	#ITM_THUNDERSWORD,d2
		bra.s	_primeSword

_primeIce:
		move.b	#ITM_ICESWORD,d2

_primeSword:
		move.w	d2,(g_ChargedSwordW).l
		rts


; Sword swing in progress: advance the frame counter and step the
; attack action through ATTACK1-4 at frames 5/$A/$F, checking for a
; wall clink at frame 5; ends at frame $14.
_swingAdvance:
		addq.b	#$01,d0
		move.b	d0,(g_SwordSwingFrame).l
		andi.w	#$F8FF,(Player_Action).l
		ori.w	#ACT_ATTACK1,(Player_Action).l
		cmpi.b	#$05,d0
		bcs.s	_swingTail
		bsr.s	_swordWallCheck
		bcs.s	_swingEnd
		andi.w	#$F8FF,(Player_Action).l
		ori.w	#ACT_ATTACK2,(Player_Action).l
		cmpi.b	#$0A,d0
		bcs.s	_swingTail
		andi.w	#$F8FF,(Player_Action).l
		ori.w	#ACT_ATTACK3,(Player_Action).l
		cmpi.b	#$0F,d0
		bcs.s	_swingTail
		andi.w	#$F8FF,(Player_Action).l
		ori.w	#ACT_ATTACK4,(Player_Action).l
		cmpi.b	#$14,d0
		bcs.s	_swingTail

_swingEnd:
		andi.w	#$F8FF,(Player_Action).l
		clr.b	(g_SwordSwingFrame).l

_swingTail:
		move.b	(Player_Action+1).l,d0
		andi.b	#$30,d0
		bne.s	_swingDone
		tst.w	(g_ControllerPlayback).l
		bne.s	_swingDone
		andi.b	#CTRLBF_AC,(g_Controller1State).l

_swingDone:
		rts


; Extends the player's hitbox $10 forward and scans the heightmap:
; carry set + clink sound if the wall there is taller than the player
; (the swing hits the wall instead of enemies).
_swordWallCheck:
		movem.w	d0,-(sp)
		lea	(Player_X).l,a0
		move.l	Player_HitBoxXStart-Player_X(a0),d0
		move.l	HitBoxYStart(a0),d1
		movem.l	d0-d1,-(sp)
		move.b	RotationAndSize(a0),d0
		andi.b	#DIR_MASK,d0
		beq.s	_swcNE
		cmpi.b	#DIR_SW,d0
		bls.s	_swcSESW
		subi.w	#$0010,HitBoxXStart(a0)
		addi.w	#$0010,HitBoxYEnd(a0)
		bra.s	_swcProbe

_swcNE:
		subi.w	#$0010,HitBoxYStart(a0)
		addi.w	#$0010,HitBoxXEnd(a0)
		bra.s	_swcProbe

_swcSESW:
		addi.w	#$0010,HitBoxXEnd(a0)
		addi.w	#$0010,HitBoxYEnd(a0)

_swcProbe:
		move.b	#$FF,d7
		bsr.w	GetHighestFloorUnder
		movem.l	(sp)+,d0-d1
		move.l	d0,HitBoxXStart(a0)
		move.l	d1,HitBoxYStart(a0)
		movem.w	(sp)+,d0
		move.w	Z(a0),d7
		cmp.w	d7,d4
		bhi.s	_swcClink
		tst.b	d0
		rts

_swcClink:
		trap	#$00			  ; Trap00Handler
		dc.w SND_SwordHit

		ori	#$01,ccr
		rts


; Common setup for the facing-based interaction scans (pickup, talk,
; chest): loads direction-dependent row/column comparisons from
; _InteractOffsets, the Z range, and a2/a3 = lateral bounds +/-3.
_interactScanInit:
		lea	(Player_X).l,a0
		move.b	RotationAndSize(a0),d0
		andi.w	#DIR_MASK,d0
		lsr.b	#$03,d0
		move.w	_InteractOffsets(pc,d0.w),d1
		move.w	(a0,d1.w),d2
		add.w	_InteractOffsets+2(pc,d0.w),d2
		move.w	_InteractOffsets+2(pc,d0.w),d3
		move.w	_InteractOffsets+4(pc,d0.w),d1
		move.w	_InteractOffsets+6(pc,d0.w),d0
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

_InteractOffsets:	dc.w $001C,$FFFF,$001E,$0018	  ; 0
		dc.w $001A,$0001,$0018,$001C	  ; 4
		dc.w $001E,$0001,$001C,$0018	  ; 8
		dc.w $0018,$FFFF,$001A,$001C	  ; 12


; Find a liftable sprite (InteractFlags bit 5, not behaviours
; $10/$16): first the sprite the player stands on, else the closest
; one directly in front; saves its behaviour state, records it in
; g_CarriedEntity and starts the pickup (g_CarryPhase = 1).
CheckPickUpEntity:
		lea	(Player_X).l,a5
		bsr.w	ValidateSpritePosition
		bcc.s	_puChkUnder
		btst	#$05,InteractFlags(a1)
		bne.w	_puFromValidate

_puChkUnder:
		lea	(Sprite1_X).l,a4
		moveq	#$E,d7

_puUnderLoop:
		tst.w	(a4)
		bmi.s	_puScan
		btst	#$00,StateFlags(a4)
		bne.s	_puUnderNext
		tst.w	SpriteUnderneath(a4)
		bne.s	_puUnderNext
		btst	#$05,InteractFlags(a4)
		beq.s	_puUnderNext
		cmpi.b	#BHV_THROWN_OBJECT,BehavCmd(a4)
		beq.s	_puUnderNext
		cmpi.b	#BHV_PUT_DOWN_OBJECT,BehavCmd(a4)
		beq.s	_puUnderNext
		clr.w	d0
		move.b	Height(a4),d0
		lea	(Player_X).l,a5
		add.w	d0,Player_HitBoxZEnd-Player_X(a5)
		bra.w	_puGrab

_puUnderNext:
		lea	SPRITE_SIZE(a4),a4
		dbf	d7,_puUnderLoop

_puScan:
		bsr.w	_interactScanInit
		add.w	d2,d3

_puLoop:
		tst.w	(a0)
		bmi.s	_puResolve
		btst	#$05,InteractFlags(a0)
		beq.s	_puNext
		cmpi.b	#BHV_THROWN_OBJECT,BehavCmd(a0)
		beq.s	_puNext
		cmpi.b	#BHV_PUT_DOWN_OBJECT,BehavCmd(a0)
		beq.s	_puNext
		cmp.w	(a0,d1.w),d2
		beq.s	_puFacing
		cmp.w	(a0,d1.w),d3
		bne.s	_puNext

_puFacing:
		btst	#$04,InteractFlags(a0)
		beq.s	_puBox
		movem.w	d0-d1,-(sp)
		move.b	RotationAndSize(a0),d0
		andi.b	#DIR_MASK,d0
		eori.b	#DIR_FLIP,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		movem.w	(sp)+,d0-d1
		bne.s	_puNext

_puBox:
		cmpa.w	SubX(a0,d0.w),a2
		bhi.s	_puNext
		cmpa.w	(a0,d0.w),a3
		bcs.s	_puNext
		cmp.w	HitBoxZEnd(a0),d4
		bcc.s	_puNext
		cmp.w	Z(a0),d5
		bls.s	_puNext
		cmp.w	Z(a0),d6
		bcs.s	_puNext
		move.w	Z(a0),d6
		movea.l	a0,a4

_puNext:
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,_puLoop

_puResolve:
		cmpi.b	#$FF,d6
		beq.s	_puNone
		clr.w	d0
		move.b	Height(a4),d0
		lea	(Player_X).l,a5
		add.w	d0,Player_HitBoxZEnd-Player_X(a5)
		bsr.w	ValidateSpritePosition
		bcc.s	_puGrab
		clr.w	d0
		move.b	Height(a4),d0
		sub.w	d0,HitBoxZEnd(a5)
		btst	#$05,InteractFlags(a1)
		bne.s	_puFromValidate

_puNone:
		tst.b	d0
		rts

_puFromValidate:
		movea.l	a1,a4
		clr.w	d0
		move.b	Height(a4),d0
		lea	(Player_X).l,a5
		add.w	d0,Player_HitBoxZEnd-Player_X(a5)

_puGrab:
		move.b	#$01,(g_CarryPhase).l
		move.l	BehaviourLUTPtr(a4),SavedBehaviourLUTPtr(a4)
		move.b	BehavParam(a4),SavedBehavParam(a4)
		move.b	BehavCmd(a4),SavedBehavCmd(a4)
		move.b	Speed(a4),SavedSpeed(a4)
		suba.l	#Player_X,a4
		move.w	a4,(g_CarriedEntity).l
		clr.b	(g_Controller1State).l
		move.b	#CTRLBF_AC,(g_SwordButtonMask).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_JumpLand

		ori	#$01,ccr
		rts


; Talk/read handling: sign floor types print their sign text
; (selected by floor value and facing), otherwise scan for a talkable
; NPC in front (also across a counter tile), rotate them to face the
; player with the talk pose, and run their dialogue script.
CheckTalk:
		move.w	(Player_Action).l,d0
		andi.b	#$30,d0
		bne.w	_talkNone
		move.b	(Player_GroundType).l,d0
		andi.b	#$3F,d0
		cmpi.b	#FLOOR_SIGN_NW1,d0
		bcs.s	_talkChkSigns2
		cmpi.b	#FLOOR_SIGN_NE4,d0
		bls.w	_signBankA

_talkChkSigns2:
		cmpi.b	#FLOOR_SIGN_NW5,d0
		bcs.s	_talkScan
		cmpi.b	#FLOOR_SIGN_NE8,d0
		bls.w	_signBankB

_talkScan:
		bsr.w	_interactScanInit

_talkLoop:
		tst.w	(a0)
		bmi.s	_talkResolve
		btst	#$04,InteractFlags(a0)
		beq.s	_talkNext
		btst	#$00,StateFlags(a0)
		bne.s	_talkNext
		movea.w	d2,a5
		cmpa.w	(a0,d1.w),a5
		beq.s	_talkBox
		adda.w	d3,a5
		cmpa.w	(a0,d1.w),a5
		beq.s	_talkBox
		adda.w	d3,a5
		cmpa.w	(a0,d1.w),a5
		beq.s	_talkBox
		adda.w	d3,a5
		cmpa.w	(a0,d1.w),a5
		bne.s	_talkNext

_talkBox:
		cmpa.w	SubX(a0,d0.w),a2
		bhi.s	_talkNext
		cmpa.w	(a0,d0.w),a3
		bcs.s	_talkNext
		cmp.w	HitBoxZEnd(a0),d4
		bcc.s	_talkNext
		cmp.w	Z(a0),d5
		bls.s	_talkNext
		movea.l	a0,a4
		clr.w	d6

_talkNext:
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,_talkLoop

_talkResolve:
		tst.w	d6
		bpl.w	_talkStart
		movem.w	d1/d3-d4,-(sp)
		subi.w	#$0018,d1
		adda.w	_CounterOffsets(pc,d1.w),a6
		move.b	$1(a6),d4
		andi.b	#$3F,d4
		cmpi.b	#FLOOR_COUNTER,d4
		bne.s	_talkRestore
		lsl.w	#$04,d3
		add.w	d3,d2
		movem.w	(sp)+,d1/d3-d4
		lea	(Sprite1_X).l,a0
		move.w	#$000E,d7
		bra.w	_talkLoop

_talkRestore:
		movem.w	(sp)+,d1/d3-d4

_talkNone:
		tst.b	d0
		rts
_CounterOffsets:	dc.w $0002
		dc.w -$0002
		dc.w $0094
		dc.w -$0094

_talkStart:
		movea.l	a4,a0
		move.l	a0,(g_TalkingSprite).l
		move.b	RotationAndSize(a0),d0
		movem.l	d0/a0,-(sp)
		move.b	Dialogue(a0),d0
		lsr.b	#$02,d0
		move.b	d0,(g_currentSpeakerScriptID).l
		btst	#$00,InteractFlags(a0)
		bne.w	_talkNoFace
		andi.b	#$3F,RotationAndSize(a0)
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		eori.b	#DIR_FLIP,d0
		or.b	d0,RotationAndSize(a0)
		bsr.w	_setNpcTalkPose
		bsr.w	LoadSprites
		bsr.w	FlushDMACopyQueue
		jsr	(j_PlayerTalk).l
		bsr.w	_processPendingDialogue
		movem.l	(sp)+,d0/a0
		move.b	d0,RotationAndSize(a0)
		bsr.w	_setNpcTalkPose
		bsr.w	LoadSprites

_talkFinish:
		andi.b	#CTRLBF_AC,(g_Controller1State).l
		move.b	#CTRLBF_AC,(g_SwordButtonMask).l
		ori	#$01,ccr
		rts

_signBankB:
		cmpi.b	#FLOOR_SIGN_NE5,d0
		bcc.s	_signBankBFace
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		bne.w	_talkScan
		bra.s	_signTalkB

_signBankBFace:
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmpi.b	#$C0,d1
		bne.w	_talkScan
		bra.s	_signTalkB
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmpi.b	#$C0,d1
		bne.w	_talkChkSigns2

_signTalkB:
		subi.b	#FLOOR_SIGN_NE5,d0
		andi.b	#$03,d0
		addq.b	#$04,d0
		bra.s	_signTalk

_signBankA:
		cmpi.b	#FLOOR_SIGN_NE1,d0
		bcc.s	_signBankAFace
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		bne.w	_talkChkSigns2
		bra.s	_signTalkA

_signBankAFace:
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmpi.b	#$C0,d1
		bne.w	_talkChkSigns2

_signTalkA:
		subq.b	#$01,d0
		andi.b	#$03,d0

_signTalk:
		move.b	d0,(g_currentSpeakerScriptID).l
		jsr	(j_PlayerTalk).l
		bsr.w	_processPendingDialogue
		bra.w	_talkFinish

_talkNoFace:
		jsr	(j_PlayerTalk).l
		bsr.s	_processPendingDialogue
		movem.l	(sp)+,d0/a0
		bra.w	_talkFinish


_processPendingDialogue:
		move.w	(g_PendingCutsceneAction).l,d0
		bmi.s	_ppdDone
		jsr	(j_ProcessDialogueScriptAction).l

_ppdDone:
		rts


_setNpcTalkPose:
		move.b	RotationAndSize(a0),d0
		addi.b	#$40,d0
		andi.b	#$80,d0
		beq.s	_ntpSet
		move.b	#$04,d0

_ntpSet:
		ext.w	d0
		move.w	d0,AnimationIndex(a0)
		clr.w	AnimationFrame(a0)
		andi.b	#$F7,TileSource(a0)
		move.b	RotationAndSize(a0),d0
		andi.b	#$40,d0
		lsr.b	#$03,d0
		or.b	d0,TileSource(a0)
		ori.b	#$80,AnimCtrl(a0)
		rts


; Chest opening: finds the chest sprite in front, animates the lid,
; and gives the contents - gold amounts (ids >= ITM_BROADSWORD map
; into GoldAmounts), Lifestock (max health +1), or an inventory item
; (with the chest re-closing if the inventory is full). Contents $3F
; = an empty trapped chest that just pops open.
CheckOpenChest:
		bsr.w	_interactScanInit
		add.w	d2,d3

_chLoop:
		tst.w	(a0)
		bmi.s	_chResolve
		cmpi.b	#SpriteB_Chest,SpriteGraphic(a0)
		bne.s	_chNext
		btst	#$00,StateFlags(a0)
		bne.s	_chNext
		cmp.w	(a0,d1.w),d2
		beq.s	_chBox
		cmp.w	(a0,d1.w),d3
		bne.s	_chNext

_chBox:
		cmpa.w	SubX(a0,d0.w),a2
		bhi.s	_chNext
		cmpa.w	(a0,d0.w),a3
		bcs.s	_chNext
		cmp.w	HitBoxZEnd(a0),d4
		bcc.s	_chNext
		cmp.w	Z(a0),d5
		bls.s	_chNext
		cmp.w	Z(a0),d6
		bcs.s	_chNext
		move.w	Z(a0),d6
		movea.l	a0,a4

_chNext:
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,_chLoop

_chResolve:
		cmpi.b	#$FF,d6
		beq.w	_chNone
		move.b	GoldOrChestContents(a4),d0
		bmi.w	_chNone
		cmpi.b	#$3F,d0
		beq.w	_chEmpty
		ext.w	d0
		move.w	d0,(g_CurrentTextItem).l
		movem.w	d0,-(sp)
		bsr.w	_chestOpenAnim
		jsr	(j_SetUpTextbox).l
		movem.w	(sp)+,d0
		cmpi.b	#ITM_LIFESTOCK,d0
		beq.s	_chGive
		cmpi.b	#ITM_BROADSWORD,d0
		bcs.s	_chItem
		subi.b	#ITM_BROADSWORD,d0
		ext.w	d0
		add.b	d0,d0
		move.w	GoldAmounts(pc,d0.w),d0
		ext.l	d0
		move.l	d0,(g_PrintNumericDwordValue).l
		jsr	(j_AddGold).l
		jsr	(j_OpenChest).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_MusicChestOpen
		move.w	#$0015,d0
		jsr	(j_PrintString).l
		bsr.w	RestoreBGM
		bra.s	_chHUD
GoldAmounts:
		dc.w 00005
		dc.w 00020
		dc.w 00050
		dc.w 00200

_chItem:
		jsr	(j_GetItemQtyAndMaxQty).l
		cmpi.b	#$09,d1
		beq.w	_chFull
		addq.b	#$01,d1
		bne.s	_chGive
		addq.b	#$01,d1

_chGive:
		movem.w	d0-d1,-(sp)
		jsr	(j_OpenChest).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_MusicChestOpen
	if REGION=DE
		clr.w	d0
		jsr		(j_GetItemFoundString).l
	else
		move.w	#$0011,d0
	endif
		jsr	(j_PrintString).l
		bsr.w	RestoreBGM
		movem.w	(sp)+,d0-d1
		cmpi.b	#$3E,d0
		beq.s	_chLifestock
		jsr	(j_GetItem).l
		tst.b	d0
		bne.s	_chOpenAnim
		jsr	(j_UpdateEkeEkeHUD).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		bra.s	_chOpenAnim

_chLifestock:
		move.w	#$0100,d0
		lea	(Player_X).l,a5
		jsr	(j_AddToMaxHealth).l
		move.w	#$0100,d0
		jsr	(j_AddHealth).l

_chHUD:
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l

_chOpenAnim:
		move.w	#$000C,AnimationFrame(a4)
		ori.b	#$80,AnimCtrl(a4)
		bsr.w	LoadSprites
		bsr.w	UpdateAnimTiles
		bsr.w	FlushDMACopyQueue

_chText:
		jsr	(j_SetUpTextDisplay).l
		bra.s	_chDone

_chFull:
	if REGION=DE
		move.w	#1,d0
		jsr		(j_GetItemFoundString).l
	else
		move.w	#$0012,d0
	endif
		jsr	(j_PrintString).l
		jsr	(j_SetUpTextDisplay).l
		bsr.s	_chestCloseAnim

_chDone:
		clr.b	(g_Controller1State).l
		move.b	#CTRLBF_AC,(g_SwordButtonMask).l
		ori	#$01,ccr
		rts

_chNone:
		tst.b	d0
		rts

_chEmpty:
		move.w	#$0010,AnimationFrame(a4)
		bsr.s	_chestAnimStep
		move.w	#$000C,AnimationFrame(a4)
		bsr.s	_chestAnimStep
		move.b	#$18,Height(a4)
		addq.w	#$08,HitBoxZEnd(a4)
		jsr	(j_SetUpTextbox).l
		jsr	(j_OpenChest).l
		move.w	#$0014,d0
		jsr	(j_PrintString).l
		bra.s	_chText


_chestOpenAnim:
		move.w	#$0004,AnimationFrame(a4)
		bsr.s	_chestAnimStep
		move.w	#$0008,AnimationFrame(a4)
		bsr.s	_chestAnimStep
		move.b	#$18,Height(a4)
		addq.w	#$08,HitBoxZEnd(a4)
		rts


_chestCloseAnim:
		move.w	#$0004,AnimationFrame(a4)
		bsr.s	_chestAnimStep
		move.w	#$0000,AnimationFrame(a4)
		bsr.s	_chestAnimStep
		move.b	#$10,Height(a4)
		subq.w	#$08,HitBoxZEnd(a4)
		rts


_chestAnimStep:
		ori.b	#$80,AnimCtrl(a4)
		movem.l	a4,-(sp)
		bsr.w	LoadSprites
		bsr.w	UpdateAnimTiles
		bsr.w	EnableDMAQueueProcessing
		move.w	#$0004,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames
		movem.l	(sp)+,a4
		rts


; Player-specific replacement for UpdateSpriteFrame (used whenever
; Nigel's graphic is loaded): decodes Player_Action with priority
; damage > attack > jump/fall > walk > carry > climb and sets
; AnimationIndex/Frame + facing flip accordingly.
UpdatePlayerSprite:


		lea	(Player_X).l,a0
		cmpi.b	#SpriteB_Nigel,Player_SpriteGraphic-Player_X(a0)
		beq.s	UpdatePlayerSpriteFrame
		jsr	(j_UpdateSpriteFrame).l
		rts

UpdatePlayerSpriteFrame:
		move.w	(Player_PrevAction).l,d2
		move.w	(Player_Action).l,d0
		move.w	d0,(Player_PrevAction).l
		btst	#$00,InteractFlags(a0)
		bne.s	_upsDone
		tst.w	d0
		beq.s	_idle
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

_upsDone:
		rts

_idle:
		bsr.w	_markFrameDirty

SetPlayerIdlePose:
		clr.w	AnimationFrame(a0)
		move.b	RotationAndSize(a0),d0
		andi.b	#DIR_MASK,d0
		beq.s	_idleNE
		cmpi.b	#DIR_SW,d0
		beq.s	_idleSW
		bhi.s	_idleNW
		move.w	#$0004,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts

_idleNE:
		clr.w	AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts

_idleNW:
		clr.w	AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts

_idleSW:
		move.w	#$0004,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts

PlayerPickUp:
		bsr.s	_markFrameDirty
		clr.w	AnimationFrame(a0)
		cmpi.w	#$00C0,d1
		beq.s	_puFace
		move.w	#$0004,AnimationFrame(a0)
		cmpi.w	#$0080,d1
		beq.s	_puFace
		move.w	#$0008,AnimationFrame(a0)

_puFace:
		move.b	RotationAndSize(a0),d0
		andi.b	#DIR_MASK,d0
		beq.s	_puFaceNE
		cmpi.b	#DIR_SW,d0
		beq.s	_puFaceSW
		bhi.s	_puFaceNW
		move.w	#$0014,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts

_puFaceNE:
		move.w	#$0010,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts

_puFaceNW:
		move.w	#$0010,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts

_puFaceSW:
		move.w	#$0014,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts


; Flag the frame graphics for reload if the action word changed.
_markFrameDirty:
		cmp.w	d0,d2
		beq.s	_mfdDone
		bset	#$07,AnimCtrl(a0)
		bset	#$07,RenderFlags(a0)

_mfdDone:
		rts


; Walk animation: 8 frames stepped at the walk speed, reversed while
; the walk-backwards flag is set; uses the carry-walk animation while
; carrying.
PlayerMove:
		andi.b	#$0F,d2
		cmp.b	d1,d2
		beq.s	_walkAnim
		clr.b	AnimPhase(a0)

_walkAnim:
		move.w	#$0008,AnimationIndex(a0)
		move.w	d0,d1
		andi.b	#$C0,d1
		beq.s	_walkPhase
		cmpi.b	#$18,(g_CarryPhase).l
		bcc.s	_walkPhase
		move.w	#$0010,AnimationIndex(a0)

_walkPhase:
		move.b	AnimPhase(a0),d0
		move.b	d0,d1
		move.b	(g_PlayerSpeed+1).l,d7
		bne.s	_walkStep
		move.w	#$0002,d7

_walkStep:
		add.b	d7,d1
		neg.b	d7
		and.b	d7,d1
		move.b	d1,AnimPhase(a0)
		andi.b	#$07,d0
		bne.s	_walkFacing
		move.b	AnimationFrame1(a0),d0
		move.b	d0,d1
		andi.b	#$E0,AnimationFrame1(a0)
		btst	#$01,CombatFlags(a0)
		beq.s	_walkFwdFrame
		subq.b	#$04,d1
		bra.s	_walkSetFrame

_walkFwdFrame:
		addq.b	#$04,d1

_walkSetFrame:
		andi.b	#$1C,d1
		or.b	d1,AnimationFrame1(a0)
		bset	#$07,AnimCtrl(a0)
		bset	#$07,RenderFlags(a0)

_walkFacing:
		move.b	RotationAndSize(a0),d0
		btst	#$01,CombatFlags(a0)
		beq.s	_walkFace
		eori.b	#DIR_FLIP,d0

_walkFace:
		andi.b	#$C0,d0
		beq.s	_walkNE
		cmpi.b	#$80,d0
		beq.s	_walkSW
		bhi.s	_walkNW
		ori.b	#$0C,AnimationIndex1(a0)
		bset	#$03,TileSource(a0)
		rts

_walkNE:
		ori.b	#$08,AnimationIndex1(a0)
		bclr	#$03,TileSource(a0)
		rts

_walkNW:
		ori.b	#$08,AnimationIndex1(a0)
		bset	#$03,TileSource(a0)
		rts

_walkSW:
		ori.b	#$0C,AnimationIndex1(a0)
		bclr	#$03,TileSource(a0)
		rts

PlayerJump:
		bsr.w	_markFrameDirty
		move.b	d0,d1
		clr.w	AnimationFrame(a0)
		andi.b	#$10,d1
		beq.s	_jumpAnim
		move.w	#$0004,AnimationFrame(a0)

_jumpAnim:
		clr.w	AnimationIndex(a0)
		clr.b	AnimPhase(a0)
		andi.b	#$C0,d0
		beq.s	_jumpFace
		cmpi.b	#$C0,d0
		beq.s	_jumpCarryBoth
		move.w	#$0010,AnimationIndex(a0)
		clr.w	AnimationFrame(a0)
		cmpi.b	#$80,d0
		beq.w	_jumpFace
		move.w	#$0004,AnimationFrame(a0)
		bra.s	_jumpFace

_jumpCarryBoth:
		move.w	#$0008,AnimationIndex(a0)

_jumpFace:
		move.b	RotationAndSize(a0),d0
		andi.b	#DIR_MASK,d0
		beq.s	_jumpNE
		cmpi.b	#DIR_SW,d0
		beq.s	_jumpSW
		bhi.s	_jumpNW
		addi.w	#$0024,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts

_jumpNE:
		addi.w	#$0020,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts

_jumpNW:
		addi.w	#$0020,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts

_jumpSW:
		addi.w	#$0024,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts

PlayerAttack:
		bsr.w	_markFrameDirty
		clr.w	AnimationFrame(a0)
		cmpi.w	#$0100,d1
		beq.s	_atkFace
		move.w	#$0004,AnimationFrame(a0)
		cmpi.w	#$0200,d1
		beq.s	_atkFace
		move.w	#$0008,AnimationFrame(a0)
		cmpi.w	#$0300,d1
		beq.s	_atkFace
		move.w	#$000C,AnimationFrame(a0)

_atkFace:
		move.b	RotationAndSize(a0),d0
		andi.b	#DIR_MASK,d0
		beq.s	_atkNE
		cmpi.b	#DIR_SW,d0
		beq.s	_atkSW
		bhi.s	_atkNW
		move.w	#$003C,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts

_atkNE:
		move.w	#$0038,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts

_atkNW:
		move.w	#$0038,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts

_atkSW:
		move.w	#$003C,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts

PlayerClimb:
		move.w	#$0040,AnimationIndex(a0)
		btst	#$06,RotationAndSize(a0)
		beq.s	_climbNoFlip
		bset	#$03,TileSource(a0)
		bra.s	_climbFrame

_climbNoFlip:
		bclr	#$03,TileSource(a0)

_climbFrame:
		move.b	AnimPhase(a0),d0
		andi.b	#$03,d0
		bne.s	_climbRet
		move.b	AnimPhase(a0),d0
		andi.w	#$000C,d0
		lsr.b	#$01,d0
		move.w	FrameNumbers(pc,d0.w),AnimationFrame(a0)
		bset	#$07,AnimCtrl(a0)
		bset	#$07,RenderFlags(a0)

_climbRet:
		rts
FrameNumbers:	dc.w $0000,$0004,$0000,$0008

PlayerTakeDamage:
		bsr.w	_markFrameDirty
		clr.w	AnimationFrame(a0)
		move.b	RotationAndSize(a0),d0
		andi.b	#DIR_MASK,d0
		beq.s	_dmgNE
		cmpi.b	#DIR_SW,d0
		beq.s	_dmgSW
		bcs.s	_dmgNW
		move.w	#$0044,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts

_dmgNE:
		move.w	#$0044,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts

_dmgNW:
		move.w	#$0048,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts

_dmgSW:
		move.w	#$0048,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts

		modend
