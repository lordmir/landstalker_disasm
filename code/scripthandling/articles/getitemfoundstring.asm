GetItemFoundString:
		movem.l	d1/a0,-(sp)
		lea		ItemFoundStringOffsets(pc),a0
		bra.s	loc_2904E