StringFuncsJumpTable	module
; Long-callable thunks into the text, prompt, shop and script code:
; jsr (j_X).l from anywhere lands here and takes a pc-relative jmp
; to the target, so callers don't depend on where the targets sit.

j_LoadUseEquipPrompt:
		jmp	LoadUseEquipPrompt(pc)

j_RunUseEquipPrompt:
		jmp	RunUseEquipPrompt(pc)

j_PrintString:
		jmp	PrintString(pc)

j_RefreshAndClearTextbox:
		jmp	RefreshAndClearTextbox(pc)

j_ReloadTextbox:
		jmp	ReloadTextbox(pc)

j_SetTextboxHInt:
		jmp	SetTextboxHInt(pc)

j_SetUpTextDisplay:
		jmp	SetUpTextDisplay(pc)

j_RunShopWelcome:
		jmp	RunShopWelcome(pc)

j_RunShopFarewell:
		jmp	RunShopFarewell(pc)

j_RunShopItemPickUp:
		jmp	RunShopItemPickUp(pc)

j_RunShopItemPutDown:
		jmp	RunShopItemPutDown(pc)

j_RunShopSteal:
		jmp	RunShopSteal(pc)

j_PlayerTalk:
		jmp	PlayerTalk(pc)

		jmp	ProcessScriptWord(pc)	; Unused thunk

j_ResetTextboxState:
		jmp	ResetTextboxState(pc)

j_LoadUncompressedString:
		jmp	LoadUncompressedString(pc)

j_PrintStringInstantly:
		jmp	PrintStringInstantly(pc)

j_YesNoPrompt:
		jmp	YesNoPrompt(pc)

j_GetItemQtyAndMaxQty:
		jmp	GetItemQtyAndMaxQty(pc)

j_SetItemQuantity:
		jmp	SetItemQuantity(pc)

		jmp	GetItemEquipSlot(pc)	; Unused thunk

		jmp	GetItemBuyPrice(pc)	; Unused thunk

j_GetItemUseStringIdx:
		jmp	GetItemUseStringIdx(pc)

j_RunTextCmd:
		jmp	RunTextCmd(pc)

j_SetUpTextbox:
		jmp	SetUpTextbox(pc)

j_Cosine:
		jmp	Cosine(pc)

j_Sine:
		jmp	Sine(pc)

j_GetRemainingItemAllowedCount:
		jmp	GetRemainingItemAllowedCount(pc)

j_PlayCutsceneScript:
		jmp	PlayCutsceneScript(pc)

j_DrawTextGlyph:
		jmp	DrawTextGlyph(pc)

j_DebugGetAllItems:
		jmp	DebugGetAllItems(pc)

j_GetSaveLocationString:
		jmp	GetSaveLocationString(pc)

j_GetItem:
		jmp	GetItem(pc)

j_CheckAndConsumeItem:
		jmp	CheckAndConsumeItem(pc)

j_GetIslandMapLocation:
		jmp	GetIslandMapLocation(pc)

j_ClearTextbox:
		jmp	ClearTextbox(pc)

		jmp	SpellBook(pc)		; Unused thunk

	if REGION=DE
j_GetItemFoundString:
		jmp GetItemFoundString(pc)
	endif

	modend
