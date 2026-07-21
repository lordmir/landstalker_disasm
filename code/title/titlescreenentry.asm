TitleScreenEntry	module
; Boot attract-loop entry (via j_DisplayTitle): the Climax logo,
; then the title screen. Returns carry set if Start was pressed,
; clear if it timed out (the attract loop moves on).
DisplayTitle:
		bsr.w	DisplayClimaxLogo
		bra.w	DisplayTitleScreen

		modend
