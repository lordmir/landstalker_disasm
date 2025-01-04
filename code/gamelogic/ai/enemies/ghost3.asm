; ---------------------------------------------------------------------------

EnemyAI_Ghost3_B:				  ; CODE XREF: ROM:001A8532j
		bra.s	EnemyAI_Ghost3
; ---------------------------------------------------------------------------

EnemyAI_Ghost3_A:				  ; CODE XREF: ROM:001A852Ej
		btst	#$01,Flags2(a5)
		bne.s	loc_1A78D6
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A78DC
		cmpi.b	#$10,d0
		beq.s	loc_1A791C
		bra.w	loc_1A79A4
; ---------------------------------------------------------------------------

loc_1A78D6:					  ; CODE XREF: ROM:001A78C4j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A78DC:					  ; CODE XREF: ROM:001A78CAj
		bra.s	loc_1A78E4
; ---------------------------------------------------------------------------

EnemyAI_Ghost3:					  ; CODE XREF: ROM:EnemyAI_Ghost3_Bj
						  ; ROM:001A79B8j ...
		tst.b	Unk0A(a5)
		bpl.s	loc_1A7900

loc_1A78E4:					  ; CODE XREF: ROM:loc_1A78DCj
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$20,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		clr.b	Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A7900:					  ; CODE XREF: ROM:001A78E2j
						  ; ROM:001A7A4Aj ...
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		clr.b	Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A791C:					  ; CODE XREF: ROM:001A78D0j
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.w	sub_1A7936
		bsr.w	j_j_OnTick
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A7936:					  ; CODE XREF: ROM:001A792Cp
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A79A0
		move.w	HitBoxZEnd(a5),d0
		sub.w	(Player_Z).l,d0
		cmpi.w	#$0020,d0
		bcc.s	loc_1A79A0
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00080,d7
		bcc.s	loc_1A7986
		move.b	#$21,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7986:					  ; CODE XREF: sub_1A7936+30j
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A79A0:					  ; CODE XREF: sub_1A7936+10j
						  ; sub_1A7936+20j
		tst.b	d0
		rts
; End of function sub_1A7936

; ---------------------------------------------------------------------------

loc_1A79A4:					  ; CODE XREF: ROM:001A78D2j
		andi.b	#$0F,d0
		beq.s	loc_1A79BC
		cmpi.b	#$01,d0
		beq.s	loc_1A7A0A
		cmpi.b	#$02,d0
		beq.w	loc_1A7A86
		bra.w	EnemyAI_Ghost3
; ---------------------------------------------------------------------------

loc_1A79BC:					  ; CODE XREF: ROM:001A79A8j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$08,Unk0D(a5)
		bcs.s	locret_1A7A08
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$10,Unk0D(a5)
		bcs.s	locret_1A7A08
		move.w	#$0300,QueuedAction(a5)
		cmpi.b	#$18,Unk0D(a5)
		bcs.s	locret_1A7A08
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$20,Unk0D(a5)
		bcs.s	locret_1A7A08
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)

locret_1A7A08:					  ; CODE XREF: ROM:001A79CCj
						  ; ROM:001A79DAj ...
		rts
; ---------------------------------------------------------------------------

loc_1A7A0A:					  ; CODE XREF: ROM:001A79AEj
		tst.b	(g_PlayerAnimation).l
		bne.w	EnemyAI_Ghost3
		tst.b	(byte_FF1142).l
		bne.w	loc_1A7A2A
		move.b	#$01,(byte_FF1142).l
		bra.w	*+4
; ---------------------------------------------------------------------------

loc_1A7A2A:					  ; CODE XREF: ROM:001A7A1Aj
						  ; ROM:001A7A26j
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0019,d5
		move.w	#$0009,d6
		move.w	#$0009,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A7900
		move.b	Unk4D(a5),d0
		addq.b	#$01,Unk4D(a5)
		tst.b	d0
		bne.s	loc_1A7A72
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_GhostAbsorbHP
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0200,d0
		bsr.w	j_j_RemoveHealth
		tst.w	CurrentHealth(a5)
		beq.s	loc_1A7A7C

loc_1A7A72:					  ; CODE XREF: ROM:001A7A58j
		cmpi.b	#$3C,d0
		bcc.w	loc_1A7900
		rts
; ---------------------------------------------------------------------------

loc_1A7A7C:					  ; CODE XREF: ROM:001A7A70j
		bclr	#$06,Flags2(a5)
		bra.w	loc_1A8AEC
; ---------------------------------------------------------------------------

loc_1A7A86:					  ; CODE XREF: ROM:001A79B4j
		move.w	#$0029,d1
		move.w	#$0029,d2
		move.w	#$0019,d3
		bsr.w	sub_1A880C
		move.w	#$0500,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcc.w	loc_1A7AB8
		cmpi.b	#$02,Unk0D(a5)
		bne.s	locret_1A7AB6
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyDie1
; ---------------------------------------------------------------------------

locret_1A7AB6:					  ; CODE XREF: ROM:001A7AB0j
		rts
; ---------------------------------------------------------------------------

loc_1A7AB8:					  ; CODE XREF: ROM:001A7AA6j
		bsr.w	MoveSpriteOffscreen
		bra.w	EnemyAI_Ghost3
