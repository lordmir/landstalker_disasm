
; =============== S U B	R O U T	I N E =======================================

; d0 - current talker script
; d1 - current talker sprite ID

GetSpeakerSpriteId:				  ; DATA XREF: j_GetSpeakerSpriteIdt
		movem.l	d0/d7-a0,-(sp)
		lea	(Sprite1_X).l,a0
		moveq	#$0000000E,d7

loc_9C8E:					  ; CODE XREF: GetSpeakerSpriteId+22j
		btst	#$04,Flags2(a0)
		beq.s	loc_9CA0
		move.b	Dialogue(a0),d1
		lsr.b	#$02,d1
		cmp.b	d1,d0
		beq.s	loc_9CB2

loc_9CA0:					  ; CODE XREF: GetSpeakerSpriteId+12j
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,loc_9C8E
		movem.l	(sp)+,d0/d7-a0
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_9CB2:					  ; CODE XREF: GetSpeakerSpriteId+1Cj
		move.w	Dialogue(a0),d1
		andi.w	#$03FF,d1
		movem.l	(sp)+,d0/d7-a0
		tst.b	d0
		rts
; End of function GetSpeakerSpriteId


; =============== S U B	R O U T	I N E =======================================


SetLifestockSoldFlag:				  ; DATA XREF: j_SetLifestockSoldFlagt
		movem.l	d0-d1/a0,-(sp)
		bsr.s	ReadLifestockSoldFlag
		bcs.s	loc_9CD0
		bset	d1,(a0,d0.w)
		tst.b	d0

loc_9CD0:					  ; CODE XREF: SetLifestockSoldFlag+6j
		movem.l	(sp)+,d0-d1/a0
		rts
; End of function SetLifestockSoldFlag


; =============== S U B	R O U T	I N E =======================================


ReadLifestockSoldFlag:				  ; CODE XREF: SetLifestockSoldFlag+4p
						  ; CheckIfLifestockSold+4p
		lea	LifestockSoldFlags(pc),a0

loc_9CDA:					  ; CODE XREF: ReadLifestockSoldFlag+12j
		move.w	(a0),d0
		bmi.s	loc_9CFE
		cmp.w	(g_RmNum1).l,d0
		beq.s	loc_9CEA
		addq.l	#$04,a0
		bra.s	loc_9CDA
; ---------------------------------------------------------------------------

loc_9CEA:					  ; CODE XREF: ReadLifestockSoldFlag+Ej
		move.b	$00000002(a0),d0
		ext.w	d0
		move.b	$00000003(a0),d1
		lea	(g_Flags).l,a0
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_9CFE:					  ; CODE XREF: ReadLifestockSoldFlag+6j
		ori	#$01,ccr
		rts
; End of function ReadLifestockSoldFlag


; =============== S U B	R O U T	I N E =======================================


CheckIfLifestockSold:				  ; DATA XREF: j_CheckIfLifestockSoldt
		movem.l	d0-d1/a0,-(sp)
		bsr.s	ReadLifestockSoldFlag
		bcs.s	loc_9D12
		tst.b	d0
		btst	d1,(a0,d0.w)

loc_9D12:					  ; CODE XREF: CheckIfLifestockSold+6j
		movem.l	(sp)+,d0-d1/a0
		rts
; End of function CheckIfLifestockSold

; ---------------------------------------------------------------------------
