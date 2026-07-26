; Bit numbers for g_LockPlayerActions ($FF1153): each set bit disables
; one player action while dialogue, cutscenes or menus are active.
; (The authoritative mapping is the ProcessActionButton comment in
; gamelogic4.asm.)

LPA_NO_PICKUP:	 equ $00000000	; Can't pick up items, open chests or talk
LPA_NO_ATTACK:	 equ $00000001	; Can't swing the sword
LPA_NO_MENU:	 equ $00000002	; Can't open the inventory menu

LPABF_ALL:	 equ $00000007	; All three locks (move.b to lock,
					; andi #($FF-LPABF_ALL) to unlock)
