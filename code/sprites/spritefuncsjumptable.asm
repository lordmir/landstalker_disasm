
; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_10300:					  ; DATA XREF: GameLoop+3Ct
		jmp	sub_178C8(pc)
; End of function sub_10300

; ---------------------------------------------------------------------------
		jmp	sub_17B50(pc)
; ---------------------------------------------------------------------------
		dc.l $00000000
		dc.l $00000000

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_UpdateFrames:					  ; DATA XREF: GameLoop+5Et
		jmp	UpdateFrames(pc)
; End of function j_UpdateFrames


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_UpdateSpriteFrame:				  ; DATA XREF: sub_7274+Et
		jmp	UpdateSpriteFrame(pc)
; End of function j_UpdateSpriteFrame


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_PlaybackInput:				  ; DATA XREF: sub_604C+E8t
						  ; sub_604C+128t ...
		jmp	PlaybackInput(pc)
; End of function j_PlaybackInput

; ---------------------------------------------------------------------------
		dc.l $00000000

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_ProcessDialogueScriptAction:			  ; DATA XREF: sub_700A+8t
		jmp	ProcessDialogueScriptAction(pc)
; End of function j_ProcessDialogueScriptAction


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_GetGold:					  ; DATA XREF: ROM:000273C8t
		jmp	GetGold(pc)
; End of function j_GetGold


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_AddGold:					  ; DATA XREF: CheckOpenChest+A4t
						  ; ROM:000088FCt ...
		jmp	AddGold(pc)
; End of function j_AddGold


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_RemoveGold:					  ; DATA XREF: HandleShopInterraction+22t
						  ; ROM:00024F8At ...
		jmp	RemoveGold(pc)
; End of function j_RemoveGold


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_IncrementSwordCharge:				  ; DATA XREF: UpdateSwordCharge+8t
		jmp	IncrementSwordCharge(pc)
; End of function j_IncrementSwordCharge


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_DecreaseSwordCharge:				  ; DATA XREF: ProcessActionButton+8At
		jmp	DecreaseSwordCharge(pc)
; End of function j_DecreaseSwordCharge


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_AddHealth:					  ; DATA XREF: sub_620A+45At
						  ; CheckOpenChest+138t ...
		jmp	AddHealth(pc)
; End of function j_AddHealth


; =============== S U B	R O U T	I N E =======================================


j_RemoveHealth:					  ; DATA XREF: j_j_RemoveHealtht
		jmp	RemoveHealth(pc)
; End of function j_RemoveHealth


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_RefreshHUD:					  ; DATA XREF: GameLoop+88t
						  ; sub_295E+30t ...
		jmp	RefreshHUD(pc)
; End of function j_RefreshHUD


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_RefreshAllHUD:				  ; DATA XREF: ROM:00008DE4t
		jmp	RefreshAllHUD(pc)
; End of function j_RefreshAllHUD


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_10348:					  ; DATA XREF: GameLoop+28t
		jmp	loc_15C1C(pc)
; End of function sub_10348


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_1034C:					  ; DATA XREF: GameLoop+54t
		jmp	sub_16420(pc)
; End of function sub_1034C


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_10350:					  ; DATA XREF: GameLoop+64t
		jmp	sub_10ACE(pc)
; End of function sub_10350


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_LoadStatusGfx:				  ; DATA XREF: sub_4374+7Ct
		jmp	LoadStatusGfx(pc)
; End of function j_LoadStatusGfx


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_10358:					  ; DATA XREF: GameLoop+2Et
		jmp	sub_16220(pc)
; End of function sub_10358

; ---------------------------------------------------------------------------
		dcb.l 3,$00000000

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_UpdateEkeEkeHUD:				  ; DATA XREF: CheckOpenChest+110t
						  ; ROM:000086E0t ...
		jmp	UpdateEkeEkeHUD(pc)
; End of function j_UpdateEkeEkeHUD


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_MarkHUDForUpdate:				  ; DATA XREF: sub_295E+2At
						  ; sub_620A+460t ...
		jmp	MarkHUDForUpdate(pc)
; End of function j_MarkHUDForUpdate


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_AddToMaxHealth:				  ; DATA XREF: CheckOpenChest+12Et
						  ; GetItem+14t
		jmp	AddToMaxHealth(pc)
; End of function j_AddToMaxHealth

; ---------------------------------------------------------------------------
		jmp	RefreshMaxHealthHUD(pc)

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_ClearPlayerStatus:				  ; DATA XREF: ROM:0000872Ct
						  ; ROM:00008798t ...
		jmp	ClearPlayerStatus(pc)
; End of function j_ClearPlayerStatus


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_GetPlayerStatus:				  ; DATA XREF: ROM:ItemUseDetoxGrasst
						  ; ROM:ItemUseMindRepairt ...
		jmp	GetPlayerStatus(pc)
; End of function j_GetPlayerStatus


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_10380:					  ; DATA XREF: GameLoop+76t
		jmp	sub_16602(pc)
; End of function sub_10380


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_10384:					  ; DATA XREF: GameLoop+A2t
		jmp	sub_166E8(pc)
; End of function sub_10384


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_10388:					  ; DATA XREF: LoadRoom_0+3At
		jmp	(sub_19514).l
; End of function sub_10388


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_1038E:					  ; DATA XREF: LoadRoom_0+2Et
						  ; ROM:00015768t ...
		jmp	(sub_19AC8).l
; End of function sub_1038E

; ---------------------------------------------------------------------------

j_PlayerDeath:					  ; DATA XREF: ROM:loc_1A8AECt
		jmp	PlayerDeath(pc)

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_AddStatusEffect:				  ; DATA XREF: ROM:000089A0t
						  ; j_j_AddStatusEffectt
		jmp	AddStatusEffect(pc)
; End of function j_AddStatusEffect


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_OnTick:					  ; DATA XREF: j_j_OnTickt
		jmp	OnTick(pc)
; End of function j_OnTick


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_LookupSpriteAnimFlags:			  ; DATA XREF: sub_1A83E6+3AEt
		jmp	LookupSpriteAnimFlags(pc)
; End of function j_LookupSpriteAnimFlags


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_UnlockDoor:					  ; DATA XREF: ROM:loc_8CEEt
		jmp	(UnlockDoor).l
; End of function j_UnlockDoor


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_RefreshCurrentHealthHUD:			  ; DATA XREF: sub_295E+24t
						  ; ROM:00008902t ...
		jmp	RefreshCurrentHealthHUD(pc)
; End of function j_RefreshCurrentHealthHUD


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_RefreshSwordChargeHUD:			  ; DATA XREF: sub_7718+16t
		jmp	RefreshSwordChargeHUD(pc)
; End of function j_RefreshSwordChargeHUD


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_103B2:					  ; DATA XREF: ROM:001A956Ct
						  ; sub_1AC474+4t ...
		jmp	(sub_19288).l
; End of function sub_103B2


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_103B8:					  ; DATA XREF: ROM:001A95CEt
						  ; sub_1AC474+6Ct ...
		jmp	(sub_192B6).l
; End of function sub_103B8


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_CheckUnlockDoor:				  ; DATA XREF: ROM:loc_8B2At
		jmp	(CheckUnlockDoor).l
; End of function j_CheckUnlockDoor


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_103C4:					  ; DATA XREF: ROM:loc_8758t
		jmp	sub_16076(pc)
; End of function sub_103C4


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_GetMaxHealth:					  ; DATA XREF: EkeEkeHealthRecover+6t
		jmp	GetMaxHealth(pc)
; End of function j_GetMaxHealth


; =============== S U B	R O U T	I N E =======================================


j_SetSpriteRotationAnimFlags:			  ; DATA XREF: ROM:001ABF80t
						  ; ROM:001AC062t
		jmp	(SetSpriteRotationAnimFlags).l
; End of function j_SetSpriteRotationAnimFlags


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_103D2:					  ; DATA XREF: sub_223At
		jmp	(sub_191E4).l
; End of function sub_103D2


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_103D8:					  ; DATA XREF: GameLoop+4Et
		jmp	(sub_190D4).l
; End of function sub_103D8

