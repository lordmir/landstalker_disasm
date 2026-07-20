LoadIsometricBlocks2	module
; Map-row offset helpers. A map plane row is 74 block words = 148
; bytes, so cell (x,y) lives at byte offset y*148 + x*2. The multiply
; by 148 is a table lookup; _mult148NegTbl sits directly before
; _mult148Tbl so a negative row index (-8..-1) indexes backwards into
; it and still resolves correctly.

; a6 = &g_ForegroundBlocks[y*148 + x*2] for cell (d0.b = x, d1.b = y),
; both signed. The background map cell is at the same offset + $2AC8.
ConvertXYToBlockPtr:
		ext.w	d0
		ext.w	d1
		add.w	d1,d1
		move.w	_mult148Tbl(pc,d1.w),d1
		add.w	d0,d1
		add.w	d0,d1
		lea	(g_ForegroundBlocks).l,a6
		adda.w	d1,a6
		rts

; d0.w = d0.w * 148, sign-extended to long (d1/d2/d3 variants below).
MultiplyD0By148:
		add.w	d0,d0
		move.w	_mult148Tbl(pc,d0.w),d0
		ext.l	d0
		rts

MultiplyD1By148:
		add.w	d1,d1
		move.w	_mult148Tbl(pc,d1.w),d1
		ext.l	d1
		rts

MultiplyD2By148:
		add.w	d2,d2
		move.w	_mult148Tbl(pc,d2.w),d2
		ext.l	d2
		rts

MultiplyD3By148:
		add.w	d3,d3
		move.w	_mult148Tbl(pc,d3.w),d3
		ext.l	d3
		rts

_mult148NegTbl:
		dc.w -01184,-01036,-00888,-00740,-00592,-00444,-00296,-00148
_mult148Tbl:
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

		modend
