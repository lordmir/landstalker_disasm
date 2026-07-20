EquipmentPaletteSwap	module
; Tints the player sprite palette for the equipped gear: the armour
; recolours palette 2 colours 11-12, then the sword colours 13-14
; (a1 carries straight on). The colour pairs come from the
; ArmourPalSwaps/SwordPalSwaps assets, selected by matching the
; equipped item id in the index lists below. ITM_EKEEKE ($00) is the
; empty-slot value, giving the default colours.
UpdateEquipPal:
		lea	ArmourPalSwapIdx(pc),a0
		lea	((g_Pal2Base+$16)).l,a1
		lea	ArmourPalSwaps(pc),a2
		move.b	(g_EquippedArmour).l,d0
		bsr.s	UpdateEquipPalEntries
		lea	SwordPalSwapIdx(pc),a0
		lea	SwordPalSwaps(pc),a2
		move.b	(g_EquippedSword).l,d0
		bsr.s	UpdateEquipPalEntries
		rts

; Scans the item-id list at a0 for d0 (no bound check: the empty
; slot value $00 always hits an ITM_EKEEKE entry) and copies the
; matching 4-byte colour pair from the palette at a2 to (a1)+.
UpdateEquipPalEntries:
		clr.w	d1

_scan:
		cmp.b	(a0),d0
		beq.s	_found
		addq.l	#$01,a0
		addq.w	#$04,d1
		bra.s	_scan

_found:
		move.w	(a2,d1.w),(a1)+
		move.w	$00000002(a2,d1.w),(a1)+
		rts

SwordPalSwapIdx:
		dc.b ITM_EKEEKE
		dc.b ITM_MAGICSWORD
		dc.b ITM_THUNDERSWORD
		dc.b ITM_ICESWORD
		dc.b ITM_GAIASWORD
		dc.b ITM_FIREPROOF		  ; end-credits coin drop: the Gaia
						  ; sword animation recoloured as
						  ; falling coins
ArmourPalSwapIdx:
		dc.b ITM_EKEEKE
		dc.b ITM_STEELBREAST
		dc.b ITM_CHROMEBREAST
		dc.b ITM_SHELLBREAST
		dc.b ITM_HYPERBREAST
		dc.b ITM_EKEEKE			  ; unreachable - entry 0 matches
						  ; first (ArmourPalSwaps has only
						  ; five colour pairs anyway)

		modend
