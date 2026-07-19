Shops1	module
; Unused entry point: dead load of a0 (immediately overwritten),
; then falls through into CheckShopEnter. Never referenced.
CheckShopEnterUnused:
		lea	(Sprite1_X).l,a0

; Called after a door warp: if the destination room is in the Shops
; table and the player walked in through a front-wall door (facing
; NE/NW), runs the shopkeeper's welcome script.
CheckShopEnter:
		move.b	(Player_RotationAndSize).l,d0
		addi.b	#$40,d0			  ; rotate facing one step:
		andi.b	#DIR_MASK,d0		  ; NE/NW land below DIR_SW,
		cmpi.b	#DIR_SW,d0		  ; SE/SW at or above
		bcc.s	_enterDone
		lea	Shops(pc),a0

_enterScan:
		move.w	(a0)+,d0
		bmi.s	_enterDone
		cmp.w	(g_CurrentRoom).l,d0
		bne.s	_enterScan
		jsr	(j_RunShopWelcome).l
		nop

_enterDone:
		rts


; Called before a door warp: if the current room is in the Shops
; table and the player is leaving through a front door (facing
; SE/SW), runs the shopkeeper's steal script if the player is
; carrying something (an unpaid item), otherwise the farewell script.
CheckShopExit:
		move.b	(Player_RotationAndSize).l,d0
		addi.b	#$40,d0
		andi.b	#DIR_MASK,d0
		cmpi.b	#DIR_SW,d0
		bcs.s	_exitDone
		lea	Shops(pc),a0

_exitScan:
		move.w	(a0)+,d0
		bmi.s	_exitDone
		cmp.w	(g_CurrentRoom).l,d0
		bne.s	_exitScan
		move.b	(Player_Action+1).l,d0
		andi.b	#ACT_PICKUP_MASK,d0
		cmpi.b	#ACT_PICKUP_MASK,d0	  ; both carry bits set?
		bne.s	_exitFarewell
		jsr	(j_RunShopSteal).l
		rts

_exitFarewell:
		jsr	(j_RunShopFarewell).l

_exitDone:
		rts

		modend
