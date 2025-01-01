; ---------------------------------------------------------------------------

EnemyAI_Mimic2_B:				  ; CODE XREF: ROM:001A858Aj
		bra.s	EnemyAI_Mimic2
; ---------------------------------------------------------------------------

EnemyAI_Mimic2_A:				  ; CODE XREF: ROM:001A8586j
		btst	#$01,Flags2(a5)
		bne.s	loc_1A9F28
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A9F2E
		cmpi.b	#$10,d0
		beq.s	loc_1A9F74
		bra.w	loc_1AA104
; ---------------------------------------------------------------------------

loc_1A9F28:					  ; CODE XREF: ROM:001A9F16j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A9F2E:					  ; CODE XREF: ROM:001A9F1Cj
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Mimic2
		rts
; ---------------------------------------------------------------------------

EnemyAI_Mimic2:					  ; CODE XREF: ROM:EnemyAI_Mimic2_Bj
						  ; ROM:001A9F52j ...
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9F74:					  ; CODE XREF: ROM:001A9F22j
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A9FA6
		bcs.s	loc_1A9F98
		bsr.w	sub_1AA000
		bcs.s	loc_1A9F98
		bsr.w	sub_1AA048
		bcs.s	loc_1A9F98
		bsr.w	sub_1AA092

loc_1A9F98:					  ; CODE XREF: ROM:001A9F86j
						  ; ROM:001A9F8Cj ...
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	locret_1A9FA4
		bsr.w	j_j_OnTick

locret_1A9FA4:					  ; CODE XREF: ROM:001A9F9Ej
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A9FA6:					  ; CODE XREF: ROM:001A9F84p
		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A9FFC
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1A9FFC
		move.w	#$0080,d5
		move.w	#$0080,d6
		move.w	#$0080,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A9FFC
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00002,d7
		bhi.s	loc_1A9FFC
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		clr.b	Unk0D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bset	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9FFC:					  ; CODE XREF: sub_1A9FA6+8j
						  ; sub_1A9FA6+12j ...
		tst.b	d0
		rts
; End of function sub_1A9FA6


; =============== S U B	R O U T	I N E =======================================


sub_1AA000:					  ; CODE XREF: ROM:001A9F88p
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1AA044
		move.w	#$0050,d5
		move.w	#$0000,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA044
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00040,d7
		bhi.s	loc_1AA044
		move.b	#$21,ChestIndex(a5)
		move.w	#$001C,BehaviourLUTIndex(a5)
		clr.b	Unk0D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA044:					  ; CODE XREF: sub_1AA000+6j
						  ; sub_1AA000+18j ...
		tst.b	d0
		rts
; End of function sub_1AA000


; =============== S U B	R O U T	I N E =======================================


sub_1AA048:					  ; CODE XREF: ROM:001A9F8Ep
		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1AA08E
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		beq.s	loc_1AA08E
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA08E
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA08E:					  ; CODE XREF: sub_1AA048+8j
						  ; sub_1AA048+12j ...
		tst.b	d0
		rts
; End of function sub_1AA048


; =============== S U B	R O U T	I N E =======================================


sub_1AA092:					  ; CODE XREF: ROM:001A9F94p
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1AA100
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA100
		move.b	HitBoxSubZEnd(a5),d0
		subi.b	#$10,d0
		sub.b	(Player_HitBoxZEnd+1).l,d0
		cmpi.b	#$20,d0
		bcc.s	loc_1AA100
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00010,d7
		bhi.s	loc_1AA0EA
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA0EA:					  ; CODE XREF: sub_1AA092+3Cj
		move.b	#$24,ChestIndex(a5)
		move.w	#$001D,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA100:					  ; CODE XREF: sub_1AA092+6j
						  ; sub_1AA092+18j ...
		tst.b	d0
		rts
; End of function sub_1AA092

; ---------------------------------------------------------------------------

loc_1AA104:					  ; CODE XREF: ROM:001A9F24j
		andi.b	#$0F,d0
		beq.s	loc_1AA126
		cmpi.b	#$01,d0
		beq.w	loc_1AA1D0
		cmpi.b	#$02,d0
		beq.w	loc_1AA1D6
		cmpi.b	#$03,d0
		beq.w	loc_1AA27E
		bra.w	loc_1AA1D0
; ---------------------------------------------------------------------------

loc_1AA126:					  ; CODE XREF: ROM:001AA108j
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$01,Unk0D(a5)
		bne.s	loc_1AA140
		move.b	#$FF,Action1(a5)
		move.w	#$01C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA140:					  ; CODE XREF: ROM:001AA130j
		cmpi.b	#$07,Unk0D(a5)
		bne.s	loc_1AA156
		move.b	#$FF,Action1(a5)
		move.w	#$0180,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA156:					  ; CODE XREF: ROM:001AA146j
		cmpi.b	#$0E,Unk0D(a5)
		bne.s	loc_1AA16C
		move.b	#$FF,Action1(a5)
		move.w	#$0140,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA16C:					  ; CODE XREF: ROM:001AA15Cj
		cmpi.b	#$15,Unk0D(a5)
		bne.s	loc_1AA182
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA182:					  ; CODE XREF: ROM:001AA172j
		cmpi.b	#$1C,Unk0D(a5)
		bne.w	loc_1AA19A
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA19A:					  ; CODE XREF: ROM:001AA188j
		cmpi.b	#$23,Unk0D(a5)
		bne.w	loc_1AA1B2
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA1B2:					  ; CODE XREF: ROM:001AA1A0j
		cmpi.b	#$2A,Unk0D(a5)
		bne.w	locret_1AA1CE
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		move.b	#$10,ChestIndex(a5)

locret_1AA1CE:					  ; CODE XREF: ROM:001AA1B8j
		rts
; ---------------------------------------------------------------------------

loc_1AA1D0:					  ; CODE XREF: ROM:001AA10Ej
						  ; ROM:001AA122j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AA1D6:					  ; CODE XREF: ROM:001AA116j
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$01,Unk0D(a5)
		bne.s	loc_1AA1F0
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA1F0:					  ; CODE XREF: ROM:001AA1E0j
		cmpi.b	#$07,Unk0D(a5)
		bne.s	loc_1AA206
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA206:					  ; CODE XREF: ROM:001AA1F6j
		cmpi.b	#$0E,Unk0D(a5)
		bne.s	loc_1AA21C
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA21C:					  ; CODE XREF: ROM:001AA20Cj
		cmpi.b	#$15,Unk0D(a5)
		bne.s	loc_1AA232
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA232:					  ; CODE XREF: ROM:001AA222j
		cmpi.b	#$1C,Unk0D(a5)
		bne.w	loc_1AA24A
		move.b	#$FF,Action1(a5)
		move.w	#$0140,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA24A:					  ; CODE XREF: ROM:001AA238j
		cmpi.b	#$23,Unk0D(a5)
		bne.w	loc_1AA262
		move.b	#$FF,Action1(a5)
		move.w	#$0180,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA262:					  ; CODE XREF: ROM:001AA250j
		cmpi.b	#$2A,Unk0D(a5)
		bne.w	locret_1AA27C
		move.b	#$FF,Action1(a5)
		move.w	#$01C0,PrevAction(a5)
		bra.w	EnemyAI_Mimic2
; ---------------------------------------------------------------------------

locret_1AA27C:					  ; CODE XREF: ROM:001AA268j
		rts
; ---------------------------------------------------------------------------

loc_1AA27E:					  ; CODE XREF: ROM:001AA11Ej
		move.w	#$0100,QueuedAction(a5)
		move.w	Z(a5),d0
		move.w	HitBoxZEnd(a5),d1
		movem.w	d0-d1,-(sp)
		move.w	(Player_HitBoxZEnd).l,d0
		addi.w	#$0011,d0
		move.w	d0,HitBoxZEnd(a5)
		clr.w	d1
		move.b	Height(a5),d1
		sub.w	d1,d0
		addq.w	#$01,d0
		move.w	d0,Z(a5)
		jsr	(sub_3BC).l
		bcc.s	loc_1AA2C4
		movem.w	(sp)+,d0-d1
		move.w	d0,Z(a5)
		move.w	d1,HitBoxZEnd(a5)
		bra.w	EnemyAI_Mimic2
; ---------------------------------------------------------------------------

loc_1AA2C4:					  ; CODE XREF: ROM:001AA2B2j
		movem.w	(sp)+,d0-d1
		tst.b	(byte_FF1145).l
		bne.w	EnemyAI_Mimic2
		tst.b	(byte_FF1142).l
		bne.s	loc_1AA2E2
		move.b	#$01,(byte_FF1142).l

loc_1AA2E2:					  ; CODE XREF: ROM:001AA2D8j
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.w	EnemyAI_Mimic2
		move.b	Unk0D(a5),d0
		addq.b	#$01,Unk0D(a5)
		tst.b	d0
		bne.s	loc_1AA32C
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Throw
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0200,d0
		jsr	(j_j_RemoveHealth).l
		tst.w	CurrentHealth(a5)
		beq.s	loc_1AA33A

loc_1AA32C:					  ; CODE XREF: ROM:001AA310j
		cmpi.b	#$1E,d0
		bcs.w	locret_1AA338
		clr.b	Unk0D(a5)

locret_1AA338:					  ; CODE XREF: ROM:001AA330j
		rts
; ---------------------------------------------------------------------------

loc_1AA33A:					  ; CODE XREF: ROM:001AA32Aj
		bclr	#$06,Flags2(a5)
		bra.w	loc_1A8AEC
