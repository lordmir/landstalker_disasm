
; =============== S U B	R O U T	I N E =======================================


GetItemShopSellPrice:				  ; CODE XREF: sub_24B48+4p
						  ; DisplayItemPriceMessage+4p	...
		move.l	d2,-(sp)
		clr.w	d0
		move.b	(byte_FF1903).l,d0
		move.w	d0,(word_FF1198).l
		bsr.w	GetItemBuyPrice
		clr.w	d2
		cmpi.w	#ITM_LIFESTOCK,d0
		bne.s	loc_24CE4		  ; Lifestock price modifier
		move.b	$00000003(a1),d2	  ; Item price modifier
		bra.s	loc_24CE8
; ---------------------------------------------------------------------------

loc_24CE4:					  ; CODE XREF: GetItemShopSellPrice+1Aj
		move.b	$00000002(a1),d2	  ; Lifestock price modifier

loc_24CE8:					  ; CODE XREF: GetItemShopSellPrice+20j
		muls.w	d2,d1
		asr.l	#$04,d1
		move.l	d1,(g_PrintNumericDwordValue).l
		move.l	(sp)+,d2
		rts
; End of function GetItemShopSellPrice

; ---------------------------------------------------------------------------

loc_24CF6:					  ; CODE XREF: sub_24A98+16p
		bsr.s	sub_24D0C
		move	sr,-(sp)
		bcc.s	loc_24D08
		tst.w	(DebugModeEnable).w
		bne.w	loc_24D08
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $0,$0		  ; Run	text script at offset 0x0277F6
						  ; 0xE000: PRINT MSG 0x004D, MSGBOX CLEARED, END: "? ERROR 7{5E}"
; ---------------------------------------------------------------------------

loc_24D08:					  ; CODE XREF: ROM:00024CFAj
						  ; ROM:00024D00j
		move	(sp)+,ccr
		rts

; =============== S U B	R O U T	I N E =======================================


sub_24D0C:					  ; CODE XREF: sub_24A5C+4p
						  ; ROM:loc_24CF6p
		movem.w	d0-d1,-(sp)
		move.w	(RmNum2).l,d0
		lea	ShopScript(pc),a1	  ; Massan Shop

loc_24D1A:					  ; CODE XREF: sub_24D0C+1Aj
		move.w	(a1),d1
		blt.s	loc_24D2E
		cmp.w	d0,d1
		beq.s	loc_24D28
		lea	$0000000E(a1),a1
		bra.s	loc_24D1A
; ---------------------------------------------------------------------------

loc_24D28:					  ; CODE XREF: sub_24D0C+14j
						  ; sub_24D0C+26j
		movem.w	(sp)+,d0-d1
		rts
; ---------------------------------------------------------------------------

loc_24D2E:					  ; CODE XREF: sub_24D0C+10j
		ori	#$01,ccr
		bra.s	loc_24D28
; End of function sub_24D0C

; ---------------------------------------------------------------------------
