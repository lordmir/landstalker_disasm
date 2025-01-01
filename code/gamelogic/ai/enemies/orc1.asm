; ---------------------------------------------------------------------------

EnemyAI_Orc1_B:					  ; CODE XREF: ROM:001A84AAj
		bra.s	EnemyAI_Orc1
; ---------------------------------------------------------------------------

EnemyAI_Orc1_A:					  ; CODE XREF: ROM:loc_1A84A6j
		btst	#$01,Flags2(a5)
		bne.s	loc_1A4CA8
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A4CAE
		cmpi.b	#$10,d0
		beq.s	loc_1A4CDA
		bra.w	loc_1A4E52
; ---------------------------------------------------------------------------

loc_1A4CA8:					  ; CODE XREF: ROM:001A4C96j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A4CAE:					  ; CODE XREF: ROM:001A4C9Cj
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Orc1
		rts
; ---------------------------------------------------------------------------

EnemyAI_Orc1:					  ; CODE XREF: ROM:EnemyAI_Orc1_Bj
						  ; ROM:001A4CD2j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A4CDA:					  ; CODE XREF: ROM:001A4CA2j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A4D0A
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A4D0E
		bcs.s	loc_1A4D04
		bsr.s	sub_1A4D5C
		bcs.s	loc_1A4D04
		bsr.w	sub_1A4DAA
		bcs.s	loc_1A4D04
		bsr.w	sub_1A4DF8

loc_1A4D04:					  ; CODE XREF: ROM:001A4CF4j
						  ; ROM:001A4CF8j ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A4D0A:					  ; CODE XREF: ROM:001A4CE0j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A4D0E:					  ; CODE XREF: ROM:001A4CF2p
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A4D58
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A4D58
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1A4D58
		move.b	#$20,ChestIndex(a5)
		move.w	#$000E,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A4D58:					  ; CODE XREF: sub_1A4D0E+10j
						  ; sub_1A4D0E+22j ...
		tst.b	d0
		rts
; End of function sub_1A4D0E


; =============== S U B	R O U T	I N E =======================================


sub_1A4D5C:					  ; CODE XREF: ROM:001A4CF6p
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A4DA6
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A4DA6
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1A4DA6
		move.b	#$21,ChestIndex(a5)
		move.w	#$0007,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A4DA6:					  ; CODE XREF: sub_1A4D5C+10j
						  ; sub_1A4D5C+22j ...
		tst.b	d0
		rts
; End of function sub_1A4D5C


; =============== S U B	R O U T	I N E =======================================


sub_1A4DAA:					  ; CODE XREF: ROM:001A4CFAp
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A4DF4
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A4DF4
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1A4DF4
		move.b	#$22,ChestIndex(a5)
		move.w	#$0008,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A4DF4:					  ; CODE XREF: sub_1A4DAA+10j
						  ; sub_1A4DAA+22j ...
		tst.b	d0
		rts
; End of function sub_1A4DAA


; =============== S U B	R O U T	I N E =======================================


sub_1A4DF8:					  ; CODE XREF: ROM:001A4D00p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A4E4E
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	loc_1A4E34
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A4E34:					  ; CODE XREF: sub_1A4DF8+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0009,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A4E4E:					  ; CODE XREF: sub_1A4DF8+10j
		tst.b	d0
		rts
; End of function sub_1A4DF8

; ---------------------------------------------------------------------------

loc_1A4E52:					  ; CODE XREF: ROM:001A4CA4j
		andi.b	#$0F,d0
		beq.s	loc_1A4E6C
		cmpi.b	#$01,d0
		beq.s	loc_1A4E78
		cmpi.b	#$02,d0
		beq.s	loc_1A4E78
		cmpi.b	#$03,d0
		beq.s	loc_1A4E7E
		bra.s	loc_1A4E7E
; ---------------------------------------------------------------------------

loc_1A4E6C:					  ; CODE XREF: ROM:001A4E56j
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		beq.w	EnemyAI_Orc1

loc_1A4E78:					  ; CODE XREF: ROM:001A4E5Cj
						  ; ROM:001A4E62j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A4E7E:					  ; CODE XREF: ROM:001A4E68j
						  ; ROM:001A4E6Aj
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1A4EB2
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1A4EB2
		beq.w	EnemyAI_Orc1

locret_1A4EB2:					  ; CODE XREF: ROM:001A4E8Ej
						  ; ROM:001A4EACj
		rts
