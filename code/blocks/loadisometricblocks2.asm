
; =============== S U B	R O U T	I N E =======================================


ConvertXYToBlockPtr:				  ; CODE XREF: LoadTopTiles+20p
						  ; LoadLeftTiles+20p
		ext.w	d0
		ext.w	d1
		add.w	d1,d1
		move.w	Mult148tbl(pc,d1.w),d1
		add.w	d0,d1
		add.w	d0,d1
		lea	(g_ForegroundBlocks).l,a6
		adda.w	d1,a6
		rts
; End of function ConvertXYToBlockPtr


; =============== S U B	R O U T	I N E =======================================


MultiplyD0By148:				  ; CODE XREF: CheckForDoorNE+DCp
		add.w	d0,d0
		move.w	Mult148tbl(pc,d0.w),d0
		ext.l	d0
		rts
; End of function MultiplyD0By148


; =============== S U B	R O U T	I N E =======================================


MultiplyD1By148:				  ; CODE XREF: GetMapCoordOffsetp
						  ; DATA XREF: sub_3146+26t ...
		add.w	d1,d1
		move.w	Mult148tbl(pc,d1.w),d1
		ext.l	d1
		rts
; End of function MultiplyD1By148


; =============== S U B	R O U T	I N E =======================================


MultiplyD2By148:				  ; DATA XREF: sub_30E4+2Et
						  ; sub_31A6+32t ...
		add.w	d2,d2
		move.w	Mult148tbl(pc,d2.w),d2
		ext.l	d2
		rts
; End of function MultiplyD2By148


; =============== S U B	R O U T	I N E =======================================


MultiplyD3By148:				  ; DATA XREF: j_MultiplyD3By148t
		add.w	d3,d3
		move.w	Mult148tbl(pc,d3.w),d3
		ext.l	d3
		rts
; End of function MultiplyD3By148

; ---------------------------------------------------------------------------
Mult148negTbl:	dc.w -01184,-01036,-00888,-00740,-00592,-00444,-00296,-00148
Mult148tbl:	dc.w  00000, 00148, 00296, 00444, 00592, 00740,	00888, 01036
		dc.w  01184, 01332, 01480, 01628, 01776, 01924,	02072, 02220
		dc.w  02368, 02516, 02664, 02812, 02960, 03108,	03256, 03404
		dc.w  03552, 03700, 03848, 03996, 04144, 04292,	04440, 04588
		dc.w  04736, 04884, 05032, 05180, 05328, 05476,	05624, 05772
		dc.w  05920, 06068, 06216, 06364, 06512, 06660,	06808, 06956
		dc.w  07104, 07252, 07400, 07548, 07696, 07844,	07992, 08140
		dc.w  08288, 08436, 08584, 08732, 08880, 09028,	09176, 09324
		dc.w  09472, 09620, 09768, 09916, 10064, 10212,	10360, 10508
		dc.w  10656, 10804, 10952, 11100, 11248, 11396

; =============== S U B	R O U T	I N E =======================================


CheckAndDisplayIntroString:			  ; CODE XREF: ROM:00008DFEp
						  ; DATA XREF: GameLoop+82t
		move.b	(g_IntroStringToDisplay).l,d0
		beq.s	_Return
		move.w	(g_IntroStringDisplayTime).l,d1
		bne.w	CheckIntroStringTimer
		andi.w	#$00FF,d0
		lsl.b	#$02,d0
		lea	IntroStringPointers(pc),a2
		movea.l	-0000000004(a2,d0.w),a2
		move.w	(a2)+,d0
		move.w	(a2)+,d1
		move.w	(a2)+,d2
		move.w	(a2)+,d3
		move.w	(a2)+,(g_IntroStringDisplayTime).l
		movem.l	d2-d3,-(sp)
		movem.l	d0-d1,-(sp)
		bsr.s	CopyIntroStringToVDP
		movem.l	(sp)+,d0-d1
		bsr.w	LoadIntroStringLine1Sprites
		movem.l	(sp)+,d0-d1
		bsr.w	LoadIntroStringLine2Sprites

_Return:					  ; CODE XREF: CheckAndDisplayIntroString+6j
		rts
; ---------------------------------------------------------------------------

CheckIntroStringTimer:				  ; CODE XREF: CheckAndDisplayIntroString+Ej
		subq.w	#$01,d1
		move.w	d1,(g_IntroStringDisplayTime).l
		bne.s	_Return1
		lea	(g_VDPSpr08_Y).l,a0
		moveq	#$00000007,d7

_Loop:						  ; CODE XREF: CheckAndDisplayIntroString+6Cj
		clr.w	(a0)
		clr.b	$00000002(a0)
		clr.w	$00000004(a0)
		clr.w	$00000006(a0)
		addq.w	#$08,a0
		dbf	d7,_Loop
		clr.b	(g_IntroStringToDisplay).l

_Return1:					  ; CODE XREF: CheckAndDisplayIntroString+52j
		rts
; End of function CheckAndDisplayIntroString


; =============== S U B	R O U T	I N E =======================================


CopyIntroStringToVDP:				  ; CODE XREF: CheckAndDisplayIntroString+36p
		bsr.s	ClearIntroStringBuffer
		lea	(g_Buffer).l,a1

_loop:						  ; CODE XREF: CopyIntroStringToVDP+10j
		bsr.s	GetNextIntroChar
		tst.b	d0
		bmi.s	_break
		bsr.s	LoadIntroChar
		bra.s	_loop
; ---------------------------------------------------------------------------

_break:						  ; CODE XREF: CopyIntroStringToVDP+Cj
		lea	(g_Buffer).l,a0
		lea	($0000F180).l,a1
		move.w	#$0400,d0
		jmp	(QueueDMAOp).l		  ; d0 - DMA Length
; End of function CopyIntroStringToVDP		  ; a0 - DMA Source
						  ; a1 - DMA Copy

; =============== S U B	R O U T	I N E =======================================


ClearIntroStringBuffer:				  ; CODE XREF: CopyIntroStringToVDPp
		lea	(g_Buffer).l,a1
		move.w	#$01FF,d7

_Loop:						  ; CODE XREF: ClearIntroStringBuffer+Cj
		clr.l	(a1)+
		dbf	d7,_Loop
		rts
; End of function ClearIntroStringBuffer


; =============== S U B	R O U T	I N E =======================================


GetNextIntroChar:				  ; CODE XREF: CopyIntroStringToVDP:_loopp
		move.b	(a2)+,d0
		rts
; End of function GetNextIntroChar


; =============== S U B	R O U T	I N E =======================================


LoadIntroChar:					  ; CODE XREF: CopyIntroStringToVDP+Ep
		andi.w	#$00FF,d0
		lsl.w	#$06,d0
		movea.l	(IntroFontPtr).l,a0
		move.l	(a0,d0.w),(a1)+
		move.l	$00000004(a0,d0.w),(a1)+
		move.l	$00000008(a0,d0.w),(a1)+
		move.l	$0000000C(a0,d0.w),(a1)+
		move.l	$00000010(a0,d0.w),(a1)+
		move.l	$00000014(a0,d0.w),(a1)+
		move.l	$00000018(a0,d0.w),(a1)+
		move.l	$0000001C(a0,d0.w),(a1)+
		move.l	$00000020(a0,d0.w),(a1)+
		move.l	$00000024(a0,d0.w),(a1)+
		move.l	$00000028(a0,d0.w),(a1)+
		move.l	$0000002C(a0,d0.w),(a1)+
		move.l	$00000030(a0,d0.w),(a1)+
		move.l	$00000034(a0,d0.w),(a1)+
		move.l	$00000038(a0,d0.w),(a1)+
		move.l	$0000003C(a0,d0.w),(a1)+
		rts
; End of function LoadIntroChar


; =============== S U B	R O U T	I N E =======================================


LoadIntroStringLine1Sprites:			  ; CODE XREF: CheckAndDisplayIntroString+3Cp
		move.w	#$E78C,d2
		lea	(g_VDPSpr08_Y).l,a0
		bra.s	loc_C584
; ---------------------------------------------------------------------------

LoadIntroStringLine2Sprites:			  ; CODE XREF: CheckAndDisplayIntroString+44p
		move.w	#$E7AC,d2
		lea	(g_VDPSpr12_Y).l,a0

loc_C584:					  ; CODE XREF: LoadIntroStringLine1Sprites+Aj
		moveq	#$00000003,d7

loc_C586:					  ; CODE XREF: LoadIntroStringLine1Sprites+2Aj
		move.w	d1,(a0)+		  ; Y
		move.b	#$0D,(a0)		  ; Size
		addq.l	#$02,a0
		move.w	d2,(a0)+		  ; TileSource
		move.w	d0,(a0)+		  ; X
		addq.w	#$08,d2
		addi.w	#$0020,d0
		dbf	d7,loc_C586		  ; Y
		rts
; End of function LoadIntroStringLine1Sprites

; ---------------------------------------------------------------------------
