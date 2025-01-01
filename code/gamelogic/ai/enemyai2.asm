
; =============== S U B	R O U T	I N E =======================================


MoveSpriteOffscreen:				  ; CODE XREF: ROM:loc_1A78B4p
						  ; ROM:loc_1A7AB8p ...
		move.b	#$7F,X(a5)
		move.b	#$7F,Y(a5)
		move.b	#$7F,CentreX(a5)
		move.b	#$7F,CentreY(a5)
		move.b	#$7F,HitBoxXStart(a5)
		move.b	#$7F,HitBoxXEnd(a5)
		rts
; End of function MoveSpriteOffscreen


; =============== S U B	R O U T	I N E =======================================


HideSprite:					  ; DATA XREF: j_HideSpritet
		ori.b	#$01,Flags1(a5)
		bra.s	MoveSpriteOffscreen
; End of function HideSprite

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1A83E6

loc_1A87D2:					  ; CODE XREF: sub_1A83E6+3BEj
		clr.w	QueuedAction(a5)
		move.w	#$FFFF,PrevAction(a5)
		clr.w	AnimationFrame(a5)
		ori.b	#$80,Unk0A(a5)
		cmpi.b	#$18,SpriteGraphic(a5)
		bne.s	loc_1A8800
		move.w	#$0008,AnimationIndex(a5)
		bset	#$07,Unk48(a5)
		bsr.w	sub_1A86D6
		rts
; ---------------------------------------------------------------------------

loc_1A8800:					  ; CODE XREF: sub_1A83E6+406j
		bset	#$07,Unk48(a5)
		clr.w	AnimationIndex(a5)
		rts
; END OF FUNCTION CHUNK	FOR sub_1A83E6

; =============== S U B	R O U T	I N E =======================================


sub_1A880C:					  ; CODE XREF: ROM:001A4E9Cp
						  ; ROM:001A50C8p ...
		bsr.s	sub_1A8824
		bcc.s	locret_1A8822
		move.b	d0,(byte_FF1143).l
		move.w	AttackStrength(a5),(Player_AttackStrength).l
		ori	#$01,ccr

locret_1A8822:					  ; CODE XREF: sub_1A880C+2j
		rts
; End of function sub_1A880C


; =============== S U B	R O U T	I N E =======================================


sub_1A8824:					  ; CODE XREF: sub_1A880Cp
		move.w	d3,d4
		move.w	Z(a5),d5
		move.w	HitBoxZEnd(a5),d6
		lea	(Player_X).l,a1
		move.b	RotationAndSize(a5),d7
		andi.b	#$C0,d7
		beq.s	loc_1A8890
		cmpi.b	#$80,d7
		beq.w	loc_1A88D8
		bcs.w	loc_1A891E
		neg.w	d1
		add.w	CentreX(a5),d1
		add.w	CentreX(a5),d2
		neg.w	d3
		add.w	CentreY(a5),d3
		add.w	CentreY(a5),d4
		cmp.w	HitBoxXEnd(a1),d1
		bhi.s	loc_1A888C
		cmp.w	HitBoxXStart(a1),d2
		bcs.s	loc_1A888C
		cmp.w	HitBoxYEnd(a1),d3
		bhi.s	loc_1A888C
		cmp.w	HitBoxYStart(a1),d4
		bcs.s	loc_1A888C
		cmp.w	HitBoxZEnd(a1),d5
		bhi.s	loc_1A888C
		cmp.w	Z(a1),d6
		bcs.s	loc_1A888C
		move.b	#$43,d0
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A888C:					  ; CODE XREF: sub_1A8824+3Ej
						  ; sub_1A8824+44j ...
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1A8890:					  ; CODE XREF: sub_1A8824+18j
		neg.w	d1
		add.w	CentreY(a5),d1
		add.w	CentreY(a5),d2
		add.w	CentreX(a5),d3
		neg.w	d4
		add.w	CentreX(a5),d4
		cmp.w	HitBoxYEnd(a1),d1
		bhi.s	loc_1A88D4
		cmp.w	HitBoxYStart(a1),d2
		bcs.s	loc_1A88D4
		cmp.w	HitBoxXStart(a1),d3
		bcs.w	loc_1A88D4
		cmp.w	HitBoxXEnd(a1),d4
		bhi.s	loc_1A88D4
		cmp.w	HitBoxZEnd(a1),d5
		bhi.s	loc_1A88D4
		cmp.w	Z(a1),d6
		bcs.s	loc_1A88D4
		move.b	#$40,d0
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A88D4:					  ; CODE XREF: sub_1A8824+84j
						  ; sub_1A8824+8Aj ...
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1A88D8:					  ; CODE XREF: sub_1A8824+1Ej
		add.w	CentreY(a5),d1
		neg.w	d2
		add.w	CentreY(a5),d2
		neg.w	d3
		add.w	CentreX(a5),d3
		add.w	CentreX(a5),d4
		cmp.w	HitBoxYStart(a1),d1
		bcs.s	loc_1A891A
		cmp.w	HitBoxYEnd(a1),d2
		bhi.s	loc_1A891A
		cmp.w	HitBoxXEnd(a1),d3
		bhi.s	loc_1A891A
		cmp.w	HitBoxXStart(a1),d4
		bcs.s	loc_1A891A
		cmp.w	HitBoxZEnd(a1),d5
		bhi.s	loc_1A891A
		cmp.w	Z(a1),d6
		bcs.s	loc_1A891A
		move.b	#$42,d0
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A891A:					  ; CODE XREF: sub_1A8824+CCj
						  ; sub_1A8824+D2j ...
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1A891E:					  ; CODE XREF: sub_1A8824+22j
		add.w	CentreX(a5),d1
		neg.w	d2
		add.w	CentreX(a5),d2
		add.w	CentreY(a5),d3
		neg.w	d4
		add.w	CentreY(a5),d4
		cmp.w	HitBoxXStart(a1),d1
		bcs.s	loc_1A8960
		cmp.w	HitBoxXEnd(a1),d2
		bhi.s	loc_1A8960
		cmp.w	HitBoxYStart(a1),d3
		bcs.s	loc_1A8960
		cmp.w	HitBoxYEnd(a1),d4
		bhi.s	loc_1A8960
		cmp.w	HitBoxZEnd(a1),d5
		bhi.s	loc_1A8960
		cmp.w	Z(a1),d6
		bcs.s	loc_1A8960
		move.b	#$41,d0
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8960:					  ; CODE XREF: sub_1A8824+112j
						  ; sub_1A8824+118j ...
		tst.b	d0
		rts
; End of function sub_1A8824


; =============== S U B	R O U T	I N E =======================================


sub_1A8964:					  ; CODE XREF: ROM:001A4CCEp
						  ; sub_1A4D0E+Cp ...
		move.b	RotationAndSize(a5),d0
		andi.b	#$C0,d0
		beq.s	loc_1A89C8
		cmpi.b	#$80,d0
		bcs.w	loc_1A8A16
		beq.w	loc_1A8A5C
		move.w	(word_FF1800).l,d1
		sub.w	d5,d1
		cmp.w	(Player_CentreX).l,d1
		bhi.w	loc_1A8AA2
		move.w	(word_FF1800).l,d1
		add.w	d6,d1
		cmp.w	(Player_CentreX).l,d1
		bcs.w	loc_1A8AA2
		move.w	(dword_FF1804).l,d2
		sub.w	d7,d2
		cmp.w	(Player_CentreY).l,d2
		bhi.w	loc_1A8AA2
		move.w	(dword_FF1804).l,d2
		add.w	d7,d2
		cmp.w	(Player_CentreY).l,d2
		bcs.w	loc_1A8AA2
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A89C8:					  ; CODE XREF: sub_1A8964+8j
		move.w	(word_FF1800).l,d1
		sub.w	d7,d1
		cmp.w	(Player_CentreX).l,d1
		bhi.w	loc_1A8AA2
		move.w	(word_FF1800).l,d1
		add.w	d7,d1
		cmp.w	(Player_CentreX).l,d1
		bcs.w	loc_1A8AA2
		move.w	(dword_FF1804).l,d2
		sub.w	d5,d2
		cmp.w	(Player_CentreY).l,d2
		bhi.w	loc_1A8AA2
		move.w	(dword_FF1804).l,d2
		add.w	d6,d2
		cmp.w	(Player_CentreY).l,d2
		bcs.w	loc_1A8AA2
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8A16:					  ; CODE XREF: sub_1A8964+Ej
		move.w	(word_FF1800).l,d1
		add.w	d5,d1
		cmp.w	(Player_CentreX).l,d1
		bcs.s	loc_1A8AA2
		move.w	(word_FF1800).l,d1
		sub.w	d6,d1
		cmp.w	(Player_CentreX).l,d1
		bhi.s	loc_1A8AA2
		move.w	(dword_FF1804).l,d2
		sub.w	d7,d2
		cmp.w	(Player_CentreY).l,d2
		bhi.s	loc_1A8AA2
		move.w	(dword_FF1804).l,d2
		add.w	d7,d2
		cmp.w	(Player_CentreY).l,d2
		bcs.s	loc_1A8AA2
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8A5C:					  ; CODE XREF: sub_1A8964+12j
		move.w	(word_FF1800).l,d1
		sub.w	d7,d1
		cmp.w	(Player_CentreX).l,d1
		bhi.s	loc_1A8AA2
		move.w	(word_FF1800).l,d1
		add.w	d7,d1
		cmp.w	(Player_CentreX).l,d1
		bcs.s	loc_1A8AA2
		move.w	(dword_FF1804).l,d2
		add.w	d5,d2
		cmp.w	(Player_CentreY).l,d2
		bcs.s	loc_1A8AA2
		move.w	(dword_FF1804).l,d2
		sub.w	d6,d2
		cmp.w	(Player_CentreY).l,d2
		bhi.s	loc_1A8AA2
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8AA2:					  ; CODE XREF: sub_1A8964+24j
						  ; sub_1A8964+36j ...
		tst.b	d0
		rts
; End of function sub_1A8964

; ---------------------------------------------------------------------------

loc_1A8AA6:					  ; CODE XREF: ROM:loc_1A4D0Aj
						  ; ROM:loc_1A4F30j ...
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1ACD54

loc_1A8AB6:					  ; CODE XREF: ROM:EnemyAI_Orc1j
						  ; ROM:EnemyAI_Orc2j ...
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; END OF FUNCTION CHUNK	FOR sub_1ACD54

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_j_RemoveHealth:				  ; CODE XREF: ROM:001A769Ap
						  ; ROM:001A7864p ...
		jmp	(j_RemoveHealth).l
; End of function j_j_RemoveHealth


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_j_AddStatusEffect:				  ; CODE XREF: ROM:001A5AA6p
						  ; ROM:loc_1A5EC2p ...
		jmp	(j_AddStatusEffect).l
; End of function j_j_AddStatusEffect


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_j_OnTick:					  ; CODE XREF: ROM:loc_1A4CA8p
						  ; ROM:loc_1A4CAEp ...
		jmp	(j_OnTick).l
; End of function j_j_OnTick


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_j_LoadSpriteBehaviour:			  ; CODE XREF: sub_1A4D0E+40p
						  ; sub_1A4D5C+40p ...
		jmp	(j_LoadSpriteBehaviour).l
; End of function j_j_LoadSpriteBehaviour


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_1A8AE6:					  ; CODE XREF: sub_1A83E6+3B4p
						  ; DATA XREF: ROM:001A6412t ...
		jmp	(sub_1038E).l
; End of function sub_1A8AE6

; ---------------------------------------------------------------------------

loc_1A8AEC:					  ; CODE XREF: ROM:001A76B4j
						  ; ROM:001A787Ej ...
		jmp	(j_PlayerDeath).l
