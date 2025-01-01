; ---------------------------------------------------------------------------

EnemyAI_Harpy2_B:				  ; CODE XREF: ROM:001A8672j
		bra.s	EnemyAI_Harpy2
; ---------------------------------------------------------------------------

EnemyAI_Harpy2_A:				  ; CODE XREF: ROM:001A866Ej
		btst	#$01,Flags2(a5)
		bne.s	loc_1ADCE8
		move.b	ChestIndex(a5),d0
		beq.s	loc_1ADCEE
		cmpi.b	#$10,d0
		beq.s	loc_1ADD2C
		bra.w	loc_1ADEA4
; ---------------------------------------------------------------------------

loc_1ADCE8:					  ; CODE XREF: ROM:001ADCD6j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ADCEE:					  ; CODE XREF: ROM:001ADCDCj
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		rts
; ---------------------------------------------------------------------------

EnemyAI_Harpy2:					  ; CODE XREF: ROM:EnemyAI_Harpy2_Bj
						  ; ROM:001ADEC6j ...
		move.w	#$0004,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ADD2C:					  ; CODE XREF: ROM:001ADCE2j
		tst.b	(byte_FF1142).l
		bne.s	loc_1ADD5C
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1ADD60
		bcs.s	loc_1ADD56
		bsr.s	sub_1ADDAE
		bcs.s	loc_1ADD56
		bsr.w	sub_1ADDFC
		bcs.s	loc_1ADD56
		bsr.w	sub_1ADE4A

loc_1ADD56:					  ; CODE XREF: ROM:001ADD46j
						  ; ROM:001ADD4Aj ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ADD5C:					  ; CODE XREF: ROM:001ADD32j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1ADD60:					  ; CODE XREF: ROM:001ADD44p
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADDAA
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ADDAA
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1ADDAA
		move.b	#$20,ChestIndex(a5)
		move.w	#$000E,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADDAA:					  ; CODE XREF: sub_1ADD60+10j
						  ; sub_1ADD60+22j ...
		tst.b	d0
		rts
; End of function sub_1ADD60


; =============== S U B	R O U T	I N E =======================================


sub_1ADDAE:					  ; CODE XREF: ROM:001ADD48p
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADDF8
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ADDF8
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1ADDF8
		move.b	#$21,ChestIndex(a5)
		move.w	#$0007,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADDF8:					  ; CODE XREF: sub_1ADDAE+10j
						  ; sub_1ADDAE+22j ...
		tst.b	d0
		rts
; End of function sub_1ADDAE


; =============== S U B	R O U T	I N E =======================================


sub_1ADDFC:					  ; CODE XREF: ROM:001ADD4Cp
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADE46
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ADE46
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1ADE46
		move.b	#$22,ChestIndex(a5)
		move.w	#$0008,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADE46:					  ; CODE XREF: sub_1ADDFC+10j
						  ; sub_1ADDFC+22j ...
		tst.b	d0
		rts
; End of function sub_1ADDFC


; =============== S U B	R O U T	I N E =======================================


sub_1ADE4A:					  ; CODE XREF: ROM:001ADD52p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADEA0
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	loc_1ADE86
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADE86:					  ; CODE XREF: sub_1ADE4A+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0009,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADEA0:					  ; CODE XREF: sub_1ADE4A+10j
		tst.b	d0
		rts
; End of function sub_1ADE4A

; ---------------------------------------------------------------------------

loc_1ADEA4:					  ; CODE XREF: ROM:001ADCE4j
		andi.b	#$0F,d0
		beq.s	loc_1ADEBE
		cmpi.b	#$01,d0
		beq.s	loc_1ADECA
		cmpi.b	#$02,d0
		beq.s	loc_1ADECA
		cmpi.b	#$03,d0
		beq.s	loc_1ADED0
		bra.s	loc_1ADED0
; ---------------------------------------------------------------------------

loc_1ADEBE:					  ; CODE XREF: ROM:001ADEA8j
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		beq.w	EnemyAI_Harpy2

loc_1ADECA:					  ; CODE XREF: ROM:001ADEAEj
						  ; ROM:001ADEB4j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ADED0:					  ; CODE XREF: ROM:001ADEBAj
						  ; ROM:001ADEBCj
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1ADF04
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1ADF04
		beq.w	EnemyAI_Harpy2

locret_1ADF04:					  ; CODE XREF: ROM:001ADEE0j
						  ; ROM:001ADEFEj
		rts
