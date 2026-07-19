PostUseItemTable:
		bra.w	PostUseGarlic
		dc.b 	($80|ITM_GARLIC), $FF
; ---------------------------------------------------------------------------
		bra.w	PostUseEinsteinWhistle
		dc.b 	($80|ITM_EINSTEINWHISTLE), $FF
; ---------------------------------------------------------------------------
		bra.w	PostUseGolasEye
		dc.b 	($80|ITM_GOLASEYE), $FF
; ---------------------------------------------------------------------------
		bra.w	PostUseIdolStone
		dc.b 	($80|ITM_IDOLSTONE), $FF
; ---------------------------------------------------------------------------
		bra.w	PostUseKey
		dc.b 	($80|ITM_KEY), $FF
; ---------------------------------------------------------------------------
		bra.w	PostUseShortcake
		dc.b 	($80|ITM_SHORTCAKE), $FF
; ---------------------------------------------------------------------------
		dc.l 	$FFFFFFFF
		dc.b 	$FF, $FF
