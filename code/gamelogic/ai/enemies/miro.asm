; ---------------------------------------------------------------------------

EnemyAI_Miro_B:					  ; CODE XREF: ROM:001A85E2j
						  ; ROM:001A868Aj
		bra.s	EnemyAI_Miro
; ---------------------------------------------------------------------------

EnemyAI_Miro_A:					  ; CODE XREF: ROM:001A85DEj
						  ; ROM:001A8686j
		btst	#$01,Flags2(a5)
		bne.s	loc_1ABC2E
		move.b	ChestIndex(a5),d0
		beq.s	EnemyAI_Miro
		cmpi.b	#$10,d0
		beq.s	loc_1ABC4C
		bra.w	loc_1ABE36
; ---------------------------------------------------------------------------

loc_1ABC2E:					  ; CODE XREF: ROM:001ABC1Cj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

EnemyAI_Miro:					  ; CODE XREF: ROM:EnemyAI_Miro_Bj
						  ; ROM:001ABC22j ...
		move.w	#$0180,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABC4C:					  ; CODE XREF: ROM:001ABC28j
		tst.b	(byte_FF1142).l
		bne.s	loc_1ABC8A
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1ABC8E
		bcs.s	loc_1ABC84
		bsr.s	sub_1ABCCE
		bcs.s	loc_1ABC84
		bsr.w	sub_1ABD0E
		bcs.s	loc_1ABC84
		bsr.w	sub_1ABD4E
		bcs.s	loc_1ABC84
		bsr.w	sub_1ABD9A
		bcs.w	loc_1ABC84
		bsr.w	sub_1ABDDA

loc_1ABC84:					  ; CODE XREF: ROM:001ABC66j
						  ; ROM:001ABC6Aj ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ABC8A:					  ; CODE XREF: ROM:001ABC52j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1ABC8E:					  ; CODE XREF: ROM:001ABC64p
		move.w	#$0070,d5
		move.w	#$FFB0,d6
		move.w	#$0018,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ABCCA
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00009,d7
		bhi.s	loc_1ABCCA
		move.b	#$20,ChestIndex(a5)
		move.w	#$0019,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ABCCA:					  ; CODE XREF: sub_1ABC8E+10j
						  ; sub_1ABC8E+20j
		tst.b	d0
		rts
; End of function sub_1ABC8E


; =============== S U B	R O U T	I N E =======================================


sub_1ABCCE:					  ; CODE XREF: ROM:001ABC68p
		move.w	#$0040,d5
		move.w	#$FFD8,d6
		move.w	#$0018,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ABD0A
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	loc_1ABD0A
		move.b	#$21,ChestIndex(a5)
		move.w	#$0012,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ABD0A:					  ; CODE XREF: sub_1ABCCE+10j
						  ; sub_1ABCCE+20j
		tst.b	d0
		rts
; End of function sub_1ABCCE


; =============== S U B	R O U T	I N E =======================================


sub_1ABD0E:					  ; CODE XREF: ROM:001ABC6Cp
		move.w	#$0050,d5
		move.w	#$FFC0,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ABD4A
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1ABD4A
		move.b	#$22,ChestIndex(a5)
		move.w	#$0007,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ABD4A:					  ; CODE XREF: sub_1ABD0E+10j
						  ; sub_1ABD0E+20j
		tst.b	d0
		rts
; End of function sub_1ABD0E


; =============== S U B	R O U T	I N E =======================================


sub_1ABD4E:					  ; CODE XREF: ROM:001ABC72p
		move.w	#$0040,d5
		move.w	#$FFF0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ABD96
		move.b	(Player_Action).l,d0	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		andi.b	#$07,d0
		beq.s	loc_1ABD96
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00090,d7
		bhi.s	loc_1ABD96
		move.b	#$23,ChestIndex(a5)
		move.w	#$017F,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ABD96:					  ; CODE XREF: sub_1ABD4E+10j
						  ; sub_1ABD4E+1Cj ...
		tst.b	d0
		rts
; End of function sub_1ABD4E


; =============== S U B	R O U T	I N E =======================================


sub_1ABD9A:					  ; CODE XREF: ROM:001ABC78p
		move.w	#$0038,d5
		move.w	#$0000,d6
		move.w	#$0018,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ABDD6
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00007,d7
		bhi.s	loc_1ABDD6
		move.b	#$24,ChestIndex(a5)
		move.w	#$0007,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ABDD6:					  ; CODE XREF: sub_1ABD9A+10j
						  ; sub_1ABD9A+20j
		tst.b	d0
		rts
; End of function sub_1ABD9A


; =============== S U B	R O U T	I N E =======================================


sub_1ABDDA:					  ; CODE XREF: ROM:001ABC80p
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0018,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ABE32
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00070,d7
		bcc.s	loc_1ABE18
		bra.s	loc_1ABE18
; ---------------------------------------------------------------------------
		move.b	#$25,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ABE18:					  ; CODE XREF: sub_1ABDDA+20j
						  ; sub_1ABDDA+22j
		move.b	#$26,ChestIndex(a5)
		move.w	#$0181,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ABE32:					  ; CODE XREF: sub_1ABDDA+10j
		tst.b	d0
		rts
; End of function sub_1ABDDA

; ---------------------------------------------------------------------------

loc_1ABE36:					  ; CODE XREF: ROM:001ABC2Aj
		andi.b	#$0F,d0
		beq.w	loc_1ABEC0
		cmpi.b	#$01,d0
		beq.s	loc_1ABEC0
		cmpi.b	#$02,d0
		beq.w	loc_1ABED4
		cmpi.b	#$03,d0
		beq.w	loc_1ABED4
		cmpi.b	#$04,d0
		beq.s	sub_1ABE66
		cmpi.b	#$05,d0
		beq.s	loc_1ABEDA
		bra.w	loc_1ABEE6
; ---------------------------------------------------------------------------
		nop

; =============== S U B	R O U T	I N E =======================================


sub_1ABE66:					  ; CODE XREF: ROM:001ABE58j
						  ; ROM:001ABEC4j ...
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$04,Unk4D(a5)
		bcs.s	loc_1ABEBA
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$000D,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$08,Unk4D(a5)
		bcs.s	loc_1ABEBA
		move.w	#$0300,QueuedAction(a5)
		cmpi.b	#$0C,Unk4D(a5)
		bcs.s	loc_1ABEBA
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$10,Unk4D(a5)
		bcs.s	loc_1ABEBA
		clr.w	QueuedAction(a5)
		clr.b	Unk4D(a5)

loc_1ABEBA:					  ; CODE XREF: sub_1ABE66+10j
						  ; sub_1ABE66+2Ej ...
		bsr.w	j_j_OnTick
		rts
; End of function sub_1ABE66

; ---------------------------------------------------------------------------

loc_1ABEC0:					  ; CODE XREF: ROM:001ABE3Aj
						  ; ROM:001ABE42j
		tst.b	Unk4D(a5)
		bne.s	sub_1ABE66
		btst	#$04,Action1(a5)
		bne.s	sub_1ABE66
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ABED4:					  ; CODE XREF: ROM:001ABE48j
						  ; ROM:001ABE50j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ABEDA:					  ; CODE XREF: ROM:001ABE5Ej
		bsr.s	sub_1ABE66
		tst.w	QueuedAction(a5)
		beq.w	EnemyAI_Miro
		rts
; ---------------------------------------------------------------------------

loc_1ABEE6:					  ; CODE XREF: ROM:001ABE60j
		tst.b	BehavCmd(a5)
		bne.w	loc_1ABF26
		tst.b	Unk4D(a5)
		bne.w	sub_1ABE66
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0018,d7
		bsr.w	sub_1A8964
		bcc.w	EnemyAI_Miro
		tst.b	(byte_FF1142).l
		beq.w	sub_1ABE66
		rts
; ---------------------------------------------------------------------------

loc_1ABF26:					  ; CODE XREF: ROM:001ABEEAj
		clr.w	QueuedAction(a5)
		clr.b	Unk4D(a5)
		bsr.w	j_j_OnTick
		rts
