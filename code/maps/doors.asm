
; =============== S U B	R O U T	I N E =======================================


CheckForDoorNW:					  ; CODE XREF: sub_604C+188p
						  ; DATA XREF: j_CheckForDoorNWt
		move.l	#RAM_Start,d0
		move.w	(Player_HeightmapOffset).l,d0
		movea.l	d0,a0

loc_95BA:					  ; CODE XREF: CheckForDoorNW+1Cj
		suba.w	#$0094,a0
		move.w	(a0),d0
		andi.b	#$3F,d0
		cmpi.b	#FLOOR_DOOR_NW,d0
		beq.s	loc_95BA
		lea	$00000094(a0),a0
		move.w	#$FFFE,d5
		clr.b	d1
		move.b	#$01,d3
		bra.s	loc_9600
; End of function CheckForDoorNW


; =============== S U B	R O U T	I N E =======================================


CheckForDoorNE:					  ; CODE XREF: sub_604C+CAp
		move.l	#RAM_Start,d0
		move.w	(Player_HeightmapOffset).l,d0
		movea.l	d0,a0

loc_95E8:					  ; CODE XREF: CheckForDoorNE+18j
		move.w	-(a0),d0
		andi.b	#$3F,d0
		cmpi.b	#FLOOR_DOOR_NE,d0
		beq.s	loc_95E8
		addq.w	#$02,a0
		move.w	#$0002,d5
		move.b	#$01,d1
		clr.b	d3

loc_9600:					  ; CODE XREF: CheckForDoorNW+2Cj
		movem.w	d1/d3/d5,-(sp)
		move.w	(a0),d0
		movem.w	d0,-(sp)
		suba.l	#g_HeightMap,a0
		move.w	a0,d0
		ext.l	d0
		divu.w	#$0094,d0
		move.w	d0,d1			  ; Y co-ordinate (division)
		swap	d0
		lsr.b	#$01,d0			  ; X co-ordinate (remainder)
		lea	DoorLookup(pc),a0
		move.w	(g_RmNum1).l,d7
		moveq	#$00000000,d3
		moveq	#$00000000,d2

loc_962C:					  ; CODE XREF: CheckForDoorNE:loc_9634j
		move.b	(a0)+,d3
		beq.s	loc_9634		  ; Get	index to data based on room number
		subq.b	#$01,d3
		add.l	d3,d2

loc_9634:					  ; CODE XREF: CheckForDoorNE+54j
		dbf	d7,loc_962C		  ; Get	index to data based on room number
		tst.b	-$00000001(a0)
		beq.s	loc_9664		  ; Return, nothing to do
		lea	DoorTable(pc),a0	  ; Castle main	door
		adda.l	d2,a0			  ; Get	pointer	to start of room data
		moveq	#$0000001F,d7

loc_9646:					  ; CODE XREF: CheckForDoorNE:loc_9660j
		move.b	(a0)+,d2		  ; Byte 1 into	d2
		bmi.s	loc_9664		  ; Negative? Return
		move.b	d2,d4			  ; d4 = byte 1
		move.b	(a0)+,d3		  ; d3 = byte 2
		andi.b	#$3F,d2			  ; d2 &= 0x3F (Y COORD)
		cmp.b	d2,d1
		bne.s	loc_9660		  ; No match? loop
		move.b	d3,d5			  ; d5 = byte 2
		andi.b	#$3F,d3			  ; d5 &= 0x3F (X COORD)
		cmp.b	d3,d0
		beq.s	loc_9670		  ; Jump if X and Y match

loc_9660:					  ; CODE XREF: CheckForDoorNE+7Aj
		dbf	d7,loc_9646		  ; Byte 1 into	d2

loc_9664:					  ; CODE XREF: CheckForDoorNE+62j
						  ; CheckForDoorNE+6Ej
		movem.w	(sp)+,d0
		movem.w	(sp)+,d1/d3/d5
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_9670:					  ; CODE XREF: CheckForDoorNE+84j
		andi.b	#$40,d4
		andi.b	#$C0,d5
		lsr.b	#$03,d4			  ; d4 = bit 6 of byte 1
		lsr.b	#$05,d5			  ; d5 = bits 6-7 of byte 2
		or.b	d4,d5			  ; Combine bits. d5 between 0 and 7
		ext.w	d5
		move.b	DoorSizes(pc,d5.w),d6	  ; Lookup based on d5 value
		move.b	DoorSizes+1(pc,d5.w),d7
		sub.b	d6,d1			  ; Sub	d6 from	X and Y	co-ords
		sub.b	d6,d0
		movem.w	(sp)+,d5		  ; Heightmap entry
		lsr.w	#$08,d5
		andi.b	#$0F,d5			  ; Get	Z component
		sub.b	d5,d1
		sub.b	d5,d0
		move.b	d0,d2
		move.b	d1,d0
		subq.b	#$01,d6
		movem.w	(sp)+,d1/d3/d5
		add.b	d1,d2
		add.b	d3,d2
		add.b	d3,d0
		add.b	d6,d6
		ext.w	d6
		ext.w	d7
		andi.w	#$003F,d0
		move.w	d0,d1
		bsr.w	MultiplyD0By148
		andi.w	#$003F,d2
		move.w	d2,d3
		add.b	d2,d2
		add.w	d2,d0
		lea	(g_ForegroundBlocks).l,a0
		adda.w	d0,a0
		move.w	d3,d0
		move.w	d5,d4
		lsr.w	#$01,d4

loc_96D2:					  ; CODE XREF: CheckForDoorNE+106j
		movem.l	d0-d1/d4-d7,-(sp)
		bsr.s	sub_96EE
		movem.l	(sp)+,d0-d1/d4-d7
		adda.w	d5,a0
		add.b	d4,d0
		dbf	d7,loc_96D2
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_DoorLock
; End of function CheckForDoorNE

; ---------------------------------------------------------------------------
		ori	#$01,ccr
		rts

; =============== S U B	R O U T	I N E =======================================


sub_96EE:					  ; CODE XREF: CheckForDoorNE+FCp
		jmp	loc_9702(pc,d6.w)
; End of function sub_96EE

; ---------------------------------------------------------------------------
DoorSizes:	dc.b $04,$00			  ; 0
		dc.b $04,$01			  ; 2
		dc.b $05,$01			  ; 4
		dc.b $01,$00			  ; 6
		dc.b $01,$00			  ; 8
		dc.b $01,$00			  ; 10
		dc.b $01,$00			  ; 12
		dc.b $01,$00			  ; 14
; ---------------------------------------------------------------------------

loc_9702:
		bra.s	loc_9764
; ---------------------------------------------------------------------------
		bra.s	loc_9758
; ---------------------------------------------------------------------------
		bra.s	loc_974C
; ---------------------------------------------------------------------------
		bra.s	loc_9740
; ---------------------------------------------------------------------------
		bra.s	loc_9734
; ---------------------------------------------------------------------------
		bra.s	loc_9728
; ---------------------------------------------------------------------------
		bra.s	loc_971C
; ---------------------------------------------------------------------------
		clr.w	$0000041A(a0)
		bsr.w	sub_4B14
		addq.b	#$01,d0
		addq.b	#$01,d1

loc_971C:					  ; CODE XREF: ROM:0000970Ej
		clr.w	$00000384(a0)
		bsr.w	sub_4B14
		addq.b	#$01,d0
		addq.b	#$01,d1

loc_9728:					  ; CODE XREF: ROM:0000970Cj
		clr.w	$000002EE(a0)
		bsr.w	sub_4B14
		addq.b	#$01,d0
		addq.b	#$01,d1

loc_9734:					  ; CODE XREF: ROM:0000970Aj
		clr.w	$00000258(a0)
		bsr.w	sub_4B14
		addq.b	#$01,d0
		addq.b	#$01,d1

loc_9740:					  ; CODE XREF: ROM:00009708j
		clr.w	$000001C2(a0)
		bsr.w	sub_4B14
		addq.b	#$01,d0
		addq.b	#$01,d1

loc_974C:					  ; CODE XREF: ROM:00009706j
		clr.w	$0000012C(a0)
		bsr.w	sub_4B14
		addq.b	#$01,d0
		addq.b	#$01,d1

loc_9758:					  ; CODE XREF: ROM:00009704j
		clr.w	$00000096(a0)
		bsr.w	sub_4B14
		addq.b	#$01,d0
		addq.b	#$01,d1

loc_9764:					  ; CODE XREF: ROM:loc_9702j
		clr.w	(a0)
		bsr.w	sub_4B14
		rts
; ---------------------------------------------------------------------------
