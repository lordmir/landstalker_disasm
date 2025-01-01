; ---------------------------------------------------------------------------

EnemyAI_Giant1_B:				  ; CODE XREF: ROM:001A85B2j
		bra.s	EnemyAI_Giant1
; ---------------------------------------------------------------------------

EnemyAI_Giant1_A:				  ; CODE XREF: ROM:001A85AEj
		btst	#$01,Flags2(a5)
		bne.s	loc_1AB27C
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AB282
		cmpi.b	#$10,d0
		beq.s	loc_1AB2AE
		bra.w	loc_1AB3F0
; ---------------------------------------------------------------------------

loc_1AB27C:					  ; CODE XREF: ROM:001AB26Aj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AB282:					  ; CODE XREF: ROM:001AB270j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Giant1
		rts
; ---------------------------------------------------------------------------

EnemyAI_Giant1:					  ; CODE XREF: ROM:EnemyAI_Giant1_Bj
						  ; ROM:001AB2A6j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AB2AE:					  ; CODE XREF: ROM:001AB276j
		tst.b	(byte_FF1142).l
		bne.s	loc_1AB2DE
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1AB2E2
		bcs.s	loc_1AB2D8
		bsr.s	sub_1AB31E
		bcs.s	loc_1AB2D8
		bsr.w	sub_1AB35A
		bcs.s	loc_1AB2D8
		bsr.w	sub_1AB396

loc_1AB2D8:					  ; CODE XREF: ROM:001AB2C8j
						  ; ROM:001AB2CCj ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AB2DE:					  ; CODE XREF: ROM:001AB2B4j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AB2E2:					  ; CODE XREF: ROM:001AB2C6p
		move.w	#$0050,d5
		move.w	#$FFB8,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB31A
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	loc_1AB31A
		move.b	#$20,ChestIndex(a5)
		move.w	#$0013,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB31A:					  ; CODE XREF: sub_1AB2E2+10j
						  ; sub_1AB2E2+20j
		tst.b	d0
		rts
; End of function sub_1AB2E2


; =============== S U B	R O U T	I N E =======================================


sub_1AB31E:					  ; CODE XREF: ROM:001AB2CAp
		move.w	#$0058,d5
		move.w	#$FFC0,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB356
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00008,d7
		bhi.s	loc_1AB356
		move.b	#$21,ChestIndex(a5)
		move.w	#$000E,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB356:					  ; CODE XREF: sub_1AB31E+10j
						  ; sub_1AB31E+20j
		tst.b	d0
		rts
; End of function sub_1AB31E


; =============== S U B	R O U T	I N E =======================================


sub_1AB35A:					  ; CODE XREF: ROM:001AB2CEp
		move.w	#$0038,d5
		move.w	#$FFE0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB392
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00004,d7
		bhi.s	loc_1AB392
		move.b	#$22,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB392:					  ; CODE XREF: sub_1AB35A+10j
						  ; sub_1AB35A+20j
		tst.b	d0
		rts
; End of function sub_1AB35A


; =============== S U B	R O U T	I N E =======================================


sub_1AB396:					  ; CODE XREF: ROM:001AB2D4p
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB3EC
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00070,d7
		bcc.s	loc_1AB3D2
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB3D2:					  ; CODE XREF: sub_1AB396+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB3EC:					  ; CODE XREF: sub_1AB396+10j
		tst.b	d0
		rts
; End of function sub_1AB396

; ---------------------------------------------------------------------------

loc_1AB3F0:					  ; CODE XREF: ROM:001AB278j
		andi.b	#$0F,d0
		beq.s	loc_1AB40C
		cmpi.b	#$01,d0
		beq.s	loc_1AB418
		cmpi.b	#$02,d0
		beq.s	loc_1AB42A
		cmpi.b	#$03,d0
		beq.s	loc_1AB42A
		bra.w	loc_1AB464
; ---------------------------------------------------------------------------

loc_1AB40C:					  ; CODE XREF: ROM:001AB3F4j
		move.w	#$0100,QueuedAction(a5)
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AB418:					  ; CODE XREF: ROM:001AB3FAj
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		beq.w	EnemyAI_Giant1
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AB42A:					  ; CODE XREF: ROM:001AB400j
						  ; ROM:001AB406j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1AB45E
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	loc_1AB45E
		bra.w	EnemyAI_Giant1
; ---------------------------------------------------------------------------

loc_1AB45E:					  ; CODE XREF: ROM:001AB43Aj
						  ; ROM:001AB458j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AB464:					  ; CODE XREF: ROM:001AB408j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1AB498
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$2D,Unk0D(a5)
		bcs.s	locret_1AB498
		bra.w	EnemyAI_Giant1
; ---------------------------------------------------------------------------

locret_1AB498:					  ; CODE XREF: ROM:001AB474j
						  ; ROM:001AB492j
		rts
