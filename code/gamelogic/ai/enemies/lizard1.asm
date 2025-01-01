; ---------------------------------------------------------------------------

EnemyAI_Lizard1_B:				  ; CODE XREF: ROM:001A84F2j
		bra.s	EnemyAI_Lizard1
; ---------------------------------------------------------------------------

EnemyAI_Lizard1_A:				  ; CODE XREF: ROM:001A84EEj
		btst	#$01,Flags2(a5)
		bne.s	loc_1A67BE
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A67C4
		cmpi.b	#$10,d0
		beq.s	loc_1A67F0
		bra.w	loc_1A6932
; ---------------------------------------------------------------------------

loc_1A67BE:					  ; CODE XREF: ROM:001A67ACj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A67C4:					  ; CODE XREF: ROM:001A67B2j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Lizard1
		rts
; ---------------------------------------------------------------------------

EnemyAI_Lizard1:				  ; CODE XREF: ROM:EnemyAI_Lizard1_Bj
						  ; ROM:001A67E8j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A67F0:					  ; CODE XREF: ROM:001A67B8j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A6820
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A6824
		bcs.s	loc_1A681A
		bsr.s	sub_1A6860
		bcs.s	loc_1A681A
		bsr.w	sub_1A689C
		bcs.s	loc_1A681A
		bsr.w	sub_1A68D8

loc_1A681A:					  ; CODE XREF: ROM:001A680Aj
						  ; ROM:001A680Ej ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A6820:					  ; CODE XREF: ROM:001A67F6j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A6824:					  ; CODE XREF: ROM:001A6808p
		move.w	#$0048,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A685C
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1A685C
		move.b	#$20,ChestIndex(a5)
		move.w	#$0013,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A685C:					  ; CODE XREF: sub_1A6824+10j
						  ; sub_1A6824+20j
		tst.b	d0
		rts
; End of function sub_1A6824


; =============== S U B	R O U T	I N E =======================================


sub_1A6860:					  ; CODE XREF: ROM:001A680Cp
		move.w	#$0050,d5
		move.w	#$FFC8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6898
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	loc_1A6898
		move.b	#$21,ChestIndex(a5)
		move.w	#$000E,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6898:					  ; CODE XREF: sub_1A6860+10j
						  ; sub_1A6860+20j
		tst.b	d0
		rts
; End of function sub_1A6860


; =============== S U B	R O U T	I N E =======================================


sub_1A689C:					  ; CODE XREF: ROM:001A6810p
		move.w	#$0040,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A68D4
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1A68D4
		move.b	#$22,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A68D4:					  ; CODE XREF: sub_1A689C+10j
						  ; sub_1A689C+20j
		tst.b	d0
		rts
; End of function sub_1A689C


; =============== S U B	R O U T	I N E =======================================


sub_1A68D8:					  ; CODE XREF: ROM:001A6816p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A692E
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00060,d7
		bcc.s	loc_1A6914
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6914:					  ; CODE XREF: sub_1A68D8+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A692E:					  ; CODE XREF: sub_1A68D8+10j
		tst.b	d0
		rts
; End of function sub_1A68D8

; ---------------------------------------------------------------------------

loc_1A6932:					  ; CODE XREF: ROM:001A67BAj
		andi.b	#$0F,d0
		beq.s	loc_1A694E
		cmpi.b	#$01,d0
		beq.s	loc_1A6954
		cmpi.b	#$02,d0
		beq.s	loc_1A6966
		cmpi.b	#$03,d0
		beq.s	loc_1A69A0
		bra.w	loc_1A69D6
; ---------------------------------------------------------------------------

loc_1A694E:					  ; CODE XREF: ROM:001A6936j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A6954:					  ; CODE XREF: ROM:001A693Cj
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		beq.w	EnemyAI_Lizard1
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A6966:					  ; CODE XREF: ROM:001A6942j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1A699A
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	loc_1A699A
		bra.w	EnemyAI_Lizard1
; ---------------------------------------------------------------------------

loc_1A699A:					  ; CODE XREF: ROM:001A6976j
						  ; ROM:001A6994j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A69A0:					  ; CODE XREF: ROM:001A6948j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1A69D4
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1A69D4
		bra.w	EnemyAI_Lizard1
; ---------------------------------------------------------------------------

locret_1A69D4:					  ; CODE XREF: ROM:001A69B0j
						  ; ROM:001A69CEj
		rts
; ---------------------------------------------------------------------------

loc_1A69D6:					  ; CODE XREF: ROM:001A694Aj
		move.w	#$0300,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1A6A0A
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1A6A0A
		bra.w	EnemyAI_Lizard1
; ---------------------------------------------------------------------------

locret_1A6A0A:					  ; CODE XREF: ROM:001A69E6j
						  ; ROM:001A6A04j
		rts
