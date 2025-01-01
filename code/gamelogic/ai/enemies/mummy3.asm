; ---------------------------------------------------------------------------

EnemyAI_Mummy3_B:				  ; CODE XREF: ROM:001A854Aj
		bra.s	EnemyAI_Mummy3
; ---------------------------------------------------------------------------

EnemyAI_Mummy3_A:				  ; CODE XREF: ROM:001A8546j
		btst	#$01,Flags2(a5)
		bne.s	loc_1A814E
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A8154
		cmpi.b	#$10,d0
		beq.s	loc_1A81B4
		bra.w	loc_1A830E
; ---------------------------------------------------------------------------

loc_1A814E:					  ; CODE XREF: ROM:001A813Cj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A8154:					  ; CODE XREF: ROM:001A8142j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0070,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Mummy3
		rts
; ---------------------------------------------------------------------------

EnemyAI_Mummy3:					  ; CODE XREF: ROM:EnemyAI_Mummy3_Bj
						  ; ROM:001A8178j ...
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		clr.b	Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A8198:					  ; CODE XREF: ROM:001A83A0j
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$24,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		clr.b	Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A81B4:					  ; CODE XREF: ROM:001A8148j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A81E0
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A822C
		bcs.s	loc_1A81DA
		bsr.w	sub_1A8268
		bcs.s	loc_1A81DA
		bsr.w	sub_1A82A4

loc_1A81DA:					  ; CODE XREF: ROM:001A81CEj
						  ; ROM:001A81D4j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A81E0:					  ; CODE XREF: ROM:001A81BAj
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------
		move.w	#$0050,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A8228
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1A8228
		move.b	#$20,ChestIndex(a5)
		move.w	#$0013,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8228:					  ; CODE XREF: ROM:001A8200j
						  ; ROM:001A8210j
		tst.b	d0
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A822C:					  ; CODE XREF: ROM:001A81CCp
		move.w	#$0050,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A8264
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00031,d7
		bhi.s	loc_1A8264
		move.b	#$21,ChestIndex(a5)
		move.w	#$0016,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8264:					  ; CODE XREF: sub_1A822C+10j
						  ; sub_1A822C+20j
		tst.b	d0
		rts
; End of function sub_1A822C


; =============== S U B	R O U T	I N E =======================================


sub_1A8268:					  ; CODE XREF: ROM:001A81D0p
		move.w	#$0048,d5
		move.w	#$FFC8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A82A0
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1A82A0
		move.b	#$22,ChestIndex(a5)
		move.w	#$0014,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A82A0:					  ; CODE XREF: sub_1A8268+10j
						  ; sub_1A8268+20j
		tst.b	d0
		rts
; End of function sub_1A8268


; =============== S U B	R O U T	I N E =======================================


sub_1A82A4:					  ; CODE XREF: ROM:001A81D6p
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A830A
		move.w	HitBoxZEnd(a5),d0
		sub.w	(Player_Z).l,d0
		cmpi.w	#$0021,d0
		bhi.s	loc_1A830A
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00040,d7
		bcc.s	loc_1A82F0
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A82F0:					  ; CODE XREF: sub_1A82A4+30j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A830A:					  ; CODE XREF: sub_1A82A4+10j
						  ; sub_1A82A4+20j
		tst.b	d0
		rts
; End of function sub_1A82A4

; ---------------------------------------------------------------------------

loc_1A830E:					  ; CODE XREF: ROM:001A814Aj
		andi.b	#$0F,d0
		beq.s	loc_1A832E
		cmpi.b	#$01,d0
		beq.s	loc_1A832E
		cmpi.b	#$02,d0
		beq.w	loc_1A832E
		cmpi.b	#$03,d0
		beq.w	loc_1A83B0
		bra.w	loc_1A8334
; ---------------------------------------------------------------------------

loc_1A832E:					  ; CODE XREF: ROM:001A8312j
						  ; ROM:001A8318j ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A8334:					  ; CODE XREF: ROM:001A832Aj
		tst.b	(g_PlayerAnimation).l
		bne.w	EnemyAI_Mummy3
		tst.b	(byte_FF1142).l
		bne.w	loc_1A8354
		move.b	#$01,(byte_FF1142).l
		bra.w	*+4
; ---------------------------------------------------------------------------

loc_1A8354:					  ; CODE XREF: ROM:001A8344j
						  ; ROM:001A8350j
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0015,d5
		move.w	#$0009,d6
		move.w	#$0009,d7
		bsr.w	sub_1A8964
		bcc.w	EnemyAI_Mummy3
		move.b	Unk0D(a5),d0
		addq.b	#$01,Unk0D(a5)
		tst.b	d0
		bne.s	loc_1A839C
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Throw
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0040,d0
		bsr.w	j_j_RemoveHealth
		tst.w	CurrentHealth(a5)
		beq.s	loc_1A83A6

loc_1A839C:					  ; CODE XREF: ROM:001A8382j
		cmpi.b	#$28,d0
		bcc.w	loc_1A8198
		rts
; ---------------------------------------------------------------------------

loc_1A83A6:					  ; CODE XREF: ROM:001A839Aj
		bclr	#$06,Flags2(a5)
		bra.w	loc_1A8AEC
; ---------------------------------------------------------------------------

loc_1A83B0:					  ; CODE XREF: ROM:001A8326j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.w	locret_1A83E4
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0011,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcc.w	EnemyAI_Mummy3

locret_1A83E4:					  ; CODE XREF: ROM:001A83C0j
		rts
