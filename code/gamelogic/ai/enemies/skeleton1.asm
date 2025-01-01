; ---------------------------------------------------------------------------

EnemyAI_Skeleton1_B:				  ; CODE XREF: ROM:001A856Aj
		bra.s	EnemyAI_Skeleton1
; ---------------------------------------------------------------------------

EnemyAI_Skeleton1_A:				  ; CODE XREF: ROM:001A8566j
		btst	#$01,Flags2(a5)
		bne.s	loc_1A934C
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A9352
		cmpi.b	#$10,d0
		beq.s	loc_1A9392
		bra.w	loc_1A94E8
; ---------------------------------------------------------------------------

loc_1A934C:					  ; CODE XREF: ROM:001A933Aj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A9352:					  ; CODE XREF: ROM:001A9340j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Skeleton1
		rts
; ---------------------------------------------------------------------------

EnemyAI_Skeleton1:				  ; CODE XREF: ROM:EnemyAI_Skeleton1_Bj
						  ; ROM:001A9376j ...
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9392:					  ; CODE XREF: ROM:001A9346j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A93C2
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A93D2
		bcs.s	loc_1A93BC
		bsr.s	sub_1A940E
		bcs.s	loc_1A93BC
		bsr.w	sub_1A944E
		bcs.s	loc_1A93BC
		bsr.w	sub_1A948E

loc_1A93BC:					  ; CODE XREF: ROM:001A93ACj
						  ; ROM:001A93B0j ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A93C2:					  ; CODE XREF: ROM:001A9398j
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A93D2:					  ; CODE XREF: ROM:001A93AAp
		move.w	#$0090,d5
		move.w	#$FFA0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A940A
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00036,d7
		bhi.s	loc_1A940A
		move.b	#$20,ChestIndex(a5)
		move.w	#$0014,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A940A:					  ; CODE XREF: sub_1A93D2+10j
						  ; sub_1A93D2+20j
		tst.b	d0
		rts
; End of function sub_1A93D2


; =============== S U B	R O U T	I N E =======================================


sub_1A940E:					  ; CODE XREF: ROM:001A93AEp
		move.w	#$0040,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A944A
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00036,d7
		bhi.s	loc_1A944A
		move.b	#$21,ChestIndex(a5)
		move.w	#$000E,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A944A:					  ; CODE XREF: sub_1A940E+10j
						  ; sub_1A940E+20j
		tst.b	d0
		rts
; End of function sub_1A940E


; =============== S U B	R O U T	I N E =======================================


sub_1A944E:					  ; CODE XREF: ROM:001A93B2p
		move.w	#$0048,d5
		move.w	#$FFD8,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A948A
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00036,d7
		bhi.s	loc_1A948A
		move.b	#$22,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A948A:					  ; CODE XREF: sub_1A944E+10j
						  ; sub_1A944E+20j
		tst.b	d0
		rts
; End of function sub_1A944E


; =============== S U B	R O U T	I N E =======================================


sub_1A948E:					  ; CODE XREF: ROM:001A93B8p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A94E4
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00060,d7
		bcc.s	loc_1A94CA
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A94CA:					  ; CODE XREF: sub_1A948E+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0009,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A94E4:					  ; CODE XREF: sub_1A948E+10j
		tst.b	d0
		rts
; End of function sub_1A948E

; ---------------------------------------------------------------------------

loc_1A94E8:					  ; CODE XREF: ROM:001A9348j
		andi.b	#$0F,d0
		beq.s	loc_1A9506
		cmpi.b	#$01,d0
		beq.s	loc_1A950C
		cmpi.b	#$02,d0
		beq.s	loc_1A9546
		cmpi.b	#$03,d0
		beq.w	loc_1A950C
		bra.w	loc_1A950C
; ---------------------------------------------------------------------------

loc_1A9506:					  ; CODE XREF: ROM:001A94ECj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A950C:					  ; CODE XREF: ROM:001A94F2j
						  ; ROM:001A94FEj ...
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1A9540
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	loc_1A9540
		beq.w	EnemyAI_Skeleton1

loc_1A9540:					  ; CODE XREF: ROM:001A951Cj
						  ; ROM:001A953Aj ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A9546:					  ; CODE XREF: ROM:001A94F8j
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0300,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1A9540
		bra.w	EnemyAI_Skeleton1
; ---------------------------------------------------------------------------
		jsr	(sub_103B2).l
		bcs.w	loc_1A95D4
		move.w	(a5),d0
		move.b	RotationAndSize(a5),d1
		andi.b	#$C0,d1
		eori.b	#$80,d1
		beq.s	loc_1A9594
		cmpi.b	#$80,d1
		bcs.s	loc_1A9598
		beq.s	loc_1A959E
		subi.w	#$0200,d0
		bra.s	loc_1A95A0
; ---------------------------------------------------------------------------

loc_1A9594:					  ; CODE XREF: ROM:001A9584j
		subq.b	#$02,d0
		bra.s	loc_1A95A0
; ---------------------------------------------------------------------------

loc_1A9598:					  ; CODE XREF: ROM:001A958Aj
		addi.w	#$0200,d0
		bra.s	loc_1A95A0
; ---------------------------------------------------------------------------

loc_1A959E:					  ; CODE XREF: ROM:001A958Cj
		addq.b	#$02,d0

loc_1A95A0:					  ; CODE XREF: ROM:001A9592j
						  ; ROM:001A9596j ...
		move.w	d0,(a1)
		move.b	d1,RotationAndSize(a1)
		move.b	#$78,d2
		move.w	Z(a5),d3
		addi.w	#$0010,d3
		move.w	d3,Z(a1)
		move.w	SubX(a5),SubX(a1)
		move.w	#$47C0,TileSource(a1)
		move.w	#$013C,BehaviourLUTIndex(a1)
		move.b	#$04,Speed(a1)
		jsr	(sub_103B8).l

loc_1A95D4:					  ; CODE XREF: ROM:001A9572j
		bra.w	EnemyAI_Skeleton1
