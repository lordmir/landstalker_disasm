;; Sound Bank 4 ASM Listing (YM Instrument Data and Music Tracks 0x00 - 0x1E)

			cpu z80
			listing	off
			phase	0
; ===========================================================================
			org 8000h

			include "ym_instruments.asm"
; ===========================================================================
			org 8910h

			dw	MUSIC_00,	MUSIC_01,	MUSIC_02,	MUSIC_03
			dw	MUSIC_04,	MUSIC_05,	MUSIC_06,	MUSIC_07
			dw	MUSIC_08,	MUSIC_09,	MUSIC_0A,	MUSIC_0B
			dw	MUSIC_0C,	MUSIC_0D,	MUSIC_0E,	MUSIC_0F
			dw	MUSIC_10,	MUSIC_11,	MUSIC_12,	MUSIC_13
			dw	MUSIC_14,	MUSIC_15,	MUSIC_NULL,	MUSIC_NULL
			dw	MUSIC_NULL,	MUSIC_NULL,	MUSIC_1A,	MUSIC_NULL
			dw	MUSIC_1C,	MUSIC_NULL,	MUSIC_1E,	MUSIC_NULL
; ===========================================================================
MUSIC_00:	include "music/music00.asm"
MUSIC_01:	include "music/music01.asm"
MUSIC_09:	include "music/music09.asm"
MUSIC_11:	include "music/music11.asm"
MUSIC_12:	include "music/music12.asm"
MUSIC_13:	include "music/music13.asm"
MUSIC_14:	include "music/music14.asm"
MUSIC_15:	include "music/music15.asm"
MUSIC_1C:	include "music/music1C.asm"
MUSIC_10:	include "music/music10.asm"
MUSIC_02:	include "music/music02.asm"
MUSIC_1E:	include "music/music1E.asm"
MUSIC_03:	include "music/music03.asm"
MUSIC_04:	include "music/music04.asm"
MUSIC_05:	include "music/music05.asm"
MUSIC_06:	include "music/music06.asm"
MUSIC_07:	include "music/music07.asm"
MUSIC_08:	include "music/music08.asm"
MUSIC_0B:	include "music/music0B.asm"
MUSIC_0A:	include "music/music0A.asm"
MUSIC_0C:	include "music/music0C.asm"
MUSIC_0D:	include "music/music0D.asm"
MUSIC_0E:	include "music/music0E.asm"
MUSIC_0F:	include "music/music0F.asm"
MUSIC_1A:	include "music/music1A.asm"
MUSIC_NULL:	include "music/music_null.asm"
; ===========================================================================
			end
