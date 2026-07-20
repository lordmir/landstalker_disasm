
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
Mult148negTbl:
		dc.w -01184,-01036,-00888,-00740,-00592,-00444,-00296,-00148
Mult148tbl:
		dc.w  00000, 00148, 00296, 00444, 00592, 00740,	00888, 01036
		dc.w  01184, 01332, 01480, 01628, 01776, 01924,	02072, 02220
		dc.w  02368, 02516, 02664, 02812, 02960, 03108,	03256, 03404
		dc.w  03552, 03700, 03848, 03996, 04144, 04292,	04440, 04588
		dc.w  04736, 04884, 05032, 05180, 05328, 05476,	05624, 05772
		dc.w  05920, 06068, 06216, 06364, 06512, 06660,	06808, 06956
		dc.w  07104, 07252, 07400, 07548, 07696, 07844,	07992, 08140
		dc.w  08288, 08436, 08584, 08732, 08880, 09028,	09176, 09324
		dc.w  09472, 09620, 09768, 09916, 10064, 10212,	10360, 10508
		dc.w  10656, 10804, 10952, 11100, 11248, 11396

