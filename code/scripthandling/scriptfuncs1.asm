
; =============== S U B	R O U T	I N E =======================================


GetSpriteDialogue:				  ; CODE XREF: sub_24A98+4p
		movem.l	d0/a0,-(sp)
		lea	(Sprite1_X).l,a0

loc_24EC8:					  ; CODE XREF: GetSpriteDialogue+2Aj
		move.w	(a0),d0
		bmi.s	loc_24EEA
		cmpi.w	#$7F7F,d0
		beq.s	loc_24EE4
		btst	#$04,Flags2(a0)		  ; Has	dialogue
		beq.s	loc_24EE4
		move.b	Dialogue(a0),d0		  ; Dialogue Script
		andi.b	#$FC,d0
		beq.s	loc_24EEA

loc_24EE4:					  ; CODE XREF: GetSpriteDialogue+12j
						  ; GetSpriteDialogue+1Aj
		lea	SPRITE_SIZE(a0),a0
		bra.s	loc_24EC8
; ---------------------------------------------------------------------------

loc_24EEA:					  ; CODE XREF: GetSpriteDialogue+Cj
						  ; GetSpriteDialogue+24j
		movem.l	(sp)+,d0/a0
		rts
; End of function GetSpriteDialogue


; =============== S U B	R O U T	I N E =======================================


DisplayItemPriceMessage:			  ; CODE XREF: ROM:ShopPrice_01p
						  ; ROM:ShopPrice_02p ...
		movem.l	d0-d1/a0,-(sp)
		bsr.w	GetItemShopSellPrice
		movea.l	$0000000C(sp),a0	  ; Previous stack pointer
		move.w	(a0),d0
		bsr.w	RunTextCmd
		movem.l	(sp)+,d0-d1/a0

loc_24F06:
		addq.l	#$04,sp
		rts
; End of function DisplayItemPriceMessage


; =============== S U B	R O U T	I N E =======================================


HandleShopInterraction:				  ; CODE XREF: ROM:Shop_01p
						  ; ROM:Shop_02p ...
		movem.l	d0-d2/a0,-(sp)
		bsr.w	GetItemShopSellPrice
		move.w	d0,d2
		movea.l	$00000010(sp),a0	  ; Previous stack pointer
		move.w	(a0),d0			  ; Item price
		bsr.w	RunTextCmd
		bsr.w	GetYesNoAnswer
		bcs.s	loc_24F2A
		move.w	$00000006(a0),d0	  ; Refused sale
		bra.s	loc_24F50
; ---------------------------------------------------------------------------

loc_24F2A:					  ; CODE XREF: HandleShopInterraction+18j
		move.w	d1,d0
		jsr	(j_RemoveGold).l
		bcc.s	loc_24F3E
		bsr.w	NoMoneyEffect
		move.w	$00000004(a0),d0	  ; Not	enough money
		bra.s	loc_24F50
; ---------------------------------------------------------------------------

loc_24F3E:					  ; CODE XREF: HandleShopInterraction+28j
		move.w	d2,d0
		bsr.w	GetItem
		move.w	$00000002(a0),d0	  ; Purchased
		move.b	#$FF,(byte_FF1903).l

loc_24F50:					  ; CODE XREF: HandleShopInterraction+1Ej
						  ; HandleShopInterraction+32j
		bsr.w	RunTextCmd
		bsr.w	sub_29026
		movem.l	(sp)+,d0-d2/a0
		addq.l	#$04,sp
		rts
; End of function HandleShopInterraction

