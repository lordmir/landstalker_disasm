ScriptFuncsNames	module
; Name/string lookups for the text engine. The tables hold
; length-prefixed strings back to back (the length byte counts the
; string bytes only); the scanner returns a2 = the string's first
; byte and d7 = its length - 1, ready for CopyStringToBuffer.

; Look up character d1's name: ids 1000+ come from
; SpecialCharacterNameTable, ids past NUM_CHAR_NAMES fall back to
; DefaultName, the rest come from CharacterNameTable.
GetChrName:
		move.l	d1,-(sp)
		cmpi.w	#01000,d1
		blt.s	_gcnRegular
		subi.w	#01000,d1
		lea	SpecialCharacterNameTable(pc),a2
		bra.s	_gcnFind
; ---------------------------------------------------------------------------

_gcnRegular:
		cmpi.w	#NUM_CHAR_NAMES,d1
		blt.s	_gcnNormal
		clr.w	d1
		lea	DefaultName(pc),a2
		bra.s	_gcnFind
; ---------------------------------------------------------------------------

_gcnNormal:
		lea	CharacterNameTable(pc),a2

_gcnFind:
		bsr.s	_findString
		move.l	(sp)+,d1
		rts

; Look up uncompressed string d1: ids below $40 are item names,
; $40 and up are menu strings.
LoadUncompressedString:
		move.l	d1,-(sp)
		cmpi.w	#$0040,d1
		bcc.s	_lusMenu
		lea	ItemNameTable(pc),a2
		bra.s	_lusFind
; ---------------------------------------------------------------------------

_lusMenu:
		subi.w	#$0040,d1
		lea	MenuStringTable(pc),a2

_lusFind:
		bsr.s	_findString
		move.l	(sp)+,d1
		rts

; Walk the length-prefixed strings at a2 to entry d1: a2 = its first
; byte, d7 = length - 1.
_findString:
		move.l	d1,-(sp)
		clr.w	d7

_fsScan:
		move.b	(a2)+,d7
		subq.w	#$01,d1
		blt.s	_fsFound
		adda.w	d7,a2
		bra.s	_fsScan
; ---------------------------------------------------------------------------

_fsFound:
		subq.w	#$01,d7
		move.l	(sp)+,d1
		rts

; Load the current room's save-location name: SaveGameLocations is
; {string id, room} word pairs, a negative room ending the table as
; the fallback entry.
GetSaveLocationString:
		move.l	d1,-(sp)
		lea	SaveGameLocations(pc),a2

_gslsScan:
		move.w	(a2)+,d1
		move.w	(a2)+,d7
		blt.s	_gslsFound		  ; Negative = fallback entry
		cmp.w	(g_OriginalRoom).l,d7
		bne.s	_gslsScan

_gslsFound:
		bsr.w	LoadUncompressedString
		move.l	(sp)+,d1
		rts

	modend
