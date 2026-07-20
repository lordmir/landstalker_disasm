Inventory1	module
; Opening and closing the inventory menu, plus the equipment
; appliers shared with the rest of the game: armour defence and the
; sword hit-effect graphics.

; Run from the game loop: open the menu when Start (controller bit
; 7) is pressed - unless menu opening is locked, a sword swing is
; in progress, or an object is mid-lift (carrying is fine once the
; lift has settled at phase $17). Fades out, switches the VDP to
; the menu layout (H-int off, scroll and sprites cleared, the map
; plane blanked) and hands over to the menu loop (sub_22E8C).
; On return: carry clear = plain close; d0 = 0 = use the selected
; item (_useItem); anything else = the Equip option - run the
; equip screen (RunEquipMenu), apply the new equipment and
; defence, then rebuild the room.
CheckForMenuOpen:
		tst.b	(g_Controller1State).l
		bpl.w	_cmDone
		btst	#$02,(g_LockPlayerActions).l ; Bit 0: Can't pick up items
						  ; Bit	1: Can't attack
						  ; Bit	2: Can't open menu
		bne.w	_cmDone
		tst.b	(g_SwordSwingFrame).l
		bne.w	_cmDone
		move.b	(g_CarryPhase).l,d0
		beq.s	_openMenu
		cmpi.b	#$17,d0
		bne.w	_cmDone

_openMenu:
		trap	#$00			  ; Trap00Handler
		dc.w SND_MenuOpen

		bsr.w	FadeOutToDarkness
		bsr.w	_buildInvTilemap
		bsr.w	InitInv
		bsr.w	InitInvDisplay
		jsr	(j_RefreshAndClearTextbox).l
		bsr.w	QueueTextboxTilemapDMA
		bsr.w	FlushDMACopyQueue
		move.w	#$0000,d0
		move.b	#$EF,d1
		bsr.w	MaskVDPReg
		bsr.w	ClearAndRefreshVDPSpriteTableDMA
		clr.w	d6
		bsr.w	FillHScrollDataOffset1
		clr.w	d6
		bsr.w	FillVSRAMOffset1
		bsr.w	FlushDMACopyQueue
		lea	((g_ForegroundBlocks+$180)).l,a0
		move.w	#$04BF,d7

_blankPlane:
		move.w	#$86BC,(a0)+
		dbf	d7,_blankPlane
		bsr.w	QueueInventoryScrBTilemapDMA
		bsr.w	ClearInventoryWindow
		jsr	(j_LoadYesNoPrompt).l
		bsr.w	FadeInFromDarkness
		jsr	(sub_22E8C).l
		bcc.w	_closeMenu
		tst.b	d0
		beq.w	_useItem
		bsr.w	RunEquipMenu
		movem.w	d1,-(sp)
		bsr.w	FadeOutToDarkness
		clr.b	d0
		lea	(g_EquippedSword).l,a0
		bsr.s	_reequipSlot
		bsr.s	_reequipSlot
		bsr.s	_reequipSlot
		bsr.s	_reequipSlot
		bsr.s	UpdatePlayerDefence
		bra.w	_cmReload

; Set Player_Defence from the equipped armour: the breastplates
; (ITM_STEELBREAST-ITM_HYPERBREAST) map to table entries 1-4,
; anything else to entry 0. The value scales incoming damage
; (x/256): none 1.00, steel $E6, chrome $CC, shell $B3, hyper $80.
UpdatePlayerDefence:
		clr.w	d0
		move.b	(g_EquippedArmour).l,d0
		subi.b	#ITM_STEELBREAST,d0
		addq.b	#$01,d0
		cmpi.b	#$05,d0
		bcs.s	_updIndexOk
		clr.b	d0

_updIndexOk:
		add.b	d0,d0
		move.w	ArmourDefence(pc,d0.w),(Player_Defence).l
		rts

ArmourDefence:	dc.w $0100,$00E6,$00CC,$00B3,$0080

; Re-derive equipment slot d0 (0 sword / 1 armour / 2 boots /
; 3 ring; a0 = its g_Equipped* byte): GetEquippedItem picks the
; slot's item into d1, and a changed sword also clears the charge
; meter and redraws its HUD. Stores the item and advances a0/d0 to
; the next slot.
_reequipSlot:
		bsr.w	GetEquippedItem
		tst.b	d0
		bne.s	_rsStore
		cmp.b	(a0),d1
		beq.s	_rsStore
		clr.w	(g_SwordChargeMeter).l
		movem.l	d0-d1/a0,-(sp)
		jsr	(j_RefreshSwordChargeHUD).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		movem.l	(sp)+,d0-d1/a0

_rsStore:
		move.b	d1,(a0)+
		addq.b	#$01,d0
		rts

; Run the item screen (RunItemMenu, inventory3): d1 non-zero means
; the player backed out - just close. Otherwise an item was chosen
; (id in d0): run its UseItem handler, close the menu (rebuilding
; the room), then run the item's post-reload follow-up (RunItemPostUse)
; with the item id back in d0.
_useItem:
		bsr.w	RunItemMenu
		tst.b	d1
		bne.s	_closeMenu
		movem.w	d0,-(sp)
		bsr.w	UseItem
		bsr.s	_closeMenu
		movem.w	(sp)+,d0
		bsr.w	RunItemPostUse
		rts

; Close the menu: fade out, restore the palettes and VDP state
; (H-int back on, window back to the textbox strip), reload the
; room and fade back in. The full-reload path enters at _cmReload
; with d1 already saved; CheckForMenuOpen's early-outs return
; through _cmDone.
_closeMenu:
		movem.w	d1,-(sp)
		bsr.w	FadeOutToDarkness

_cmReload:
		bsr.w	RestoreSavedPal1
		bsr.w	UpdateEquipPal
		bsr.w	ClearScrollPlanes
		move.w	#$0000,d0
		move.b	#$10,d1
		bsr.w	OrVDPReg
		move.w	#$9203,d0
		bsr.w	SetVDPReg
		bsr.w	LoadRoom
		bsr.w	InitRoomDisplayAndFadeIn
		bsr.w	LoadMagicSwordGfx
		clr.b	(g_Controller1State).l
		movem.w	(sp)+,d1

_cmDone:
		rts

; (Re)load the equipped sword's hit-effect tiles to VRAM $F180:
; the Magic, Thunder, Gaia and Ice swords each have their own
; graphics, any other non-zero sword id gets CoinFallGfx, and no
; sword loads nothing.
LoadMagicSwordGfx:
		bsr.w	FlushDMACopyQueue
		move.b	(g_EquippedSword).l,d0
		beq.s	_lsgDone
		lea	MagicSwordGfx(pc),a0
		cmpi.b	#ITM_MAGICSWORD,d0
		beq.s	_lsgLoad
		lea	ThunderSwordGfx(pc),a0
		cmpi.b	#ITM_THUNDERSWORD,d0
		beq.s	_lsgLoad
		lea	GaiaSwordGfx(pc),a0
		cmpi.b	#ITM_GAIASWORD,d0
		beq.s	_lsgLoad
		lea	IceSwordGfx(pc),a0
		cmpi.b	#ITM_ICESWORD,d0
		beq.s	_lsgLoad
		lea	CoinFallGfx(pc),a0

_lsgLoad:
		lea	(g_Buffer).l,a1
		lea	($0000F180).l,a2
		bsr.w	DecompressAndQueueGfxCopy
		bsr.w	FlushDMACopyQueue

_lsgDone:
		rts

; Load a sword's elemental hit-effect graphics: d0 = sword item id
; (ITM_MAGICSWORD / ITM_THUNDERSWORD, anything else gets the Ice
; Sword's), a2 = VRAM destination. Decompresses the effect tiles into
; g_Buffer and queues the DMA copy. Besides the swords' burn-on-hit
; animation, enemy AIs (spectres, reapers, Ifrit, Mir, Gola) call
; this to load the flames for their fireball projectiles.
LoadMagicSwordEffect:
		lea	MagicSwordGfx(pc),a0
		cmpi.b	#ITM_MAGICSWORD,d0
		beq.s	_lseLoad
		lea	ThunderSwordGfx(pc),a0
		cmpi.b	#ITM_THUNDERSWORD,d0
		beq.s	_lseLoad
		lea	IceSwordGfx(pc),a0

_lseLoad:
		lea	(g_Buffer).l,a1
		bra.w	DecompressAndQueueGfxCopy

; Build the menu background: decompress InvScreenTilemap and copy
; its 19 rows x 40 columns into g_InventoryTilemap (64-word row
; stride) with the priority bit set, turning the blank tile $86BC
; transparent, then fill the rows below with $86B4.
_buildInvTilemap:
		lea	InvScreenTilemap(pc),a0
		lea	(g_Buffer).l,a1
		bsr.w	DecompressLZ77Gfx
		lea	((g_Buffer+4)).l,a0
		lea	(g_InventoryTilemap).l,a1
		move.w	#$0012,d7

_bitRow:
		move.w	#$0027,d6

_bitCol:
		move.w	(a0)+,d0
		ori.w	#$8000,d0
		cmpi.w	#$86BC,d0
		bne.s	_bitStore
		clr.w	d0

_bitStore:
		move.w	d0,(a1)+
		dbf	d6,_bitCol
		adda.w	#$0030,a1
		dbf	d7,_bitRow
		move.w	#$017F,d7

_bitFill:
		move.w	#$86B4,(a1)+
		dbf	d7,_bitFill
		rts

; Menu palettes and window plane: colours 10-14 of line 0 come from
; line 3, the item icons' palette (InvItemPal) goes to line 1, the
; sprite table is cleared and the window plane extended over the
; screen (reg $12 = $1C).
InitInvDisplay:
		lea	((g_Pal3Base+$14)).l,a0
		lea	((g_Pal0Base+$14)).l,a1
		moveq	#$00000004,d7

_iidPal:
		move.w	(a0)+,(a1)+
		dbf	d7,_iidPal
		lea	InvItemPal(pc),a0
		lea	(g_Pal1Base).l,a1
		bsr.w	CopyPalette
		bsr.w	ClearVDPSpriteTable
		bsr.w	QueueInventoryWinTilemapDMA
		move.w	#$921C,d0
		bsr.w	SetVDPReg
		rts

	modend
