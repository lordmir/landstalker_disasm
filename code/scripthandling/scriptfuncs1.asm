ScriptFuncs1	module
; Shop dialogue helpers. The two message routines use an inline-data
; convention: the shop script stub does a bsr and places string-id
; words directly after it; the helper reads them through the return
; address on the stack, then discards that address, so the rts
; returns from the stub itself.

; Scan the room's sprites for one with the dialogue flag whose
; dialogue script index (Dialogue & $FC) is zero - the plain shop
; speaker. All registers are preserved: only the flags return -
; Z set = found, Z clear = the sprite table ended first.
GetSpriteDialogue:
		movem.l	d0/a0,-(sp)
		lea	(Sprite1_X).l,a0

_gsdScan:
		move.w	(a0),d0
		bmi.s	_gsdDone		  ; End of sprite table (Z clear)
		cmpi.w	#$7F7F,d0		  ; Empty slot
		beq.s	_gsdSkip
		btst	#$04,InteractFlags(a0)	  ; Has	dialogue
		beq.s	_gsdSkip
		move.b	Dialogue(a0),d0		  ; Dialogue Script
		andi.b	#$FC,d0
		beq.s	_gsdDone		  ; Script 0 found (Z set)

_gsdSkip:
		lea	SPRITE_SIZE(a0),a0
		bra.s	_gsdScan
; ---------------------------------------------------------------------------

_gsdDone:
		movem.l	(sp)+,d0/a0
		rts

; Print an item's price message. Inline data after the bsr: one
; string id - except on FR/DE, where it is a table of string ids and
; GetItemArticle picks the grammatical variant for the item id that
; GetItemShopSellPrice left in g_TextItemSlot1. The price itself reaches
; the string through the numeric-variable control char.
DisplayItemPriceMessage:
		movem.l	d0-d1/a0,-(sp)
		bsr.w	GetItemShopSellPrice
		movea.l	$C(sp),a0		  ; Return address = inline string ids
	if ((REGION=FR)!(REGION=DE))
		move.w	(g_TextItemSlot1).l,d0
		bsr.w	GetItemArticle
		move.w	(a0,d0.w),d0
	else
		move.w	(a0),d0
	endif
		bsr.w	RunTextCmd
		movem.l	(sp)+,d0-d1/a0
		addq.l	#$04,sp			  ; Skip the inline data
		rts

; Run a shop purchase for item d0. Inline data after the bsr: four
; string ids - +0 the offer, +2 purchased, +4 not enough gold,
; +6 refused. Asks the offer with a yes/no; on Yes takes the price
; (d1 from GetItemShopSellPrice) via RemoveGold, and if it fits,
; gives the item and marks the shop-item sprite for despawn
; (g_ShopItemId = $FF).
HandleShopInteraction:
		movem.l	d0-d2/a0,-(sp)
		bsr.w	GetItemShopSellPrice
		move.w	d0,d2			  ; Item id
		movea.l	$00000010(sp),a0	  ; Return address = inline string ids
		move.w	(a0),d0			  ; Offer string
		bsr.w	RunTextCmd
		bsr.w	GetYesNoAnswer
		bcs.s	_hsiBuy			  ; Carry set = Yes
		move.w	$00000006(a0),d0	  ; Refused sale
		bra.s	_hsiSay
; ---------------------------------------------------------------------------

_hsiBuy:
		move.w	d1,d0			  ; Price
		jsr	(j_RemoveGold).l
		bcc.s	_hsiPurchase
		bsr.w	NoMoneyEffect
		move.w	$00000004(a0),d0	  ; Not	enough money
		bra.s	_hsiSay
; ---------------------------------------------------------------------------

_hsiPurchase:
		move.w	d2,d0
		bsr.w	GetItem
		move.w	$00000002(a0),d0	  ; Purchased
		move.b	#$FF,(g_ShopItemId).l	  ; Despawn the shop-item sprite

_hsiSay:
		bsr.w	RunTextCmd
		bsr.w	RestoreFromNoMoneyEffect
		movem.l	(sp)+,d0-d2/a0
		addq.l	#$04,sp			  ; Skip the inline data
		rts

	modend
