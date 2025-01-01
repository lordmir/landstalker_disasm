; ---------------------------------------------------------------------------

EnemyAI_Mushroom1_B:				  ; CODE XREF: ROM:001A859Aj
		bra.s	EnemyAI_Mushroom1
; ---------------------------------------------------------------------------

EnemyAI_Mushroom1_A:				  ; CODE XREF: ROM:001A8596j
		btst	#$01,Flags2(a5)
		bne.s	loc_1AA794
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AA79A
		cmpi.b	#$10,d0
		beq.s	loc_1AA7E0
		bra.w	loc_1AA9B6
; ---------------------------------------------------------------------------

loc_1AA794:					  ; CODE XREF: ROM:001AA782j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AA79A:					  ; CODE XREF: ROM:001AA788j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Mushroom1
		rts
; ---------------------------------------------------------------------------

EnemyAI_Mushroom1:				  ; CODE XREF: ROM:EnemyAI_Mushroom1_Bj
						  ; ROM:001AA7BEj ...
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA7E0:					  ; CODE XREF: ROM:001AA78Ej
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1AA812
		bcs.s	loc_1AA804
		bsr.w	sub_1AA8C4
		bcs.s	loc_1AA804
		bsr.w	sub_1AA90C
		bcs.s	loc_1AA804
		bsr.w	sub_1AA954

loc_1AA804:					  ; CODE XREF: ROM:001AA7F2j
						  ; ROM:001AA7F8j ...
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	locret_1AA810
		bsr.w	j_j_OnTick

locret_1AA810:					  ; CODE XREF: ROM:001AA80Aj
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1AA812:					  ; CODE XREF: ROM:001AA7F0p
		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1AA8C0
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1AA882
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1AA8C0
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AA8C0
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	loc_1AA8C0
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		clr.b	Unk0D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bset	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	Z(a5),HitBoxZEnd(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA882:					  ; CODE XREF: sub_1AA812+12j
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA8C0
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	loc_1AA8C0
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$1F,Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA8C0:					  ; CODE XREF: sub_1AA812+8j
						  ; sub_1AA812+24j ...
		tst.b	d0
		rts
; End of function sub_1AA812


; =============== S U B	R O U T	I N E =======================================


sub_1AA8C4:					  ; CODE XREF: ROM:001AA7F4p
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1AA908
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA908
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	loc_1AA908
		move.b	#$21,ChestIndex(a5)
		move.w	#$0013,BehaviourLUTIndex(a5)
		clr.b	Unk0D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA908:					  ; CODE XREF: sub_1AA8C4+6j
						  ; sub_1AA8C4+18j ...
		tst.b	d0
		rts
; End of function sub_1AA8C4


; =============== S U B	R O U T	I N E =======================================


sub_1AA90C:					  ; CODE XREF: ROM:001AA7FAp
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1AA950
		move.w	#$0020,d5
		move.w	#$FFE8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA950
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bhi.s	loc_1AA950
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA950:					  ; CODE XREF: sub_1AA90C+6j
						  ; sub_1AA90C+18j ...
		tst.b	d0
		rts
; End of function sub_1AA90C


; =============== S U B	R O U T	I N E =======================================


sub_1AA954:					  ; CODE XREF: ROM:001AA800p
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1AA9B2
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA9B2
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	loc_1AA998
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA998:					  ; CODE XREF: sub_1AA954+28j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA9B2:					  ; CODE XREF: sub_1AA954+6j
						  ; sub_1AA954+18j
		tst.b	d0
		rts
; End of function sub_1AA954

; ---------------------------------------------------------------------------

loc_1AA9B6:					  ; CODE XREF: ROM:001AA790j
		andi.b	#$0F,d0
		beq.s	loc_1AA9D8
		cmpi.b	#$01,d0
		beq.w	loc_1AAAA2
		cmpi.b	#$02,d0
		beq.w	loc_1AAAA8
		cmpi.b	#$03,d0
		beq.w	loc_1AAAE4
		bra.w	loc_1AAAA2
; ---------------------------------------------------------------------------

loc_1AA9D8:					  ; CODE XREF: ROM:001AA9BAj
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$01,Unk0D(a5)
		bne.s	loc_1AA9F2
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA9F2:					  ; CODE XREF: ROM:001AA9E2j
		cmpi.b	#$08,Unk0D(a5)
		bne.s	loc_1AAA08
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAA08:					  ; CODE XREF: ROM:001AA9F8j
		cmpi.b	#$10,Unk0D(a5)
		bne.s	loc_1AAA1E
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAA1E:					  ; CODE XREF: ROM:001AAA0Ej
		cmpi.b	#$18,Unk0D(a5)
		bne.s	loc_1AAA3A
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		move.b	#$10,ChestIndex(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAA3A:					  ; CODE XREF: ROM:001AAA24j
		cmpi.b	#$20,Unk0D(a5)
		bne.w	loc_1AAA72
		clr.w	d0
		move.b	#$20,d0
		subq.b	#$01,d0
		add.w	d0,HitBoxZEnd(a5)
		jsr	(sub_3BC).l
		bcc.s	loc_1AAA64
		move.w	Z(a5),HitBoxZEnd(a5)
		subq.b	#$01,Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAA64:					  ; CODE XREF: ROM:001AAA56j
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAA72:					  ; CODE XREF: ROM:001AAA40j
		cmpi.b	#$28,Unk0D(a5)
		bne.s	loc_1AAA88
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAA88:					  ; CODE XREF: ROM:001AAA78j
		cmpi.b	#$30,Unk0D(a5)
		bne.s	locret_1AAAA0
		move.w	#$0040,PrevAction(a5)
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bra.w	EnemyAI_Mushroom1
; ---------------------------------------------------------------------------

locret_1AAAA0:					  ; CODE XREF: ROM:001AAA8Ej
		rts
; ---------------------------------------------------------------------------

loc_1AAAA2:					  ; CODE XREF: ROM:001AA9C0j
						  ; ROM:001AA9D4j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AAAA8:					  ; CODE XREF: ROM:001AA9C8j
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$01,Unk0D(a5)
		bne.s	loc_1AAAC4
		move.w	#$0049,d1
		move.w	#$0049,d2
		move.w	#$0049,d3
		bsr.w	sub_1A880C

loc_1AAAC4:					  ; CODE XREF: ROM:001AAAB2j
		move.b	Unk0D(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#$0300,d0
		move.w	d0,QueuedAction(a5)
		cmpi.b	#$20,Unk0D(a5)
		bcs.s	locret_1AAAE2
		bra.w	EnemyAI_Mushroom1
; ---------------------------------------------------------------------------

locret_1AAAE2:					  ; CODE XREF: ROM:001AAADCj
		rts
; ---------------------------------------------------------------------------

loc_1AAAE4:					  ; CODE XREF: ROM:001AA9D0j
		addq.b	#$01,Unk0D(a5)
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.b	Unk0D(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#$0100,d0
		move.w	d0,QueuedAction(a5)
		cmpi.b	#$20,Unk0D(a5)
		bcs.s	locret_1AAB16
		bra.w	EnemyAI_Mushroom1
; ---------------------------------------------------------------------------

locret_1AAB16:					  ; CODE XREF: ROM:001AAB10j
		rts
