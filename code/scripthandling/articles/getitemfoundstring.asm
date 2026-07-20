ItemFoundStringFuncs	module

; FR/DE only: string id for a "found item" message - base index d0
; plus ItemFoundStringOffsets[article form]. Shares
; GetItemStringCommon with GetItemUseString.
GetItemFoundString:
		movem.l	d1/a0,-(sp)
		lea	ItemFoundStringOffsets(pc),a0
		bra.s	GetItemStringCommon

	modend
