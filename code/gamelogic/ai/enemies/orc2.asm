; ---------------------------------------------------------------------------

EnemyAI_Orc2_B:					  ; CODE XREF: ROM:001A84B2j
		bra.s	EnemyAI_Orc2
; ---------------------------------------------------------------------------

EnemyAI_Orc2_A:					  ; CODE XREF: ROM:001A84AEj
		btst	#$01,Flags2(a5)
		bne.s	loc_1A4ECE
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A4ED4
		cmpi.b	#$10,d0
		beq.s	loc_1A4F00
		bra.w	loc_1A5078
; ---------------------------------------------------------------------------

loc_1A4ECE:					  ; CODE XREF: ROM:001A4EBCj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A4ED4:					  ; CODE XREF: ROM:001A4EC2j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Orc2
		rts
; ---------------------------------------------------------------------------

EnemyAI_Orc2:					  ; CODE XREF: ROM:EnemyAI_Orc2_Bj
						  ; ROM:001A4EF8j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A4F00:					  ; CODE XREF: ROM:001A4EC8j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A4F30
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A4F34
		bcs.s	loc_1A4F2A
		bsr.s	sub_1A4F82
		bcs.s	loc_1A4F2A
		bsr.w	sub_1A4FD0
		bcs.s	loc_1A4F2A
		bsr.w	sub_1A501E

loc_1A4F2A:					  ; CODE XREF: ROM:001A4F1Aj
						  ; ROM:001A4F1Ej ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A4F30:					  ; CODE XREF: ROM:001A4F06j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A4F34:					  ; CODE XREF: ROM:001A4F18p
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A4F7E
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A4F7E
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0008,d7
		bhi.s	loc_1A4F7E
		move.b	#$20,ChestIndex(a5)
		move.w	#$000E,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A4F7E:					  ; CODE XREF: sub_1A4F34+10j
						  ; sub_1A4F34+22j ...
		tst.b	d0
		rts
; End of function sub_1A4F34


; =============== S U B	R O U T	I N E =======================================


sub_1A4F82:					  ; CODE XREF: ROM:001A4F1Cp
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A4FCC
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A4FCC
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1A4FCC
		move.b	#$21,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A4FCC:					  ; CODE XREF: sub_1A4F82+10j
						  ; sub_1A4F82+22j ...
		tst.b	d0
		rts
; End of function sub_1A4F82


; =============== S U B	R O U T	I N E =======================================


sub_1A4FD0:					  ; CODE XREF: ROM:001A4F20p
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A501A
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A501A
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1A501A
		move.b	#$22,ChestIndex(a5)
		move.w	#$0008,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A501A:					  ; CODE XREF: sub_1A4FD0+10j
						  ; sub_1A4FD0+22j ...
		tst.b	d0
		rts
; End of function sub_1A4FD0


; =============== S U B	R O U T	I N E =======================================


sub_1A501E:					  ; CODE XREF: ROM:001A4F26p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5074
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00060,d7
		bcc.s	loc_1A505A
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A505A:					  ; CODE XREF: sub_1A501E+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5074:					  ; CODE XREF: sub_1A501E+10j
		tst.b	d0
		rts
; End of function sub_1A501E

; ---------------------------------------------------------------------------

loc_1A5078:					  ; CODE XREF: ROM:001A4ECAj
		andi.b	#$0F,d0
		beq.s	loc_1A5092
		cmpi.b	#$01,d0
		beq.s	loc_1A50E0
		cmpi.b	#$02,d0
		beq.s	loc_1A50A4
		cmpi.b	#$03,d0
		beq.s	loc_1A50AA
		bra.s	loc_1A50E0
; ---------------------------------------------------------------------------

loc_1A5092:					  ; CODE XREF: ROM:001A507Cj
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		beq.w	EnemyAI_Orc2
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A50A4:					  ; CODE XREF: ROM:001A5088j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A50AA:					  ; CODE XREF: ROM:001A508Ej
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1A50DE
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1A50DE
		beq.w	EnemyAI_Orc2

locret_1A50DE:					  ; CODE XREF: ROM:001A50BAj
						  ; ROM:001A50D8j
		rts
; ---------------------------------------------------------------------------

loc_1A50E0:					  ; CODE XREF: ROM:001A5082j
						  ; ROM:001A5090j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1A5114
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	loc_1A5114
		beq.w	EnemyAI_Orc2

loc_1A5114:					  ; CODE XREF: ROM:001A50F0j
						  ; ROM:001A510Ej
		bsr.w	j_j_OnTick
		rts
