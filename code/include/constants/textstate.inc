; Bit numbers for the text-engine and debug-menu state bytes.

; g_TextFlags ($FF1144). Only bit 0 is an independent flag; the rest
; of the byte doubles as (line-home cursor X << 1), which is why
; "talk mode" lands on bit 5: talk sets the byte to $22, i.e. line-
; home X $11 (indented past the speaker portrait), which also has
; bit 1 set. See the header of stringfuncs1.asm.
TXTF_INSTANT:	 equ $00000000	; Instant/paged print (flush per line, not
					; per glyph)
TXTF_TALK:	 equ $00000005	; Talk mode: voice blips + $11 line-home
					; indent

; g_TextboxState ($FF1902).
TBS_TEXTBOX_UP:	 equ $00000000	; A textbox is currently on screen
TBS_SHOP_NOMONEY: equ $00000001	; Shop "not enough money" darken effect

; g_DebugMenuFlags ($FF1917).
DBGF_REDRAW:	 equ $00000000	; Cursor moved - redraw requested
DBGF_CLOSE:	 equ $00000001	; Close the debug menu
