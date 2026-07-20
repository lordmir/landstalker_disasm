Items1	module
; Item use, part 1: the dispatcher. PreUseItemTable
; (pointertables/items) is a list of {bra.w handler, item id, $FF}
; entries terminated by id $FF; the matching entry is jumped into
; directly. The handlers (items2/3.asm) leave through items3's
; shared exits - ReturnSuccess, ReturnFailure, or
; ReturnSuccessAndEnablePostUse, which arms the item's second pass
; (RunItemPostUse, run by the menu after the room reloads) by
; setting bit 7 of g_ItemBeingUsed.

; Use item d0 from the menu: remember it, find its pre-use entry
; (ids matched with bit 7 masked off) and run it. Items without an
; entry just print the failure text.
UseItem:
		move.b	d0,(g_ItemBeingUsed).l
		lea	PreUseItemTable(pc),a0

_uiScan:
		move.b	0000000004(a0),d2
		cmpi.b	#$FF,d2
		beq.s	PrintNothingHappenedString
		andi.b	#$7F,d2
		cmp.b	d0,d2
		beq.s	_uiRun
		addq.l	#$06,a0
		bra.s	_uiScan
; ---------------------------------------------------------------------------

_uiRun:
		jmp	(a0)
; ---------------------------------------------------------------------------

; String $16: nothing happened.
PrintNothingHappenedString:
		move.w	#$0016,d0
		jsr	(j_PrintString).l
		rts

	modend
