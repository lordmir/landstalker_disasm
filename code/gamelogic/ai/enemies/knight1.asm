; ---------------------------------------------------------------------------

EnemyAI_Knight1_B:				  ; CODE XREF: ROM:001A850Aj
		bra.s	EnemyAI_Knight1
; ---------------------------------------------------------------------------

EnemyAI_Knight1_A:				  ; CODE XREF: ROM:001A8506j
		btst	#$01,Flags2(a5)
		bne.s	loc_1A6EB6
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A6EBC
		cmpi.b	#$10,d0
		beq.s	loc_1A6EE8
		bra.w	loc_1A703A
; ---------------------------------------------------------------------------

loc_1A6EB6:					  ; CODE XREF: ROM:001A6EA4j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A6EBC:					  ; CODE XREF: ROM:001A6EAAj
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0010,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Knight1
		rts
; ---------------------------------------------------------------------------

EnemyAI_Knight1:				  ; CODE XREF: ROM:EnemyAI_Knight1_Bj
						  ; ROM:001A6EE0j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A6EE8:					  ; CODE XREF: ROM:001A6EB0j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A6F18
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A6F1C
		bcs.s	loc_1A6F12
		bsr.s	sub_1A6F58
		bcs.s	loc_1A6F12
		bsr.w	sub_1A6F94
		bcs.s	loc_1A6F12
		bsr.w	sub_1A6FE0

loc_1A6F12:					  ; CODE XREF: ROM:001A6F02j
						  ; ROM:001A6F06j ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A6F18:					  ; CODE XREF: ROM:001A6EEEj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A6F1C:					  ; CODE XREF: ROM:001A6F00p
		move.w	#$0048,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6F54
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00037,d7
		bhi.s	loc_1A6F54
		move.b	#$20,ChestIndex(a5)
		move.w	#$0013,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6F54:					  ; CODE XREF: sub_1A6F1C+10j
						  ; sub_1A6F1C+20j
		tst.b	d0
		rts
; End of function sub_1A6F1C


; =============== S U B	R O U T	I N E =======================================


sub_1A6F58:					  ; CODE XREF: ROM:001A6F04p
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6F90
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	loc_1A6F90
		move.b	#$21,ChestIndex(a5)
		move.w	#$0008,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6F90:					  ; CODE XREF: sub_1A6F58+10j
						  ; sub_1A6F58+20j
		tst.b	d0
		rts
; End of function sub_1A6F58


; =============== S U B	R O U T	I N E =======================================


sub_1A6F94:					  ; CODE XREF: ROM:001A6F08p
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6FDC
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00150,d7
		bhi.s	loc_1A6FDC
		move.b	(Player_Action).l,d0	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		andi.b	#$07,d0
		beq.s	loc_1A6FDC
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6FDC:					  ; CODE XREF: sub_1A6F94+10j
						  ; sub_1A6F94+20j ...
		tst.b	d0
		rts
; End of function sub_1A6F94


; =============== S U B	R O U T	I N E =======================================


sub_1A6FE0:					  ; CODE XREF: ROM:001A6F0Ep
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7036
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00030,d7
		bcc.s	loc_1A701C
		move.b	#$23,ChestIndex(a5)
		move.w	#$0009,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A701C:					  ; CODE XREF: sub_1A6FE0+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7036:					  ; CODE XREF: sub_1A6FE0+10j
		tst.b	d0
		rts
; End of function sub_1A6FE0

; ---------------------------------------------------------------------------

loc_1A703A:					  ; CODE XREF: ROM:001A6EB2j
		andi.b	#$0F,d0
		beq.s	loc_1A7056
		cmpi.b	#$01,d0
		beq.s	loc_1A7056
		cmpi.b	#$02,d0
		beq.s	loc_1A705C
		cmpi.b	#$03,d0
		beq.s	loc_1A708E
		bra.w	loc_1A708E
; ---------------------------------------------------------------------------

loc_1A7056:					  ; CODE XREF: ROM:001A703Ej
						  ; ROM:001A7044j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A705C:					  ; CODE XREF: ROM:001A704Aj
		move.w	#$0300,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$05,Unk0D(a5)
		bcs.s	loc_1A7086
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$17,Unk0D(a5)
		bcs.s	loc_1A7086
		bclr	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bra.w	EnemyAI_Knight1
; ---------------------------------------------------------------------------

loc_1A7086:					  ; CODE XREF: ROM:001A706Cj
						  ; ROM:001A707Aj
		bset	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		rts
; ---------------------------------------------------------------------------

loc_1A708E:					  ; CODE XREF: ROM:001A7050j
						  ; ROM:001A7052j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1A70C2
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	loc_1A70C2
		bra.w	EnemyAI_Knight1
; ---------------------------------------------------------------------------

loc_1A70C2:					  ; CODE XREF: ROM:001A709Ej
						  ; ROM:001A70BCj
		bsr.w	j_j_OnTick
		rts
