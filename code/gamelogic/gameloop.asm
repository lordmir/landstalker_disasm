MainLoop	module

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

		modend
