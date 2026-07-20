ItemArticleFuncs	module

; FR/DE only: d0 = item d0's grammatical-article form, from the
; ItemArticles nibble table (even ids in the high nibble, odd in the
; low). The nibbles hold even values, so the result can index the
; article word tables directly.
GetItemArticle:
		move.l	a0,-(sp)
		lea	ItemArticles(pc),a0
		asr.w	#1,d0
		bcs.s	_giaOdd
		move.b	(a0,d0.w),d0
		asr.w	#4,d0
		bra.s	_giaMask
; ---------------------------------------------------------------------------

_giaOdd:
		move.b	(a0,d0.w),d0

_giaMask:
		andi.w	#$F,d0
		movea.l	(sp)+,a0
		rts

	modend
