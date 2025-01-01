
; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_EnableDisplay:				  ; CODE XREF: DisplayTitle+1D6p
		jmp	(EnableDisplay).l
; End of function j_EnableDisplay

; ---------------------------------------------------------------------------
		jmp	(DisableDisplay).l

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_EnableInterrupts:				  ; CODE XREF: LoadLithographTilemap+Cp
						  ; DisplayTitle+1CAp
		jmp	(EnableInterrupts).l
; End of function j_EnableInterrupts


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_DisableInterrupts:				  ; CODE XREF: LoadLithographTilemapp
		jmp	(DisableInterrupts).l
; End of function j_DisableInterrupts


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_EnableDisplayAndInts:				  ; CODE XREF: DisplaySegaLogo+10p
						  ; DisplayClimaxLogo+66p ...
		jmp	(EnableDisplayAndInts).l
; End of function j_EnableDisplayAndInts


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_DisableDisplayAndInts:			  ; CODE XREF: DisplaySegaLogop
						  ; DisplayTitle:DisplayTitleScreenp ...
		jmp	(DisableDisplayAndInts).l
; End of function j_DisableDisplayAndInts


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_DisableVDPSpriteUpdate:			  ; CODE XREF: DisplayIslandMap+152p
		jmp	(DisableVDPSpriteUpdate).l
; End of function j_DisableVDPSpriteUpdate


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_EnableVDPSpriteUpdate:			  ; CODE XREF: DisplayIslandMap+3Ap
						  ; ROM:0009EC72p
		jmp	(EnableVDPSpriteUpdate).l
; End of function j_EnableVDPSpriteUpdate


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_CopyBasePalleteToActivePalette:		  ; CODE XREF: sub_620A+444p
						  ; sub_12CAE+20p ...
		jmp	(CopyBasePalleteToActivePalette).l
; End of function j_CopyBasePalleteToActivePalette


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_QueueFullPaletteDMA:				  ; CODE XREF: sub_15B88+2Cp
						  ; sub_16602+6Cp ...
		jmp	(QueueFullPaletteDMA).l
; End of function j_QueueFullPaletteDMA


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_FadeFromBlack:				  ; CODE XREF: ROM:0000EEF0p
						  ; FadeFromBlack_0+4p	...
		jmp	(FadeFromBlack).l
; End of function j_FadeFromBlack


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_FadeToBlack:					  ; CODE XREF: ROM:0000EF36p
						  ; ROM:000156FCp ...
		jmp	(FadeToBlack).l
; End of function j_FadeToBlack


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_CopyVDPSpriteTableDMA:			  ; CODE XREF: LoadLithographTilemap+6p
		jmp	(ClearAndRefreshVDPSpriteTableDMA).l
; End of function j_CopyVDPSpriteTableDMA

; ---------------------------------------------------------------------------
		jmp	(ClearScrollPlanes).l

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_ClearVDPSpriteTable:				  ; CODE XREF: DisplayIslandMap+172p
						  ; DisplayIslandMap+1C4p
		jmp	(ClearVDPSpriteTable).l
; End of function j_ClearVDPSpriteTable

; ---------------------------------------------------------------------------
		jmp	(UpdateVDPSpriteTableDMA).l

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_WaitUntilVBlank:				  ; CODE XREF: ROM:0000EFFAp
						  ; LoadPlayerSpecialAnimation:loc_10C2Cp ...
		jmp	(WaitUntilVBlank).l
; End of function j_WaitUntilVBlank


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_Sleep:					  ; CODE XREF: ROM:00008922p
						  ; ROM:00008BFAp ...
		jmp	(Sleep).l		  ; Sleeps for d0 frames
; End of function j_Sleep

; ---------------------------------------------------------------------------
		jmp	(sub_BAA).l
; ---------------------------------------------------------------------------
		jmp	(loc_BE0).l
; ---------------------------------------------------------------------------
		jmp	(sub_BF6).l
; ---------------------------------------------------------------------------
		jmp	(SetVRAMAddressOnVDP).l

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_EnableProcessingOfVRAMCopyQueue:		  ; CODE XREF: ROM:00012742p
						  ; ROM:00012798p ...
		jmp	(EnableVRAMCopyQueueProcessing).l
; End of function j_EnableProcessingOfVRAMCopyQueue

; ---------------------------------------------------------------------------
		jmp	(FlushVRAMCopyQueue).l

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_EnableDMAQueueProcessing:			  ; CODE XREF: ROM:00008914p
						  ; sub_D828+3Cp ...
		jmp	(EnableDMAQueueProcessing).l
; End of function j_EnableDMAQueueProcessing


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_FlushDMACopyQueue:				  ; CODE XREF: sub_620A+43Ep
						  ; sub_620A+44Ap ...
		jmp	(FlushDMACopyQueue).l
; End of function j_FlushDMACopyQueue

; ---------------------------------------------------------------------------
		jmp	(loc_C76).l
; ---------------------------------------------------------------------------
		jmp	(loc_CFC).l
; ---------------------------------------------------------------------------
		jmp	(loc_C7C).l

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_DoDMACopy_1:					  ; CODE XREF: sub_F30E+24p
						  ; sub_F578+4Ap ...
		jmp	(DoDMACopy).l		  ; d0 = DMA Length
; End of function j_DoDMACopy_1			  ; a0 = DMA Source
						  ; a1 = DMA Destination

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_QueueDMAOp:					  ; CODE XREF: sub_2339E+Ep
						  ; DMACopyTextboxTiles+1Cp ...
		jmp	(QueueDMAOp).l		  ; d0 - DMA Length
; End of function j_QueueDMAOp			  ; a0 - DMA Source
						  ; a1 - DMA Copy

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_QueueHScrollDMAUpdate:			  ; CODE XREF: sub_29D52+56p
						  ; sub_29DE6+Cp ...
		jmp	(QueueHScrollDMAUpdate).l
; End of function j_QueueHScrollDMAUpdate


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_FillHScrollData:				  ; CODE XREF: ROM:0000EED2p
						  ; sub_10014+2Ep ...
		jmp	(FillHScrollData).l
; End of function j_FillHScrollData


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_FillHScrollDataOffset1:			  ; CODE XREF: ROM:0000EEDEp
						  ; DisplayIslandMap+166p
		jmp	(FillHScrollDataOffset1).l
; End of function j_FillHScrollDataOffset1


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_QueueVSRAMUpdate:				  ; CODE XREF: sub_159AE+1Ep
						  ; GaiaEffect+5Ap ...
		jmp	(QueueVSRAMUpdate).l
; End of function j_QueueVSRAMUpdate


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_FillVSRAM:					  ; CODE XREF: ROM:0000EEB4p
						  ; ROM:0000EED8p ...
		jmp	(FillVSRAM).l
; End of function j_FillVSRAM


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_FillVSRAMOffset1:				  ; CODE XREF: ROM:0000EEBAp
						  ; ROM:0000EEE4p ...
		jmp	(FillVSRAMOffset1).l
; End of function j_FillVSRAMOffset1


; =============== S U B	R O U T	I N E =======================================

; a0 - compressed graphics source
; a1 - decompressed graphics buffer
; a2 - VDP tile	graphics destination
; Attributes: thunk

j_LoadCompressedGfx:				  ; CODE XREF: LoadGameSelectMenu+1Ep
						  ; LoadGameSelectMenu+32p ...
		jmp	(LoadCompressedGfx).l	  ; a0 - compressed graphics source
; End of function j_LoadCompressedGfx		  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_DecompressAndQueueGfxCopy:			  ; CODE XREF: LoadStatusGfx+62j
						  ; LoadLithographTiles+Ep ...
		jmp	(DecompressAndQueueGfxCopy).l
; End of function j_DecompressAndQueueGfxCopy


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_QueueTextboxTilemapDMA:			  ; CODE XREF: sub_DB14+6p
						  ; SetUpTextbox+4p ...
		jmp	(QueueTextboxTilemapDMA).l
; End of function j_QueueTextboxTilemapDMA


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_MultiplyD3By148:				  ; CODE XREF: sub_19AC8+1Ap
		jmp	(MultiplyD3By148).l
; End of function j_MultiplyD3By148


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_GetVDPReg:					  ; CODE XREF: sub_29D52+Ep
						  ; sub_29D52+18p ...
		jmp	(GetVDPReg).l
; End of function j_GetVDPReg


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_SetVDPReg:					  ; CODE XREF: sub_29D52+2Ep
						  ; sub_29DC4+16p ...
		jmp	(SetVDPReg).l
; End of function j_SetVDPReg


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_OrVDPReg:					  ; CODE XREF: DisplayLithograph+Ep
						  ; DisplayIslandMap+202p
		jmp	(OrVDPReg).l
; End of function j_OrVDPReg


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_MaskVDPReg:					  ; CODE XREF: ROM:00015712p
						  ; DisplayIslandMap+1AEp
		jmp	(MaskVDPReg).l
; End of function j_MaskVDPReg


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_DoDMAFill:					  ; CODE XREF: LoadGameSelectMenu+Ap
						  ; DisplayTitle+F6p ...
		jmp	(DoDMAFill).l		  ; d0 - Fill destination address VDP
; End of function j_DoDMAFill			  ; d1 - Fill length bytes
						  ; d2 - Fill pattern

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_LoadPaletteToRAM:				  ; CODE XREF: LoadSegaLogoPalette+20j
						  ; LoadLithographPalette+4j ...
		jmp	(LoadPaletteToRAM).l
; End of function j_LoadPaletteToRAM


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_CopyPalette:					  ; CODE XREF: DisplayTitle+1F8p
		jmp	(CopyPalette).l
; End of function j_CopyPalette

; ---------------------------------------------------------------------------
		jmp	(WordCopy).l

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_ConvertToBase10:				  ; CODE XREF: GetPlayTimeDigits+12p
						  ; sub_F3A6:loc_F3B6p	...
		jmp	(ConvertToBase10).l
; End of function j_ConvertToBase10


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_UpdateControllerInputs:			  ; CODE XREF: sub_F2E2p
						  ; HandleControlChars:loc_23216p ...
		jmp	(UpdateControllerInputs).l
; End of function j_UpdateControllerInputs

; ---------------------------------------------------------------------------
		jmp	(WaitForButtonPush).l

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_WaitForNextButtonPress:			  ; CODE XREF: sub_3E87C+6p
		jmp	(WaitForNextButtonPress).l
; End of function j_WaitForNextButtonPress

; ---------------------------------------------------------------------------
		jmp	(loc_10F0).l
; ---------------------------------------------------------------------------
		jmp	(Wait1SecondOrUntilButtonPushed).l

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_Wait3SecondsOrUntilButtonPushed:		  ; CODE XREF: DisplayClimaxLogo+72p
		jmp	(Wait3SecondsOrUntilButtonPushed).l
; End of function j_Wait3SecondsOrUntilButtonPushed


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_GenerateRandomNumber:				  ; CODE XREF: ROM:00013406p
						  ; ROM:00014FE0p ...
		jmp	(GenerateRandomNumber).l
; End of function j_GenerateRandomNumber


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_InitFadeFromBlackParams:			  ; CODE XREF: sub_3E890p
		jmp	(InitFadeFromBlackParams).l
; End of function j_InitFadeFromBlackParams


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_InitFadeToBlackParams:			  ; CODE XREF: ROM:00013500p
						  ; sub_3E92C+1Cp
		jmp	(InitFadeToBlackParams).l
; End of function j_InitFadeToBlackParams

; ---------------------------------------------------------------------------
		jmp	(DarkenActivePalette).l

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_DarkenPalette:				  ; CODE XREF: sub_135D0+10p
						  ; sub_3E990+20p
		jmp	(DarkenPalette).l
; End of function j_DarkenPalette


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_380:					  ; CODE XREF: sub_1914C-15ACp
		jmp	(sub_31A6).l
; End of function sub_380


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_386:					  ; CODE XREF: sub_1914C-1472p
		jmp	(sub_31FE).l
; End of function sub_386


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_38C:					  ; CODE XREF: sub_1914C-13BAp
		jmp	(sub_31A0).l
; End of function sub_38C


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_392:					  ; CODE XREF: sub_1914C-1300p
		jmp	(sub_31F8).l
; End of function sub_392


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_398:					  ; CODE XREF: sub_2488A+F6p
		jmp	(sub_D4AE).l
; End of function sub_398


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_39E:					  ; CODE XREF: sub_2488A+BAp
		jmp	(sub_EC34).l
; End of function sub_39E


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_CollisionDetect:				  ; CODE XREF: sub_1914C-157Ap
						  ; sub_1914C-1440p ...
		jmp	(CollisionDetect).l
; End of function j_CollisionDetect


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_3AA:					  ; CODE XREF: sub_191E4+1Ap
		jmp	(sub_3FD4).l
; End of function sub_3AA


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_GetSpeakerSpriteId:				  ; CODE XREF: HandleChurchInterraction+6p
						  ; GetSpeakerSfx+Cp
		jmp	(GetSpeakerSpriteId).l	  ; d0 - current talker	script
; End of function j_GetSpeakerSpriteId		  ; d1 - current talker	sprite ID


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_QueueHUDTilemapDMA:				  ; CODE XREF: sub_15914+34p
						  ; RefreshHUD+Ap
		jmp	(QueuePartialHUDTilemapDMA).l
; End of function j_QueueHUDTilemapDMA


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_3BC:					  ; CODE XREF: ROM:0001576Ep
						  ; OnTick+13C8p ...
		jmp	(sub_3456).l
; End of function sub_3BC

; ---------------------------------------------------------------------------
		jmp	(sub_44C4).l

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_3C8:					  ; CODE XREF: sub_18ADC+6p
		jmp	(sub_3302).l
; End of function sub_3C8


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_SaveGame:					  ; CODE XREF: ROM:00025010p
		jmp	(SaveGame).l
; End of function j_SaveGame


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_CheckForCollision:				  ; CODE XREF: OnTick+12CCp
		jmp	(CheckForCollision).l
; End of function j_CheckForCollision


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_LoadRoom_0:					  ; CODE XREF: LoadPlayerSpecialAnimation+206p
						  ; ROM:000129BCp ...
		jmp	(LoadRoom_0).l
; End of function j_LoadRoom_0


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_3E0:					  ; CODE XREF: ROM:000129C2p
						  ; ROM:000250E4p ...
		jmp	(sub_8E9C).l
; End of function sub_3E0


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_FadeOutToDarkness:				  ; CODE XREF: LoadPlayerSpecialAnimation:loc_10C8Ep
						  ; ROM:0001299Cp ...
		jmp	(FadeOutToDarkness).l
; End of function j_FadeOutToDarkness


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_WarpToRoom:					  ; CODE XREF: ROM:000126D4p
						  ; ROM:00012A0Ap ...
		jmp	(WarpToRoom).l
; End of function j_WarpToRoom


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_CheckForRoomTransition:			  ; CODE XREF: ROM:000126C8p
						  ; ROM:000129FEp ...
		jmp	(CheckForRoomTransition).l
; End of function j_CheckForRoomTransition


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_LoadSprites:					  ; CODE XREF: LoadPlayerSpecialAnimation+18Ep
						  ; ROM:00012736p ...
		jmp	(LoadSprites).l
; End of function j_LoadSprites


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_3FE:					  ; CODE XREF: LoadPlayerSpecialAnimation+188p
						  ; ROM:00012BCAp ...
		jmp	(loc_72E8).l
; End of function sub_3FE


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_404:					  ; CODE XREF: ROM:0001273Cp
						  ; ROM:00012792p ...
		jmp	(sub_249A).l
; End of function sub_404


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_DoTileSwap:					  ; CODE XREF: ROM:000128F6p
						  ; ROM:00012912p ...
		jmp	(DoTileSwap).l
; End of function j_DoTileSwap


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_InitVDP:					  ; CODE XREF: LoadPlayerSpecialAnimation+20Cp
						  ; ROM:00013308p ...
		jmp	(InitVDP).l
; End of function j_InitVDP


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_FadeInFromDarkness:				  ; CODE XREF: LoadPlayerSpecialAnimation+22Aj
						  ; ROM:00013358p ...
		jmp	(FadeInFromDarkness).l
; End of function j_FadeInFromDarkness


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_CheckForDoorNW:				  ; CODE XREF: ROM:00012B34p
						  ; ROM:00012B58p ...
		jmp	(CheckForDoorNW).l
; End of function j_CheckForDoorNW

; ---------------------------------------------------------------------------
		jmp	(sub_D9FC).l

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_428:					  ; CODE XREF: ROM:0001310Ep
						  ; ROM:00014F7Cp
		jmp	(LoadPlayerPalette).l
; End of function sub_428


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_42E:					  ; CODE XREF: ROM:000135B2p
						  ; LoadRoom_1+20j ...
		jmp	(loc_6212).l
; End of function sub_42E


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_434:					  ; CODE XREF: ROM:000132FAp
						  ; ROM:00013C8Ep ...
		jmp	(sub_A0C2).l
; End of function sub_434


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_TransitionToNewRoom:				  ; CODE XREF: ROM:000136F8p
		jmp	(TransitionToNewRoom).l
; End of function j_TransitionToNewRoom


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_GetOriginalRoomNum:				  ; CODE XREF: LookupChestContents+6p
		jmp	(GetOriginalRoomNum).l
; End of function j_GetOriginalRoomNum


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_RestoreBGM:					  ; CODE XREF: ROM:00014FD6j
						  ; ROM:00024B30p ...
		jmp	RestoreBGM(pc)
; End of function j_RestoreBGM

; ---------------------------------------------------------------------------
		nop

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_44C:					  ; CODE XREF: ROM:00013C80p
		jmp	(WarpPadFx).l
; End of function sub_44C

; ---------------------------------------------------------------------------
		jmp	(QueueInventoryWinTilemapDMA).l
; ---------------------------------------------------------------------------
		jmp	(QueueInventoryScrBTilemapDMA).l

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_DoVisualEffect:				  ; CODE XREF: sub_620A+438p
						  ; ROM:0001494Cp ...
		jmp	(DoVisualEffect).l	  ; 0,1	- Warp-pad transition
; End of function j_DoVisualEffect		  ; 2,3	- Tree warp transition
						  ; 4 -	Black flash
						  ; 5 -	White flash
						  ; 6 -	Red flash
						  ; 7 -	Nole warp
						  ;

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_LoadMagicSwordGfx:				  ; CODE XREF: sub_159DE+8p
						  ; GaiaEffect+12p ...
		jmp	(LoadMagicSwordGfx).l
; End of function j_LoadMagicSwordGfx


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_UpdateEquipPal:				  ; CODE XREF: ROM:00015514p
						  ; sub_159DE+Ep ...
		jmp	(UpdateEquipPal).l
; End of function j_UpdateEquipPal

; ---------------------------------------------------------------------------
		jmp	WaitUntilZ80Ready(pc)
; ---------------------------------------------------------------------------
		nop

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_FadeFromWhite:				  ; CODE XREF: SpecialWarp+1Ej
						  ; ROM:000155E2p
		jmp	(FadeFromWhite).l
; End of function j_FadeFromWhite


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_FadeToWhite:					  ; CODE XREF: SpecialWarp+4p
		jmp	(FadeToWhite).l
; End of function j_FadeToWhite


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_EkeEkeHealthRecover:				  ; CODE XREF: LoadPlayerSpecialAnimation+198p
		jmp	(EkeEkeHealthRecover).l
; End of function j_EkeEkeHealthRecover


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_LoadMagicSwordEffect:				  ; CODE XREF: ROM:00014468p
						  ; ROM:000144C8p ...
		jmp	(LoadMagicSwordEffect).l
; End of function j_LoadMagicSwordEffect


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_LoadInitialPlayerPalette:			  ; CODE XREF: DisplayIslandMap+18Ep
		jmp	(LoadInitialPlayerPalette).l
; End of function j_LoadInitialPlayerPalette


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_LoadRoom:					  ; CODE XREF: ROM:000250DEp
		jmp	(LoadRoom).l
; End of function j_LoadRoom


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_SetLifestockSoldFlag:				  ; CODE XREF: GetItem+24p
		jmp	(SetLifestockSoldFlag).l
; End of function j_SetLifestockSoldFlag


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_CheckIfLifestockSold:				  ; CODE XREF: InitialiseSprites+11Ap
		jmp	(CheckIfLifestockSold).l
; End of function j_CheckIfLifestockSold


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_StartGame:					  ; CODE XREF: ROM:00014D6Ep
		jmp	(StartGame).l
; End of function j_StartGame

; ---------------------------------------------------------------------------

j_EndGame:					  ; CODE XREF: ROM:0001571Ej
						  ; ROM:00025034j
		jmp	EndGame(pc)
; ---------------------------------------------------------------------------
		nop

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_QueueFullHUDTilemapDMA:			  ; CODE XREF: ROM:0001559Cp
		jmp	(QueueFullHUDTilemapDMA).l
; End of function j_QueueFullHUDTilemapDMA

