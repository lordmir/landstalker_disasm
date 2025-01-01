
; =============== S U B	R O U T	I N E =======================================


sub_24A34:					  ; DATA XREF: sub_22EC0t
		clr.b	(byte_FF1902).l
		rts
; End of function sub_24A34


; =============== S U B	R O U T	I N E =======================================


sub_24A3C:					  ; DATA XREF: sub_22EA4t
		movem.l	d0-a6,-(sp)
		moveq	#$00000004,d1
		moveq	#$FFFFFFFF,d2
		bsr.s	sub_24A98
		movem.l	(sp)+,d0-a6
		rts
; End of function sub_24A3C


; =============== S U B	R O U T	I N E =======================================


sub_24A4C:					  ; DATA XREF: sub_22EA8t
		movem.l	d0-a6,-(sp)
		moveq	#$00000006,d1
		moveq	#$FFFFFFFF,d2
		bsr.s	sub_24A98
		movem.l	(sp)+,d0-a6
		rts
; End of function sub_24A4C


; =============== S U B	R O U T	I N E =======================================


sub_24A5C:					  ; DATA XREF: sub_22EACt
		movem.l	d0-a6,-(sp)
		bsr.w	sub_24D0C
		bcc.s	loc_24A6C
		bsr.w	GainItem
		bra.s	loc_24A72
; ---------------------------------------------------------------------------

loc_24A6C:					  ; CODE XREF: sub_24A5C+8j
		moveq	#$00000008,d1
		moveq	#$00000004,d2
		bsr.s	sub_24A98

loc_24A72:					  ; CODE XREF: sub_24A5C+Ej
		movem.l	(sp)+,d0-a6
		rts
; End of function sub_24A5C


; =============== S U B	R O U T	I N E =======================================


sub_24A78:					  ; DATA XREF: sub_22EB0t
		movem.l	d0-a6,-(sp)
		moveq	#$0000000A,d1
		moveq	#$00000006,d2
		bsr.s	sub_24A98
		movem.l	(sp)+,d0-a6
		rts
; End of function sub_24A78


; =============== S U B	R O U T	I N E =======================================


sub_24A88:					  ; DATA XREF: sub_22EB4t
		movem.l	d0-a6,-(sp)
		moveq	#$0000000C,d1
		moveq	#$00000008,d2
		bsr.s	sub_24A98
		movem.l	(sp)+,d0-a6
		rts
; End of function sub_24A88


; =============== S U B	R O U T	I N E =======================================


sub_24A98:					  ; CODE XREF: sub_24A3C+8p
						  ; sub_24A4C+8p ...
		movem.l	d0/a0-a1,-(sp)
		bsr.w	GetSpriteDialogue
		bne.s	loc_24ACA
		clr.b	(g_currentSpeakerScriptID).l
		bsr.w	loc_251D0
		bcs.s	loc_24ACA
		bsr.w	loc_24CF6
		bcs.s	loc_24ACA
		tst.b	d2
		blt.s	loc_24ABE
		bsr.w	sub_24B48
		bcc.s	loc_24ACA

loc_24ABE:					  ; CODE XREF: sub_24A98+1Ej
		move.w	(a1,d1.w),d0
		lea	ShopScript(pc),a0	  ; Massan Shop
		bsr.w	RunTextCmd

loc_24ACA:					  ; CODE XREF: sub_24A98+8j
						  ; sub_24A98+14j ...
		movem.l	(sp)+,d0/a0-a1
		rts
; End of function sub_24A98

; ---------------------------------------------------------------------------

GainItem:					  ; CODE XREF: sub_24A5C+Ap
		movem.l	d0-d2/a1,-(sp)
		clr.w	d2
		move.b	(byte_FF1903).l,d2
		move.w	d2,(word_FF1196).l
		move.w	d2,d0
		bsr.w	GetRemainingItemAllowedCount
		bne.s	loc_24AF4
		move.w	#$0012,d0
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		bra.s	loc_24B3E
; ---------------------------------------------------------------------------

loc_24AF4:					  ; CODE XREF: ROM:00024AE8j
		move.w	#$013B,d0
		bsr.w	TestFlagBit
		beq.s	loc_24B16
		move.w	#$0017,d0
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		move.w	#$0018,d0
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		bsr.w	Sleep_0
; ---------------------------------------------------------------------------
		dc.w 00119
; ---------------------------------------------------------------------------
		bra.s	loc_24B36
; ---------------------------------------------------------------------------

loc_24B16:					  ; CODE XREF: ROM:00024AFCj
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicChestOpen
; ---------------------------------------------------------------------------
		move.w	d2,d0
		bsr.w	GetItem
		move.w	#$0011,d0
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		move.w	#$0013,d0
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		jsr	(j_RestoreBGM).l

loc_24B36:					  ; CODE XREF: ROM:00024B14j
		move.b	#$FF,(byte_FF1903).l

loc_24B3E:					  ; CODE XREF: ROM:00024AF2j
		bsr.w	ClearTextbox
		movem.l	(sp)+,d0-d2/a1
		rts

; =============== S U B	R O U T	I N E =======================================


sub_24B48:					  ; CODE XREF: sub_24A98+20p
		movem.l	d0-d1/a0,-(sp)
		bsr.w	GetItemShopSellPrice
		lea	ShopSpecialItemsScript(pc),a0

loc_24B54:					  ; CODE XREF: sub_24B48+2Aj
		move.b	(a0),d1
		blt.s	loc_24B84
		cmp.b	d0,d1
		bne.s	loc_24B6A
		move.w	$00000002(a0),d1
		blt.s	loc_24B74
		cmp.w	(RmNum2).l,d1
		beq.s	loc_24B74

loc_24B6A:					  ; CODE XREF: sub_24B48+12j
		clr.w	d1
		move.b	$00000001(a0),d1
		adda.w	d1,a0
		bra.s	loc_24B54
; ---------------------------------------------------------------------------

loc_24B74:					  ; CODE XREF: sub_24B48+18j
						  ; sub_24B48+20j
		move.w	(a0,d2.w),d0
		bsr.w	RunTextCmd
		or.w	d0,d0

loc_24B7E:					  ; CODE XREF: sub_24B48+40j
		movem.l	(sp)+,d0-d1/a0
		rts
; ---------------------------------------------------------------------------

loc_24B84:					  ; CODE XREF: sub_24B48+Ej
		ori	#$01,ccr
		bra.s	loc_24B7E
; End of function sub_24B48

; ---------------------------------------------------------------------------
