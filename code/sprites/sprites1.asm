
; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_LoadSpriteBehaviour:				  ; DATA XREF: ROM:00013912t
						  ; ROM:loc_15DD2t ...
		jmp	LoadSpriteBehaviour(pc)	  ; D0 = spritedata[0x34] = bytes[4] & 0x03 << 8 | bytes[7]
; End of function j_LoadSpriteBehaviour


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_PlayEndCredits:				  ; DATA XREF: sub_EAD4:loc_EAEAt
						  ; ROM:00015718t
		jmp	PlayEndCredits(pc)
; End of function j_PlayEndCredits


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_LookupChestContents:				  ; DATA XREF: InitialiseSprites+214t
		jmp	LookupChestContents(pc)
; End of function j_LookupChestContents


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_9B00C:					  ; DATA XREF: CheckOpenChest+AAt
						  ; CheckOpenChest+E4t	...
		jmp	sub_9EB9C(pc)		  ; Church in cave
; End of function sub_9B00C


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_CheckIfChestOpened:				  ; DATA XREF: ROM:00011736t
						  ; ROM:00011746t ...
		jmp	CheckIfChestOpened(pc)
; End of function j_CheckIfChestOpened

; ---------------------------------------------------------------------------
		lea	(Sprite1_X).l,a5
		moveq	#$0000000E,d7

loc_9B01C:					  ; CODE XREF: ROM:0009B026j
		tst.w	(a5)
		bmi.s	locret_9B02A
		bsr.s	LoadSpriteBehaviour	  ; D0 = spritedata[0x34] = bytes[4] & 0x03 << 8 | bytes[7]
		lea	$00000080(a5),a5
		dbf	d7,loc_9B01C

locret_9B02A:					  ; CODE XREF: ROM:0009B01Ej
		rts

; =============== S U B	R O U T	I N E =======================================

; D0 = spritedata[0x34]	= bytes[4] & 0x03 << 8 | bytes[7]

LoadSpriteBehaviour:				  ; CODE XREF: ROM:0009B020p
						  ; DATA XREF: j_LoadSpriteBehaviourt
		lea	SpriteBehaviourOffsets(pc),a1
		clr.l	d1
		move.w	BehaviourLUTIndex(a5),d0
		beq.s	loc_9B044
		subq.w	#$01,d0

loc_9B03A:					  ; CODE XREF: LoadSpriteBehaviour+14j
		clr.l	d2			  ; Accumulate index into master lookup
		move.b	(a1)+,d2
		add.l	d2,d1
		dbf	d0,loc_9B03A		  ; Accumulate index into master lookup

loc_9B044:					  ; CODE XREF: LoadSpriteBehaviour+Aj
		lea	SpriteBehaviourTable(pc),a1
		adda.l	d1,a1
		move.l	a1,BehaviourLUTPtr(a5)
		move.b	(a1)+,BehavCmd(a5)
		move.b	(a1),BehavParam(a5)
		rts
; End of function LoadSpriteBehaviour

; ---------------------------------------------------------------------------
