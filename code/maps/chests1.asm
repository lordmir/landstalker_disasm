Chests1	module
; Assigns a spawning chest sprite (a1) its contents and global chest
; index: RoomChestOffsets (keyed on the original, pre-variant room
; number) gives the room's base index into ChestContents, plus
; g_chestCount for the nth chest initialised in this room. The index
; is the chest's bit number in g_ChestOpenFlags.
LookupChestContents:
		move.w	(g_CurrentRoom).l,d0
		jsr	(j_GetOriginalRoomNum).l
		clr.w	d1
		move.b	RoomChestOffsets(pc,d0.w),d1
		add.b	(g_chestCount).l,d1
		lea	ChestContents(pc),a0
		move.b	(a0,d1.w),d0
		move.b	d0,GoldOrChestContents(a1) ; ChestContents
		move.b	d1,ChestIndex(a1)	  ; ChestIdx
		addq.b	#$01,(g_chestCount).l
		rts

		modend
