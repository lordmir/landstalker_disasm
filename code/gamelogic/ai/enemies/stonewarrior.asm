; ---------------------------------------------------------------------------

EnemyAI_StoneWarrior_B:				  ; CODE XREF: ROM:001A86AAj
						  ; ROM:001A86D2j
		bra.s	EnemyAI_StoneWarrior
; ---------------------------------------------------------------------------

EnemyAI_StoneWarrior_A:				  ; CODE XREF: ROM:001A86A6j
						  ; ROM:001A86CEj
		btst	#$01,Flags2(a5)
		bne.s	loc_1AEC72
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AEC78
		cmpi.b	#$10,d0
		beq.s	loc_1AECB0
		bra.w	loc_1AED88
; ---------------------------------------------------------------------------

loc_1AEC72:					  ; CODE XREF: ROM:001AEC60j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AEC78:					  ; CODE XREF: ROM:001AEC66j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	sub_1AECAC
		rts
; ---------------------------------------------------------------------------

EnemyAI_StoneWarrior:				  ; CODE XREF: ROM:EnemyAI_StoneWarrior_Bj
		bsr.s	sub_1AECAC
		eori.b	#$80,RotationAndSize(a5)
		bra.w	loc_1AED50

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_1AECAC:					  ; CODE XREF: ROM:001AEC9Cj
						  ; ROM:EnemyAI_StoneWarriorp ...
		bra.w	loc_1A8AB6
; End of function sub_1AECAC

; ---------------------------------------------------------------------------

loc_1AECB0:					  ; CODE XREF: ROM:001AEC6Cj
		tst.b	(byte_FF1142).l
		bne.s	loc_1AECD8
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.w	sub_1AECDC
		bcs.s	loc_1AECD2
		bsr.w	sub_1AED2E

loc_1AECD2:					  ; CODE XREF: ROM:001AECCCj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AECD8:					  ; CODE XREF: ROM:001AECB6j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AECDC:					  ; CODE XREF: ROM:001AECC8p
		move.w	#$0080,d5
		move.w	#$0080,d6
		move.w	#$0080,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AED2A
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AED2A
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00006,d7
		bhi.s	loc_1AED2A
		move.b	#$24,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AED2A:					  ; CODE XREF: sub_1AECDC+10j
						  ; sub_1AECDC+22j ...
		tst.b	d0
		rts
; End of function sub_1AECDC


; =============== S U B	R O U T	I N E =======================================


sub_1AED2E:					  ; CODE XREF: ROM:001AECCEp
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AED84
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	loc_1AED6A

loc_1AED50:					  ; CODE XREF: ROM:001AECA8j
		move.b	#$23,ChestIndex(a5)
		move.w	#$000E,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AED6A:					  ; CODE XREF: sub_1AED2E+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AED84:					  ; CODE XREF: sub_1AED2E+10j
		tst.b	d0
		rts
; End of function sub_1AED2E

; ---------------------------------------------------------------------------

loc_1AED88:					  ; CODE XREF: ROM:001AEC6Ej
		andi.b	#$0F,d0
		beq.s	loc_1AEDA2
		cmpi.b	#$01,d0
		beq.s	loc_1AEDAE
		cmpi.b	#$02,d0
		beq.s	loc_1AEDAE
		cmpi.b	#$03,d0
		beq.s	loc_1AEDB4
		bra.s	loc_1AEDF0
; ---------------------------------------------------------------------------

loc_1AEDA2:					  ; CODE XREF: ROM:001AED8Cj
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		beq.w	sub_1AECAC

loc_1AEDAE:					  ; CODE XREF: ROM:001AED92j
						  ; ROM:001AED98j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AEDB4:					  ; CODE XREF: ROM:001AED9Ej
		bclr	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		beq.w	loc_1AEDD2
		bset	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AEDD2:					  ; CODE XREF: ROM:001AEDC2j
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$01,Unk4D(a5)
		bne.s	loc_1AEDEA
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_DoorLock
; ---------------------------------------------------------------------------
		move.w	#$0400,QueuedAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AEDEA:					  ; CODE XREF: ROM:001AEDDCj
		bsr.s	sub_1AEE66
		bra.w	sub_1AECAC
; ---------------------------------------------------------------------------

loc_1AEDF0:					  ; CODE XREF: ROM:001AEDA0j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$0F,Unk4D(a5)
		bcs.w	locret_1AEED6
		move.w	#$0200,QueuedAction(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$1E,Unk4D(a5)
		bcs.w	locret_1AEED6
		bne.s	loc_1AEE1E
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_DoorLock
; ---------------------------------------------------------------------------

loc_1AEE1E:					  ; CODE XREF: ROM:001AEE18j
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0300,QueuedAction(a5)
		cmpi.b	#$20,Unk4D(a5)
		bne.w	loc_1AEEC4
		bsr.w	sub_1AEE66
		move.b	(Player_Z+1).l,d0
		cmp.b	(Player_FloorHeight).l,d0
		bne.s	loc_1AEE62
		tst.b	(byte_FF1142).l
		bne.s	loc_1AEE62
		move.b	#$08,d0			  ; Stun player
		jsr	(j_PlaybackInput).l

loc_1AEE62:					  ; CODE XREF: ROM:001AEE4Ej
						  ; ROM:001AEE56j
		tst.b	d0
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1AEE66:					  ; CODE XREF: ROM:loc_1AEDEAp
						  ; ROM:001AEE3Ep ...
		moveq	#$00000007,d7
		move.w	#$0009,d0

loc_1AEE6C:					  ; CODE XREF: sub_1AEE66+58j
		movem.w	d7,-(sp)
		move.w	#$0007,d6

loc_1AEE74:					  ; CODE XREF: sub_1AEE66+4Ej
		movem.w	d0/d6,-(sp)
		movem.w	d0,-(sp)
		add.w	d0,(g_VSRAMData).l
		add.w	d0,(g_VSRAMData+2).l
		jsr	(j_QueueVSRAMUpdate).l
		jsr	(j_FlushDMACopyQueue).l
		movem.w	(sp)+,d0
		sub.w	d0,(g_VSRAMData).l
		sub.w	d0,(g_VSRAMData+2).l
		jsr	(j_QueueVSRAMUpdate).l
		jsr	(j_FlushDMACopyQueue).l
		movem.w	(sp)+,d0/d6
		dbf	d6,loc_1AEE74
		subq.w	#$01,d0
		movem.w	(sp)+,d7
		dbf	d7,loc_1AEE6C
		rts
; End of function sub_1AEE66

; ---------------------------------------------------------------------------

loc_1AEEC4:					  ; CODE XREF: ROM:001AEE3Aj
		cmpi.b	#$2D,Unk4D(a5)
		bcs.s	locret_1AEED6
		bra.w	sub_1AECAC
; ---------------------------------------------------------------------------
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

locret_1AEED6:					  ; CODE XREF: ROM:001AEE00j
						  ; ROM:001AEE14j ...
		rts
