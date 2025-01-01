; ---------------------------------------------------------------------------

EnemyAI_Mimic3_B:				  ; CODE XREF: ROM:001A8592j
		bra.s	EnemyAI_Mimic3
; ---------------------------------------------------------------------------

EnemyAI_Mimic3_A:				  ; CODE XREF: ROM:001A858Ej
		btst	#$01,Flags2(a5)
		bne.s	loc_1AA35E
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AA364
		cmpi.b	#$10,d0
		beq.s	loc_1AA3AA
		bra.w	loc_1AA53A
; ---------------------------------------------------------------------------

loc_1AA35E:					  ; CODE XREF: ROM:001AA34Cj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AA364:					  ; CODE XREF: ROM:001AA352j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Mimic3
		rts
; ---------------------------------------------------------------------------

EnemyAI_Mimic3:					  ; CODE XREF: ROM:EnemyAI_Mimic3_Bj
						  ; ROM:001AA388j ...
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA3AA:					  ; CODE XREF: ROM:001AA358j
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1AA3DC
		bcs.s	loc_1AA3CE
		bsr.w	sub_1AA436
		bcs.s	loc_1AA3CE
		bsr.w	sub_1AA47E
		bcs.s	loc_1AA3CE
		bsr.w	sub_1AA4C8

loc_1AA3CE:					  ; CODE XREF: ROM:001AA3BCj
						  ; ROM:001AA3C2j ...
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	locret_1AA3DA
		bsr.w	j_j_OnTick

locret_1AA3DA:					  ; CODE XREF: ROM:001AA3D4j
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1AA3DC:					  ; CODE XREF: ROM:001AA3BAp
		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1AA432
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1AA432
		move.w	#$0080,d5
		move.w	#$0080,d6
		move.w	#$0080,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AA432
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00020,d7
		bhi.s	loc_1AA432
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		clr.b	Unk0D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bset	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA432:					  ; CODE XREF: sub_1AA3DC+8j
						  ; sub_1AA3DC+12j ...
		tst.b	d0
		rts
; End of function sub_1AA3DC


; =============== S U B	R O U T	I N E =======================================


sub_1AA436:					  ; CODE XREF: ROM:001AA3BEp
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1AA47A
		move.w	#$0050,d5
		move.w	#$0000,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA47A
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00080,d7
		bhi.s	loc_1AA47A
		move.b	#$21,ChestIndex(a5)
		move.w	#$001D,BehaviourLUTIndex(a5)
		clr.b	Unk0D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA47A:					  ; CODE XREF: sub_1AA436+6j
						  ; sub_1AA436+18j ...
		tst.b	d0
		rts
; End of function sub_1AA436


; =============== S U B	R O U T	I N E =======================================


sub_1AA47E:					  ; CODE XREF: ROM:001AA3C4p
		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1AA4C4
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		beq.s	loc_1AA4C4
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA4C4
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA4C4:					  ; CODE XREF: sub_1AA47E+8j
						  ; sub_1AA47E+12j ...
		tst.b	d0
		rts
; End of function sub_1AA47E


; =============== S U B	R O U T	I N E =======================================


sub_1AA4C8:					  ; CODE XREF: ROM:001AA3CAp
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1AA536
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA536
		move.b	HitBoxSubZEnd(a5),d0
		subi.b	#$10,d0
		sub.b	(Player_HitBoxZEnd+1).l,d0
		cmpi.b	#$20,d0
		bcc.s	loc_1AA536
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00005,d7
		bhi.s	loc_1AA520
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA520:					  ; CODE XREF: sub_1AA4C8+3Cj
		move.b	#$24,ChestIndex(a5)
		move.w	#$001E,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA536:					  ; CODE XREF: sub_1AA4C8+6j
						  ; sub_1AA4C8+18j ...
		tst.b	d0
		rts
; End of function sub_1AA4C8

; ---------------------------------------------------------------------------

loc_1AA53A:					  ; CODE XREF: ROM:001AA35Aj
		andi.b	#$0F,d0
		beq.s	loc_1AA55C
		cmpi.b	#$01,d0
		beq.w	loc_1AA606
		cmpi.b	#$02,d0
		beq.w	loc_1AA60C
		cmpi.b	#$03,d0
		beq.w	loc_1AA6B4
		bra.w	loc_1AA606
; ---------------------------------------------------------------------------

loc_1AA55C:					  ; CODE XREF: ROM:001AA53Ej
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$01,Unk0D(a5)
		bne.s	loc_1AA576
		move.b	#$FF,Action1(a5)
		move.w	#$01C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA576:					  ; CODE XREF: ROM:001AA566j
		cmpi.b	#$05,Unk0D(a5)
		bne.s	loc_1AA58C
		move.b	#$FF,Action1(a5)
		move.w	#$0180,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA58C:					  ; CODE XREF: ROM:001AA57Cj
		cmpi.b	#$0A,Unk0D(a5)
		bne.s	loc_1AA5A2
		move.b	#$FF,Action1(a5)
		move.w	#$0140,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA5A2:					  ; CODE XREF: ROM:001AA592j
		cmpi.b	#$0F,Unk0D(a5)
		bne.s	loc_1AA5B8
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA5B8:					  ; CODE XREF: ROM:001AA5A8j
		cmpi.b	#$14,Unk0D(a5)
		bne.w	loc_1AA5D0
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA5D0:					  ; CODE XREF: ROM:001AA5BEj
		cmpi.b	#$19,Unk0D(a5)
		bne.w	loc_1AA5E8
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA5E8:					  ; CODE XREF: ROM:001AA5D6j
		cmpi.b	#$1E,Unk0D(a5)
		bne.w	locret_1AA604
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		move.b	#$10,ChestIndex(a5)

locret_1AA604:					  ; CODE XREF: ROM:001AA5EEj
		rts
; ---------------------------------------------------------------------------

loc_1AA606:					  ; CODE XREF: ROM:001AA544j
						  ; ROM:001AA558j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AA60C:					  ; CODE XREF: ROM:001AA54Cj
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$01,Unk0D(a5)
		bne.s	loc_1AA626
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA626:					  ; CODE XREF: ROM:001AA616j
		cmpi.b	#$05,Unk0D(a5)
		bne.s	loc_1AA63C
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA63C:					  ; CODE XREF: ROM:001AA62Cj
		cmpi.b	#$0A,Unk0D(a5)
		bne.s	loc_1AA652
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA652:					  ; CODE XREF: ROM:001AA642j
		cmpi.b	#$0F,Unk0D(a5)
		bne.s	loc_1AA668
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA668:					  ; CODE XREF: ROM:001AA658j
		cmpi.b	#$14,Unk0D(a5)
		bne.w	loc_1AA680
		move.b	#$FF,Action1(a5)
		move.w	#$0140,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA680:					  ; CODE XREF: ROM:001AA66Ej
		cmpi.b	#$19,Unk0D(a5)
		bne.w	loc_1AA698
		move.b	#$FF,Action1(a5)
		move.w	#$0180,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA698:					  ; CODE XREF: ROM:001AA686j
		cmpi.b	#$1E,Unk0D(a5)
		bne.w	locret_1AA6B2
		move.b	#$FF,Action1(a5)
		move.w	#$01C0,PrevAction(a5)
		bra.w	EnemyAI_Mimic3
; ---------------------------------------------------------------------------

locret_1AA6B2:					  ; CODE XREF: ROM:001AA69Ej
		rts
; ---------------------------------------------------------------------------

loc_1AA6B4:					  ; CODE XREF: ROM:001AA554j
		move.w	#$0100,QueuedAction(a5)
		move.w	Z(a5),d0
		move.w	HitBoxZEnd(a5),d1
		movem.w	d0-d1,-(sp)
		move.b	(Player_HitBoxZEnd).l,d0
		addi.w	#$0011,d0
		move.w	d0,HitBoxZEnd(a5)
		clr.w	d1
		move.b	Height(a5),d1
		sub.w	d1,d0
		addq.w	#$01,d0
		move.w	d0,Z(a5)
		jsr	(sub_3BC).l
		bcc.s	loc_1AA6FA
		movem.w	(sp)+,d0-d1
		move.w	d0,Z(a5)
		move.w	d1,HitBoxZEnd(a5)
		bra.w	EnemyAI_Mimic3
; ---------------------------------------------------------------------------

loc_1AA6FA:					  ; CODE XREF: ROM:001AA6E8j
		movem.w	(sp)+,d0-d1
		tst.b	(g_PlayerAnimation).l
		bne.w	EnemyAI_Mimic3
		tst.b	(byte_FF1142).l
		bne.s	loc_1AA718
		move.b	#$01,(byte_FF1142).l

loc_1AA718:					  ; CODE XREF: ROM:001AA70Ej
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.w	EnemyAI_Mimic3
		move.b	Unk0D(a5),d0
		addq.b	#$01,Unk0D(a5)
		tst.b	d0
		bne.s	loc_1AA762
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Throw
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0300,d0
		jsr	(j_j_RemoveHealth).l
		tst.w	CurrentHealth(a5)
		beq.s	loc_1AA770

loc_1AA762:					  ; CODE XREF: ROM:001AA746j
		cmpi.b	#$0A,d0
		bcs.w	locret_1AA76E
		clr.b	Unk0D(a5)

locret_1AA76E:					  ; CODE XREF: ROM:001AA766j
		rts
; ---------------------------------------------------------------------------

loc_1AA770:					  ; CODE XREF: ROM:001AA760j
		bclr	#$06,Flags2(a5)
		bra.w	loc_1A8AEC
