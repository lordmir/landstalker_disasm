ScriptFuncs8	module
; Item quantities and properties. g_Inventory holds one nibble per
; item (id & $3F; even ids in the low nibble of the byte, odd ids in
; the high), stored biased as count+1: nibble 0 = never carried,
; 1 = owned but none left, etc.
;
; ItemProperties is 4 bytes per item: byte 0 = use-string index
; (high nibble) and max quantity (low nibble), byte 1 = equip slot,
; word 2 = buy price.

; Flags = player status ANDed with mask d0 (NE = any of them set).
TestPlayerStatus:
		movem.w	d0-d1,-(sp)
		move.b	d0,d1
		jsr	(j_GetPlayerStatus).l
		and.b	d1,d0
		movem.w	(sp)+,d0-d1
		rts

; Clear the status conditions in mask d0 (bits 0-3); bit 7 also
; fully heals (AddHealth with $FFFF clamps to max).
RemoveStatus:
		movem.l	d0-d1/a5,-(sp)
		move.b	d0,d1
		moveq	#$00000003,d0

_rsBit:
		btst	d0,d1
		beq.s	_rsNext
		jsr	(j_ClearPlayerStatus).l

_rsNext:
		dbf	d0,_rsBit
		btst	#$07,d1
		beq.s	_rsDone
		moveq	#$FFFFFFFF,d0
		lea	(Player_X).l,a5
		jsr	(j_AddHealth).l

_rsDone:
		movem.l	(sp)+,d0-d1/a5
		rts

; For item d0: d1 = owned count (-1 = never carried, the stored
; nibble minus one), d2 = 1 when the item is non-stackable (max
; quantity <= 1), 0 when it stacks.
GetItemQtyAndMaxQty:
		move.l	a0,-(sp)
		bsr.w	GetItemInventoryQty
		subq.w	#$01,d1
		bsr.w	GetItemProperties
		move.b	(a0),d2
		andi.w	#$000F,d2
		cmpi.w	#$0001,d2
		ble.s	_gqSingle
		clr.w	d2
		bra.s	_gqDone
; ---------------------------------------------------------------------------

_gqSingle:
		move.w	#$0001,d2

_gqDone:
		movea.l	(sp)+,a0
		rts

; Store count d1 for item d0, clamped to the item's max; the nibble
; keeps the count+1 bias.
SetItemQuantity:
		movem.l	d1-d2/a0,-(sp)
		move.b	d1,d2
		ext.w	d2
		bsr.w	GetItemMaxQty
		cmp.w	d1,d2
		ble.s	_sqStore
		move.w	d1,d2

_sqStore:
		addq.w	#$01,d2
		move.w	d2,d1
		bsr.w	UpdateItemQtyInInventory
		movem.l	(sp)+,d1-d2/a0
		rts

; Give one of item d0. Lifestock is special: +1 max health unit
; ($100), heal the same, and mark it sold in this shop/church.
; Otherwise the count goes up by one (from 0 if never carried), and
; EkeEke (item 0) also refreshes its HUD counter.
GetItem:
		movem.l	d0-a6,-(sp)
		cmpi.b	#ITM_LIFESTOCK,d0
		bne.s	_giNormal
		move.w	#$0100,d0
		lea	(Player_X).l,a5
		jsr	(j_AddToMaxHealth).l
		move.w	#$0100,d0
		jsr	(j_AddHealth).l
		jsr	(j_SetLifestockSoldFlag).l
		bra.s	_giHUD
; ---------------------------------------------------------------------------

_giNormal:
		bsr.s	GetItemQtyAndMaxQty
		tst.w	d1
		bge.s	_giAdd
		clr.w	d1

_giAdd:
		addq.w	#$01,d1
		bsr.s	SetItemQuantity
		tst.b	d0
		bne.s	_giDone

_giHUD:
		bsr.w	UpdateEkeEke

_giDone:
		movem.l	(sp)+,d0-a6
		rts

; Take one of item d0 away (not below zero).
CheckAndConsumeItem:
		move.l	d1,-(sp)
		bsr.w	GetItemQtyAndMaxQty
		tst.w	d1
		bge.s	_cciCheck
		clr.w	d1

_cciCheck:
		ble.s	_cciStore
		subq.w	#$01,d1

_cciStore:
		bsr.s	SetItemQuantity
		move.l	(sp)+,d1
		rts

; d1 = how many more of item d0 can be held (max - owned); the flags
; reflect the subtraction, so Z set = already full.
GetRemainingItemAllowedCount:
		movem.l	d2,-(sp)
		bsr.w	GetItemQtyAndMaxQty
		move.w	d1,d2
		bge.s	_graMax
		clr.w	d2

_graMax:
		bsr.w	GetItemMaxQty
		sub.w	d2,d1
		movem.l	(sp)+,d2
		rts

; Flags: NE = at least one of item d0 is owned.
CheckIfItemIsOwned:
		movem.w	d1,-(sp)
		bsr.w	GetItemQtyAndMaxQty
		tst.w	d1
		bge.s	_cioDone
		clr.w	d1

_cioDone:
		movem.w	(sp)+,d1
		rts

; d1 = raw inventory nibble for item d0 (count+1 biased).
GetItemInventoryQty:
		movem.l	d0/a0,-(sp)
		lea	(g_Inventory).l,a0
		andi.w	#$003F,d0
		asr.w	#$01,d0
		bcc.s	_giqEven
		move.b	(a0,d0.w),d1
		lsr.b	#$04,d1
		bra.s	_giqDone
; ---------------------------------------------------------------------------

_giqEven:
		move.b	(a0,d0.w),d1

_giqDone:
		andi.w	#$000F,d1
		movem.l	(sp)+,d0/a0
		rts

; Store raw nibble d1 for item d0.
UpdateItemQtyInInventory:
		movem.l	d0-d1/a0,-(sp)
		lea	(g_Inventory).l,a0
		andi.w	#$003F,d0
		asr.w	#$01,d0
		bcc.s	_uiqEven
		andi.b	#$0F,(a0,d0.w)
		lsl.b	#$04,d1
		bra.s	_uiqStore
; ---------------------------------------------------------------------------

_uiqEven:
		andi.b	#$F0,(a0,d0.w)
		andi.b	#$0F,d1

_uiqStore:
		or.b	d1,(a0,d0.w)
		movem.l	(sp)+,d0-d1/a0
		rts

; d1 = item d0's maximum quantity.
GetItemMaxQty:
		move.l	a0,-(sp)
		bsr.s	GetItemProperties
		move.b	(a0),d1
		andi.w	#$000F,d1
		movea.l	(sp)+,a0
		rts

; d1 = the string id for using item d0: the use-string index from
; the properties, +$C into the string table - except FR/DE, where
; GetItemUseString builds it with the right article.
GetItemUseStringIdx:
	if ((REGION=FR)!(REGION=DE))
		movem.l	d0/a0,-(sp)
		andi.w	#$FF,d0
		move.w	d0,(g_CurrentTextItem).l
		bsr.s	GetItemProperties
		move.b	(a0),d0
		andi.w	#$F0,d0
		lsr.w	#$04,d0
		bsr.w	GetItemUseString
		move.w	d0,d1
		movem.l	(sp)+,d0/a0
	else
		move.l	a0,-(sp)
		bsr.s	GetItemProperties
		move.b	(a0),d1
		andi.w	#$00F0,d1
		lsr.w	#$04,d1
		addi.w	#$000C,d1
		movea.l	(sp)+,a0
	endif
		rts

; d1 = item d0's equip slot (sign-extended byte).
GetItemEquipSlot:
		move.l	a0,-(sp)
		bsr.s	GetItemProperties
		move.b	$00000001(a0),d1
		ext.w	d1
		movea.l	(sp)+,a0
		rts

; d1 = item d0's buy price.
GetItemBuyPrice:
		move.l	a0,-(sp)
		bsr.s	GetItemProperties
		move.w	$00000002(a0),d1
		movea.l	(sp)+,a0
		rts

; a0 = item d0's 4-byte ItemProperties record.
GetItemProperties:
		move.l	d0,-(sp)
		andi.w	#$003F,d0
		asl.w	#$02,d0
		lea	ItemProperties(pc,d0.w),a0 ; EkeEke
		move.l	(sp)+,d0
		rts

	modend
