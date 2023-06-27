
; =============== S U B	R O U T	I N E =======================================


HandleChurchInterraction:			  ; CODE XREF: ROM:HandleIdentifyRecordBookp
						  ; ROM:RequestGameSaveMsgp ...
		movem.l	d0-a6,-(sp)
		clr.b	d0
		jsr	(j_GetSpeakerSpriteId).l
		movea.l	$0000003C(sp),a0
		cmpi.b	#SPR_SKELETONPRIEST,d1
		bne.s	loc_25F7C
		move.w	$00000002(a0),d0
		bra.s	loc_25F7E
; ---------------------------------------------------------------------------

loc_25F7C:					  ; CODE XREF: HandleChurchInterraction+14j
		move.w	(a0),d0

loc_25F7E:					  ; CODE XREF: HandleChurchInterraction+1Aj
		bsr.w	RunTextCmd
		addq.l	#$04,$0000003C(sp)
		movem.l	(sp)+,d0-a6
		rts
; End of function HandleChurchInterraction

