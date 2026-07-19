Chests2	module
; Marks chest a4 opened: empties its contents ($FF) and sets its
; ChestIndex bit in g_ChestOpenFlags - except in the Labrynth
; church room, whose chest is never marked and so refills every
; visit.
OpenChest:
		cmpi.w	#ROOM_LABRYNTH_CHURCH,(g_CurrentRoom).l
		beq.s	_ocDone
		move.b	#$FF,GoldOrChestContents(a4)
		clr.w	d0
		move.b	ChestIndex(a4),d0
		move.b	d0,d1
		andi.b	#$07,d1
		lsr.b	#$03,d0
		lea	(g_ChestOpenFlags).l,a0
		bset	d1,(a0,d0.w)

_ocDone:
		rts


; Tests chest a1's bit in g_ChestOpenFlags (Z clear = already
; opened).
CheckIfChestOpened:
		clr.w	d0
		move.b	ChestIndex(a1),d0
		move.b	d0,d1
		andi.b	#$07,d1
		lsr.b	#$03,d0
		lea	(g_ChestOpenFlags).l,a0
		btst	d1,(a0,d0.w)
		rts

		modend
