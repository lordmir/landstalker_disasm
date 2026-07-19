SpriteFuncsJmps	module
; Long-jump thunks for the sprite/player systems. Unlabeled jmp
; lines and dc.l 0 slots are unused leftovers.

j_UpdateEntities:
		jmp	UpdateEntities(pc)

		jmp	MoveSpriteForward(pc)

		dc.l $00000000
		dc.l $00000000

j_UpdateFrames:
		jmp	UpdateFrames(pc)

j_UpdateSpriteFrame:
		jmp	UpdateSpriteFrame(pc)

j_PlaybackInput:
		jmp	PlaybackInput(pc)

		dc.l $00000000

j_ProcessDialogueScriptAction:
		jmp	ProcessDialogueScriptAction(pc)

j_GetGold:
		jmp	GetGold(pc)

j_AddGold:
		jmp	AddGold(pc)

j_RemoveGold:
		jmp	RemoveGold(pc)

j_IncrementSwordCharge:
		jmp	IncrementSwordCharge(pc)

j_DecreaseSwordCharge:
		jmp	DecreaseSwordCharge(pc)

j_AddHealth:
		jmp	AddHealth(pc)

j_RemoveHealth:
		jmp	RemoveHealth(pc)

j_RefreshHUD:
		jmp	RefreshHUD(pc)

j_RefreshAllHUD:
		jmp	RefreshAllHUD(pc)

j_HandleAttack:
		jmp	HandleAttack(pc)

j_ProcessPlayerDamage:
		jmp	ProcessPlayerDamage(pc)

j_LoadPlayerSpecialAnimation:
		jmp	LoadPlayerSpecialAnimation(pc)

j_LoadStatusGfx:
		jmp	LoadStatusGfx(pc)

j_ProcessDeadEnemies:
		jmp	ProcessDeadEnemies(pc)

		dcb.l 3,$00000000

j_UpdateEkeEkeHUD:
		jmp	UpdateEkeEkeHUD(pc)

j_MarkHUDForUpdate:
		jmp	MarkHUDForUpdate(pc)

j_AddToMaxHealth:
		jmp	AddToMaxHealth(pc)

		jmp	RefreshMaxHealthHUD(pc)

j_ClearPlayerStatus:
		jmp	ClearPlayerStatus(pc)

j_GetPlayerStatus:
		jmp	GetPlayerStatus(pc)

j_UpdatePlayerStatusEffects:
		jmp	UpdatePlayerStatusEffects(pc)

j_RestorePalette0:
		jmp	RestorePalette0(pc)

j_InitSprites:
		jmp	(InitSprites).l

j_CalcSpriteHitbox:
		jmp	(CalcSpriteHitbox).l

j_PlayerDeath:
		jmp	PlayerDeath(pc)

j_AddStatusEffect:
		jmp	AddStatusEffect(pc)

j_OnTick:
		jmp	OnTick(pc)

j_LookupSpriteAnimFlags:
		jmp	LookupSpriteAnimFlags(pc)

j_UnlockDoor:
		jmp	(UnlockDoor).l

j_RefreshCurrentHealthHUD:
		jmp	RefreshCurrentHealthHUD(pc)

j_RefreshSwordChargeHUD:
		jmp	RefreshSwordChargeHUD(pc)

j_FindFreeSpriteSlot:
		jmp	(FindFreeSpriteSlot).l

j_InitSpawnedSprite:
		jmp	(InitSpawnedSprite).l

j_CheckUnlockDoor:
		jmp	(CheckUnlockDoor).l

j_AnyHostileEnemies:
		jmp	AnyHostileEnemies(pc)

j_GetMaxHealth:
		jmp	GetMaxHealth(pc)

j_SetSpriteRotationAnimFlags:
		jmp	(SetSpriteRotationAnimFlags).l

j_ProcessSpriteJump:
		jmp	(ProcessSpriteJump).l

j_MoveSpritesWithPlatforms:
		jmp	(MoveSpritesWithPlatforms).l

		modend
