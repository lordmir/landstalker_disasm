; ---------------------------------------------------------------------------

EnemyAI_Mushroom2_B:				  ; CODE XREF: ROM:001A85A2j
		bra.s	EnemyAI_Mushroom2
; ---------------------------------------------------------------------------

EnemyAI_Mushroom2_A:				  ; CODE XREF: ROM:001A859Ej
		btst	#$01,Flags2(a5)
		bne.s	loc_1AAB32
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AAB38
		cmpi.b	#$10,d0
		beq.s	loc_1AAB7E
		bra.w	loc_1AAD42
; ---------------------------------------------------------------------------

loc_1AAB32:					  ; CODE XREF: ROM:001AAB20j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AAB38:					  ; CODE XREF: ROM:001AAB26j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Mushroom2
		rts
; ---------------------------------------------------------------------------

EnemyAI_Mushroom2:				  ; CODE XREF: ROM:EnemyAI_Mushroom2_Bj
						  ; ROM:001AAB5Cj ...
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAB7E:					  ; CODE XREF: ROM:001AAB2Cj
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1AABB0
		bcs.s	loc_1AABA2
		bsr.w	sub_1AAC50
		bcs.s	loc_1AABA2
		bsr.w	sub_1AAC98
		bcs.s	loc_1AABA2
		bsr.w	sub_1AACE0

loc_1AABA2:					  ; CODE XREF: ROM:001AAB90j
						  ; ROM:001AAB96j ...
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	locret_1AABAE
		bsr.w	j_j_OnTick

locret_1AABAE:					  ; CODE XREF: ROM:001AABA8j
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1AABB0:					  ; CODE XREF: ROM:001AAB8Ep
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1AAC4C
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1AAC0E
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1AAC4C
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1AAC4C
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		clr.b	Unk0D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bset	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	Z(a5),HitBoxZEnd(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AAC0E:					  ; CODE XREF: sub_1AABB0+12j
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AAC4C
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1AAC4C
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$1F,Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AAC4C:					  ; CODE XREF: sub_1AABB0+8j
						  ; sub_1AABB0+24j ...
		tst.b	d0
		rts
; End of function sub_1AABB0


; =============== S U B	R O U T	I N E =======================================


sub_1AAC50:					  ; CODE XREF: ROM:001AAB92p
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1AAC94
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AAC94
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1AAC94
		move.b	#$21,ChestIndex(a5)
		move.w	#$0013,BehaviourLUTIndex(a5)
		clr.b	Unk0D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AAC94:					  ; CODE XREF: sub_1AAC50+6j
						  ; sub_1AAC50+18j ...
		tst.b	d0
		rts
; End of function sub_1AAC50


; =============== S U B	R O U T	I N E =======================================


sub_1AAC98:					  ; CODE XREF: ROM:001AAB98p
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1AACDC
		move.w	#$0020,d5
		move.w	#$FFE8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AACDC
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00062,d7
		bhi.s	loc_1AACDC
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AACDC:					  ; CODE XREF: sub_1AAC98+6j
						  ; sub_1AAC98+18j ...
		tst.b	d0
		rts
; End of function sub_1AAC98


; =============== S U B	R O U T	I N E =======================================


sub_1AACE0:					  ; CODE XREF: ROM:001AAB9Ep
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1AAD3E
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AAD3E
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00060,d7
		bcc.s	loc_1AAD24
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AAD24:					  ; CODE XREF: sub_1AACE0+28j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AAD3E:					  ; CODE XREF: sub_1AACE0+6j
						  ; sub_1AACE0+18j
		tst.b	d0
		rts
; End of function sub_1AACE0

; ---------------------------------------------------------------------------

loc_1AAD42:					  ; CODE XREF: ROM:001AAB2Ej
		andi.b	#$0F,d0
		beq.s	loc_1AAD64
		cmpi.b	#$01,d0
		beq.w	loc_1AAE2C
		cmpi.b	#$02,d0
		beq.w	loc_1AAE32
		cmpi.b	#$03,d0
		beq.w	loc_1AAE84
		bra.w	loc_1AAE2C
; ---------------------------------------------------------------------------

loc_1AAD64:					  ; CODE XREF: ROM:001AAD46j
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$01,Unk0D(a5)
		bne.s	loc_1AAD7E
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAD7E:					  ; CODE XREF: ROM:001AAD6Ej
		cmpi.b	#$08,Unk0D(a5)
		bne.s	loc_1AAD94
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAD94:					  ; CODE XREF: ROM:001AAD84j
		cmpi.b	#$10,Unk0D(a5)
		bne.s	loc_1AADAA
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AADAA:					  ; CODE XREF: ROM:001AAD9Aj
		cmpi.b	#$18,Unk0D(a5)
		bne.s	loc_1AADC0
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AADC0:					  ; CODE XREF: ROM:001AADB0j
		cmpi.b	#$20,Unk0D(a5)
		bne.s	loc_1AADF6
		clr.w	d0
		move.b	#$20,d0
		subq.b	#$01,d0
		add.w	d0,HitBoxZEnd(a5)
		jsr	(sub_3BC).l
		bcc.s	loc_1AADE8
		move.w	Z(a5),HitBoxZEnd(a5)
		subq.b	#$01,Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AADE8:					  ; CODE XREF: ROM:001AADDAj
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AADF6:					  ; CODE XREF: ROM:001AADC6j
		cmpi.b	#$28,Unk0D(a5)
		bne.s	loc_1AAE0C
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAE0C:					  ; CODE XREF: ROM:001AADFCj
		cmpi.b	#$30,Unk0D(a5)
		bne.s	locret_1AAE2A
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bra.w	EnemyAI_Mushroom2
; ---------------------------------------------------------------------------

locret_1AAE2A:					  ; CODE XREF: ROM:001AAE12j
		rts
; ---------------------------------------------------------------------------

loc_1AAE2C:					  ; CODE XREF: ROM:001AAD4Cj
						  ; ROM:001AAD60j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AAE32:					  ; CODE XREF: ROM:001AAD54j
		addq.b	#$01,Unk0D(a5)
		move.b	Unk0D(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#$0300,d0
		move.w	d0,QueuedAction(a5)
		cmpi.b	#$20,Unk0D(a5)
		bcs.w	locret_1AAE82
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		move.b	#STATUS_POISON,d0
		cmpi.b	#040,d7
		bcs.s	loc_1AAE7A
		move.w	#$0049,d1
		move.w	#$0049,d2
		move.w	#$0049,d3
		bsr.w	sub_1A880C
		bra.w	EnemyAI_Mushroom2
; ---------------------------------------------------------------------------

loc_1AAE7A:					  ; CODE XREF: ROM:001AAE64j
		bsr.w	j_j_AddStatusEffect
		bra.w	EnemyAI_Mushroom2
; ---------------------------------------------------------------------------

locret_1AAE82:					  ; CODE XREF: ROM:001AAE4Ej
		rts
; ---------------------------------------------------------------------------

loc_1AAE84:					  ; CODE XREF: ROM:001AAD5Cj
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
		bcs.s	locret_1AAEB6
		bra.w	EnemyAI_Mushroom2
; ---------------------------------------------------------------------------

locret_1AAEB6:					  ; CODE XREF: ROM:001AAEB0j
		rts
