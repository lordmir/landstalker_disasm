
; =============== S U B	R O U T	I N E =======================================


TestPlayerStatus:				  ; CODE XREF: ROM:00024F6Cp
						  ; ROM:000274F4p
		movem.w	d0-d1,-(sp)
		move.b	d0,d1
		jsr	(j_GetPlayerStatus).l
		and.b	d1,d0
		movem.w	(sp)+,d0-d1
		rts
; End of function TestPlayerStatus


; =============== S U B	R O U T	I N E =======================================


RemoveStatus:					  ; CODE XREF: ROM:00024FBCp
						  ; ROM:00025094p
		movem.l	d0-d1/a5,-(sp)
		move.b	d0,d1
		moveq	#$00000003,d0

loc_2916A:					  ; CODE XREF: RemoveStatus:loc_29174j
		btst	d0,d1
		beq.s	loc_29174
		jsr	(j_ClearPlayerStatus).l

loc_29174:					  ; CODE XREF: RemoveStatus+Aj
		dbf	d0,loc_2916A
		btst	#$07,d1
		beq.s	loc_2918C
		moveq	#$FFFFFFFF,d0
		lea	(Player_X).l,a5
		jsr	(j_AddHealth).l

loc_2918C:					  ; CODE XREF: RemoveStatus+1Aj
		movem.l	(sp)+,d0-d1/a5
		rts
; End of function RemoveStatus


; =============== S U B	R O U T	I N E =======================================


GetItemQtyAndMaxQty:				  ; CODE XREF: GetItem:loc_29202p
						  ; CheckAndConsumeItem+2p ...
		move.l	a0,-(sp)
		bsr.w	GetItemInventoryQty
		subq.w	#$01,d1
		bsr.w	GetItemProperties
		move.b	(a0),d2
		andi.w	#$000F,d2
		cmpi.w	#$0001,d2
		ble.s	loc_291AE
		clr.w	d2
		bra.s	loc_291B2
; ---------------------------------------------------------------------------

loc_291AE:					  ; CODE XREF: GetItemQtyAndMaxQty+16j
		move.w	#$0001,d2

loc_291B2:					  ; CODE XREF: GetItemQtyAndMaxQty+1Aj
		movea.l	(sp)+,a0
		rts
; End of function GetItemQtyAndMaxQty


; =============== S U B	R O U T	I N E =======================================


AddItem:					  ; CODE XREF: GetItem+36p
						  ; CheckAndConsumeItem:loc_2922Cp ...
		movem.l	d1-d2/a0,-(sp)
		move.b	d1,d2
		ext.w	d2
		bsr.w	GetItemMaxQty
		cmp.w	d1,d2
		ble.s	loc_291C8
		move.w	d1,d2

loc_291C8:					  ; CODE XREF: AddItem+Ej
		addq.w	#$01,d2
		move.w	d2,d1
		bsr.w	UpdateItemQtyInInventory
		movem.l	(sp)+,d1-d2/a0
		rts
; End of function AddItem


; =============== S U B	R O U T	I N E =======================================


GetItem:					  ; CODE XREF: ROM:00024B1Cp
						  ; HandleShopInterraction+36p	...
		movem.l	d0-a6,-(sp)
		cmpi.b	#ITM_LIFESTOCK,d0
		bne.s	loc_29202
		move.w	#$0100,d0
		lea	(Player_X).l,a5
		jsr	(j_AddToMaxHealth).l
		move.w	#$0100,d0
		jsr	(j_AddHealth).l
		jsr	(j_SetLifestockSoldFlag).l
		bra.s	loc_29212
; ---------------------------------------------------------------------------

loc_29202:					  ; CODE XREF: GetItem+8j
		bsr.s	GetItemQtyAndMaxQty
		tst.w	d1
		bge.s	loc_2920A
		clr.w	d1

loc_2920A:					  ; CODE XREF: GetItem+30j
		addq.w	#$01,d1
		bsr.s	AddItem
		tst.b	d0
		bne.s	loc_29216

loc_29212:					  ; CODE XREF: GetItem+2Aj
		bsr.w	UpdateEkeEke

loc_29216:					  ; CODE XREF: GetItem+3Aj
		movem.l	(sp)+,d0-a6
		rts
; End of function GetItem


; =============== S U B	R O U T	I N E =======================================


CheckAndConsumeItem:				  ; CODE XREF: ROM:000277A8p
						  ; DATA XREF: j_CheckAndConsumeItemt
		move.l	d1,-(sp)
		bsr.w	GetItemQtyAndMaxQty
		tst.w	d1
		bge.s	loc_29228
		clr.w	d1

loc_29228:					  ; CODE XREF: CheckAndConsumeItem+8j
		ble.s	loc_2922C
		subq.w	#$01,d1

loc_2922C:					  ; CODE XREF: CheckAndConsumeItem:loc_29228j
		bsr.s	AddItem
		move.l	(sp)+,d1
		rts
; End of function CheckAndConsumeItem


; =============== S U B	R O U T	I N E =======================================


GetRemainingItemAllowedCount:			  ; CODE XREF: ROM:00024AE4p
						  ; ROM:000276AAp
						  ; DATA XREF: ...
		movem.l	d2,-(sp)
		bsr.w	GetItemQtyAndMaxQty
		move.w	d1,d2
		bge.s	loc_29240
		clr.w	d2

loc_29240:					  ; CODE XREF: GetRemainingItemAllowedCount+Aj
		bsr.w	GetItemMaxQty
		sub.w	d2,d1
		movem.l	(sp)+,d2
		rts
; End of function GetRemainingItemAllowedCount


; =============== S U B	R O U T	I N E =======================================


CheckIfItemIsOwned:				  ; CODE XREF: ROM:00026BBEp
						  ; ROM:000272ECp ...
		movem.w	d1,-(sp)
		bsr.w	GetItemQtyAndMaxQty
		tst.w	d1
		bge.s	loc_2925A
		clr.w	d1

loc_2925A:					  ; CODE XREF: CheckIfItemIsOwned+Aj
		movem.w	(sp)+,d1
		rts
; End of function CheckIfItemIsOwned


; =============== S U B	R O U T	I N E =======================================


GetItemInventoryQty:				  ; CODE XREF: GetItemQtyAndMaxQty+2p
		movem.l	d0/a0,-(sp)
		lea	(g_Inventory).l,a0
		andi.w	#$003F,d0
		asr.w	#$01,d0
		bcc.s	loc_2927A
		move.b	(a0,d0.w),d1
		lsr.b	#$04,d1
		bra.s	loc_2927E
; ---------------------------------------------------------------------------

loc_2927A:					  ; CODE XREF: GetItemInventoryQty+10j
		move.b	(a0,d0.w),d1

loc_2927E:					  ; CODE XREF: GetItemInventoryQty+18j
		andi.w	#$000F,d1
		movem.l	(sp)+,d0/a0
		rts
; End of function GetItemInventoryQty


; =============== S U B	R O U T	I N E =======================================


UpdateItemQtyInInventory:			  ; CODE XREF: AddItem+16p
		movem.l	d0-d1/a0,-(sp)
		lea	(g_Inventory).l,a0
		andi.w	#$003F,d0
		asr.w	#$01,d0
		bcc.s	loc_292A4
		andi.b	#$0F,(a0,d0.w)
		lsl.b	#$04,d1
		bra.s	loc_292AE
; ---------------------------------------------------------------------------

loc_292A4:					  ; CODE XREF: UpdateItemQtyInInventory+10j
		andi.b	#$F0,(a0,d0.w)
		andi.b	#$0F,d1

loc_292AE:					  ; CODE XREF: UpdateItemQtyInInventory+1Aj
		or.b	d1,(a0,d0.w)
		movem.l	(sp)+,d0-d1/a0
		rts
; End of function UpdateItemQtyInInventory


; =============== S U B	R O U T	I N E =======================================


GetItemMaxQty:					  ; CODE XREF: AddItem+8p
						  ; GetRemainingItemAllowedCount:loc_29240p ...
		move.l	a0,-(sp)
		bsr.s	GetItemProperties
		move.b	(a0),d1
		andi.w	#$000F,d1
		movea.l	(sp)+,a0
		rts
; End of function GetItemMaxQty


; =============== S U B	R O U T	I N E =======================================


GetItemUseStringIdx:				  ; DATA XREF: j_GetItemUseStringIdxt
		move.l	a0,-(sp)
		bsr.s	GetItemProperties
		move.b	(a0),d1
		andi.w	#$00F0,d1
		lsr.w	#$04,d1
		addi.w	#$000C,d1
		movea.l	(sp)+,a0
		rts
; End of function GetItemUseStringIdx


; =============== S U B	R O U T	I N E =======================================


GetItemEquipSlot:				  ; DATA XREF: ROM:00022ED8t
		move.l	a0,-(sp)
		bsr.s	GetItemProperties
		move.b	$00000001(a0),d1
		ext.w	d1
		movea.l	(sp)+,a0
		rts
; End of function GetItemEquipSlot


; =============== S U B	R O U T	I N E =======================================


GetItemRSP:					  ; CODE XREF: GetItemShopSellPrice+10p
						  ; DATA XREF: ROM:00022EDCt
		move.l	a0,-(sp)
		bsr.s	GetItemProperties
		move.w	$00000002(a0),d1
		movea.l	(sp)+,a0
		rts
; End of function GetItemRSP


; =============== S U B	R O U T	I N E =======================================


GetItemProperties:				  ; CODE XREF: GetItemQtyAndMaxQty+8p
						  ; GetItemMaxQty+2p ...
		move.l	d0,-(sp)
		andi.w	#$003F,d0
		asl.w	#$02,d0
		lea	ItemProperties(pc,d0.w),a0 ; EkeEke
		move.l	(sp)+,d0
		rts
; End of function GetItemProperties

; ---------------------------------------------------------------------------
