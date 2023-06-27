
; =============== S U B	R O U T	I N E =======================================


sub_9EF8:					  ; CODE XREF: LoadRoom_0+44p
		lea	(unk_FF1218).l,a1
		clr.b	d7
		move.w	(g_RmNum1).l,d0
		bsr.s	sub_9F1C
		move.w	(g_RmNum1).l,d0
		bsr.w	GetOriginalRoomNum
		cmp.w	(g_RmNum1).l,d0
		beq.w	locret_A0A0
; End of function sub_9EF8


; =============== S U B	R O U T	I N E =======================================


sub_9F1C:					  ; CODE XREF: sub_9EF8+Ep
		movea.l	(RoomExitsPtr).l,a0

loc_9F22:					  ; CODE XREF: sub_9F1C+17Cj
		move.w	(a0),d1
		bmi.w	loc_A09C
		andi.w	#$03FF,d1
		cmp.w	d1,d0
		bne.w	loc_9FE4
		addq.b	#$01,d7
		cmpi.b	#$20,d7
		bhi.w	loc_A0A2
		move.w	(a0),d1
		rol.w	#$07,d1
		andi.b	#$3F,d1
		move.w	$00000002(a0),d3
		move.w	d3,(a1)+
		move.w	$00000004(a0),d4
		andi.w	#$03FF,d4
		move.w	d4,(a1)+
		move.w	$00000006(a0),d5
		move.b	d1,d6
		andi.b	#$30,d1
		beq.s	loc_9F74
		cmpi.b	#$10,d1
		bne.s	loc_9F6A
		subq.b	#$01,d5
		bra.s	loc_9F74
; ---------------------------------------------------------------------------

loc_9F6A:					  ; CODE XREF: sub_9F1C+48j
		cmpi.b	#$20,d1
		bne.s	loc_9F74
		subi.w	#$0100,d5

loc_9F74:					  ; CODE XREF: sub_9F1C+42j
						  ; sub_9F1C+4Cj ...
		move.w	d5,(a1)+
		move.b	d6,d1
		andi.b	#$0C,d6
		beq.w	loc_A096
		cmpi.b	#$04,d6
		bne.s	loc_9F90
		addi.w	#$0100,d3
		addi.w	#$0100,d5
		bra.s	loc_9F9C
; ---------------------------------------------------------------------------

loc_9F90:					  ; CODE XREF: sub_9F1C+68j
		cmpi.b	#$08,d6
		bne.w	loc_A096
		addq.b	#$01,d3
		addq.b	#$01,d5

loc_9F9C:					  ; CODE XREF: sub_9F1C+72j
		addq.b	#$01,d7
		cmpi.b	#$20,d7
		bhi.w	loc_A0A2
		move.w	d3,(a1)+
		move.w	d4,(a1)+
		move.w	d5,(a1)+
		andi.b	#$02,d1
		beq.w	loc_A096
		cmpi.b	#$04,d6
		bne.s	loc_9FC4
		addi.w	#$0100,d3
		addi.w	#$0100,d5
		bra.s	loc_9FD0
; ---------------------------------------------------------------------------

loc_9FC4:					  ; CODE XREF: sub_9F1C+9Cj
		cmpi.b	#$08,d6
		bne.w	loc_A096
		addq.b	#$01,d3
		addq.b	#$01,d5

loc_9FD0:					  ; CODE XREF: sub_9F1C+A6j
		addq.b	#$01,d7
		cmpi.b	#$20,d7
		bhi.w	loc_A0A2
		move.w	d3,(a1)+
		move.w	d4,(a1)+
		move.w	d5,(a1)+
		bra.w	loc_A096
; ---------------------------------------------------------------------------

loc_9FE4:					  ; CODE XREF: sub_9F1C+12j
		move.w	$00000004(a0),d1
		andi.w	#$03FF,d1
		cmp.w	d1,d0
		bne.w	loc_A096
		addq.b	#$01,d7
		cmpi.b	#$20,d7
		bhi.w	loc_A0A2
		move.w	(a0),d1
		rol.w	#$07,d1
		andi.b	#$3F,d1
		move.w	$00000006(a0),d3
		move.w	d3,(a1)+
		move.w	(a0),d4
		andi.w	#$03FF,d4
		move.w	d4,(a1)+
		move.w	$00000002(a0),d5
		move.b	d1,d6
		andi.b	#$30,d1
		beq.s	loc_A032
		cmpi.b	#$10,d1
		bne.s	loc_A028
		addq.b	#$01,d5
		bra.s	loc_A032
; ---------------------------------------------------------------------------

loc_A028:					  ; CODE XREF: sub_9F1C+106j
		cmpi.b	#$20,d1
		bne.s	loc_A032
		addi.w	#$0100,d5

loc_A032:					  ; CODE XREF: sub_9F1C+100j
						  ; sub_9F1C+10Aj ...
		move.w	d5,(a1)+
		move.b	d6,d1
		andi.b	#$0C,d6
		beq.s	loc_A096
		cmpi.b	#$04,d6
		bne.s	loc_A04C
		addi.w	#$0100,d3
		addi.w	#$0100,d5
		bra.s	loc_A056
; ---------------------------------------------------------------------------

loc_A04C:					  ; CODE XREF: sub_9F1C+124j
		cmpi.b	#$08,d6
		bne.s	loc_A096
		addq.b	#$01,d3
		addq.b	#$01,d5

loc_A056:					  ; CODE XREF: sub_9F1C+12Ej
		addq.b	#$01,d7
		cmpi.b	#$20,d7
		bhi.w	loc_A0A2
		move.w	d3,(a1)+
		move.w	d4,(a1)+
		move.w	d5,(a1)+
		andi.b	#$02,d1
		beq.s	loc_A096
		cmpi.b	#$04,d6
		bne.s	loc_A07C
		addi.w	#$0100,d3
		addi.w	#$0100,d5
		bra.s	loc_A086
; ---------------------------------------------------------------------------

loc_A07C:					  ; CODE XREF: sub_9F1C+154j
		cmpi.b	#$08,d6
		bne.s	loc_A096
		addq.b	#$01,d3
		addq.b	#$01,d5

loc_A086:					  ; CODE XREF: sub_9F1C+15Ej
		addq.b	#$01,d7
		cmpi.b	#$20,d7
		bhi.w	loc_A0A2
		move.w	d3,(a1)+
		move.w	d4,(a1)+
		move.w	d5,(a1)+

loc_A096:					  ; CODE XREF: sub_9F1C+60j
						  ; sub_9F1C+78j ...
		addq.l	#$08,a0
		bra.w	loc_9F22
; ---------------------------------------------------------------------------

loc_A09C:					  ; CODE XREF: sub_9F1C+8j
						  ; sub_9F1C+18Aj ...
		move.w	#$FFFF,(a1)

locret_A0A0:					  ; CODE XREF: sub_9EF8+20j
		rts
; ---------------------------------------------------------------------------

loc_A0A2:					  ; CODE XREF: sub_9F1C+1Cj
						  ; sub_9F1C+86j ...
		tst.w	(DebugModeEnable).w
		bmi.w	loc_A09C
		move.w	#$001D,d7

loc_A0AE:					  ; CODE XREF: sub_9F1C+1A0j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_NigelDropObj2
; ---------------------------------------------------------------------------
		move.w	#$0002,d0
		jsr	(j_Sleep).l
		dbf	d7,loc_A0AE
		bra.s	loc_A09C
; End of function sub_9F1C


; =============== S U B	R O U T	I N E =======================================


sub_A0C2:					  ; CODE XREF: sub_620A:loc_6212p
						  ; sub_620A+F0p ...
		lea	(unk_FF1218).l,a0
		move.b	(Player_X).l,d0
		move.b	(Player_Y).l,d1

loc_A0D4:					  ; CODE XREF: sub_A0C2+50j
		move.b	(a0),d2
		bmi.s	locret_A10E
		cmp.b	d2,d0
		bne.s	loc_A110
		cmp.b	$00000001(a0),d1
		bne.s	loc_A110
		move.w	$00000002(a0),d0
		move.w	d0,(RmNum2).l
		bsr.w	CheckForRoomTransition
		move.w	d0,(g_RmNum1).l
		move.b	$00000004(a0),(Player_X).l
		move.b	$00000005(a0),(Player_Y).l
		move.w	#$0808,(Player_SubX).l

locret_A10E:					  ; CODE XREF: sub_A0C2+14j
		rts
; ---------------------------------------------------------------------------

loc_A110:					  ; CODE XREF: sub_A0C2+18j
						  ; sub_A0C2+1Ej
		addq.w	#$06,a0
		bra.s	loc_A0D4
; End of function sub_A0C2


; =============== S U B	R O U T	I N E =======================================


sub_A114:					  ; CODE XREF: LoadRoom_0+48p
		lea	RoomFallDestination(pc),a0
		bsr.s	sub_A12E
		move.w	d1,(g_RoomFallDest).l
		lea	RoomClimbDestination(pc),a0
		bsr.s	sub_A12E
		move.w	d1,(g_RoomClimbDest).l
		rts
; End of function sub_A114


; =============== S U B	R O U T	I N E =======================================


sub_A12E:					  ; CODE XREF: sub_A114+4p
						  ; sub_A114+10p
		move.w	(g_RmNum1).l,d0
		bsr.s	GetOriginalRoomNum
		move.w	#$FFFF,d1

loc_A13A:					  ; CODE XREF: sub_A12E+16j
		move.w	(a0),d1
		bmi.s	locret_A14A
		cmp.w	d0,d1
		beq.s	loc_A146
		addq.l	#$04,a0
		bra.s	loc_A13A
; ---------------------------------------------------------------------------

loc_A146:					  ; CODE XREF: sub_A12E+12j
		move.w	$00000002(a0),d1

locret_A14A:					  ; CODE XREF: sub_A12E+Ej
		rts
; End of function sub_A12E


; =============== S U B	R O U T	I N E =======================================


CheckForRoomTransition:				  ; CODE XREF: sub_620A+154p
						  ; sub_620A+1A2p ...
		movem.l	d1-d2/a0-a1,-(sp)
		lea	RoomTransitionLookup(pc),a0 ; WORD 0: Orig Room	Num
						  ; WORD 1: Dest Room Num
						  ; BYTE 4: Flags byte
						  ; BYTE 5: Flags bit
		lea	(g_Flags).l,a1

loc_A15A:					  ; CODE XREF: CheckForRoomTransition+2Cj
		move.w	(a0),d1
		bmi.s	loc_A17A
		cmp.w	d0,d1
		bne.s	loc_A176
		clr.w	d1
		move.b	$00000004(a0),d1
		move.b	$00000005(a0),d2
		btst	d2,(a1,d1.w)
		beq.s	loc_A176
		move.w	$00000002(a0),d0

loc_A176:					  ; CODE XREF: CheckForRoomTransition+14j
						  ; CheckForRoomTransition+24j
		addq.l	#$06,a0
		bra.s	loc_A15A
; ---------------------------------------------------------------------------

loc_A17A:					  ; CODE XREF: CheckForRoomTransition+10j
		movem.l	(sp)+,d1-d2/a0-a1
		rts
; End of function CheckForRoomTransition


; =============== S U B	R O U T	I N E =======================================


GetOriginalRoomNum:				  ; CODE XREF: sub_9EF8+16p
						  ; sub_A12E+6p
						  ; DATA XREF: ...
		movem.l	d1-d3/a0-a1,-(sp)
		move.w	d0,d3
		lea	RoomTransitionLookup(pc),a0 ; WORD 0: Orig Room	Num
						  ; WORD 1: Dest Room Num
						  ; BYTE 4: Flags byte
						  ; BYTE 5: Flags bit
		lea	(g_Flags).l,a1

loc_A190:					  ; CODE XREF: GetOriginalRoomNum+1Ej
		move.w	$00000002(a0),d1
		bmi.s	loc_A1A0
		cmp.w	d0,d1
		bne.s	loc_A19C
		move.w	(a0),d3

loc_A19C:					  ; CODE XREF: GetOriginalRoomNum+18j
		addq.l	#$06,a0
		bra.s	loc_A190
; ---------------------------------------------------------------------------

loc_A1A0:					  ; CODE XREF: GetOriginalRoomNum+14j
		move.w	d3,d0
		movem.l	(sp)+,d1-d3/a0-a1
		rts
; End of function GetOriginalRoomNum

; ---------------------------------------------------------------------------
