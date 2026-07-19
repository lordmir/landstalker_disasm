SystemJmps	module
; Long-jump thunks into the system code, used by callers too far away
; for a bsr/bra. Unlabeled jmp lines (and stray nops) are leftover
; thunks nothing references.

j_EnableDisplay:
		jmp	(EnableDisplay).l

		jmp	(DisableDisplay).l

j_EnableInterrupts:
		jmp	(EnableInterrupts).l

j_DisableInterrupts:
		jmp	(DisableInterrupts).l

j_EnableDisplayAndInts:
		jmp	(EnableDisplayAndInts).l

j_DisableDisplayAndInts:
		jmp	(DisableDisplayAndInts).l

j_DisableVDPSpriteUpdate:
		jmp	(DisableVDPSpriteUpdate).l

j_EnableVDPSpriteUpdate:
		jmp	(EnableVDPSpriteUpdate).l

j_CopyBasePaletteToActivePalette:
		jmp	(CopyBasePaletteToActivePalette).l

j_QueueFullPaletteDMA:
		jmp	(QueueFullPaletteDMA).l

j_FadeFromBlack:
		jmp	(FadeFromBlack).l

j_FadeToBlack:
		jmp	(FadeToBlack).l

j_ClearAndRefreshVDPSpriteTableDMA:
		jmp	(ClearAndRefreshVDPSpriteTableDMA).l

		jmp	(ClearScrollPlanes).l

j_ClearVDPSpriteTable:
		jmp	(ClearVDPSpriteTable).l

		jmp	(UpdateVDPSpriteTableDMA).l

j_WaitUntilVBlank:
		jmp	(WaitUntilVBlank).l

j_Sleep:
		jmp	(Sleep).l		  ; Sleeps for d0 frames

		jmp	(WritePlaneACell).l

		jmp	(WritePlaneBCell).l

		jmp	(CalcPlaneCellAddrs).l

		jmp	(SetVRAMAddressOnVDP).l

j_EnableVRAMCopyQueueProcessing:
		jmp	(EnableVRAMCopyQueueProcessing).l

		jmp	(FlushVRAMCopyQueue).l

j_EnableDMAQueueProcessing:
		jmp	(EnableDMAQueueProcessing).l

j_FlushDMACopyQueue:
		jmp	(FlushDMACopyQueue).l

		jmp	(CopyBufferToPlaneA).l

		jmp	(CopyToPlaneB).l

		jmp	(CopyToPlaneA).l

; d0 = DMA Length, a0 = DMA Source, a1 = DMA Destination
j_DoDMACopy:
		jmp	(DoDMACopy).l

; d0 = DMA Length, a0 = DMA Source, a1 = DMA Destination
j_QueueDMAOp:
		jmp	(QueueDMAOp).l

j_QueueHScrollDMAUpdate:
		jmp	(QueueHScrollDMAUpdate).l

j_FillHScrollData:
		jmp	(FillHScrollData).l

j_FillHScrollDataOffset1:
		jmp	(FillHScrollDataOffset1).l

j_QueueVSRAMUpdate:
		jmp	(QueueVSRAMUpdate).l

j_FillVSRAM:
		jmp	(FillVSRAM).l

j_FillVSRAMOffset1:
		jmp	(FillVSRAMOffset1).l

; a0 - compressed graphics source
; a1 - decompressed graphics buffer
; a2 - VDP tile	graphics destination
j_LoadCompressedGfx:
		jmp	(LoadCompressedGfx).l

j_DecompressAndQueueGfxCopy:
		jmp	(DecompressAndQueueGfxCopy).l

j_QueueTextboxTilemapDMA:
		jmp	(QueueTextboxTilemapDMA).l

j_MultiplyD3By148:
		jmp	(MultiplyD3By148).l

j_GetVDPReg:
		jmp	(GetVDPReg).l

j_SetVDPReg:
		jmp	(SetVDPReg).l

j_OrVDPReg:
		jmp	(OrVDPReg).l

j_MaskVDPReg:
		jmp	(MaskVDPReg).l

; d0 - Fill destination	address	VDP, d1	- Fill length bytes,
; d2 - Fill pattern
j_DoDMAFill:
		jmp	(DoDMAFill).l

j_LoadPaletteToRAM:
		jmp	(LoadPaletteToRAM).l

j_CopyPalette:
		jmp	(CopyPalette).l

		jmp	(WordCopy).l

j_ConvertToBase10:
		jmp	(ConvertToBase10).l

j_UpdateControllerInputs:
		jmp	(UpdateControllerInputs).l

		jmp	(WaitForButtonPush).l

j_WaitForNextButtonPress:
		jmp	(WaitForNextButtonPress).l

		jmp	(UpdateControllerInputsMasked).l

		jmp	(Wait1SecondOrUntilButtonPushed).l

j_Wait3SecondsOrUntilButtonPushed:
		jmp	(Wait3SecondsOrUntilButtonPushed).l

j_GenerateRandomNumber:
		jmp	(GenerateRandomNumber).l

j_InitFadeFromBlackParams:
		jmp	(InitFadeFromBlackParams).l

j_InitFadeToBlackParams:
		jmp	(InitFadeToBlackParams).l

		jmp	(DarkenActivePalette).l

j_DarkenPalette:
		jmp	(DarkenPalette).l

j_CheckSpriteWallNE:
		jmp	(CheckSpriteWallNE).l

j_CheckSpriteWallSE:
		jmp	(CheckSpriteWallSE).l

j_CheckSpriteWallSW:
		jmp	(CheckSpriteWallSW).l

j_CheckSpriteWallNW:
		jmp	(CheckSpriteWallNW).l

j_ClearInventoryWindow:
		jmp	(ClearInventoryWindow).l

j_DrawEquipInventory:
		jmp	(DrawEquipInventory).l

j_CollisionDetect:
		jmp	(CollisionDetect).l

j_HandleJumpRise:
		jmp	(HandleJumpRise).l

; d0 - current talker script, d1 - current talker sprite ID
j_GetSpeakerSpriteId:
		jmp	(GetSpeakerSpriteId).l

j_QueuePartialHUDTilemapDMA:
		jmp	(QueuePartialHUDTilemapDMA).l

j_ValidateSpritePosition:
		jmp	(ValidateSpritePosition).l

		jmp	(UpdateSpritePriority).l

j_GetHighestFloorUnder:
		jmp	(GetHighestFloorUnder).l

j_SaveGame:
		jmp	(SaveGame).l

j_CheckForCollision:
		jmp	(CheckForCollision).l

j_LoadRoom_0:
		jmp	(LoadRoom_0).l

j_InitRoomDisplayAndFadeIn:
		jmp	(InitRoomDisplayAndFadeIn).l

j_FadeOutToDarkness:
		jmp	(FadeOutToDarkness).l

j_WarpToRoom:
		jmp	(WarpToRoom).l

j_CheckForRoomTransition:
		jmp	(CheckForRoomTransition).l

j_LoadSprites:
		jmp	(LoadSprites).l

j_SetPlayerIdlePose:
		jmp	(SetPlayerIdlePose).l

j_QueueScrollUpdates:
		jmp	(QueueScrollUpdates).l

j_DoTileSwap:
		jmp	(DoTileSwap).l

j_InitRoomDisplay:
		jmp	(InitRoomDisplay).l

j_FadeInFromDarkness:
		jmp	(FadeInFromDarkness).l

j_CheckForDoorNW:
		jmp	(CheckForDoorNW).l

		jmp	(sub_D9FC).l

j_LoadPlayerPalette:
		jmp	(LoadPlayerPalette).l

j_WarpToRoomNoFade:
		jmp	(WarpToRoomNoFade).l

j_LookupWarpDestination:
		jmp	(LookupWarpDestination).l

j_TransitionToNewRoom:
		jmp	(TransitionToNewRoom).l

j_GetOriginalRoomNum:
		jmp	(GetOriginalRoomNum).l

j_RestoreBGM:
		jmp	RestoreBGM(pc)

		nop

j_WarpPadFx:
		jmp	(WarpPadFx).l

		jmp	(QueueInventoryWinTilemapDMA).l

		jmp	(QueueInventoryScrBTilemapDMA).l

; 0,1 -	Warp-pad transition, 2,3 - Tree	warp transition,
; 4 - Black flash, 5 - White flash, 6 -	Red flash, 7 - Nole warp
j_DoVisualEffect:
		jmp	(DoVisualEffect).l

j_LoadMagicSwordGfx:
		jmp	(LoadMagicSwordGfx).l

j_UpdateEquipPal:
		jmp	(UpdateEquipPal).l

		jmp	WaitUntilZ80Ready(pc)

		nop

j_FadeFromWhite:
		jmp	(FadeFromWhite).l

j_FadeToWhite:
		jmp	(FadeToWhite).l

j_EkeEkeHealthRecover:
		jmp	(EkeEkeHealthRecover).l

j_LoadMagicSwordEffect:
		jmp	(LoadMagicSwordEffect).l

j_LoadInitialPlayerPalette:
		jmp	(LoadInitialPlayerPalette).l

j_LoadRoom:
		jmp	(LoadRoom).l

j_SetLifestockSoldFlag:
		jmp	(SetLifestockSoldFlag).l

j_CheckIfLifestockSold:
		jmp	(CheckIfLifestockSold).l

j_StartGame:
		jmp	(StartGame).l

j_EndGame:
		jmp	EndGame(pc)

		nop

j_QueueFullHUDTilemapDMA:
		jmp	(QueueFullHUDTilemapDMA).l

		modend
