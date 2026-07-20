ScriptFuncsDebugItems	module

; Debug menu helper: give 9 of every item (SetItemQuantity clamps to
; each item's max); items whose max quantity is 0 are skipped.
DebugGetAllItems:
		movem.l	d0-d1,-(sp)
		move.w	#$003F,d0

_dgaiItem:
		bsr.w	GetItemMaxQty
		beq.s	_dgaiNext
		moveq	#9,d1
		bsr.w	SetItemQuantity

_dgaiNext:
		dbf	d0,_dgaiItem
		movem.l	(sp)+,d0-d1
		rts

	modend
