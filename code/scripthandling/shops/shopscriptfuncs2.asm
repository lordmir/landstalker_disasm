ShopScriptFuncs2	module
; The shop system, part 2: pricing and shop-record lookup.

; Price the current shop item (g_ShopItemId): d0 = the item id
; (also stored in g_TextItemSlot1 for the article/name), d1 = its
; buy price scaled by the shop's modifier (price * mod / 16, from
; the ShopScript record byte +2, or +3 for lifestock). The result
; also becomes the numeric text variable for the price message.
; a1 must hold the shop record (FindShopForRoom).
GetItemShopSellPrice:
		move.l	d2,-(sp)
		clr.w	d0
		move.b	(g_ShopItemId).l,d0
		move.w	d0,(g_TextItemSlot1).l
		bsr.w	GetItemBuyPrice
		clr.w	d2
		cmpi.w	#ITM_LIFESTOCK,d0
		bne.s	_gspItemMod
		move.b	$00000003(a1),d2	  ; Lifestock price modifier
		bra.s	_gspApply
; ---------------------------------------------------------------------------

_gspItemMod:
		move.b	$00000002(a1),d2	  ; Item price modifier

_gspApply:
		muls.w	d2,d1
		asr.l	#$04,d1
		move.l	d1,(g_PrintNumericDwordValue).l
		move.l	(sp)+,d2
		rts

; FindShopForRoom, with the retail "? ERROR 7" script on failure
; (the carry result survives via the pushed status register).
FindShopOrError:
		bsr.s	FindShopForRoom
		move	sr,-(sp)
		bcc.s	_fsoeDone
		tst.w	(DebugModeEnable).w
		bne.w	_fsoeDone
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $0,$0		  ; Run	text script at offset 0x0277F6
					; 0xE000: PRINT MSG 0x004D, MSGBOX CLEARED, END: "? ERROR 7{5E}"
; ---------------------------------------------------------------------------

_fsoeDone:
		move	(sp)+,ccr
		rts

; a1 = the current room's 14-byte ShopScript record, carry clear;
; carry set when the table's negative terminator is hit first.
FindShopForRoom:
		movem.w	d0-d1,-(sp)
		move.w	(g_OriginalRoom).l,d0
		lea	ShopScript(pc),a1	  ; Massan Shop

_fsrScan:
		move.w	(a1),d1
		blt.s	_fsrNone
		cmp.w	d0,d1
		beq.s	_fsrDone
		lea	$0000000E(a1),a1
		bra.s	_fsrScan
; ---------------------------------------------------------------------------

_fsrDone:
		movem.w	(sp)+,d0-d1
		rts
; ---------------------------------------------------------------------------

_fsrNone:
		ori	#$01,ccr
		bra.s	_fsrDone

	modend
