IslandMapLocations1	module

; Find the current room's entry in IslandMapLocations - records of
; {string id, location index, room word}, with a negative room word
; ending the table as the fallback entry. Loads the location name
; (LoadUncompressedString: a2/d7 = the string) and returns the
; record's location index in d6 (negative = no label; the island
; map screen uses it to place the marker).
GetIslandMapLocation:
		move.l	d1,-(sp)
		clr.w	d1
		lea	IslandMapLocations(pc),a2

_gimlScan:
		move.b	(a2)+,d1		  ; String id
		move.b	(a2)+,d6		  ; Location index
		move.w	(a2)+,d7		  ; Room
		blt.s	_gimlFound		  ; Negative = fallback entry
		cmp.w	(g_OriginalRoom).l,d7
		bne.s	_gimlScan

_gimlFound:
		bsr.w	LoadUncompressedString
		move.l	(sp)+,d1
		rts

	modend
