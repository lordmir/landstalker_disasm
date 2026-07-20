ShopScriptFuncs1	module
; The shop system, part 1. Each shop room has a 14-byte ShopScript
; record: {room word, item price modifier byte, lifestock price
; modifier byte, then five script offset words - +$4 welcome,
; +$6 farewell, +$8 item picked up, +$A item put down, +$C steal}.
; The offsets are relative to the ShopScript table and run through
; RunTextCmd.
;
; ShopSpecialItemsScript overrides the pickup/putdown/steal lines
; for particular items: records of {item id byte, record length
; byte, room word (negative = any room), script words at +4/+6/+8}
; with the offsets relative to the record.

; Reset the textbox state flags (called on room load via
; j_ResetTextboxState).
ResetTextboxState:
		clr.b	(g_TextboxState).l
		rts

RunShopWelcome:
		movem.l	d0-a6,-(sp)
		moveq	#$00000004,d1
		moveq	#$FFFFFFFF,d2
		bsr.s	RunShopDialogue
		movem.l	(sp)+,d0-a6
		rts

RunShopFarewell:
		movem.l	d0-a6,-(sp)
		moveq	#$00000006,d1
		moveq	#$FFFFFFFF,d2
		bsr.s	RunShopDialogue
		movem.l	(sp)+,d0-a6
		rts

; Picking up a shop item: in a room with a ShopScript record the
; shopkeeper reacts (script +$8); with no record the item is simply
; granted (GainItem) - the free-pickup case.
RunShopItemPickUp:
		movem.l	d0-a6,-(sp)
		bsr.w	FindShopForRoom
		bcc.s	_rsipShop
		bsr.w	GainItem
		bra.s	_rsipDone
; ---------------------------------------------------------------------------

_rsipShop:
		moveq	#$00000008,d1
		moveq	#$00000004,d2
		bsr.s	RunShopDialogue

_rsipDone:
		movem.l	(sp)+,d0-a6
		rts

RunShopItemPutDown:
		movem.l	d0-a6,-(sp)
		moveq	#$0000000A,d1
		moveq	#$00000006,d2
		bsr.s	RunShopDialogue
		movem.l	(sp)+,d0-a6
		rts

RunShopSteal:
		movem.l	d0-a6,-(sp)
		moveq	#$0000000C,d1
		moveq	#$00000008,d2
		bsr.s	RunShopDialogue
		movem.l	(sp)+,d0-a6
		rts

; Run shop line d1 (a ShopScript record offset) for the current
; room. Needs a plain scriptless speaker present (GetSpriteDialogue)
; and resolves speaker slot 0 first. When d2 is a special-items
; column (+4 pickup / +6 putdown / +8 steal, -1 = none), a matching
; ShopSpecialItemsScript entry runs instead of the default line.
RunShopDialogue:
		movem.l	d0/a0-a1,-(sp)
		bsr.w	GetSpriteDialogue
		bne.s	_rsdDone
		clr.b	(g_currentSpeakerScriptID).l
		bsr.w	GetSpeakerCharacter
		bcs.s	_rsdDone
		bsr.w	FindShopOrError
		bcs.s	_rsdDone
		tst.b	d2
		blt.s	_rsdDefault
		bsr.w	RunShopSpecialItemScript
		bcc.s	_rsdDone

_rsdDefault:
		move.w	(a1,d1.w),d0
		lea	ShopScript(pc),a0	  ; Massan Shop
		bsr.w	RunTextCmd

_rsdDone:
		movem.l	(sp)+,d0/a0-a1
		rts

; Grant the picked-up shop item (g_ShopItemId) outside a shop:
; full inventory prints the "can't carry" line and leaves the
; sprite; with flag $13B set two alternate strings show instead;
; otherwise the item is given with the chest jingle and "found/got"
; strings, and the sprite is marked consumed ($FF).
GainItem:
		movem.l	d0-d2/a1,-(sp)
		clr.w	d2
		move.b	(g_ShopItemId).l,d2
		move.w	d2,(g_CurrentTextItem).l
		move.w	d2,d0
		bsr.w	GetRemainingItemAllowedCount
		bne.s	_giNotFull
	if ((REGION=FR)!(REGION=DE))
		moveq	#1,d0
		bsr.w	GetItemFoundString
	else
		move.w	#$12,d0			  ; Can't carry any more
	endif
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		bra.s	_giDone
; ---------------------------------------------------------------------------

_giNotFull:
		move.w	#$013B,d0
		bsr.w	TestFlagBit
		beq.s	_giGrant
	if ((REGION=FR)!(REGION=DE))
		moveq	#6,d0
		bsr.w	GetItemFoundString
	else
		move.w	#$0017,d0
	endif
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
	if ((REGION=FR)!(REGION=DE))
		moveq	#7,d0
		bsr.w	GetItemFoundString
	else
		move.w	#$0018,d0
	endif
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		bsr.w	ScriptSleep
; ---------------------------------------------------------------------------
		dc.w 00119
; ---------------------------------------------------------------------------
		bra.s	_giConsume
; ---------------------------------------------------------------------------

_giGrant:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicChestOpen
; ---------------------------------------------------------------------------
		move.w	d2,d0
		bsr.w	GetItem
	if ((REGION=FR)!(REGION=DE))
		clr.w	d0
		bsr.w	GetItemFoundString
	else
		move.w	#$0011,d0		  ; Found ITEM
	endif
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
	if ((REGION=FR)!(REGION=DE))
		moveq	#2,d0
		bsr.w	GetItemFoundString
	else
		move.w	#$0013,d0		  ; Got	ITEM
	endif
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		jsr	(j_RestoreBGM).l

_giConsume:
		move.b	#$FF,(g_ShopItemId).l	  ; Despawn the shop-item sprite

_giDone:
		bsr.w	ClearTextbox
		movem.l	(sp)+,d0-d2/a1
		rts

; Look for a ShopSpecialItemsScript entry matching the current shop
; item (d0 from GetItemShopSellPrice) and room, and run its script
; word at column d2. Carry clear = a special script ran, carry set =
; no entry (caller runs the default line).
RunShopSpecialItemScript:
		movem.l	d0-d1/a0,-(sp)
		bsr.w	GetItemShopSellPrice
		lea	ShopSpecialItemsScript(pc),a0

_rssRecord:
		move.b	(a0),d1
		blt.s	_rssNone
		cmp.b	d0,d1
		bne.s	_rssSkip
		move.w	$00000002(a0),d1
		blt.s	_rssRun			  ; Negative room = any
		cmp.w	(g_OriginalRoom).l,d1
		beq.s	_rssRun

_rssSkip:
		clr.w	d1
		move.b	$00000001(a0),d1	  ; Record length
		adda.w	d1,a0
		bra.s	_rssRecord
; ---------------------------------------------------------------------------

_rssRun:
		move.w	(a0,d2.w),d0
		bsr.w	RunTextCmd
		or.w	d0,d0			  ; Clear carry: handled

_rssDone:
		movem.l	(sp)+,d0-d1/a0
		rts
; ---------------------------------------------------------------------------

_rssNone:
		ori	#$01,ccr
		bra.s	_rssDone

	modend
