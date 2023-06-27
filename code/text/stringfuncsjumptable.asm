
						  ; In game character set:
						  ; _0123456789ABCDE
						  ; FGHIJKLMNOPQRSTU
						  ; VWXYZabcdefghijk
						  ; lmnopqrstuvwxyz*
						  ; .,?!/<>:-'"%#&()
						  ; ={UL}{UR}{DR}{DL}

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_22E88:					  ; DATA XREF: CheckForMenuOpen+8Ct
		jmp	sub_2482C(pc)
; End of function sub_22E88


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_22E8C:					  ; DATA XREF: CheckForMenuOpen+96t
		jmp	sub_2488A(pc)
; End of function sub_22E8C


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_PrintString:					  ; CODE XREF: DisplayText+6p
						  ; DATA XREF: sub_7052+B8t ...
		jmp	PrintString(pc)
; End of function j_PrintString


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_RefreshAndClearTextbox:			  ; CODE XREF: LoadTextboxGraphics+Ep
						  ; DATA XREF: CheckForMenuOpen+44t ...
		jmp	RefreshAndClearTextbox(pc)
; End of function j_RefreshAndClearTextbox


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_ClearTextbox:					  ; CODE XREF: OpenTextbox+4p
						  ; DATA XREF: sub_178FE:loc_18E56t
		jmp	ClearTextbox(pc)
; End of function j_ClearTextbox


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_SetTextboxHInt:				  ; CODE XREF: LoadTextboxGraphics+1Ep
		jmp	SetTextboxHInt(pc)
; End of function j_SetTextboxHInt


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_SetUpTextDisplay:				  ; CODE XREF: ClearTextbox_0+Ep
						  ; DATA XREF: LoadGameSelectScreen+Et	...
		jmp	SetUpTextDisplay(pc)
; End of function j_SetUpTextDisplay


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_22EA4:					  ; DATA XREF: sub_9BD0+24t
						  ; ROM:CSA_00F0t
		jmp	sub_24A3C(pc)
; End of function sub_22EA4


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_22EA8:					  ; DATA XREF: sub_620A+4Ct
						  ; sub_9BFE:loc_9C3At	...
		jmp	sub_24A4C(pc)
; End of function sub_22EA8


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_22EAC:					  ; DATA XREF: sub_178FE+FEEt
		jmp	sub_24A5C(pc)
; End of function sub_22EAC


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_22EB0:					  ; DATA XREF: sub_178FE+105At
		jmp	sub_24A78(pc)
; End of function sub_22EB0


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_22EB4:					  ; DATA XREF: sub_9BFE+34t
						  ; ROM:000145BCt
		jmp	sub_24A88(pc)
; End of function sub_22EB4


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_22EB8:					  ; DATA XREF: sub_6E20+120t
						  ; sub_6E20+1CCt ...
		jmp	PlayerTalk(pc)
; End of function sub_22EB8

; ---------------------------------------------------------------------------
		jmp	ProcessScriptWord(pc)

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_22EC0:					  ; DATA XREF: sub_26E8+2t
		jmp	sub_24A34(pc)
; End of function sub_22EC0


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_LoadUncompressedString:			  ; DATA XREF: sub_D5E4+6t
						  ; j_j_LoadUncompressedStringt
		jmp	LoadUncompressedString(pc)
; End of function j_LoadUncompressedString


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_22EC8:					  ; DATA XREF: sub_178FE+156Ct
						  ; YesNoPrompt+10t ...
		jmp	sub_22F1C(pc)
; End of function sub_22EC8


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_YesNoPrompt:					  ; CODE XREF: GetYesNoAnswer+Ap
		jmp	YesNoPrompt(pc)
; End of function j_YesNoPrompt


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_GetItemQtyAndMaxQty:				  ; DATA XREF: sub_620A+492t
						  ; sub_7052:loc_711Et	...
		jmp	GetItemQtyAndMaxQty(pc)
; End of function j_GetItemQtyAndMaxQty


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_22ED4:					  ; DATA XREF: ROM:000089D2t
						  ; ROM:00008D1At ...
		jmp	AddItem(pc)
; End of function sub_22ED4

; ---------------------------------------------------------------------------
		jmp	GetItemEquipSlot(pc)
; ---------------------------------------------------------------------------
		jmp	GetItemRSP(pc)

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_GetItemUseStringIdx:				  ; DATA XREF: ROM:0000DB74t
		jmp	GetItemUseStringIdx(pc)
; End of function j_GetItemUseStringIdx


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_RunTextCmd:					  ; DATA XREF: Trap01Handler+Et
						  ; Trap02Handler+12t
		jmp	RunTextCmd(pc)
; End of function j_RunTextCmd


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_22EE8:					  ; DATA XREF: sub_7052+7At
						  ; sub_7052+1AEt ...
		jmp	sub_2343A(pc)
; End of function sub_22EE8


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_22EEC:					  ; DATA XREF: sub_E8F8+7Et
						  ; sub_3EA28+6t
		jmp	sub_2A228(pc)
; End of function sub_22EEC


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_22EF0:					  ; DATA XREF: sub_E446+16t
						  ; sub_E8F8+68t ...
		jmp	sub_2A22C(pc)
; End of function sub_22EF0


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_GetRemainingItemAllowedCount:			  ; DATA XREF: ROM:000162BCt
						  ; InitialiseSprites:loc_1967Et
		jmp	GetRemainingItemAllowedCount(pc)
; End of function j_GetRemainingItemAllowedCount


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_PlayCutsceneScript:				  ; DATA XREF: ROM:00008C3Ct
						  ; ROM:00008D0Ct ...
		jmp	PlayCutsceneScript(pc)
; End of function j_PlayCutsceneScript


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_22EFC:					  ; DATA XREF: sub_F61E+8t
						  ; sub_3EB0E+40t
		jmp	sub_235FE(pc)
; End of function sub_22EFC


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_DebugGetAllItems:				  ; DATA XREF: sub_2F00+2t
		jmp	DebugGetAllItems(pc)
; End of function j_DebugGetAllItems


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_GetSaveLocationString:			  ; DATA XREF: sub_F578+16t
		jmp	GetSaveLocationString(pc)
; End of function j_GetSaveLocationString


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_GetItem:					  ; DATA XREF: sub_7052+106t
						  ; sub_178FE:loc_18816t
		jmp	GetItem(pc)
; End of function j_GetItem


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_CheckAndConsumeItem:				  ; DATA XREF: ConsumeItem+Et
						  ; sub_10ACE+136t ...
		jmp	CheckAndConsumeItem(pc)
; End of function j_CheckAndConsumeItem


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_22F10:					  ; DATA XREF: sub_3EB0E+28t
		jmp	sub_29516(pc)
; End of function sub_22F10


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_ClearTextbox_0:				  ; DATA XREF: ROM:00014B74t
						  ; ROM:00014BB6t ...
		jmp	ClearTextbox_0(pc)
; End of function j_ClearTextbox_0

; ---------------------------------------------------------------------------
		jmp	SpellBook(pc)
