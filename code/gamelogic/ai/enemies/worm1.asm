; ---------------------------------------------------------------------------

EnemyAI_Worm1_B:				  ; CODE XREF: ROM:001A84C2j
		bra.s	EnemyAI_Worm1
; ---------------------------------------------------------------------------

EnemyAI_Worm1_A:				  ; CODE XREF: ROM:001A84BEj
		btst	#$01,Flags2(a5)
		bne.s	loc_1A5394
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A539A
		cmpi.b	#$10,d0
		beq.s	loc_1A53E0
		bra.w	loc_1A558A
; ---------------------------------------------------------------------------

loc_1A5394:					  ; CODE XREF: ROM:001A5382j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A539A:					  ; CODE XREF: ROM:001A5388j
		move.w	Z(a5),HitBoxZEnd(a5)
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Worm1
		rts
; ---------------------------------------------------------------------------

EnemyAI_Worm1:					  ; CODE XREF: ROM:EnemyAI_Worm1_Bj
						  ; ROM:001A53C4j ...
		move.w	#$0005,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A53E0:					  ; CODE XREF: ROM:001A538Ej
		tst.b	(byte_FF1142).l
		bne.s	loc_1A5414
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A5424
		bcs.s	loc_1A540E
		bsr.w	sub_1A548A
		bcs.w	loc_1A558A
		bsr.w	sub_1A54F4
		bcs.s	loc_1A540E
		bsr.w	sub_1A5550

loc_1A540E:					  ; CODE XREF: ROM:001A53FAj
						  ; ROM:001A5408j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A5414:					  ; CODE XREF: ROM:001A53E6j
		move.w	#$0005,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A5424:					  ; CODE XREF: ROM:001A53F8p

; FUNCTION CHUNK AT 001A5486 SIZE 00000004 BYTES

		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A5486
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1A5486
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5486
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A5486
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00031,d7
		bhi.s	loc_1A5486
; End of function sub_1A5424


; =============== S U B	R O U T	I N E =======================================


sub_1A546C:					  ; CODE XREF: sub_1A548A+46j
						  ; sub_1A54F4+3Aj ...
		move.b	#$20,ChestIndex(a5)
		move.w	#$0013,BehaviourLUTIndex(a5)
		clr.b	Unk0D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; End of function sub_1A546C

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1A5424

loc_1A5486:					  ; CODE XREF: sub_1A5424+8j
						  ; sub_1A5424+12j ...
		tst.b	d0
		rts
; END OF FUNCTION CHUNK	FOR sub_1A5424

; =============== S U B	R O U T	I N E =======================================


sub_1A548A:					  ; CODE XREF: ROM:001A53FCp
		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A54F0
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A54F0
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A54F0
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00031,d7
		bhi.s	loc_1A54F0
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		beq.s	sub_1A546C
		move.b	#$21,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		clr.b	Unk0D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$01,d0
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A54F0:					  ; CODE XREF: sub_1A548A+8j
						  ; sub_1A548A+1Cj ...
		tst.b	d0
		rts
; End of function sub_1A548A


; =============== S U B	R O U T	I N E =======================================


sub_1A54F4:					  ; CODE XREF: ROM:001A5404p
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A554C
		move.w	#$0018,d5
		move.w	#$0018,d6
		move.w	#$0018,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A554C
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1A554C
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		beq.w	sub_1A546C
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A554C:					  ; CODE XREF: sub_1A54F4+10j
						  ; sub_1A54F4+22j ...
		tst.b	d0
		rts
; End of function sub_1A54F4


; =============== S U B	R O U T	I N E =======================================


sub_1A5550:					  ; CODE XREF: ROM:001A540Ap
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5586
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		beq.w	sub_1A546C
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5586:					  ; CODE XREF: sub_1A5550+10j
		tst.b	d0
		rts
; End of function sub_1A5550

; ---------------------------------------------------------------------------

loc_1A558A:					  ; CODE XREF: ROM:001A5390j
						  ; ROM:001A5400j
		andi.b	#$0F,d0
		beq.s	loc_1A55A8
		cmpi.b	#$01,d0
		beq.w	loc_1A5638
		cmpi.b	#$02,d0
		beq.w	loc_1A56BA
		cmpi.b	#$03,d0
		bra.w	loc_1A56BA
; ---------------------------------------------------------------------------

loc_1A55A8:					  ; CODE XREF: ROM:001A558Ej
						  ; ROM:001A56C6j
		tst.b	Unk0D(a5)
		bne.s	loc_1A55CE
		move.b	#$18,d0
		subq.b	#$01,d0
		add.b	d0,HitBoxSubZEnd(a5)
		jsr	(sub_3BC).l
		bcc.s	loc_1A55C8
		move.w	Z(a5),HitBoxZEnd(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A55C8:					  ; CODE XREF: ROM:001A55BEj
		bset	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid

loc_1A55CE:					  ; CODE XREF: ROM:001A55ACj
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$01,Unk0D(a5)
		bne.s	loc_1A55E8
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A55E8:					  ; CODE XREF: ROM:001A55D8j
		cmpi.b	#$0A,Unk0D(a5)
		bne.s	loc_1A55FE
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A55FE:					  ; CODE XREF: ROM:001A55EEj
		cmpi.b	#$14,Unk0D(a5)
		bne.s	loc_1A5614
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5614:					  ; CODE XREF: ROM:001A5604j
		cmpi.b	#$1E,Unk0D(a5)
		bne.s	loc_1A562A
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A562A:					  ; CODE XREF: ROM:001A561Aj
		cmpi.b	#$32,Unk0D(a5)
		bne.w	locret_1A56B8
		bra.w	EnemyAI_Worm1
; ---------------------------------------------------------------------------

loc_1A5638:					  ; CODE XREF: ROM:001A5594j
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$01,Unk0D(a5)
		bne.s	loc_1A5658
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5658:					  ; CODE XREF: ROM:001A5642j
		cmpi.b	#$0A,Unk0D(a5)
		bne.s	loc_1A566E
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A566E:					  ; CODE XREF: ROM:001A565Ej
		cmpi.b	#$14,Unk0D(a5)
		bne.s	loc_1A5684
		move.b	#$FF,Action1(a5)
		move.w	#$0140,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5684:					  ; CODE XREF: ROM:001A5674j
		cmpi.b	#$1E,Unk0D(a5)
		bne.s	loc_1A569A
		move.b	#$FF,Action1(a5)
		move.w	#$0180,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A569A:					  ; CODE XREF: ROM:001A568Aj
		cmpi.b	#$28,Unk0D(a5)
		bne.s	locret_1A56B8
		move.b	#$FF,Action1(a5)
		move.w	#$0020,PrevAction(a5)
		move.w	Z(a5),HitBoxZEnd(a5)
		bra.w	EnemyAI_Worm1
; ---------------------------------------------------------------------------

locret_1A56B8:					  ; CODE XREF: ROM:001A5630j
						  ; ROM:001A56A0j
		rts
; ---------------------------------------------------------------------------

loc_1A56BA:					  ; CODE XREF: ROM:001A559Cj
						  ; ROM:001A55A4j
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1A56CA
		bsr.w	sub_1A546C
		bra.w	loc_1A55A8
; ---------------------------------------------------------------------------

loc_1A56CA:					  ; CODE XREF: ROM:001A56C0j
		move.w	#$0300,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1A570C
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1A570C
		clr.w	QueuedAction(a5)
		clr.w	PrevAction(a5)
		bset	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bra.w	EnemyAI_Worm1
; ---------------------------------------------------------------------------

locret_1A570C:					  ; CODE XREF: ROM:001A56DAj
						  ; ROM:001A56F8j
		rts
