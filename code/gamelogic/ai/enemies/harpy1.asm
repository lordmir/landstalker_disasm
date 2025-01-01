; ---------------------------------------------------------------------------

EnemyAI_Harpy1_B:				  ; CODE XREF: ROM:001A866Aj
		bra.s	EnemyAI_Harpy1
; ---------------------------------------------------------------------------

EnemyAI_Harpy1_A:				  ; CODE XREF: ROM:001A8666j
		btst	#$01,Flags2(a5)
		bne.s	loc_1ADAB0
		move.b	ChestIndex(a5),d0
		beq.s	loc_1ADAB6
		cmpi.b	#$10,d0
		beq.s	loc_1ADAF4
		bra.w	loc_1ADC6C
; ---------------------------------------------------------------------------

loc_1ADAB0:					  ; CODE XREF: ROM:001ADA9Ej
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ADAB6:					  ; CODE XREF: ROM:001ADAA4j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		rts
; ---------------------------------------------------------------------------

EnemyAI_Harpy1:					  ; CODE XREF: ROM:EnemyAI_Harpy1_Bj
						  ; ROM:001ADC8Ej ...
		move.w	#$0004,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ADAF4:					  ; CODE XREF: ROM:001ADAAAj
		tst.b	(byte_FF1142).l
		bne.s	loc_1ADB24
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1ADB28
		bcs.s	loc_1ADB1E
		bsr.s	sub_1ADB76
		bcs.s	loc_1ADB1E
		bsr.w	sub_1ADBC4
		bcs.s	loc_1ADB1E
		bsr.w	sub_1ADC12

loc_1ADB1E:					  ; CODE XREF: ROM:001ADB0Ej
						  ; ROM:001ADB12j ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ADB24:					  ; CODE XREF: ROM:001ADAFAj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1ADB28:					  ; CODE XREF: ROM:001ADB0Cp
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADB72
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ADB72
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1ADB72
		move.b	#$20,ChestIndex(a5)
		move.w	#$000E,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADB72:					  ; CODE XREF: sub_1ADB28+10j
						  ; sub_1ADB28+22j ...
		tst.b	d0
		rts
; End of function sub_1ADB28


; =============== S U B	R O U T	I N E =======================================


sub_1ADB76:					  ; CODE XREF: ROM:001ADB10p
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADBC0
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ADBC0
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1ADBC0
		move.b	#$21,ChestIndex(a5)
		move.w	#$0007,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADBC0:					  ; CODE XREF: sub_1ADB76+10j
						  ; sub_1ADB76+22j ...
		tst.b	d0
		rts
; End of function sub_1ADB76


; =============== S U B	R O U T	I N E =======================================


sub_1ADBC4:					  ; CODE XREF: ROM:001ADB14p
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADC0E
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ADC0E
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1ADC0E
		move.b	#$22,ChestIndex(a5)
		move.w	#$0008,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADC0E:					  ; CODE XREF: sub_1ADBC4+10j
						  ; sub_1ADBC4+22j ...
		tst.b	d0
		rts
; End of function sub_1ADBC4


; =============== S U B	R O U T	I N E =======================================


sub_1ADC12:					  ; CODE XREF: ROM:001ADB1Ap
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADC68
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	loc_1ADC4E
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADC4E:					  ; CODE XREF: sub_1ADC12+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0009,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADC68:					  ; CODE XREF: sub_1ADC12+10j
		tst.b	d0
		rts
; End of function sub_1ADC12

; ---------------------------------------------------------------------------

loc_1ADC6C:					  ; CODE XREF: ROM:001ADAACj
		andi.b	#$0F,d0
		beq.s	loc_1ADC86
		cmpi.b	#$01,d0
		beq.s	loc_1ADC92
		cmpi.b	#$02,d0
		beq.s	loc_1ADC92
		cmpi.b	#$03,d0
		beq.s	loc_1ADC98
		bra.s	loc_1ADC98
; ---------------------------------------------------------------------------

loc_1ADC86:					  ; CODE XREF: ROM:001ADC70j
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		beq.w	EnemyAI_Harpy1

loc_1ADC92:					  ; CODE XREF: ROM:001ADC76j
						  ; ROM:001ADC7Cj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ADC98:					  ; CODE XREF: ROM:001ADC82j
						  ; ROM:001ADC84j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1ADCCC
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1ADCCC
		beq.w	EnemyAI_Harpy1

locret_1ADCCC:					  ; CODE XREF: ROM:001ADCA8j
						  ; ROM:001ADCC6j
		rts
