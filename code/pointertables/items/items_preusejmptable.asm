; ---------------------------------------------------------------------------

PreUseItemTable:				  ; DATA XREF: UseItem+6t
		bra.w	ItemUseEkeEke
; ---------------------------------------------------------------------------
		dc.b ITM_EKEEKE
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseDetoxGrass
; ---------------------------------------------------------------------------
		dc.b ITM_DETOXGRASS
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseGaiaStatue	  ; Check for lava room	flag
; ---------------------------------------------------------------------------
		dc.b ITM_GAIASTATUE
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseGoldenStatue
; ---------------------------------------------------------------------------
		dc.b ITM_GOLDENSTATUE
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseMindRepair
; ---------------------------------------------------------------------------
		dc.b ITM_MINDREPAIR
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseBlueRibbon
; ---------------------------------------------------------------------------
		dc.b ITM_BLUERIBBON
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseLantern
; ---------------------------------------------------------------------------
		dc.b ITM_LANTERN
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseGarlic
; ---------------------------------------------------------------------------
		dc.b ITM_GARLIC
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseAntiparalyze
; ---------------------------------------------------------------------------
		dc.b ITM_ANTIPARALYZE
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseEinsteinWhistle
; ---------------------------------------------------------------------------
		dc.b ITM_EINSTEINWHISTLE
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseSpellbook
; ---------------------------------------------------------------------------
		dc.b ITM_SPELLBOOK
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseLithograph
; ---------------------------------------------------------------------------
		dc.b ITM_LITHOGRAPH
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUsePawnTicket
; ---------------------------------------------------------------------------
		dc.b ITM_PAWNTICKET
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseGolasEye
; ---------------------------------------------------------------------------
		dc.b ITM_GOLASEYE
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseDeathStatue
; ---------------------------------------------------------------------------
		dc.b ITM_DEATHSTATUE
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseDahl
; ---------------------------------------------------------------------------
		dc.b ITM_DAHL
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseRestoration
; ---------------------------------------------------------------------------
		dc.b ITM_RESTORATION
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseLogs
; ---------------------------------------------------------------------------
		dc.b ITM_LOGS
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseOracleStone
; ---------------------------------------------------------------------------
		dc.b ITM_ORACLESTONE
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseIdolStone
; ---------------------------------------------------------------------------
		dc.b ITM_IDOLSTONE
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseKey
; ---------------------------------------------------------------------------
		dc.b ITM_KEY
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseBell
; ---------------------------------------------------------------------------
		dc.b ITM_BELL
		dc.b $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseShortcake
; ---------------------------------------------------------------------------
		dc.b ITM_SHORTCAKE
		dc.b $FF
		dc.l $FFFFFFFF
		dc.b $FF
		dc.b $FF
