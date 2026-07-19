; Friday overlay-animation states (g_FridayAnimation1/2, handled by
; UpdateFridayAnimation in fridayanimation.asm). Writing an odd start
; value to g_FridayAnimation1 begins a move (the handler bumps it to
; the even running value); g_FridayAnimation2 holds the state to enter
; when the current move finishes. Cutscene code polls Animation1 for
; FRIDAY_PERCH to know a move has completed.
FRIDAY_OFF:       equ $00 ; hidden / no animation
FRIDAY_FLY_UP:    equ $01 ; fly up from the bottom of the screen, swaying
FRIDAY_HOVER:     equ $11 ; one figure-of-eight hover circuit
FRIDAY_PERCH:     equ $21 ; snap to the perch position and wait
FRIDAY_FLAP:      equ $22 ; flap wings in place
FRIDAY_FROZEN:    equ $23 ; hold still
FRIDAY_FROZEN2:   equ $24 ; hold still (alternate resume value)
FRIDAY_SHAKE:     equ $25 ; jitter one pixel diagonally
FRIDAY_FLY_DOWN:  equ $31 ; fly down, swaying, then hide
FRIDAY_SPELL:     equ $41 ; spell cast: sparkles + white screen strobe
; Waypoint-path playback (FridayAnimation1-15 data files)
FRIDAY_PATH_1:    equ $51
FRIDAY_PATH_2:    equ $53
FRIDAY_PATH_3:    equ $55
FRIDAY_PATH_4:    equ $57
FRIDAY_PATH_5:    equ $59
FRIDAY_PATH_6:    equ $5B
FRIDAY_PATH_7:    equ $5D
FRIDAY_PATH_8:    equ $5F
FRIDAY_PATH_9:    equ $61
FRIDAY_PATH_10:   equ $63
FRIDAY_PATH_11:   equ $65
FRIDAY_PATH_12:   equ $67
FRIDAY_PATH_13:   equ $69
FRIDAY_PATH_14:   equ $6B
FRIDAY_PATH_15:   equ $6D
