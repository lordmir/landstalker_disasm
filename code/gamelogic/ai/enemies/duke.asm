; ---------------------------------------------------------------------------

EnemyAI_Duke_B:					  ; CODE XREF: ROM:001A8602j
		bra.s	EnemyAI_Duke
; ---------------------------------------------------------------------------

EnemyAI_Duke_A:					  ; CODE XREF: ROM:001A85FEj
		bset	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		btst	#$01,Flags2(a5)
		bne.s	loc_1ACAD2
		move.b	ChestIndex(a5),d0
		beq.s	loc_1ACADE
		cmpi.b	#$10,d0
		beq.s	loc_1ACB24
		bra.w	loc_1ACC7A
; ---------------------------------------------------------------------------

loc_1ACAD2:					  ; CODE XREF: ROM:001ACAC0j
		bclr	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ACADE:					  ; CODE XREF: ROM:001ACAC6j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Duke
		rts
; ---------------------------------------------------------------------------

EnemyAI_Duke:					  ; CODE XREF: ROM:EnemyAI_Duke_Bj
						  ; ROM:001ACB02j ...
		bclr	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ACB24:					  ; CODE XREF: ROM:001ACACCj
		tst.b	(byte_FF1142).l
		bne.s	loc_1ACB54
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1ACB64
		bcs.s	loc_1ACB4E
		bsr.s	sub_1ACBA0
		bcs.s	loc_1ACB4E
		bsr.w	sub_1ACBE0
		bcs.s	loc_1ACB4E
		bsr.w	sub_1ACC20

loc_1ACB4E:					  ; CODE XREF: ROM:001ACB3Ej
						  ; ROM:001ACB42j ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ACB54:					  ; CODE XREF: ROM:001ACB2Aj
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1ACB64:					  ; CODE XREF: ROM:001ACB3Cp
		move.w	#$0070,d5
		move.w	#$FFB0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACB9C
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00086,d7
		bhi.s	loc_1ACB9C
		move.b	#$20,ChestIndex(a5)
		move.w	#$001A,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACB9C:					  ; CODE XREF: sub_1ACB64+10j
						  ; sub_1ACB64+20j
		tst.b	d0
		rts
; End of function sub_1ACB64


; =============== S U B	R O U T	I N E =======================================


sub_1ACBA0:					  ; CODE XREF: ROM:001ACB40p
		move.w	#$0050,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACBDC
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00125,d7
		bhi.s	loc_1ACBDC
		move.b	#$21,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACBDC:					  ; CODE XREF: sub_1ACBA0+10j
						  ; sub_1ACBA0+20j
		tst.b	d0
		rts
; End of function sub_1ACBA0


; =============== S U B	R O U T	I N E =======================================


sub_1ACBE0:					  ; CODE XREF: ROM:001ACB44p
		move.w	#$0030,d5
		move.w	#$FFE0,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACC1C
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00043,d7
		bhi.s	loc_1ACC1C
		move.b	#$22,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACC1C:					  ; CODE XREF: sub_1ACBE0+10j
						  ; sub_1ACBE0+20j
		tst.b	d0
		rts
; End of function sub_1ACBE0


; =============== S U B	R O U T	I N E =======================================


sub_1ACC20:					  ; CODE XREF: ROM:001ACB4Ap
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACC76
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	loc_1ACC5C
		move.b	#$23,ChestIndex(a5)
		move.w	#$0012,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACC5C:					  ; CODE XREF: sub_1ACC20+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACC76:					  ; CODE XREF: sub_1ACC20+10j
		tst.b	d0
		rts
; End of function sub_1ACC20

; ---------------------------------------------------------------------------

loc_1ACC7A:					  ; CODE XREF: ROM:001ACACEj
		andi.b	#$0F,d0
		beq.s	loc_1ACC9A
		cmpi.b	#$01,d0
		beq.s	loc_1ACCBE
		cmpi.b	#$02,d0
		beq.w	loc_1ACCE0
		cmpi.b	#$03,d0
		beq.w	loc_1ACC9A
		bra.w	*+4
; ---------------------------------------------------------------------------

loc_1ACC9A:					  ; CODE XREF: ROM:001ACC7Ej
						  ; ROM:001ACC92j ...
		cmpi.b	#$18,BehavParam(a5)
		bcc.s	loc_1ACCB8
		move.w	#$0100,QueuedAction(a5)
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C

loc_1ACCB8:					  ; CODE XREF: ROM:001ACCA0j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ACCBE:					  ; CODE XREF: ROM:001ACC84j
		bset	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0200,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$28,Unk0D(a5)
		bcc.w	EnemyAI_Duke
		rts
; ---------------------------------------------------------------------------

loc_1ACCDA:					  ; CODE XREF: ROM:001ACD00j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ACCE0:					  ; CODE XREF: ROM:001ACC8Aj
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1ACCDA
		bra.w	EnemyAI_Duke
