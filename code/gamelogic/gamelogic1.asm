GameLogic1	module

ResetGame:
		lea	(ResetSP).w,sp
		jsr	(j_DisplaySegaLogo).l
		jsr	(j_DisplayTitle).l
		bcc.w	ResetAll

; Entered from the title screen fall-through, and jumped to from
; GameOver (system.asm) to reload the save and re-enter the main loop.
RestartFromSave:
		bsr.w	LoadGame
		bsr.w	StartGame

_mainLoop:
		bsr.w	GameLoop
		bcc.s	_mainLoop
		bra.w	GameOver


; One frame of gameplay. Returns with d0 = nonzero (carry via tst) when
; the player has died, which sends _mainLoop to GameOver.
GameLoop:
		bsr.w	ProcessFloorType
		andi.w	#ACT_CLIMB,(Player_Action).l
		bsr.w	ProcessControlScript
		bsr.w	CheckForMenuOpen
		bsr.w	CheckForDebugButtons
		bsr.w	CheckForDebugSaveGame
		bsr.w	ProcessJumpAndFall
		bsr.w	ProcessActionButton
		bsr.w	HandleDirectionalInput
		jsr	(j_HandleAttack).l
		jsr	(j_ProcessDeadEnemies).l
		bsr.w	FindSpritesUnderneath
		bsr.w	ResetSpriteActions
		jsr	(j_UpdateEntities).l
		bsr.w	ValidateSpritesUnderneath
		bsr.w	MoveWithPlatformZ
		bsr.w	MoveWithPlatform
		jsr	(j_MoveSpritesWithPlatforms).l
		jsr	(j_ProcessPlayerDamage).l
		bsr.w	UpdatePlayerSprite
		jsr	(j_UpdateFrames).l
		jsr	(j_LoadPlayerSpecialAnimation).l
		jsr	(LoadSprites).l
		jsr	(UpdateAnimTiles).l
		jsr	(j_UpdatePlayerStatusEffects).l
		jsr	CheckAndDoLavaPaletteFx(pc)
		nop
		jsr	(CheckAndDisplayIntroString).l
		jsr	(j_RefreshHUD).l
		bsr.w	QueueScrollUpdates
		bsr.w	EnableVRAMCopyQueueProcessing
		bsr.w	EnableDMAQueueProcessing
		move.w	(SlowDown).w,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames
		jsr	(j_RestorePalette0).l
		tst.b	d0
		rts


; Feeds g_Controller1State either from the scripted-input stream
; (g_ControllerPlaybackTimer: $FE = hold current input, 1 = fetch next
; input+duration pair from g_InputPlaybackAddr, negative input byte
; ends the script) or from the real pad. While paralysed only START gets
; through (menu still opens, no movement); during a special player
; animation all input is blocked.
ProcessControlScript:
		move.w	(g_ControllerPlayback).l,d0
		beq.s	_liveInput
		move.b	(g_ControllerPlayback).l,(g_Controller1State).l
		cmpi.b	#$FE,d0
		beq.s	_keepInput
		subq.b	#$01,d0
		bne.s	_setPlayback
		movea.l	(g_InputPlaybackAddr).l,a0
		move.b	(a0)+,d0
		bmi.s	_scriptEnd
		lsl.w	#$08,d0
		move.b	(a0)+,d0
		move.l	a0,(g_InputPlaybackAddr).l

_setPlayback:
		move.w	d0,(g_ControllerPlayback).l

_keepInput:
		rts

_scriptEnd:
		clr.w	(g_ControllerPlayback).l

_liveInput:
		tst.b	(g_PlayerAnimation).l
		bne.s	_animLock
		bsr.w	UpdateControllerInputs
		btst	#STATUS_PARALYSIS,(g_PlayerStatus).l
		beq.s	_ctrlDone
		andi.b	#CTRLBF_START,(g_Controller1State).l

_ctrlDone:
		rts

_animLock:
		clr.b	(g_Controller1State).l
		rts


; Carries the player along with a moving sprite they stand on: adopts
; the platform's speed and steers via the directional dispatch using
; the platform's walk action bits (control nibbles $09/$06/$05/$0A =
; NE/SW/NW/SE). ACT_RIDING in Player_Action marks "riding".
MoveWithPlatform:
		move.w	(Player_SpriteUnderneath).l,d0
		bmi.s	_mwpDone
		lea	(Player_X).l,a0
		adda.w	d0,a0
		move.w	(g_PlayerSpeed).l,d2
		move.b	Speed(a0),d0
		andi.w	#$000F,d0
		beq.s	_mwpDone
		move.w	d0,(g_PlayerSpeed).l
		bset	#ACTBH_RIDING,(Player_Action).l
		move.b	Action1(a0),d1
		move.b	#$09,d0
		lsr.b	#$01,d1
		bcs.w	_platformSteer
		move.b	#$06,d0
		lsr.b	#$01,d1
		bcs.w	_platformSteer
		move.b	#$05,d0
		lsr.b	#$01,d1
		bcs.w	_platformSteer
		move.b	#$0A,d0
		lsr.b	#$01,d1
		bcs.w	_platformSteer
		move.w	d2,(g_PlayerSpeed).l
		bclr	#ACTBH_RIDING,(Player_Action).l

_mwpDone:
		rts


; Keeps the player glued to a vertically-moving platform: while the
; platform's jump bit is set the player rises to its top, while its
; fall bit is set the player descends, shifting the view via
; _viewRiseZ/_viewDropZ.
MoveWithPlatformZ:
		move.w	(Player_SpriteUnderneath).l,d0
		bmi.s	_mwpzDone
		lea	(Player_X).l,a0
		adda.w	d0,a0
		btst	#ACTB_JUMP,Action1(a0)
		beq.s	_platformDown
		move.w	HitBoxZEnd(a0),d7
		sub.w	(Player_Z).l,d7
		addq.w	#$01,d7
		beq.s	_mwpzDone
		add.w	d7,(Player_Z).l
		add.w	d7,(Player_HitBoxZEnd).l
		bra.w	_viewRiseZ

_platformDown:
		btst	#ACTB_FALL,Action1(a0)
		beq.s	_mwpzDone
		move.w	(Player_Z).l,d7
		sub.w	HitBoxZEnd(a0),d7
		subq.w	#$01,d7
		beq.s	_mwpzDone
		lea	(Player_X).l,a0
		bsr.w	GetDropDistance
		move.b	d5,d7
		beq.s	_mwpzDone
		sub.w	d7,(Player_Z).l
		sub.w	d7,(Player_HitBoxZEnd).l
		bra.w	_viewDropZ

_mwpzDone:
		rts


; Builds the 4-bit UP/DOWN/LEFT/RIGHT control value (bit 4 set while
; confused, selecting the swapped half of the table below) and jumps
; through HandleDirectionalControl. Debug: holding C on pad 2 gives
; speed 8 instead of 2.
HandleDirectionalInput:
		bclr	#$06,(g_PlayerStatus).l
		clr.w	d0
		bsr.w	CheckForCollision
		bcc.s	_speedSel
		bset	#$06,(g_PlayerStatus).l

_speedSel:
		tst.w	(DebugModeEnable).w
		bmi.s	_normalSpeed
		move.w	#$0008,(g_PlayerSpeed).l
		btst	#CTRL_C,(g_Controller2State).l
		bne.s	_readInput

_normalSpeed:
		move.w	#$0002,(g_PlayerSpeed).l

_readInput:
		move.b	(g_Controller1State).l,d0
		lea	(Player_X).l,a5
		andi.b	#$0F,d0
		tst.w	(g_ControllerPlayback).l
		bne.s	_dispatch
		move.b	(g_PlayerStatus).l,d1
		andi.b	#$02,d1			  ; Confusion
		lsl.b	#$03,d1
		or.b	d1,d0

_dispatch:
		lsl.b	#$02,d0
		ext.w	d0
		jmp	HandleDirectionalControl(pc,d0.w)


; MoveWithPlatform enters the dispatch here with d0 = control nibble.
_platformSteer:
		lea	(Player_X).l,a5
		andi.b	#$0F,d0
		bra.s	_dispatch


; Jump table indexed by control value * 4 (UP=1/DOWN=2/LEFT=4/RIGHT=8,
; +16 while confused - the confused half swaps opposite directions).
; The single buttons resolve to a diagonal via the Handle*Button
; routines below based on the camera-relative facing.
HandleDirectionalControl:
		bra.w	_noMove		  ; No input
		bra.w	HandleUpButton		  ; UP selected
		bra.w	HandleDownButton	  ; DOWN selected
		bra.w	_noMove		  ; UP + DOWN selected
		bra.w	HandleLeftButton	  ; LEFT selected
		bra.w	HandleUpLeft		  ; UP + LEFT selected
		bra.w	HandleDownLeft		  ; DOWN + LEFT	selected
		bra.w	_noMove		  ; UP + DOWN +	LEFT selected
		bra.w	HandleRightButton	  ; RIGHT selected
		bra.w	HandleUpRight		  ; RIGHT + UP selected
		bra.w	HandleDownRight		  ; RIGHT + DOWN selected
		bra.w	_noMove		  ; RIGHT + UP + DOWN selected
		bra.w	_noMove		  ; RIGHT + LEFT selected
		bra.w	_noMove		  ; RIGHT + LEFT + UP selected
		bra.w	_noMove		  ; RIGHT + LEFT + DOWN	selected
		bra.w	_noMove		  ; RIGHT + LEFT + UP +	DOWN selected
		bra.w	_noMove		  ; No input, confusion
		bra.w	HandleDownButton	  ; UP selected, confusion
		bra.w	HandleUpButton		  ; DOWN selected, confusion
		bra.w	_noMove		  ; UP + DOWN selected,	confusion
		bra.w	HandleRightButton	  ; LEFT selected, confusion
		bra.w	HandleDownRight		  ; LEFT + UP selected,	confusion
		bra.w	HandleUpRight		  ; LEFT + DOWN	selected, confusion
		bra.w	_noMove		  ; LEFT + UP +	DOWN selected, confusion
		bra.w	HandleLeftButton	  ; RIGHT selected, confusion
		bra.w	HandleDownLeft		  ; RIGHT + UP selected, confusion
		bra.w	HandleUpLeft		  ; RIGHT + DOWN selected, confusion
		bra.w	_noMove		  ; RIGHT + UP + DOWN selected,	confusion
		bra.w	_noMove		  ; RIGHT + LEFT selected, confusion
		bra.w	_noMove		  ; RIGHT + LEFT + UP selected,	confusion
		bra.w	_noMove		  ; RIGHT + LEFT + DOWN	selected, confusion
		bra.w	*+4			  ; RIGHT + LEFT + UP +	DOWN selected, confusion

_noMove:
		rts

HandleUpButton:
		tst.b	(g_PlayerStatus).l
		bmi.s	_upFlip
		btst	#$06,RotationAndSize(a5)
		beq.w	HandleUpRight		  ; Travel in the NE (-Y) direction
		bra.w	HandleUpLeft		  ; Travel in the NW (-X) direction

_upFlip:
		btst	#$06,RotationAndSize(a5)
		beq.w	HandleUpLeft		  ; Travel in the NW (-X) direction
		bra.w	HandleUpRight		  ; Travel in the NE (-Y) direction

HandleRightButton:
		tst.b	(g_PlayerStatus).l
		bmi.s	_rightFlip
		btst	#$06,RotationAndSize(a5)
		beq.w	HandleUpRight		  ; Travel in the NE (-Y) direction
		bra.w	HandleDownRight		  ; Travel in the SE (+X) direction

_rightFlip:
		btst	#$06,RotationAndSize(a5)
		beq.w	HandleDownRight		  ; Travel in the SE (+X) direction
		bra.w	HandleUpRight		  ; Travel in the NE (-Y) direction

HandleDownButton:
		tst.b	(g_PlayerStatus).l
		bmi.s	_downFlip
		btst	#$06,RotationAndSize(a5)
		beq.w	HandleDownLeft		  ; Travel in the SW (+Y) direction
		bra.w	HandleDownRight		  ; Travel in the SE (+X) direction

_downFlip:
		btst	#$06,RotationAndSize(a5)
		beq.w	HandleDownRight		  ; Travel in the SE (+X) direction
		bra.w	HandleDownLeft		  ; Travel in the SW (+Y) direction

HandleLeftButton:
		tst.b	(g_PlayerStatus).l
		bmi.s	_leftFlip
		btst	#$06,RotationAndSize(a5)
		beq.w	HandleDownLeft		  ; Travel in the SW (+Y) direction
		bra.w	HandleUpLeft		  ; Travel in the NW (-X) direction

_leftFlip:
		btst	#$06,RotationAndSize(a5)
		beq.w	HandleUpLeft		  ; Travel in the NW (-X) direction
		bra.w	HandleDownLeft		  ; Travel in the SW (+Y) direction

; The four movers below share one structure per direction: probe the
; hitbox by speed, run the heightmap check, then either commit the move
; (updating Centre/Sub coords, coarse cell + heightmap pointer, camera
; and tile streaming), deflect along a wall at speed 1, start a ladder
; climb (NE/NW only), or revert the probe on collision.
HandleUpRight:
		tst.w	(g_ControllerPlayback).l  ; Travel in the NE (-Y) direction
		bne.s	_neProbe
		bclr	#$07,(g_PlayerStatus).l

_neProbe:
		move.w	HitBoxYStart(a5),d1
		move.w	(g_PlayerSpeed).l,d0
		sub.w	d0,HitBoxYStart(a5)
		sub.w	d0,HitBoxYEnd(a5)
		move.w	HitBoxYStart(a5),d0
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.w	_neClip
		bsr.w	CheckWallNE
		bcc.w	_neClip
		btst	#ACTBH_RIDING,(Player_Action).l
		beq.s	_neBlocked
		btst	#$04,GroundHeight(a0)
		bne.w	_neClip

_neBlocked:
		bsr.w	_revertProbeNE
		move.b	SubX(a5),d2
		addq.b	#$01,d2
		andi.b	#$FE,d2
		cmpi.b	#$08,d2
		bne.s	_neDeflect
		move.b	GroundType(a5),d2
		andi.b	#$3F,d2
		cmpi.b	#FLOOR_LADDER_NE,d2
		bne.s	_neDeflect
		bsr.w	GetClearanceAbove
		tst.w	d5
		bne.s	_neLadder
		rts

_neLadder:
		addq.w	#$01,Z(a5)
		addq.w	#$01,HitBoxZEnd(a5)
		bset	#ACTBH_CLIMB,(Player_Action).l
		bne.s	_neLadderAnim
		clr.w	AnimationFrame(a5)
		move.b	#$FF,AnimPhase(a5)
		andi.b	#$E0,JumpRate(a5)

_neLadderAnim:
		andi.b	#$3F,RotationAndSize(a5)
		addq.b	#$01,AnimPhase(a5)
		clr.b	FallRate(a5)
		move.b	(g_VBlankCounterLow).l,d7
		andi.b	#$03,d7
		bne.s	_neLadderRise
		trap	#$00			  ; Trap00Handler
		dc.w SND_JumpLand

_neLadderRise:
		moveq	#$1,d7
		bra.w	_viewRiseZ

_neDeflect:
		bclr	#ACTBH_CLIMB,(Player_Action).l
		move.w	#$0001,(g_PlayerSpeed).l
		andi.b	#$3F,d5
		cmpi.b	#$0E,d5
		beq.w	_neFinish
		cmp.b	d0,d3
		bcc.w	HandleUpLeft		  ; Travel in the NW (-X) direction
		cmp.b	d1,d3
		bcc.w	HandleDownRight		  ; Travel in the SE (+X) direction
		bra.w	_neFinish

_neClip:
		bclr	#ACTBH_CLIMB,(Player_Action).l
		clr.w	d0
		tst.b	(g_PlayerHurtTimer).l
		beq.s	_neCollide

_neHurtPush:
		bsr.w	CollisionDetectNonHostile
		bra.s	_neCollRes

_neCollide:
		btst	#$06,(g_PlayerStatus).l
	if	FIX_COLL_2
		bne.s	_neHurtPush
	else
		bne.s	_neCommit
	endif
		bsr.w	CollisionDetect

_neCollRes:
		bcc.s	_neCommit
		tst.b	InteractFlags(a0)
		bpl.s	_neTouch
		bsr.w	QueueContactDamage

_neTouch:
		bsr.s	_revertProbeNE
		bra.w	_neFinish


_revertProbeNE:
		move.w	(g_PlayerSpeed).l,d2
		add.w	d2,HitBoxYStart(a5)
		add.w	d2,HitBoxYEnd(a5)
		rts


_neCommit:
		btst	#$04,StateFlags(a5)
		beq.s	_neApply
		lsr	(g_PlayerSpeed).l
		bsr.s	_revertProbeNE

_neApply:
		move.w	CentreY(a5),d0
		move.b	d0,d1
		sub.w	(g_PlayerSpeed).l,d0
		move.w	d0,CentreY(a5)
		andi.b	#$0F,d0
		move.b	d0,SubY(a5)
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.s	_neCamApply
		subq.b	#$01,(Player_Y).l
		subi.w	#$0094,(Player_HeightmapOffset).l
		movea.w	HeightmapOffset(a5),a6
		move.w	GroundHeight(a5),(g_PrevGroundHeight).l
		move.w	(a6),GroundHeight(a5)

_neCamApply:
		move.w	(g_CameraFineY).l,d0
		move.b	d0,d1
		sub.w	(g_PlayerSpeed).l,d0
		move.w	d0,(g_CameraFineY).l
		andi.b	#$0F,d0
		move.b	d0,(g_CameraSubY).l
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.s	_neScroll
		subq.b	#$01,(g_PlayerYFlattened).l
		subi.w	#$0020,(g_BlockTableIndex).l
		bpl.s	_neTiles
		addi.w	#$0210,(g_BlockTableIndex).l
		cmpi.w	#$0200,(g_BlockTableIndex).l
		bcs.s	_neTiles
		subi.w	#$0020,(g_BlockTableIndex).l

_neTiles:
		jsr	(LoadRightTiles).l
		jsr	(LoadTopTiles).l

_neScroll:
		bsr.w	_scrollCamUp
		bsr.w	_scrollCamRight

_neFinish:
		bclr	#ACTBH_RIDING,(Player_Action).l
		bne.s	_neDone
		andi.b	#$3F,(Player_RotationAndSize).l
		bset	#ACTB_WALK_NE,(Player_Action+1).l
		bset	#$00,(Player_MovedDirFlags).l

_neDone:
		rts

HandleDownRight:
		tst.w	(g_ControllerPlayback).l  ; Travel in the SE (+X) direction
		bne.s	_seProbe
		bclr	#$07,(g_PlayerStatus).l

_seProbe:
		bclr	#ACTBH_CLIMB,(Player_Action).l
		move.w	HitBoxXEnd(a5),d1
		move.w	(g_PlayerSpeed).l,d0
		add.w	d0,HitBoxXStart(a5)
		add.w	d0,HitBoxXEnd(a5)
		move.w	HitBoxXEnd(a5),d0
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bls.s	_seClip
		bsr.w	CheckWallSE
		bcc.s	_seClip
		btst	#ACTBH_RIDING,(Player_Action).l
		beq.s	_seDeflect
		btst	#$04,GroundHeight(a0)
		bne.w	_seClip

_seDeflect:
		bsr.s	_revertProbeSE
		move.w	#$0001,(g_PlayerSpeed).l
		andi.b	#$3F,d5
		cmpi.b	#$0E,d5
		beq.w	_seFinish
		cmp.b	d0,d3
		bcc.w	HandleUpRight		  ; Travel in the NE (-Y) direction
		cmp.b	d1,d3
		bcc.w	HandleDownLeft		  ; Travel in the SW (+Y) direction
		bra.w	_seFinish

_seClip:
		clr.w	d0
		tst.b	(g_PlayerHurtTimer).l
		beq.s	_seCollide

_seHurtPush:
		bsr.w	CollisionDetectNonHostile
		bra.s	_seCollRes

_seCollide:
		btst	#$06,(g_PlayerStatus).l
	if FIX_COLL_2
		bne.s	_seHurtPush
	else
		bne.s	_seCommit
	endif
		bsr.w	CollisionDetect

_seCollRes:
		bcc.s	_seCommit
		tst.b	InteractFlags(a0)
		bpl.s	_seTouch
		bsr.w	QueueContactDamage

_seTouch:
		bsr.s	_revertProbeSE
		bra.w	_seFinish


_revertProbeSE:
		move.w	(g_PlayerSpeed).l,d2
		sub.w	d2,HitBoxXStart(a5)
		sub.w	d2,HitBoxXEnd(a5)
		rts


_seCommit:
		btst	#$04,StateFlags(a5)
		beq.s	_seApply
		lsr	(g_PlayerSpeed).l
		bsr.s	_revertProbeSE

_seApply:
		move.w	CentreX(a5),d0
		move.b	d0,d1
		add.w	(g_PlayerSpeed).l,d0
		move.w	d0,CentreX(a5)
		andi.b	#$0F,d0
		move.b	d0,SubX(a5)
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d1,d0
		bcc.s	_seCamApply
		addq.b	#$01,(Player_X).l
		addi.w	#$0002,HeightmapOffset(a5)
		movea.w	HeightmapOffset(a5),a6
		move.w	GroundHeight(a5),(g_PrevGroundHeight).l
		move.w	(a6),GroundHeight(a5)

_seCamApply:
		move.w	(g_CameraFineX).l,d0
		move.b	d0,d1
		add.w	(g_PlayerSpeed).l,d0
		move.w	d0,(g_CameraFineX).l
		andi.b	#$0F,d0
		move.b	d0,(g_CameraSubX).l
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d1,d0
		bcc.s	_seScroll
		addq.b	#$01,(g_PlayerXFlattened).l
		move.w	(g_BlockTableIndex).l,d0
		addq.w	#$01,d0
		move.w	d0,(g_BlockTableIndex).l
		andi.w	#$001F,d0
		bne.s	_seTiles
		subi.w	#$0020,(g_BlockTableIndex).l

_seTiles:
		jsr	(LoadRightTiles).l
		jsr	(LoadBottomTiles).l

_seScroll:
		bsr.w	_scrollCamDown
		bsr.w	_scrollCamRight

_seFinish:
		bclr	#ACTBH_RIDING,(Player_Action).l
		bne.s	_seDone
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#DIR_SE,(Player_RotationAndSize).l
		bset	#ACTB_WALK_SE,(Player_Action+1).l
		bset	#$03,(Player_MovedDirFlags).l

_seDone:
		rts

HandleDownLeft:
		tst.w	(g_ControllerPlayback).l  ; Travel in the SW (+Y) direction
		bne.s	_swProbe
		bclr	#$07,(g_PlayerStatus).l

_swProbe:
		bclr	#ACTBH_CLIMB,(Player_Action).l
		move.w	HitBoxYEnd(a5),d1
		move.w	(g_PlayerSpeed).l,d0
		add.w	d0,HitBoxYStart(a5)
		add.w	d0,HitBoxYEnd(a5)
		move.w	HitBoxYEnd(a5),d0
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bls.s	_swClip
		bsr.w	CheckWallSW
		bcc.s	_swClip
		bsr.s	_revertProbeSW
		move.w	#$0001,(g_PlayerSpeed).l
		andi.b	#$3F,d5
		cmpi.b	#$0E,d5
		beq.w	_swFinish
		cmp.b	d0,d3
		bcc.w	HandleUpLeft		  ; Travel in the NW (-X) direction
		cmp.b	d1,d3
		bcc.w	HandleDownRight		  ; Travel in the SE (+X) direction
		bra.w	_swFinish

_swClip:
		clr.w	d0
		tst.b	(g_PlayerHurtTimer).l
		beq.s	_swCollide

_swHurtPush:
		bsr.w	CollisionDetectNonHostile
		bra.s	_swCollRes

_swCollide:
		btst	#$06,(g_PlayerStatus).l
	if FIX_COLL_2
		bne.s	_swHurtPush
	else
		bne.s	_swCommit
	endif
		bsr.w	CollisionDetect

_swCollRes:
		bcc.s	_swCommit
		tst.b	InteractFlags(a0)
		bpl.s	_swTouch
		bsr.w	QueueContactDamage

_swTouch:
		bsr.s	_revertProbeSW
		bra.w	_swFinish


_revertProbeSW:
		move.w	(g_PlayerSpeed).l,d2
		sub.w	d2,HitBoxYStart(a5)
		sub.w	d2,HitBoxYEnd(a5)
		rts


_swCommit:
		btst	#$04,StateFlags(a5)
		beq.s	_swApply
		lsr	(g_PlayerSpeed).l
		bsr.s	_revertProbeSW

_swApply:
		move.w	CentreY(a5),d0
		move.b	d0,d1
		add.w	(g_PlayerSpeed).l,d0
		move.w	d0,CentreY(a5)
		andi.b	#$0F,d0
		move.b	d0,SubY(a5)
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d1,d0
		bcc.s	_swCamApply
		addq.b	#$01,(Player_Y).l
		addi.w	#$0094,HeightmapOffset(a5)
		movea.w	HeightmapOffset(a5),a6
		move.w	GroundHeight(a5),(g_PrevGroundHeight).l
		move.w	(a6),GroundHeight(a5)

_swCamApply:
		move.w	(g_CameraFineY).l,d0
		move.b	d0,d1
		add.w	(g_PlayerSpeed).l,d0
		move.w	d0,(g_CameraFineY).l
		andi.b	#$0F,d0
		move.b	d0,(g_CameraSubY).l
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d1,d0
		bcc.s	_swScroll
		addq.b	#$01,(g_PlayerYFlattened).l
		addi.w	#$0020,(g_BlockTableIndex).l
		cmpi.w	#$0200,(g_BlockTableIndex).l
		bcs.s	_swTiles
		subi.w	#$0210,(g_BlockTableIndex).l
		bpl.s	_swTiles
		addi.w	#$0020,(g_BlockTableIndex).l

_swTiles:
		jsr	(LoadBottomTiles).l
		jsr	(LoadLeftTiles).l

_swScroll:
		bsr.w	_scrollCamDown
		bsr.w	_scrollCamLeft

_swFinish:
		bclr	#ACTBH_RIDING,(Player_Action).l
		bne.s	_swDone
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#DIR_SW,(Player_RotationAndSize).l
		bset	#ACTB_WALK_SW,(Player_Action+1).l
		bset	#$01,(Player_MovedDirFlags).l

_swDone:
		rts

HandleUpLeft:
		tst.w	(g_ControllerPlayback).l  ; Travel in the NW (-X) direction
		bne.s	_nwProbe
		bclr	#$07,(g_PlayerStatus).l

_nwProbe:
		move.w	HitBoxXStart(a5),d1
		move.w	(g_PlayerSpeed).l,d0
		sub.w	d0,HitBoxXStart(a5)
		sub.w	d0,HitBoxXEnd(a5)
		move.w	HitBoxXStart(a5),d0
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.w	_nwClip
		bsr.w	CheckWallNW
		bcc.w	_nwClip
		bsr.w	_revertProbeNW
		move.b	SubX(a5),d2
		addq.b	#$01,d2
		andi.b	#$FE,d2
		cmpi.b	#$08,d2
		bne.s	_nwDeflect
		move.b	GroundType(a5),d2
		andi.b	#$3F,d2
		cmpi.b	#FLOOR_LADDER_NW,d2
		bne.s	_nwDeflect
		bsr.w	GetClearanceAbove
		tst.w	d5
		bne.s	_nwLadder
		rts

_nwLadder:
		addq.w	#$01,Z(a5)
		addq.w	#$01,HitBoxZEnd(a5)
		bset	#ACTBH_CLIMB,(Player_Action).l
		bne.s	_nwLadderAnim
		clr.w	AnimationFrame(a5)
		move.b	#$FF,AnimPhase(a5)
		andi.w	#$60E0,FallRate(a5)

_nwLadderAnim:
		ori.b	#DIR_NW,RotationAndSize(a5)
		addq.b	#$01,AnimPhase(a5)
		clr.b	FallRate(a5)
		move.b	(g_VBlankCounterLow).l,d7
		andi.b	#$03,d7
		bne.s	_nwLadderRise
		trap	#$00			  ; Trap00Handler
		dc.w SND_JumpLand

_nwLadderRise:
		moveq	#$1,d7
		bra.w	_viewRiseZ

_nwDeflect:
		bclr	#ACTBH_CLIMB,(Player_Action).l
		move.w	#$0001,(g_PlayerSpeed).l
		andi.b	#$3F,d5
		cmpi.b	#$0E,d5
		beq.w	_nwFinish
		cmp.b	d0,d3
		bcc.w	HandleUpRight		  ; Travel in the NE (-Y) direction
		cmp.b	d1,d3
		bcc.w	HandleDownLeft		  ; Travel in the SW (+Y) direction
		bra.w	_nwFinish

_nwClip:
		bclr	#ACTBH_CLIMB,(Player_Action).l
		clr.w	d0
		tst.b	(g_PlayerHurtTimer).l
		beq.s	_nwCollide

_nwHurtPush:
		bsr.w	CollisionDetectNonHostile
		bra.s	_nwCollRes

_nwCollide:
		btst	#$06,(g_PlayerStatus).l
	if FIX_COLL_2
		bne.s	_nwHurtPush
	else
		bne.s	_nwCommit
	endif
		bsr.w	CollisionDetect

_nwCollRes:
		bcc.s	_nwCommit
		tst.b	InteractFlags(a0)
		bpl.s	_nwTouch
		bsr.w	QueueContactDamage

_nwTouch:
		bsr.s	_revertProbeNW
		bra.w	_nwFinish


_revertProbeNW:
		move.w	(g_PlayerSpeed).l,d2
		add.w	d2,HitBoxXStart(a5)
		add.w	d2,HitBoxXEnd(a5)
		rts


_nwCommit:
		btst	#$04,StateFlags(a5)
		beq.w	_nwApply
		lsr	(g_PlayerSpeed).l
		bsr.s	_revertProbeNW

_nwApply:
		move.w	CentreX(a5),d0
		move.b	d0,d1
		sub.w	(g_PlayerSpeed).l,d0
		move.w	d0,CentreX(a5)
		andi.b	#$0F,d0
		move.b	d0,SubX(a5)
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.s	_nwCamApply
		subq.b	#$01,(Player_X).l
		subi.w	#$0002,HeightmapOffset(a5)
		movea.w	HeightmapOffset(a5),a6
		move.w	GroundHeight(a5),(g_PrevGroundHeight).l
		move.w	(a6),GroundHeight(a5)

_nwCamApply:
		move.w	(g_CameraFineX).l,d0
		move.b	d0,d1
		sub.w	(g_PlayerSpeed).l,d0
		move.w	d0,(g_CameraFineX).l
		andi.b	#$0F,d0
		move.b	d0,(g_CameraSubX).l
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.s	_nwScroll
		subq.b	#$01,(g_PlayerXFlattened).l
		move.w	(g_BlockTableIndex).l,d0
		subq.w	#$01,d0
		move.w	d0,(g_BlockTableIndex).l
		andi.w	#$001F,d0
		cmpi.w	#$001F,d0
		bne.s	_nwTiles
		addi.w	#$0020,(g_BlockTableIndex).l

_nwTiles:
		jsr	(LoadTopTiles).l
		jsr	(LoadLeftTiles).l

_nwScroll:
		bsr.w	_scrollCamUp
		bsr.w	_scrollCamLeft

_nwFinish:
		bclr	#ACTBH_RIDING,(Player_Action).l
		bne.s	_nwDone
		ori.b	#DIR_NW,(Player_RotationAndSize).l
		bset	#ACTB_WALK_NW,(Player_Action+1).l
		bset	#$02,(Player_MovedDirFlags).l

_nwDone:
		rts


; While not already climbing (ACTBH_CLIMB clear): descend if there is
; room below (_getFallDist), else try to rise via HandleJump
; (_getJumpRise), shifting the view by the Z delta either way.
ProcessJumpAndFall:
		move.b	(g_Controller1State).l,d1
		and.b	d1,(g_JumpButtonLatch).l
		btst	#ACTBH_CLIMB,(Player_Action).l
		bne.s	_vertDone
		bsr.s	_getFallDist
		tst.b	d7
		bne.w	_viewDropZ
		btst	#ACTB_FALL,(Player_AnimAction1).l
		beq.s	_tryRise
		trap	#$00			  ; Trap00Handler
		dc.w SND_LadderClimb

_tryRise:
		bsr.s	_getJumpRise
		tst.b	d7
		bne.w	_viewRiseZ

_vertDone:
		rts


_getFallDist:
		bsr.w	ApplyGravityPlayer
		move.w	d6,d7
		rts


_getJumpRise:
		lea	(Player_X).l,a0
		move.w	Z(a0),d7
		movem.w	d7,-(sp)
		bsr.w	HandleJump
		movem.w	(sp)+,d6
		move.w	Z(a0),d7
		sub.w	d6,d7
		beq.s	_noRise
		bset	#ACTB_JUMP,(Player_Action+1).l

_noRise:
		rts


; Per-tick sprite action reset: clears each sprite's queued action word
; (keeping refresh+damage, plus the attack bits for a reviving mummy so
; its get-up animation survives), then flags sprites with no ground
; under them as falling.
ResetSpriteActions:
		lea	(Sprite1_X).l,a0
		moveq	#$E,d7

_rsaLoop:
		cmpi.b	#SPR_MUMMY3,SpriteType(a0)
		bne.s	_clearActions
		tst.b	AICounter(a0)
		beq.s	_clearActions
		andi.w	#(ACT_REFRESH+ACT_DAMAGE+ACT_ATTACK_MASK),QueuedAction(a0)
		bra.s	_chkSprite

_clearActions:
		andi.w	#(ACT_REFRESH+ACT_DAMAGE),QueuedAction(a0)

_chkSprite:
		move.b	(a0),d0
		bmi.s	_rsaDone
		cmpi.b	#$7F,d0
		beq.s	_rsaNext
		movem.l	d7-a0,-(sp)
		bsr.s	_fallDistCheck
		tst.b	d7
		beq.s	_groundTick
		movem.l	(sp)+,d7-a0
		bset	#ACTB_FALL,Action1(a0)
		bra.s	_rsaNext

_groundTick:
		bsr.s	_spriteGroundTick
		movem.l	(sp)+,d7-a0

_rsaNext:
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,_rsaLoop

_rsaDone:
		rts


_fallDistCheck:
		bsr.w	ApplyGravity
		move.w	d6,d7
		rts


_spriteGroundTick:
		jsr	(j_ProcessSpriteJump).l
		rts


; The player dropped d7 units of Z: shift the flattened camera position
; +d7 on both axes, stream in newly exposed tiles, and scroll the view
; down by 2*d7. _viewRiseZ is the mirror for rising.
_viewDropZ:
		clr.b	d1
		move.w	(g_CameraFineX).l,d2
		move.b	d2,d3
		add.w	d7,d2
		move.w	d2,(g_CameraFineX).l
		andi.b	#$0F,d2
		move.b	d2,(g_CameraSubX).l
		andi.b	#$08,d2
		andi.b	#$08,d3
		cmp.b	d3,d2
		bcc.s	_dropY
		addq.b	#$01,(g_PlayerXFlattened).l
		move.w	(g_BlockTableIndex).l,d0
		addq.w	#$01,d0
		move.w	d0,(g_BlockTableIndex).l
		andi.w	#$001F,d0
		bne.s	_dropTilesX
		subi.w	#$0020,(g_BlockTableIndex).l

_dropTilesX:
		movem.w	d7,-(sp)
		jsr	(LoadBottomTiles).l
		movem.w	(sp)+,d7
		moveq	#$1,d1

_dropY:
		move.w	(g_CameraFineY).l,d2
		move.b	d2,d3
		add.w	d7,d2
		move.w	d2,(g_CameraFineY).l
		andi.b	#$0F,d2
		move.b	d2,(g_CameraSubY).l
		andi.b	#$08,d2
		andi.b	#$08,d3
		cmp.b	d3,d2
		bcc.s	_dropNoY
		addq.b	#$01,(g_PlayerYFlattened).l
		addi.w	#$0020,(g_BlockTableIndex).l
		cmpi.w	#$0200,(g_BlockTableIndex).l
		bcs.s	_dropTilesY
		subi.w	#$0210,(g_BlockTableIndex).l
		bpl.s	_dropTilesY
		addi.w	#$0020,(g_BlockTableIndex).l

_dropTilesY:
		movem.w	d7,-(sp)
		tst.b	d1
		bne.s	_dropBottom
		jsr	(LoadLeftTiles).l

_dropBottom:
		jsr	(LoadBottomTiles).l
		movem.w	(sp)+,d7
		add.w	d7,d7
		bsr.w	_scrollCamDownBy
		rts

_dropNoY:
		tst.b	d1
		beq.s	_dropScroll
		movem.w	d7,-(sp)
		jsr	(LoadRightTiles).l
		movem.w	(sp)+,d7

_dropScroll:
		add.w	d7,d7
		bsr.w	_scrollCamDownBy
		rts

_viewRiseZ:
		clr.b	d1
		move.w	(g_CameraFineX).l,d2
		move.b	d2,d3
		sub.w	d7,d2
		move.w	d2,(g_CameraFineX).l
		andi.b	#$0F,d2
		move.b	d2,(g_CameraSubX).l
		andi.b	#$08,d2
		andi.b	#$08,d3
		cmp.b	d2,d3
		bcc.s	_riseY
		subq.b	#$01,(g_PlayerXFlattened).l
		move.w	(g_BlockTableIndex).l,d0
		subq.w	#$01,d0
		move.w	d0,(g_BlockTableIndex).l
		andi.w	#$001F,d0
		cmpi.w	#$001F,d0
		bne.s	_riseTilesX
		addi.w	#$0020,(g_BlockTableIndex).l

_riseTilesX:
		movem.w	d7,-(sp)
		jsr	(LoadTopTiles).l
		movem.w	(sp)+,d7
		moveq	#$1,d1

_riseY:
		move.w	(g_CameraFineY).l,d2
		move.w	d2,d3
		sub.w	d7,d2
		move.w	d2,(g_CameraFineY).l
		andi.b	#$0F,d2
		move.b	d2,(g_CameraSubY).l
		andi.b	#$08,d2
		andi.b	#$08,d3
		cmp.b	d2,d3
		bcc.s	_riseNoY
		subq.b	#$01,(g_PlayerYFlattened).l
		subi.w	#$0020,(g_BlockTableIndex).l
		bpl.s	_riseTilesY
		addi.w	#$0210,(g_BlockTableIndex).l
		cmpi.w	#$0200,(g_BlockTableIndex).l
		bcs.s	_riseTilesY
		subi.w	#$0020,(g_BlockTableIndex).l

_riseTilesY:
		movem.w	d7,-(sp)
		tst.b	d1
		bne.s	_riseTop
		jsr	(LoadRightTiles).l

_riseTop:
		jsr	(LoadTopTiles).l
		movem.w	(sp)+,d7
		add.w	d7,d7
		bsr.s	_scrollCamUpBy

; fall-through return for the path above
_ret:
		rts


_riseNoY:
		tst.b	d1
		beq.s	_riseScroll
		movem.w	d7,-(sp)
		jsr	(LoadLeftTiles).l
		movem.w	(sp)+,d7

_riseScroll:
		add.w	d7,d7
		bsr.s	_scrollCamUpBy
		rts


; Scroll the view up by the player speed (falls through to the by-d7
; core, which moves VSRAM one line every other step - vertical camera
; movement is half the horizontal rate in this projection).
_scrollCamUp:
		move.w	(g_PlayerSpeed).l,d7

_scrollCamUpBy:
		subq.w	#$01,d7

_scuLoop:
		eori.w	#$0001,(g_VScrollParity).l
		bne.s	_scuNext
		subq.w	#$01,(g_VSRAMData).l
		subq.w	#$01,(g_VSRAMData+2).l

_scuNext:
		dbf	d7,_scuLoop
		move.b	#$01,(g_PlayerMoving).l
		rts


_scrollCamRight:
		move.w	(g_PlayerSpeed).l,d7
		sub.w	d7,(g_HorizontalScrollData).l
		sub.w	d7,(g_HorizontalScrollData+2).l
		move.b	#$01,(g_PlayerMoving).l
		rts


_scrollCamDown:
		move.w	(g_PlayerSpeed).l,d7

_scrollCamDownBy:
		subq.w	#$01,d7

_scdLoop:
		eori.w	#$0001,(g_VScrollParity).l
		beq.s	_scdNext
		addq.w	#$01,(g_VSRAMData).l
		addq.w	#$01,(g_VSRAMData+2).l

_scdNext:
		dbf	d7,_scdLoop
		move.b	#$01,(g_PlayerMoving).l
		rts


_scrollCamLeft:
		move.w	(g_PlayerSpeed).l,d7
		add.w	d7,(g_HorizontalScrollData).l
		add.w	d7,(g_HorizontalScrollData+2).l
		move.b	#$01,(g_PlayerMoving).l
		rts


; If the player moved this frame, queue the horizontal scroll table
; upload (VRAM $D000) and the VSRAM DMA for the new camera position.
QueueScrollUpdates:
		tst.b	(g_PlayerMoving).l
		beq.s	_qsuDone
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

_qsuDone:
		rts


; For every entity, finds the sprite it is standing on (struct offset
; into SpriteUnderneath, $FFFF = none) and queues contact damage when
; standing directly on something hostile.
FindSpritesUnderneath:
		lea	(Player_X).l,a5
		moveq	#$F,d7

_fsuCheck:
		movem.w	d7,-(sp)
		bsr.w	FindSpriteUnderneath
		movem.w	(sp)+,d7
		bra.s	_fsuStore

_fsuNone:
		move.w	#$FFFF,d0

_fsuStore:
		move.w	d0,SpriteUnderneath(a5)
		bne.s	_fsuNext
		tst.b	InteractFlags(a5)
		bpl.s	_fsuNext
		movea.l	a5,a0
		bsr.w	QueueContactDamage

_fsuNext:
		lea	SPRITE_SIZE(a5),a5
		move.w	(a5),d0
		bmi.s	_fsuDone
		cmpi.b	#$7F,d0
		beq.s	_fsuNone
		tst.w	BehavParam(a5)
		bne.s	_fsuCheck
		btst	#$05,InteractFlags(a5)
		beq.s	_fsuNone
		bra.s	_fsuCheck

_fsuDone:
		rts


; Re-checks each stored SpriteUnderneath after everyone has moved:
; clears it ($FFFF) once the hitboxes no longer overlap, and queues
; contact damage if the player is still on a hostile sprite.
ValidateSpritesUnderneath:
		lea	(Player_X).l,a5
		moveq	#$F,d7

_vsuLoop:
		move.w	(a5),d0
		bmi.s	_vsuDone
		move.w	SpriteUnderneath(a5),d1
		bmi.s	_vsuNext
		cmpi.b	#$7F,d0
		beq.s	_vsuNext
		lea	(Player_X).l,a0
		adda.w	d1,a0
		move.w	Z(a5),d0
		subq.w	#$01,d0
		move.w	HitBoxXStart(a5),d1
		move.w	HitBoxXEnd(a5),d2
		move.w	HitBoxYStart(a5),d3
		move.w	HitBoxYEnd(a5),d4
		cmp.w	HitBoxXEnd(a0),d1
		bhi.s	_vsuClear
		cmp.w	HitBoxXStart(a0),d2
		bcs.s	_vsuClear
		cmp.w	HitBoxYEnd(a0),d3
		bhi.s	_vsuClear
		cmp.w	HitBoxYStart(a0),d4
		bcs.s	_vsuClear
		cmpa.l	#Player_X,a5
		bne.s	_vsuNext
		tst.b	InteractFlags(a0)
		bpl.s	_vsuNext
		bsr.w	QueueContactDamage
		bra.s	_vsuNext

_vsuClear:
		move.w	#$FFFF,SpriteUnderneath(a5)

_vsuNext:
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,_vsuLoop

_vsuDone:
		rts


; Touching sprite a0: latch its attack strength and flag a contact hit
; ($80 = recoil away from facing) for ProcessPlayerDamage.
QueueContactDamage:
		move.w	AttackStrength(a0),(Player_AttackStrength).l
		beq.s	_qcdDone
		move.b	#$80,(g_PlayerPendingHit).l

_qcdDone:
		rts

		modend
