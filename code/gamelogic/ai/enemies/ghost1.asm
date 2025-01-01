; ---------------------------------------------------------------------------

EnemyAI_Ghost1_B:				  ; CODE XREF: ROM:001A8522j
		bra.s	EnemyAI_Ghost1
; ---------------------------------------------------------------------------

EnemyAI_Ghost1_A:				  ; CODE XREF: ROM:001A851Ej
		btst	#$01,Flags2(a5)
		bne.s	loc_1A7536
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A753C
		cmpi.b	#$10,d0
		beq.s	loc_1A757C
		bra.w	loc_1A75E4
; ---------------------------------------------------------------------------

loc_1A7536:					  ; CODE XREF: ROM:001A7524j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A753C:					  ; CODE XREF: ROM:001A752Aj
		bra.s	loc_1A7544
; ---------------------------------------------------------------------------

EnemyAI_Ghost1:					  ; CODE XREF: ROM:EnemyAI_Ghost1_Bj
						  ; ROM:001A75F0j ...
		tst.b	Unk0A(a5)
		bpl.s	loc_1A7560

loc_1A7544:					  ; CODE XREF: ROM:loc_1A753Cj
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$20,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		clr.b	Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A7560:					  ; CODE XREF: ROM:001A7542j
						  ; ROM:001A767Cj ...
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		clr.b	Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A757C:					  ; CODE XREF: ROM:001A7530j
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.w	sub_1A7596
		bsr.w	j_j_OnTick
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A7596:					  ; CODE XREF: ROM:001A758Cp
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A75E0
		move.w	HitBoxZEnd(a5),d0
		sub.w	(Player_Z).l,d0
		cmpi.w	#$0020,d0
		bcc.s	loc_1A75E0
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		move.b	#$21,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A75E0:					  ; CODE XREF: sub_1A7596+10j
						  ; sub_1A7596+20j
		tst.b	d0
		rts
; End of function sub_1A7596

; ---------------------------------------------------------------------------

loc_1A75E4:					  ; CODE XREF: ROM:001A7532j
		andi.b	#$0F,d0
		beq.s	loc_1A75F4
		cmpi.b	#$01,d0
		beq.s	loc_1A7642
		bra.w	EnemyAI_Ghost1
; ---------------------------------------------------------------------------

loc_1A75F4:					  ; CODE XREF: ROM:001A75E8j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$08,Unk0D(a5)
		bcs.s	locret_1A7640
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$10,Unk0D(a5)
		bcs.s	locret_1A7640
		move.w	#$0300,QueuedAction(a5)
		cmpi.b	#$18,Unk0D(a5)
		bcs.s	locret_1A7640
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$20,Unk0D(a5)
		bcs.s	locret_1A7640
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)

locret_1A7640:					  ; CODE XREF: ROM:001A7604j
						  ; ROM:001A7612j ...
		rts
; ---------------------------------------------------------------------------

loc_1A7642:					  ; CODE XREF: ROM:001A75EEj
		tst.b	(g_PlayerAnimation).l
		bne.w	EnemyAI_Ghost1
		tst.b	(byte_FF1142).l
		bne.s	loc_1A765C
		move.b	#$01,(byte_FF1142).l

loc_1A765C:					  ; CODE XREF: ROM:001A7652j
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A7560
		move.b	Unk4D(a5),d0
		addq.b	#$01,Unk4D(a5)
		tst.b	d0
		bne.s	loc_1A76A4
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_GhostAbsorbHP
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0080,d0
		bsr.w	j_j_RemoveHealth
		tst.w	CurrentHealth(a5)
		beq.s	loc_1A76AE

loc_1A76A4:					  ; CODE XREF: ROM:001A768Aj
		cmpi.b	#$3C,d0
		bcc.w	loc_1A7560
		rts
; ---------------------------------------------------------------------------

loc_1A76AE:					  ; CODE XREF: ROM:001A76A2j
		bclr	#$06,Flags2(a5)
		bra.w	loc_1A8AEC
