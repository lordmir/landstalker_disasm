; ---------------------------------------------------------------------------

EnemyAI_Ghost2_B:				  ; CODE XREF: ROM:001A852Aj
		bra.s	EnemyAI_Ghost2
; ---------------------------------------------------------------------------

EnemyAI_Ghost2_A:				  ; CODE XREF: ROM:001A8526j
		btst	#$01,Flags2(a5)
		bne.s	loc_1A76D2
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A76D8
		cmpi.b	#$10,d0
		beq.s	loc_1A7718
		bra.w	loc_1A77A0
; ---------------------------------------------------------------------------

loc_1A76D2:					  ; CODE XREF: ROM:001A76C0j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A76D8:					  ; CODE XREF: ROM:001A76C6j
		bra.s	loc_1A76E0
; ---------------------------------------------------------------------------

EnemyAI_Ghost2:					  ; CODE XREF: ROM:EnemyAI_Ghost2_Bj
						  ; ROM:001A77B4j ...
		tst.b	Unk0A(a5)
		bpl.s	loc_1A76FC

loc_1A76E0:					  ; CODE XREF: ROM:loc_1A76D8j
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$20,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		clr.b	Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A76FC:					  ; CODE XREF: ROM:001A76DEj
						  ; ROM:001A7846j ...
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		clr.b	Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A7718:					  ; CODE XREF: ROM:001A76CCj
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.w	sub_1A7732
		bsr.w	j_j_OnTick
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A7732:					  ; CODE XREF: ROM:001A7728p
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A779C
		move.w	HitBoxZEnd(a5),d0
		sub.w	(Player_Z).l,d0
		cmpi.w	#$0020,d0
		bcc.s	loc_1A779C
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$005A,d7
		bcc.s	loc_1A7782
		move.b	#$21,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7782:					  ; CODE XREF: sub_1A7732+30j
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A779C:					  ; CODE XREF: sub_1A7732+10j
						  ; sub_1A7732+20j
		tst.b	d0
		rts
; End of function sub_1A7732

; ---------------------------------------------------------------------------

loc_1A77A0:					  ; CODE XREF: ROM:001A76CEj
		andi.b	#$0F,d0
		beq.s	loc_1A77B8
		cmpi.b	#$01,d0
		beq.s	loc_1A7806
		cmpi.b	#$02,d0
		beq.w	loc_1A7882
		bra.w	EnemyAI_Ghost2
; ---------------------------------------------------------------------------

loc_1A77B8:					  ; CODE XREF: ROM:001A77A4j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$08,Unk0D(a5)
		bcs.s	locret_1A7804
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$10,Unk0D(a5)
		bcs.s	locret_1A7804
		move.w	#$0300,QueuedAction(a5)
		cmpi.b	#$18,Unk0D(a5)
		bcs.s	locret_1A7804
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$20,Unk0D(a5)
		bcs.s	locret_1A7804
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)

locret_1A7804:					  ; CODE XREF: ROM:001A77C8j
						  ; ROM:001A77D6j ...
		rts
; ---------------------------------------------------------------------------

loc_1A7806:					  ; CODE XREF: ROM:001A77AAj
		tst.b	(byte_FF1145).l
		bne.w	EnemyAI_Ghost2
		tst.b	(byte_FF1142).l
		bne.w	loc_1A7826
		move.b	#$01,(byte_FF1142).l
		bra.w	*+4
; ---------------------------------------------------------------------------

loc_1A7826:					  ; CODE XREF: ROM:001A7816j
						  ; ROM:001A7822j
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0019,d5
		move.w	#$0009,d6
		move.w	#$0009,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A76FC
		move.b	Unk4D(a5),d0
		addq.b	#$01,Unk4D(a5)
		tst.b	d0
		bne.s	loc_1A786E
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_GhostAbsorbHP
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0100,d0
		bsr.w	j_j_RemoveHealth
		tst.w	CurrentHealth(a5)
		beq.s	loc_1A7878

loc_1A786E:					  ; CODE XREF: ROM:001A7854j
		cmpi.b	#$3C,d0
		bcc.w	loc_1A76FC
		rts
; ---------------------------------------------------------------------------

loc_1A7878:					  ; CODE XREF: ROM:001A786Cj
		bclr	#$06,Flags2(a5)
		bra.w	loc_1A8AEC
; ---------------------------------------------------------------------------

loc_1A7882:					  ; CODE XREF: ROM:001A77B0j
		move.w	#$0029,d1
		move.w	#$0029,d2
		move.w	#$0019,d3
		bsr.w	sub_1A880C
		move.w	#$0500,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcc.w	loc_1A78B4
		cmpi.b	#$02,Unk0D(a5)
		bne.s	locret_1A78B2
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyDie1
; ---------------------------------------------------------------------------

locret_1A78B2:					  ; CODE XREF: ROM:001A78ACj
		rts
; ---------------------------------------------------------------------------

loc_1A78B4:					  ; CODE XREF: ROM:001A78A2j
		bsr.w	MoveSpriteOffscreen
		bra.w	EnemyAI_Ghost2
