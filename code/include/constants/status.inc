; Bit numbers for g_PlayerStatus ($FF1146). Bits 0-4 are the status
; ailments; bits 6-7 are transient movement state that happens to
; share the byte (bit 5 is unused).
STATUS_POISON:	 equ $00000000
STATUS_CONFUSION: equ $00000001
STATUS_PARALYSIS: equ $00000002
STATUS_CURSE:	 equ $00000003
STATUS_NOHEAL:	 equ $00000004
STATUS_COLLIDED: equ $00000006	; Pre-move collision check hit something;
					; drives the wall/hurt-push resolution
					; in the directional movers (gamelogic1)
STATUS_FLIP_DIR: equ $00000007	; Flip single-button->diagonal resolution.
					; Set by the floor-door auto-walk handlers
					; (gamelogic4), read via tst.b/bmi in the
					; Handle*Button routines (gamelogic1).
