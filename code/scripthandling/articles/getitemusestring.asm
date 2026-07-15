; =============== S U B R O U T I N E =======================================
GetItemUseString:
		movem.l	d1/a0,-(sp)
		lea		ItemUseStringOffsets(pc),a0
loc_2904E:
		move.w	d0,d1
		move.w	(word_FF1196).l,d0
		bsr.s	GetItemArticle
		move.w	(a0,d0.w),d0
		add.w	d1,d0
		movem.l	(sp)+,d1/a0
		rts