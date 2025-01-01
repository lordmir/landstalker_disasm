; ---------------------------------------------------------------------------

EnemyAI_Knight2_B:				  ; CODE XREF: ROM:001A8512j
		bra.s	EnemyAI_Knight2
; ---------------------------------------------------------------------------

EnemyAI_Knight2_A:				  ; CODE XREF: ROM:001A850Ej
		btst	#$01,Flags2(a5)
		bne.s	loc_1A70E2
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A70E8
		cmpi.b	#$10,d0
		beq.s	loc_1A7114
		bra.w	loc_1A7266
; ---------------------------------------------------------------------------

loc_1A70E2:					  ; CODE XREF: ROM:001A70D0j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A70E8:					  ; CODE XREF: ROM:001A70D6j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0010,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Knight2
		rts
; ---------------------------------------------------------------------------

EnemyAI_Knight2:				  ; CODE XREF: ROM:EnemyAI_Knight2_Bj
						  ; ROM:001A710Cj ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A7114:					  ; CODE XREF: ROM:001A70DCj
		tst.b	(byte_FF1142).l
		bne.s	loc_1A7144
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A7148
		bcs.s	loc_1A713E
		bsr.s	sub_1A7184
		bcs.s	loc_1A713E
		bsr.w	sub_1A71C0
		bcs.s	loc_1A713E
		bsr.w	sub_1A720C

loc_1A713E:					  ; CODE XREF: ROM:001A712Ej
						  ; ROM:001A7132j ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A7144:					  ; CODE XREF: ROM:001A711Aj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A7148:					  ; CODE XREF: ROM:001A712Cp
		move.w	#$0048,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7180
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	loc_1A7180
		move.b	#$20,ChestIndex(a5)
		move.w	#$0013,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7180:					  ; CODE XREF: sub_1A7148+10j
						  ; sub_1A7148+20j
		tst.b	d0
		rts
; End of function sub_1A7148


; =============== S U B	R O U T	I N E =======================================


sub_1A7184:					  ; CODE XREF: ROM:001A7130p
		move.w	#$0030,d5
		move.w	#$FFE8,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A71BC
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	loc_1A71BC
		move.b	#$21,ChestIndex(a5)
		move.w	#$0012,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A71BC:					  ; CODE XREF: sub_1A7184+10j
						  ; sub_1A7184+20j
		tst.b	d0
		rts
; End of function sub_1A7184


; =============== S U B	R O U T	I N E =======================================


sub_1A71C0:					  ; CODE XREF: ROM:001A7134p
		move.w	#$0030,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7208
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00150,d7
		bhi.s	loc_1A7208
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
		beq.s	loc_1A7208
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7208:					  ; CODE XREF: sub_1A71C0+10j
						  ; sub_1A71C0+20j ...
		tst.b	d0
		rts
; End of function sub_1A71C0


; =============== S U B	R O U T	I N E =======================================


sub_1A720C:					  ; CODE XREF: ROM:001A713Ap
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7262
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00020,d7
		bcc.s	loc_1A7248
		move.b	#$23,ChestIndex(a5)
		move.w	#$0009,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7248:					  ; CODE XREF: sub_1A720C+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7262:					  ; CODE XREF: sub_1A720C+10j
		tst.b	d0
		rts
; End of function sub_1A720C

; ---------------------------------------------------------------------------

loc_1A7266:					  ; CODE XREF: ROM:001A70DEj
		andi.b	#$0F,d0
		beq.s	loc_1A7282
		cmpi.b	#$01,d0
		beq.s	loc_1A72BA
		cmpi.b	#$02,d0
		beq.s	loc_1A7288
		cmpi.b	#$03,d0
		beq.s	loc_1A72BA
		bra.w	loc_1A72BA
; ---------------------------------------------------------------------------

loc_1A7282:					  ; CODE XREF: ROM:001A726Aj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A7288:					  ; CODE XREF: ROM:001A7276j
		move.w	#$0300,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$05,Unk0D(a5)
		bcs.s	loc_1A72B2
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$17,Unk0D(a5)
		bcs.s	loc_1A72B2
		bclr	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bra.w	EnemyAI_Knight2
; ---------------------------------------------------------------------------

loc_1A72B2:					  ; CODE XREF: ROM:001A7298j
						  ; ROM:001A72A6j
		bset	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		rts
; ---------------------------------------------------------------------------

loc_1A72BA:					  ; CODE XREF: ROM:001A7270j
						  ; ROM:001A727Cj ...
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1A72EE
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	loc_1A72EE
		bra.w	EnemyAI_Knight2
; ---------------------------------------------------------------------------

loc_1A72EE:					  ; CODE XREF: ROM:001A72CAj
						  ; ROM:001A72E8j
		bsr.w	j_j_OnTick
		rts
