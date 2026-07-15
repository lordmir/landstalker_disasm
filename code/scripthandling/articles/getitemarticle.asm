GetItemArticle:
		move.l	a0,-(sp)
		lea		ItemArticles(pc),a0
		asr.w	#1,d0
		bcs.s	loc_2901A
		move.b	(a0,d0.w),d0
		asr.w	#4,d0
		bra.s	loc_2901E
loc_2901A:
		move.b	(a0,d0.w),d0
loc_2901E:
		andi.w	#$F,d0
		movea.l	(sp)+,a0
		rts