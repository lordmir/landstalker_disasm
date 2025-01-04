
; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

HandleGameStartInput:				  ; CODE XREF: ROM:0000EF32p

var_2		= -2

		link	a4,#-$000C
		movea.l	a4,a0
		moveq	#$0000000B,d7

loc_FF1A:					  ; CODE XREF: HandleGameStartInput+Aj
		clr.b	-(a0)
		dbf	d7,loc_FF1A
		clr.b	-$00000019(a6)
		bsr.w	sub_FF78
		move.w	#$0060,-$0000000E(a6)
		move.w	#$0078,d7

loc_FF32:					  ; CODE XREF: HandleGameStartInput+5Ej
		bsr.w	sub_F2E2
		move.b	(g_Controller1State).l,d0
		cmpi.b	#CTRLBF_B,d0
		bcc.s	loc_FF74
		movem.w	d7,-(sp)
		move.w	#$0000,d0
		bsr.w	sub_10014
		move.w	#$0046,d0
		bsr.w	sub_FFE2
		bsr.w	sub_F13A
		move.w	#$0004,d0
		bsr.w	sub_1007E
		jsr	(WaitUntilVBlank).l
		addq.w	#$01,var_2(a4)
		movem.w	(sp)+,d7
		dbf	d7,loc_FF32

loc_FF74:					  ; CODE XREF: HandleGameStartInput+2Ej
		unlk	a4
		rts
; End of function HandleGameStartInput


; =============== S U B	R O U T	I N E =======================================


sub_FF78:					  ; CODE XREF: HandleGameStartInput+12p
		lea	((g_Buffer+2)).l,a0
		move.w	#$6000,d0
		move.w	(a0),d1
		move.w	#$036F,d7

loc_FF88:					  ; CODE XREF: sub_FF78+1Aj
		move.w	(a0),d2
		and.w	d0,d2
		bne.s	loc_FF90
		move.w	d0,(a0)

loc_FF90:					  ; CODE XREF: sub_FF78+14j
		addq.l	#$02,a0
		dbf	d7,loc_FF88
		lea	((g_Buffer+$52)).l,a0
		move.w	#$6000,d0
		move.w	(a0),d1
		move.w	#$0437,d7

loc_FFA6:					  ; CODE XREF: sub_FF78+3Aj
		move.w	(a0),d2
		and.w	d0,d2
		bne.s	loc_FFB0
		ori.w	#$2000,(a0)

loc_FFB0:					  ; CODE XREF: sub_FF78+32j
		addq.l	#$02,a0
		dbf	d7,loc_FFA6
		jsr	(WaitUntilVBlank).l
		bsr.w	sub_F30E
		lea	((g_Buffer+2)).l,a0
		move.w	#$045E,d7
		move.w	(a0)+,d0

loc_FFCC:					  ; CODE XREF: sub_FF78+56j
		move.w	d0,(a0)+
		dbf	d7,loc_FFCC
		jsr	(WaitUntilVBlank).l
		move.w	-$00000002(a6),d0
		bsr.w	sub_F72E
		rts
; End of function sub_FF78


; =============== S U B	R O U T	I N E =======================================


sub_FFE2:					  ; CODE XREF: HandleGameStartInput+40p

; FUNCTION CHUNK AT 0000FFF2 SIZE 0000000A BYTES
; FUNCTION CHUNK AT 00010002 SIZE 00000012 BYTES

		cmp.w	-$00000002(a4),d0
		bcs.s	loc_FFEA
		rts
; ---------------------------------------------------------------------------

loc_FFEA:					  ; CODE XREF: sub_FFE2+4j
		tst.b	-$00000009(a4)
		bpl.s	loc_FFF2
; End of function sub_FFE2


; =============== S U B	R O U T	I N E =======================================


nullsub_3:
		rts
; End of function nullsub_3

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_FFE2

loc_FFF2:					  ; CODE XREF: sub_FFE2+Cj
		bne.s	loc_10002
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordSwing
; ---------------------------------------------------------------------------
		bsr.w	sub_F0F8
; END OF FUNCTION CHUNK	FOR sub_FFE2
		move.b	#$01,-$00000009(a4)
; START	OF FUNCTION CHUNK FOR sub_FFE2

loc_10002:					  ; CODE XREF: sub_FFE2:loc_FFF2j
		tst.b	-$00000019(a6)
		beq.s	locret_10012
		bsr.w	sub_F1E4
		move.b	#$FF,-$00000009(a4)

locret_10012:					  ; CODE XREF: sub_FFE2+24j
		rts
; END OF FUNCTION CHUNK	FOR sub_FFE2

; =============== S U B	R O U T	I N E =======================================


sub_10014:					  ; CODE XREF: HandleGameStartInput+38p
		tst.b	-$0000000B(a4)
		beq.s	loc_1001C
		rts
; ---------------------------------------------------------------------------

loc_1001C:					  ; CODE XREF: sub_10014+4j
		cmp.w	-$00000002(a4),d0
		bcs.s	loc_10024
		rts
; ---------------------------------------------------------------------------

loc_10024:					  ; CODE XREF: sub_10014+Cj
		lea	word_1006E(pc),a0
		move.w	-$00000004(a6),d0
		lsl.w	#$02,d0
		move.w	(a0,d0.w),d1
		move.w	$00000002(a0,d0.w),d2
		add.w	d1,-$00000010(a6)
		add.w	d2,-$00000012(a6)
		move.w	-$00000010(a6),d6
		jsr	(j_FillHScrollData).l
		move.w	-$00000012(a6),d6
		neg.w	d6
		jsr	(j_FillVSRAM).l
		jsr	(j_EnableDMAQueueProcessing).l
		addq.w	#$01,-$00000006(a4)
		move.w	-$00000006(a4),d0
		cmpi.w	#$0024,d0
		bcs.s	locret_1006C
		addq.b	#$01,-$0000000B(a4)

locret_1006C:					  ; CODE XREF: sub_10014+52j
		rts
; End of function sub_10014

; ---------------------------------------------------------------------------
word_1006E:	dc.w $0002,$0001		  ; DATA XREF: sub_10014:loc_10024t
		dc.w $FFFE,$0001
		dc.w $0002,$FFFF
		dc.w $FFFE,$FFFF

; =============== S U B	R O U T	I N E =======================================


sub_1007E:					  ; CODE XREF: HandleGameStartInput+4Cp
		cmp.w	-$00000002(a4),d0
		bcs.s	loc_10086
		rts
; ---------------------------------------------------------------------------

loc_10086:					  ; CODE XREF: sub_1007E+4j
		bsr.w	sub_F89C
		rts
; End of function sub_1007E

; ---------------------------------------------------------------------------
