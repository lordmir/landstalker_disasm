; ---------------------------------------------------------------------------

EnemyAI_Mimic1_B:				  ; CODE XREF: ROM:001A8582j
		bra.s	EnemyAI_Mimic1
; ---------------------------------------------------------------------------

EnemyAI_Mimic1_A:				  ; CODE XREF: ROM:001A857Ej
		btst	#$01,Flags2(a5)
		bne.s	loc_1A9B20
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A9B26
		cmpi.b	#$10,d0
		beq.s	loc_1A9B6C
		bra.w	loc_1A9CD4
; ---------------------------------------------------------------------------

loc_1A9B20:					  ; CODE XREF: ROM:001A9B0Ej
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A9B26:					  ; CODE XREF: ROM:001A9B14j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Mimic1
		rts
; ---------------------------------------------------------------------------

EnemyAI_Mimic1:					  ; CODE XREF: ROM:EnemyAI_Mimic1_Bj
						  ; ROM:001A9B4Aj ...
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9B6C:					  ; CODE XREF: ROM:001A9B1Aj
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A9B9E
		bcs.s	loc_1A9B90
		bsr.w	sub_1A9BF6
		bcs.s	loc_1A9B90
		bsr.w	sub_1A9C3E
		bcs.s	loc_1A9B90
		bsr.w	sub_1A9C88

loc_1A9B90:					  ; CODE XREF: ROM:001A9B7Ej
						  ; ROM:001A9B84j ...
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	locret_1A9B9C
		bsr.w	j_j_OnTick

locret_1A9B9C:					  ; CODE XREF: ROM:001A9B96j
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A9B9E:					  ; CODE XREF: ROM:001A9B7Cp
		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A9BF2
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1A9BF2
		move.w	#$0080,d5
		move.w	#$0080,d6
		move.w	#$0080,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A9BF2
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0002,d7
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		clr.b	Unk0D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bset	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9BF2:					  ; CODE XREF: sub_1A9B9E+8j
						  ; sub_1A9B9E+12j ...
		tst.b	d0
		rts
; End of function sub_1A9B9E


; =============== S U B	R O U T	I N E =======================================


sub_1A9BF6:					  ; CODE XREF: ROM:001A9B80p
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1A9C3A
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9C3A
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00400,d7
		bhi.s	loc_1A9C3A
		move.b	#$21,ChestIndex(a5)
		move.w	#$001B,BehaviourLUTIndex(a5)
		clr.b	Unk0D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9C3A:					  ; CODE XREF: sub_1A9BF6+6j
						  ; sub_1A9BF6+18j ...
		tst.b	d0
		rts
; End of function sub_1A9BF6


; =============== S U B	R O U T	I N E =======================================


sub_1A9C3E:					  ; CODE XREF: ROM:001A9B86p
		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A9C84
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		beq.s	loc_1A9C84
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9C84
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9C84:					  ; CODE XREF: sub_1A9C3E+8j
						  ; sub_1A9C3E+12j ...
		tst.b	d0
		rts
; End of function sub_1A9C3E


; =============== S U B	R O U T	I N E =======================================


sub_1A9C88:					  ; CODE XREF: ROM:001A9B8Cp
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1A9CD0
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9CD0
		move.b	HitBoxSubZEnd(a5),d0
		subi.b	#$10,d0
		sub.b	(Player_HitBoxZEnd+1).l,d0
		cmpi.b	#$20,d0
		bcc.s	loc_1A9CD0
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9CD0:					  ; CODE XREF: sub_1A9C88+6j
						  ; sub_1A9C88+18j ...
		tst.b	d0
		rts
; End of function sub_1A9C88

; ---------------------------------------------------------------------------

loc_1A9CD4:					  ; CODE XREF: ROM:001A9B1Cj
		andi.b	#$0F,d0
		beq.s	loc_1A9CF6
		cmpi.b	#$01,d0
		beq.w	locret_1A9DA0
		cmpi.b	#$02,d0
		beq.w	loc_1A9DA2
		cmpi.b	#$03,d0
		beq.w	loc_1A9E4A
		bra.w	loc_1A9E4A
; ---------------------------------------------------------------------------

loc_1A9CF6:					  ; CODE XREF: ROM:001A9CD8j
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$01,Unk0D(a5)
		bne.s	loc_1A9D10
		move.b	#$FF,Action1(a5)
		move.w	#$01C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9D10:					  ; CODE XREF: ROM:001A9D00j
		cmpi.b	#$08,Unk0D(a5)
		bne.s	loc_1A9D26
		move.b	#$FF,Action1(a5)
		move.w	#$0180,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9D26:					  ; CODE XREF: ROM:001A9D16j
		cmpi.b	#$10,Unk0D(a5)
		bne.s	loc_1A9D3C
		move.b	#$FF,Action1(a5)
		move.w	#$0140,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9D3C:					  ; CODE XREF: ROM:001A9D2Cj
		cmpi.b	#$18,Unk0D(a5)
		bne.s	loc_1A9D52
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9D52:					  ; CODE XREF: ROM:001A9D42j
		cmpi.b	#$20,Unk0D(a5)
		bne.w	loc_1A9D6A
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9D6A:					  ; CODE XREF: ROM:001A9D58j
		cmpi.b	#$28,Unk0D(a5)
		bne.w	loc_1A9D82
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9D82:					  ; CODE XREF: ROM:001A9D70j
		cmpi.b	#$30,Unk0D(a5)
		bne.w	locret_1A9D9E
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		move.b	#$10,ChestIndex(a5)

locret_1A9D9E:					  ; CODE XREF: ROM:001A9D88j
		rts
; ---------------------------------------------------------------------------

locret_1A9DA0:					  ; CODE XREF: ROM:001A9CDEj
		rts
; ---------------------------------------------------------------------------

loc_1A9DA2:					  ; CODE XREF: ROM:001A9CE6j
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$01,Unk0D(a5)
		bne.s	loc_1A9DBC
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9DBC:					  ; CODE XREF: ROM:001A9DACj
		cmpi.b	#$08,Unk0D(a5)
		bne.s	loc_1A9DD2
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9DD2:					  ; CODE XREF: ROM:001A9DC2j
		cmpi.b	#$10,Unk0D(a5)
		bne.s	loc_1A9DE8
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9DE8:					  ; CODE XREF: ROM:001A9DD8j
		cmpi.b	#$18,Unk0D(a5)
		bne.s	loc_1A9DFE
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9DFE:					  ; CODE XREF: ROM:001A9DEEj
		cmpi.b	#$20,Unk0D(a5)
		bne.w	loc_1A9E16
		move.b	#$FF,Action1(a5)
		move.w	#$0140,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9E16:					  ; CODE XREF: ROM:001A9E04j
		cmpi.b	#$28,Unk0D(a5)
		bne.w	loc_1A9E2E
		move.b	#$FF,Action1(a5)
		move.w	#$0180,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9E2E:					  ; CODE XREF: ROM:001A9E1Cj
		cmpi.b	#$30,Unk0D(a5)
		bne.w	locret_1A9E48
		move.b	#$FF,Action1(a5)
		move.w	#$01C0,PrevAction(a5)
		bra.w	EnemyAI_Mimic1
; ---------------------------------------------------------------------------

locret_1A9E48:					  ; CODE XREF: ROM:001A9E34j
		rts
; ---------------------------------------------------------------------------

loc_1A9E4A:					  ; CODE XREF: ROM:001A9CEEj
						  ; ROM:001A9CF2j
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
		bcc.s	loc_1A9E90
		movem.w	(sp)+,d0-d1
		move.w	d0,Z(a5)
		move.w	d1,HitBoxZEnd(a5)
		bra.w	EnemyAI_Mimic1
; ---------------------------------------------------------------------------

loc_1A9E90:					  ; CODE XREF: ROM:001A9E7Ej
		movem.w	(sp)+,d0-d1
		tst.b	(byte_FF1145).l
		bne.w	EnemyAI_Mimic1
		tst.b	(byte_FF1142).l
		bne.s	loc_1A9EAE
		move.b	#$01,(byte_FF1142).l

loc_1A9EAE:					  ; CODE XREF: ROM:001A9EA4j
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.w	EnemyAI_Mimic1
		move.b	Unk0D(a5),d0
		addq.b	#$01,Unk0D(a5)
		tst.b	d0
		bne.s	loc_1A9EF6
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Throw
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0100,d0
		bsr.w	j_j_RemoveHealth
		tst.w	CurrentHealth(a5)
		beq.s	loc_1A9F04

loc_1A9EF6:					  ; CODE XREF: ROM:001A9EDCj
		cmpi.b	#$1E,d0
		bcs.w	locret_1A9F02
		clr.b	Unk0D(a5)

locret_1A9F02:					  ; CODE XREF: ROM:001A9EFAj
		rts
; ---------------------------------------------------------------------------

loc_1A9F04:					  ; CODE XREF: ROM:001A9EF4j
		bclr	#$06,Flags2(a5)
		bra.w	loc_1A8AEC
