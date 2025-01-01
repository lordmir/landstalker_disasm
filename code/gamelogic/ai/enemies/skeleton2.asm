; ---------------------------------------------------------------------------

EnemyAI_Skeleton2_B:				  ; CODE XREF: ROM:001A8572j
		bra.s	EnemyAI_Skeleton2
; ---------------------------------------------------------------------------

EnemyAI_Skeleton2_A:				  ; CODE XREF: ROM:001A856Ej
		btst	#$01,Flags2(a5)
		bne.s	loc_1A95F2
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A95FE
		cmpi.b	#$10,d0
		beq.s	loc_1A9644
		bra.w	loc_1A97B4
; ---------------------------------------------------------------------------

loc_1A95F2:					  ; CODE XREF: ROM:001A95E0j
		bclr	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A95FE:					  ; CODE XREF: ROM:001A95E6j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Skeleton2
		rts
; ---------------------------------------------------------------------------

EnemyAI_Skeleton2:				  ; CODE XREF: ROM:EnemyAI_Skeleton2_Bj
						  ; ROM:001A9622j ...
		bclr	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9644:					  ; CODE XREF: ROM:001A95ECj
		tst.b	(byte_FF1142).l
		bne.s	loc_1A9674
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A9684
		bcs.s	loc_1A966E
		bsr.s	sub_1A96C0
		bcs.s	loc_1A966E
		bsr.w	sub_1A971A
		bcs.s	loc_1A966E
		bsr.w	sub_1A975A

loc_1A966E:					  ; CODE XREF: ROM:001A965Ej
						  ; ROM:001A9662j ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A9674:					  ; CODE XREF: ROM:001A964Aj
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A9684:					  ; CODE XREF: ROM:001A965Cp
		move.w	#$0070,d5
		move.w	#$FFB0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A96BC
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$003E,d7
		bhi.s	loc_1A96BC
		move.b	#$20,ChestIndex(a5)
		move.w	#$0019,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A96BC:					  ; CODE XREF: sub_1A9684+10j
						  ; sub_1A9684+20j
		tst.b	d0
		rts
; End of function sub_1A9684


; =============== S U B	R O U T	I N E =======================================


sub_1A96C0:					  ; CODE XREF: ROM:001A9660p
		move.w	#$0050,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9716
		move.b	RotationAndSize(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.s	loc_1A9716
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00060,d7
		bhi.s	loc_1A9716
		move.b	#$21,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9716:					  ; CODE XREF: sub_1A96C0+10j
						  ; sub_1A96C0+2Aj ...
		tst.b	d0
		rts
; End of function sub_1A96C0


; =============== S U B	R O U T	I N E =======================================


sub_1A971A:					  ; CODE XREF: ROM:001A9664p
		move.w	#$0030,d5
		move.w	#$FFE0,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9756
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1A9756
		move.b	#$22,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9756:					  ; CODE XREF: sub_1A971A+10j
						  ; sub_1A971A+20j
		tst.b	d0
		rts
; End of function sub_1A971A


; =============== S U B	R O U T	I N E =======================================


sub_1A975A:					  ; CODE XREF: ROM:001A966Ap
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A97B0
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00040,d7
		bcc.s	loc_1A9796
		move.b	#$23,ChestIndex(a5)
		move.w	#$0012,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9796:					  ; CODE XREF: sub_1A975A+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A97B0:					  ; CODE XREF: sub_1A975A+10j
		tst.b	d0
		rts
; End of function sub_1A975A

; ---------------------------------------------------------------------------

loc_1A97B4:					  ; CODE XREF: ROM:001A95EEj
		andi.b	#$0F,d0
		beq.s	loc_1A97D4
		cmpi.b	#$01,d0
		beq.s	loc_1A9808
		cmpi.b	#$02,d0
		beq.w	loc_1A985E
		cmpi.b	#$03,d0
		beq.w	loc_1A9824
		bra.w	loc_1A9824
; ---------------------------------------------------------------------------

loc_1A97D4:					  ; CODE XREF: ROM:001A97B8j
		btst	#$05,Action1(a5)
		beq.s	loc_1A97E4
		move.w	#$0100,QueuedAction(a5)
		bra.s	loc_1A9802
; ---------------------------------------------------------------------------

loc_1A97E4:					  ; CODE XREF: ROM:001A97DAj
		btst	#$04,Action1(a5)
		beq.s	loc_1A9802
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)

loc_1A9802:					  ; CODE XREF: ROM:001A97E2j
						  ; ROM:001A97EAj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A9808:					  ; CODE XREF: ROM:001A97BEj
		bset	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0400,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$28,Unk0D(a5)
		bcc.w	EnemyAI_Skeleton2
		rts
; ---------------------------------------------------------------------------

loc_1A9824:					  ; CODE XREF: ROM:001A97CCj
						  ; ROM:001A97D0j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1A9858
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	loc_1A9858
		beq.w	EnemyAI_Skeleton2

loc_1A9858:					  ; CODE XREF: ROM:001A9834j
						  ; ROM:001A9852j ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A985E:					  ; CODE XREF: ROM:001A97C4j
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0300,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1A9858
		bra.w	EnemyAI_Skeleton2
