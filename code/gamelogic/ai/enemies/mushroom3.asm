; ---------------------------------------------------------------------------

EnemyAI_Mushroom3_B:				  ; CODE XREF: ROM:001A85AAj
		bra.s	EnemyAI_Mushroom3
; ---------------------------------------------------------------------------

EnemyAI_Mushroom3_A:				  ; CODE XREF: ROM:001A85A6j
		btst	#$01,Flags2(a5)
		bne.s	loc_1AAED2
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AAED8
		cmpi.b	#$10,d0
		beq.s	loc_1AAF1E
		bra.w	loc_1AB0E2
; ---------------------------------------------------------------------------

loc_1AAED2:					  ; CODE XREF: ROM:001AAEC0j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AAED8:					  ; CODE XREF: ROM:001AAEC6j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Mushroom3
		rts
; ---------------------------------------------------------------------------

EnemyAI_Mushroom3:				  ; CODE XREF: ROM:EnemyAI_Mushroom3_Bj
						  ; ROM:001AAEFCj ...
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAF1E:					  ; CODE XREF: ROM:001AAECCj
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1AAF50
		bcs.s	loc_1AAF42
		bsr.w	sub_1AAFF0
		bcs.s	loc_1AAF42
		bsr.w	sub_1AB038
		bcs.s	loc_1AAF42
		bsr.w	sub_1AB080

loc_1AAF42:					  ; CODE XREF: ROM:001AAF30j
						  ; ROM:001AAF36j ...
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	locret_1AAF4E
		bsr.w	j_j_OnTick

locret_1AAF4E:					  ; CODE XREF: ROM:001AAF48j
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1AAF50:					  ; CODE XREF: ROM:001AAF2Ep
		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1AAFEC
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1AAFAE
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1AAFEC
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00037,d7
		bhi.s	loc_1AAFEC
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		clr.b	Unk0D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bset	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	Z(a5),HitBoxZEnd(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AAFAE:					  ; CODE XREF: sub_1AAF50+12j
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AAFEC
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00037,d7
		bhi.s	loc_1AAFEC
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$1F,Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AAFEC:					  ; CODE XREF: sub_1AAF50+8j
						  ; sub_1AAF50+24j ...
		tst.b	d0
		rts
; End of function sub_1AAF50


; =============== S U B	R O U T	I N E =======================================


sub_1AAFF0:					  ; CODE XREF: ROM:001AAF32p
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1AB034
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB034
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1AB034
		move.b	#$21,ChestIndex(a5)
		move.w	#$0013,BehaviourLUTIndex(a5)
		clr.b	Unk0D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB034:					  ; CODE XREF: sub_1AAFF0+6j
						  ; sub_1AAFF0+18j ...
		tst.b	d0
		rts
; End of function sub_1AAFF0


; =============== S U B	R O U T	I N E =======================================


sub_1AB038:					  ; CODE XREF: ROM:001AAF38p
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1AB07C
		move.w	#$0020,d5
		move.w	#$FFE8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB07C
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00087,d7
		bhi.s	loc_1AB07C
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB07C:					  ; CODE XREF: sub_1AB038+6j
						  ; sub_1AB038+18j ...
		tst.b	d0
		rts
; End of function sub_1AB038


; =============== S U B	R O U T	I N E =======================================


sub_1AB080:					  ; CODE XREF: ROM:001AAF3Ep
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1AB0DE
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB0DE
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00070,d7
		bcc.s	loc_1AB0C4
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB0C4:					  ; CODE XREF: sub_1AB080+28j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB0DE:					  ; CODE XREF: sub_1AB080+6j
						  ; sub_1AB080+18j
		tst.b	d0
		rts
; End of function sub_1AB080

; ---------------------------------------------------------------------------

loc_1AB0E2:					  ; CODE XREF: ROM:001AAECEj
		andi.b	#$0F,d0
		beq.s	loc_1AB104
		cmpi.b	#$01,d0
		beq.w	loc_1AB1CC
		cmpi.b	#$02,d0
		beq.w	loc_1AB1D2
		cmpi.b	#$03,d0
		beq.w	loc_1AB22E
		bra.w	loc_1AB1CC
; ---------------------------------------------------------------------------

loc_1AB104:					  ; CODE XREF: ROM:001AB0E6j
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$01,Unk0D(a5)
		bne.s	loc_1AB11E
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AB11E:					  ; CODE XREF: ROM:001AB10Ej
		cmpi.b	#$08,Unk0D(a5)
		bne.s	loc_1AB134
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AB134:					  ; CODE XREF: ROM:001AB124j
		cmpi.b	#$10,Unk0D(a5)
		bne.s	loc_1AB14A
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AB14A:					  ; CODE XREF: ROM:001AB13Aj
		cmpi.b	#$18,Unk0D(a5)
		bne.s	loc_1AB160
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AB160:					  ; CODE XREF: ROM:001AB150j
		cmpi.b	#$20,Unk0D(a5)
		bne.s	loc_1AB196
		clr.w	d0
		move.b	#$20,d0
		subq.b	#$01,d0
		add.w	d0,HitBoxZEnd(a5)
		jsr	(sub_3BC).l
		bcc.s	loc_1AB188
		move.w	Z(a5),HitBoxZEnd(a5)
		subq.b	#$01,Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AB188:					  ; CODE XREF: ROM:001AB17Aj
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AB196:					  ; CODE XREF: ROM:001AB166j
		cmpi.b	#$28,Unk0D(a5)
		bne.s	loc_1AB1AC
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AB1AC:					  ; CODE XREF: ROM:001AB19Cj
		cmpi.b	#$30,Unk0D(a5)
		bne.s	locret_1AB1CA
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bra.w	EnemyAI_Mushroom3
; ---------------------------------------------------------------------------

locret_1AB1CA:					  ; CODE XREF: ROM:001AB1B2j
		rts
; ---------------------------------------------------------------------------

loc_1AB1CC:					  ; CODE XREF: ROM:001AB0ECj
						  ; ROM:001AB100j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AB1D2:					  ; CODE XREF: ROM:001AB0F4j
		addq.b	#$01,Unk0D(a5)
		move.b	Unk0D(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#$0300,d0
		move.w	d0,QueuedAction(a5)
		cmpi.b	#$20,Unk0D(a5)
		bcs.s	locret_1AB22C
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		move.b	#STATUS_POISON,d0
		cmpi.b	#030,d7
		bcs.s	loc_1AB224
		move.b	#STATUS_PARALYSIS,d0
		cmpi.b	#050,d7
		bcs.s	loc_1AB224
		move.b	#STATUS_CONFUSION,d0
		cmpi.b	#065,d7
		bcs.s	loc_1AB224
		move.b	#STATUS_CURSE,d0
		cmpi.b	#070,d7
		bcc.w	EnemyAI_Mushroom3

loc_1AB224:					  ; CODE XREF: ROM:001AB202j
						  ; ROM:001AB20Cj ...
		bsr.w	j_j_AddStatusEffect
		bra.w	EnemyAI_Mushroom3
; ---------------------------------------------------------------------------

locret_1AB22C:					  ; CODE XREF: ROM:001AB1EEj
		rts
; ---------------------------------------------------------------------------

loc_1AB22E:					  ; CODE XREF: ROM:001AB0FCj
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
		bcs.s	locret_1AB260
		bra.w	EnemyAI_Mushroom3
; ---------------------------------------------------------------------------

locret_1AB260:					  ; CODE XREF: ROM:001AB25Aj
		rts
