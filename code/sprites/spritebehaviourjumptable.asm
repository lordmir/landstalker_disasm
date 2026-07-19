BehaviourCmds	module
; Per-tick behaviour-script dispatch, run for every active entity
; (UpdateEntities) including the player. The EB_* handlers live in
; spritebehaviours.asm; a BehavParam:BehavCmd word of 0 means no
; behaviour.

OnTick:
		bsr.w	DespawnSpriteInPit
		bsr.w	UpdateCarriedSpritePos

ProcessNextCmd:
		move.w	BehavParam(a5),d0
		beq.w	EB_NULL
		andi.w	#$00FF,d0
		lsl.w	#$02,d0
		jmp	_cmdTable(pc,d0.w)

_cmdTable:
		bra.w	EB_Pause			; $00
		bra.w	EB_MoveTimed			; $01
		bra.w	EB_TurnCW			; $02
		bra.w	EB_TurnCCW			; $03
		bra.w	EB_TurnNE			; $04
		bra.w	EB_TurnSE			; $05
		bra.w	EB_TurnSW			; $06
		bra.w	EB_TurnNW			; $07
		bra.w	EB_SetDirCW			; $08
		bra.w	EB_SetDirCCW			; $09
		bra.w	EB_SetDirNE			; $0A
		bra.w	EB_SetDirSE			; $0B
		bra.w	EB_SetDirSW			; $0C
		bra.w	EB_SetDirNW			; $0D
		bra.w	EB_MakeVisible			; $0E
		bra.w	EB_MakeInvisible		; $0F
		bra.w	EB_ThrownObject			; $10
		bra.w	EB_MoveRelative			; $11
		bra.w	EB_GoToInstruction		; $12
		bra.w	EB_MoveUntilCollision		; $13
		bra.w	EB_TurnRandom			; $14
		bra.w	EB_SetDirRandom			; $15
		bra.w	EB_PutDownObject		; $16
		bra.w	EB_TurnRandomImmediate		; $17
		bra.w	EB_TurnCWImmediate		; $18
		bra.w	EB_TurnCCWImmediate		; $19
		bra.w	EB_TurnNEImmediate		; $1A
		bra.w	EB_TurnSEImmediate		; $1B
		bra.w	EB_TurnSWImmediate		; $1C
		bra.w	EB_TurnNWImmediate		; $1D
		bra.w	EB_Freeze			; $1E
		bra.w	EB_SetSpeed1			; $1F
		bra.w	EB_SetSpeed2			; $20
		bra.w	EB_SetSpeed3			; $21
		bra.w	EB_SetSpeed4			; $22
		bra.w	EB_Turn180			; $23
		bra.w	EB_SetDir180			; $24
		bra.w	EB_Turn180Immediate		; $25
		bra.w	EB_FollowPlayerWithJump		; $26
		bra.w	EB_Jump				; $27
		bra.w	EB_EnableRotation		; $28
		bra.w	EB_DisableRotation		; $29
		bra.w	EB_MoveRandomTime		; $2A
		bra.w	EB_RunSpecialAI			; $2B
		bra.w	EB_FollowPlayerNoJump		; $2C
		bra.w	EB_Loot				; $2D
		bra.w	EB_ShopItem			; $2E
		bra.w	EB_ThrownObject			; $2F
		bra.w	EB_MoveUpRelative		; $30
		bra.w	EB_MoveDownRelative		; $31
		bra.w	EB_PutDownObject		; $32
		bra.w	EB_FleePlayer			; $33
		bra.w	EB_PlaybackInput		; $34
		bra.w	EB_ResetPlayback		; $35
		bra.w	EB_WaitForCondition		; $36
		bra.w	EB_Pause4s			; $37
		bra.w	EB_EnableGravity		; $38
		bra.w	EB_DisableGravity		; $39
		bra.w	EB_MoveUpTimed			; $3A
		bra.w	EB_MoveDownTimed		; $3B
		bra.w	EB_MoveUpAbsolute		; $3C
		bra.w	EB_MoveDownAbsolute		; $3D
		bra.w	EB_DespawnEntity			; $3E
		bra.w	EB_NudgeUp			; $3F
		bra.w	EB_MoveDownUntilCollision	; $40
		bra.w	EB_SetFlag			; $41
		bra.w	EB_WaitForFlagSet		; $42
		bra.w	EB_ClearFlag			; $43
		bra.w	EB_Hide				; $44
		bra.w	EB_ShowWhenCollisionClear	; $45
		bra.w	EB_WaitForFlagClear		; $46
		bra.w	EB_WaitSpriteNotHostile		; $47
		bra.w	EB_SetEntitySpeed		; $48
		bra.w	EB_ActivateSwitch		; $49
		bra.w	EB_ResetSwitch			; $4A
		bra.w	EB_MoveToXYPosImmediate		; $4B
		bra.w	EB_MoveToZPosImmediate		; $4C
		bra.w	EB_ResetToInitParams		; $4D
		bra.w	EB_StartLoCutscene		; $4E
		bra.w	EB_MoveNoClip			; $4F
		bra.w	EB_RotatePlayer			; $50
		bra.w	EB_MakeHostile			; $51
		bra.w	EB_MakeNonHostile		; $52
		bra.w	EB_DisableWalkBackwards		; $53
		bra.w	EB_EnableWalkBackwards		; $54
		bra.w	EB_SpecialAnimation		; $55
		bra.w	EB_MoveUpToInitPos		; $56
		bra.w	EB_TriggerTileSwap		; $57
		bra.w	EB_UpdateSpriteFacing		; $58
		bra.w	EB_PrintText			; $59
		bra.w	EB_ProjectileHitEnemies		; $5A
		bra.w	EB_SetTargetPosition		; $5B
		bra.w	EB_MoveToTargetPosition		; $5C
		bra.w	EB_RepeatBegin			; $5D
		bra.w	EB_RepeatEnd			; $5E
		bra.w	EB_DecayFlash			; $5F
		bra.w	EB_FlashSpinAppear		; $60
		bra.w	EB_FlashSpinDisappear		; $61
		bra.w	EB_PlaySound			; $62
		bra.w	EB_ProjectileMove		; $63
		bra.w	EB_StartHiCutscene		; $64
		bra.w	EB_ProjectileWeaveCW		; $65
		bra.w	EB_ProjectileWeaveCCW		; $66
		bra.w	EB_ProjectileFall		; $67

		modend
