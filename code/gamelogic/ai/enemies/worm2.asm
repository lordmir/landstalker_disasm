; ---------------------------------------------------------------------------

EnemyAI_Worm2_B:				  ; CODE XREF: ROM:001A84CAj
		bra.s	EnemyAI_Worm2
; ---------------------------------------------------------------------------

EnemyAI_Worm2_A:				  ; CODE XREF: ROM:001A84C6j
		btst	#$01,Flags2(a5)
		bne.s	loc_1A5728
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A572E
		cmpi.b	#$10,d0
		beq.s	loc_1A5774
		bra.w	loc_1A591E
; ---------------------------------------------------------------------------

loc_1A5728:					  ; CODE XREF: ROM:001A5716j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A572E:					  ; CODE XREF: ROM:001A571Cj
		move.w	Z(a5),HitBoxZEnd(a5)
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Worm2
		rts
; ---------------------------------------------------------------------------

EnemyAI_Worm2:					  ; CODE XREF: ROM:EnemyAI_Worm2_Bj
						  ; ROM:001A5758j ...
		move.w	#$0005,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5774:					  ; CODE XREF: ROM:001A5722j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A57A8
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A57B8
		bcs.s	loc_1A57A2
		bsr.w	sub_1A581E
		bcs.w	loc_1A591E
		bsr.w	sub_1A5888
		bcs.s	loc_1A57A2
		bsr.w	sub_1A58E4

loc_1A57A2:					  ; CODE XREF: ROM:001A578Ej
						  ; ROM:001A579Cj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A57A8:					  ; CODE XREF: ROM:001A577Aj
		move.w	#$0005,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A57B8:					  ; CODE XREF: ROM:001A578Cp

; FUNCTION CHUNK AT 001A581A SIZE 00000004 BYTES

		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A581A
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1A581A
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A581A
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A581A
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00031,d7
		bhi.s	loc_1A581A
; End of function sub_1A57B8


; =============== S U B	R O U T	I N E =======================================


sub_1A5800:					  ; CODE XREF: sub_1A581E+46j
						  ; sub_1A5888+3Aj ...
		move.b	#$20,ChestIndex(a5)
		move.w	#$0013,BehaviourLUTIndex(a5)
		clr.b	Unk0D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; End of function sub_1A5800

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1A57B8

loc_1A581A:					  ; CODE XREF: sub_1A57B8+8j
						  ; sub_1A57B8+12j ...
		tst.b	d0
		rts
; END OF FUNCTION CHUNK	FOR sub_1A57B8

; =============== S U B	R O U T	I N E =======================================


sub_1A581E:					  ; CODE XREF: ROM:001A5790p
		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A5884
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5884
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A5884
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00043,d7
		bhi.s	loc_1A5884
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		beq.s	sub_1A5800
		move.b	#$21,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		clr.b	Unk0D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$01,d0
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5884:					  ; CODE XREF: sub_1A581E+8j
						  ; sub_1A581E+1Cj ...
		tst.b	d0
		rts
; End of function sub_1A581E


; =============== S U B	R O U T	I N E =======================================


sub_1A5888:					  ; CODE XREF: ROM:001A5798p
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A58E0
		move.w	#$0018,d5
		move.w	#$0018,d6
		move.w	#$0018,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A58E0
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00031,d7
		bhi.s	loc_1A58E0
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		beq.w	sub_1A5800
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A58E0:					  ; CODE XREF: sub_1A5888+10j
						  ; sub_1A5888+22j ...
		tst.b	d0
		rts
; End of function sub_1A5888


; =============== S U B	R O U T	I N E =======================================


sub_1A58E4:					  ; CODE XREF: ROM:001A579Ep
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A591A
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		beq.w	sub_1A5800
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A591A:					  ; CODE XREF: sub_1A58E4+10j
		tst.b	d0
		rts
; End of function sub_1A58E4

; ---------------------------------------------------------------------------

loc_1A591E:					  ; CODE XREF: ROM:001A5724j
						  ; ROM:001A5794j
		andi.b	#$0F,d0
		beq.s	loc_1A593C
		cmpi.b	#$01,d0
		beq.w	loc_1A59CC
		cmpi.b	#$02,d0
		beq.w	loc_1A5A4E
		cmpi.b	#$03,d0
		bra.w	loc_1A5AC8
; ---------------------------------------------------------------------------

loc_1A593C:					  ; CODE XREF: ROM:001A5922j
						  ; ROM:001A5A5Aj ...
		tst.b	Unk0D(a5)
		bne.s	loc_1A5962
		move.b	#$18,d0
		subq.b	#$01,d0
		add.b	d0,HitBoxSubZEnd(a5)
		jsr	(sub_3BC).l
		bcc.s	loc_1A595C
		move.w	Z(a5),HitBoxZEnd(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A595C:					  ; CODE XREF: ROM:001A5952j
		bset	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid

loc_1A5962:					  ; CODE XREF: ROM:001A5940j
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$01,Unk0D(a5)
		bne.s	loc_1A597C
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A597C:					  ; CODE XREF: ROM:001A596Cj
		cmpi.b	#$0A,Unk0D(a5)
		bne.s	loc_1A5992
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5992:					  ; CODE XREF: ROM:001A5982j
		cmpi.b	#$14,Unk0D(a5)
		bne.s	loc_1A59A8
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A59A8:					  ; CODE XREF: ROM:001A5998j
		cmpi.b	#$1E,Unk0D(a5)
		bne.s	loc_1A59BE
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A59BE:					  ; CODE XREF: ROM:001A59AEj
		cmpi.b	#$32,Unk0D(a5)
		bne.w	locret_1A5A4C
		bra.w	EnemyAI_Worm2
; ---------------------------------------------------------------------------

loc_1A59CC:					  ; CODE XREF: ROM:001A5928j
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$01,Unk0D(a5)
		bne.s	loc_1A59EC
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A59EC:					  ; CODE XREF: ROM:001A59D6j
		cmpi.b	#$0A,Unk0D(a5)
		bne.s	loc_1A5A02
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5A02:					  ; CODE XREF: ROM:001A59F2j
		cmpi.b	#$14,Unk0D(a5)
		bne.s	loc_1A5A18
		move.b	#$FF,Action1(a5)
		move.w	#$0140,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5A18:					  ; CODE XREF: ROM:001A5A08j
		cmpi.b	#$1E,Unk0D(a5)
		bne.s	loc_1A5A2E
		move.b	#$FF,Action1(a5)
		move.w	#$0180,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5A2E:					  ; CODE XREF: ROM:001A5A1Ej
		cmpi.b	#$28,Unk0D(a5)
		bne.s	locret_1A5A4C
		move.b	#$FF,Action1(a5)
		move.w	#$0020,PrevAction(a5)
		move.w	Z(a5),HitBoxZEnd(a5)
		bra.w	EnemyAI_Worm2
; ---------------------------------------------------------------------------

locret_1A5A4C:					  ; CODE XREF: ROM:001A59C4j
						  ; ROM:001A5A34j
		rts
; ---------------------------------------------------------------------------

loc_1A5A4E:					  ; CODE XREF: ROM:001A5930j
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1A5A5E
		bsr.w	sub_1A5800
		bra.w	loc_1A593C
; ---------------------------------------------------------------------------

loc_1A5A5E:					  ; CODE XREF: ROM:001A5A54j
		move.w	#$0300,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0C,Unk0D(a5)
		bcs.w	locret_1A5B1A
		move.w	#$0500,QueuedAction(a5)
		move.w	#$0018,d1
		move.w	#$0000,d2
		move.w	#$0008,d3
		bsr.w	sub_1A880C
		bcc.s	loc_1A5AAC
		cmpi.b	#$0C,Unk0D(a5)
		bne.s	loc_1A5AAC
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.b	#040,d7
		bcc.s	locret_1A5AC6
		move.b	#STATUS_POISON,d0
		bsr.w	j_j_AddStatusEffect
		bra.s	locret_1A5AC6
; ---------------------------------------------------------------------------

loc_1A5AAC:					  ; CODE XREF: ROM:001A5A88j
						  ; ROM:001A5A90j
		cmpi.b	#$18,Unk0D(a5)
		bcs.s	locret_1A5AC6
		move.w	#$0600,QueuedAction(a5)
		cmpi.b	#$20,Unk0D(a5)
		bcs.s	locret_1A5AC6
		bra.w	loc_1A5B08
; ---------------------------------------------------------------------------

locret_1A5AC6:					  ; CODE XREF: ROM:001A5AA0j
						  ; ROM:001A5AAAj ...
		rts
; ---------------------------------------------------------------------------

loc_1A5AC8:					  ; CODE XREF: ROM:001A5938j
		btst	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	loc_1A5AD8
		bsr.w	sub_1A5800
		bra.w	loc_1A593C
; ---------------------------------------------------------------------------

loc_1A5AD8:					  ; CODE XREF: ROM:001A5ACEj
		move.w	#$0300,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1A5B1A
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1A5B1A

loc_1A5B08:					  ; CODE XREF: ROM:001A5AC2j
		clr.w	QueuedAction(a5)
		clr.w	PrevAction(a5)
		bset	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bra.w	EnemyAI_Worm2
; ---------------------------------------------------------------------------

locret_1A5B1A:					  ; CODE XREF: ROM:001A5A6Ej
						  ; ROM:001A5AE8j ...
		rts
