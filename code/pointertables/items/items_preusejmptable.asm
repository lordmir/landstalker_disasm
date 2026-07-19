PreUseItemTable:
		bra.w	ItemUseEkeEke
		dc.b 	ITM_EKEEKE, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseDetoxGrass
		dc.b 	ITM_DETOXGRASS, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseGaiaStatue
		dc.b 	ITM_GAIASTATUE, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseGoldenStatue
		dc.b 	ITM_GOLDENSTATUE, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseMindRepair
		dc.b 	ITM_MINDREPAIR, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseBlueRibbon
		dc.b 	ITM_BLUERIBBON, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseLantern
		dc.b 	ITM_LANTERN, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseGarlic
		dc.b 	ITM_GARLIC, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseAntiparalyze
		dc.b 	ITM_ANTIPARALYZE, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseEinsteinWhistle
		dc.b 	ITM_EINSTEINWHISTLE, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseSpellbook
		dc.b 	ITM_SPELLBOOK, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseLithograph
		dc.b 	ITM_LITHOGRAPH, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUsePawnTicket
		dc.b 	ITM_PAWNTICKET, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseGolasEye
		dc.b 	ITM_GOLASEYE, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseDeathStatue
		dc.b 	ITM_DEATHSTATUE, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseDahl
		dc.b 	ITM_DAHL, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseRestoration
		dc.b 	ITM_RESTORATION, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseLogs
		dc.b 	ITM_LOGS, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseOracleStone
		dc.b 	ITM_ORACLESTONE, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseIdolStone
		dc.b 	ITM_IDOLSTONE, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseKey
		dc.b	ITM_KEY, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseBell
		dc.b 	ITM_BELL, $FF
; ---------------------------------------------------------------------------
		bra.w	ItemUseShortcake
		dc.b 	ITM_SHORTCAKE, $FF
; ---------------------------------------------------------------------------
		dc.l $FFFFFFFF
		dc.b $FF, $FF
