ItemUseStringFuncs	module

; FR/DE only: string id for an item-use message - base index d0
; (the item's use-string nibble) plus ItemUseStringOffsets[article
; form of g_CurrentTextItem]. GetItemFoundString (next file) runs on
; the shared tail with its own offset table.
GetItemUseString:
		movem.l	d1/a0,-(sp)
		lea	ItemUseStringOffsets(pc),a0

GetItemStringCommon:
		move.w	d0,d1
		move.w	(g_CurrentTextItem).l,d0
		bsr.s	GetItemArticle
		move.w	(a0,d0.w),d0
		add.w	d1,d0
		movem.l	(sp)+,d1/a0
		rts

	modend
