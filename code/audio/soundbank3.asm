;; Sound Bank 3 ASM Listing (Music Tracks 0x20 - 0x2E)

			cpu z80
			listing	off
			phase	0
; ===========================================================================
			org 8000h

			dw	MUSIC_20,	MUSIC_21,	MUSIC_22,	MUSIC_23
			dw	MUSIC_24,	MUSIC_25,	MUSIC_26,	MUSIC_27
			dw	MUSIC_28,	MUSIC_29,	MUSIC_2A,	MUSIC_2B
			dw	MUSIC_2C,	MUSIC_2D,	MUSIC_2E,	MUSIC_NULL
			dw	MUSIC_NULL,	MUSIC_NULL,	MUSIC_NULL,	MUSIC_NULL
			dw	MUSIC_NULL,	MUSIC_NULL,	MUSIC_NULL,	MUSIC_NULL
			dw	MUSIC_NULL,	MUSIC_NULL,	MUSIC_NULL,	MUSIC_NULL
			dw	MUSIC_NULL,	MUSIC_NULL,	MUSIC_NULL,	MUSIC_NULL
; ===========================================================================
MUSIC_20:	include "music/music20.asm"
MUSIC_21:	include "music/music21.asm"
MUSIC_22:	include "music/music22.asm"
MUSIC_23:	include "music/music23.asm"
MUSIC_24:	include "music/music24.asm"
MUSIC_25:	include "music/music25.asm"
MUSIC_26:	include "music/music26.asm"
MUSIC_27:	include "music/music27.asm"
MUSIC_28:	include "music/music28.asm"
MUSIC_2A:	include "music/music2A.asm"
MUSIC_2B:	include "music/music2B.asm"
MUSIC_2C:	include "music/music2C.asm"
MUSIC_2D:	include "music/music2D.asm"
MUSIC_29:	include "music/music29.asm"
MUSIC_2E:	include "music/music2E.asm"
MUSIC_NULL:	include "music/music_null.asm"
; ===========================================================================
			end
