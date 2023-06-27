
; =============== S U B	R O U T	I N E =======================================


CheckFlagAndDisplayMessage:			  ; CODE XREF: ROM:loc_25E82p
						  ; ROM:ShopEnter_07p ...
		movem.l	d0/a0,-(sp)
		movea.l	$00000008(sp),a0
		move.w	(a0),d0
		bsr.w	TestFlagBit
		beq.s	loc_25DAC
		move.w	$00000002(a0),d0
		bra.s	loc_25DB0
; ---------------------------------------------------------------------------

loc_25DAC:					  ; CODE XREF: CheckFlagAndDisplayMessage+Ej
		move.w	$00000004(a0),d0

loc_25DB0:					  ; CODE XREF: CheckFlagAndDisplayMessage+14j
		bsr.w	RunTextCmd
		addq.l	#$06,$00000008(sp)
		movem.l	(sp)+,d0/a0
		rts
; End of function CheckFlagAndDisplayMessage


; =============== S U B	R O U T	I N E =======================================


SetFlagBitOnTalking:				  ; CODE XREF: ROM:loc_26090p
						  ; ROM:loc_2609Cp ...
		movem.l	d0/a0,-(sp)
		movea.l	$00000008(sp),a0
		move.w	(a0),d0
		bsr.w	TestFlagBit
		bne.s	loc_25DD8
		bsr.w	SetFlagBit
		move.w	$00000002(a0),d0
		bra.s	loc_25DDC
; ---------------------------------------------------------------------------

loc_25DD8:					  ; CODE XREF: SetFlagBitOnTalking+Ej
		move.w	$00000004(a0),d0

loc_25DDC:					  ; CODE XREF: SetFlagBitOnTalking+18j
		bsr.w	RunTextCmd
		addq.l	#$06,$00000008(sp)
		movem.l	(sp)+,d0/a0
		rts
; End of function SetFlagBitOnTalking


; =============== S U B	R O U T	I N E =======================================


HandleYesNoPrompt:				  ; CODE XREF: ROM:CS_0143p
						  ; ROM:loc_26006p ...
		movem.l	d0/a0,-(sp)
		movea.l	$00000008(sp),a0
		move.w	(a0),d0
		bsr.w	RunTextCmd
		bsr.w	GetYesNoAnswer
		bcc.s	loc_25E04
		move.w	$00000002(a0),d0
		bra.s	loc_25E08
; ---------------------------------------------------------------------------

loc_25E04:					  ; CODE XREF: HandleYesNoPrompt+12j
		move.w	$00000004(a0),d0

loc_25E08:					  ; CODE XREF: HandleYesNoPrompt+18j
		bsr.w	RunTextCmd
		addq.l	#$06,$00000008(sp)
		movem.l	(sp)+,d0/a0
		rts
; End of function HandleYesNoPrompt

