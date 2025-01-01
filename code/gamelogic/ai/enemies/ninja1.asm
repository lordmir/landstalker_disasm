; ---------------------------------------------------------------------------

EnemyAI_Ninja1_B:				  ; CODE XREF: ROM:001A84DAj
		bra.s	EnemyAI_Ninja1
; ---------------------------------------------------------------------------

EnemyAI_Ninja1_A:				  ; CODE XREF: ROM:001A84D6j
		btst	#$01,Flags2(a5)
		bne.s	loc_1A5F52
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A5F58
		cmpi.b	#$10,d0
		beq.s	loc_1A5F84
		bra.w	loc_1A60DC
; ---------------------------------------------------------------------------

loc_1A5F52:					  ; CODE XREF: ROM:001A5F40j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A5F58:					  ; CODE XREF: ROM:001A5F46j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Ninja1
		rts
; ---------------------------------------------------------------------------

EnemyAI_Ninja1:					  ; CODE XREF: ROM:EnemyAI_Ninja1_Bj
						  ; ROM:001A5F7Cj ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A5F84:					  ; CODE XREF: ROM:001A5F4Cj
		tst.b	(byte_FF1142).l
		bne.s	loc_1A5FB4
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A5FB8
		bcs.s	loc_1A5FAE
		bsr.s	sub_1A5FF8
		bcs.s	loc_1A5FAE
		bsr.w	sub_1A6034
		bcs.s	loc_1A5FAE
		bsr.w	sub_1A6082

loc_1A5FAE:					  ; CODE XREF: ROM:001A5F9Ej
						  ; ROM:001A5FA2j ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A5FB4:					  ; CODE XREF: ROM:001A5F8Aj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A5FB8:					  ; CODE XREF: ROM:001A5F9Cp
		move.w	#$0040,d5
		move.w	#$FFC8,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5FF4
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00037,d7
		bhi.s	loc_1A5FF4
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5FF4:					  ; CODE XREF: sub_1A5FB8+10j
						  ; sub_1A5FB8+20j
		tst.b	d0
		rts
; End of function sub_1A5FB8


; =============== S U B	R O U T	I N E =======================================


sub_1A5FF8:					  ; CODE XREF: ROM:001A5FA0p
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6030
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1A6030
		move.b	#$21,ChestIndex(a5)
		move.w	#$0008,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6030:					  ; CODE XREF: sub_1A5FF8+10j
						  ; sub_1A5FF8+20j
		tst.b	d0
		rts
; End of function sub_1A5FF8


; =============== S U B	R O U T	I N E =======================================


sub_1A6034:					  ; CODE XREF: ROM:001A5FA4p
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A607E
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A607E
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1A607E
		move.b	#$22,ChestIndex(a5)
		move.w	#$0012,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A607E:					  ; CODE XREF: sub_1A6034+10j
						  ; sub_1A6034+22j ...
		tst.b	d0
		rts
; End of function sub_1A6034


; =============== S U B	R O U T	I N E =======================================


sub_1A6082:					  ; CODE XREF: ROM:001A5FAAp
		move.w	#$0016,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A60D8
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00040,d7
		bcc.s	loc_1A60BE
		move.b	#$23,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A60BE:					  ; CODE XREF: sub_1A6082+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A60D8:					  ; CODE XREF: sub_1A6082+10j
		tst.b	d0
		rts
; End of function sub_1A6082

; ---------------------------------------------------------------------------

loc_1A60DC:					  ; CODE XREF: ROM:001A5F4Ej
		andi.b	#$0F,d0
		beq.s	loc_1A60FA
		cmpi.b	#$01,d0
		beq.s	loc_1A6152
		cmpi.b	#$02,d0
		beq.s	loc_1A6158
		cmpi.b	#$03,d0
		beq.w	loc_1A6158
		bra.w	loc_1A6158
; ---------------------------------------------------------------------------

loc_1A60FA:					  ; CODE XREF: ROM:001A60E0j
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0040,d5
		move.w	#$FFC8,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.w	EnemyAI_Ninja1
		addq.b	#$01,Unk0D(a5)
		move.b	Unk0D(a5),d0
		cmpi.b	#$80,d0
		beq.w	EnemyAI_Ninja1
		andi.b	#$0F,d0
		cmpi.b	#$01,d0
		bne.s	locret_1A6150
		move.b	#$FF,Action1(a5)
		move.b	Unk0D(a5),d0
		andi.w	#$0010,d0
		addi.b	#$10,d0
		lsl.b	#$02,d0
		move.w	d0,PrevAction(a5)

locret_1A6150:					  ; CODE XREF: ROM:001A6136j
		rts
; ---------------------------------------------------------------------------

loc_1A6152:					  ; CODE XREF: ROM:001A60E6j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A6158:					  ; CODE XREF: ROM:001A60ECj
						  ; ROM:001A60F2j ...
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1A618C
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	loc_1A618C
		beq.w	EnemyAI_Ninja1

loc_1A618C:					  ; CODE XREF: ROM:001A6168j
						  ; ROM:001A6186j
		bsr.w	j_j_OnTick
		rts
