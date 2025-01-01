; ---------------------------------------------------------------------------

EnemyAI_Ninja2_B:				  ; CODE XREF: ROM:001A84E2j
		bra.s	EnemyAI_Ninja2
; ---------------------------------------------------------------------------

EnemyAI_Ninja2_A:				  ; CODE XREF: ROM:001A84DEj
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A61AC
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A61B2
		cmpi.b	#$10,d0
		beq.s	loc_1A61DE
		bra.w	loc_1A633A
; ---------------------------------------------------------------------------

loc_1A61AC:					  ; CODE XREF: ROM:001A619Aj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A61B2:					  ; CODE XREF: ROM:001A61A0j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Ninja2
		rts
; ---------------------------------------------------------------------------

EnemyAI_Ninja2:					  ; CODE XREF: ROM:EnemyAI_Ninja2_Bj
						  ; ROM:001A61D6j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A61DE:					  ; CODE XREF: ROM:001A61A6j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A620E
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A6212
		bcs.s	loc_1A6208
		bsr.s	sub_1A6252
		bcs.s	loc_1A6208
		bsr.w	sub_1A628E
		bcs.s	loc_1A6208
		bsr.w	sub_1A62E0

loc_1A6208:					  ; CODE XREF: ROM:001A61F8j
						  ; ROM:001A61FCj ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A620E:					  ; CODE XREF: ROM:001A61E4j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A6212:					  ; CODE XREF: ROM:001A61F6p
		move.w	#$0040,d5
		move.w	#$FFC8,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A624E
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00037,d7
		bhi.s	loc_1A624E
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A624E:					  ; CODE XREF: sub_1A6212+10j
						  ; sub_1A6212+20j
		tst.b	d0
		rts
; End of function sub_1A6212


; =============== S U B	R O U T	I N E =======================================


sub_1A6252:					  ; CODE XREF: ROM:001A61FAp
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A628A
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1A628A
		move.b	#$21,ChestIndex(a5)
		move.w	#$0008,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A628A:					  ; CODE XREF: sub_1A6252+10j
						  ; sub_1A6252+20j
		tst.b	d0
		rts
; End of function sub_1A6252


; =============== S U B	R O U T	I N E =======================================


sub_1A628E:					  ; CODE XREF: ROM:001A61FEp
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A62DC
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A62DC
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1A62DC
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A62DC:					  ; CODE XREF: sub_1A628E+10j
						  ; sub_1A628E+22j ...
		tst.b	d0
		rts
; End of function sub_1A628E


; =============== S U B	R O U T	I N E =======================================


sub_1A62E0:					  ; CODE XREF: ROM:001A6204p
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6336
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	loc_1A631C
		move.b	#$23,ChestIndex(a5)
		move.w	#$0012,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A631C:					  ; CODE XREF: sub_1A62E0+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6336:					  ; CODE XREF: sub_1A62E0+10j
		tst.b	d0
		rts
; End of function sub_1A62E0

; ---------------------------------------------------------------------------

loc_1A633A:					  ; CODE XREF: ROM:001A61A8j
		andi.b	#$0F,d0
		beq.s	loc_1A6358
		cmpi.b	#$01,d0
		beq.s	loc_1A63B0
		cmpi.b	#$02,d0
		beq.s	loc_1A63B6
		cmpi.b	#$03,d0
		beq.w	loc_1A645C
		bra.w	loc_1A645C
; ---------------------------------------------------------------------------

loc_1A6358:					  ; CODE XREF: ROM:001A633Ej
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0040,d5
		move.w	#$FFC8,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.w	EnemyAI_Ninja2
		addq.b	#$01,Unk0D(a5)
		move.b	Unk0D(a5),d0
		cmpi.b	#$80,d0
		beq.w	EnemyAI_Ninja2
		andi.b	#$0F,d0
		cmpi.b	#$01,d0
		bne.s	locret_1A63AE
		move.b	#$FF,Action1(a5)
		move.b	Unk0D(a5),d0
		andi.w	#$0010,d0
		addi.b	#$10,d0
		lsl.b	#$02,d0
		move.w	d0,PrevAction(a5)

locret_1A63AE:					  ; CODE XREF: ROM:001A6394j
		rts
; ---------------------------------------------------------------------------

loc_1A63B0:					  ; CODE XREF: ROM:001A6344j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A63B6:					  ; CODE XREF: ROM:001A634Aj
		move.l	(a5),d0
		movem.l	d0,-(sp)
		move.w	(Player_CentreX).l,d1
		move.w	(Player_CentreY).l,d2
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		beq.s	loc_1A63E2
		cmpi.b	#$80,d0
		beq.s	loc_1A63E8
		bhi.s	loc_1A63EE
		addi.w	#$0018,d1
		bra.s	loc_1A63F2
; ---------------------------------------------------------------------------

loc_1A63E2:					  ; CODE XREF: ROM:001A63D2j
		subi.w	#$0018,d2
		bra.s	loc_1A63F2
; ---------------------------------------------------------------------------

loc_1A63E8:					  ; CODE XREF: ROM:001A63D8j
		addi.w	#$0018,d2
		bra.s	loc_1A63F2
; ---------------------------------------------------------------------------

loc_1A63EE:					  ; CODE XREF: ROM:001A63DAj
		subi.w	#$0018,d1

loc_1A63F2:					  ; CODE XREF: ROM:001A63E0j
						  ; ROM:001A63E6j ...
		move.w	d1,d0
		lsr.w	#$04,d1
		move.b	d1,X(a5)
		andi.b	#$0F,d0
		move.b	d0,SubX(a5)
		move.w	d2,d0
		lsr.w	#$04,d2
		move.b	d2,Y(a5)
		andi.b	#$0F,d0
		move.b	d0,SubY(a5)
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		jsr	(sub_3BC).l
		bcc.s	loc_1A6432
		movem.l	(sp)+,d0
		move.l	d0,(a5)
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		bra.w	EnemyAI_Ninja2
; ---------------------------------------------------------------------------

loc_1A6432:					  ; CODE XREF: ROM:001A641Ej
		bset	#$05,Action1(a5)
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d0,RotationAndSize(a5)
		movem.l	(sp)+,d0
		move.b	#$23,ChestIndex(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A645C:					  ; CODE XREF: ROM:001A6350j
						  ; ROM:001A6354j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1A6490
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	loc_1A6490
		beq.w	EnemyAI_Ninja2

loc_1A6490:					  ; CODE XREF: ROM:001A646Cj
						  ; ROM:001A648Aj
		bsr.w	j_j_OnTick
		rts
