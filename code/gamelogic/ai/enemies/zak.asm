; ---------------------------------------------------------------------------

EnemyAI_Zak_B_0:				  ; CODE XREF: ROM:001A8622j
		bra.s	EnemyAI_Zak
; ---------------------------------------------------------------------------

EnemyAI_Zak_A_0:				  ; CODE XREF: ROM:001A861Ej
		btst	#$01,Flags2(a5)
		bne.s	loc_1ACD20
		move.b	ChestIndex(a5),d0
		beq.s	loc_1ACD26
		cmpi.b	#$10,d0
		beq.s	loc_1ACD5E
		bra.w	loc_1ACEFC
; ---------------------------------------------------------------------------

loc_1ACD20:					  ; CODE XREF: ROM:001ACD0Ej
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ACD26:					  ; CODE XREF: ROM:001ACD14j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0040,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	sub_1ACD54
		rts
; ---------------------------------------------------------------------------

EnemyAI_Zak:					  ; CODE XREF: ROM:EnemyAI_Zak_B_0j
		bsr.s	sub_1ACD54
		bra.w	loc_1ACE0C

; =============== S U B	R O U T	I N E =======================================


sub_1ACD54:					  ; CODE XREF: ROM:001ACD4Aj
						  ; ROM:EnemyAI_Zakp ...

; FUNCTION CHUNK AT 001A8AB6 SIZE 00000018 BYTES

		bset	#$08,FallRate(a5)
		bra.w	loc_1A8AB6
; End of function sub_1ACD54

; ---------------------------------------------------------------------------

loc_1ACD5E:					  ; CODE XREF: ROM:001ACD1Aj
		tst.b	(byte_FF1142).l
		bne.s	loc_1ACD94
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1ACD98
		bcs.s	loc_1ACD8E
		bsr.s	sub_1ACDD8
		bcs.s	loc_1ACD8E
		bsr.w	sub_1ACE2A
		bcs.s	loc_1ACD8E
		bsr.w	sub_1ACE66
		bcs.s	loc_1ACD8E
		bsr.w	sub_1ACEA2

loc_1ACD8E:					  ; CODE XREF: ROM:001ACD78j
						  ; ROM:001ACD7Cj ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ACD94:					  ; CODE XREF: ROM:001ACD64j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1ACD98:					  ; CODE XREF: ROM:001ACD76p
		move.w	#$0080,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACDD4
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00016,d7
		bhi.s	loc_1ACDD4
		move.b	#$25,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACDD4:					  ; CODE XREF: sub_1ACD98+10j
						  ; sub_1ACD98+20j
		tst.b	d0
		rts
; End of function sub_1ACD98


; =============== S U B	R O U T	I N E =======================================


sub_1ACDD8:					  ; CODE XREF: ROM:001ACD7Ap
		move.w	#$0070,d5
		move.w	#$0070,d6
		move.w	#$0070,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACE26
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ACE26
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00016,d7
		bhi.s	loc_1ACE26

loc_1ACE0C:					  ; CODE XREF: ROM:001ACD50j
		move.b	#$20,ChestIndex(a5)
		move.w	#$0004,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACE26:					  ; CODE XREF: sub_1ACDD8+10j
						  ; sub_1ACDD8+22j ...
		tst.b	d0
		rts
; End of function sub_1ACDD8


; =============== S U B	R O U T	I N E =======================================


sub_1ACE2A:					  ; CODE XREF: ROM:001ACD7Ep
		move.w	#$0060,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACE62
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1ACE62
		move.b	#$21,ChestIndex(a5)
		move.w	#$0012,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACE62:					  ; CODE XREF: sub_1ACE2A+10j
						  ; sub_1ACE2A+20j
		tst.b	d0
		rts
; End of function sub_1ACE2A


; =============== S U B	R O U T	I N E =======================================


sub_1ACE66:					  ; CODE XREF: ROM:001ACD84p
		move.w	#$0040,d5
		move.w	#$0020,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACE9E
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1ACE9E
		move.b	#$22,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACE9E:					  ; CODE XREF: sub_1ACE66+10j
						  ; sub_1ACE66+20j
		tst.b	d0
		rts
; End of function sub_1ACE66


; =============== S U B	R O U T	I N E =======================================


sub_1ACEA2:					  ; CODE XREF: ROM:001ACD8Ap
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACEF8
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	loc_1ACEDE
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACEDE:					  ; CODE XREF: sub_1ACEA2+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0012,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACEF8:					  ; CODE XREF: sub_1ACEA2+10j
		tst.b	d0
		rts
; End of function sub_1ACEA2

; ---------------------------------------------------------------------------

loc_1ACEFC:					  ; CODE XREF: ROM:001ACD1Cj
		andi.b	#$0F,d0
		beq.s	loc_1ACF26
		cmpi.b	#$01,d0
		beq.w	loc_1AD014
		cmpi.b	#$02,d0
		beq.w	loc_1AD014
		cmpi.b	#$03,d0
		beq.w	loc_1ACFDE
		cmpi.b	#$04,d0
		beq.w	loc_1AD014
		bra.w	loc_1AD04E
; ---------------------------------------------------------------------------

loc_1ACF26:					  ; CODE XREF: ROM:001ACF00j
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$1F,Unk4D(a5)
		bhi.s	loc_1ACF6A
		bset	#$07,FallRate(a5)
		addi.w	#$0004,Z(a5)
		addi.w	#$0004,HitBoxZEnd(a5)
		move.b	Unk4D(a5),d0
		andi.w	#$000E,d0
		lsl.w	#$07,d0
		move.w	d0,QueuedAction(a5)
		bsr.w	sub_1AC010
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d2,RotationAndSize(a5)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Slash1
; ---------------------------------------------------------------------------
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ACF6A:					  ; CODE XREF: ROM:001ACF30j
		bclr	#$07,FallRate(a5)
		cmpi.b	#$20,Unk4D(a5)
		bne.s	loc_1ACF98
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Fall
; ---------------------------------------------------------------------------
		move.w	#$0002,d6
		jsr	(j_GenerateRandomNumber).l
		move.w	#$0040,d0
		tst.b	d7
		beq.s	loc_1ACF92
		move.w	#$0058,d0

loc_1ACF92:					  ; CODE XREF: ROM:001ACF8Cj
		move.w	d0,RepeatPtr(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ACF98:					  ; CODE XREF: ROM:001ACF76j
		subq.b	#$01,Unk4D(a5)
		bclr	#$07,FallRate(a5)
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		beq.w	loc_1ACFD6
		move.w	(Player_Z).l,d0
		add.w	RepeatPtr(a5),d0
		cmp.w	Z(a5),d0
		bcc.s	loc_1ACFCE
		move.l	(Player_X).l,(a5)
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		rts
; ---------------------------------------------------------------------------

loc_1ACFCE:					  ; CODE XREF: ROM:001ACFBCj
		move.w	#$0300,QueuedAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ACFD6:					  ; CODE XREF: ROM:001ACFAAj
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_LadderClimb
; ---------------------------------------------------------------------------
		bra.w	sub_1ACD54
; ---------------------------------------------------------------------------

loc_1ACFDE:					  ; CODE XREF: ROM:001ACF16j
		move.w	#$0200,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1AD012
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0300,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1AD012
		beq.w	sub_1ACD54

locret_1AD012:					  ; CODE XREF: ROM:001ACFEEj
						  ; ROM:001AD00Cj
		rts
; ---------------------------------------------------------------------------

loc_1AD014:					  ; CODE XREF: ROM:001ACF06j
						  ; ROM:001ACF0Ej ...
		move.w	#$0200,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1AD048
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0300,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	loc_1AD048
		beq.w	sub_1ACD54

loc_1AD048:					  ; CODE XREF: ROM:001AD024j
						  ; ROM:001AD042j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AD04E:					  ; CODE XREF: ROM:001ACF22j
		move.w	#$0200,QueuedAction(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$0F,Unk4D(a5)
		bcs.s	locret_1AD09C
		bhi.s	loc_1AD09E
		move.w	#$0300,QueuedAction(a5)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Slash2
; ---------------------------------------------------------------------------
		move.b	#$03,d0
		move.w	#$1400,d1
		bsr.w	sub_1AC474
		bcs.w	locret_1AD09C
		move.w	#$44C0,TileSource(a1)
		move.b	#$04,Speed(a1)
		move.w	#$036A,BehaviourLUTIndex(a1)
		movem.l	a5,-(sp)
		movea.l	a1,a5
		bsr.w	j_j_LoadSpriteBehaviour
		movem.l	(sp)+,a5

locret_1AD09C:					  ; CODE XREF: ROM:001AD05Ej
						  ; ROM:001AD078j
		rts
; ---------------------------------------------------------------------------

loc_1AD09E:					  ; CODE XREF: ROM:001AD060j
		move.w	#$0300,QueuedAction(a5)
		cmpi.b	#$3C,Unk4D(a5)
		beq.w	sub_1ACD54
		rts
