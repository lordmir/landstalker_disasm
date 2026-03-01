;; Sound Bank 3 ASM Listing (Music Tracks 0x20 - 0x2F)

        cpu z80
        listing	off
        phase	0
; ===========================================================================
		org 8000h
		dw MUSIC_20,MUSIC_21,MUSIC_22,MUSIC_23
		dw MUSIC_24,MUSIC_25,MUSIC_26,MUSIC_27
		dw MUSIC_28,MUSIC_29,MUSIC_2A,MUSIC_2B
		dw MUSIC_2C,MUSIC_2D,MUSIC_2E,MUSIC_NULL
		dw MUSIC_NULL,MUSIC_NULL,MUSIC_NULL,MUSIC_NULL
		dw MUSIC_NULL,MUSIC_NULL,MUSIC_NULL,MUSIC_NULL
		dw MUSIC_NULL,MUSIC_NULL,MUSIC_NULL,MUSIC_NULL
		dw MUSIC_NULL,MUSIC_NULL,MUSIC_NULL,MUSIC_NULL
MUSIC_20:	db 0			; DATA XREF: ROM:8000o
		db 0
		db 0
		db 182
		dw MUSIC_20_YM1
		dw MUSIC_20_YM2
		dw MUSIC_20_YM3
		dw MUSIC_20_YM4
		dw MUSIC_20_YM5
		dw MUSIC_20_YM6
		dw MUSIC_20_PSG1
		dw MUSIC_20_PSG2
		dw MUSIC_20_PSG3
		dw MUSIC_20_PSG3
MUSIC_20_YM1:	db  0F0h,  18h,	0FEh,  0Bh, 0FDh,  0Ah,	0FCh,	 1, 0FBh,  2Ch,	0F8h,	 0, 0B2h,  28h,	0F0h,	 8
					; DATA XREF: ROM:8044o
		db  0B2h,  30h,	0B1h,  0Ch,  2Fh, 0B1h,	 24h, 0B4h,  0Ch, 0ADh,	 18h,  39h, 0B6h,  0Ch,	 37h, 0B9h
		db   18h, 0B7h,	 0Ch,  36h,  37h,  2Fh,	0B2h,  18h,  31h,  70h,	0B6h,  28h, 0F0h,    8,	0B6h,  30h
		db  0B4h,  0Ch,	 32h, 0B4h,  24h, 0B1h,	 0Ch,  32h,  31h, 0B2h,	 24h, 0B1h,  0Ch,  2Fh,	 2Dh,  2Bh
		db   2Dh,  2Bh,	 2Ah, 0A8h,  18h,  70h,	 70h, 0B9h,  28h, 0F0h,	   8, 0B9h,  30h, 0B7h,	 0Ch,  36h
		db  0B7h,  24h,	0B4h,  0Ch,  36h,  35h,	0B6h,  24h, 0B4h,  0Ch,	 32h,  31h,  2Fh,  31h,	 2Fh,  2Dh
		db  0ABh,  18h,	 70h,  70h,  28h,  2Dh,	 2Fh, 0B1h,  0Ch,  32h,	 2Fh,  31h,  2Dh,  2Fh,	 2Bh,  2Dh
		db  0A6h,  18h,	 2Dh,  32h,  34h, 0B5h,	 0Ch,  37h, 0B4h,  0Eh,	 35h, 0B2h,  10h, 0B4h,	 12h, 0AFh
		db   14h, 0B2h,	 1Ch, 0F0h,    2, 0B2h,	 3Ch, 0B1h,  1Eh, 0AFh,	 24h, 0B1h,    6, 0B2h,	   4,  31h
		db   32h, 0B1h,	 94h, 0F0h,  1Ch, 0F8h,	0A1h
MUSIC_20_YM2:	db  0FEh,  0Bh,	0FDh,	 9, 0FCh,    1,	0FBh,  2Ch, 0AAh,  30h,	0F8h,	 0, 0ABh,  30h,	0ADh,  48h
					; DATA XREF: ROM:8046o
		db  0A8h,  30h,	0A6h,  0Ch,  25h, 0A3h,	 18h, 0AAh,  30h, 0A8h,	 28h, 0F0h,    8, 0ADh,	 18h, 0AEh
		db   30h,  2Fh,	0B1h,  48h, 0AEh,  18h,	0AAh,  48h, 0A6h,  18h,	 28h,  23h,  9Fh,  0Ch,	 26h,  25h
		db   23h, 0A5h,	 30h,  26h, 0A8h,  48h,	0A5h,  18h, 0A6h,  90h,	0A3h,  0Ch,  2Ah,  28h,	 26h, 0A5h
		db   48h, 0A6h,	 18h,  28h,  26h, 0A5h,	 30h, 0AAh,  48h, 0ABh,	 18h,  2Dh, 0ABh,  1Ch,	0A9h,  72h
		db  0A8h,  3Ch,	0A6h,  24h, 0A8h,  54h,	0ADh,  26h, 0ABh,  2Ch,	0AAh,  34h, 0F8h, 0A1h
MUSIC_20_YM3:	db  0FEh,  0Bh,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Ch,  9Ah,  30h,	0F8h,	 0,  9Ch,  30h,	 1Eh,  1Fh
					; DATA XREF: ROM:8048o
		db   1Eh,  1Bh,	 1Ch, 0A1h,  18h,  1Fh,	 9Eh,  30h,  20h,  22h,	 1Eh,  23h,  17h,  1Ch,	0F0h,  0Ch
		db   10h,  12h,	 13h,  95h,  30h,  17h,	 19h,  15h,  1Ah,  1Eh,	 1Fh,  13h, 0FCh,  80h,	 95h, 0C0h
		db   95h, 0E8h,	 95h, 0C8h, 0FCh,    1,	 95h,  5Ch,  9Ah,  34h,	0F8h, 0A1h
MUSIC_20_YM4:	db  0FAh,  80h,	0F9h,  20h, 0F0h,  1Eh,	0FEh,  0Bh, 0FDh,    8,	0FCh,	 1, 0FBh,  2Ch,	0F8h,	 0
					; DATA XREF: ROM:804Ao
		db  0B2h,  28h,	0F0h,	 8, 0B2h,  30h,	0B1h,  0Ch,  2Fh, 0B1h,	 24h, 0B4h,  0Ch, 0ADh,	 18h,  39h
		db  0B6h,  0Ch,	 37h, 0B9h,  18h, 0B7h,	 0Ch,  36h,  37h,  2Fh,	0B2h,  18h,  31h,  70h,	0B6h,  28h
		db  0F0h,    8,	0B6h,  30h, 0B4h,  0Ch,	 32h, 0B4h,  24h, 0B1h,	 0Ch,  32h,  31h, 0B2h,	 24h, 0B1h
		db   0Ch,  2Fh,	 2Dh,  2Bh,  2Dh,  2Bh,	 2Ah, 0A8h,  18h,  70h,	 70h, 0B9h,  28h, 0F0h,	   8, 0B9h
		db   30h, 0B7h,	 0Ch,  36h, 0B7h,  24h,	0B4h,  0Ch,  36h,  35h,	0B6h,  24h, 0B4h,  0Ch,	 32h,  31h
		db   2Fh,  31h,	 2Fh,  2Dh, 0ABh,  18h,	 70h,  70h,  28h,  2Dh,	 2Fh, 0B1h,  0Ch,  32h,	 2Fh,  31h
		db   2Dh,  2Fh,	 2Bh,  2Dh, 0A6h,  18h,	 2Dh,  32h,  34h, 0B5h,	 0Ch,  37h, 0B4h,  0Eh,	 35h, 0B2h
		db   10h, 0B4h,	 12h, 0AFh,  14h, 0B2h,	 1Ch, 0F0h,    2, 0B2h,	 3Ch, 0B1h,  1Eh, 0AFh,	 24h, 0B1h
		db     6, 0B2h,	   4,  31h,  32h, 0B1h,	 94h, 0F0h,  1Ch, 0F8h,	0A1h
MUSIC_20_YM5:	db  0FAh,  40h,	0F9h,  20h, 0F0h,    6,	0FEh,  0Bh, 0FDh,    7,	0FCh,	 1, 0FBh,  2Ch,	0AAh,  30h
					; DATA XREF: ROM:804Co
		db  0F8h,    0,	0ABh,  30h, 0ADh,  48h,	0A8h,  30h, 0A6h,  0Ch,	 25h, 0A3h,  18h, 0AAh,	 30h, 0A8h
		db   28h, 0F0h,	   8, 0ADh,  18h, 0AEh,	 30h,  2Fh, 0B1h,  48h,	0AEh,  18h, 0AAh,  48h,	0A6h,  18h
		db   28h,  23h,	 9Fh,  0Ch,  26h,  25h,	 23h, 0A5h,  30h,  26h,	0A8h,  48h, 0A5h,  18h,	0A6h,  90h
		db  0A3h,  0Ch,	 2Ah,  28h,  26h, 0A5h,	 48h, 0A6h,  18h,  28h,	 26h, 0A5h,  30h, 0AAh,	 48h, 0ABh
		db   18h,  2Dh,	0ABh,  1Ch, 0A9h,  72h,	0A8h,  3Ch, 0A6h,  24h,	0A8h,  54h, 0ADh,  26h,	0ABh,  2Ch
		db  0AAh,  34h,	0F8h, 0A1h
MUSIC_20_YM6:	db 0FFh,   0,	0	; DATA XREF: ROM:804Eo
MUSIC_20_PSG1:	db 0FFh,   0,	0	; DATA XREF: ROM:8050o
MUSIC_20_PSG2:	db 0FFh,   0,	0	; DATA XREF: ROM:8052o
MUSIC_20_PSG3:	db 0FFh,   0,	0	; DATA XREF: ROM:8054o	ROM:8056o
MUSIC_21:	db 0			; DATA XREF: ROM:8000o
		db 0
		db 0
		db 210
		dw MUSIC_21_YM1
		dw MUSIC_21_YM2
		dw MUSIC_21_YM3
		dw MUSIC_21_YM4
		dw MUSIC_21_YM5
		dw MUSIC_21_YM6
		dw MUSIC_21_PSG1
		dw MUSIC_21_PSG2
		dw MUSIC_21_PSG3
		dw MUSIC_21_PSG3
MUSIC_21_YM1:	db  0FEh,    1,	0FDh,  0Ah, 0FCh,    1,	0FBh,  5Ch, 0F8h,    0,	0ABh,  41h, 0B0h,  42h,	 32h, 0B3h
					; DATA XREF: ROM:8298o
		db   26h, 0B2h,	 1Ah, 0B0h,  19h, 0AFh,	 21h, 0B2h,  77h, 0F0h,	 39h, 0ABh,  46h, 0B2h,	 3Fh, 0B3h
		db   40h, 0B5h,	 27h, 0B3h,  19h, 0B2h,	 1Ah, 0B0h,  21h, 0B3h,	 77h, 0F0h,  36h, 0B0h,	 41h,  37h
		db  0B8h,  45h,	0BAh,  2Ah, 0B8h,  1Ch,	0B7h,  1Ah, 0B5h,  1Bh,	0B8h,  1Eh, 0B7h,  19h,	0B5h,  1Ah
		db  0B4h,  1Fh,	0B2h,  34h, 0B0h,  0Dh,	0B2h,  19h, 0B0h,  0Dh,	0B2h,  10h, 0B3h,  26h,	0B2h,  0Fh
		db  0B3h,  1Eh,	0B2h,  10h, 0B3h,  11h,	0B2h,  36h, 0AFh,  0Eh,	0B2h,  1Fh, 0F0h,  17h,	0B8h,  23h
		db  0F0h,  0Fh,	0B7h,  90h, 0F0h,  4Eh,	0F8h, 0A1h
MUSIC_21_YM2:	db  0FEh,    1,	0FDh,  0Ah, 0FCh,    1,	0FBh,  5Ch, 0F8h,    0,	0A7h,  41h, 0ABh,  42h,	 2Bh, 0F0h
					; DATA XREF: ROM:829Ao
		db   18h, 0B5h,	 1Ch, 0B3h,  17h, 0B2h,	 1Ch, 0B0h,  13h, 0AFh,	 77h, 0F0h,  39h, 0A6h,	 46h, 0ABh
		db   3Fh, 0ABh,	 40h, 0F0h,  18h, 0B7h,	 1Ch, 0B5h,  19h, 0B3h,	 1Bh, 0B2h,  13h, 0ABh,	 77h, 0F0h
		db   36h, 0ABh,	 41h,  30h, 0B0h,  45h,	0F0h,  1Ah, 0BCh,  1Eh,	0BAh,  1Ch, 0B8h,  19h,	0B7h,  1Fh
		db  0F0h,    0,	0BAh,  19h,  38h, 0B7h,	 1Bh, 0B5h,  2Ah, 0F0h,	   0, 0F0h,  0Fh, 0ADh,	 50h, 0F0h
		db   1Ah, 0B0h,	 5Ah, 0F0h,  29h, 0ACh,	 3Ah, 0B2h,  30h, 0F0h,	 0Ah, 0F0h,    7, 0B2h,	 98h, 0F0h
		db   4Eh, 0F8h,	0A1h
MUSIC_21_YM3:	db  0FEh,    1,	0FDh,	 9, 0FCh,    1,	0FBh,  5Ch, 0F8h,    0,	0A4h,  41h, 0A4h,  42h,	 23h, 0ABh
					; DATA XREF: ROM:829Co
		db   7Ah, 0ABh,	 77h, 0F0h,  39h, 0A3h,	 46h, 0A6h,  3Fh, 0A4h,	 40h, 0A3h,  7Bh, 0A4h,	 77h, 0F0h
		db   36h, 0A8h,	 41h,  2Bh, 0A9h,  45h,	0A8h,  7Bh,  9Dh,  70h,	0F0h,  18h, 0A6h,  35h,	0A6h,  2Ah
		db  0F0h,  0Fh,	0ADh,  33h, 0ADh,  32h,	0F0h,  19h, 0A9h,  3Ah,	0AFh,  40h, 0F0h,  0Ah,	0AFh,  9Fh
		db  0F0h,  4Eh,	0F8h, 0A1h
MUSIC_21_YM4:	db  0FEh,    1,	0FDh,  0Ah, 0FCh,    1,	0FBh,  5Ch, 0F8h,    0,	 98h,  41h,  9Bh,  42h,	 1Fh,  98h
					; DATA XREF: ROM:829Eo
		db   7Ah,  93h,	 77h, 0F0h,  39h,  93h,	 46h,  97h,  3Fh,  98h,	 40h,  93h,  7Bh,  98h,	 77h, 0F0h
		db   36h,  98h,	 41h,  1Ch,  9Dh,  45h,	 98h,  50h, 0F0h,  10h,	 98h,  1Bh,  9Dh,  43h,	0F0h,  0Eh
		db   9Dh,  1Fh,	 9Eh,  50h, 0F0h,  0Ah,	 9Eh,  0Fh, 0F0h,  0Eh,	 9Eh,  42h, 0F0h,  11h,	 9Eh,  21h
		db  0FCh,  80h,	 9Fh, 0E5h, 0FCh,    1,	 9Fh,  57h, 0F0h,  4Eh,	0F8h, 0A1h
MUSIC_21_YM5:	db  0F0h,    6,	0FEh,	 1, 0F9h,  20h,	0FDh,	 7, 0FCh,    1,	0FBh,  5Ch, 0F8h,    0,	0ABh,  41h
					; DATA XREF: ROM:82A0o
		db  0B0h,  42h,	 32h, 0B3h,  26h, 0B2h,	 1Ah, 0B0h,  19h, 0AFh,	 21h, 0B2h,  77h, 0F0h,	 39h, 0ABh
		db   46h, 0B2h,	 3Fh, 0B3h,  40h, 0B5h,	 27h, 0B3h,  19h, 0B2h,	 1Ah, 0B0h,  21h, 0B3h,	 77h, 0F0h
		db   36h, 0B0h,	 41h,  37h, 0B8h,  45h,	0BAh,  2Ah, 0B8h,  1Ch,	0B7h,  1Ah, 0B5h,  1Bh,	0B8h,  1Eh
		db  0B7h,  19h,	0B5h,  1Ah, 0B4h,  1Fh,	0B2h,  34h, 0B0h,  0Dh,	0B2h,  19h, 0B0h,  0Dh,	0B2h,  10h
		db  0B3h,  26h,	0B2h,  0Fh, 0B3h,  1Eh,	0B2h,  10h, 0B3h,  11h,	0B2h,  36h, 0AFh,  0Eh,	0B2h,  1Fh
		db  0F0h,  17h,	0B8h,  23h, 0F0h,  0Fh,	0B7h,  90h, 0F0h,  4Eh,	0F8h, 0A1h
MUSIC_21_YM6:	db  0FFh,    0,	   0	; DATA XREF: ROM:82A2o
MUSIC_21_PSG1:	db  0FFh,    0,	   0	; DATA XREF: ROM:82A4o
MUSIC_21_PSG2:	db  0FFh,    0,	   0	; DATA XREF: ROM:82A6o
MUSIC_21_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:82A8o	ROM:82AAo
MUSIC_22:	db 0			; DATA XREF: ROM:8000o
		db 0
		db 0
		db 183
		dw MUSIC_22_YM1
		dw MUSIC_22_YM2
		dw MUSIC_22_YM3
		dw MUSIC_22_YM4
		dw MUSIC_22_YM5
		dw MUSIC_22_YM6
		dw MUSIC_22_PSG1
		dw MUSIC_22_PSG2
		dw MUSIC_22_PSG3
		dw MUSIC_22_PSG3
MUSIC_22_YM1:	db  0F8h,    0,	0FEh,  1Eh, 0FDh,  0Ah,	0FCh,	 0, 0FBh, 0A8h,	0F8h, 0C5h,  8Eh,  18h,	 0Eh,  0Eh
					; DATA XREF: ROM:8483o
		db   0Eh,  0Eh,	 0Eh,	 7,  89h,  0Ch,	0F8h, 0E0h, 0F8h, 0C3h,	 8Eh,  18h,  0Eh,  0Eh,	 0Eh,  0Eh
		db   0Eh,    6,	 88h,  0Ch, 0F8h, 0E0h,	0F8h, 0C1h,  8Ah,  18h,	 0Ah,  0Ah,  0Ah,  0Ah,	 0Ah,	 6
		db   88h,  0Ch,	0F8h, 0E0h,  87h,  18h,	   7,	 6,    6,    4,	   4,	 4,  8Bh,  0Ch,	0F8h, 0C4h
		db   90h,  18h,	0F8h, 0E0h,  8Bh,  18h,	   4,  84h,  0Ch,  89h,	 18h,	 9,    8,    8,	   6,	 6
		db     6,  8Dh,	 0Ch, 0F8h, 0C4h,  92h,	 18h, 0F8h, 0E0h,  8Dh,	 18h,	 6,  86h,  0Ch,	0F8h, 0C1h
		db  0FBh, 0A8h,	 8Ah,  18h, 0FBh,  2Ah,	 8Ah,	 6,  70h,  83h,	 18h,  88h,  12h, 0FBh,	0B6h,  0Dh
		db  0FBh, 0A8h,	 8Ah,  18h, 0FBh,  2Ah,	 8Ah,	 6,  70h,  83h,	 12h,	 8,  81h,  0Ch,	0F8h, 0E0h
		db  0F8h, 0C2h,	 8Ah,	 6,  0Ah,  0Ah,	0F0h,  0Ch, 0F8h, 0E0h,	 8Ah,	 6,  0Ah,  0Ah,	0FBh, 0B8h
		db   8Ah,  18h,	 70h, 0FDh,  0Bh, 0FBh,	0A8h,  0Ah, 0F8h, 0A1h
MUSIC_22_YM2:	db  0F8h,    0,	0F0h, 0B4h,  70h, 0FCh,	   1, 0FBh,  2Ch, 0FEh,	 3Ch, 0FDh,  0Bh, 0F8h,	0D1h, 0B5h
					; DATA XREF: ROM:8485o
		db     6, 0F8h,	0E0h, 0B3h,    6,  30h,	 2Eh,  2Bh,  28h,  25h,	 22h,  70h,  22h, 0F0h,	0C6h, 0F8h
		db  0D1h, 0B5h,	   6, 0F8h, 0E0h, 0B3h,	   6,  30h,  2Eh,  2Bh,	 28h,  2Ch,  32h,  70h,	 32h, 0F0h
		db  0BAh, 0FAh,	 40h, 0A4h,    6,  26h,	0F8h, 0C3h, 0A9h,    6,	 24h,  26h,  29h,  24h,	 26h,  2Bh
		db   24h,  26h,	 24h,  26h,  29h,  24h,	 26h,  2Bh,  29h,  24h,	 26h,  29h,  24h,  26h,	 2Bh,  24h
		db   26h,  27h,	 2Eh,  2Ch,  27h,  25h,	 27h, 0F8h, 0E0h, 0F8h,	0C1h, 0ACh,    6,  27h,	 29h,  2Ch
		db   27h,  29h,	 2Eh,  27h,  29h,  27h,	 29h,  2Ch,  27h,  29h,	 2Eh,  2Ch,  27h,  29h,	 2Ch,  27h
		db   29h,  2Eh,	 27h,  29h,  2Bh,  32h,	 30h,  2Bh,  29h,  2Bh,	0F8h, 0E0h, 0ABh,    6,	 26h,  24h
		db   26h,  2Bh,	 26h,  24h,  26h,  29h,	 24h,  22h,  24h,  29h,	 24h,  22h,  24h,  27h,	 22h,  20h
		db   22h,  27h,	 22h,  20h,  22h,  27h,	 22h,  20h,  22h,  25h,	 22h, 0FAh, 0C0h,  27h,	 22h,  20h
		db   2Ch,  27h,	 25h,  2Eh,  2Ch,  27h,	 31h,  2Eh,  2Ch,  33h,	 31h,  2Eh,  31h,  36h,	 36h,  36h
		db   36h,  33h,	 31h,  2Eh,  2Ch, 0FAh,	 40h,  2Ah,  27h,  25h,	 2Ah,  27h,  25h,  2Dh,	 28h,  26h
		db   28h,  2Dh,	 28h,  26h,  28h,  2Bh,	 26h,  24h,  26h,  2Bh,	 26h,  24h,  26h,  29h,	 24h,  22h
		db   24h,  29h,	 24h,  22h,  24h,  29h,	 24h,  22h,  24h,  27h,	 24h, 0FAh, 0C0h,  29h,	 24h,  22h
		db   2Eh,  29h,	 27h,  30h,  2Eh,  29h,	 33h,  30h,  2Eh,  35h,	 33h,  30h,  33h, 0F8h,	0CDh, 0B8h
		db     6, 0F8h,	0E0h, 0F8h, 0C1h, 0AEh,	   6,  2Ch,  27h,  2Ch,	 2Eh,  2Ch,  27h,  2Ch,	 2Eh,  70h
		db   31h,  31h,	 31h,  70h,  31h,  31h,	 2Eh,  2Ch,  27h,  2Ch,	 2Eh,  2Ch,  27h,  2Ch,	 2Eh,  70h
		db   31h,  31h,	 31h,  70h, 0F8h, 0E0h,	0F8h, 0C2h, 0AEh,    6,	 2Eh,  2Eh, 0F0h,  0Ch,	0F8h, 0E0h
		db  0F8h, 0C3h,	0AEh,	 6, 0F8h, 0E0h,	0F0h,  42h, 0F8h, 0A1h
MUSIC_22_YM3:	db  0F8h,    0,	0F0h, 0B4h,  70h, 0FEh,	 3Ch, 0FDh,  0Ah, 0FBh,	 2Ch, 0FCh,    1, 0F0h,	   3, 0F8h
					; DATA XREF: ROM:8487o
		db  0D0h, 0B0h,	   6, 0F8h, 0E0h, 0B0h,	   3, 0AEh,    6,  2Bh,	 29h,  26h,  23h,  20h,	 1Dh,  70h
		db   1Dh, 0F0h,	 12h, 0FEh,    3, 0FDh,	 0Bh, 0FBh,  7Fh, 0FCh,	0FFh, 0A3h,    0, 0FCh,	 90h, 0A4h
		db   0Ch, 0FCh,	0FFh, 0A3h,    0, 0FCh,	 90h, 0A4h,  3Ch, 0F0h,	 0Ch,  24h, 0FCh, 0A0h,	 27h, 0A4h
		db   3Ch, 0F0h,	 0Fh, 0FEh,  3Ch, 0FDh,	 0Ah, 0FCh, 0FFh, 0F8h,	0D0h, 0B0h,    6, 0F8h,	0E0h, 0B0h
		db     3, 0AEh,	   6,  2Bh,  29h,  26h,	 23h,  27h,  2Dh,  70h,	 2Dh, 0F0h,  12h, 0FEh,	   3, 0FDh
		db   0Bh, 0FCh,	0FFh, 0A3h,    0, 0FCh,	 90h, 0A4h,  0Ch, 0FCh,	0FFh, 0A3h,    0, 0FCh,	 90h, 0A4h
		db   3Ch, 0F0h,	 0Ch,  24h, 0FCh, 0A0h,	 27h, 0AAh,  3Ch, 0FAh,	 80h, 0FEh,  3Ch, 0FDh,	 0Bh, 0FCh
		db  0FFh,  9Fh,	   6,  21h, 0F8h, 0C3h,	0F0h,	 6,  21h,  24h,	 26h,  70h,  21h,  24h,	 26h,  70h
		db   21h,  24h,	 26h,  70h,  21h,  24h,	 26h,  70h,  21h,  24h,	 26h,  70h,  21h,  70h,	 21h,  22h
		db   25h,  27h,	 25h,  20h,  22h, 0F8h,	0E0h, 0F8h, 0C1h, 0F0h,	   6,  24h,  27h,  29h,	 70h,  24h
		db   27h,  29h,	 70h,  24h,  27h,  29h,	 70h,  24h,  27h,  29h,	 70h,  24h,  27h,  29h,	 70h,  24h
		db   70h,  24h,	 26h,  29h,  2Bh,  29h,	 24h,  26h, 0F8h, 0E0h,	0A6h,	 6,  1Fh,  21h,	 24h,  26h
		db   1Fh,  21h,	 24h,  24h,  1Dh,  1Fh,	 22h,  24h,  1Dh,  1Fh,	 22h,  22h,  1Bh,  1Dh,	 20h,  22h
		db   1Bh,  1Dh,	 20h,  22h,  1Bh,  1Dh,	 20h,  22h,  20h, 0FAh,	0C0h, 0FDh,  0Ah,  22h,	 1Bh,  1Eh
		db   1Bh,  1Eh,	 20h,  1Eh,  22h,  25h,	 20h,  25h,  27h,  22h,	 27h,  2Ah,  2Ch, 0F0h,	   3, 0B1h
		db     6,  31h,	 31h, 0B1h,    3, 0AEh,	   6,  2Ch,  29h,  27h,	0FAh,  80h, 0FDh,  0Bh,	 25h,  1Eh
		db   20h,  25h,	 1Eh,  20h,  28h,  21h,	 23h,  26h,  28h,  21h,	 23h,  26h,  26h,  1Fh,	 21h,  24h
		db   26h,  1Fh,	 21h,  24h,  24h,  1Dh,	 1Fh,  22h,  24h,  1Dh,	 1Fh,  22h,  24h,  1Dh,	 1Fh,  22h
		db   24h,  22h,	0FAh, 0C0h, 0FDh,  0Ah,	 24h,  1Dh,  20h,  1Dh,	 20h,  22h,  20h,  24h,	 27h,  22h
		db   27h,  29h,	 24h,  29h,  2Ch,  2Eh,	0F0h,	 3, 0F8h, 0CCh,	0B3h,	 6, 0F8h, 0E0h,	0B3h,	 3
		db  0F8h, 0C1h,	0FEh,	 3, 0FDh,  0Bh,	0FBh,  2Ch, 0FCh, 0FFh,	0A8h,	 0, 0FCh,  88h,	0A9h,  0Ch
		db  0FCh, 0FFh,	0A8h,	 0, 0FCh,  88h,	0A9h,  0Ah, 0F0h,  26h,	0FEh,  3Ch, 0FDh,  0Bh,	0FCh, 0FFh
		db  0ACh,    6,	 2Ch,  2Ch,  70h,  2Ch,	 2Ch, 0FEh,    3, 0FDh,	 0Bh, 0FCh, 0FFh, 0A8h,	   0, 0FCh
		db   88h, 0A9h,	 0Ch, 0FCh, 0FFh, 0A8h,	   0, 0FCh,  88h, 0A9h,	 0Ah, 0F0h,  26h, 0FEh,	 3Ch, 0FDh
		db   0Bh, 0FCh,	0FFh, 0ACh,    6,  2Ch,	 2Ch,  70h, 0F8h, 0E0h,	0F8h, 0C2h, 0A9h,    6,	 29h,  29h
		db  0F0h,  0Ch,	0F8h, 0E0h, 0F8h, 0C3h,	0A9h,	 6, 0F8h, 0E0h,	0F0h,  42h, 0F8h, 0A1h
MUSIC_22_YM4:	db  0F8h,    0,	0FCh,	 1, 0FBh,  2Ch,	0F8h, 0C2h, 0F0h, 0B4h,	0F8h, 0E0h, 0FEh,    3,	0FDh,  0Bh
					; DATA XREF: ROM:8489o
		db  0FBh,  7Fh,	0FCh, 0FFh, 0A8h,    0,	0FCh,  8Ah, 0A9h,  0Ch,	0FCh, 0FFh, 0A8h,    0,	0FCh,  8Ah
		db  0A9h,  3Ch,	0F0h,  0Ch,  29h, 0FCh,	0A0h,  2Ch, 0A9h,  3Ch,	0F0h, 0C0h, 0FCh, 0FFh,	0A8h,	 0
		db  0FCh,  8Ah,	0A9h,  0Ch, 0FCh, 0FFh,	0A8h,	 0, 0FCh,  8Ah,	0A9h,  3Ch, 0F0h,  0Ch,	 29h, 0FCh
		db  0A0h,  2Ch,	0AFh,  3Ch, 0F0h, 0C0h,	0F0h, 0B4h, 0FEh,  0Dh,	0FDh,  0Ch, 0F8h, 0C1h,	0FCh, 0FFh
		db  0FBh,  2Ch,	0A6h,	 0, 0FCh, 0A0h,	0ABh,  12h, 0FCh, 0FFh,	0A6h,  0Ah, 0F0h,    8,	0FCh, 0A0h
		db  0ABh,  12h,	0FCh, 0FFh, 0A6h,  18h,	0F0h,	 6,  2Bh,  2Dh,	0FCh,  80h, 0B2h,    3,	 34h, 0FCh
		db     1, 0B2h,	   4, 0F0h,    3, 0ADh,	   4, 0F0h,    5, 0ABh,	   4, 0F0h,    5, 0A6h,	   4, 0F0h
		db     5, 0A1h,	   4,  70h, 0FCh, 0A0h,	0A5h,  12h, 0FCh, 0FFh,	0A0h,  0Ah, 0F0h,    8,	0F8h, 0E0h
		db  0F8h, 0C1h,	0A9h,	 0, 0FCh, 0A5h,	0AEh,  12h, 0FCh, 0FFh,	0A9h,  0Ah, 0F0h,    8,	0FCh, 0A5h
		db  0AEh,  12h,	0FCh, 0FFh, 0A9h,  18h,	0F0h,	 6,  2Eh,  30h,	0FCh,  80h, 0B5h,    3,	 36h, 0FCh
		db     1, 0B5h,	   4, 0F0h,    3, 0B0h,	   4, 0F0h,    5, 0ABh,	   4, 0F0h,    5, 0A9h,	   4, 0F0h
		db     5, 0A4h,	   4,  70h, 0FCh, 0A0h,	0A8h,  12h, 0FCh, 0FFh,	0AFh,  0Ah, 0F0h,    8,	0F8h, 0E0h
		db  0B0h,  3Ch,	0F0h,	 6, 0FCh,  80h,	0B0h,	 3,  2Fh, 0FCh,	   1, 0AEh,  1Ch, 0F0h,	   8, 0ADh
		db     4, 0F0h,	   7, 0A7h,    4, 0F0h,	   5, 0A6h,    4,  70h,	 20h,  70h, 0FCh,  90h,	0A3h,  0Ch
		db  0FCh, 0FFh,	0A1h,	 0, 0FCh,  90h,	0A3h,  0Ah, 0FCh, 0FFh,	0F0h,  9Eh, 0A0h,    6,	 25h, 0A7h
		db     5,  2Ah,	0ACh,	 4,  30h, 0F0h,	   6, 0B2h,  3Ch, 0F0h,	   6, 0FCh,  80h, 0B2h,	   3,  31h
		db  0FCh,    1,	0B0h,  1Ch, 0F0h,    8,	0AFh,	 4, 0F0h,    7,	0A9h,	 4, 0F0h,    5,	0A8h,	 4
		db   70h,  22h,	 70h, 0FCh, 0A0h, 0A5h,	 0Ch, 0FCh, 0FFh, 0A2h,	   0, 0FCh, 0A0h, 0A5h,	 0Ah, 0FCh
		db  0FFh, 0F0h,	0C2h, 0FEh,    3, 0FDh,	 0Bh, 0F8h, 0C1h, 0FCh,	0FFh, 0ADh,    0, 0FCh,	 90h, 0AEh
		db   0Ch, 0FCh,	0FFh, 0ADh,    0, 0FCh,	 90h, 0AEh,  0Ah, 0F0h,	 4Ah, 0FCh, 0FFh, 0ADh,	   0, 0FCh
		db   90h, 0AEh,	 0Ch, 0FCh, 0FFh, 0ADh,	   0, 0FCh,  90h, 0AEh,	 0Ah, 0F0h,  3Eh, 0FCh,	0FFh, 0F8h
		db  0E0h, 0FEh,	 3Ch, 0FDh,  0Bh, 0F8h,	0C2h, 0A7h,    6,  27h,	 27h, 0F0h,  0Ch, 0F8h,	0E0h, 0F8h
		db  0C3h, 0A7h,	   6, 0F8h, 0E0h, 0F0h,	 42h, 0F8h, 0A1h
MUSIC_22_YM5:	db  0F8h,    0,	0FAh, 0C0h, 0FCh,    0,	0FBh,	 0, 0FEh,  2Fh,	0FDh,	 9, 0F8h, 0C2h,	0BCh,  18h
					; DATA XREF: ROM:848Bo
		db   3Ch, 0BCh,	 0Ch, 0BCh,  18h, 0BCh,	 0Ch, 0BCh,  18h,  3Ch,	0BCh,  0Ch, 0BCh,  18h,	0F8h, 0E0h
		db  0F0h,    6,	0FAh,  40h, 0FCh,    1,	0FEh,	 3, 0FDh,    9,	0FBh,  7Fh, 0FCh, 0FFh,	0A8h,	 0
		db  0FCh,  8Ah,	0A9h,  0Ch, 0FCh, 0FFh,	0A8h,	 0, 0FCh,  8Ah,	0A9h,  3Ch, 0F0h,  0Ch,	 29h, 0FCh
		db  0A0h,  2Ch,	0A9h,  3Ch, 0FCh, 0FFh,	0F0h,	 6, 0FAh, 0C0h,	0FCh,	 0, 0FBh,    0,	0FEh,  2Fh
		db  0FDh,    9,	0BCh,  18h,  3Ch, 0BCh,	 0Ch, 0BCh,  18h, 0BCh,	 0Ch, 0BCh,  18h,  3Ch,	0BCh,  0Ch
		db  0BCh,  18h,	0F0h,	 6, 0FAh,  40h,	0FCh,	 1, 0FBh,  7Fh,	0FEh,	 3, 0FDh,    9,	0FCh, 0FFh
		db  0A8h,    0,	0FCh,  8Ah, 0A9h,  0Ch,	0FCh, 0FFh, 0A8h,    0,	0FCh,  8Ah, 0A9h,  3Ch,	0F0h,  0Ch
		db   29h, 0FCh,	0A0h,  2Ch, 0AFh,  3Ch,	0FCh, 0FFh, 0F0h,    6,	0FAh, 0C0h, 0FCh,    0,	0FBh,	 0
		db  0FEh,  2Fh,	0FDh,	 9, 0F8h, 0C1h,	0BCh,  18h,  3Ch, 0BCh,	 0Ch, 0BCh,  18h, 0BCh,	 0Ch, 0BCh
		db   18h,  3Ch,	0BCh,  0Ch, 0BCh,  18h,	0F8h, 0E0h, 0F0h,    6,	0FAh,  80h, 0FEh,  0Dh,	0FDh,  0Ah
		db  0F8h, 0C1h,	0FCh, 0FFh, 0FBh,  2Ch,	0A6h,	 0, 0FCh, 0A0h,	0ABh,  12h, 0FCh, 0FFh,	0A6h,  0Ah
		db  0F0h,    8,	0FCh, 0A0h, 0ABh,  12h,	0FCh, 0FFh, 0A6h,  18h,	0F0h,	 6,  2Bh,  2Dh,	0FCh,  80h
		db  0B2h,    3,	 34h, 0FCh,    1, 0B2h,	   4, 0F0h,    3, 0ADh,	   4, 0F0h,    5, 0ABh,	   4, 0F0h
		db     5, 0A6h,	   4, 0F0h,    5, 0A1h,	   4,  70h, 0FCh, 0A0h,	0A5h,  12h, 0FCh, 0FFh,	0A0h,  0Ah
		db  0F0h,    8,	0F8h, 0E0h, 0F8h, 0C1h,	0A9h,	 0, 0FCh, 0A5h,	0AEh,  12h, 0FCh, 0FFh,	0A9h,  0Ah
		db  0F0h,    8,	0FCh, 0A5h, 0AEh,  12h,	0FCh, 0FFh, 0A9h,  18h,	0F0h,	 6,  2Eh,  30h,	0FCh,  80h
		db  0B5h,    3,	 36h, 0FCh,    1, 0B5h,	   4, 0F0h,    3, 0B0h,	   4, 0F0h,    5, 0ABh,	   4, 0F0h
		db     5, 0A9h,	   4, 0F0h,    5, 0A4h,	   4,  70h, 0FCh, 0A0h,	0A8h,  12h, 0FCh, 0FFh,	0AFh,  0Ah
		db  0F0h,    8,	0F8h, 0E0h, 0B0h,  3Ch,	0F0h,	 6, 0FCh,  80h,	0B0h,	 3,  2Fh, 0FCh,	   1, 0AEh
		db   1Ch, 0F0h,	   8, 0ADh,    4, 0F0h,	   7, 0A7h,    4, 0F0h,	   5, 0A6h,    4,  70h,	 20h,  70h
		db  0FCh,  90h,	0A3h,  0Ch, 0FCh, 0FFh,	0A1h,	 0, 0FCh,  90h,	0A3h,  0Ch, 0FCh, 0FFh,	0F0h,	 6
		db  0FAh, 0C0h,	0FCh,	 0, 0FBh,    0,	0FEh,  2Fh, 0FDh,    9,	0BCh,  18h,  3Ch, 0BCh,	 0Ch, 0BCh
		db   18h, 0BCh,	 0Ch, 0BCh,  18h, 0BCh,	 1Eh, 0FAh,  80h, 0FEh,	 0Dh, 0FDh,  0Ah, 0FCh,	   1, 0FBh
		db   2Ch, 0A0h,	   6,  25h, 0A7h,    5,	 2Ah, 0ACh,    4,  30h,	0F0h,	 6, 0B2h,  3Ch,	0F0h,	 6
		db  0FCh,  80h,	0B2h,	 3,  31h, 0FCh,	   1, 0B0h,  1Ch, 0F0h,	   8, 0AFh,    4, 0F0h,	   7, 0A9h
		db     4, 0F0h,	   5, 0A8h,    4,  70h,	 22h,  70h, 0FCh, 0A0h,	0A5h,  0Ch, 0FCh, 0FFh,	0A2h,	 0
		db  0FCh, 0A0h,	0A5h,  0Ch, 0FCh, 0FFh,	0F0h,	 6, 0FAh, 0C0h,	0FCh,	 0, 0FBh,    0,	0FEh,  2Fh
		db  0FDh,    9,	0BCh,  18h,  3Ch, 0BCh,	 0Ch, 0BCh,  18h, 0BCh,	 0Ch, 0BCh,  18h,  3Ch,	0BCh,  0Ch
		db  0BCh,  18h,	0F8h, 0C1h, 0BCh,  18h,	0BCh,  0Ch, 0BCh,  18h,	0BCh,  12h,  3Ch, 0BCh,	 18h, 0BCh
		db   0Ch, 0BCh,	 12h,  3Ch, 0BCh,  0Ch,	0F8h, 0E0h, 0FDh,  0Ah,	0BCh,  0Ch, 0BCh,  12h,	0BCh,  0Ch
		db  0BCh,  12h,	0BCh,  0Ch, 0BCh,  12h,	0BCh,  0Ch, 0BCh,    6,	0BCh,  48h, 0F8h, 0A1h
MUSIC_22_YM6:	db  0F8h,    0,	0F8h, 0CFh, 0FAh, 0C0h,	 80h,  0Ch,    0, 0FAh,	 40h,  82h,    6, 0FAh,	0C0h,  80h
					; DATA XREF: ROM:848Do
		db   0Ch,  80h,	   6,  80h,  0Ch, 0FAh,	 80h,	 3, 0FAh, 0C0h,	   0, 0FAh,  40h,    2,	0FAh, 0C0h
		db     0,    0,	0FAh,  80h,  82h,    6,	0FAh, 0C0h,  80h,  0Ch,	 80h,	 6,  80h,  0Ch,	0FAh,  40h
		db   83h,    6,	0FAh,  80h,    4, 0FAh,	0C0h,  80h,  0Ch, 0F8h,	0E0h, 0F8h, 0C1h, 0FAh,	0C0h,  80h
		db   0Ch,    0,	0FAh,  40h,  82h,    6,	0FAh, 0C0h,  80h,  0Ch,	 80h,	 6,  80h,  0Ch,	0FAh,  80h
		db   83h,    6,	 83h,  0Ch, 0FAh, 0C0h,	   0,  82h,    6, 0FAh,	0C0h,  80h,  0Ch,    0,	0FAh,  80h
		db   82h,    6,	0FAh, 0C0h,  80h,  0Ch,	   0,  80h,    6, 0FAh,	 40h,	 3, 0FAh,  80h,	   4, 0FAh
		db  0C0h,  80h,	 0Ch, 0F8h, 0E0h, 0FAh,	0C0h, 0F8h, 0C2h,  80h,	 0Ch,  80h,  12h, 0F8h,	0E0h,  80h
		db     6,  70h,	   0,  83h,  18h, 0F8h,	0CFh,  82h,    3, 0F8h,	0E0h, 0F8h, 0A1h
MUSIC_22_PSG1:	db  0FFh,    0,	   0	; DATA XREF: ROM:848Fo
MUSIC_22_PSG2:	db  0FFh,    0,	   0	; DATA XREF: ROM:8491o
MUSIC_22_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:8493o	ROM:8495o
MUSIC_23:	db 0			; DATA XREF: ROM:8000o
		db 0
		db 0
		db 182
		dw MUSIC_23_YM1
		dw MUSIC_23_YM2
		dw MUSIC_23_YM3
		dw MUSIC_23_YM4
		dw MUSIC_23_YM5
		dw MUSIC_23_YM6
		dw MUSIC_23_PSG1
		dw MUSIC_23_PSG2
		dw MUSIC_23_PSG3
		dw MUSIC_23_PSG3
MUSIC_23_YM1:	db  0FEh,  1Dh,	0FDh,  0Ch, 0FCh,    1,	0FBh,  2Ch,  9Ch,  18h,	 9Ch,  12h,  9Ch,    6,	 70h,  1Ch
					; DATA XREF: ROM:8C1Ao
		db   15h,  70h,	 15h,  70h,  97h,  0Ch,	 9Ch,  12h,  9Ch,  0Ch,	 9Bh,	 6,  1Ch,  23h,	 70h,  23h
		db   15h,  70h,	 97h,  18h, 0F8h,    0,	0FEh,  1Dh, 0FDh,  0Ch,	0FBh,  2Ch,  9Ch,  18h,	 9Ch,  12h
		db   9Ch,    6,	 70h,  1Ch,  17h,  70h,	 17h,  70h,  9Ch,  18h,	 9Ch,  12h,  9Ch,    6,	 70h,  17h
		db   70h,  9Ch,	 0Ch, 0A3h,    6,  1Ch,	 70h,  97h,  0Ch,  95h,	 18h,  95h,  12h,  9Ch,	   6,  70h
		db   1Ch,  15h,	 70h,  15h,  70h, 0A1h,	 12h,  95h,    6,  9Ch,	 0Ch,  9Ch,    6,  95h,	 0Ch,  94h
		db     6,  15h,	 70h,  21h,  70h,  95h,	 12h,  9Ch,  0Ch,  9Eh,	   6,  1Ch,  17h,  9Ch,	 12h,  9Ch
		db     6,  70h,	 1Ch,  17h,  70h,  17h,	 70h,  9Ch,  18h,  9Ch,	 12h,  9Ch,    6,  70h,	 17h,  70h
		db   9Ch,  0Ch,	0A3h,	 6,  1Ch,  70h,	 97h,  0Ch,  95h,  18h,	 95h,  12h,  9Ch,    6,	 70h,  1Ch
		db   15h,  70h,	 15h,  70h, 0A1h,  12h,	 95h,	 6,  9Ch,  0Ch,	 9Ch,	 6,  95h,  0Ch,	 94h,	 6
		db   15h,  70h,	 21h,  70h,  95h,  0Ch,	 95h,	 6,  1Ch, 0F0h,	 3Ch, 0FEh,  21h, 0FDh,	 0Ch,  95h
		db     6,  17h,	 70h,  17h,  1Ah,  1Ch,	0F0h,  36h,  9Ch,    6,	 1Ah,  70h,  17h,  70h,	 9Ch,  0Ch
		db  0F8h,  20h,	0FEh,  1Dh, 0FDh,  0Ch,	 9Ah,  12h,  9Ah,  0Ch,	 1Ah,  99h,    6,  1Ah,	 70h,  21h
		db   70h,  15h,	 70h,  1Ah,  1Bh,  9Ch,	 12h,  1Ch,  1Ch,  1Ch,	 9Ch,	 6,  70h, 0F8h,	 40h,  97h
		db     6,  70h,	 70h,  9Ch,  12h,  1Ch,	 9Ch,	 6, 0F0h,  0Ch,	 97h,	 6,  70h,  9Ch,	 18h, 0F8h
		db  0A0h, 0F8h,	 60h, 0A3h,    6,  70h,	 70h,  9Ch,  12h,  9Ch,	 0Ch, 0A3h,    6,  1Ch,	0F0h,  0Ch
		db   97h,    6,	 70h,  9Ch,  18h, 0FEh,	 21h, 0FDh,  0Ch,  9Ah,	   6,  1Ah, 0F0h,  30h,	 93h,	 6
		db   15h,  70h,	 15h,  18h,  1Ah, 0F0h,	 36h,  9Ah,    6,  18h,	 70h,  15h,  70h,  9Ah,	 0Ch, 0FEh
		db   1Dh, 0FDh,	 0Ch,  9Ch,  12h,  1Ch,	 9Ch,  0Ch,  9Ch,    6,	 70h,  15h,  70h,  17h,	 70h,  1Ah
		db   70h, 0FCh,	   6,  9Ch,  0Ch,  1Ch,	 17h,  1Ch,  70h, 0FEh,	 21h, 0FDh,  0Ch, 0FCh,	   1, 0FCh
		db  0B1h, 0A3h,	   8, 0F0h,    4, 0FDh,	 0Dh, 0FCh, 0FFh, 0FBh,	0D2h,  97h,  18h, 0F8h,	0A1h
MUSIC_23_YM2:	db  0FCh,    1,	0FBh,  2Ch, 0F0h, 0C0h,	0F8h,	 0, 0FEh,  3Ch,	0FDh,  0Ah, 0AFh,  0Ch,	0AFh,	 6
					; DATA XREF: ROM:8C1Co
		db   31h, 0AFh,	   4,  31h,  2Fh, 0AEh,	   6, 0AFh,  0Ch, 0B1h,	   6, 0B3h,  0Ch, 0B4h,	   6, 0B6h
		db   0Ch,  38h,	0AFh,	 6, 0B1h,  0Ch,	0AFh,	 4,  31h,  2Fh,	0AEh,	 6, 0AFh,  0Ch,	0B1h,	 6
		db  0B3h,  0Ch,	0B4h,	 6, 0B6h,  0Ch,	 38h,  31h, 0B1h,  12h,	0B4h,	 6, 0B1h,  0Ch,	 31h, 0B0h
		db     6,  31h,	0ACh,  0Ch,  36h, 0B8h,	   6, 0B1h,  0Ch,  31h,	0B4h,	 6, 0B1h,  0Ch,	 31h, 0B0h
		db     6, 0B1h,	 0Ch, 0B4h,    6, 0AFh,	 12h, 0AFh,    6,  31h,	0AFh,	 4,  31h,  2Fh,	0AEh,	 6
		db  0AFh,  0Ch,	0B1h,	 6, 0B3h,  0Ch,	0B4h,	 6, 0B6h,  0Ch,	 38h, 0AFh,    6, 0B1h,	 0Ch, 0AFh
		db     4,  31h,	 2Fh, 0AEh,    6, 0AFh,	 0Ch, 0B1h,    6, 0B3h,	 0Ch, 0B4h,    6, 0B6h,	 0Ch,  38h
		db   31h, 0B1h,	 12h, 0B4h,    6, 0B1h,	 0Ch,  31h, 0B0h,    6,	 31h, 0ACh,  0Ch,  36h,	0B8h,	 6
		db  0B1h,  0Ch,	 31h, 0B4h,    6, 0B1h,	 0Ch,  31h, 0B0h,    6,	0B1h,  0Ch, 0B4h,    6,	0AFh,  24h
		db  0FAh,  80h,	0FEh,	 3, 0FDh,    8,	 9Ch,  18h, 0FCh, 0C0h,	0A8h,  24h, 0FCh, 0FFh,	0A6h,	 6
		db   25h,  26h,	 70h,  2Ah,  70h, 0A1h,	 12h, 0FCh,  8Dh, 0A3h,	 30h, 0FCh, 0FFh, 0F0h,	 60h, 0FAh
		db  0C0h, 0FEh,	 3Ch, 0F8h,  20h, 0FDh,	 0Ah, 0B4h,    6,  32h,	 2Fh,  36h,  34h,  2Fh,	 38h,  36h
		db   34h,  39h,	 38h,  36h,  38h,  36h,	 34h, 0AFh,  0Ch, 0B4h,	   6,  32h,  2Fh,  36h,	 34h,  32h
		db   2Fh,  39h,	 38h,  36h, 0B8h,  0Ch,	0B4h,	 6, 0AFh,  0Ch,	0F8h,  40h, 0FDh,    0,	0F0h,  60h
		db  0F8h, 0A0h,	0F8h,  60h, 0FDh,  0Bh,	0B2h,	 6, 0B2h,  18h,	0FAh,  80h, 0FEh,    3,	0FDh,	 8
		db   1Ah, 0FCh,	0BEh, 0A6h,  24h, 0FCh,	0FFh, 0A4h,    6,  23h,	 24h,  70h,  28h,  70h,	 9Fh,  12h
		db  0FCh,  8Dh,	0A1h,	 6, 0FCh, 0FFh,	0FAh, 0C0h, 0FEh,  3Ch,	0FDh,  0Bh,  36h,  34h,	 32h,  30h
		db   2Dh,  2Bh,	 2Ah, 0F0h,  60h, 0ACh,	 0Ch,  2Dh,  2Ah,  2Ch,	0F0h,  30h, 0F8h, 0A1h
MUSIC_23_YM3:	db  0FBh,  2Ch,	0F0h, 0C0h, 0F8h,    0,	0FCh,	 1, 0FEh,  3Ch,	0FDh,  0Ah, 0ACh,  0Ch,	0ACh,	 6
					; DATA XREF: ROM:8C1Eo
		db   2Dh, 0ACh,	   4,  2Dh,  2Ch, 0ABh,	   6, 0ACh,  0Ch, 0ADh,	   6, 0AFh,  0Ch, 0B1h,	   6, 0B3h
		db   0Ch,  34h,	0ACh,	 6, 0ADh,  0Ch,	0ACh,	 4,  2Dh,  2Ch,	0ABh,	 6, 0ACh,  0Ch,	0ADh,	 6
		db  0AFh,  0Ch,	0B1h,	 6, 0B3h,  0Ch,	 34h,  2Dh, 0ADh,  12h,	0B1h,	 6, 0ADh,  0Ch,	 2Dh, 0ACh
		db     6,  2Dh,	0A8h,  0Ch,  33h, 0B4h,	   6, 0ADh,  0Ch,  2Dh,	0B1h,	 6, 0ADh,  0Ch,	 2Dh, 0ACh
		db     6, 0ADh,	 0Ch, 0B1h,    6, 0ACh,	 12h, 0ACh,    6,  2Dh,	0ACh,	 4,  2Dh,  2Ch,	0ABh,	 6
		db  0ACh,  0Ch,	0ADh,	 6, 0AFh,  0Ch,	0B1h,	 6, 0B3h,  0Ch,	 34h, 0ACh,    6, 0ADh,	 0Ch, 0ACh
		db     4,  2Dh,	 2Ch, 0ABh,    6, 0ACh,	 0Ch, 0ADh,    6, 0AFh,	 0Ch, 0B1h,    6, 0B3h,	 0Ch,  34h
		db   2Dh, 0ADh,	 12h, 0B1h,    6, 0ADh,	 0Ch,  2Dh, 0ACh,    6,	 2Dh, 0A8h,  0Ch,  33h,	0B4h,	 6
		db  0ADh,  0Ch,	 2Dh, 0B1h,    6, 0ADh,	 0Ch,  2Dh, 0ACh,    6,	0ADh,  0Ch, 0B1h,    6,	0ACh,  21h
		db  0FAh,  40h,	0FEh,	 3, 0FDh,    9,	 9Ch,  18h, 0FCh, 0C0h,	0A8h,  24h, 0FCh, 0FFh,	0A6h,	 6
		db   25h,  26h,	 70h,  2Ah,  70h, 0A1h,	 12h, 0FCh,  8Dh, 0A3h,	 33h, 0FCh, 0FFh, 0F0h,	 60h, 0FAh
		db  0C0h, 0FEh,	 3Ch, 0F8h,  20h, 0FDh,	 0Ah, 0ACh,  12h,  2Dh,	 2Fh,  31h, 0AFh,  0Ch,	0ACh,  12h
		db   2Ch, 0ADh,	 18h, 0B1h,  0Ch, 0ADh,	   6, 0AFh,  0Ch, 0ACh,	   6, 0AFh,  0Ch, 0F8h,	 40h, 0FDh
		db     0, 0F0h,	 60h, 0F8h, 0A0h, 0F8h,	 60h, 0FDh,  0Bh, 0AAh,	   6, 0AAh,  15h, 0FAh,	 40h, 0FEh
		db     3, 0FDh,	   9,  9Ah,  18h, 0FCh,	0BEh, 0A6h,  24h, 0FCh,	0FFh, 0A4h,    6,  23h,	 24h,  70h
		db   28h,  70h,	 9Fh,  12h, 0FCh,  8Dh,	0A1h,  33h, 0FCh, 0FFh,	0F0h,  0Ch, 0FAh, 0C0h,	0FDh,  0Ah
		db   23h, 0F0h,	   6, 0A3h,    4, 0F0h,	   8, 0A3h,    6,  25h,	0A5h,	 4, 0F0h,    8,	0A3h,	 4
		db  0F0h,    8,	0A5h,	 6, 0A1h,  0Ch,	0FCh,	 8,  23h,  25h,	 21h,  23h, 0F0h,  30h,	0F8h, 0A1h
MUSIC_23_YM4:	db  0FBh,  2Ch,	0F0h, 0C0h, 0F8h,    0,	0FCh,	 1, 0F8h, 0C7h,	0F0h,  60h, 0F8h, 0E0h,	0F0h,  18h
					; DATA XREF: ROM:8C20o
		db  0FEh,    3,	0FDh,  0Ah,  1Ch, 0FCh,	0C0h, 0A8h,  24h, 0FCh,	0FFh, 0A6h,    6,  25h,	 26h,  70h
		db   2Ah,  70h,	0A1h,  12h, 0FCh,  8Dh,	0A3h,  36h, 0FCh, 0FFh,	0F8h, 0C5h, 0F0h,  60h,	0F8h, 0E0h
		db  0F0h,  18h,	 1Ah, 0FCh, 0BEh, 0A6h,	 24h, 0FCh, 0FFh, 0A4h,	   6,  23h,  24h,  70h,	 28h,  70h
		db   9Fh,  12h,	0FCh,  8Dh, 0A1h,  36h,	0FCh, 0FFh, 0F0h,  0Ch,	 2Ch, 0F0h,    6, 0ACh,	   4, 0F0h
		db     8, 0ACh,	   6,  2Dh, 0ADh,    4,	0F0h,	 8, 0ACh,    4,	0F0h,	 8, 0ADh,    6,	0AAh,  0Ch
		db  0FCh,    8,	 2Ch,  2Dh,  2Ah,  2Ch,	0F0h,  30h, 0F8h, 0A1h
MUSIC_23_YM5:	db  0FEh,  2Fh,	0FDh,	 9, 0FCh,    0,	0FBh,	 0, 0BCh,  18h,	 3Ch, 0BCh,  0Ch, 0BCh,	 18h,  3Ch
					; DATA XREF: ROM:8C22o
		db  0BCh,  0Ch,	0BCh,  18h, 0BCh,  0Ch,	0BCh,  18h, 0BCh,  0Ch,	0F8h,	 0, 0F8h, 0C4h,	0BCh,  18h
		db   3Ch, 0BCh,	 0Ch, 0BCh,  18h,  3Ch,	0BCh,  0Ch, 0BCh,  18h,	0BCh,  0Ch, 0BCh,  18h,	0BCh,  0Ch
		db  0F8h, 0E0h,	0F8h, 0C1h, 0BCh,  18h,	 3Ch,  3Ch,  3Ch, 0BCh,	 12h,  3Ch,  3Ch,  3Ch,	0BCh,  0Ch
		db  0BCh,  12h,	 3Ch, 0BCh,  24h, 0BCh,	 0Ch, 0BCh,  18h, 0F8h,	0E0h, 0BCh,  18h,  3Ch,	0BCh,  0Ch
		db  0BCh,  18h,	 3Ch, 0BCh,  0Ch, 0BCh,	 18h, 0BCh,  0Ch, 0BCh,	 18h, 0BCh,  0Ch, 0BCh,	 18h,  3Ch
		db  0BCh,  0Ch,	0BCh,  18h, 0BCh,  0Ch,	 3Ch,  3Ch,  3Ch, 0BCh,	 3Ch, 0F8h, 0A1h
MUSIC_23_YM6:	db  0FAh, 0C0h,	 80h,  0Ch,    0, 0FAh,	 40h,  83h,    6, 0FAh,	0C0h,  80h,  0Ch,  80h,	   6,  80h
					; DATA XREF: ROM:8C24o
		db   0Ch, 0FAh,	 80h,	 4, 0FAh, 0C0h,	   0, 0FAh,  40h,    2,	0FAh, 0C0h,    0,    0,	0FAh,  80h
		db   83h,    6,	0FAh, 0C0h,  80h,  0Ch,	 80h,	 6,  80h,  0Ch,	 83h,	 6,    3,    3,	0FAh,  80h
		db     4, 0FAh,	 40h,	 2, 0FAh, 0C0h,	   3, 0F8h,    0, 0F8h,	0C4h, 0FAh, 0C0h,  80h,	 0Ch,	 0
		db  0FAh,  40h,	 83h,	 6, 0FAh, 0C0h,	 80h,  0Ch,  80h,    6,	 80h,  0Ch, 0FAh,  80h,	   4, 0FAh
		db  0C0h,    0,	0FAh,  40h,    2, 0FAh,	0C0h,	 0,    0, 0FAh,	 80h,  83h,    6, 0FAh,	0C0h,  80h
		db   0Ch,  80h,	   6,  80h,  0Ch, 0FAh,	 40h,  83h,    6, 0FAh,	 80h,	 4, 0FAh, 0C0h,	 80h,  0Ch
		db  0FAh,  40h,	   2, 0F8h, 0E0h, 0F8h,	0C1h, 0FAh, 0C0h,  80h,	 0Ch,	 0, 0FAh,  40h,	 83h,	 6
		db  0FAh, 0C0h,	 80h,  0Ch,  80h,    6,	 80h,  0Ch, 0FAh,  80h,	   4, 0FAh, 0C0h,    0,	0FAh,  40h
		db     2, 0FAh,	0C0h,  80h,  12h,    0,	   0,	 0,  83h,    6,	   0, 0FAh,  80h,  84h,	 0Ch, 0FAh
		db   40h,  82h,	   6, 0FAh, 0C0h,  80h,	 12h,  80h,  0Ch,  80h,	   6,  83h,  0Ch,  83h,	   6, 0FAh
		db   80h,  84h,	 0Ch, 0FAh, 0C0h,    0,	0FAh,  40h,    2, 0F8h,	0E0h, 0F8h,  20h, 0FAh,	0C0h,  80h
		db   0Ch,    0,	0FAh,  40h,  83h,    6,	0FAh, 0C0h,  80h,  0Ch,	 80h,	 6,  80h,  0Ch,	0FAh,  80h
		db     4, 0FAh,	0C0h,	 0, 0FAh,  40h,	   2, 0F8h,  40h, 0FAh,	0C0h,  80h,  0Ch,    0,	0FAh,  80h
		db   83h,    6,	0FAh, 0C0h,  80h,  0Ch,	 80h,	 6,  80h,  0Ch,	0FAh,  40h,  83h,    6,	0FAh,  80h
		db     4, 0FAh,	0C0h,  80h,  0Ch, 0FAh,	 40h,	 2, 0F8h, 0A0h,	0F8h,  60h, 0FAh, 0C0h,	 80h,  0Ch
		db     0,    0,	 80h,  12h, 0FAh,  80h,	 82h,	 6,  82h,  0Ch,	0FAh, 0C0h,    3, 0FAh,	 40h,	 4
		db  0F8h, 0A1h
MUSIC_23_PSG1:	db  0FDh,    0,	0F0h,  0Ch, 0FDh,  2Ch,	0FCh,	 4, 0FBh,  4Ch,	0ACh,	 6,  2Ch, 0F0h,	 0Ch, 0ACh
					; DATA XREF: ROM:8C26o
		db     6,  2Ch,	 2Dh,  2Dh,  70h,  2Ch,	 70h,  2Dh,  2Ah,  70h,	0FDh,	 0, 0F0h,  0Ch,	0FDh,  2Ch
		db  0ACh,    6,	 2Ch, 0F0h,  0Ch, 0ACh,	   6,  2Ch,  2Dh,  2Dh,	 70h, 0AAh,    9, 0FDh,	   0, 0F0h
		db   15h, 0F8h,	   0, 0F8h, 0D3h, 0F0h,	 0Ch, 0FDh,  2Ah, 0ACh,	   6,  2Ch, 0F0h,  0Ch,	0ACh,	 6
		db   2Ch, 0F8h,	0E0h, 0FDh,  2Ch, 0F8h,	0C2h, 0ADh,    6,  2Dh,	 70h,  2Ch, 0F8h, 0E0h,	0ADh,	 6
		db   70h,  2Dh,	 2Fh, 0FDh,    0,  70h,	0FDh,  2Ah, 0F8h, 0C3h,	0ACh,	 6,  2Ch,  70h,	0F8h, 0E0h
		db  0ACh,    6,	0F8h, 0C1h, 0F0h,    6,	 2Ch,  2Ch, 0F8h, 0E0h,	0F0h,  0Ch, 0ACh,    6,	 2Ch, 0F0h
		db   12h, 0ACh,	   6,  2Ch,  70h,  2Ch,	 2Ch, 0FDh,  2Ch, 0F8h,	0C2h, 0ADh,    6,  2Dh,	 70h,  2Ch
		db  0F8h, 0E0h,	0ADh,	 6,  31h,  70h,	 2Fh, 0FDh,    0,  70h,	0FDh,  2Ah, 0F8h, 0C3h,	0ACh,	 6
		db   2Ch,  70h,	0F8h, 0E0h, 0ACh,    6,	0F8h, 0C1h, 0F0h,    6,	 2Ch,  2Ch, 0F8h, 0E0h,	0F0h,  0Ch
		db  0ACh,    6,	 2Ch, 0F0h,  12h, 0ACh,	   6,  2Ch,  70h,  2Ch,	 2Ch, 0F8h, 0C7h, 0FDh,	   0, 0F0h
		db   0Ch, 0FDh,	 2Ah, 0AAh,    6,  2Ah,	0F8h, 0E0h, 0F8h, 0C3h,	0FDh,	 0, 0F0h,  0Ch,	0FDh,  2Ah
		db  0ACh,    6,	 2Ch, 0F8h, 0E0h, 0FDh,	 2Ch, 0ACh,    6,  70h,	 2Dh,  70h,  2Ah,  70h,	 2Ch,  70h
		db  0FDh,    0,	0F0h,  30h, 0F8h, 0A1h
MUSIC_23_PSG2:	db  0FCh,    1,	0FBh,  4Ch, 0FDh,    0,	0F0h,  0Ch, 0FDh,  2Bh,	0A8h,	 6,  28h, 0F0h,	 0Ch, 0A8h
					; DATA XREF: ROM:8C28o
		db     6,  28h,	 2Ah,  2Ah,  70h,  28h,	 70h,  2Ah,  27h,  70h,	0FDh,	 0, 0F0h,  0Ch,	0FDh,  2Bh
		db  0A8h,    6,	 28h, 0F0h,  0Ch, 0A8h,	   6, 0F0h,    0, 0A8h,	   6, 0F0h,    0, 0AAh,	   6, 0F0h
		db     0, 0AAh,	   6,  70h, 0A7h,    9,	0FDh,	 0, 0F0h,  15h,	0F8h,	 0, 0F8h, 0D3h,	0F0h,  0Ch
		db  0FDh,  29h,	0A8h,	 6,  28h, 0F0h,	 0Ch, 0A8h,    6,  28h,	0F8h, 0E0h, 0FDh,  2Bh,	0F8h, 0C2h
		db  0AAh,    6,	 2Ah,  70h,  28h, 0F8h,	0E0h, 0AAh,    6,  70h,	 2Ah,  2Ch, 0FDh,    0,	 70h, 0FDh
		db   29h, 0F8h,	0C3h, 0A8h,    6,  28h,	 70h, 0F8h, 0E0h, 0A8h,	   6, 0F8h, 0C1h, 0F0h,	   6,  28h
		db   28h, 0F8h,	0E0h, 0F0h,  0Ch, 0A8h,	   6,  28h, 0F0h,  12h,	0A8h,	 6,  28h,  70h,	 28h,  28h
		db  0FDh,  2Bh,	0F8h, 0C2h, 0AAh,    6,	 2Ah,  70h,  28h, 0F8h,	0E0h, 0AAh,    6,  2Dh,	 70h,  2Ch
		db  0FDh,    0,	 70h, 0FDh,  29h, 0F8h,	0C3h, 0A8h,    6,  28h,	 70h, 0F8h, 0E0h, 0A8h,	   6, 0F8h
		db  0C1h, 0F0h,	   6,  28h,  28h, 0F8h,	0E0h, 0F0h,  0Ch, 0A8h,	   6,  28h, 0F0h,  12h,	0A8h,	 6
		db   28h,  70h,	 28h,  28h, 0F8h, 0C7h,	0FDh,	 0, 0F0h,  0Ch,	0FDh,  29h, 0A6h,    6,	 26h, 0F8h
		db  0E0h, 0F8h,	0C3h, 0FDh,    0, 0F0h,	 0Ch, 0FDh,  29h, 0A8h,	   6,  28h, 0F8h, 0E0h,	0FDh,  2Bh
		db  0A8h,    6,	 70h,  2Ah,  70h,  27h,	 70h,  28h,  70h, 0FDh,	   0, 0F0h,  30h, 0F8h,	0A1h
MUSIC_23_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:8C2Ao	ROM:8C2Co
MUSIC_24:	db 0			; DATA XREF: ROM:8000o
		db 0
		db 0
		db 202
		dw MUSIC_24_YM1
		dw MUSIC_24_YM2
		dw MUSIC_24_YM3
		dw MUSIC_24_YM4
		dw MUSIC_24_YM5
		dw MUSIC_24_YM6
		dw MUSIC_24_PSG1
		dw MUSIC_24_PSG2
		dw MUSIC_24_PSG3
		dw MUSIC_24_PSG3
MUSIC_24_YM1:	db  0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	0FEh,  1Ah, 0FDh,  0Ch,	0ABh,  30h, 0B0h,  48h,	0AFh,  0Ch
					; DATA XREF: ROM:9380o
		db   2Dh,  2Fh,	 30h,  32h,  70h, 0ABh,	 90h, 0F0h,  18h,  34h,	0B5h,  0Ch,  34h,  35h,	 39h, 0AEh
		db   48h, 0AFh,	 18h,  37h,  35h, 0B3h,	 30h,  34h, 0F0h,  18h,	 3Bh,  3Ch,  34h, 0B7h,	 24h, 0B5h
		db   0Ch, 0B5h,	 30h, 0F0h,  18h,  3Bh,	 3Ch,  33h, 0B5h,  24h,	0B4h,  0Ch, 0B4h,  60h,	0B9h,  30h
		db  0B0h,  0Ch,	 2Fh,  30h,  35h, 0ADh,	 48h, 0AFh,  0Ch,  30h,	0B4h,  24h, 0B2h,  0Ch,	0B7h,  60h
		db   70h, 0FEh,	 1Bh, 0FDh,  0Ah, 0ABh,	 30h, 0B0h,  48h, 0AFh,	 0Ch,  2Dh,  2Fh,  30h,	 32h,  70h
		db  0ABh,  30h,	0B4h,  48h, 0B2h,  0Ch,	 31h,  32h,  34h,  35h,	 70h, 0FEh,  10h, 0FDh,	 0Bh, 0F9h
		db   84h, 0FCh,	   5,  37h,  37h,  34h,	 34h,  39h,  39h,  34h,	 34h,  35h,  35h,  32h,	 32h,  30h
		db   30h,  2Fh,	 2Fh,  37h,  37h,  3Ah,	 3Ah,  39h,  39h,  34h,	 34h,  35h,  35h,  39h,	 39h,  37h
		db   37h,  32h,	 32h, 0F9h,    0, 0F0h,	 78h, 0FEh,  1Ah, 0FDh,	 0Bh, 0FCh,    1, 0AFh,	 0Ch,  30h
		db  0B2h,  1Eh,	0F0h,  8Ah, 0B1h,  0Ch,	 32h, 0B4h,  18h, 0FDh,	 0Ch,  38h,  39h,  34h,	0B7h,  24h
		db  0B5h,  0Ch,	0B5h,  3Ch, 0F0h,  0Ch,	0BBh,  18h,  3Ch,  37h,	0BAh,  24h, 0B9h,  0Ch,	0B9h,  3Ch
		db  0F0h,  0Ch,	0B1h,  18h,  32h,  2Dh,	0B4h,  24h, 0B2h,  0Ch,	0B5h,  12h, 0F0h,    6,	0B4h,  18h
		db  0B7h,  24h,	0B5h,  0Ch, 0B9h,  12h,	0F0h,	 6, 0B8h,  18h,	0BBh,  24h, 0B9h,  0Ch,	0BCh,  24h
		db  0F0h,  0Ch,	0B0h,  24h, 0B2h,  0Ch,	0B4h,  3Ch, 0F0h,  0Ch,	 34h,  35h, 0B2h,  3Ch,	0F0h,  0Ch
		db   2Bh,  70h,	0B5h,  3Ch, 0F0h,  0Ch,	 35h,  37h, 0B4h,  3Ch,	0F0h,  0Ch,  30h,  70h,	0B7h,  3Ch
		db  0F0h,  0Ch,	 37h,  39h, 0B5h,  18h,	0F0h,  0Ch,  3Ch, 0BCh,	 24h, 0B5h,  0Ch, 0B4h,	 3Ch, 0F0h
		db   0Ch,  34h,	 34h, 0B5h,  18h, 0B4h,	 30h, 0B2h,  18h, 0F8h,	0A1h
MUSIC_24_YM2:	db  0F8h,    0,	0FEh,  1Ah, 0FDh,  0Ah,	0FCh,	 1, 0FBh,  2Ch,	0A8h,  18h,  24h,  28h,	 24h, 0A6h
					; DATA XREF: ROM:9382o
		db   48h, 0A4h,	 0Ch,  23h, 0A4h,  18h,	 1Fh,  24h, 0A8h,  30h,	 26h, 0A5h,  18h,  26h,	 21h,  29h
		db   26h,  25h,	0A6h,  30h,  23h,  9Fh,	 18h,  24h,  1Fh,  24h,	 28h,  2Bh, 0A4h,  30h,	0A9h,  18h
		db   24h,  29h,	 24h,  29h,  24h,  29h,	 24h,  2Bh,  24h,  2Bh,	 24h,  2Dh,  28h,  24h,	 70h, 0FEh
		db     3, 0FDh,	 0Ah, 0A1h,  0Ch,  70h,	0A6h,  24h, 0A4h,  0Ch,	0A9h,  60h, 0F0h,  18h,	0A3h,  0Ch
		db   70h, 0A8h,	 24h, 0A6h,  0Ch, 0ABh,	 60h, 0F0h,  30h,  28h,	0A9h,  24h, 0A8h,  0Ch,	 26h,  70h
		db   23h,  70h,	0F0h,  30h,  2Bh, 0ADh,	 24h, 0ABh,  0Ch,  29h,	 70h,  2Dh,  70h, 0FEh,	 10h, 0FDh
		db   0Bh, 0FCh,	   5, 0F9h,  84h,  2Fh,	 2Fh,  2Bh,  2Bh,  34h,	 34h,  2Dh,  2Dh,  2Dh,	 2Dh,  29h
		db   29h,  2Bh,	 2Bh,  2Bh,  2Bh,  2Eh,	 2Eh,  34h,  34h,  34h,	 34h,  2Dh,  2Dh,  2Dh,	 2Dh,  32h
		db   32h,  2Fh,	 2Fh,  2Fh,  2Fh, 0F9h,	   0, 0FEh,    3, 0FDh,	 0Bh, 0FCh,    1, 0A4h,	 48h, 0A3h
		db   0Ch,  24h,	0A6h,  3Ch, 0F0h,  0Ch,	 1Fh,  70h, 0A6h,  48h,	0A4h,  0Ch,  26h, 0A8h,	 60h, 0FEh
		db   1Ah, 0FDh,	 0Ah,  26h, 0F0h,  18h,	 25h, 0A8h,  24h, 0A6h,	 0Ch, 0A4h,  60h, 0F0h,	 18h,  28h
		db  0A9h,  24h,	0ABh,  0Ch, 0A9h,  3Ch,	0F0h,  0Ch,  29h,  2Bh,	0ADh,  48h, 0AFh,  0Ch,	 30h, 0B2h
		db   3Ch, 0F0h,	 0Ch,  32h,  34h, 0B5h,	 24h, 0F0h,  0Ch, 0ACh,	 18h, 0F0h,  0Ch,  2Ch,	0ABh,  3Ch
		db  0F0h,  0Ch,	 2Bh,  70h, 0ABh,  3Ch,	0F0h,  24h, 0ABh,  3Ch,	0F0h,  0Ch,  2Bh,  70h,	0ABh,  3Ch
		db  0F0h,  0Ch,	 2Bh,  70h, 0B0h,  3Ch,	0F0h,  0Ch,  30h,  70h,	0B0h,  28h, 0F0h,    8,	0B0h,  28h
		db  0F0h,    8,	0B0h,  0Ch,  2Fh,  30h,	 32h, 0B0h,  60h, 0AFh,	 30h, 0F8h, 0A1h
MUSIC_24_YM3:	db  0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	0F8h, 0C6h, 0F0h, 0C0h,	0F8h, 0E0h, 0F0h,  78h,	0FEh,  1Ah
					; DATA XREF: ROM:9384o
		db  0FDh,  0Ah,	0A6h,  18h,  24h,  23h,	0F0h, 0C0h,  70h, 0A8h,	 0Ch, 0F0h,  24h, 0A8h,	 0Ch, 0F0h
		db   24h, 0A6h,	 0Ch, 0F0h,  24h, 0A6h,	 0Ch, 0F0h,  24h, 0A8h,	 0Ch, 0F0h,  24h, 0A8h,	 0Ch, 0F0h
		db   24h, 0A6h,	 0Ch, 0F0h,  24h, 0A6h,	 30h, 0FEh,    3, 0FDh,	 0Ah, 0A1h,  48h,  9Fh,	 0Ch,  21h
		db  0A3h,  3Ch,	0F0h,  0Ch,  1Ah,  70h,	0A3h,  48h, 0A1h,  0Ch,	 23h, 0A5h,  60h, 0F0h,	0C0h,  70h
		db  0FEh,  1Ah,	0FDh,  0Ah, 0A6h,  60h,	 26h, 0A9h,  3Ch, 0F0h,	 0Ch,  29h,  2Bh, 0ACh,	 24h, 0F0h
		db   0Ch, 0A9h,	 18h, 0F0h,  0Ch,  29h,	0A4h,  3Ch, 0F0h,  0Ch,	 24h,  70h, 0A6h,  3Ch,	0F0h,  0Ch
		db   23h,  70h,	0A3h,  3Ch, 0F0h,  0Ch,	 23h,  70h, 0A4h,  3Ch,	0F0h,  0Ch,  24h,  70h,	0A8h,  3Ch
		db  0F0h,  0Ch,	 28h,  70h, 0A9h,  28h,	0F0h,	 8, 0A9h,  28h,	0F0h,	 8, 0F0h,  48h,	0ABh,  0Ch
		db   70h, 0ABh,	 60h, 0F8h, 0A1h
MUSIC_24_YM4:	db  0FEh,  24h,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	 98h,  60h,  9Dh,  78h,	 9Ch,  0Ch
					; DATA XREF: ROM:9386o
		db   1Ah,  1Ch,	 1Dh,  1Fh,  70h,  96h,	 30h,  15h,  9Ah,  60h,	 13h,  18h,  16h,  15h,	 14h,  13h
		db   12h, 0FCh,	 0Bh, 0F8h, 0C2h,  93h,	 18h,  13h,  70h,  13h,	0F8h, 0E0h, 0FCh,    1,	 9Fh,  30h
		db   13h, 0FCh,	 0Bh,  98h,  18h,  18h,	 70h,  13h,  1Ah,  1Ah,	 70h,  13h,  1Ch,  1Ch,	 70h,  13h
		db   1Dh,  1Dh,	 70h,  1Ah, 0FCh,  24h,	 9Ch,  30h,  19h,  1Ah,	 1Fh,  1Ch,  19h,  1Ah,	0FCh,	 1
		db   10h, 0FCh,	 0Bh, 0F8h, 0C6h,  91h,	 18h, 0F8h, 0E0h, 0FCh,	   1,  91h,  18h, 0FCh,	 0Bh, 0F8h
		db  0C3h,  90h,	 18h, 0F8h, 0E0h, 0F8h,	0C3h,  95h,  18h, 0F8h,	0E0h, 0FCh,    1,  8Eh,	 0Ch,  70h
		db   0Eh, 0F0h,	 24h,  90h,  0Ch,  11h,	 13h,  70h,  13h, 0F0h,	 24h,  93h,  0Ch,  11h,	 10h,  70h
		db   10h, 0F0h,	 24h,  91h,  0Ch,  13h,	 15h,  70h,  15h, 0F0h,	 24h,  95h,  0Ch,  70h,	 9Ah,  30h
		db  0F0h,  18h,	 9Ah,  0Ch,  70h,  98h,	 30h, 0F0h,  18h,  98h,	 0Ch,  70h,  97h,  30h,	0F0h,  18h
		db   97h,  0Ch,	 70h,  96h,  30h, 0F0h,	 48h,  93h,  0Ch,  70h,	 98h,  48h,  97h,  0Ch,	 15h,  17h
		db   18h,  1Ah,	0F0h,  24h,  93h,  0Ch,	 70h,  9Ah,  48h,  98h,	 0Ch,  17h,  18h,  1Ah,	 1Ch, 0F0h
		db   24h,  98h,	 0Ch,  70h, 0A2h,  30h,	 21h,  20h,  9Fh,  60h,	 13h, 0F8h, 0A1h
MUSIC_24_YM5:	db  0FAh,  40h,	0F0h,	 6, 0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	0F9h,  20h, 0FEh,  1Ah,	0FDh,	 9
					; DATA XREF: ROM:9388o
		db  0ABh,  30h,	0B0h,  48h, 0AFh,  0Ch,	 2Dh,  2Fh,  30h,  32h,	 70h, 0ABh,  90h, 0F0h,	 18h,  34h
		db  0B5h,  0Ch,	 34h,  35h,  39h, 0AEh,	 48h, 0AFh,  18h,  37h,	 35h, 0B3h,  30h,  34h,	0F0h,  18h
		db   3Bh,  3Ch,	 34h, 0B7h,  24h, 0B5h,	 0Ch, 0B5h,  30h, 0F0h,	 18h,  3Bh,  3Ch,  33h,	0B5h,  24h
		db  0B4h,  0Ch,	0B4h,  60h, 0B9h,  30h,	0B0h,  0Ch,  2Fh,  30h,	 35h, 0ADh,  48h, 0AFh,	 0Ch,  30h
		db  0B4h,  24h,	0B2h,  0Ch, 0B7h,  60h,	 70h, 0FAh,  80h, 0FEh,	 1Bh, 0FDh,    6, 0ABh,	 30h, 0B0h
		db   48h, 0AFh,	 0Ch,  2Dh,  2Fh,  30h,	 32h,  70h, 0ABh,  30h,	0B4h,  48h, 0B2h,  0Ch,	 31h,  32h
		db   34h,  35h,	 70h, 0FAh, 0C0h, 0FEh,	 10h, 0FDh,    8, 0F9h,	0A4h, 0FCh,    5,  37h,	 37h,  34h
		db   34h,  39h,	 39h,  34h,  34h,  35h,	 35h,  32h,  32h,  30h,	 30h,  2Fh,  2Fh,  37h,	 37h,  3Ah
		db   3Ah,  39h,	 39h,  34h,  34h,  35h,	 35h,  39h,  39h,  37h,	 37h,  32h,  32h, 0F9h,	 20h, 0F0h
		db   78h, 0FAh,	 40h, 0FEh,  1Ah, 0FDh,	   8, 0FCh,    1, 0AFh,	 0Ch,  30h, 0B2h,  1Eh,	0F0h,  8Ah
		db  0B1h,  0Ch,	 32h, 0B4h,  18h, 0FDh,	   9,  38h,  39h,  34h,	0B7h,  24h, 0B5h,  0Ch,	0B5h,  3Ch
		db  0F0h,  0Ch,	0BBh,  18h,  3Ch,  37h,	0BAh,  24h, 0B9h,  0Ch,	0B9h,  3Ch, 0F0h,  0Ch,	0B1h,  18h
		db   32h,  2Dh,	0B4h,  24h, 0B2h,  0Ch,	0B5h,  12h, 0F0h,    6,	0B4h,  18h, 0B7h,  24h,	0B5h,  0Ch
		db  0B9h,  12h,	0F0h,	 6, 0B8h,  18h,	0BBh,  24h, 0B9h,  0Ch,	0BCh,  24h, 0F0h,  0Ch,	0B0h,  24h
		db  0B2h,  0Ch,	0B4h,  3Ch, 0F0h,  0Ch,	 34h,  35h, 0B2h,  3Ch,	0F0h,  0Ch,  2Bh,  70h,	0B5h,  3Ch
		db  0F0h,  0Ch,	 35h,  37h, 0B4h,  3Ch,	0F0h,  0Ch,  30h,  70h,	0B7h,  3Ch, 0F0h,  0Ch,	 37h,  39h
		db  0B5h,  18h,	0F0h,  0Ch,  3Ch, 0BCh,	 24h, 0B5h,  0Ch, 0B4h,	 3Ch, 0F0h,  0Ch,  34h,	 34h, 0B5h
		db   18h, 0B4h,	 30h, 0B2h,  18h, 0F8h,	0A1h
MUSIC_24_YM6:	db  0FFh,    0,	   0	; DATA XREF: ROM:938Ao
MUSIC_24_PSG1:	db  0FCh,    1,	0FBh,  4Ch, 0F8h,    0,	0FDh,	 0, 0F8h, 0C5h,	0F0h, 0C0h, 0F8h, 0E0h,	0FCh,	 3
					; DATA XREF: ROM:938Co
		db  0FDh,  7Ah,	0F8h, 0C7h, 0A1h,  0Ch,	 24h, 0F8h, 0E0h, 0F8h,	0C3h, 0A3h,  0Ch,  26h,	0F8h, 0E0h
		db  0A3h,  0Ch,	0FCh,	 0, 0FDh,  7Ch,	 37h,  35h,  32h,  30h,	 2Fh,  2Dh,  2Fh, 0FCh,	   3, 0FDh
		db   7Ah, 0F8h,	0C3h, 0A8h,  0Ch,  2Bh,	0F8h, 0E0h, 0F8h, 0C3h,	0A9h,  0Ch,  2Bh, 0F8h,	0E0h, 0F8h
		db  0C3h, 0ABh,	 0Ch,  30h, 0F8h, 0E0h,	0F8h, 0C3h, 0A9h,  0Ch,	 2Dh, 0F8h, 0E0h, 0FDh,	 0Ah, 0AFh
		db     6,  70h,	0FDh,	 0, 0F0h,  24h,	0FDh,  0Ah, 0ADh,    6,	 70h, 0FDh,    0, 0F0h,	 24h, 0FDh
		db   7Ah, 0ADh,	   6,  70h, 0FDh,    0,	0F0h,  24h, 0FDh,  7Ah,	0ABh,	 6,  70h, 0FDh,	   0, 0F0h
		db   24h, 0FDh,	 7Ah, 0AEh,    6,  70h,	0FDh,	 0, 0F0h,  24h,	0FDh,  7Ah, 0ADh,    6,	 70h, 0FDh
		db     0, 0F0h,	 24h, 0FDh,  7Ah, 0ADh,	   6,  70h, 0FDh,    0,	0F0h,  24h, 0FDh,  7Ah,	0AFh,  30h
		db  0F8h, 0C3h,	 9Dh,  0Ch,  21h, 0F8h,	0E0h, 0F8h, 0C7h,  9Fh,	 0Ch,  23h, 0F8h, 0E0h,	0F8h, 0C1h
		db  0A2h,  0Ch,	 25h, 0F8h, 0E0h, 0F8h,	0C1h, 0A1h,  0Ch,  25h,	0F8h, 0E0h, 0FCh,    0,	0FDh,  7Ch
		db  0A6h,  0Ch,	 29h,  2Dh,  31h,  32h,	 35h,  32h,  2Dh,  2Bh,	 2Fh,  32h,  35h,  38h,	 37h,  35h
		db   32h,  28h,	 2Bh,  2Fh,  30h,  34h,	 37h,  34h,  30h,  2Dh,	 31h,  34h,  37h,  3Ah,	 39h,  37h
		db   34h, 0FDh,	   0, 0F8h, 0C5h, 0F0h,	0C0h, 0F8h, 0E0h, 0F8h,	0A1h
MUSIC_24_PSG2:	db  0FCh,    1,	0FBh,  4Ch, 0F8h,    0,	0FDh,	 0, 0F8h, 0C5h,	0F0h, 0C0h, 0F8h, 0E0h,	0FCh,	 3
					; DATA XREF: ROM:938Eo
		db  0FDh,  7Ah,	0F8h, 0C7h,  9Dh,  0Ch,	 21h, 0F8h, 0E0h, 0F8h,	0C3h,  9Fh,  0Ch,  1Dh,	0F8h, 0E0h
		db   9Fh,  0Ch,	0FCh,	 0, 0FDh,  7Ch,	 2Fh,  2Bh,  29h,  28h,	 26h,  24h,  26h, 0FCh,	   3, 0FDh
		db   7Ah, 0F8h,	0C3h, 0A4h,  0Ch,  28h,	0F8h, 0E0h, 0F8h, 0C3h,	0A6h,  0Ch,  29h, 0F8h,	0E0h, 0F8h
		db  0C3h, 0A4h,	 0Ch,  2Bh, 0F8h, 0E0h,	0F8h, 0C3h, 0A4h,  0Ch,	 29h, 0F8h, 0E0h, 0F8h,	 20h, 0FDh
		db   7Ah, 0ABh,	   6,  70h, 0FDh,    0,	0F0h,  24h, 0FDh,  7Ah,	0A8h,	 6,  70h, 0FDh,	   0, 0F0h
		db   24h, 0FDh,	 7Ah, 0A9h,    6,  70h,	0FDh,	 0, 0F0h,  24h,	0F8h,  40h, 0FDh,  7Ah,	0A6h,	 6
		db   70h, 0FDh,	   0, 0F0h,  24h, 0F8h,	0A0h, 0F8h,  60h, 0FDh,	 7Ah, 0ABh,  30h, 0FDh,	   0, 0F8h
		db  0C9h, 0F0h,	0C0h, 0F8h, 0E0h, 0F8h,	0A1h
MUSIC_24_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:9390o	ROM:9392o
MUSIC_25:	db 0			; DATA XREF: ROM:8000o
		db 0
		db 0
		db 171
		dw MUSIC_25_YM1
		dw MUSIC_25_YM2
		dw MUSIC_25_YM3
		dw MUSIC_25_YM4
		dw MUSIC_25_YM5
		dw MUSIC_25_YM6
		dw MUSIC_25_PSG1
		dw MUSIC_25_PSG2
		dw MUSIC_25_PSG3
		dw MUSIC_25_PSG3
MUSIC_25_YM1:	db  0FEh,    5,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	0ABh,	 6,  70h, 0B0h,	 24h, 0AFh
					; DATA XREF: ROM:99B1o
		db     6,  2Dh,	 2Fh,  30h,  32h,  70h,	0ABh,  30h, 0F0h,  12h,	0B7h,	 6, 0B5h,  12h,	0B4h,	 6
		db  0B2h,  12h,	0B0h,	 6, 0AFh,    3,	 30h,  2Fh,  2Dh, 0AFh,	   6,  32h, 0B9h,  18h,	 37h, 0F0h
		db   12h, 0B4h,	   6, 0B7h,  0Ch, 0B5h,	 12h, 0B4h,    6,  35h,	 37h,  35h,  34h,  32h,	 70h, 0B5h
		db   0Ch, 0B4h,	 12h, 0B3h,    6,  34h,	 38h,  39h,  3Bh,  3Ch,	 70h,  30h,  2Fh,  30h,	 35h, 0ADh
		db   30h, 0AFh,	   6,  2Eh,  2Fh,  32h,	0ACh,  18h, 0F0h,  0Ch,	0A8h,	 6,  70h, 0ADh,	 24h, 0ACh
		db     6,  2Dh,	 2Fh,  70h,  28h,  70h,	0B4h,  24h, 0B2h,    6,	 34h,  35h,  70h,  2Fh,	 70h,  30h
		db   2Fh,  30h,	 34h, 0B9h,  12h, 0B7h,	   6, 0B5h,  12h, 0B2h,	   6,  2Fh,  2Eh,  2Fh,	 32h, 0B7h
		db   12h, 0B5h,	   6, 0B4h,  12h, 0B0h,	   6,  2Dh,  2Ch,  2Dh,	 30h, 0B5h,  12h, 0B4h,	   6,  32h
		db   34h,  35h,	 70h, 0B4h,  48h, 0FCh,	   6, 0A5h,  0Ch,  25h,	 25h,  26h,  28h,  26h,	0FCh,	 1
		db  0A5h,    6,	 39h,  38h,  39h,  33h,	 34h,  30h,  31h,  2Ch,	 2Dh,  27h,  28h, 0FCh,	   6, 0AAh
		db   0Ch,  2Ah,	 2Ah,  2Bh,  2Dh,  2Bh,	0FCh,	 1, 0AAh,    6,	 3Eh,  3Dh,  3Eh,  38h,	 39h,  35h
		db   36h,  31h,	0B2h,  0Ch, 0B0h,    6,	 2Fh,  70h, 0B7h,  18h,	0B7h,	 6,  36h,  34h,	 36h,  37h
		db   70h, 0AFh,	 18h, 0ADh,    3,  2Fh,	0ADh,  1Eh, 0ABh,    6,	 2Ah, 0ABh,  30h, 0F0h,	 0Ch, 0F8h
		db  0A1h
MUSIC_25_YM2:	db  0F0h,  84h,	0FEh,	 5, 0FDh,  0Ah,	0FCh,	 1, 0FBh,  2Ch,	0F8h,	 0, 0F0h,    6,	 25h,  26h
					; DATA XREF: ROM:99B3o
		db   28h,  70h,	 26h,  2Dh,  26h,  70h,	 26h,  2Dh,  26h, 0ABh,	 18h, 0AEh,    6,  70h,	 22h,  24h
		db   26h,  28h,	 29h,  2Ah, 0ABh,  18h,	0A4h,	 6,  70h,  24h,	 26h, 0A4h,    3,  26h,	0A4h,  18h
		db  0F0h,    6,	 24h,  70h,  24h,  70h,	 24h,  26h, 0A4h,    3,	 26h, 0A4h,  18h, 0F0h,	   6,  28h
		db   70h, 0A9h,	 1Eh, 0F0h,    6,  29h,	 28h,  26h,  24h,  23h,	 21h, 0A0h,  18h, 0A3h,	 0Ch, 0A6h
		db     6,  24h,	0A3h,  0Ch,  70h, 0F0h,	 24h, 0A1h,  18h, 0A0h,	 0Ch, 0A1h,  18h, 0F0h,	 0Ch,  28h
		db   26h,  29h,	0FCh,	 6,  28h,  21h,	 28h,  21h,  26h,  21h,	 26h,  1Fh,  26h,  1Fh,	 24h,  1Fh
		db   24h,  1Dh,	 24h,  1Dh,  21h,  26h,	 70h, 0FCh,    1, 0ACh,	   6,  2Ah, 0ACh,  1Eh,	0AAh,	 6
		db   28h,  26h,	0FCh,	 2,  21h,  1Ch,	 21h,  1Ch,  21h,  1Ch,	 21h,  1Ch,  21h,  1Ch,	 21h,  1Ch
		db  0A1h,    7,	0F0h,	 5, 0FCh,    8,	0B4h,  0Ch,  31h,  2Dh,	 28h, 0FCh,    1,  25h,	0FCh,	 2
		db  0A6h,    6,	 21h,  26h,  21h,  26h,	 21h,  26h,  21h,  26h,	 21h,  26h,  21h, 0A6h,	   7, 0F0h
		db     5, 0FCh,	   8, 0B9h,  0Ch,  36h,	 32h,  2Dh, 0FCh,    1,	 2Ah, 0FCh,    6, 0ABh,	 18h,  2Bh
		db   2Bh, 0FCh,	   1, 0ABh,  1Eh, 0F0h,	   6,  26h,  70h, 0A4h,	 18h, 0A4h,    6,  70h,	 21h,  70h
		db  0A3h,    3,	 24h, 0A3h,  18h, 0F0h,	 12h, 0F0h,  0Ch, 0FDh,	 0Bh, 0A8h,    6,  29h,	0FCh,	 6
		db  0ABh,  0Ch,	 24h,  26h,  23h, 0FCh,	   1, 0FDh,  0Ah, 0A4h,	 30h, 0F8h, 0A1h
MUSIC_25_YM3:	db  0F0h,  0Ch,	0F8h,	 0, 0F0h,  0Ch,	0FEh,	 5, 0FDh,  0Bh,	0FCh,	 1, 0FBh,  2Ch,	 98h,	 6
					; DATA XREF: ROM:99B5o
		db   70h,  9Ch,	 18h,  9Dh,  24h,  9Ch,	   6,  1Ah,  1Ch,  1Dh,	 1Fh,  70h,  16h,  70h,	 15h,  70h
		db   9Ah,  11h,	0F0h,	 7,  9Dh,  11h,	0F0h,	 7,  9Fh,    6,	 70h,  1Dh,  70h,  9Ch,	 18h, 0F0h
		db   0Ch,  98h,	 18h,  96h,  0Ch,  95h,	 18h, 0F0h,  0Ch,  95h,	   6,  70h,  94h,  12h,	0F0h,	 6
		db   93h,  18h,	0F0h,  0Ch,  93h,    6,	 70h,  92h,  18h,  93h,	 1Eh, 0F0h,    6,  1Ah,	 70h,  1Fh
		db   70h,  1Dh,	 70h,  9Ch,  1Eh, 0F0h,	   6,  17h,  70h,  90h,	 0Ch,  70h,  70h,  95h,	   6,  70h
		db   98h,  11h,	0F0h,	 7,  9Ah,  24h,	0F0h,	 0,  98h,    6,	 17h,  18h,  70h,  15h,	 70h,  94h
		db   18h, 0FCh,	   7,  15h,  18h,  1Ah,	 13h,  17h,  18h,  11h,	 15h, 0FCh,    1,  17h,	0F0h,  24h
		db   9Ch,    6,	 1Bh,  1Ch,  70h,  10h,	 70h, 0FCh,    6,  95h,	 0Ch,  15h,  15h,  17h,	 19h,  17h
		db   15h, 0FCh,	   8,  31h,  2Dh,  28h,	 25h, 0FCh,    1,  15h,	0FCh,	 6,  1Ah,  1Ah,	 1Ah,  1Ch
		db   1Eh,  1Ch,	 1Ah, 0FCh,    8,  36h,	 32h,  2Dh,  2Ah, 0FCh,	   1,  1Ah,  93h,  14h,	0F0h,	 4
		db   97h,  14h,	0F0h,	 4,  98h,    6,	 70h,  1Ch,  70h,  9Ah,	 30h,  9Ah,  18h,  9Fh,	 1Eh, 0F0h
		db     6,  1Ah,	 70h,  93h,  0Ch,  70h,	0F8h, 0A1h
MUSIC_25_YM4:	db  0FAh,  40h,	0F0h,	 3, 0F9h,  10h,	0FEh,	 5, 0FDh,  0Ah,	0FCh,	 1, 0FBh,  2Ch,	0F8h,	 0
					; DATA XREF: ROM:99B7o
		db  0ABh,    6,	 70h, 0B0h,  24h, 0AFh,	   6,  2Dh,  2Fh,  30h,	 32h,  70h, 0ABh,  30h,	0F0h,  12h
		db  0B7h,    6,	0B5h,  12h, 0B4h,    6,	0B2h,  12h, 0B0h,    6,	0AFh,	 3,  30h,  2Fh,	 2Dh, 0AFh
		db     6,  32h,	0B9h,  18h,  37h, 0F0h,	 12h, 0B4h,    6, 0B7h,	 0Ch, 0B5h,  12h, 0B4h,	   6,  35h
		db   37h,  35h,	 34h,  32h,  70h, 0B5h,	 0Ch, 0B4h,  12h, 0B3h,	   6,  34h,  38h,  39h,	 3Bh,  3Ch
		db   70h,  30h,	 2Fh,  30h,  35h, 0ADh,	 30h, 0AFh,    6,  2Eh,	 2Fh,  32h, 0ACh,  18h,	0F0h,  0Ch
		db  0A8h,    6,	 70h, 0ADh,  24h, 0ACh,	   6,  2Dh,  2Fh,  70h,	 28h,  70h, 0B4h,  24h,	0B2h,	 6
		db   34h,  35h,	 70h,  2Fh,  70h,  30h,	 2Fh,  30h,  34h, 0B9h,	 12h, 0B7h,    6, 0B5h,	 12h, 0B2h
		db     6,  2Fh,	 2Eh,  2Fh,  32h, 0B7h,	 12h, 0B5h,    6, 0B4h,	 12h, 0B0h,    6,  2Dh,	 2Ch,  2Dh
		db   30h, 0B5h,	 12h, 0B4h,    6,  32h,	 34h,  35h,  70h, 0B4h,	 48h, 0FCh,    6, 0A5h,	 0Ch,  25h
		db   25h,  26h,	 28h,  26h, 0FCh,    1,	0A5h,	 6,  39h,  38h,	 39h,  33h,  34h,  30h,	 31h,  2Ch
		db   2Dh,  27h,	 28h, 0FCh,    6, 0AAh,	 0Ch,  2Ah,  2Ah,  2Bh,	 2Dh,  2Bh, 0FCh,    1,	0AAh,	 6
		db   3Eh,  3Dh,	 3Eh,  38h,  39h,  35h,	 36h,  31h, 0B2h,  0Ch,	0B0h,	 6,  2Fh,  70h,	0B7h,  18h
		db  0B7h,    6,	 36h,  34h,  36h,  37h,	 70h, 0AFh,  18h, 0ADh,	   3,  2Fh, 0ADh,  1Eh,	0ABh,	 6
		db   2Ah, 0ABh,	 30h, 0F0h,  0Ch, 0F8h,	0A1h
MUSIC_25_YM5:	db  0FAh,  80h,	0F0h,  87h, 0F9h,  10h,	0FEh,	 5, 0FDh,    8,	0FCh,	 1, 0FBh,  2Ch,	0F8h,	 0
					; DATA XREF: ROM:99B9o
		db  0F0h,    6,	 25h,  26h,  28h,  70h,	 26h,  2Dh,  26h,  70h,	 26h,  2Dh,  26h, 0ABh,	 18h, 0AEh
		db     6,  70h,	 22h,  24h,  26h,  28h,	 29h,  2Ah, 0ABh,  18h,	0A4h,	 6,  70h,  24h,	 26h, 0A4h
		db     3,  26h,	0A4h,  18h, 0F0h,    6,	 24h,  70h,  24h,  70h,	 24h,  26h, 0A4h,    3,	 26h, 0A4h
		db   18h, 0F0h,	   6,  28h,  70h, 0A9h,	 1Eh, 0F0h,    6,  29h,	 28h,  26h,  24h,  23h,	 21h, 0A0h
		db   18h, 0A3h,	 0Ch, 0A6h,    6,  24h,	0A3h,  0Ch,  70h, 0F0h,	 24h, 0A1h,  18h, 0A0h,	 0Ch, 0A1h
		db   18h, 0F0h,	 0Ch,  28h,  26h,  29h,	0FCh,	 6,  28h,  21h,	 28h,  21h,  26h,  21h,	 26h,  1Fh
		db   26h,  1Fh,	 24h,  1Fh,  24h,  1Dh,	 24h,  1Dh,  21h,  26h,	 70h, 0FCh,    1, 0ACh,	   6,  2Ah
		db  0ACh,  1Eh,	0AAh,	 6,  28h,  26h,	0FCh,	 2,  21h,  1Ch,	 21h,  1Ch,  21h,  1Ch,	 21h,  1Ch
		db   21h,  1Ch,	 21h,  1Ch, 0A1h,    7,	0F0h,	 5, 0FCh,    8,	0B4h,  0Ch,  31h,  2Dh,	 28h, 0FCh
		db     1,  25h,	0FCh,	 2, 0A6h,    6,	 21h,  26h,  21h,  26h,	 21h,  26h,  21h,  26h,	 21h,  26h
		db   21h, 0A6h,	   7, 0F0h,    5, 0FCh,	   8, 0B9h,  0Ch,  36h,	 32h,  2Dh, 0FCh,    1,	 2Ah, 0FCh
		db     6, 0ABh,	 18h,  2Bh,  2Bh, 0FCh,	   1, 0ABh,  1Eh, 0F0h,	   6,  26h,  70h, 0A4h,	 18h, 0A4h
		db     6,  70h,	 21h,  70h, 0A3h,    3,	 24h, 0A3h,  18h, 0F0h,	 12h, 0F0h,  0Ch, 0FDh,	   9, 0A8h
		db     6,  29h,	0FCh,	 6, 0ABh,  0Ch,	 24h,  26h,  23h, 0FCh,	   1, 0FDh,    8, 0A4h,	 30h, 0F8h
		db  0A1h
MUSIC_25_YM6:	db  0FFh,    0,	   0	; DATA XREF: ROM:99BBo
MUSIC_25_PSG1:	db  0FFh,    0,	   0	; DATA XREF: ROM:99BDo
MUSIC_25_PSG2:	db  0FFh,    0,	   0	; DATA XREF: ROM:99BFo
MUSIC_25_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:99C1o	ROM:99C3o
MUSIC_26:	db 0			; DATA XREF: ROM:8000o
		db 0
		db 0
		db 206
		dw MUSIC_26_YM1
		dw MUSIC_26_YM2
		dw MUSIC_26_YM3
		dw MUSIC_26_YM4
		dw MUSIC_26_YM5
		dw MUSIC_26_YM6
		dw MUSIC_26_PSG1
		dw MUSIC_26_PSG2
		dw MUSIC_26_PSG3
		dw MUSIC_26_PSG3
MUSIC_26_YM1:	db  0F0h,  30h,	0FEh,  2Ah, 0FDh,  0Ah,	0FCh,	 1, 0FBh,  2Ch,	0A3h,  0Ah, 0A8h,    8,	0A5h,  38h
					; DATA XREF: ROM:9E43o
		db  0F0h,  2Ah,	0A6h,	 8,  2Bh, 0A8h,	 34h, 0F0h,  28h, 0FDh,	 0Bh, 0A9h,    8,  2Eh,	0ABh,  32h
		db  0F0h,  26h,	0ACh,	 8,  31h, 0AEh,	 36h, 0F8h,    0, 0FBh,	 4Ch, 0FEh,  11h, 0FDh,	 0Bh, 0B3h
		db   30h,  2Ch,	0B6h,  9Ch, 0B3h,  0Ch,	 31h,  33h,  2Fh,  31h,	 2Eh,  2Fh, 0ACh,  10h,	 2Ah,  2Ch
		db  0AEh,  48h,	0ACh,  18h, 0FCh,  80h,	0AEh,  90h, 0FBh,  40h,	0FCh,	 1,  2Eh, 0FBh,	 4Ch, 0ACh
		db   30h,  27h,	0B1h,  9Ch, 0AFh,  0Ch,	 2Eh,  2Fh,  2Ch,  2Eh,	 2Ah,  2Ch, 0A8h,  10h,	 2Ah,  2Ch
		db  0AEh,  48h,	0B3h,  18h, 0FCh,  80h,	0B3h,  90h, 0FBh,  40h,	0FCh,	 1,  33h, 0F0h,	 78h, 0FDh
		db   0Ah, 0FBh,	 4Ch, 0B3h,  24h,  2Ch,	0B6h,  78h, 0F0h, 0C0h,	0A9h,  18h,  2Ah,  2Ch,	0AEh,  22h
		db  0B3h,  20h,	0B6h,  1Eh, 0B5h,  22h,	0B1h,  20h, 0AEh,  1Eh,	0FDh,  0Bh, 0ACh,  30h,	 27h, 0B1h
		db   9Ch, 0AFh,	 0Ch,  2Eh,  2Fh,  2Ch,	 2Eh,  2Ah,  2Ch, 0A8h,	 10h,  2Ah,  2Ch, 0AEh,	 48h, 0B3h
		db   18h, 0B3h,	 60h,  33h,  31h, 0FBh,	 2Ch, 0FEh,  35h, 0FDh,	 0Bh, 0A7h,  18h,  28h,	0FDh,  0Ch
		db   2Ch,  2Dh,	0FDh,  0Dh,  31h,  33h,	0B4h,  30h, 0FEh,  0Dh,	0FDh,  0Bh, 0A7h,  48h,	0ACh,  18h
		db  0FCh,  0Ch,	 2Ah,  27h,  2Ah,  2Ch,	0FCh,	 1, 0B1h,  30h,	 2Eh, 0ACh,  48h, 0AEh,	 0Ch,  70h
		db  0AEh,  48h,	0B3h,  18h, 0FCh,  0Ch,	 31h,  2Eh,  31h,  33h,	0FCh,	 1, 0B6h,  30h,	 33h, 0FDh
		db   0Ah, 0B1h,	 60h, 0FEh,  1Ah, 0FDh,	 0Bh, 0A5h,  18h, 0A7h,	   8, 0A8h,  0Ch, 0F0h,	   4, 0A8h
		db   30h, 0A8h,	 18h, 0AAh,    8, 0ABh,	 0Ch, 0F0h,    4, 0ABh,	 30h, 0ABh,  18h, 0ADh,	   8, 0AEh
		db   0Ch, 0F0h,	   4, 0AEh,  30h, 0A6h,	 18h, 0A8h,    8, 0A9h,	 0Ch, 0F0h,    4, 0A9h,	 30h, 0A9h
		db   18h, 0ABh,	   8, 0ACh,  0Ch, 0F0h,	   4, 0ACh,  30h, 0ACh,	 18h, 0AEh,    8, 0B0h,	 0Ch, 0F0h
		db     4, 0B0h,	 30h, 0B1h,  48h, 0AFh,	 0Ch,  31h, 0B1h,  60h,	0F8h, 0A1h
MUSIC_26_YM2:	db  0F0h,  24h,	0FEh,  2Ah, 0FDh,  0Ah,	0FCh,	 1, 0FBh,  2Ch,	0A0h,  56h, 0F0h,  20h,	0A3h,  4Eh
					; DATA XREF: ROM:9E45o
		db  0F0h,  1Eh,	0FDh,  0Bh, 0A6h,  4Ch,	0F0h,  1Ch, 0A9h,  50h,	0F8h,	 0, 0FEh,  10h,	0FDh,  0Bh
		db  0F0h,  7Ch,	0FCh,  80h, 0B1h,    4,	0FCh,	 1, 0B3h,  20h,	 2Ch, 0B6h,  78h, 0F0h,	 48h, 0F0h
		db  0A8h, 0A9h,	   8,  2Ah,  2Ch, 0AEh,	 48h, 0ACh,  0Ch,  2Eh,	0A7h,  60h, 0F0h,  74h,	0FCh,  80h
		db  0AAh,    4,	0FCh,	 1, 0ACh,  24h,	0A7h,  0Ch, 0A5h,    8,	 27h,  2Ch, 0B1h,  0Ah,	0B3h,	 8
		db  0B1h,    6,	 33h,  31h,  33h, 0B1h,	 36h, 0F0h,  60h, 0F0h,	0A8h, 0A9h,    8,  2Ah,	 2Ch, 0AEh
		db   48h, 0B3h,	 0Ch,  31h, 0B3h,  3Ch,	0FDh,  0Ch, 0A7h,  0Ch,	0ACh,	 8,  2Eh,  31h,	0B3h,  30h
		db   2Ch, 0B6h,	 0Ch, 0B8h,  0Ah, 0B6h,	   8, 0B8h,    6,  36h,	 38h, 0B6h,  20h, 0B1h,	   8,  36h
		db  0B3h,  30h,	0F0h,  0Ch,  33h,  31h,	 33h,  2Fh,  31h,  2Eh,	 2Fh, 0ACh,  10h,  2Ah,	 2Ch, 0AEh
		db   48h, 0ACh,	 0Ch,  2Eh, 0FCh,  80h,	0AEh,  90h, 0FBh,  20h,	0FCh,	 1,  2Eh, 0F0h,	 70h, 0FDh
		db   0Bh, 0FBh,	 2Ch, 0ACh,  10h,  27h,	0B1h,  1Eh, 0AFh,  0Ah,	0AEh,	 8, 0ACh, 0C0h,	0F0h,  18h
		db  0A3h,    8,	 27h,  2Ah, 0AEh,  18h,	 2Ah, 0ACh,  0Ah, 0AEh,	   8,  2Ch, 0AEh,    6,	0ACh,	 8
		db   2Eh, 0ACh,	 18h, 0AAh,  28h, 0A8h,	 10h,  2Ch, 0ADh,  0Ch,	 31h,  34h,  38h, 0B8h,	 18h, 0B6h
		db   48h, 0FEh,	 35h, 0FDh,    9,  99h,	 30h, 0FDh,  0Ah,  1Ch,	0FDh,  0Bh,  21h, 0FDh,	 0Ch,  25h
		db  0FEh,  0Dh,	0FDh,  0Ah, 0A2h,  48h,	0A7h,  18h, 0FCh,  0Ch,	 27h,  25h,  27h,  27h,	0FCh,	 1
		db  0ACh,  30h,	 2Ch, 0A9h,  48h, 0A9h,	 0Ch,  70h, 0A9h,  48h,	0AEh,  18h, 0FCh,  0Ch,	 2Eh,  2Ch
		db   2Eh,  2Eh,	0FCh,	 1, 0B3h,  30h,	 31h, 0FDh,    9, 0ACh,	 60h, 0FEh,  1Ah, 0FDh,	 0Bh, 0A1h
		db   18h, 0A3h,	   8, 0A5h,  0Ch, 0F0h,	   4, 0A5h,  30h, 0A4h,	 18h, 0A6h,    8, 0A8h,	 0Ch, 0F0h
		db     4, 0A8h,	 30h, 0A7h,  18h, 0A9h,	   8, 0ABh,  0Ch, 0F0h,	   4, 0ABh,  30h, 0A2h,	 18h, 0A4h
		db     8, 0A6h,	 0Ch, 0F0h,    4, 0A6h,	 30h, 0A5h,  18h, 0A7h,	   8, 0A9h,  0Ch, 0F0h,	   4, 0A9h
		db   30h, 0A9h,	 18h, 0AAh,    8, 0ACh,	 0Ch, 0F0h,    4, 0ACh,	 30h, 0FDh,  0Ah, 0ACh,	 60h, 0FDh
		db     9,  2Ch,	0F8h, 0A1h
MUSIC_26_YM3:	db  0F0h,  14h,	0FEh,  2Ah, 0FDh,  0Ah,	0FCh,	 1, 0FBh,  2Ch,	 9Dh,  66h, 0F0h,  12h,	0A0h,  5Ch
					; DATA XREF: ROM:9E47o
		db  0F0h,  10h,	0FDh,  0Bh, 0A3h,  5Ah,	0F0h,  10h, 0A6h,  5Ch,	0F8h,	 0, 0F0h,    6,	0FAh,  80h
		db  0F9h,  20h,	0FEh,  10h, 0FDh,    9,	0F0h,  7Ch, 0FCh,  80h,	0B1h,	 4, 0FCh,    1,	0B3h,  20h
		db   2Ch, 0B6h,	 78h, 0F0h,  48h, 0F0h,	0A8h, 0A9h,    8,  2Ah,	0ACh,	 2, 0F9h,    0,	0FAh, 0C0h
		db  0FDh,  0Ah,	0AAh,  48h, 0A9h,  0Ch,	 2Ah, 0A2h,  30h,  23h,	0F0h,  7Ah, 0F9h,  20h,	0FAh,  80h
		db  0FDh,    9,	0FCh,  80h, 0AAh,    4,	0FCh,	 1, 0ACh,  24h,	0A7h,  0Ch, 0A5h,    8,	 27h,  2Ch
		db  0B1h,  0Ah,	0B3h,	 8, 0B1h,    6,	 33h,  31h,  33h, 0B1h,	 36h, 0F0h,  60h, 0F0h,	0A8h, 0A9h
		db     8,  2Ah,	 2Ch, 0AEh,  48h, 0B3h,	 0Ch,  31h, 0B3h,  3Ch,	0FDh,  0Ah, 0A7h,  0Ch,	0ACh,	 8
		db   2Eh,  31h,	0B3h,  30h,  2Ch, 0B6h,	 0Ch, 0B8h,  0Ah, 0B6h,	   8, 0B8h,    6,  36h,	 38h, 0B6h
		db   20h, 0B1h,	   8,  36h, 0B3h,  30h,	0F0h,  0Ch,  33h,  31h,	 33h,  2Fh,  31h,  2Eh,	 2Fh, 0ACh
		db   10h,  2Ah,	 2Ch, 0AEh,  48h, 0ACh,	 0Ch,  2Eh, 0FCh,  80h,	0AEh,  90h, 0FBh,  20h,	0FCh,	 1
		db   2Eh, 0F0h,	 70h, 0FDh,    9, 0FBh,	 2Ch, 0ACh,  10h,  27h,	0B1h,  1Eh, 0AFh,  0Ah,	0AEh,	 8
		db  0ACh, 0C0h,	0F0h,  18h, 0A3h,    8,	 27h,  2Ah, 0AEh,  18h,	 2Ah, 0ACh,  0Ah, 0AEh,	   8,  2Ch
		db  0AEh,    6,	0ACh,	 8,  2Eh, 0ACh,	 18h, 0AAh,  28h, 0A8h,	 10h,  2Ch, 0ADh,  0Ch,	 31h,  34h
		db   38h, 0B8h,	 18h, 0B6h,  42h, 0F9h,	   0, 0FAh, 0C0h, 0FEh,	 35h, 0FDh,    9, 0A1h,	 30h, 0FDh
		db   0Ah,  27h,	0FDh,  0Bh,  2Ch, 0FDh,	 0Ch, 0AFh,  18h,  2Dh,	0FEh,  0Dh, 0FDh,  0Ah,	0A0h,  48h
		db  0A5h,  18h,	0FCh,  0Ch,  25h,  20h,	 25h,  25h, 0FCh,    1,	0AAh,  30h,  2Ah, 0A7h,	 48h, 0A7h
		db   0Ch,  70h,	0A7h,  48h, 0ACh,  18h,	0FCh,  0Ch,  2Ch,  27h,	 2Ch,  2Ch, 0FCh,    1,	0B1h,  30h
		db   2Ch,  2Ah,	0FDh,	 9,  28h, 0FEh,	 1Ah, 0FDh,  0Ah,  70h,	 21h,  70h,  24h,  70h,	 27h,  70h
		db   22h,  70h,	 25h,  70h,  29h, 0A8h,	 60h, 0FDh,    9,  28h,	0F8h, 0A1h
MUSIC_26_YM4:	db  0FEh,  22h,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch,  8Eh,  7Ah,	 91h,  6Eh, 0FDh,  0Bh,	 94h,  6Ah
					; DATA XREF: ROM:9E49o
		db   97h,  6Ch,	0F8h,	 0,  90h, 0C0h,	 10h,	 8,  88h,  60h,	 8Fh,	 0, 0FCh,  8Fh,	 94h,  24h
		db  0FCh, 0FFh,	 0Fh,  88h,  18h,  89h,	0C0h,	 9,  0Bh,  8Bh,	 60h, 0F0h,  18h,  92h,	 0Ch,  70h
		db  0FCh,  80h,	 97h,	 0, 0FCh,  8Bh,	 98h,	 7,  17h,  18h,	0FCh,	 1,  97h,  1Bh,	0FCh,  92h
		db   9Ch,  60h,	0F0h,  18h, 0FCh, 0FFh,	 17h,  16h,  14h,  90h,	 90h, 0F0h,  18h,  10h,	 88h,  90h
		db   8Fh,  30h,	 94h,  60h, 0F0h,  18h,	 88h,  30h,  88h,  18h,	 89h, 0C0h,    9,  8Bh,	 60h,  10h
		db   95h,  90h,	 90h,  30h,    9,  95h,	 10h,  14h,  12h, 0FDh,	 0Ch,  90h,  18h,  0Dh,	 89h,  10h
		db     8,    6,	0F0h,  18h,  88h,    8,	   8,	 8,  88h,  30h,	0FDh,  0Bh,  8Ah,  60h,	 0Bh,  0Dh
		db  0F0h,  18h,	0FDh,  0Ch,  8Fh,    8,	 0Fh,  0Fh,  8Fh,  30h,	0FDh,  0Bh,  91h,  60h,	 10h,	 9
		db   95h,  30h,	0F0h,  10h,  15h,  14h,	 93h,  30h, 0F0h,  10h,	 13h,  12h,  91h,  30h,	0F0h,  10h
		db   0Ah,  11h,	 93h,  30h, 0F0h,  10h,	 13h,  12h,  91h,  30h,	0F0h,  10h,  11h,  10h,	 8Fh,  30h
		db  0F0h,  10h,	   8,  0Fh,  8Eh,  78h,	 95h,  18h,  14h,  12h,	0F8h, 0A1h
MUSIC_26_YM5:	db  0F9h,  10h,	0F0h,  38h, 0FEh,  38h,	0FDh,	 7, 0FCh,    1,	0FBh,  2Ch, 0FAh,  40h,	0A3h,  0Ah
					; DATA XREF: ROM:9E4Bo
		db  0A8h,    8,	0FAh,  80h, 0A5h,  38h,	0F0h,  2Ah, 0FDh,    8,	0FAh,  40h, 0A6h,    8,	 2Bh, 0FAh
		db   80h, 0A8h,	 34h, 0F0h,  28h, 0FDh,	   9, 0FAh,  40h, 0A9h,	   8,  2Eh, 0FAh,  80h,	0ABh,  32h
		db  0F0h,  26h,	0FDh,  0Ah, 0FAh,  40h,	0ACh,	 8,  31h, 0FAh,	 80h, 0AEh,  34h, 0F9h,	 10h, 0F8h
		db     0, 0FAh,	 40h, 0FBh,  4Ch, 0FEh,	 11h, 0FDh,    9, 0B3h,	 30h,  2Ch, 0B6h,  9Ch,	0B3h,  0Ch
		db   31h,  33h,	 2Fh,  31h,  2Eh,  2Fh,	0ACh,  10h,  2Ah,  2Ch,	0AEh,  48h, 0ACh,  18h,	0FCh,  80h
		db  0AEh,  90h,	0FBh,  40h, 0FCh,    1,	 2Eh, 0FBh,  4Ch, 0ACh,	 30h,  27h, 0B1h,  9Ch,	0AFh,  0Ch
		db   2Eh,  2Fh,	 2Ch,  2Eh,  2Ah,  2Ch,	0A8h,  10h,  2Ah,  2Ch,	0AEh,  48h, 0B3h,  18h,	0FCh,  80h
		db  0B3h,  90h,	0FBh,  40h, 0FCh,    1,	 33h, 0F0h,  78h, 0FDh,	   8, 0FBh,  4Ch, 0B3h,	 24h,  2Ch
		db  0B6h,  78h,	0F0h, 0C0h, 0A9h,  18h,	 2Ah,  2Ch, 0AEh,  22h,	0B3h,  20h, 0B6h,  1Eh,	0B5h,  22h
		db  0B1h,  20h,	0AEh,  1Eh, 0FDh,    9,	0ACh,  30h,  27h, 0B1h,	 9Ch, 0AFh,  0Ch,  2Eh,	 2Fh,  2Ch
		db   2Eh,  2Ah,	 2Ch, 0A8h,  10h,  2Ah,	 2Ch, 0AEh,  48h, 0B3h,	 18h, 0B3h,  60h,  33h,	 31h, 0FAh
		db   80h, 0FBh,	 2Ch, 0FEh,  35h, 0FDh,	   9, 0A7h,  18h,  28h,	0FDh,  0Ah,  2Ch,  2Dh,	0FDh,  0Bh
		db   31h,  33h,	0B4h,  30h, 0FAh,  40h,	0FEh,  0Dh, 0FDh,    9,	0A7h,  48h, 0ACh,  18h,	0FCh,  0Ch
		db   2Ah,  27h,	 2Ah,  2Ch, 0FCh,    1,	0B1h,  30h,  2Eh, 0ACh,	 48h, 0AEh,  0Ch,  70h,	0AEh,  48h
		db  0B3h,  18h,	0FCh,  0Ch,  31h,  2Eh,	 31h,  33h, 0FCh,    1,	0B6h,  30h,  33h, 0B1h,	 60h, 0FAh
		db   80h, 0FEh,	 1Ah, 0FDh,    9, 0A5h,	 18h, 0A7h,    8, 0A8h,	 0Ch, 0F0h,    4, 0A8h,	 30h, 0A8h
		db   18h, 0AAh,	   8, 0ABh,  0Ch, 0F0h,	   4, 0ABh,  30h, 0ABh,	 18h, 0ADh,    8, 0AEh,	 0Ch, 0F0h
		db     4, 0AEh,	 30h, 0A6h,  18h, 0A8h,	   8, 0A9h,  0Ch, 0F0h,	   4, 0A9h,  30h, 0A9h,	 18h, 0ABh
		db     8, 0ACh,	 0Ch, 0F0h,    4, 0ACh,	 30h, 0ACh,  18h, 0AEh,	   8, 0B0h,  0Ch, 0F0h,	   4, 0B0h
		db   30h, 0B1h,	 48h, 0AFh,  0Ch,  31h,	0B1h,  60h, 0F8h, 0A1h
MUSIC_26_YM6:	db  0F0h,  7Ah,	0F0h,  6Eh, 0F0h,  6Ah,	0F0h,  6Ch, 0F8h,    0,	0F8h, 0CFh, 0F0h, 0C0h,	0F8h, 0E0h
					; DATA XREF: ROM:9E4Do
		db  0F0h,  60h,	 8Ah,	 6, 0F8h, 0C9h,	 8Bh,	 4, 0F8h, 0E0h,	0F8h, 0C8h,  8Ah,    4,	0F8h, 0E0h
		db   89h,    4,	   9,  89h,    6, 0F8h,	 20h,  89h,  18h,  8Ah,	   8,  0Ah,  0Ah,  89h,	 48h,  89h
		db   30h,  89h,	 18h,  70h, 0F8h, 0C2h,	 8Ah,	 8, 0F8h, 0E0h,	 89h,  48h,  89h,  18h,	 89h,	 6
		db  0F8h, 0C3h,	 8Ah,	 4, 0F8h, 0E0h,	0F8h, 0C4h,  8Bh,    4,	0F8h, 0E0h,  8Bh,    6,	0F8h,  40h
		db  0F8h, 0A0h,	0F8h,  60h, 0F8h, 0C3h,	0F0h, 0C0h, 0F8h, 0E0h,	0F8h, 0A1h
MUSIC_26_PSG1:	db  0FDh,    0,	0FCh,	 1, 0FBh,  4Ch,	0F0h, 0E8h, 0F0h, 0A0h,	0FDh,  2Bh, 0A9h,  0Ch,	0AAh,  0Ah
					; DATA XREF: ROM:9E4Fo
		db  0ACh,    8,	 2Eh,  2Fh,  31h, 0F8h,	   0, 0FDh,  2Ah, 0F8h,	0C3h, 0A8h,    8,  2Ch,	 2Fh,  33h
		db   34h,  38h,	 3Bh,  38h,  34h,  33h,	 2Fh,  2Ch, 0F8h, 0E0h,	0F8h, 0C2h, 0A7h,    8,	 2Ch,  2Eh
		db   2Fh,  33h,	 38h,  3Ah,  38h,  33h,	 2Fh,  2Eh,  2Ch, 0F8h,	0E0h, 0A7h,    8,  2Ch,	 2Eh,  2Fh
		db   33h,  38h,	 3Ah,  38h,  33h,  2Fh,	 2Ch,  27h, 0F8h, 0C3h,	0A1h,	 8,  25h,  27h,	 2Ch,  2Dh
		db   31h,  33h,	 31h,  2Dh,  2Ch,  27h,	 25h, 0F8h, 0E0h, 0F8h,	0C3h, 0A3h,    8,  27h,	 2Ah,  2Eh
		db   2Fh,  33h,	 36h,  33h,  2Fh,  2Eh,	 2Ah,  27h, 0F8h, 0E0h,	0F8h, 0C3h, 0A8h,    8,	 2Ch,  2Fh
		db   33h,  34h,	 38h,  3Bh,  38h,  34h,	 33h,  2Fh,  2Ch, 0F8h,	0E0h, 0F8h, 0C2h, 0A7h,	   8,  2Ch
		db   2Eh,  2Fh,	 33h,  38h,  3Ah,  38h,	 33h,  2Fh,  2Eh,  2Ch,	0F8h, 0E0h, 0A7h,    8,	 2Ch,  2Eh
		db   2Fh,  33h,	 38h,  3Ah,  38h,  33h,	 2Fh,  2Ch,  27h, 0F8h,	0C3h, 0A1h,    8,  25h,	 27h,  2Ch
		db   2Dh,  31h,	 33h,  31h,  2Dh,  2Ch,	 27h,  25h, 0F8h, 0E0h,	0A3h,	 8,  27h,  2Ah,	 2Eh,  2Fh
		db   33h,  36h,	 33h,  2Fh,  2Eh,  2Ah,	 27h,  28h,  2Ch,  2Fh,	 33h,  34h,  38h,  3Bh,	 38h,  34h
		db   33h,  2Fh,	 2Ch, 0F8h,  20h, 0A8h,	   8,  2Ch,  2Dh,  31h,	 34h,  38h,  39h,  38h,	 34h,  31h
		db   2Dh, 0F8h,	 40h, 0ACh,    8, 0F8h,	0A0h, 0F8h,  60h, 0A8h,	   8,  21h,  25h,  27h,	 28h,  2Ch
		db   2Dh,  25h,	 27h,  28h,  2Ch,  2Dh,	 31h,  28h,  2Ch,  2Dh,	 31h,  33h,  34h,  2Dh,	 31h,  33h
		db   34h,  38h,	 39h, 0F0h,  18h, 0FDh,	 2Bh, 0ACh,    8,  31h,	 33h, 0B8h,  30h, 0F8h,	0C1h, 0AAh
		db     8,  27h,	 25h,  20h,  25h,  27h,	0F8h, 0E0h, 0F8h, 0C1h,	0ACh,	 8,  27h,  2Ch,	 2Eh, 0F8h
		db  0E0h, 0B1h,	   8,  33h,  31h,  2Eh,	 2Ch,  27h,  29h,  2Ch,	 2Eh,  31h,  33h,  31h,	 33h,  36h
		db   38h,  3Ah,	0F0h,  18h, 0B3h,    8,	 38h,  3Ah, 0BFh,  30h,	0F8h, 0C1h, 0ACh,    8,	 27h,  25h
		db   20h,  25h,	 27h, 0F8h, 0E0h, 0F8h,	0C1h, 0AAh,    8,  25h,	 2Ah,  2Ch, 0F8h, 0E0h,	0B1h,	 8
		db   33h,  31h,	 2Ch,  31h,  2Ch,  31h,	 33h,  34h,  38h,  39h,	 38h,  34h,  31h,  2Dh,	 28h, 0A5h
		db   18h, 0FDh,	 2Ah, 0A7h,    8, 0A8h,	 0Eh, 0F0h,    2, 0A8h,	 18h,  34h,  28h, 0AAh,	   8, 0ABh
		db   0Eh, 0F0h,	   2, 0ABh,  18h,  37h,	 2Bh, 0ADh,    8, 0AEh,	 0Eh, 0F0h,    2, 0AEh,	 18h,  3Ah
		db   26h, 0A8h,	   8, 0A9h,  0Eh, 0F0h,	   2, 0A9h,  18h,  35h,	 29h, 0ABh,    8, 0ACh,	 0Eh, 0F0h
		db     2, 0ACh,	 18h,  38h,  2Ch, 0AEh,	   8, 0B0h,  0Eh, 0F0h,	   2, 0B0h,  18h,  3Ch,	0FDh,  2Bh
		db  0A8h,    8,	 2Ch,  2Dh,  31h,  34h,	 38h, 0BDh,  30h, 0BDh,	 10h,  38h,  34h,  31h,	 2Ch,  28h
		db  0F8h, 0A1h
MUSIC_26_PSG2:	db  0FDh,    0,	0FCh,	 1, 0FBh,  4Ch,	0F0h, 0E8h, 0F0h, 0A8h,	0FDh,  2Ah, 0F9h,  10h,	0A9h,  0Ch
					; DATA XREF: ROM:9E51o
		db  0AAh,  0Ah,	0ACh,	 8,  2Eh,  2Fh,	 2Ch, 0F8h,    0, 0F9h,	 10h, 0FDh,  28h, 0F8h,	0C3h, 0A8h
		db     8,  2Ch,	 2Fh,  33h,  34h,  38h,	 3Bh,  38h,  34h,  33h,	 2Fh,  2Ch, 0F8h, 0E0h,	0F8h, 0C2h
		db  0A7h,    8,	 2Ch,  2Eh,  2Fh,  33h,	 38h,  3Ah,  38h,  33h,	 2Fh,  2Eh,  2Ch, 0F8h,	0E0h, 0A7h
		db     8,  2Ch,	 2Eh,  2Fh,  33h,  38h,	 3Ah,  38h,  33h,  2Fh,	 2Ch,  27h, 0F8h, 0C3h,	0A1h,	 8
		db   25h,  27h,	 2Ch,  2Dh,  31h,  33h,	 31h,  2Dh,  2Ch,  27h,	 25h, 0F8h, 0E0h, 0F8h,	0C3h, 0A3h
		db     8,  27h,	 2Ah,  2Eh,  2Fh,  33h,	 36h,  33h,  2Fh,  2Eh,	 2Ah,  27h, 0F8h, 0E0h,	0F8h, 0C3h
		db  0A8h,    8,	 2Ch,  2Fh,  33h,  34h,	 38h,  3Bh,  38h,  34h,	 33h,  2Fh,  2Ch, 0F8h,	0E0h, 0F8h
		db  0C2h, 0A7h,	   8,  2Ch,  2Eh,  2Fh,	 33h,  38h,  3Ah,  38h,	 33h,  2Fh,  2Eh,  2Ch,	0F8h, 0E0h
		db  0A7h,    8,	 2Ch,  2Eh,  2Fh,  33h,	 38h,  3Ah,  38h,  33h,	 2Fh,  2Ch,  27h, 0F8h,	0C3h, 0A1h
		db     8,  25h,	 27h,  2Ch,  2Dh,  31h,	 33h,  31h,  2Dh,  2Ch,	 27h,  25h, 0F8h, 0E0h,	0A3h,	 8
		db   27h,  2Ah,	 2Eh,  2Fh,  33h,  36h,	 33h,  2Fh,  2Eh,  2Ah,	 27h,  28h,  2Ch,  2Fh,	 33h,  34h
		db   38h,  3Bh,	 38h,  34h,  33h,  2Fh,	 2Ch, 0F8h,  20h, 0A8h,	   8,  2Ch,  2Dh,  31h,	 34h,  38h
		db   39h,  38h,	 34h,  31h,  2Dh, 0F8h,	 40h, 0ACh,    8, 0F8h,	0A0h, 0F8h,  60h, 0A8h,	   8,  21h
		db   25h,  27h,	 28h,  2Ch,  2Dh,  25h,	 27h,  28h,  2Ch,  2Dh,	 31h,  28h,  2Ch,  2Dh,	 31h,  33h
		db   34h,  2Dh,	 31h,  33h,  34h,  38h,	 39h, 0F0h,  18h, 0FDh,	 29h, 0ACh,    8,  31h,	 33h, 0B8h
		db   30h, 0F8h,	0C1h, 0AAh,    8,  27h,	 25h,  20h,  25h,  27h,	0F8h, 0E0h, 0F8h, 0C1h,	0ACh,	 8
		db   27h,  2Ch,	 2Eh, 0F8h, 0E0h, 0B1h,	   8,  33h,  31h,  2Eh,	 2Ch,  27h,  29h,  2Ch,	 2Eh,  31h
		db   33h,  31h,	 33h,  36h,  38h,  3Ah,	0F0h,  18h, 0B3h,    8,	 38h,  3Ah, 0BFh,  30h,	0F8h, 0C1h
		db  0ACh,    8,	 27h,  25h,  20h,  25h,	 27h, 0F8h, 0E0h, 0F8h,	0C1h, 0AAh,    8,  25h,	 2Ah,  2Ch
		db  0F8h, 0E0h,	0B1h,	 8,  33h,  31h,	 2Ch,  31h,  2Ch,  31h,	 33h,  34h,  38h,  39h,	 38h,  34h
		db   31h,  2Dh,	0F9h,	 0, 0FDh,  2Ah,	0A1h,  18h, 0A3h,    8,	0A5h,  0Eh, 0F0h,    2,	0A5h,  18h
		db   31h,  24h,	0A6h,	 8, 0A8h,  0Eh,	0F0h,	 2, 0A8h,  18h,	 34h,  27h, 0A9h,    8,	0ABh,  0Eh
		db  0F0h,    2,	0ABh,  18h,  37h,  22h,	0A4h,	 8, 0A6h,  0Eh,	0F0h,	 2, 0A6h,  18h,	 32h,  25h
		db  0A7h,    8,	0A9h,  0Eh, 0F0h,    2,	0A9h,  18h,  35h,  29h,	0AAh,	 8, 0ACh,  0Eh,	0F0h,	 2
		db  0ACh,  18h,	0B8h,  20h, 0F9h,  10h,	0FDh,  29h, 0A8h,    8,	 2Ch,  2Dh,  31h,  34h,	 38h, 0BDh
		db   30h, 0F9h,	   0, 0FDh,  2Bh, 0C0h,	 10h,  3Dh,  38h,  34h,	 31h,  2Ch, 0F8h, 0A1h
MUSIC_26_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:9E53o	ROM:9E55o
MUSIC_27:	db 0			; DATA XREF: ROM:8000o
		db 0
		db 0
		db 201
		dw MUSIC_27_YM1
		dw MUSIC_27_YM2
		dw MUSIC_27_YM3
		dw MUSIC_27_YM4
		dw MUSIC_27_YM5
		dw MUSIC_27_YM6
		dw MUSIC_27_PSG1
		dw MUSIC_27_PSG2
		dw MUSIC_27_PSG3
		dw MUSIC_27_PSG3
MUSIC_27_YM1:	db  0F8h,    0,	0F0h,	 2, 0FEh,  0Eh,	0FDh,  0Bh, 0FCh,    1,	0FBh,	 0, 0C5h,  60h,	0C4h,  30h
					; DATA XREF: ROM:A7CCo
		db  0C5h,  60h,	0C4h,  30h, 0C5h,  60h,	0CAh,  30h, 0C1h,  60h,	0F0h,  30h,  40h,  42h,	 44h,  45h
		db   47h,  49h,	 4Ah,  4Ch,  4Fh, 0C5h,	 0Ch, 0F0h,  24h, 0D1h,	 0Ch,  70h,  45h, 0F0h,	 3Ch, 0C5h
		db   60h, 0C4h,	 30h, 0C5h,  60h, 0C4h,	 30h, 0C5h,  60h, 0CAh,	 30h, 0CDh,  60h, 0F0h,	 30h,  70h
		db   4Eh,  49h,	 4Ah,  46h,  47h,  44h,	 45h,  3Dh, 0BEh,  0Ch,	0F0h,  22h, 0BBh,  30h,	 39h, 0F8h
		db  0A1h
MUSIC_27_YM2:	db  0FEh,  0Eh,	0FDh,  0Ah, 0FCh,    1,	0FBh,	 0, 0F8h,    0,	0C2h,  60h, 0C1h,  30h,	0C2h,  60h
					; DATA XREF: ROM:A7CEo
		db  0C1h,  30h,	0C2h,  60h, 0C2h,  30h,	0BEh,  60h, 0F0h,  30h,	 38h,  39h,  3Bh,  3Dh,	 3Eh,  40h
		db  0C1h,  48h,	0C0h,  18h, 0BEh,  30h,	0BDh,  0Ch, 0F0h,  24h,	0D0h,	 4, 0F0h,  14h,	0C4h,	 4
		db  0F0h,  44h,	0C2h,  60h, 0C1h,  30h,	0C2h,  60h, 0C1h,  30h,	0C2h,  60h, 0C2h,  30h,	 3Eh, 0BBh
		db   18h,  3Dh,	 3Eh,  41h, 0C2h,  30h,	 45h,  43h,  42h, 0BEh,	 60h,  3Dh, 0B7h,  30h,	0B6h,  0Ch
		db  0F0h,  24h,	0B7h,  18h,  32h,  31h,	 34h, 0F8h, 0A1h
MUSIC_27_YM3:	db  0FEh,  0Eh,	0FDh,  0Ah, 0FCh,    1,	0FBh,	 0, 0F8h,    0,	0B2h,  30h,  39h,  2Dh,	 32h,  39h
					; DATA XREF: ROM:A7D0o
		db   2Dh,  32h,	 39h,  2Dh,  2Eh, 0B8h,	 18h,  37h,  35h,  32h,	0B4h,  60h, 0B4h,  30h,	0B9h,  60h
		db  0ADh,  30h,	0AFh,  60h, 0AEh,  30h,	0ADh,  0Ch, 0F0h,  54h,	0B9h,	 6, 0F0h,  12h,	0ADh,	 6
		db  0F0h,  12h,	0B2h,  30h,  39h,  2Dh,	 32h,  39h,  2Dh,  32h,	 39h,  2Dh,  2Fh, 0B2h,	 18h,  34h
		db   35h,  38h,	0B9h,  90h, 0BBh,  60h,	0B7h,  30h, 0B9h,  60h,	0ADh,  30h, 0B2h,  0Ch,	0F0h,  24h
		db  0A8h,  30h,	 2Dh, 0F8h, 0A1h
MUSIC_27_YM4:	db  0F9h,  20h,	0F8h,	 0, 0FAh,  80h,	0F0h,	 4, 0FEh,  0Eh,	0FDh,	 8, 0FCh,    1,	0FBh,	 0
					; DATA XREF: ROM:A7D2o
		db  0C5h,  60h,	0C4h,  30h, 0C5h,  60h,	0C4h,  30h, 0C5h,  60h,	0CAh,  30h, 0C1h,  60h,	0F0h,  30h
		db   40h,  42h,	 44h,  45h,  47h,  49h,	 4Ah,  4Ch,  4Fh, 0C5h,	 0Ch, 0F0h,  24h, 0D1h,	 0Ch,  70h
		db   45h, 0F0h,	 3Ch, 0FAh,  40h, 0C5h,	 60h, 0C4h,  30h, 0C5h,	 60h, 0C4h,  30h, 0C5h,	 60h, 0CAh
		db   30h, 0CDh,	 60h, 0F0h,  30h,  70h,	 4Eh,  49h,  4Ah,  46h,	 47h,  44h,  45h,  3Dh,	0BEh,  0Ch
		db  0F0h,  22h,	0BBh,  30h,  39h, 0F8h,	0A1h
MUSIC_27_YM5:	db  0FFh,    0,	   0	; DATA XREF: ROM:A7D4o
MUSIC_27_YM6:	db  0FFh,    0,	   0	; DATA XREF: ROM:A7D6o
MUSIC_27_PSG1:	db  0FFh,    0,	   0	; DATA XREF: ROM:A7D8o
MUSIC_27_PSG2:	db  0FFh,    0,	   0	; DATA XREF: ROM:A7DAo
MUSIC_27_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:A7DCo	ROM:A7DEo
MUSIC_28:	db 0			; DATA XREF: ROM:8000o
		db 0
		db 0
		db 194
		dw MUSIC_28_YM1
		dw MUSIC_28_YM2
		dw MUSIC_28_YM3
		dw MUSIC_28_YM4
		dw MUSIC_28_YM5
		dw MUSIC_28_YM6
		dw MUSIC_28_PSG1
		dw MUSIC_28_PSG2
		dw MUSIC_28_PSG3
		dw MUSIC_28_PSG3
MUSIC_28_YM1:	db  0F0h,  14h,	0FEh,  35h, 0FDh,  0Dh,	0FCh,	 6, 0FBh,  2Ch,	0B2h,  10h,  2Dh,  2Eh,	 28h,  29h
					; DATA XREF: ROM:A949o
		db  0FCh,    1,	0A5h,  2Dh, 0F0h,    3,	0A5h,	 6,  29h,  2Dh,	 30h,  31h,  35h,  39h,	 3Ch, 0F0h
		db  0C0h, 0F8h,	   0, 0FEh,  0Dh, 0FDh,	 0Bh, 0B4h,  50h, 0F0h,	   4, 0B4h,    6,  35h,	 31h,  70h
		db  0FEh,  28h,	0FDh,  0Eh, 0B9h,  12h,	 35h,  31h, 0ACh,  1Eh,	0FEh,  0Dh, 0FDh,  0Bh,	0B4h,  50h
		db  0F0h,    4,	0B1h,	 6,  32h,  39h,	 38h, 0FEh,  28h, 0FDh,	 0Eh, 0B9h,  12h,  35h,	 31h, 0ACh
		db   7Eh, 0FEh,	 0Dh, 0FDh,  0Bh, 0ABh,	 24h, 0ABh,    6,  2Ah,	0A9h,  10h,  25h,  30h,	0AAh,  60h
		db  0F0h,  0Ch,	0ABh,  18h, 0ABh,    6,	 2Ah, 0A9h,  10h,  25h,	 30h, 0ADh,  60h, 0FEh,	 35h, 0FDh
		db   0Ch, 0AEh,	 0Ch, 0ADh,    6, 0F0h,	 12h, 0ADh,    6,  2Dh,	0ADh,  0Ch, 0ACh,    6,	0F0h,  12h
		db  0ACh,    6,	 2Ch, 0B0h,  0Ch, 0AFh,	   6, 0F0h,  4Eh, 0B2h,	 0Ch, 0B1h,    6, 0F0h,	 12h, 0B1h
		db     6,  31h,	0B1h,  0Ch, 0B0h,    6,	0F0h,  12h, 0B0h,    6,	 30h, 0B4h,  0Ch, 0B3h,	   6, 0F0h
		db   2Ah, 0FDh,	 0Dh, 0A9h,    6,  2Ah,	 2Fh,  30h,  35h,  36h,	0FEh,  0Dh, 0FDh,  0Bh,	0F0h,  0Ch
		db  0FCh,    6,	 30h,  30h,  30h,  30h,	 2Eh,  30h, 0B3h,  18h,	0B1h,  0Ch,  33h,  36h,	 70h, 0B6h
		db   18h,  34h,	0B4h,  0Ch,  34h,  34h,	 34h,  32h,  34h, 0B7h,	 18h, 0B5h,  0Ch,  37h,	0BAh,  3Ch
		db  0FCh,    1,	0B9h,	 6,  39h,  39h,	0F0h,  12h, 0B7h,    6,	0F0h,  12h, 0BAh,    6,	0F0h,  12h
		db  0B7h,    6,	 70h,  39h,  39h,  39h,	 70h,  37h,  70h, 0BAh,	 3Ch, 0F8h, 0A1h
MUSIC_28_YM2:	db  0F0h,  14h,	0FEh,  35h, 0FDh,  0Ch,	0FCh,	 6, 0FBh,  2Ch,	0ADh,  10h,  28h,  29h,	 23h,  24h
					; DATA XREF: ROM:A94Bo
		db  0FCh,    1,	0A0h,  2Dh, 0F0h,    3,	0A0h,	 6,  24h,  28h,	 2Bh,  2Ch,  30h,  34h,	 37h, 0F0h
		db  0C0h, 0F8h,	   0, 0F0h,  60h, 0F0h,	 0Ch, 0FEh,  28h, 0FDh,	 0Eh, 0B8h,  12h,  34h,	 2Fh, 0ABh
		db   8Ah, 0B8h,	 12h,  34h,  2Fh, 0ABh,	 1Eh, 0FEh,  19h, 0FDh,	 0Ah, 0A9h,    6,  2Bh,	 2Dh,  2Bh
		db   29h,  2Bh,	 2Dh,  30h,  2Fh,  2Eh,	 2Fh,  32h,  35h,  34h,	 35h,  39h, 0FDh,    9,	0A8h,  60h
		db  0F0h,  18h,	0A8h,  0Fh, 0F0h,    9,	0A8h,  0Fh, 0F0h,    9,	0A7h,  0Fh, 0F0h,    9,	0A8h,  60h
		db  0F0h,  18h,	0ABh,  0Fh, 0F0h,    9,	0ACh,  0Fh, 0F0h,    9,	0ADh,  0Fh, 0F0h,    9,	0FEh,  35h
		db  0FDh,  0Bh,	0A9h,  0Ch, 0A8h,    6,	0F0h,  12h, 0A8h,    6,	 28h, 0A8h,  0Ch, 0A7h,	   6, 0F0h
		db   12h, 0A7h,	   6,  27h, 0ABh,  0Ch,	0AAh,	 6, 0F0h,  12h,	 98h,  3Ch, 0ADh,  0Ch,	0ACh,	 6
		db  0F0h,  12h,	0ACh,	 6,  2Ch, 0ACh,	 0Ch, 0ABh,    6, 0F0h,	 12h, 0ABh,    6,  2Bh,	0AFh,  0Ch
		db  0AEh,    6,	0F0h,  12h,  9Bh,  3Ch,	0FEh,  0Dh, 0FDh,  0Ah,	0F0h,  0Ch, 0FCh,    6,	 2Bh,  2Bh
		db   2Bh,  2Bh,	 29h,  2Bh, 0AEh,  18h,	0ACh,  0Ch,  2Eh,  31h,	 70h, 0B1h,  18h,  2Fh,	0AFh,  0Ch
		db   2Fh,  2Fh,	 2Fh,  2Dh,  2Fh, 0B2h,	 18h, 0B0h,  0Ch,  32h,	0B5h,  3Ch, 0FCh,    1,	0B4h,	 6
		db   34h,  34h,	0F0h,  12h, 0B2h,    6,	0F0h,  12h, 0B5h,    6,	0F0h,  12h, 0B2h,    6,	 70h,  34h
		db   34h,  34h,	 70h,  32h,  70h, 0B5h,	 3Ch, 0F8h, 0A1h
MUSIC_28_YM3:	db  0F0h,  14h,	0FEh,  35h, 0FDh,  0Ch,	0FCh,	 6, 0FBh,  2Ch,	0ABh,  10h,  26h,  27h,	 21h,  22h
					; DATA XREF: ROM:A94Do
		db  0FCh,    1,	 9Dh,  2Dh, 0F0h,    3,	 9Dh,	 6,  21h,  25h,	 28h,  29h,  2Dh,  31h,	 34h, 0FDh
		db   0Bh, 0F8h,	0C1h,  9Ah,    6,  1Ch,	 1Dh,  1Ch,  1Ah,  1Ch,	 1Dh,  21h,  20h,  1Fh,	 20h,  21h
		db   24h,  23h,	 20h,  1Dh, 0F8h, 0E0h,	0F8h,	 0, 0FEh,  35h,	0FDh,  0Ah, 0F8h, 0C3h,	 9Ah,	 6
		db   1Ch,  1Dh,	 1Ch,  1Ah,  1Ch,  1Dh,	 21h,  20h,  1Fh,  20h,	 21h,  24h,  23h,  20h,	 1Dh, 0F8h
		db  0E0h,  9Ah,	   6,  1Ch,  1Dh,  1Ch,	 1Ah,  1Ch,  1Dh,  21h,	 20h,  1Fh,  20h,  23h,	 26h,  25h
		db   26h,  29h,	0A2h,  60h, 0F0h,  18h,	0A2h,  0Fh, 0F0h,    9,	0A2h,  0Fh, 0F0h,    9,	0A1h,  0Fh
		db  0F0h,    9,	0A2h,  60h, 0F0h,  18h,	0A5h,  0Fh, 0F0h,    9,	0A6h,  0Fh, 0F0h,    9,	0A7h,  0Fh
		db  0F0h,    9,	0FDh,  0Bh, 0A7h,  0Ch,	0A6h,	 6, 0F0h,  12h,	0A6h,	 6,  26h, 0A6h,	 0Ch, 0A5h
		db     6, 0F0h,	 12h, 0A5h,    6,  25h,	0A9h,  0Ch, 0A8h,    6,	0F0h,  12h,  93h,  3Ch,	0ABh,  0Ch
		db  0AAh,    6,	0F0h,  12h, 0AAh,    6,	 2Ah, 0AAh,  0Ch, 0A9h,	   6, 0F0h,  12h, 0A9h,	   6,  29h
		db  0ADh,  0Ch,	0ACh,	 6, 0F0h,  12h,	 95h,  3Ch, 0FEh,  0Dh,	0FDh,  0Ah, 0F0h,  0Ch,	0FCh,	 6
		db   29h,  29h,	 29h,  29h,  27h,  29h,	0ACh,  18h, 0AAh,  0Ch,	 2Ch,  2Fh,  70h, 0AFh,	 18h,  2Dh
		db  0ADh,  0Ch,	 2Dh,  2Dh,  2Dh,  2Bh,	 2Dh, 0B0h,  18h, 0AEh,	 0Ch,  30h, 0B3h,  3Ch,	0FCh,	 1
		db  0B2h,    6,	 32h,  32h, 0F0h,  12h,	0B0h,	 6, 0F0h,  12h,	0B3h,	 6, 0F0h,  12h,	0B0h,	 6
		db   70h,  32h,	 32h,  32h,  70h,  30h,	 70h, 0B3h,  3Ch, 0F8h,	0A1h
MUSIC_28_YM4:	db  0FEh,    0,	0FDh,  0Bh, 0FBh,  2Ch,	0FCh,  80h,  8Ch,    2,	 0Dh, 0FCh,    1,  8Eh,	 90h, 0FEh
					; DATA XREF: ROM:A94Fo
		db   35h, 0FDh,	 0Bh,  9Ah,    6,  1Eh,	 22h,  25h,  26h,  2Ah,	 2Eh,  31h, 0FCh,    2,	0F8h, 0C1h
		db  0FEh,  24h,	0FDh,  0Ch,  8Eh,    6,	 10h,  11h,  10h,  0Eh,	 10h,  11h,  15h,  14h,	 13h,  14h
		db   15h,  18h,	 17h,  14h,  11h, 0F8h,	0E0h, 0F8h,    0, 0FEh,	 24h, 0FDh,  0Ch, 0F8h,	0C3h,  8Eh
		db     6,  10h,	 11h,  10h,  0Eh,  10h,	 11h,  15h,  14h,  13h,	 14h,  15h,  18h,  17h,	 14h,  11h
		db  0F8h, 0E0h,	 8Eh,	 6,  10h,  11h,	 10h,  0Eh,  10h,  11h,	 15h,  14h,  13h,  14h,	 17h,  1Ah
		db   19h,  1Ah,	 1Dh,  8Dh,  60h, 0F0h,	 18h,  8Dh,  0Fh, 0F0h,	   9,  8Dh,  0Fh, 0F0h,	   9,  8Ch
		db   0Fh, 0F0h,	   9,  8Dh,  60h, 0F0h,	 18h,  90h,  0Fh, 0F0h,	   9,  91h,  0Fh, 0F0h,	   9,  92h
		db   0Fh, 0F0h,	   9,  98h,  0Ch,  97h,	   6,  70h, 0FDh,  0Eh,	 8Bh,	 8, 0F0h,    4,	0FDh,  0Ch
		db   97h,    6,	 17h,  97h,  0Ch,  96h,	   6,  70h, 0FDh,  0Eh,	 8Ah,	 8, 0F0h,    4,	0FDh,  0Ch
		db   96h,    6,	 16h,  95h,  0Ch,  94h,	   6, 0F0h,  12h, 0FDh,	 0Dh,  88h,  3Ch, 0FDh,	 0Ch,  9Ch
		db   0Ch,  9Bh,	   6,  70h, 0FDh,  0Eh,	 8Fh,	 8, 0F0h,    4,	0FDh,  0Ch,  9Bh,    6,	 1Bh,  9Bh
		db   0Ch,  9Ah,	   6,  70h, 0FDh,  0Eh,	 8Eh,	 8, 0F0h,    4,	0FDh,  0Ch,  9Ah,    6,	 1Ah,  99h
		db   0Ch,  98h,	   6, 0F0h,  12h, 0FDh,	 0Dh,  8Ch,  3Ch, 0FDh,	 0Ch,  91h,    6,  13h,	 14h,  11h
		db   0Fh,  11h,	 13h,  0Fh,  0Dh,  0Fh,	 11h,  0Dh,  0Ch,  0Dh,	 0Fh,  14h,  16h,  18h,	 19h,  16h
		db   14h,  16h,	 17h,  14h,  12h,  14h,	 15h,  12h,  10h,  12h,	 14h,  10h,  15h,  17h,	 18h,  15h
		db   13h,  15h,	 17h,  13h,  11h,  13h,	 15h,  11h,  10h,  11h,	 13h,  18h,  1Ah,  1Ch,	 1Dh,  1Ah
		db   18h,  1Ah,	 1Bh,  18h,  16h,  18h,	 19h,  16h,  14h,  16h,	 18h,  14h, 0FDh,  0Dh,	 15h,  15h
		db   15h,  70h,	0FDh,  0Eh,    9,  70h,	 16h,  70h,  0Ah,  70h,	0FDh,  0Dh,  0Eh,  0Fh,	 13h,  15h
		db   16h,  1Bh,	 15h,  15h,  15h,  70h,	 16h,  70h,  8Fh,  3Ch,	0F8h, 0A1h
MUSIC_28_YM5:	db  0FBh,  2Ch,	0FCh,	 6, 0FEh,  0Ch,	0FDh,  0Bh,  82h,  1Ah,	0F9h,  20h, 0FAh,  40h,	0FEh,  35h
					; DATA XREF: ROM:A951o
		db  0FDh,  0Ah,	0B2h,  10h,  2Dh,  2Eh,	 28h,  29h, 0FCh,    1,	0A5h,  2Dh, 0F0h,    3,	0A5h,	 6
		db   29h,  2Dh,	 30h,  31h,  35h,  39h,	 3Ch, 0F0h, 0C0h, 0F8h,	   0, 0FAh,  80h, 0FEh,	 0Dh, 0FDh
		db     9, 0B4h,	 50h, 0F0h,    4, 0B4h,	   6,  35h,  31h,  70h,	0FAh,  40h, 0FEh,  28h,	0FDh,  0Ch
		db  0B9h,  12h,	 35h,  31h, 0ACh,  1Eh,	0FAh,  80h, 0FEh,  0Dh,	0FDh,	 9, 0B4h,  50h,	0F0h,	 4
		db  0B1h,    6,	 32h,  39h,  38h, 0FAh,	 40h, 0FEh,  28h, 0FDh,	 0Ch, 0B9h,  12h,  35h,	 31h, 0ACh
		db   7Eh, 0FAh,	 80h, 0FEh,  0Dh, 0FDh,	   9, 0ABh,  24h, 0ABh,	   6,  2Ah, 0A9h,  10h,	 25h,  30h
		db  0AAh,  60h,	0F0h,  0Ch, 0ABh,  18h,	0ABh,	 6,  2Ah, 0A9h,	 10h,  25h,  30h, 0ADh,	 60h, 0FAh
		db   40h, 0FEh,	 35h, 0FDh,  0Ah, 0AEh,	 0Ch, 0ADh,    6, 0F0h,	 12h, 0ADh,    6,  2Dh,	0ADh,  0Ch
		db  0ACh,    6,	0F0h,  12h, 0ACh,    6,	 2Ch, 0B0h,  0Ch, 0AFh,	   6, 0F0h,  4Eh, 0B2h,	 0Ch, 0B1h
		db     6, 0F0h,	 12h, 0B1h,    6,  31h,	0B1h,  0Ch, 0B0h,    6,	0F0h,  12h, 0B0h,    6,	 30h, 0B4h
		db   0Ch, 0B3h,	   6, 0F0h,  2Ah, 0A9h,	   6,  2Ah,  2Fh,  30h,	 35h,  36h, 0FAh,  80h,	0FEh,  0Dh
		db  0FDh,    9,	0F0h,  0Ch, 0FCh,    6,	 30h,  30h,  30h,  30h,	 2Eh,  30h, 0B3h,  18h,	0B1h,  0Ch
		db   33h,  36h,	 70h, 0B6h,  18h,  34h,	0B4h,  0Ch,  34h,  34h,	 34h,  32h,  34h, 0B7h,	 18h, 0B5h
		db   0Ch,  37h,	0BAh,  3Ch, 0FCh,    1,	0B9h,	 6,  39h,  39h,	0F0h,  12h, 0B7h,    6,	0F0h,  12h
		db  0BAh,    6,	0F0h,  12h, 0B7h,    6,	 70h,  39h,  39h,  39h,	 70h,  37h,  70h, 0BAh,	 3Ch, 0F8h
		db  0A1h
MUSIC_28_YM6:	db   80h,  64h,	0F0h,  16h,  8Bh,    1,	 0Ah,  89h,  48h, 0F8h,	0C7h,  89h,  0Ch,  8Ah,	   6,  0Bh
					; DATA XREF: ROM:A953o
		db  0F8h, 0E0h,	0F8h,	 0, 0F8h, 0C3h,	 89h,  0Ch,  8Ah,    6,	 0Bh, 0F8h, 0E0h,  80h,	 0Ch, 0F8h
		db  0C1h,  89h,	   6,	 9,  89h,  18h,	0F8h, 0E0h,  89h,    6,	   9, 0F0h,  0Ch,  8Ah,	   6,  0Bh
		db  0F8h, 0C2h,	 89h,  0Ch,  8Ah,    6,	 0Bh, 0F8h, 0E0h,  80h,	 0Ch, 0F8h, 0C1h,  89h,	   6,	 9
		db   89h,  18h,	0F8h, 0E0h,  89h,    6,	   9, 0F0h,  0Ch,  8Ah,	   6,  0Bh,  89h,  0Ch,	 8Ah,	 6
		db   0Bh,    9,	0F8h, 0C2h,  8Bh,    6,	0F8h, 0E0h, 0F8h, 0C2h,	 8Ah,	 6, 0F8h, 0E0h,	 89h,	 6
		db  0F8h,  20h,	 89h,  18h,  85h,  48h,	0F0h,  18h, 0F8h, 0C2h,	 80h,  0Ch,  89h,    6,	 0Ah, 0F8h
		db  0E0h, 0F8h,	 40h, 0F8h, 0A0h, 0F8h,	 60h, 0F8h,  20h, 0F8h,	0C1h,  89h,  0Ch,  89h,	 18h,  89h
		db     6,  0Ah,	0F8h, 0E0h,  89h,  0Ch,	 89h,  18h,    0, 0F8h,	 40h,  89h,    6,  0Ah,	 89h,  18h
		db  0F8h, 0A0h,	0F8h,  60h,  89h,    6,	 0Ah,	 9,    9,    9,	   9, 0F8h, 0CFh,  89h,	 0Ch,  8Ah
		db     6,  0Bh,	0F8h, 0E0h,  89h,    6,	 0Ah,  89h,  0Ch, 0F8h,	0C1h,  80h,  0Ch,    9,	0F8h, 0E0h
		db  0F8h, 0C1h,	 89h,	 6,  0Ah,  89h,	 0Ch, 0F8h, 0E0h,  80h,	 0Ch,  89h,  18h,  8Ah,	 0Ch,  8Ah
		db     3,    9,	 0Ah,  0Ah, 0F8h, 0C3h,	 8Bh,	 3, 0F8h, 0E0h,	0F8h, 0A1h
MUSIC_28_PSG1:	db  0FDh,    0,	0FCh,	 1, 0FBh,  4Ch,	0F8h, 0C3h, 0F0h,  61h,	0F8h, 0E0h, 0F8h,    0,	0FDh,  7Bh
					; DATA XREF: ROM:A955o
		db  0AFh,  54h,	0AFh,	 6,  70h,  2Ch,	 70h, 0F8h,  20h, 0FDh,	 2Dh, 0FCh,    1, 0F8h,	0C1h, 0A8h
		db     6,  28h,	0A8h,  0Ch,  70h, 0F8h,	0E0h, 0A8h,    6,  28h,	0F8h,  40h, 0FDh,  7Bh,	0AFh,  54h
		db  0AFh,    6,	 70h,  32h,  70h, 0F8h,	0A0h, 0F8h,  60h, 0FDh,	   0, 0F0h,  60h, 0FDh,	 7Bh, 0F8h
		db  0CFh, 0C0h,	   6,  3Fh,  3Eh,  3Fh,	0F8h, 0E0h, 0FDh,    0,	0F0h,  18h, 0FDh,  2Ch,	0B5h,	 6
		db   70h, 0FDh,	   0, 0F0h,  24h, 0FDh,	 2Ch, 0B4h,    6,  70h,	0FDh,	 0, 0F0h,  24h,	0FDh,  2Ch
		db  0B7h,    6,	 70h, 0FDh,    0, 0F0h,	 54h, 0FDh,  2Ch, 0B9h,	   6,  70h, 0FDh,    0,	0F0h,  24h
		db  0FDh,  2Ch,	0B8h,	 6,  70h, 0FDh,	   0, 0F0h,  24h, 0FDh,	 2Ch, 0BBh,    6,  70h,	0FDh,	 0
		db  0F0h,  3Ch,	0FCh,	 6, 0FDh,  2Bh,	0ACh,  0Ch,  30h,  2Bh,	 30h,  29h,  2Eh,  27h,	 2Ch,  25h
		db   2Ah,  23h,	 28h,  21h,  26h,  20h,	 25h,  30h,  34h,  2Fh,	 34h,  2Dh,  32h,  2Bh,	 30h,  29h
		db   2Eh,  27h,	 2Ch,  25h,  2Ah,  24h,	 29h, 0FCh,    1, 0FDh,	 7Ah, 0B4h,    6,  34h,	 34h, 0F0h
		db   12h, 0B2h,	   6, 0F0h,  12h, 0B5h,	   6, 0F0h,  12h, 0B2h,	   6,  70h,  34h,  34h,	 34h,  70h
		db   32h,  70h,	 35h,  70h, 0FDh,  7Dh,	 46h,  41h,  3Fh,  3Ah,	 3Bh,  36h,  34h,  2Fh,	0F8h, 0A1h
MUSIC_28_PSG2:	db  0FDh,    0,	0FCh,	 1, 0FBh,  4Ch,	0F8h, 0C3h, 0F0h,  61h,	0F8h, 0E0h, 0F8h,    0,	0FDh,  7Bh
					; DATA XREF: ROM:A957o
		db  0A9h,  54h,	0A9h,	 6,  70h,  26h,	 70h, 0F8h,  20h, 0FDh,	 2Dh, 0F8h, 0C1h, 0A6h,	   6,  26h
		db  0A6h,  0Ch,	 70h, 0F8h, 0E0h, 0A6h,	   6,  26h, 0F8h,  40h,	0FDh,  7Bh, 0A9h,  54h,	0A9h,	 6
		db   70h,  2Fh,	 70h, 0F8h, 0A0h, 0F8h,	 60h, 0FDh,    0, 0F0h,	0FCh,  70h, 0FDh,  2Ch,	0B3h,	 6
		db   70h, 0FDh,	   0, 0F0h,  24h, 0FDh,	 2Ch, 0B2h,    6,  70h,	0FDh,	 0, 0F0h,  24h,	0FDh,  2Ch
		db  0B5h,    6,	 70h, 0FDh,    0, 0F0h,	 54h, 0FDh,  2Ch, 0B7h,	   6,  70h, 0FDh,    0,	0F0h,  24h
		db  0FDh,  2Ch,	0B6h,	 6,  70h, 0FDh,	   0, 0F0h,  24h, 0FDh,	 2Ch, 0B9h,    6,  70h,	0FDh,	 0
		db  0F0h,  3Ch,	0FCh,	 6, 0FDh,  2Bh,	0A9h,  0Ch,  29h,  27h,	 27h,  25h,  25h,  24h,	 24h,  22h
		db   22h,  20h,	 20h,  1Eh,  1Eh,  1Ch,	 1Ch,  2Dh,  2Dh,  2Bh,	 2Bh,  29h,  29h,  28h,	 28h,  26h
		db   26h,  24h,	 24h,  22h,  22h,  20h,	 20h, 0FCh,    1, 0FDh,	 7Ah, 0B2h,    6,  32h,	 32h, 0F0h
		db   12h, 0B0h,	   6, 0F0h,  12h, 0B3h,	   6, 0F0h,  12h, 0B0h,	   6,  70h,  32h,  32h,	 32h,  70h
		db   30h,  70h,	 33h, 0F0h,  0Ch, 0FDh,	 7Bh, 0C6h,    6,  41h,	 3Fh,  3Ah,  3Bh,  36h,	 34h, 0F8h
		db  0A1h
MUSIC_28_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:A959o	ROM:A95Bo
MUSIC_2A:	db 0			; DATA XREF: ROM:8000o
		db 0
		db 0
		db 184
		dw MUSIC_2A_YM1
		dw MUSIC_2A_YM2
		dw MUSIC_2A_YM3
		dw MUSIC_2A_YM4
		dw MUSIC_2A_YM5
		dw MUSIC_2A_YM6
		dw MUSIC_2A_PSG1
		dw MUSIC_2A_PSG2
		dw MUSIC_2A_PSG3
		dw MUSIC_2A_PSG3
MUSIC_2A_YM1:	db  0F8h,    0,	0F8h,  20h, 0FCh,    1,	0FBh,  2Ch, 0FEh,    5,	0FDh,  0Bh, 0A1h,    6,	 70h,  23h
					; DATA XREF: ROM:B0CFo
		db   70h,  24h,	0F0h,  21h, 0FAh,  40h,	0FEh,  15h, 0FDh,    9,	0FBh,  10h,  95h,  75h,	0FAh, 0C0h
		db  0FEh,    5,	0FDh,  0Bh, 0FBh,  2Ch,	0A1h,	 6,  23h,  24h,	 70h,  28h,  70h, 0ABh,	 0Ch, 0AAh
		db     6, 0F0h,	 2Dh, 0FAh,  40h, 0FEh,	 15h, 0FDh,    9, 0FBh,	 10h,  95h,  5Dh, 0FAh,	0C0h, 0FEh
		db     5, 0FDh,	 0Bh, 0FBh,  2Ch, 0A1h,	   6,  23h, 0F8h,  40h,	0A4h,	 6,  70h,  28h,	 70h, 0ABh
		db   0Ch, 0AAh,	   6,  70h, 0ADh,  0Ch,	0ACh,	 6,  70h, 0AFh,	 0Ch, 0AEh,    6,  70h,	0F0h,  60h
		db  0FEh,  0Dh,	0FDh,  0Ah, 0B2h,  1Eh,	0F0h,	 6, 0AEh,    4,	 2Eh,  70h, 0B2h,    3,	0F0h,	 9
		db  0AEh,    4,	 2Eh,  70h, 0B4h,  1Eh,	0F0h,	 6, 0AEh,    4,	 2Eh,  70h, 0B2h,    3,	0F0h,	 9
		db  0AEh,    4,	 2Eh,  70h, 0B2h,    3,	0F0h,	 9, 0AEh,    4,	 2Eh,  70h, 0B4h,  1Eh,	0F0h,	 6
		db  0AEh,    4,	 2Eh,  70h, 0B2h,  1Eh,	0F0h,	 6, 0AEh,    4,	 2Eh,  70h, 0B4h,    3,	0F0h,	 9
		db  0AEh,    4,	 2Eh,  70h, 0B2h,    3,	0F0h,	 9, 0AEh,    4,	 2Eh,  70h, 0B4h,  48h,	0F8h, 0A0h
		db  0F8h,  60h,	0A4h,	 6,  70h,  28h,	 70h, 0ABh,  0Ch, 0AAh,	   6,  70h,  27h,  70h,	0ADh,  0Ch
		db  0ACh,    6,	 70h,  29h,  70h, 0AFh,	 0Ch, 0AEh,    6,  70h,	 2Bh,  70h,  31h, 0F0h,	 36h, 0FEh
		db   0Dh, 0FDh,	 0Ah, 0B5h,  1Eh, 0F0h,	   6, 0B1h,    4,  31h,	 70h, 0B5h,    3, 0F0h,	   9, 0B1h
		db     4,  31h,	 70h, 0B7h,  1Eh, 0F0h,	   6, 0B1h,    4,  31h,	 70h, 0B5h,    3, 0F0h,	   9, 0B1h
		db     4,  31h,	 70h, 0B5h,    3, 0F0h,	   9, 0B1h,    4,  31h,	 70h, 0B7h,  1Eh, 0F0h,	   6, 0B1h
		db     4,  31h,	 70h, 0B5h,  1Eh, 0F0h,	   6, 0B1h,    4,  31h,	 70h, 0B7h,    3, 0F0h,	   9, 0B1h
		db     4,  31h,	 70h, 0B5h,    3, 0F0h,	   9, 0B1h,    4,  31h,	 70h, 0B7h,  24h, 0FEh,	 1Ch, 0FDh
		db   0Bh, 0A7h,	   0, 0FCh,  85h, 0A8h,	 18h, 0FCh, 0FFh, 0A8h,	   6,  70h, 0A8h,  1Eh,	0A4h,	 6
		db   21h,  20h,	0AAh,	 0, 0FCh,  8Ah,	0ABh,  12h, 0FCh, 0FFh,	0AAh,  3Ch, 0F0h,    6,	0AAh,	 4
		db   2Bh,  2Ch,	0ADh,  12h,  28h, 0A4h,	 0Ch, 0ACh,    0, 0FCh,	 90h, 0AFh,  28h, 0FCh,	0FFh, 0FCh
		db   80h, 0B0h,	   4,  2Fh, 0FCh,    1,	0ACh,  66h, 0F0h,    6,	0FCh,  88h, 0ADh,  18h,	0FCh, 0FFh
		db  0ADh,    6,	 70h, 0ADh,  1Eh, 0A9h,	   6,  26h,  25h, 0A8h,	 12h, 0A9h,  3Ch, 0F0h,	   6, 0FCh
		db   80h, 0A9h,	   4,  28h, 0FCh,    1,	 27h, 0A6h,  12h,  21h,	0A6h,  0Ch, 0A3h,  24h,	0AAh,	 0
		db  0FCh,  82h,	0ABh,  9Ch, 0FCh, 0FFh,	0FEh,  1Ah, 0FDh,  0Bh,	0B7h,  1Eh, 0B4h,    6,	 32h,  31h
		db  0B7h,  12h,	0B6h,  1Eh,  35h, 0B2h,	   6,  30h,  2Fh, 0B5h,	 12h, 0B4h,  1Eh, 0FEh,	 0Dh, 0FDh
		db   0Ah, 0A8h,	 24h, 0A7h,    4,  28h,	 70h, 0ABh,  24h, 0A6h,	   4, 0F0h,    8, 0ABh,	 24h, 0AAh
		db     4,  2Bh,	 70h, 0AEh,  24h, 0A9h,	   4, 0F0h,    8, 0AEh,	 24h, 0ADh,    4,  2Eh,	 70h, 0B1h
		db   24h, 0ACh,	   4, 0F0h,    8, 0B1h,	   6,  70h, 0ACh,    4,	 2Ch,  70h, 0FCh,    4,	0B3h,  30h
		db  0B3h,  18h,	0FCh,	 1, 0B3h,  24h,	0B2h,	 4,  33h,  70h,	0B6h,  24h, 0B1h,    4,	0F0h,	 8
		db  0B6h,    6,	 70h, 0B1h,    4,  31h,	 70h, 0FCh,    4, 0B8h,	 30h, 0B8h,  18h, 0BAh,	0C0h, 0FCh
		db     1, 0ABh,	 12h, 0AAh,    6, 0F0h,	 0Ch, 0ADh,  12h, 0ACh,	   6, 0F0h,  0Ch, 0AFh,	 12h, 0AEh
		db     6, 0F0h,	 0Ch, 0B1h,  12h, 0B0h,	   6, 0F0h,  0Ch,  36h,	0B6h,	 4, 0F0h,  0Eh,	0B6h,  0Ch
		db  0F0h,    6,	0B6h,  18h, 0F8h, 0A1h
MUSIC_2A_YM2:	db  0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	0F8h,  20h, 0FEh,    5,	0FDh,  0Ah,  95h,    6,	 70h,  17h
					; DATA XREF: ROM:B0D1o
		db   70h,  18h,	0F0h,  42h, 0F0h,  54h,	 95h,	 6,  17h,  18h,	 70h,  1Ch,  70h, 0A8h,	 0Ch, 0A7h
		db     6, 0F0h,	 36h, 0F0h,  54h,  95h,	   6,  17h, 0F8h,  40h,	 98h,	 6,  70h,  1Ch,	 70h, 0A8h
		db   0Ch, 0A7h,	   6,  70h, 0A9h,  0Ch,	0AAh,	 6,  70h, 0ABh,	 0Ch, 0ACh,    6,  70h,	0F0h,  60h
		db  0FEh,  0Dh,	0FDh,	 9, 0AEh,  1Eh,	0F0h,	 6, 0AAh,    4,	 2Ah,  70h, 0AEh,    3,	0F0h,	 9
		db  0AAh,    4,	 2Ah,  70h, 0B0h,  1Eh,	0F0h,	 6, 0AAh,    4,	 2Ah,  70h, 0AEh,    3,	0F0h,	 9
		db  0AAh,    4,	 2Ah,  70h, 0AEh,    3,	0F0h,	 9, 0AAh,    4,	 2Ah,  70h, 0B0h,  1Eh,	0F0h,	 6
		db  0AAh,    4,	 2Ah,  70h, 0AEh,  1Eh,	0AEh,	 6, 0AAh,    4,	 2Ah,  70h, 0B0h,    3,	0F0h,	 9
		db  0AAh,    4,	 2Ah,  70h, 0AEh,    3,	0F0h,	 9, 0AAh,    4,	 2Ah,  70h, 0B0h,  48h,	0F8h, 0A0h
		db  0F8h,  60h,	 98h,	 6,  70h,  1Ch,	 70h, 0A8h,  0Ch, 0A7h,	   6,  70h,  23h,  70h,	0A9h,  0Ch
		db  0AAh,    6,	 70h,  26h,  70h, 0ABh,	 0Ch, 0ACh,    6,  70h,	 28h,  70h,  2Dh, 0F0h,	 36h, 0FEh
		db   0Dh, 0FDh,	   9, 0B1h,  1Eh, 0F0h,	   6, 0ADh,    4,  2Dh,	 70h, 0B1h,    3, 0F0h,	   9, 0ADh
		db     4,  2Dh,	 70h, 0B3h,  1Eh, 0F0h,	   6, 0ADh,    4,  2Dh,	 70h, 0B1h,    3, 0F0h,	   9, 0ADh
		db     4,  2Dh,	 70h, 0B1h,    3, 0F0h,	   9, 0ADh,    4,  2Dh,	 70h, 0B3h,  1Eh, 0F0h,	   6, 0ADh
		db     4,  2Dh,	 70h, 0B1h,  1Eh, 0F0h,	   6, 0ADh,    4,  2Dh,	 70h, 0B3h,    3, 0F0h,	   9, 0ADh
		db     4,  2Dh,	 70h, 0B1h,    3, 0F0h,	   9, 0ADh,    4,  2Dh,	 70h, 0B3h,  24h,  70h,	0FEh,  1Fh
		db  0FDh,    8,	0FCh,	 5, 0F8h, 0C3h,	0FAh,  80h, 0A1h,    6,	 21h, 0FAh,  40h,  28h,	0FAh,  80h
		db   21h,  21h,	0FAh,  40h,  2Bh, 0FAh,	 80h,  21h,  21h, 0FAh,	 40h,  28h, 0FAh,  80h,	 21h,  21h
		db  0FAh,  40h,	 2Bh, 0FAh,  80h,  21h,	 21h, 0FAh,  40h,  2Ah,	0FAh,  80h,  21h, 0F8h,	0E0h, 0F8h
		db  0C1h, 0FAh,	 80h, 0A6h,    6,  26h,	0FAh,  40h,  2Dh, 0FAh,	 80h,  26h,  26h, 0FAh,	 40h,  30h
		db  0FAh,  80h,	 26h,  26h, 0FAh,  40h,	 2Dh, 0FAh,  80h,  26h,	 26h, 0FAh,  40h,  30h,	0FAh,  80h
		db   26h,  26h,	0FAh,  40h,  2Fh, 0FAh,	 80h,  26h, 0F8h, 0E0h,	0FAh,  80h,  9Fh,    6,	 1Fh, 0FAh
		db   40h,  26h,	0FAh,  80h,  1Fh,  1Fh,	0FAh,  40h,  29h, 0FAh,	 80h,  1Fh,  1Fh, 0FAh,	 40h,  26h
		db  0FAh,  80h,	 1Fh,  1Fh, 0FAh,  40h,	 29h, 0FAh,  80h,  1Fh,	 1Fh, 0FAh,  40h,  26h,	0FAh,  80h
		db   1Fh, 0FAh,	 80h,  28h,  28h, 0FAh,	 40h,  2Eh, 0FAh,  80h,	 28h,  28h, 0FAh,  40h,	 32h, 0FAh
		db   80h,  28h,	 28h, 0FAh,  40h,  2Eh,	0FAh,  80h,  28h,  28h,	0FAh,  40h,  34h, 0FAh,	 80h,  28h
		db   28h, 0FAh,	 40h,  32h, 0FAh,  80h,	 28h, 0FEh,  1Ah, 0FDh,	 0Ah, 0FCh,    1, 0FAh,	0C0h, 0A5h
		db   12h,  26h,	0A8h,  0Ch, 0A4h,  12h,	 26h, 0A7h,  0Ch, 0A3h,	 12h,  24h, 0A6h,  0Ch,	0A2h,  12h
		db   24h, 0A5h,	 0Ch, 0FEh,  0Dh, 0FDh,	   9,  70h, 0A4h,    6,	0A4h,	 4, 0F0h,    8,	0A4h,  12h
		db  0F0h,  0Ch,	0A6h,	 6, 0A6h,    4,	0F0h,	 8, 0A6h,  12h,	0F0h,  0Ch, 0A6h,    6,	0A6h,	 4
		db  0F0h,    8,	0A6h,  12h, 0F0h,  0Ch,	0A9h,	 6, 0A9h,    4,	0F0h,	 8, 0A9h,  12h,	0F0h,  0Ch
		db  0A9h,    6,	0A9h,	 4, 0F0h,    8,	0A9h,  12h, 0F0h,  0Ch,	0A9h,	 6, 0A9h,    4,	0F0h,	 8
		db  0A9h,  12h,	0ACh,	 6,  70h, 0A7h,	   4,  27h,  70h, 0FCh,	   4, 0AEh,  30h, 0AEh,	 18h, 0FCh
		db     1, 0F0h,	 0Ch, 0AEh,    6, 0AEh,	   4, 0F0h,    8, 0AEh,	 12h, 0F0h,  0Ch, 0AEh,	   6, 0AEh
		db     4, 0F0h,	   8, 0AEh,  12h, 0B1h,	   6,  70h, 0ACh,    4,	 2Ch,  70h, 0FCh,    4,	0B3h,  30h
		db  0B3h,  18h,	0B5h, 0C0h, 0FCh,    1,	0A6h,  12h, 0A5h,    6,	0F0h,  0Ch, 0A8h,  12h,	0A7h,	 6
		db  0F0h,  0Ch,	0AAh,  12h, 0A9h,    6,	0F0h,  0Ch, 0ACh,  12h,	0ABh,	 6, 0F0h,  0Ch,	 31h, 0B1h
		db     4, 0F0h,	 0Eh, 0B1h,  0Ch, 0F0h,	   6, 0B1h,  18h, 0F8h,	0A1h
MUSIC_2A_YM3:	db  0FCh,    1,	0F8h,	 0, 0F8h,  20h,	0F0h,  3Ch, 0FAh,  80h,	0FBh,  10h, 0FEh,  15h,	0FDh,  0Bh
					; DATA XREF: ROM:B0D3o
		db   95h, 0D8h,	 95h,  6Ch, 0F0h,  90h,	0FAh, 0C0h, 0FCh,    0,	0FEh,  3Eh, 0FDh,    1,	0A1h,	 3
		db  0FDh,    0,	 21h, 0FDh,    1,  21h,	0FDh,	 2,  21h, 0FDh,	   3,  21h, 0FDh,    4,	 21h, 0FDh
		db     5,  21h,	0FDh,	 6,  21h, 0FDh,	   7,  21h, 0FDh,    8,	 21h, 0FDh,    9,  21h,	0FDh,  0Ah
		db   21h, 0FDh,	 0Bh,  21h, 0FDh,  0Ch,	 21h, 0FDh,  0Dh,  21h,	 21h, 0FBh,  2Ch, 0F8h,	 40h, 0FEh
		db   0Dh, 0FDh,	   9, 0ACh,  1Eh, 0F0h,	   6, 0A8h,    4,  28h,	 70h, 0ACh,    3, 0F0h,	   9, 0A8h
		db     4,  28h,	 70h, 0ACh,  1Eh, 0F0h,	   6, 0A8h,    4,  28h,	 70h, 0ACh,    3, 0F0h,	   9, 0A8h
		db     4,  28h,	 70h, 0ACh,    3, 0F0h,	   9, 0A8h,    4,  28h,	 70h, 0ACh,  1Eh, 0F0h,	   6, 0A8h
		db     4,  28h,	 70h, 0ACh,  1Eh, 0F0h,	   6, 0A8h,    4,  28h,	 70h, 0ACh,    3, 0F0h,	   9, 0A8h
		db     4,  28h,	 70h, 0ACh,    3, 0F0h,	   9, 0A8h,    4,  28h,	 70h, 0ACh,  48h, 0F8h,	0A0h, 0F8h
		db   60h, 0FEh,	 0Dh, 0FDh,    9, 0AFh,	 1Eh, 0F0h,    6, 0ABh,	   4,  2Bh,  70h, 0AFh,	   3, 0F0h
		db     9, 0ABh,	   4,  2Bh,  70h, 0AFh,	 1Eh, 0F0h,    6, 0ABh,	   4,  2Bh,  70h, 0AFh,	   3, 0F0h
		db     9, 0ABh,	   4,  2Bh,  70h, 0AFh,	   3, 0F0h,    9, 0ABh,	   4,  2Bh,  70h, 0AFh,	 1Eh, 0F0h
		db     6, 0ABh,	   4,  2Bh,  70h, 0AFh,	 1Eh, 0F0h,    6, 0ABh,	   4,  2Bh,  70h, 0AFh,	   3, 0F0h
		db     9, 0ABh,	   4,  2Bh,  70h, 0AFh,	   3, 0F0h,    9, 0ABh,	   4,  2Bh,  70h, 0AFh,	 24h, 0F0h
		db     6, 0FEh,	 1Ch, 0F9h,  20h, 0FDh,	   8, 0A7h,    0, 0FCh,	 85h, 0A8h,  18h, 0FCh,	0FFh, 0A8h
		db     6,  70h,	0A8h,  1Eh, 0A4h,    6,	 21h,  20h, 0AAh,    0,	0FCh,  8Ah, 0ABh,  12h,	0FCh, 0FFh
		db  0AAh,  3Ch,	0F0h,	 6, 0AAh,    4,	 2Bh,  2Ch, 0ADh,  12h,	 28h, 0A4h,  0Ch, 0ACh,	   0, 0FCh
		db   90h, 0AFh,	 28h, 0FCh, 0FFh, 0FCh,	 80h, 0B0h,    4,  2Fh,	0FCh,	 1, 0ACh,  66h,	0F0h,	 6
		db  0FCh,  88h,	0ADh,  18h, 0FCh, 0FFh,	0ADh,	 6,  70h, 0ADh,	 1Eh, 0A9h,    6,  26h,	 25h, 0A8h
		db   12h, 0A9h,	 3Ch, 0F0h,    6, 0FCh,	 80h, 0A9h,    4,  28h,	0FCh,	 1,  27h, 0A6h,	 12h,  21h
		db  0A6h,  0Ch,	0A3h,  1Eh, 0ABh,  30h,	0F9h,	 0, 0FEh,  0Dh,	0FDh,  0Ah, 0B2h,    4,	 30h,  2Fh
		db  0AEh,  24h,	0B7h,  3Ch, 0FEh,  1Ah,	0FDh,  0Ah, 0ADh,  30h,	0ADh,  24h, 0ADh,    6,	 2Ch, 0ABh
		db   30h,  2Bh,	0FEh,  0Dh, 0FDh,    9,	0F0h,  0Ch, 0A0h,    6,	0A0h,	 4, 0F0h,    8,	0A0h,  12h
		db  0F0h,  0Ch,	0A0h,	 6, 0A0h,    4,	0F0h,	 8, 0A0h,  12h,	0F0h,  0Ch, 0A2h,    6,	0A2h,	 4
		db  0F0h,    8,	0A2h,  12h, 0F0h,  0Ch,	0A4h,	 6, 0A4h,    4,	0F0h,	 8, 0A4h,  12h,	0F0h,  0Ch
		db  0A5h,    6,	0A5h,	 4, 0F0h,    8,	0A5h,  12h, 0F0h,  0Ch,	0A5h,	 6, 0A5h,    4,	0F0h,	 8
		db  0A5h,  12h,	0A7h,	 6,  70h, 0A5h,	   4,  25h,  70h, 0FCh,	   4, 0ACh,  30h, 0ACh,	 18h, 0FCh
		db     1, 0F0h,	 0Ch, 0AAh,    6, 0AAh,	   4, 0F0h,    8, 0AAh,	 12h, 0F0h,  0Ch, 0AAh,	   6, 0AAh
		db     4, 0F0h,	   8, 0AAh,  12h, 0ACh,	   6,  70h, 0AAh,    4,	 2Ah,  70h, 0FCh,    4,	0B1h,  30h
		db  0B1h,  18h,	0B3h, 0C0h, 0FCh,    1,	0A0h,  12h, 0A3h,    6,	0F0h,  0Ch, 0A2h,  12h,	0A5h,	 6
		db  0F0h,  0Ch,	0A4h,  12h, 0A7h,    6,	0F0h,  0Ch, 0A6h,  12h,	0A9h,	 6, 0F0h,  0Ch,	 2Dh, 0ADh
		db     4, 0F0h,	 0Eh, 0ADh,  0Ch, 0F0h,	   6, 0ADh,  18h, 0F8h,	0A1h
MUSIC_2A_YM4:	db  0FCh,    1,	0F8h,	 0, 0FBh,  2Ch,	0F8h,  20h, 0FEh,  34h,	0FDh,  0Ch,  89h,    6,	 70h,  0Bh
					; DATA XREF: ROM:B0D5o
		db   70h,  0Ch,	0F0h,  42h, 0F0h,  54h,	0FCh,  80h,  89h,    6,	0FCh,	 1,  0Bh,  0Ch,	 70h,  10h
		db   70h, 0FDh,	 0Bh, 0FCh,  80h,  95h,	 0Ch, 0FCh,    1,  97h,	   6, 0F0h,  36h, 0F0h,	 54h, 0FDh
		db   0Ch, 0FCh,	 80h,  89h,    6, 0FCh,	   1,  0Bh, 0F8h,  40h,	 8Ch,	 6,  70h,  10h,	 70h, 0FDh
		db   0Bh, 0FCh,	 80h,  95h,  0Ch, 0FCh,	   1,  97h,    6,  70h,	0FCh,  80h,  99h,  0Ch,	0FCh,	 1
		db   9Ah,    6,	 70h, 0FCh,  80h,  9Bh,	 0Ch, 0FCh,    1,  9Ch,	   6,  70h, 0F0h,  60h,	0FDh,  0Ch
		db   84h,  18h,	0FCh,	 4,  90h,  20h,	 8Fh,	 8,  0Eh,  0Dh,	 0Ch,  0Bh, 0FCh,    1,	 84h,  18h
		db   90h,  24h,	0FCh,  80h,  89h,    4,	0FCh,	 1,  0Bh,  70h,	0FCh,  80h,  8Eh,  12h,	0FCh,	 1
		db   8Bh,    6,	 84h,  18h, 0FCh,    4,	 90h,  20h,  8Fh,    8,	 0Eh,  0Dh,  0Ch,  0Bh,	0FCh,	 1
		db   84h,  18h,	 10h, 0FCh,  80h,  96h,	   6, 0FCh,    1,  17h,	 70h,  93h,    0, 0FCh,	 85h,  94h
		db   1Eh, 0FCh,	0FFh, 0F8h, 0A0h, 0F8h,	 60h,  8Ch,    6,  70h,	 10h,  70h, 0FDh,  0Bh,	0FCh,  80h
		db   95h,  0Ch,	0FCh,	 1,  97h,    6,	0F0h,  12h, 0FCh,  80h,	 99h,  0Ch, 0FCh,    1,	 9Ah,	 6
		db  0F0h,  12h,	0FCh,  80h,  9Bh,  0Ch,	0FCh,	 1,  9Ch,    6,	0F0h,  12h, 0FDh,  0Ch,	0FBh,  95h
		db   9Dh,  3Ch,	0FBh,  2Ch,  87h,  18h,	0FCh,	 4,  93h,  20h,	 92h,	 8,  11h,  10h,	 0Fh,  0Eh
		db  0FCh,    1,	 87h,  18h,  93h,  24h,	0FCh,  80h,  90h,    4,	 11h, 0FCh,    1,  12h,	 93h,  18h
		db     7, 0FCh,	   4,  93h,  20h,  92h,	   8,  11h,  10h,  11h,	 12h,  93h,  10h,  11h,	 0Dh,  0Bh
		db     7,    5,	0FDh,  0Bh, 0F8h, 0C2h,	0FCh,	 1,  89h,    6,	 70h,  0Bh,  70h,  0Ch,	0F0h,  18h
		db  0FCh,  80h,	 8Ah,	 6, 0FCh,    1,	 0Bh,  70h,  0Ch,  70h,	 88h,  0Ch, 0F8h, 0E0h,	 89h,	 6
		db   70h,  0Bh,	 70h,  0Ch, 0F0h,  18h,	0FCh,  80h,  8Ah,    6,	0FCh,	 1,  0Bh,  70h,	 0Ch,  70h
		db   90h,  0Ch,	 8Eh,	 6,  70h,  10h,	 70h,  11h, 0F0h,  18h,	0FCh,  80h,  8Fh,    6,	0FCh,	 1
		db   10h,  70h,	 11h,  70h,  8Dh,  0Ch,	 8Eh,	 6,  70h,  10h,	 70h,  11h, 0F0h,  18h,	0FCh,  80h
		db   8Fh,    6,	0FCh,	 1,  10h,  70h,	 11h,  70h,  92h,  0Ch,	 93h,	 6,  70h,  15h,	 70h,  17h
		db  0F0h,  18h,	0FCh,  80h,  94h,    6,	0FCh,	 1,  15h,  70h,	 17h,  70h,  91h,  0Ch,	 90h,	 6
		db   70h,  11h,	 70h,  13h, 0F0h,  18h,	0FCh,  80h,  90h,    6,	0FCh,	 1,  11h,  70h,	 13h,  70h
		db   90h,  0Ch,	 89h,  12h,  90h,    6,	 70h,  89h,  12h,  0Eh,	 95h,	 6,  70h,  8Eh,	 12h,	 7
		db   8Eh,    6,	 70h,  87h,  12h,  0Ch,	 93h,	 6,  70h,  8Ch,	 12h,  91h,    6,  70h,	 11h, 0F0h
		db   0Ch,  91h,	 12h,  90h,    6,  70h,	 10h, 0F0h,  0Ch,  90h,	 12h,  8Fh,    6,  70h,	 0Fh, 0F0h
		db   0Ch,  8Fh,	 12h,  8Eh,    6,  70h,	 0Eh, 0F0h,  0Ch,  8Eh,	 12h,  0Bh,  8Bh,    6,	 70h, 0FCh
		db   80h,  91h,	 0Ch, 0FCh,    1,  8Fh,	   6,  8Bh,  12h,  8Bh,	   6,  70h,  97h,  0Ch,	 8Ah,	 6
		db   8Bh,  12h,	 8Bh,	 4, 0F0h,    8,	0FCh,  80h,  91h,  0Ch,	0FCh,	 1,  8Fh,    6,	 8Bh,  12h
		db   8Bh,    4,	0F0h,	 8,  97h,  0Ch,	 8Bh,	 6,  90h,  12h,	 90h,	 4, 0F0h,    8,	0FCh,  80h
		db   96h,  0Ch,	0FCh,	 1,  94h,    6,	 90h,  12h,  90h,    4,	0F0h,	 8,  9Ch,  0Ch,	 8Fh,	 6
		db   90h,  12h,	 90h,	 4, 0F0h,    8,	0FCh,  80h,  96h,  0Ch,	0FCh,	 1,  94h,    6,	 90h,  12h
		db   90h,    4,	0F0h,	 8,  9Ch,  0Ch,	 90h,	 6,  70h, 0FDh,	 0Ch,  0Fh,  14h,  16h,	0FCh,  80h
		db   19h, 0FCh,	   1,  16h,  70h,  98h,	   0, 0FCh,  99h, 0FCh,	 80h,  9Bh,    6, 0FCh,	0A9h, 0FCh
		db     1,  8Fh,	 0Ch, 0FCh, 0FFh,  94h,	   6,  16h,  19h,  16h,	0FCh,  80h,  1Bh, 0FCh,	   1,  19h
		db  0FCh,  80h,	 1Eh, 0FCh,    1,  1Dh,	 20h, 0FCh, 0C0h, 0A5h,	 0Ch, 0FCh, 0FFh, 0A2h,	   6,  21h
		db   1Dh,  9Bh,	   4,  1Ah,  16h,  15h,	 14h,  10h,  8Fh,    0,	0FCh, 0B7h, 0FCh,  80h,	 9Bh,  0Ch
		db  0FCh,    1,	 0Fh, 0FCh, 0FFh,  70h,	 0Bh,  84h,    6, 0F0h,	 12h,  8Dh,  0Ch,  86h,	   6, 0F0h
		db   12h,  8Fh,	 0Ch,  88h,    6, 0F0h,	 12h,  91h,  0Ch,  8Ah,	   6,  70h,  87h,  0Ch,	 93h,	 6
		db  0F0h,  0Ch,	 87h,  12h, 0FBh, 0D4h,	 93h,  18h, 0F8h, 0A1h
MUSIC_2A_YM5:	db  0FCh,    0,	0FBh,	 0, 0F8h,    0,	0F8h, 0C5h, 0FEh,  3Dh,	0FDh,  0Ch,  92h,    6,	0FDh,	 8
					; DATA XREF: ROM:B0D7o
		db   12h,  12h,	 12h, 0FDh,  0Ch,  12h,	0FDh,	 8,  12h,  12h,	 12h, 0FDh,  0Ch,  12h,	0FDh,	 8
		db   12h,  12h,	 12h, 0FDh,  0Ch,  12h,	0FDh,	 8,  12h,  12h,	 12h, 0F8h, 0E0h, 0F8h,	0C3h, 0FEh
		db   3Eh, 0FDh,	 0Ah,  96h,  0Ch, 0FEh,	 3Dh, 0FDh,    8,  92h,	   6,  12h, 0FEh,  3Eh,	0FDh,  0Ah
		db   96h,  0Ch,	0FEh,  3Dh, 0FDh,    8,	 92h,	 6,  12h, 0FEh,	 3Eh, 0FDh,  0Ah,  96h,	 0Ch, 0FEh
		db   3Dh, 0FDh,	   8,  92h,    6,  12h,	0FEh,  3Eh, 0FDh,  0Ah,	 96h,  0Ch, 0FEh,  3Dh,	0FDh,	 8
		db   92h,    6,	 12h, 0F8h, 0E0h, 0F8h,	0C5h, 0FDh,  0Ch,  92h,	   6, 0FDh,    8,  12h,	 12h,  12h
		db  0FDh,  0Ch,	 12h, 0FDh,    8,  12h,	 12h,  12h, 0FDh,  0Ch,	 12h, 0FDh,    8,  12h,	 12h,  12h
		db  0FDh,  0Ch,	 12h, 0FDh,    8,  12h,	 12h,  12h, 0F8h, 0E0h,	0F8h, 0C3h, 0FEh,  3Eh,	0FDh,  0Ah
		db   96h,  0Ch,	0FEh,  3Dh, 0FDh,    8,	 92h,	 6,  12h, 0FEh,	 3Eh, 0FDh,  0Ah,  96h,	 0Ch, 0FEh
		db   3Dh, 0FDh,	   8,  92h,    6,  12h,	0FEh,  3Eh, 0FDh,  0Ah,	 96h,  0Ch, 0FEh,  3Dh,	0FDh,	 8
		db   92h,    6,	 12h, 0FEh,  3Eh, 0FDh,	 0Ah,  96h,  0Ch, 0FEh,	 3Dh, 0FDh,    8,  92h,	   6,  12h
		db  0F8h, 0E0h,	0F8h, 0C7h, 0FDh,  0Ch,	 92h,	 6, 0FDh,    8,	 12h,  12h,  12h, 0FDh,	 0Ch,  12h
		db  0FDh,    8,	 12h,  12h,  12h, 0FDh,	 0Ch,  12h, 0FDh,    8,	 12h,  12h, 0FEh,  3Eh,	0FDh,  0Ah
		db   96h,  0Ch,	0FEh,  3Dh, 0FDh,    8,	 92h,	 6,  12h,  12h,	0F8h, 0E0h, 0F8h, 0C1h,	0FEh,  3Eh
		db  0FDh,  0Ah,	 96h,  0Ch, 0FEh,  3Dh,	0FDh,	 8,  92h,    6,	0FEh,  3Eh, 0FDh,  0Ah,	 96h,  0Ch
		db  0FEh,  3Dh,	0FDh,	 8,  92h,    6,	0FDh,  0Ch,  92h,  0Ch,	0FEh,  3Eh, 0FDh,  0Ah,	 16h, 0FEh
		db   3Dh, 0FDh,	   8,  92h,    6, 0FEh,	 3Eh, 0FDh,  0Ah,  96h,	 0Ch, 0FEh,  3Dh, 0FDh,	   8,  92h
		db     6, 0FDh,	 0Ch,  92h,  0Ch, 0F8h,	0E0h, 0F8h, 0C2h, 0FDh,	 0Ch,  92h,    6, 0FDh,	   8,  12h
		db   12h,  12h,	 12h, 0FEh,  3Eh, 0FDh,	 0Ah,  96h,  0Ch, 0FEh,	 3Dh, 0FDh,    8,  92h,	   6, 0FDh
		db   0Ch,  12h,	0FDh,	 8,  12h,  12h,	 12h,  12h, 0FEh,  3Eh,	0FDh,  0Ah,  96h,  0Ch,	0FEh,  3Dh
		db  0FDh,    8,	 92h,	 6, 0F8h, 0E0h,	0FDh,  0Ch,  92h,    6,	0FDh,	 8,  12h,  12h,	 12h, 0FEh
		db   3Eh, 0FDh,	 0Ah,  96h,  0Ch, 0FEh,	 3Dh, 0FDh,    8,  92h,	   6,  12h, 0FDh,  0Ch,	 12h, 0FDh
		db     8,  12h,	 12h,  12h, 0FEh,  3Eh,	0FDh,  0Ah,  96h,  0Ch,	0FEh,  3Dh, 0FDh,    8,	 92h,	 6
		db   12h, 0FDh,	 0Ch,  12h, 0FDh,    8,	 12h,  12h,  12h,  12h,	0FEh,  3Eh, 0FDh,  0Ah,	 96h,  0Ch
		db  0FEh,  3Dh,	0FDh,	 8,  92h,    6,	0FDh,  0Ch,  12h, 0FDh,	   8,  12h,  12h,  12h,	 12h, 0FEh
		db   3Eh, 0FDh,	 0Ah,  96h,  0Ch, 0FEh,	 3Dh, 0FDh,    8,  92h,	   6, 0FDh,  0Ch,  12h,	0FDh,	 8
		db   12h,  12h,	 12h, 0FEh,  3Eh, 0FDh,	 0Ah,  96h,  0Ch, 0FEh,	 3Dh, 0FDh,    8,  92h,	   6,  12h
		db  0FDh,  0Ch,	 12h, 0FDh,    8,  12h,	 12h,  12h, 0FEh,  3Eh,	0FDh,  0Ah,  96h,  0Ch,	0FEh,  3Dh
		db  0FDh,    8,	 92h,	 6,  12h, 0F0h,	0C0h, 0F8h, 0C1h, 0FEh,	 3Eh, 0FDh,  0Ah,  96h,	 12h, 0FEh
		db   3Dh, 0FDh,	 0Ch,  92h,  0Ch, 0FDh,	   8,  92h,    6, 0FEh,	 3Eh, 0FDh,  0Ah,  96h,	 12h, 0FEh
		db   3Dh, 0FDh,	 0Ch,  92h,  0Ch, 0FDh,	   8,  92h,    6, 0F8h,	0E0h, 0FDh,  0Ch,  92h,	   6, 0FDh
		db     8,  12h,	0FDh,  0Ch,  92h,  0Ch,	 92h,	 6, 0FEh,  3Eh,	0FDh,  0Ah,  96h,  12h,	 96h,  18h
		db  0F8h, 0A1h
MUSIC_2A_YM6:	db  0F8h,    0,	0FAh, 0C0h, 0F0h,  24h,	 80h,	 6,  80h,  96h,	0F0h,  3Ch,  80h,    6,	 80h,  7Eh
					; DATA XREF: ROM:B0D9o
		db  0F0h,  60h,	0F0h,  24h,  80h,    6,	 80h,  12h,  80h,    6,	 80h,  0Ch,  81h,  12h,	 85h,  18h
		db   81h,  20h,	0FAh,  80h,  82h,    8,	0FAh, 0C0h,    3,    3,	0FAh,  40h,    4,    4,	0FAh, 0C0h
		db   80h,  18h,	 81h,  24h,  80h,  12h,	 81h,  0Ch,  80h,    6,	 85h,  18h,  81h,  20h,	0FAh,  80h
		db   82h,    8,	0FAh, 0C0h,    3,    3,	0FAh,  40h,    4,    4,	0FAh, 0C0h,  80h,  18h,	 81h,  24h
		db   81h,    6,	 81h,  0Ch,  81h,  12h,	 80h,  24h,  80h,    6,	 80h,  36h,  80h,  24h,	 80h,	 6
		db   80h,  42h,	 80h,  30h,  80h,    6,	 80h,  2Ah,  80h,  18h,	 80h,	 6,  80h,  42h,	 80h,  24h
		db     0,  80h,	 18h,	 0,  80h,    6,	   0,	 1, 0FAh,  80h,	   2, 0FAh, 0C0h,    3,	0FAh,  40h
		db     4, 0FAh,	0C0h,	 1,  81h,  0Ch,	 80h,	 6,  85h,  18h,	 81h,  20h, 0FAh,  80h,	 82h,	 8
		db  0FAh, 0C0h,	   3,	 3, 0FAh,  40h,	   4,	 4, 0FAh, 0C0h,	 80h,  18h,  81h,  24h,	 80h,  12h
		db   81h,  0Ch,	 80h,	 6,  85h,  18h,	 81h,  20h, 0FAh,  80h,	 82h,	 8, 0FAh, 0C0h,	   3,	 3
		db  0FAh,  40h,	   4,	 4, 0FAh, 0C0h,	 80h,  18h,  81h,  24h,	 81h,	 6,  81h,  0Ch,	 81h,  12h
		db  0F8h, 0C3h,	0F0h,  0Ch,  80h,  18h,	 80h,	 6,  80h,  42h,	 80h,  18h,  80h,    6,	 80h,  24h
		db   81h,  12h,	0F8h, 0E0h, 0F8h, 0C1h,	 80h,  12h,  80h,  1Eh,	 80h,  12h,    0,  81h,	 0Ch, 0F8h
		db  0E0h, 0F8h,	0C1h,  80h,  0Ch,  80h,	 12h,	 1,  80h,  0Ch,	 80h,  12h,  81h,  0Ch,	 80h,	 6
		db  0F8h, 0E0h,	 80h,  0Ch,  80h,  12h,	 81h,  0Ch, 0FAh,  40h,	 84h,	 6, 0FAh, 0C0h,	 80h,  0Ch
		db   80h,    6,	0FAh,  80h,  82h,  0Ch,	0FAh, 0C0h,  83h,    6,	 80h,  0Ch,    0,    1,	 85h,  12h
		db  0FAh,  80h,	 82h,  0Ch, 0FAh, 0C0h,	 83h,	 6, 0FAh,  40h,	   4, 0FAh, 0C0h,    0,	 81h,  18h
		db   80h,  0Ch,	 80h,  12h,  81h,  0Ch,	0FAh,  40h,  84h,    6,	0FAh, 0C0h,  80h,  0Ch,	 80h,	 6
		db  0FAh,  80h,	 82h,  0Ch, 0FAh, 0C0h,	 83h,	 6,  80h,  0Ch,	 80h,  18h,  85h,  12h,	 81h,  0Ch
		db   81h,    6,	   1,	 0,    1,  81h,	 12h,  85h,  60h, 0FAh,	 80h,  82h,    6,  82h,	 0Ch, 0FAh
		db  0C0h,  83h,	   6,  83h,  0Ch, 0FAh,	 80h,  82h,    6,  82h,	 0Ch, 0FAh,  40h,  84h,	   6,  84h
		db   0Ch, 0FAh,	0C0h,	 1,    0, 0F8h,	0C1h, 0F0h,  0Ch,    0,	 80h,  18h,  80h,  0Ch,	   0, 0F8h
		db  0E0h,  80h,	 0Ch,  81h,  12h,    0,	 81h,  0Ch,    1, 0F8h,	0A1h
MUSIC_2A_PSG1:	db  0FCh,    1,	0FBh,  4Ch, 0F8h,    0,	0FDh,	 0, 0F8h, 0C5h,	0F0h,  60h, 0F8h, 0E0h,	0F8h, 0C2h
					; DATA XREF: ROM:B0DBo
		db  0FDh,  7Bh,	0A8h,	 4,  2Ch,  2Eh,	 32h,  34h,  38h,  3Ah,	 38h,  34h,  32h,  2Eh,	 2Ch,  2Eh
		db   32h,  34h,	 38h,  3Ah,  3Eh,  40h,	 3Eh,  3Ah,  38h,  34h,	 32h, 0F8h, 0E0h, 0A8h,	   4,  2Ch
		db   2Eh,  32h,	 34h,  38h,  3Ah,  38h,	 34h,  32h,  2Eh,  2Ch,	 2Eh,  32h,  34h,  38h,	 3Ah,  3Eh
		db  0C0h,    3,	 3Eh,  40h,  3Eh,  40h,	 3Eh,  40h,  3Eh, 0FDh,	 0Bh, 0A1h,    6,  70h,	 23h,  70h
		db   24h,  70h,	0FDh,	 0, 0F0h,  3Ch,	0F0h,  54h, 0FDh,  0Bh,	0A1h,	 6,  23h,  24h,	 70h,  28h
		db   70h, 0ABh,	 0Ch, 0AAh,    6,  70h,	0FDh,	 0, 0F0h,  30h,	0F0h,  54h, 0FDh,  0Bh,	0A1h,	 6
		db   23h,  24h,	 70h,  28h,  70h, 0ABh,	 0Ch, 0AAh,    6,  70h,	 27h,  70h, 0ADh,  0Ch,	0ACh,	 6
		db   70h,  29h,	 70h, 0AFh,  0Ch, 0AEh,	   6,  70h,  2Bh,  70h,	 31h,  70h, 0FDh,    0,	0F0h,  30h
		db  0F8h, 0C2h,	0FDh,  7Bh, 0ABh,    4,	 2Fh,  31h,  35h,  37h,	 3Bh,  3Dh,  3Bh,  37h,	 35h,  31h
		db   2Fh,  31h,	 35h,  37h,  3Bh,  3Dh,	 41h,  43h,  41h,  3Dh,	 3Bh,  37h,  35h, 0F8h,	0E0h, 0ABh
		db     4,  2Fh,	 31h,  35h,  37h,  3Bh,	 3Dh,  3Bh,  37h,  35h,	 31h,  2Fh,  31h,  35h,	 37h,  3Bh
		db   3Dh,  41h,	0C3h,	 3,  41h,  43h,	 41h,  43h,  41h,  43h,	 41h, 0F8h, 0C1h, 0FDh,	   0, 0F0h
		db     6, 0FDh,	 1Ah,  2Dh,  34h,  70h,	 34h,  2Dh,  70h,  2Dh,	 70h,  2Dh,  34h, 0F0h,	 24h, 0ADh
		db     6,  34h,	 70h,  34h,  2Dh,  70h,	 2Dh,  70h,  2Dh,  34h,	 70h,  34h, 0ADh,  12h,	0F8h, 0E0h
		db  0F0h,    6,	 32h,  39h,  70h,  39h,	 32h,  70h,  32h,  70h,	 32h,  39h, 0F0h,  24h,	0B2h,	 6
		db   39h,  70h,	 39h,  32h,  70h,  32h,	 70h,  32h,  39h,  70h,	 39h, 0B2h,  12h, 0F0h,	   6,  2Bh
		db   32h,  70h,	 32h,  2Bh,  70h,  2Bh,	 70h,  2Bh,  32h, 0F0h,	 24h, 0ABh,    6, 0B2h,	   4, 0F0h
		db     8, 0B2h,	   6,  2Bh,  70h, 0ABh,	   4, 0F0h,    8, 0ABh,	   6, 0B2h,    4, 0F0h,	   8, 0B2h
		db     6, 0ABh,	 12h, 0F0h,  0Ch, 0FDh,	 2Bh, 0A5h,    6,  28h,	 2Bh,  28h,  25h,  28h,	0FDh,	 0
		db  0F0h,  0Ch,	0FDh,  2Bh, 0A4h,    6,	 27h,  2Ah,  27h,  24h,	 27h, 0FDh,    0, 0F0h,	 0Ch, 0FDh
		db   2Bh, 0A3h,	   6,  26h,  29h,  26h,	 23h,  26h, 0FDh,    0,	0F0h,  0Ch, 0FDh,  2Bh,	0A2h,	 6
		db   25h,  28h,	 25h,  22h,  25h, 0F8h,	0C1h, 0FDh,    0, 0F0h,	 48h, 0FDh,  7Bh, 0ABh,	   4,  2Eh
		db   32h,  37h,	 3Ah,  3Eh, 0F8h, 0E0h,	0FDh,	 0, 0F0h,  48h,	0FDh,  7Bh, 0B1h,    4,	 35h,  38h
		db   3Dh,  38h,	 35h, 0FDh,    0, 0F0h,	 18h, 0FDh,  7Bh, 0A7h,	   4,  2Ch,  2Eh,  31h,	 2Eh,  31h
		db   33h,  38h,	 3Ah,  3Dh,  3Ah,  3Dh,	 3Fh,  3Ah,  38h,  33h,	 2Eh,  2Ch, 0FDh,    0,	0F0h,  48h
		db  0FDh,  7Bh,	0B3h,	 4,  36h,  3Ah,	 3Fh,  3Ah,  36h, 0FDh,	   0, 0F0h,  18h, 0FDh,	 7Bh, 0A7h
		db     4,  2Ch,	 2Eh,  31h,  2Eh,  31h,	 33h,  38h,  3Ah,  3Dh,	 3Ah,  3Dh,  3Fh,  3Dh,	 3Ah,  38h
		db   3Ah,  3Dh,	0F8h, 0C7h, 0BFh,    4,	 3Ah,  38h,  33h,  38h,	 3Ah, 0F8h, 0E0h, 0FDh,	   0, 0F0h
		db   12h, 0FDh,	 7Ch, 0ACh,    6, 0FDh,	   0,  70h, 0FDh,  7Ch,	 36h, 0FDh,    0, 0F0h,	 12h, 0FDh
		db   7Ch, 0AEh,	   6, 0FDh,    0,  70h,	0FDh,  7Ch,  38h, 0FDh,	   0, 0F0h,  12h, 0FDh,	 7Ch, 0AEh
		db     6, 0FDh,	   0,  70h, 0FDh,  7Ch,	 38h, 0FDh,    0, 0F0h,	 12h, 0FDh,  7Ch, 0B0h,	   6, 0FDh
		db     0,  70h,	0FDh,  7Ch,  3Ah, 0AFh,	 0Ch, 0AFh,    6, 0FDh,	   0, 0F0h,  0Ch, 0FDh,	 7Ch,  2Fh
		db  0FDh,    0,	0F0h,	 6, 0FDh,  7Ch,	0AFh,  18h, 0F8h, 0A1h
MUSIC_2A_PSG2:	db  0FCh,    1,	0FBh,  4Ch, 0F8h,    0,	0FDh,	 0, 0F8h, 0C5h,	0F0h,  60h, 0F8h, 0E0h,	0F8h, 0C2h
					; DATA XREF: ROM:B0DDo
		db  0FDh,  7Bh,	0A2h,	 4,  26h,  28h,	 2Ch,  2Eh,  32h,  34h,	 32h,  2Eh,  2Ch,  28h,	 26h,  28h
		db   2Ch,  2Eh,	 32h,  34h,  38h,  3Ah,	 38h,  34h,  32h,  2Eh,	 2Ch, 0F8h, 0E0h, 0A2h,	   4,  26h
		db   28h,  2Ch,	 2Eh,  32h,  34h,  32h,	 2Eh,  2Ch,  28h,  26h,	 28h,  2Ch,  2Eh,  32h,	 34h,  38h
		db  0BAh,    3,	 3Ch,  3Ah,  3Ch,  3Ah,	 3Ch,  3Ah,  3Ch, 0FDh,	 0Bh,  95h,    6,  70h,	 17h,  70h
		db   18h,  70h,	0FDh,	 0, 0F0h,  3Ch,	0F0h,  54h, 0FDh,  0Bh,	 95h,	 6,  17h,  18h,	 70h,  1Ch
		db   70h, 0A8h,	 0Ch, 0A7h,    6,  70h,	0FDh,	 0, 0F0h,  30h,	0F0h,  54h, 0FDh,  0Bh,	 95h,	 6
		db   17h,  18h,	 70h,  1Ch,  70h, 0A8h,	 0Ch, 0A7h,    6,  70h,	 23h,  70h, 0A9h,  0Ch,	0AAh,	 6
		db   70h,  26h,	 70h, 0ABh,  0Ch, 0ACh,	   6,  70h,  28h,  70h,	 2Dh,  70h, 0FDh,    0,	0F0h,  30h
		db  0F8h, 0C2h,	0FDh,  7Bh, 0A5h,    4,	 29h,  2Bh,  2Fh,  31h,	 35h,  37h,  35h,  31h,	 2Fh,  2Bh
		db   29h,  2Bh,	 2Fh,  31h,  35h,  37h,	 3Bh,  3Dh,  3Bh,  37h,	 35h,  31h,  2Fh, 0F8h,	0E0h, 0A5h
		db     4,  29h,	 2Bh,  2Fh,  31h,  35h,	 37h,  35h,  31h,  2Fh,	 2Bh,  29h,  2Bh,  2Fh,	 31h,  35h
		db   37h,  3Bh,	0BDh,	 3,  3Fh,  3Dh,	 3Fh,  3Dh,  3Fh,  3Dh,	 3Fh, 0F8h, 0C1h, 0FDh,	   0, 0F0h
		db     6, 0FDh,	 1Ah,  2Bh,  33h,  70h,	 32h,  2Ch,  70h,  2Bh,	 70h,  2Ch,  32h, 0F0h,	 24h, 0ABh
		db     6,  33h,	 70h,  32h,  2Ch,  70h,	 2Bh,  70h,  2Ch,  32h,	 70h,  33h, 0ABh,  12h,	0F8h, 0E0h
		db  0F0h,    6,	 30h,  38h,  70h,  37h,	 31h,  70h,  30h,  70h,	 31h,  37h, 0F0h,  24h,	0B0h,	 6
		db   38h,  70h,	 37h,  31h,  70h,  30h,	 70h,  31h,  37h,  70h,	 38h, 0B0h,  12h, 0F0h,	   6,  29h
		db   31h,  70h,	 30h,  2Ah,  70h,  29h,	 70h,  2Ah,  30h, 0F0h,	 24h, 0A9h,    6,  31h,	 70h,  30h
		db   2Ah,  70h,	 29h,  70h,  2Ah,  30h,	 70h,  31h, 0A9h,  12h,	0F0h,  0Ch, 0FDh,  2Bh,	0A1h,	 6
		db   25h,  28h,	 25h,  21h,  25h, 0FDh,	   0, 0F0h,  0Ch, 0FDh,	 2Bh, 0A1h,    6,  24h,	 27h,  24h
		db   21h,  24h,	0FDh,	 0, 0F0h,  0Ch,	0FDh,  2Bh,  9Fh,    6,	 23h,  26h,  23h,  1Fh,	 23h, 0FDh
		db     0, 0F0h,	 0Ch, 0FDh,  2Bh,  9Fh,	   6,  22h,  25h,  22h,	 1Fh,  22h, 0F8h, 0C1h,	0FDh,	 0
		db  0F0h,  48h,	0FDh,  7Bh, 0A2h,    4,	 26h,  29h,  2Eh,  32h,	 35h, 0F8h, 0E0h, 0FDh,	   0, 0F0h
		db   48h, 0FDh,	 7Bh, 0A9h,    4,  2Ch,	 31h,  35h,  31h,  2Ch,	0FDh,	 0, 0F0h,  24h,	0FDh,  7Bh
		db  0A0h,    4,	 25h,  27h,  2Ah,  27h,	 2Ah,  2Ch,  31h,  33h,	 2Ch,  31h,  33h,  20h,	 25h,  27h
		db  0FDh,    0,	0F0h,  48h, 0FDh,  7Bh,	0AAh,	 4,  2Eh,  33h,	 36h,  33h,  2Eh, 0FDh,	   0, 0F0h
		db   24h, 0FDh,	 7Bh, 0A0h,    4,  25h,	 27h,  2Ah,  27h,  2Ah,	 2Ch,  31h,  33h,  2Ch,	 2Eh,  31h
		db   33h,  2Eh,	 2Ch, 0F8h, 0C7h, 0A7h,	   4,  2Ch,  2Eh,  31h,	 2Eh,  2Ch, 0F8h, 0E0h,	0FDh,	 0
		db  0F0h,  12h,	0FDh,  7Ch, 0ABh,    6,	0FDh,	 0,  70h, 0FDh,	 7Ch,  34h, 0FDh,    0,	0F0h,  12h
		db  0FDh,  7Ch,	0ADh,	 6, 0FDh,    0,	 70h, 0FDh,  7Ch,  36h,	0FDh,	 0, 0F0h,  12h,	0FDh,  7Ch
		db  0ADh,    6,	0FDh,	 0,  70h, 0FDh,	 7Ch,  36h, 0FDh,    0,	0F0h,  12h, 0FDh,  7Ch,	0AFh,	 6
		db  0FDh,    0,	 70h, 0FDh,  7Ch,  38h,	0ADh,  0Ch, 0ADh,    6,	0FDh,	 0, 0F0h,  0Ch,	0FDh,  7Ch
		db   2Dh, 0FDh,	   0, 0F0h,    6, 0FDh,	 7Ch, 0ADh,  18h, 0F8h,	0A1h
MUSIC_2A_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:B0DFo	ROM:B0E1o
MUSIC_2B:	db 0			; DATA XREF: ROM:8000o
		db 0
		db 0
		db 183
		dw MUSIC_2B_YM1
		dw MUSIC_2B_YM2
		dw MUSIC_2B_YM3
		dw MUSIC_2B_YM4
		dw MUSIC_2B_YM5
		dw MUSIC_2B_YM6
		dw MUSIC_2B_PSG1
		dw MUSIC_2B_PSG2
		dw MUSIC_2B_PSG3
		dw MUSIC_2B_PSG3
MUSIC_2B_YM1:	db  0F0h,  14h,	0FEh,	 1, 0FDh,  0Bh,	0FCh,	 1, 0FBh,    0,	0A6h,  0Fh, 0AFh,  0Dh,	 2Bh, 0FDh
					; DATA XREF: ROM:C1A2o
		db   0Ch, 0B2h,	 0Ch, 0AFh,  0Bh,  37h,	0B2h,  0Ah, 0BBh,  0Bh,	 37h, 0BEh,  0Ch, 0BBh,	 0Dh, 0C3h
		db   0Eh, 0BEh,	 16h, 0F0h,    7, 0FDh,	 0Bh, 0C7h, 0A0h, 0F0h,	 36h, 0F0h,    8, 0FDh,	 0Bh, 0B4h
		db   17h, 0F0h,	 13h, 0B9h,  45h, 0FDh,	 0Ah, 0B4h,  17h, 0F0h,	   2, 0FDh,  0Ch, 0B2h,	 18h, 0F0h
		db   11h, 0B7h,	 5Fh, 0F0h,    3, 0B0h,	 1Ah, 0F0h,  11h, 0FDh,	 0Eh, 0B5h,  1Ah, 0F0h,	 28h, 0FDh
		db   0Ch, 0BBh,	 17h, 0BBh,  24h, 0F0h,	 0Ah, 0FDh,  0Bh, 0B7h,	 4Ah, 0F0h,  16h, 0FDh,	 0Ch, 0B9h
		db   0Fh, 0F0h,	   6, 0BCh,  0Fh, 0F0h,	   7, 0FDh,  0Dh, 0C0h,	 42h, 0F0h,  16h, 0FDh,	 0Bh, 0BCh
		db   26h, 0F0h,	   8, 0BEh,  50h, 0FDh,	 0Ah, 0BDh,  0Ah, 0FDh,	 0Ch, 0BBh,  1Ah, 0F0h,	 29h, 0FDh
		db   0Bh, 0BBh,	 18h, 0F0h,  16h, 0BBh,	 18h, 0B9h,  32h, 0F0h,	 42h, 0B7h,  0Ch, 0F0h,	 0Ah, 0FDh
		db   0Ch, 0BAh,	 42h, 0BAh,  18h, 0FDh,	 0Bh, 0B9h,  1Ah, 0F0h,	 14h,  34h, 0F0h,  0Bh,	0B7h,  10h
		db  0F0h,  14h,	0FDh,  0Dh, 0B9h,  18h,	0F0h,  13h, 0FDh,  0Eh,	0BCh,  17h, 0FDh,  0Dh,	0C0h,  24h
		db  0FDh,  0Ch,	0BEh,  0Bh, 0FDh,  0Dh,	0BEh,  40h, 0C0h,  15h,	0F0h,	 6, 0FDh,  0Ch,	0C0h,  80h
		db  0F0h,    5,	0FDh,  0Dh, 0B4h,  12h,	0B2h,  14h, 0B9h,  2Ch,	0C5h,  28h, 0F0h,    3,	0B2h,  12h
		db  0B0h,  15h,	0B7h,  2Ah, 0FDh,  0Ch,	0C3h,  26h, 0F0h,    3,	0FDh,  0Dh, 0B0h,  11h,	0AFh,  14h
		db  0B5h,  29h,	 41h, 0BBh,  1Ch, 0BCh,	 0Ch, 0B7h,  50h, 0FDh,	 0Ch, 0ADh,  0Ah,  2Fh,	0FDh,  0Dh
		db  0B0h,    9,	0B2h,  0Bh, 0B4h,  3Eh,	0B2h,  15h, 0B0h,  22h,	0F0h,	 9, 0FDh,  0Ch,	0B2h,  4Ah
		db  0FDh,  0Bh,	0B1h,  0Ah, 0FDh,  0Eh,	0AFh,  0Bh, 0FDh,  0Dh,	0B0h,  0Ah, 0FDh,  0Eh,	0B4h,	 9
		db  0FDh,  0Dh,	0B7h,  0Bh, 0BBh,  48h,	0BCh,  0Ah, 0F0h,    4,	0C0h,  23h, 0FDh,  0Bh,	0BEh,  0Bh
		db  0FDh,  0Ch,	0BEh,  30h, 0FDh,  0Ah,	 39h, 0F0h,    2, 0FDh,	 0Bh, 0B4h,  14h, 0B2h,	 16h, 0FDh
		db   0Dh, 0B8h,	 3Ah, 0FDh,  0Ch, 0B7h,	 0Eh, 0B5h,  0Ch, 0FDh,	 0Dh, 0B7h,  16h, 0FDh,	 0Ch,  34h
		db  0FDh,  0Dh,	0BBh,  2Bh, 0FDh,  0Ah,	0B9h,  2Dh, 0FDh,  0Ch,	0ADh,  16h, 0FDh,  0Dh,	0AFh,  14h
		db  0B0h,  15h,	 32h, 0B4h,  16h, 0B5h,	 1Bh, 0F0h,    3, 0B7h,	 50h, 0FDh,  0Ah, 0B0h,	 38h, 0FDh
		db   0Bh, 0B7h,	 49h, 0FDh,  0Ah, 0A9h,	 3Eh, 0F0h,    3, 0FDh,	 0Bh, 0B7h,  5Dh, 0FDh,	 0Ah, 0AFh
		db   20h, 0B7h,	 31h, 0F0h,    9, 0C3h,	0B0h, 0F0h,  30h, 0FFh,	   0,	 0
MUSIC_2B_YM2:	db  0F0h,  23h,	0FEh,	 1, 0FDh,  0Ah,	0FCh,	 1, 0FBh,    0,	0A6h,  0Dh,  70h, 0ABh,	 0Ch, 0A6h
					; DATA XREF: ROM:C1A4o
		db   0Bh, 0FDh,	 0Bh,  2Fh, 0FDh,  0Ah,	0ABh,  0Ah, 0FDh,  0Bh,	0B2h,  0Bh, 0FDh,  0Ah,	 2Fh, 0B7h
		db   0Ch, 0FDh,	 0Bh, 0B2h,  0Dh, 0BBh,	 0Eh, 0FDh,  0Ah, 0B7h,	 16h, 0F0h,    3, 0C3h,	0A4h, 0F0h
		db   36h, 0F0h,	 1Ch, 0FDh,  0Bh, 0B2h,	 6Eh, 0F0h,  19h, 0FDh,	 0Ch, 0B0h,  61h, 0FDh,	 0Bh, 0B0h
		db   14h, 0F0h,	 18h, 0FDh,  0Dh, 0AFh,	 1Ah, 0F0h,  12h, 0FDh,	 0Ch, 0B9h,  2Fh, 0F0h,	 14h, 0F0h
		db   21h, 0FDh,	   9, 0BCh,  14h, 0F0h,	 1Dh, 0FDh,  0Ah, 0B4h,	 3Ch, 0F0h,  0Bh, 0FDh,	 0Bh, 0BBh
		db   14h, 0BEh,	 0Fh, 0F0h,  3Dh, 0FDh,	 0Ch, 0BEh,  18h, 0F0h,	 23h, 0FDh,  0Bh, 0BEh,	 0Bh, 0F0h
		db   4Ch, 0FDh,	 0Ah, 0BEh,    9, 0FDh,	 0Bh, 0BCh,    5, 0F0h,	 17h, 0FDh,  0Ch, 0BCh,	 2Eh, 0F0h
		db   15h, 0FDh,	 0Bh, 0B9h,  1Bh, 0F0h,	 14h, 0F0h,  30h, 0FDh,	   9, 0B7h,  31h, 0F0h,	 1Dh, 0FDh
		db   0Ch, 0B9h,	 0Ch, 0FDh,  0Bh, 0B7h,	 71h, 0B4h,  17h, 0F0h,	 12h, 0FDh,  0Ch, 0B5h,	 0Fh, 0F0h
		db   0Ch, 0B5h,	 2Bh, 0FDh,  0Dh, 0BBh,	 18h, 0F0h,  15h, 0BCh,	 84h, 0F0h,    4, 0BDh,	 82h, 0F0h
		db     2, 0FDh,	 0Ch, 0B0h,  28h, 0FDh,	 0Dh, 0B4h,  0Fh, 0FDh,	 0Ch, 0C0h,  0Eh,  3Eh,	0FDh,  0Bh
		db  0C0h,  2Ah,	0F0h,	 2, 0FDh,  0Ch,	0AFh,  27h, 0B2h,  0Fh,	0FDh,  0Dh, 0BEh,  0Eh,	0FDh,  0Ch
		db  0BCh,  0Ch,	0BEh,  28h, 0F0h,    2,	0ADh,  26h, 0B0h,  0Eh,	0FDh,  0Dh, 0BCh,  0Dh,	0FDh,  0Bh
		db  0BBh,  0Eh,	 3Ch, 0FDh,  0Dh,  39h,	0BBh,  0Dh, 0B2h,  1Ch,	0B4h,  0Ch, 0FDh,  0Ch,	0AFh,  1Ch
		db  0B0h,  34h,	0A9h,  7Bh, 0F0h,  20h,	0FDh,  0Dh, 0B2h,    6,	0F0h,  4Bh, 0FDh,  0Ch,	0B2h,	 9
		db  0FDh,  0Bh,	0B0h,	 5, 0ABh,  29h,	0FDh,  0Dh, 0B7h,  52h,	0F0h,	 3, 0BCh,  5Eh,	0FDh,  0Ah
		db  0B4h,  31h,	0F0h,	 1, 0B0h,  55h,	0FDh,  0Bh, 0AFh,  2Ah,	0FDh,  0Ch,  32h, 0B4h,	 2Ch, 0FDh
		db   0Ah, 0B4h,	 2Eh, 0FDh,  0Ch, 0A9h,	 16h, 0FDh,  0Bh, 0ABh,	 14h, 0FDh,  0Ch, 0ADh,	 15h,  2Dh
		db  0AFh,  16h,	0B0h,  1Bh, 0F0h,    2,	0FDh,  0Dh, 0B3h,  46h,	0FDh,  0Ah, 0ACh,  43h,	0FDh,  0Bh
		db  0B2h,  3Dh,	0A6h,  4Ah, 0F0h,    2,	0B4h,  24h,  9Ch,  2Dh,	0FDh,	 9, 0ABh,  1Bh,	0F0h,  12h
		db  0FDh,  0Ah,	0AFh,  31h, 0F0h,    5,	0FDh,	 9, 0BEh, 0B4h,	0FFh,	 0,    0
MUSIC_2B_YM3:	db  0F0h,    4,	0FEh,	 1, 0FDh,  0Ah,	0FCh,	 1, 0FBh,    0,	0A3h,  2Ch, 0A3h,  8Ch,	0FDh,	 9
					; DATA XREF: ROM:C1A6o
		db  0BEh, 0A7h,	0F0h,  36h, 0F0h,    5,	0FDh,  0Bh, 0B0h,  85h,	0F0h,	 4, 0AFh,  8Ah,	0F0h,	 1
		db  0ADh,  59h,	0FDh,  0Ch, 0B2h,  2Dh,	0B2h,  2Eh, 0FDh,  0Bh,	0B2h,  26h, 0F0h,  0Ah,	0FDh,	 9
		db  0B0h,  30h,	0FDh,  0Ch, 0B5h,  83h,	0FDh,  0Bh, 0B8h,  88h,	0B9h,  43h, 0FDh,  0Ah,	0B7h,  17h
		db  0FDh,    9,	0B6h,  2Fh, 0B4h,  8Ah,	0FDh,  0Ah, 0B4h,  42h,	0B2h,  18h, 0B1h,  2Eh,	0B2h,  58h
		db  0FDh,  0Ch,	0B5h,  2Dh, 0B9h,  84h,	0F0h,	 2, 0FDh,  0Ah,	0B9h,  84h, 0F0h,    1,	0FDh,  0Ch
		db  0ADh,  28h,	0FDh,	 9, 0B0h,  2Ah,	0FDh,  0Ch, 0BCh,  22h,	0FDh,  0Dh, 0B4h,  0Ah,	0F0h,	 1
		db  0FDh,  0Bh,	0ABh,  27h, 0FDh,  0Ah,	0AFh,  29h, 0FDh,  0Bh,	0BBh,  20h, 0FDh,  0Ch,	0B0h,	 9
		db  0F0h,    1,	0FDh,  0Bh, 0A9h,  27h,	0FDh,  0Ah, 0ADh,  29h,	0FDh,  0Bh, 0B9h,  0Eh,	0FDh,  0Dh
		db   30h, 0B2h,	 0Dh, 0F0h,  28h, 0FDh,	 0Bh, 0A4h,  13h, 0F0h,	 15h, 0FDh,  0Dh, 0ABh,	 14h, 0FDh
		db   0Ch,  24h,	0A4h,  7Bh, 0A9h,  35h,	0ABh,  0Bh, 0A9h,    9,	0FDh,  0Bh, 0A8h,  0Ch,	0FDh,  0Ch
		db  0A9h,  2Ah,	0A8h,  29h, 0FDh,  0Dh,	0B4h,  52h, 0F0h,    1,	0FDh,  0Bh, 0B9h,  5Fh,	0FDh,  0Ah
		db  0B0h,  32h,	0ACh,  56h, 0FDh,    9,	0ABh,  2Ah, 0FDh,  0Bh,	0AFh,  29h, 0B1h,  2Dh,	0FDh,	 9
		db  0B1h,  2Eh,	0FDh,  0Bh, 0A4h,  16h,	0FDh,  0Ch, 0A6h,  14h,	0A9h,  15h,  29h, 0FDh,	 0Bh, 0ABh
		db   16h, 0FDh,	 0Ch, 0ADh,  1Bh, 0F0h,	   1, 0B0h,  3Ch, 0FDh,	 0Bh, 0A7h,  42h, 0FDh,	 0Ah, 0BAh
		db     3, 0B9h,	   4, 0B8h,    5, 0FDh,	 0Bh, 0AEh,  33h, 0FDh,	 0Ah, 0A0h,  46h, 0FDh,	 0Bh, 0BAh
		db     4, 0FDh,	 0Ah, 0B9h,    5, 0FDh,	 0Dh,  38h, 0F0h,    1,	0FDh,  0Bh, 0B2h,  1Bh,	0FDh,  0Ah
		db   98h,  2Bh,	0FDh,	 9, 0A8h,  27h,	0FDh,  0Ah, 0B2h,  26h,	0FDh,  0Bh, 0BBh,  1Dh,	0F0h,	 2
		db  0FDh,    9,	0B9h, 0B7h, 0FFh,    0,	   0
MUSIC_2B_YM4:	db  0F0h,    2,	0FEh,	 1, 0FDh,  0Ah,	0FCh,	 1, 0FBh,    0,	0FCh,  80h,  9Fh, 0BAh,	0FCh,	 1
					; DATA XREF: ROM:C1A8o
		db   9Fh, 0A7h,	0F0h,  36h, 0F0h,    3,	0ADh,  87h, 0F0h,    2,	0ABh,  8Ch, 0A9h,  5Ah,	0FDh,	 9
		db  0A9h,  2Dh,	0ABh,  8Eh, 0B0h,  3Fh,	0ADh,  0Ah, 0FDh,  0Ah,	0AFh,  0Ch, 0FDh,  0Bh,	0B0h,  16h
		db  0FDh,  0Ah,	0ADh,  18h, 0B5h,  39h,	0FDh,	 9, 0B7h,  0Ah,	0FDh,  0Ah,  35h, 0B4h,	 0Eh, 0FDh
		db     9, 0B5h,	 2Dh, 0FDh,  0Bh, 0B4h,	 5Ah, 0FDh,  0Ah, 0B3h,	 2Fh, 0F0h,  17h, 0FDh,	   9, 0AFh
		db   73h, 0F0h,	 17h, 0FDh,  0Ah,  28h,	0ADh,  2Ch, 0FDh,    9,	0ADh,  2Eh, 0FDh,    8,	0ADh,  58h
		db  0FDh,  0Ah,	0ADh,  2Dh, 0FDh,  0Dh,	0B5h,  84h, 0FDh,  0Ah,	0B4h,  30h, 0FDh,  0Ch,	0A1h,  16h
		db  0FDh,  0Dh,	0A3h,  15h, 0FDh,  0Eh,	0A5h,  16h, 0FDh,  0Dh,	0A8h,  15h, 0FDh,  0Ah,	0A9h,  7Fh
		db  0FDh,  0Bh,	0A8h,  7Ah, 0A6h,  51h,	0FDh,  0Ch, 0A9h,  29h,	0F0h,  14h,  9Fh,  27h,	0FDh,  0Bh
		db  0A8h,  3Dh,	0F0h,  14h,  18h, 0FDh,	 0Ch, 0A1h,  15h, 0A0h,	 0Ah, 0A1h,  0Bh, 0FDh,	 0Bh, 0A3h
		db   1Fh, 0A1h,	 0Ah, 0FDh,  0Ch, 0A0h,	 7Fh, 0F0h,  15h, 0FDh,	 0Bh,  9Ch,  14h, 0FDh,	 0Ch, 0A4h
		db   15h, 0FDh,	 0Dh, 0A1h,  0Ah,  23h,	0A4h,  0Fh, 0A6h,  10h,	0A8h,  0Ah, 0FDh,  0Bh,	0B4h,  4Ah
		db  0FDh,  0Ah,	0A8h,  48h, 0F0h,    1,	0FDh,	 8,  9Dh,  55h,	0FDh,  0Bh, 0A6h,  2Ah,	0FDh,  0Ch
		db   9Ch,  3Fh,	0FDh,  0Ah,  9Ch,  18h,	0F0h,  2Dh, 0FDh,  0Bh,	 9Dh,  16h, 0FDh,  0Ch,	 9Ch,  14h
		db   9Ah,  15h,	0FDh,  0Dh,  18h,  97h,	 16h,  95h,  1Bh, 0FDh,	 0Bh, 0ACh,  10h, 0FDh,	 0Ch,  94h
		db   0Eh, 0FDh,	 0Bh,  9Bh,  0Bh, 0A0h,	 0Ah, 0A4h,  2Ch, 0FDh,	 0Ch,  33h, 0F0h,  0Bh,	0FDh,  0Ah
		db   91h,  0Ah,	0FDh,  0Ch,  14h, 0FDh,	 0Ah,  1Ah, 0FDh,    9,	 9Dh,  2Eh, 0FDh,  0Ah,	0ACh,  30h
		db  0AFh,  11h,	0FDh,	 9,  93h,  2Bh,	0A4h,  32h, 0ABh,  26h,	0FDh,  0Ah, 0B2h,  1Dh,	0FDh,	 8
		db  0B0h, 0B9h,	0FFh,	 0,    0
MUSIC_2B_YM5:	db  0FEh,    1,	0FDh,  0Ah, 0FCh,    1,	0FBh,	 0, 0FCh,  80h,	 98h, 0BCh, 0FCh,    1,	 98h, 0A7h
					; DATA XREF: ROM:C1AAo
		db  0F0h,  36h,	 9Dh,  8Ah, 0FDh,    9,	 9Ch,  8Eh,  9Ah,  5Ah,	 9Fh,  2Dh, 0A4h,  8Eh,	0FDh,	 8
		db  0A9h,  83h,	0FDh,  0Ah, 0AEh,  88h,	0FDh,	 9, 0ADh,  5Ah,	0AFh,  2Fh, 0FDh,    9,	0A8h,  5Dh
		db  0FDh,  0Bh,	0A6h,  2Dh, 0FDh,    8,	0A5h,  5Ah, 0FDh,    7,	0A1h,  2Eh, 0FDh,    9,	0A6h,  58h
		db  0FDh,  0Bh,	0A4h,  2Dh, 0FDh,  0Ah,	0A3h,  59h, 0FDh,  0Ch,	0A2h,  2Bh, 0FDh,  0Bh,	0A1h,  30h
		db  0FDh,  0Ch,	 95h,  16h, 0FDh,  0Dh,	 97h,  15h, 0FDh,  0Eh,	 99h,  16h, 0FDh,  0Dh,	 9Ch,  15h
		db  0FDh,  0Bh,	 9Dh,  7Fh,  9Ch,  7Ah,	 9Ah,  51h,  9Fh,  29h,	0FDh,  0Ch,  98h,  78h,	 91h,  7Bh
		db  0FDh,  0Bh,	 96h,  7Fh, 0FDh,  0Ch,	 95h,  7Bh, 0F0h,    3,	0FDh,  0Bh,  92h,  8Fh,	0F0h,	 1
		db  0FDh,    8,	 91h,  55h, 0FDh,  0Ah,	 93h,  2Ah, 0FDh,  0Ch,	 90h,  28h, 0FDh,  0Ah,	 95h,  2Dh
		db  0FDh,    9,	0A1h,  2Fh, 0FDh,  0Bh,	 91h,  16h, 0FDh,  0Ch,	 90h,  14h, 0FDh,  0Dh,	 8Eh,  15h
		db   0Ch,  8Bh,	 16h,  89h,  1Bh, 0FDh,	 0Ch,  88h,  8Bh, 0FDh,	 0Bh,  8Ah,  87h, 0F0h,	   1, 0FDh
		db   0Ah,  8Ch,	 30h,  9Fh,  80h, 0F0h,	0B9h, 0FFh,    0,    0
MUSIC_2B_YM6:	db  0FFh,    0,	   0	; DATA XREF: ROM:C1ACo
MUSIC_2B_PSG1:	db  0FFh,    0,	   0	; DATA XREF: ROM:C1AEo
MUSIC_2B_PSG2:	db  0FFh,    0,	   0	; DATA XREF: ROM:C1B0o
MUSIC_2B_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:C1B2o	ROM:C1B4o
MUSIC_2C:	db 0			; DATA XREF: ROM:8000o
		db 0
		db 0
		db 183
		dw MUSIC_2C_YM1
		dw MUSIC_2C_YM2
		dw MUSIC_2C_YM3
		dw MUSIC_2C_YM4
		dw MUSIC_2C_YM5
		dw MUSIC_2C_YM6
		dw MUSIC_2C_PSG1
		dw MUSIC_2C_PSG2
		dw MUSIC_2C_PSG3
		dw MUSIC_2C_PSG3
MUSIC_2C_YM1:	db  0F8h,    0,	0F0h,	 8, 0FEh,    1,	0FCh,	 1, 0FBh,    0,	0FDh,  0Bh, 0B4h,  17h,	0F0h,  13h
					; DATA XREF: ROM:C7A5o
		db  0B9h,  45h,	0FDh,  0Ah, 0B4h,  17h,	0F0h,	 2, 0FDh,  0Ch,	0B2h,  18h, 0F0h,  11h,	0B7h,  5Fh
		db  0F0h,    3,	0B0h,  1Ah, 0F0h,  11h,	0FDh,  0Eh, 0B5h,  1Ah,	0F0h,  28h, 0FDh,  0Ch,	0BBh,  17h
		db  0BBh,  24h,	0F0h,  0Ah, 0FDh,  0Bh,	0B7h,  4Ah, 0F0h,  16h,	0FDh,  0Ch, 0B9h,  0Fh,	0F0h,	 6
		db  0BCh,  0Fh,	0F0h,	 7, 0FDh,  0Dh,	0C0h,  42h, 0F0h,  16h,	0FDh,  0Bh, 0BCh,  26h,	0F0h,	 8
		db  0BEh,  50h,	0FDh,  0Ah, 0BDh,  0Ah,	0FDh,  0Ch, 0BBh,  1Ah,	0F0h,  29h, 0FDh,  0Bh,	0BBh,  18h
		db  0F0h,  16h,	0BBh,  18h, 0B9h,  32h,	0F0h,  42h, 0B7h,  0Ch,	0F0h,  0Ah, 0FDh,  0Ch,	0BAh,  42h
		db  0BAh,  18h,	0FDh,  0Bh, 0B9h,  1Ah,	0F0h,  14h,  34h, 0F0h,	 0Bh, 0B7h,  10h, 0F0h,	 14h, 0FDh
		db   0Dh, 0B9h,	 18h, 0F0h,  13h, 0FDh,	 0Eh, 0BCh,  17h, 0FDh,	 0Dh, 0C0h,  24h, 0FDh,	 0Ch, 0BEh
		db   0Bh, 0FDh,	 0Dh, 0BEh,  40h, 0C0h,	 15h, 0F0h,    6, 0FDh,	 0Ch, 0C0h,  80h, 0F0h,	   5, 0FDh
		db   0Dh, 0B4h,	 12h, 0B2h,  14h, 0B9h,	 2Ch, 0C5h,  28h, 0F0h,	   3, 0B2h,  12h, 0B0h,	 15h, 0B7h
		db   2Ah, 0FDh,	 0Ch, 0C3h,  26h, 0F0h,	   3, 0FDh,  0Dh, 0B0h,	 11h, 0AFh,  14h, 0B5h,	 29h,  41h
		db  0BBh,  1Ch,	0BCh,  0Ch, 0B7h,  50h,	0FDh,  0Ch, 0ADh,  0Ah,	 2Fh, 0FDh,  0Dh, 0B0h,	   9, 0B2h
		db   0Bh, 0B4h,	 3Eh, 0B2h,  15h, 0B0h,	 22h, 0F0h,    9, 0FDh,	 0Ch, 0B2h,  4Ah, 0FDh,	 0Bh, 0B1h
		db   0Ah, 0FDh,	 0Eh, 0AFh,  0Bh, 0FDh,	 0Dh, 0B0h,  0Ah, 0FDh,	 0Eh, 0B4h,    9, 0FDh,	 0Dh, 0B7h
		db   0Bh, 0BBh,	 48h, 0BCh,  0Ah, 0F0h,	   4, 0C0h,  23h, 0FDh,	 0Bh, 0BEh,  0Bh, 0FDh,	 0Ch, 0BEh
		db   30h, 0FDh,	 0Ah,  39h, 0F0h,    2,	0FDh,  0Bh, 0B4h,  14h,	0B2h,  16h, 0FDh,  0Dh,	0B8h,  3Ah
		db  0FDh,  0Ch,	0B7h,  0Eh, 0B5h,  0Ch,	0FDh,  0Dh, 0B7h,  16h,	0FDh,  0Ch,  34h, 0FDh,	 0Dh, 0BBh
		db   2Bh, 0FDh,	 0Ah, 0B9h,  2Dh, 0FDh,	 0Ch, 0ADh,  16h, 0FDh,	 0Dh, 0AFh,  14h, 0B0h,	 15h,  32h
		db  0B4h,  16h,	0B5h,  1Bh, 0F0h,  0Dh,	0B4h,  28h, 0B2h,  16h,	0FDh,  0Ch, 0B4h,  19h,	0FDh,  0Dh
		db  0B5h,  20h,	0F0h,  1Dh, 0F8h, 0A1h
MUSIC_2C_YM2:	db  0F8h,    0,	0F0h,  1Ch, 0FEh,    1,	0FCh,	 1, 0FBh,    0,	0FDh,  0Bh, 0B2h,  6Eh,	0F0h,  19h
					; DATA XREF: ROM:C7A7o
		db  0FDh,  0Ch,	0B0h,  61h, 0FDh,  0Bh,	0B0h,  14h, 0F0h,  18h,	0FDh,  0Dh, 0AFh,  1Ah,	0F0h,  12h
		db  0FDh,  0Ch,	0B9h,  2Fh, 0F0h,  14h,	0F0h,  21h, 0FDh,    9,	0BCh,  14h, 0F0h,  1Dh,	0FDh,  0Ah
		db  0B4h,  3Ch,	0F0h,  0Bh, 0FDh,  0Bh,	0BBh,  14h, 0BEh,  0Fh,	0F0h,  3Dh, 0FDh,  0Ch,	0BEh,  18h
		db  0F0h,  23h,	0FDh,  0Bh, 0BEh,  0Bh,	0F0h,  4Ch, 0FDh,  0Ah,	0BEh,	 9, 0FDh,  0Bh,	0BCh,	 5
		db  0F0h,  17h,	0FDh,  0Ch, 0BCh,  2Eh,	0F0h,  15h, 0FDh,  0Bh,	0B9h,  1Bh, 0F0h,  14h,	0F0h,  30h
		db  0FDh,    9,	0B7h,  31h, 0F0h,  1Dh,	0FDh,  0Ch, 0B9h,  0Ch,	0FDh,  0Bh, 0B7h,  71h,	0B4h,  17h
		db  0F0h,  12h,	0FDh,  0Ch, 0B5h,  0Fh,	0F0h,  0Ch, 0B5h,  2Bh,	0FDh,  0Dh, 0BBh,  18h,	0F0h,  15h
		db  0BCh,  84h,	0F0h,	 4, 0BDh,  82h,	0F0h,	 2, 0FDh,  0Ch,	0B0h,  28h, 0FDh,  0Dh,	0B4h,  0Fh
		db  0FDh,  0Ch,	0C0h,  0Eh,  3Eh, 0FDh,	 0Bh, 0C0h,  2Ah, 0F0h,	   2, 0FDh,  0Ch, 0AFh,	 27h, 0B2h
		db   0Fh, 0FDh,	 0Dh, 0BEh,  0Eh, 0FDh,	 0Ch, 0BCh,  0Ch, 0BEh,	 28h, 0F0h,    2, 0ADh,	 26h, 0B0h
		db   0Eh, 0FDh,	 0Dh, 0BCh,  0Dh, 0FDh,	 0Bh, 0BBh,  0Eh,  3Ch,	0FDh,  0Dh,  39h, 0BBh,	 0Dh, 0B2h
		db   1Ch, 0B4h,	 0Ch, 0FDh,  0Ch, 0AFh,	 1Ch, 0B0h,  34h, 0A9h,	 7Bh, 0F0h,  20h, 0FDh,	 0Dh, 0B2h
		db     6, 0F0h,	 4Bh, 0FDh,  0Ch, 0B2h,	   9, 0FDh,  0Bh, 0B0h,	   5, 0ABh,  29h, 0FDh,	 0Dh, 0B7h
		db   52h, 0F0h,	   3, 0BCh,  5Eh, 0FDh,	 0Ah, 0B4h,  31h, 0F0h,	   1, 0B0h,  55h, 0FDh,	 0Bh, 0AFh
		db   2Ah, 0FDh,	 0Ch,  32h, 0B4h,  2Ch,	0FDh,  0Ah, 0B4h,  2Eh,	0FDh,  0Ch, 0A9h,  16h,	0FDh,  0Bh
		db  0ABh,  14h,	0FDh,  0Ch, 0ADh,  15h,	 2Dh, 0AFh,  16h, 0B0h,	 1Bh, 0F0h,    9, 0FDh,	 0Dh, 0AFh
		db   5Bh, 0F0h,	 1Ch, 0FDh,  0Ch, 0B7h,	 21h, 0F8h, 0A1h
MUSIC_2C_YM3:	db  0F8h,    0,	0F0h,	 5, 0FEh,    1,	0FCh,	 1, 0FBh,    0,	0FDh,  0Bh, 0B0h,  85h,	0F0h,	 4
					; DATA XREF: ROM:C7A9o
		db  0AFh,  8Ah,	0F0h,	 1, 0ADh,  59h,	0FDh,  0Ch, 0B2h,  2Dh,	0B2h,  2Eh, 0FDh,  0Bh,	0B2h,  26h
		db  0F0h,  0Ah,	0FDh,	 9, 0B0h,  30h,	0FDh,  0Ch, 0B5h,  83h,	0FDh,  0Bh, 0B8h,  88h,	0B9h,  43h
		db  0FDh,  0Ah,	0B7h,  17h, 0FDh,    9,	0B6h,  2Fh, 0B4h,  8Ah,	0FDh,  0Ah, 0B4h,  42h,	0B2h,  18h
		db  0B1h,  2Eh,	0B2h,  58h, 0FDh,  0Ch,	0B5h,  2Dh, 0B9h,  84h,	0F0h,	 2, 0FDh,  0Ah,	0B9h,  84h
		db  0F0h,    1,	0FDh,  0Ch, 0ADh,  28h,	0FDh,	 9, 0B0h,  2Ah,	0FDh,  0Ch, 0BCh,  22h,	0FDh,  0Dh
		db  0B4h,  0Ah,	0F0h,	 1, 0FDh,  0Bh,	0ABh,  27h, 0FDh,  0Ah,	0AFh,  29h, 0FDh,  0Bh,	0BBh,  20h
		db  0FDh,  0Ch,	0B0h,	 9, 0F0h,    1,	0FDh,  0Bh, 0A9h,  27h,	0FDh,  0Ah, 0ADh,  29h,	0FDh,  0Bh
		db  0B9h,  0Eh,	0FDh,  0Dh,  30h, 0B2h,	 0Dh, 0F0h,  28h, 0FDh,	 0Bh, 0A4h,  13h, 0F0h,	 15h, 0FDh
		db   0Dh, 0ABh,	 14h, 0FDh,  0Ch,  24h,	0A4h,  7Bh, 0A9h,  35h,	0ABh,  0Bh, 0A9h,    9,	0FDh,  0Bh
		db  0A8h,  0Ch,	0FDh,  0Ch, 0A9h,  2Ah,	0A8h,  29h, 0FDh,  0Dh,	0B4h,  52h, 0F0h,    1,	0FDh,  0Bh
		db  0B9h,  5Fh,	0FDh,  0Ah, 0B0h,  32h,	0ACh,  56h, 0FDh,    9,	0ABh,  2Ah, 0FDh,  0Bh,	0AFh,  29h
		db  0B1h,  2Dh,	0FDh,	 9, 0B1h,  2Eh,	0FDh,  0Bh, 0A4h,  16h,	0FDh,  0Ch, 0A6h,  14h,	0A9h,  15h
		db   29h, 0FDh,	 0Bh, 0ABh,  16h, 0FDh,	 0Ch, 0ADh,  1Bh, 0F0h,	   5, 0A9h,  5Dh, 0AEh,	 3Fh, 0F8h
		db  0A1h
MUSIC_2C_YM4:	db  0F8h,    0,	0F0h,	 3, 0FEh,    1,	0FCh,	 1, 0FBh,    0,	0FDh,  0Ah, 0ADh,  87h,	0F0h,	 2
					; DATA XREF: ROM:C7ABo
		db  0ABh,  8Ch,	0A9h,  5Ah, 0FDh,    9,	0A9h,  2Dh, 0ABh,  8Eh,	0B0h,  3Fh, 0ADh,  0Ah,	0FDh,  0Ah
		db  0AFh,  0Ch,	0FDh,  0Bh, 0B0h,  16h,	0FDh,  0Ah, 0ADh,  18h,	0B5h,  39h, 0FDh,    9,	0B7h,  0Ah
		db  0FDh,  0Ah,	 35h, 0B4h,  0Eh, 0FDh,	   9, 0B5h,  2Dh, 0FDh,	 0Bh, 0B4h,  5Ah, 0FDh,	 0Ah, 0B3h
		db   2Fh, 0F0h,	 17h, 0FDh,    9, 0AFh,	 73h, 0F0h,  17h, 0FDh,	 0Ah,  28h, 0ADh,  2Ch,	0FDh,	 9
		db  0ADh,  2Eh,	0FDh,	 8, 0ADh,  58h,	0FDh,  0Ah, 0ADh,  2Dh,	0FDh,  0Dh, 0B5h,  84h,	0FDh,  0Ah
		db  0B4h,  30h,	0FDh,  0Ch, 0A1h,  16h,	0FDh,  0Dh, 0A3h,  15h,	0FDh,  0Eh, 0A5h,  16h,	0FDh,  0Dh
		db  0A8h,  15h,	0FDh,  0Ah, 0A9h,  7Fh,	0FDh,  0Bh, 0A8h,  7Ah,	0A6h,  51h, 0FDh,  0Ch,	0A9h,  29h
		db  0F0h,  14h,	 9Fh,  27h, 0FDh,  0Bh,	0A8h,  3Dh, 0F0h,  14h,	 18h, 0FDh,  0Ch, 0A1h,	 15h, 0A0h
		db   0Ah, 0A1h,	 0Bh, 0FDh,  0Bh, 0A3h,	 1Fh, 0A1h,  0Ah, 0FDh,	 0Ch, 0A0h,  7Fh, 0F0h,	 15h, 0FDh
		db   0Bh,  9Ch,	 14h, 0FDh,  0Ch, 0A4h,	 15h, 0FDh,  0Dh, 0A1h,	 0Ah,  23h, 0A4h,  0Fh,	0A6h,  10h
		db  0A8h,  0Ah,	0FDh,  0Bh, 0B4h,  4Ah,	0FDh,  0Ah, 0A8h,  48h,	0F0h,	 1, 0FDh,    8,	 9Dh,  55h
		db  0FDh,  0Bh,	0A6h,  2Ah, 0FDh,  0Ch,	 9Ch,  3Fh, 0FDh,  0Ah,	 9Ch,  18h, 0F0h,  2Dh,	0FDh,  0Bh
		db   9Dh,  16h,	0FDh,  0Ch,  9Ch,  14h,	 9Ah,  15h, 0FDh,  0Dh,	 18h,  97h,  16h,  95h,	 1Bh, 0F0h
		db     4, 0FDh,	 0Bh,  93h,  5Dh, 0FDh,	 0Ah, 0A8h,  40h, 0F8h,	0A1h
MUSIC_2C_YM5:	db  0F8h,    0,	0FEh,	 1, 0FCh,    1,	0FBh,	 0, 0FDh,  0Ah,	 9Dh,  8Ah, 0FDh,    9,	 9Ch,  8Eh
					; DATA XREF: ROM:C7ADo
		db   9Ah,  5Ah,	 9Fh,  2Dh, 0A4h,  8Eh,	0FDh,	 8, 0A9h,  83h,	0FDh,  0Ah, 0AEh,  88h,	0FDh,	 9
		db  0ADh,  5Ah,	0AFh,  2Fh, 0FDh,    9,	0A8h,  5Dh, 0FDh,  0Bh,	0A6h,  2Dh, 0FDh,    8,	0A5h,  5Ah
		db  0FDh,    7,	0A1h,  2Eh, 0FDh,    9,	0A6h,  58h, 0FDh,  0Bh,	0A4h,  2Dh, 0FDh,  0Ah,	0A3h,  59h
		db  0FDh,  0Ch,	0A2h,  2Bh, 0FDh,  0Bh,	0A1h,  30h, 0FDh,  0Ch,	 95h,  16h, 0FDh,  0Dh,	 97h,  15h
		db  0FDh,  0Eh,	 99h,  16h, 0FDh,  0Dh,	 9Ch,  15h, 0FDh,  0Bh,	 9Dh,  7Fh,  9Ch,  7Ah,	 9Ah,  51h
		db   9Fh,  29h,	0FDh,  0Ch,  98h,  78h,	 91h,  7Bh, 0FDh,  0Bh,	 96h,  7Fh, 0FDh,  0Ch,	 95h,  7Bh
		db  0F0h,    3,	0FDh,  0Bh,  92h,  8Fh,	0F0h,	 1, 0FDh,    8,	 91h,  55h, 0FDh,  0Ah,	 93h,  2Ah
		db  0FDh,  0Ch,	 90h,  28h, 0FDh,  0Ah,	 95h,  2Dh, 0FDh,    9,	0A1h,  2Fh, 0FDh,  0Bh,	 91h,  16h
		db  0FDh,  0Ch,	 90h,  14h, 0FDh,  0Dh,	 8Eh,  15h,  0Ch,  8Bh,	 16h,  89h,  1Bh, 0FDh,	 0Ch,  87h
		db   61h, 0FDh,	   8,  98h,  40h, 0F8h,	0A1h
MUSIC_2C_YM6:	db  0FFh,    0,	   0	; DATA XREF: ROM:C7AFo
MUSIC_2C_PSG1:	db  0FFh,    0,	   0	; DATA XREF: ROM:C7B1o
MUSIC_2C_PSG2:	db  0FFh,    0,	   0	; DATA XREF: ROM:C7B3o
MUSIC_2C_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:C7B5o	ROM:C7B7o
MUSIC_2D:	db 0			; DATA XREF: ROM:8000o
		db 0
		db 0
		db 200
		dw MUSIC_2D_YM1
		dw MUSIC_2D_YM2
		dw MUSIC_2D_YM3
		dw MUSIC_2D_YM4
		dw MUSIC_2D_YM5
		dw MUSIC_2D_YM6
		dw MUSIC_2D_PSG1
		dw MUSIC_2D_PSG2
		dw MUSIC_2D_PSG3
		dw MUSIC_2D_PSG3
MUSIC_2D_YM1:	db  0FAh, 0C0h,	0FCh,	 0, 0FBh,  2Dh,	0F0h, 0C0h, 0F0h, 0A8h,	0FEh,  35h, 0FDh,  0Ch,	0A4h,  0Ch
					; DATA XREF: ROM:CC9Bo
		db   70h, 0F8h,	   0, 0A9h,    0, 0FCh,	 82h, 0ABh, 0F0h, 0FCh,	0FFh, 0F0h,  0Ch, 0A4h,	   6,  70h
		db  0A9h,  0Ch,	0ABh,	 6,  70h, 0FCh,	 80h, 0AEh,    9, 0FCh,	 88h, 0FCh,    1,  30h,	0F0h,	 6
		db  0FCh, 0FFh,	 2Dh,  70h,  2Eh,  70h,	 2Bh, 0F0h,  0Ah, 0ADh,	   6, 0F0h,  0Ah, 0A9h,	   6, 0F0h
		db   0Ah, 0FCh,	0FFh, 0A9h,    0, 0FCh,	 82h, 0FCh,  80h, 0ABh,	0C0h, 0FBh,  20h, 0FCh,	   1, 0ABh
		db   9Ch, 0FBh,	 2Ch, 0FCh, 0FFh, 0F0h,	 0Ch,  24h,  70h, 0A7h,	   0, 0FCh,  82h, 0A9h,	0F0h, 0FCh
		db  0FFh, 0F0h,	 0Ch, 0A4h,    6,  70h,	0A7h,  0Ch, 0A9h,    6,	 70h, 0FCh,  80h, 0FCh,	 88h, 0AAh
		db     2, 0ABh,	 0Ch, 0FCh,    1, 0AAh,	 0Ah, 0FCh, 0FFh, 0A9h,	   6,  70h,  27h,  70h,	 24h, 0F0h
		db   0Ah, 0A2h,	   6, 0F0h,  0Ah, 0A7h,	   6, 0F0h,  0Ah, 0A3h,	   0, 0FCh,  81h, 0FCh,	 80h, 0A4h
		db  0C0h, 0FBh,	 20h, 0FCh,    1, 0A4h,	 9Ch, 0FCh, 0FFh, 0FBh,	 2Ch, 0F0h,  0Ch,  24h,	 70h, 0F8h
		db  0A1h
MUSIC_2D_YM2:	db  0FAh, 0C0h,	0F9h,  20h, 0FCh,    0,	0FBh,  3Ch, 0F0h, 0C6h,	0F0h, 0A8h, 0FEh,  35h,	0FDh,	 9
					; DATA XREF: ROM:CC9Do
		db  0A4h,  0Ch,	 70h, 0F8h,    0, 0A9h,	   0, 0FCh,  82h, 0ABh,	0F0h, 0FCh, 0FFh, 0F0h,	 0Ch, 0A4h
		db     6,  70h,	0A9h,  0Ch, 0ABh,    6,	 70h, 0FCh,  80h, 0AEh,	   9, 0FCh,  88h, 0FCh,	   1,  30h
		db  0F0h,    6,	0FCh, 0FFh,  2Dh,  70h,	 2Eh,  70h,  2Bh, 0F0h,	 0Ah, 0ADh,    6, 0F0h,	 0Ah, 0A9h
		db     6, 0F0h,	 0Ah, 0FCh, 0FFh, 0A9h,	   0, 0FCh,  82h, 0FCh,	 80h, 0ABh, 0C0h, 0FBh,	 20h, 0FCh
		db     1, 0ABh,	 9Ch, 0FBh,  2Ch, 0FCh,	0FFh, 0F0h,  0Ch,  24h,	 70h, 0A7h,    0, 0FCh,	 82h, 0A9h
		db  0F0h, 0FCh,	0FFh, 0F0h,  0Ch, 0A4h,	   6,  70h, 0A7h,  0Ch,	0A9h,	 6,  70h, 0FCh,	 80h, 0FCh
		db   88h, 0AAh,	   2, 0ABh,  0Ch, 0FCh,	   1, 0AAh,  0Ah, 0FCh,	0FFh, 0A9h,    6,  70h,	 27h,  70h
		db   24h, 0F0h,	 0Ah, 0A2h,    6, 0F0h,	 0Ah, 0A7h,    6, 0F0h,	 0Ah, 0A3h,    0, 0FCh,	 81h, 0FCh
		db   80h, 0A4h,	0C0h, 0FBh,  20h, 0FCh,	   1, 0A4h,  9Ch, 0FCh,	0FFh, 0FBh,  2Ch, 0F0h,	 0Ch,  24h
		db   70h, 0F8h,	0A1h
MUSIC_2D_YM3:	db  0FCh,    1,	0FBh,  4Ch, 0F8h,    0,	0F8h, 0C5h, 0F0h,  18h,	0FAh,  40h, 0FEh,  1Fh,	0FDh,  0Ah
					; DATA XREF: ROM:CC9Fo
		db  0B0h,    8,	 2Bh,  29h,  24h, 0F0h,	 10h, 0FAh,  80h, 0FDh,	   7, 0B0h,    8,  2Bh,	 29h,  24h
		db  0F0h,  58h,	0F8h, 0E0h, 0F8h, 0C1h,	0F0h,  18h, 0FAh,  80h,	0FDh,  0Ah, 0B5h,    8,	 30h,  2Eh
		db   29h, 0F0h,	 10h, 0FAh,  80h, 0FDh,	   7, 0B5h,    8,  30h,	 2Eh,  29h, 0F0h,  58h,	0F8h, 0E0h
		db  0F8h, 0A1h
MUSIC_2D_YM4:	db  0FAh, 0C0h,	0FEh,  1Eh, 0FDh,  0Ah,	0FCh,	 1, 0FBh,  4Ch,	0F8h,	 0, 0F8h, 0C5h,	0FCh,  80h
					; DATA XREF: ROM:CCA1o
		db   8Ah,    1,	0FCh,  8Dh, 0FCh,    1,	 8Ch,  3Bh, 0FCh, 0FFh,	0F0h,  0Ch,  87h,    8,	0F0h,  10h
		db   8Ah,    8,	0F0h,  10h,  8Ah,    8,	0F0h,  10h,  8Ch,  0Ah,	0F0h,  26h, 0F8h, 0E0h,	0F8h, 0C1h
		db  0FCh,  80h,	 8Fh,	 1, 0FCh,  88h,	0FCh,	 1,  91h,  3Bh,	0FCh, 0FFh, 0F0h,  0Ch,	 8Ch,	 8
		db  0F0h,  10h,	 8Fh,	 8, 0F0h,  10h,	 8Fh,	 8, 0F0h,  10h,	 91h,  0Ah, 0F0h,  26h,	0F8h, 0E0h
		db  0F8h, 0A1h
MUSIC_2D_YM5:	db  0FCh,    1,	0FBh,  4Ch, 0F8h,    0,	0F8h, 0C1h, 0F0h,  18h,	0FEh,  3Dh, 0FDh,    9,	 95h,  0Ch
					; DATA XREF: ROM:CCA3o
		db  0FDh,    7,	 95h,  54h, 0FDh,    9,	 95h,  0Ch, 0FDh,    7,	 95h,  24h, 0FDh,    9,	 95h,  0Ch
		db  0FDh,    7,	 15h, 0F8h, 0E0h, 0F8h,	   0, 0F8h, 0CEh, 0F0h,	 18h, 0FDh,    9,  95h,	 0Ch, 0FDh
		db     7,  95h,	 54h, 0FDh,    9,  95h,	 0Ch, 0FDh,    7,  95h,	 24h, 0FDh,    9,  95h,	 0Ch, 0FDh
		db     7,  15h,	0F8h, 0E0h, 0F0h, 0A8h,	0FDh,	 9,  95h,  0Ch,	0FDh,	 7,  15h, 0F8h,	0A1h
MUSIC_2D_YM6:	db  0F8h,    0,	0FAh, 0C0h,  80h,  30h,	0FAh,  80h,  82h,  18h,	0FAh, 0C0h,    3, 0FAh,	 80h,  82h
					; DATA XREF: ROM:CCA5o
		db   30h, 0FAh,	 40h,  84h,  18h, 0FAh,	0C0h,	 3,  80h,  30h,	0FAh,  80h,  82h,  18h,	0FAh,  40h
		db     4, 0FAh,	0C0h,  83h,  30h, 0FAh,	 40h,  84h,  18h, 0FAh,	 80h,	 2, 0F8h,    0,	0F8h, 0C6h
		db  0FAh, 0C0h,	 80h,  30h, 0FAh,  80h,	 82h,  18h, 0FAh, 0C0h,	   3, 0FAh,  80h,  82h,	 30h, 0FAh
		db   40h,  84h,	 18h, 0FAh, 0C0h,    3,	 80h,  30h, 0FAh,  80h,	 82h,  18h, 0FAh,  40h,	   4, 0FAh
		db  0C0h,  83h,	 30h, 0FAh,  40h,  84h,	 18h, 0FAh,  80h,    2,	0F8h, 0E0h, 0FAh, 0C0h,	 80h,  30h
		db  0FAh,  80h,	 82h,  18h, 0FAh, 0C0h,	   3, 0FAh,  80h,  82h,	 30h, 0FAh,  40h,  84h,	 18h, 0FAh
		db  0C0h,    3,	 80h,  14h, 0FAh,  80h,	 82h,  12h,  82h,  10h,	0FAh, 0C0h,  83h,  0Eh,	   3, 0FAh
		db   40h,    4,	0FAh,  80h,  82h,  0Ch,	0FAh, 0C0h,    3,    3,	0FAh,  40h,    4, 0FAh,	0C0h,  83h
		db   18h, 0FAh,	 40h,	 4, 0F8h, 0A1h
MUSIC_2D_PSG1:	db  0FCh,    1,	0FBh,  4Ch, 0F8h,    0,	0F8h, 0C5h, 0FDh,    0,	0F0h,  18h, 0FDh,  1Ah,	0B0h,	 8
					; DATA XREF: ROM:CCA7o
		db   2Bh,  29h,	 24h, 0FDh,    0, 0F0h,	 10h, 0FDh,  18h, 0B0h,	   8,  2Bh,  29h,  24h,	0FDh,	 0
		db  0F0h,  58h,	0F8h, 0E0h, 0F8h, 0C1h,	0FDh,	 0, 0F0h,  18h,	0FDh,  1Ah, 0B5h,    8,	 30h,  2Eh
		db   29h, 0FDh,	   0, 0F0h,  10h, 0FDh,	 18h, 0B5h,    8,  30h,	 2Eh,  29h, 0FDh,    0,	0F0h,  58h
		db  0F8h, 0E0h,	0F8h, 0A1h
MUSIC_2D_PSG2:	db  0FCh,    1,	0FBh,  4Ch, 0FDh,    0,	0F0h,  18h, 0F8h,    0,	0F8h, 0C5h, 0FDh,    0,	0F0h,  18h
					; DATA XREF: ROM:CCA9o
		db  0FDh,  15h,	0B0h,	 8,  2Bh,  29h,	 24h, 0FDh,    0, 0F0h,	 10h, 0FDh,  13h, 0B0h,	   8,  2Bh
		db   29h,  24h,	0FDh,	 0, 0F0h,  58h,	0F8h, 0E0h, 0F8h, 0C1h,	0FDh,	 0, 0F0h,  18h,	0FDh,  15h
		db  0B5h,    8,	 30h,  2Eh,  29h, 0FDh,	   0, 0F0h,  10h, 0FDh,	 13h, 0B5h,    8,  30h,	 2Eh,  29h
		db  0FDh,    0,	0F0h,  58h, 0F8h, 0E0h,	0F8h, 0A1h
MUSIC_2D_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:CCABo	ROM:CCADo
MUSIC_29:	db 0			; DATA XREF: ROM:8000o
		db 0
		db 0
		db 199
		dw MUSIC_29_YM1
		dw MUSIC_29_YM2
		dw MUSIC_29_YM3
		dw MUSIC_29_YM4
		dw MUSIC_29_YM5
		dw MUSIC_29_YM6
		dw MUSIC_29_PSG1
		dw MUSIC_29_PSG2
		dw MUSIC_29_PSG3
		dw MUSIC_29_PSG3
MUSIC_29_YM1:	db  0F8h,    0,	0FEh,  11h, 0FDh,  0Dh,	0FCh,	 1, 0FBh,  50h,	0FAh, 0C0h, 0C0h,  0Ch,	0FCh,  80h
					; DATA XREF: ROM:CFFFo
		db  0C0h, 0B4h,	0FCh,	 1, 0C0h,  90h,	0BEh,  0Ch, 0BEh,  24h,	0C3h,  0Ch, 0FCh,  80h,	0C3h, 0B4h
		db  0FCh,    1,	0C3h, 0C0h, 0BEh,  0Ch,	0FCh,  80h, 0BEh, 0B4h,	0FCh,	 1, 0BEh,  90h,	0BCh,  0Ch
		db  0BCh,  24h,	0BFh,  0Ch, 0FCh,  80h,	0BFh, 0B4h, 0BFh, 0C0h,	0FCh,	 1, 0BFh,  60h,	 70h, 0FBh
		db   2Ch, 0FEh,	   8, 0FDh,  0Bh, 0AEh,	 30h,  29h,  28h,  25h,	0A6h,  31h, 0FCh,  80h,	0FCh,  88h
		db  0FBh,  20h,	0B1h,  8Fh, 0B1h, 0C0h,	0B1h,  6Ah, 0B1h,  60h,	0FDh,  0Ah, 0B1h,  30h,	0FDh,	 9
		db  0B1h,  18h,	0FDh,	 8, 0B1h,  0Ch,	0FDh,	 7, 0B1h,    6,	0FDh,	 6, 0B1h,    2,	0FDh,	 5
		db   31h, 0FDh,	   4, 0FCh,    1,  31h,	0FBh,  2Ch, 0F0h,  30h,	0FCh, 0FFh, 0FEh,  24h,	0FDh,  0Bh
		db   9Fh,  5Ah,	 9Eh,  2Ch,  9Dh,  26h,	 99h,  1Ah,  9Ah,  18h,	 96h,  16h,  97h,  14h,	 93h,  18h
		db  0FCh,  80h,	 92h,  29h, 0FCh,  84h,	0FCh,	 1,  91h,  4Fh,	0F0h, 0A8h, 0FCh, 0FFh,	0F0h,  32h
		db  0A2h,  5Ah,	0A1h,  2Ch, 0A0h,  26h,	 9Ch,  1Ah,  9Dh,  18h,	 98h,  16h,  99h,  14h,	 95h,  18h
		db  0FCh,  80h,	 96h,  29h, 0FCh,    1,	0FCh,  85h,  97h,  4Fh,	0F0h, 0C0h, 0F0h, 0A8h,	0FCh, 0FFh
		db  0F8h, 0A1h
MUSIC_29_YM2:	db  0F8h,    0,	0FEh,	 6, 0FCh,    1,	0FBh,  2Ch, 0FAh,  80h,	0FDh,  0Bh, 0ACh,    6,	 35h,  3Bh
					; DATA XREF: ROM:D001o
		db   43h, 0F0h,	 18h, 0FDh,    9, 0ACh,	   6,  35h,  3Bh,  43h,	0F0h,  18h, 0FDh,    7,	0ACh,	 6
		db   35h,  3Bh,	 43h, 0F0h,  18h, 0FDh,	   5, 0ACh,    6,  35h,	 3Bh,  43h, 0F0h,  18h,	0FDh,	 3
		db  0ACh,    6,	 35h,  3Bh,  43h, 0F0h,	 18h, 0FDh,    1, 0ACh,	   6,  35h,  3Bh,  43h,	0F0h,  78h
		db  0FDh,  0Bh,	0A8h,	 6,  31h,  3Bh,	 46h, 0F0h,  18h, 0FDh,	   9, 0A8h,    6,  31h,	 3Bh,  46h
		db  0F0h,  18h,	0FDh,	 7, 0A8h,    6,	 31h,  3Bh,  46h, 0F0h,	 18h, 0FDh,    5, 0A8h,	   6,  31h
		db   3Bh,  46h,	0F0h,  18h, 0FDh,    3,	0A8h,	 6,  31h,  3Bh,	 46h, 0F0h,  18h, 0FDh,	   1, 0A8h
		db     6,  31h,	 3Bh,  46h, 0F0h,  78h,	0FDh,  0Bh, 0A7h,    6,	 32h,  3Ah,  43h, 0F0h,	 18h, 0FDh
		db     9, 0A7h,	   6,  32h,  3Ah,  43h,	0F0h,  18h, 0FDh,    7,	0A7h,	 6,  32h,  3Ah,	 43h, 0F0h
		db   18h, 0FDh,	   5, 0A7h,    6,  32h,	 3Ah,  43h, 0F0h,  18h,	0FDh,	 3, 0A7h,    6,	 32h,  3Ah
		db   43h, 0F0h,	 18h, 0FDh,    1, 0A7h,	   6,  32h,  3Ah,  43h,	0F0h,  78h, 0FDh,  0Bh,	0A5h,	 6
		db   2Fh,  38h,	 46h, 0F0h,  18h, 0FDh,	   9, 0A5h,    6,  2Fh,	 38h,  46h, 0F0h,  18h,	0FDh,	 7
		db  0A5h,    6,	 2Fh,  38h,  46h, 0F0h,	 18h, 0FDh,    5, 0A5h,	   6,  2Fh,  38h,  46h,	0F0h,  18h
		db  0FDh,    3,	0A5h,	 6,  2Fh,  38h,	 46h, 0F0h,  18h, 0FDh,	   1, 0A5h,    6,  2Fh,	 38h,  46h
		db  0F0h, 0D8h,	0FEh,  32h, 0FDh,  0Ah,	0FAh, 0C0h, 0FCh,  80h,	0A1h,  4Bh, 0FCh,  84h,	0FCh,	 1
		db  0A3h, 0D5h,	0FCh, 0FFh, 0FDh,    9,	0FCh,  80h, 0A2h, 0C0h,	0FCh,	 1, 0A2h, 0A8h,	0F0h,  48h
		db  0FAh,  80h,	0FCh,	 0, 0FEh,  37h,	0FDh,	 9, 0A1h,  14h,	0A2h,  10h, 0A1h,  0Ch,	0A2h,  0Bh
		db  0A1h,    9,	0A2h,	 8,  21h, 0A2h,	   6,  21h, 0A2h,    5,	 21h, 0F8h, 0D1h, 0A2h,	   4,  21h
		db   22h,  21h,	 22h,  21h,  22h,  21h,	0F8h, 0E0h, 0A2h,    4,	 21h,  22h,  21h,  22h,	 21h,  22h
		db   21h, 0FDh,	   8,  22h,  21h,  22h,	 21h, 0FDh,    7,  22h,	 21h,  22h,  21h, 0FDh,	   6,  22h
		db   21h,  22h,	 21h, 0FDh,    5,  22h,	 21h,  22h,  21h, 0FDh,	   4,  22h,  21h,  22h,	 21h, 0FDh
		db     3,  22h,	 21h,  22h,  21h, 0FDh,	   2,  22h,  21h,  22h,	 21h, 0FDh,    1,  22h,	 21h,  22h
		db   21h, 0FDh,	   0,  22h,  21h,  22h,	 21h, 0FDh,    0,  22h,	 21h,  22h,  21h, 0FDh,	   9, 0A4h
		db   14h, 0A5h,	 10h, 0A4h,  0Ch, 0A5h,	 0Bh, 0A4h,    9, 0A5h,	   8,  24h, 0A5h,    6,	 24h, 0A5h
		db     5,  24h,	0A5h,	 4,  24h, 0F8h,	0D3h, 0A5h,    4,  24h,	 25h,  24h, 0F8h, 0E0h,	0A5h,	 4
		db   24h,  25h,	 24h,  25h,  24h,  25h,	 24h, 0FDh,    8,  25h,	 24h,  25h,  24h, 0FDh,	   7,  25h
		db   24h,  25h,	 24h, 0FDh,    6,  25h,	 24h,  25h,  24h, 0FDh,	   5,  25h,  24h,  25h,	 24h, 0FDh
		db     4,  25h,	 24h,  25h,  24h, 0FDh,	   3,  25h,  24h,  25h,	 24h, 0FDh,    2,  25h,	 24h,  25h
		db   24h, 0FDh,	   1,  25h,  24h,  25h,	 24h, 0FDh,    0,  25h,	 24h,  25h,  24h, 0FDh,	   0,  25h
		db   24h,  25h,	 24h, 0F0h, 0C0h, 0F8h,	0A1h
MUSIC_29_YM3:	db  0F8h,    0,	0F0h,  18h, 0FEh,    6,	0FCh,	 1, 0FBh,  2Ch,	0FAh,  40h, 0FDh,  0Ah,	0ACh,	 6
					; DATA XREF: ROM:D003o
		db   35h,  3Bh,	 43h, 0F0h,  18h, 0FDh,	   8, 0ACh,    6,  35h,	 3Bh,  43h, 0F0h,  18h,	0FDh,	 6
		db  0ACh,    6,	 35h,  3Bh,  43h, 0F0h,	 18h, 0FDh,    4, 0ACh,	   6,  35h,  3Bh,  43h,	0F0h,  18h
		db  0FDh,    2,	0ACh,	 6,  35h,  3Bh,	 43h, 0F0h,  18h, 0FDh,	   0, 0ACh,    6,  35h,	 3Bh,  43h
		db  0F0h,  78h,	0FDh,  0Ah, 0A8h,    6,	 31h,  3Bh,  46h, 0F0h,	 18h, 0FDh,    8, 0A8h,	   6,  31h
		db   3Bh,  46h,	0F0h,  18h, 0FDh,    6,	0A8h,	 6,  31h,  3Bh,	 46h, 0F0h,  18h, 0FDh,	   4, 0A8h
		db     6,  31h,	 3Bh,  46h, 0F0h,  18h,	0FDh,	 2, 0A8h,    6,	 31h,  3Bh,  46h, 0F0h,	 18h, 0FDh
		db     0, 0A8h,	   6,  31h,  3Bh,  46h,	0F0h,  78h, 0FDh,  0Ah,	0A7h,	 6,  32h,  3Ah,	 43h, 0F0h
		db   18h, 0FDh,	   8, 0A7h,    6,  32h,	 3Ah,  43h, 0F0h,  18h,	0FDh,	 6, 0A7h,    6,	 32h,  3Ah
		db   43h, 0F0h,	 18h, 0FDh,    4, 0A7h,	   6,  32h,  3Ah,  43h,	0F0h,  18h, 0FDh,    2,	0A7h,	 6
		db   32h,  3Ah,	 43h, 0F0h,  18h, 0FDh,	   0, 0A7h,    6,  32h,	 3Ah,  43h, 0F0h,  78h,	0FDh,  0Ah
		db  0A5h,    6,	 2Fh,  38h,  46h, 0F0h,	 18h, 0FDh,    8, 0A5h,	   6,  2Fh,  38h,  46h,	0F0h,  18h
		db  0FDh,    6,	0A5h,	 6,  2Fh,  38h,	 46h, 0F0h,  18h, 0FDh,	   4, 0A5h,    6,  2Fh,	 38h,  46h
		db  0F0h,  18h,	0FDh,	 2, 0A5h,    6,	 2Fh,  38h,  46h, 0F0h,	 18h, 0FDh,    0, 0A5h,	   6,  2Fh
		db   38h,  46h,	0F0h, 0C0h, 0FEh,  32h,	0FDh,  0Ah, 0FAh, 0C0h,	0FCh,  80h,  9Bh,  4Bh,	0FCh,  84h
		db  0FCh,    1,	 9Dh, 0D5h, 0FCh, 0FFh,	0FDh,	 9, 0FCh,  80h,	 97h, 0C0h, 0FCh,    1,	 97h, 0A8h
		db  0F0h,  18h,	0F0h,  32h, 0FAh,  40h,	0FCh,	 0, 0FEh,  37h,	0FDh,	 9, 0A1h,  14h,	0A2h,  10h
		db  0A1h,  0Ch,	0A2h,  0Bh, 0A1h,    9,	0A2h,	 8,  21h, 0A2h,	   6,  21h, 0A2h,    5,	 21h, 0F8h
		db  0D1h, 0A2h,	   4,  21h,  22h,  21h,	 22h,  21h,  22h,  21h,	0F8h, 0E0h, 0A2h,    4,	 21h,  22h
		db   21h,  22h,	 21h,  22h,  21h, 0FDh,	   8,  22h,  21h,  22h,	 21h, 0FDh,    7,  22h,	 21h,  22h
		db   21h, 0FDh,	   6,  22h,  21h,  22h,	 21h, 0FDh,    5,  22h,	 21h,  22h,  21h, 0FDh,	   4,  22h
		db   21h,  22h,	 21h, 0FDh,    3,  22h,	 21h,  22h,  21h, 0FDh,	   2,  22h,  21h,  22h,	 21h, 0FDh
		db     1,  22h,	 21h,  22h,  21h, 0FDh,	   0,  22h,  21h,  22h,	 21h, 0FDh,    0,  22h,	 21h,  22h
		db   21h, 0FDh,	   9, 0A4h,  14h, 0A5h,	 10h, 0A4h,  0Ch, 0A5h,	 0Bh, 0A4h,    9, 0A5h,	   8,  24h
		db  0A5h,    6,	 24h, 0A5h,    5,  24h,	0A5h,	 4,  24h, 0F8h,	0D3h, 0A5h,    4,  24h,	 25h,  24h
		db  0F8h, 0E0h,	0A5h,	 4,  24h,  25h,	 24h,  25h,  24h,  25h,	 24h, 0FDh,    8,  25h,	 24h,  25h
		db   24h, 0FDh,	   7,  25h,  24h,  25h,	 24h, 0FDh,    6,  25h,	 24h,  25h,  24h, 0FDh,	   5,  25h
		db   24h,  25h,	 24h, 0FDh,    4,  25h,	 24h,  25h,  24h, 0FDh,	   3,  25h,  24h,  25h,	 24h, 0FDh
		db     2,  25h,	 24h,  25h,  24h, 0FDh,	   1,  25h,  24h,  25h,	 24h, 0FDh,    0,  25h,	 24h,  25h
		db   24h, 0FDh,	   0,  25h,  24h,  25h,	 24h, 0F0h, 0BEh, 0F8h,	0A1h
MUSIC_29_YM4:	db  0F8h,    0,	0F0h,	 6, 0FEh,  11h,	0F9h,  20h, 0FDh,  0Bh,	0FCh,	 1, 0FBh,  50h,	0C0h,  0Ch
					; DATA XREF: ROM:D005o
		db  0FCh,  80h,	0C0h, 0B4h, 0FCh,    1,	0C0h,  90h, 0BEh,  0Ch,	0BEh,  24h, 0C3h,  0Ch,	0FCh,  80h
		db  0C3h, 0B4h,	0FCh,	 1, 0C3h, 0C0h,	0BEh,  0Ch, 0FCh,  80h,	0BEh, 0B4h, 0FCh,    1,	0BEh,  90h
		db  0BCh,  0Ch,	0BCh,  24h, 0BFh,  0Ch,	0FCh,  80h, 0BFh, 0B4h,	0BFh, 0BAh, 0FCh,    1,	0BFh,  60h
		db  0FBh,  2Ch,	0FEh,  32h, 0FDh,  0Ah,	0F9h,	 0, 0FAh, 0C0h,	0FCh,  80h,  91h,  4Bh,	0FCh,  84h
		db  0FCh,    1,	 93h, 0D5h, 0FCh, 0FFh,	0FDh,	 9, 0FCh,  80h,	 90h, 0C0h, 0FCh,    1,	 90h, 0A8h
		db  0F0h,  18h,	0F0h,  6Ah, 0F0h, 0FEh,	0FEh,  24h, 0FDh,    8,	 9Fh,  5Ah,  9Eh,  2Ch,	 9Dh,  26h
		db   99h,  1Ah,	 9Ah,  18h,  96h,  16h,	 97h,  14h,  93h,  18h,	0FCh,  80h,  92h,  29h,	0FCh,  84h
		db  0FCh,    1,	 91h,  4Fh, 0F0h, 0A8h,	0FCh, 0FFh, 0F0h,  32h,	0A2h,  5Ah, 0A1h,  2Ch,	0A0h,  26h
		db   9Ch,  1Ah,	 9Dh,  18h,  98h,  16h,	 99h,  14h,  95h,  18h,	0FCh,  80h,  96h,  29h,	0FCh,	 1
		db  0FCh,  85h,	 97h,  4Fh, 0F0h, 0C0h,	0F0h,  9Ah, 0FCh, 0FFh,	0F8h, 0A1h
MUSIC_29_YM5:	db  0F8h,    0,	0F8h, 0C3h, 0F0h, 0C0h,	0FCh,	 1, 0FBh,    0,	0FEh,  3Dh, 0FDh,  0Dh,	0ADh,	 8
					; DATA XREF: ROM:D007o
		db  0FDh,  0Bh,	 2Dh, 0FDh,    9,  2Dh,	0FDh,  0Ch,  2Dh, 0FDh,	 0Ah,  2Dh, 0FDh,    8,	 2Dh, 0FDh
		db   0Bh,  2Dh,	0FDh,	 9,  2Dh, 0FDh,	   7,  2Dh, 0FDh,  0Ah,	 2Dh, 0FDh,    8,  2Dh,	0FDh,	 6
		db   2Dh, 0FDh,	   9,  2Dh, 0FDh,    7,	 2Dh, 0FDh,    5,  2Dh,	0FDh,	 8,  2Dh, 0FDh,	   6,  2Dh
		db  0FDh,    4,	 2Dh, 0FDh,    7,  2Dh,	0FDh,	 5,  2Dh, 0FDh,	   3,  2Dh, 0FDh,    6,	 2Dh, 0F0h
		db   10h, 0F8h,	0E0h, 0F0h,  60h, 0FEh,	 3Eh, 0FDh,    6, 0ADh,	   6,  2Dh, 0FDh,    7,	 2Dh,  2Dh
		db  0FDh,    8,	 2Dh,  2Dh, 0FDh,    9,	 2Dh,  2Dh, 0FDh,  0Ah,	 2Dh,  2Dh, 0FDh,  0Bh,	 2Dh,  2Dh
		db  0FDh,  0Ch,	 2Dh,  2Dh, 0FDh,  0Dh,	 2Dh,  2Dh, 0FEh,  3Eh,	0FDh,  0Bh,  96h, 0C0h,	 70h, 0FEh
		db   3Dh, 0FDh,	 0Dh, 0ADh,    8, 0FDh,	 0Bh,  2Dh, 0FDh,    9,	 2Dh, 0FDh,  0Ch,  2Dh,	0FDh,  0Ah
		db   2Dh, 0FDh,	   8,  2Dh, 0FDh,  0Bh,	 2Dh, 0FDh,    9,  2Dh,	0FDh,	 7,  2Dh, 0FDh,	 0Ah,  2Dh
		db  0FDh,    8,	 2Dh, 0FDh,    6,  2Dh,	0FDh,	 9,  2Dh, 0FDh,	   7,  2Dh, 0FDh,    5,	 2Dh, 0FDh
		db     8,  2Dh,	0FDh,	 6,  2Dh, 0FDh,	   4,  2Dh, 0FDh,    7,	 2Dh, 0FDh,    5,  2Dh,	0FDh,	 3
		db   2Dh, 0FDh,	   6,  2Dh, 0F0h,  7Ah,	0F0h, 0C0h, 0F0h, 0DCh,	0F0h, 0D4h, 0F8h,  20h,	0FEh,  3Dh
		db  0FDh,  0Dh,	0ADh,	 8, 0FDh,  0Bh,	 2Dh, 0FDh,    9,  2Dh,	0FDh,  0Ch,  2Dh, 0FDh,	 0Ah,  2Dh
		db  0FDh,    8,	 2Dh, 0FDh,  0Bh,  2Dh,	0FDh,	 9,  2Dh, 0FDh,	   7,  2Dh, 0FDh,  0Ah,	 2Dh, 0FDh
		db     8,  2Dh,	0FDh,	 6,  2Dh, 0FDh,	   9,  2Dh, 0FDh,    7,	 2Dh, 0FDh,    5,  2Dh,	0FDh,	 8
		db   2Dh, 0FDh,	   6,  2Dh, 0FDh,    4,	 2Dh, 0FDh,    7,  2Dh,	0FDh,	 5,  2Dh, 0FDh,	   3,  2Dh
		db  0FDh,    6,	 2Dh, 0F0h,  10h, 0F8h,	 40h, 0F0h, 0DCh, 0F0h,	0D6h, 0F8h, 0A0h, 0F8h,	 60h, 0FDh
		db   0Dh, 0ADh,	   6, 0FDh,  0Bh,  2Dh,	0FDh,	 9,  2Dh, 0FDh,	 0Ch, 0ADh,  1Eh, 0FDh,	 0Dh, 0ADh
		db     6, 0FDh,	 0Bh,  2Dh, 0FDh,    9,	 2Dh, 0FDh,  0Ch, 0ADh,	 4Eh, 0FEh,  3Eh, 0FDh,	   9,  96h
		db   30h, 0F8h,	0A1h
MUSIC_29_YM6:	db  0FFh,    0,	   0	; DATA XREF: ROM:D009o
MUSIC_29_PSG1:	db  0F8h,    0,	0FBh,	 0, 0FCh,    0,	0FDh,  1Bh, 0ACh,    6,	 35h,  3Bh,  43h, 0FDh,	 1Ah,  2Ch
					; DATA XREF: ROM:D00Bo
		db   35h,  3Bh,	 43h, 0FDh,  19h,  2Ch,	 35h,  3Bh,  43h, 0FDh,	 18h,  2Ch,  35h,  3Bh,	 43h, 0FDh
		db   17h,  2Ch,	 35h,  3Bh,  43h, 0FDh,	 16h,  2Ch,  35h,  3Bh,	 43h, 0FDh,  15h,  2Ch,	 35h,  3Bh
		db   43h, 0FDh,	 14h,  2Ch,  35h,  3Bh,	 43h, 0FDh,  13h,  2Ch,	 35h,  3Bh,  43h, 0FDh,	 12h,  2Ch
		db   35h,  3Bh,	 43h, 0FDh,  11h,  2Ch,	 35h,  3Bh,  43h, 0FDh,	 10h,  2Ch,  35h,  3Bh,	 43h, 0FDh
		db     0, 0F0h,	 60h, 0FDh,  1Bh, 0A8h,	   6,  31h,  3Bh,  46h,	0FDh,  1Ah,  28h,  31h,	 3Bh,  46h
		db  0FDh,  19h,	 28h,  31h,  3Bh,  46h,	0FDh,  18h,  28h,  31h,	 3Bh,  46h, 0FDh,  17h,	 28h,  31h
		db   3Bh,  46h,	0FDh,  16h,  28h,  31h,	 3Bh,  46h, 0FDh,  15h,	 28h,  31h,  3Bh,  46h,	0FDh,  14h
		db   28h,  31h,	 3Bh,  46h, 0FDh,  13h,	 28h,  31h,  3Bh,  46h,	0FDh,  12h,  28h,  31h,	 3Bh,  46h
		db  0FDh,  11h,	 28h,  31h,  3Bh,  46h,	0FDh,  10h,  28h,  31h,	 3Bh,  46h, 0FDh,    0,	0F0h,  60h
		db  0FDh,  1Bh,	0A7h,	 6,  32h,  3Ah,	 43h, 0FDh,  1Ah,  27h,	 32h,  3Ah,  43h, 0FDh,	 19h,  27h
		db   32h,  3Ah,	 43h, 0FDh,  18h,  27h,	 32h,  3Ah,  43h, 0FDh,	 17h,  27h,  32h,  3Ah,	 43h, 0FDh
		db   16h,  27h,	 32h,  3Ah,  43h, 0FDh,	 15h,  27h,  32h,  3Ah,	 43h, 0FDh,  14h,  27h,	 32h,  3Ah
		db   43h, 0FDh,	 13h,  27h,  32h,  3Ah,	 43h, 0FDh,  12h,  27h,	 32h,  3Ah,  43h, 0FDh,	 11h,  27h
		db   32h,  3Ah,	 43h, 0FDh,  10h,  27h,	 32h,  3Ah,  43h, 0FDh,	   0, 0F0h,  60h, 0FDh,	 1Bh, 0A5h
		db     6,  2Fh,	 38h,  46h, 0FDh,  1Ah,	 25h,  2Fh,  38h,  46h,	0FDh,  19h,  25h,  2Fh,	 38h,  46h
		db  0FDh,  18h,	 25h,  2Fh,  38h,  46h,	0FDh,  17h,  25h,  2Fh,	 38h,  46h, 0FDh,  16h,	 25h,  2Fh
		db   38h,  46h,	0FDh,  15h,  25h,  2Fh,	 38h,  46h, 0FDh,  14h,	 25h,  2Fh,  38h,  46h,	0FDh,  13h
		db   25h,  2Fh,	 38h,  46h, 0FDh,  12h,	 25h,  2Fh,  38h,  46h,	0FDh,  11h,  25h,  2Fh,	 38h,  46h
		db  0FDh,  10h,	 25h,  2Fh,  38h,  46h,	0FDh,	 0, 0F0h,  60h,	 70h, 0FAh, 0B8h, 0F8h,	0C4h, 0F0h
		db   60h, 0F8h,	0E0h, 0FAh, 0C9h, 0F8h,	0CBh, 0F0h, 0A1h, 0F8h,	0E0h, 0F8h, 0A1h
MUSIC_29_PSG2:	db  0FFh,    0,	   0	; DATA XREF: ROM:D00Do
MUSIC_29_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:D00Fo	ROM:D011o
MUSIC_2E:	db 0			; DATA XREF: ROM:8000o
		db 0
		db 0
		db 201
		dw MUSIC_2E_YM1
		dw MUSIC_2E_YM2
		dw MUSIC_2E_YM3
		dw MUSIC_2E_YM4
		dw MUSIC_2E_YM5
		dw MUSIC_2E_YM6
		dw MUSIC_2E_PSG1
		dw MUSIC_2E_PSG2
		dw MUSIC_2E_PSG3
		dw MUSIC_2E_PSG3
MUSIC_2E_YM1:	db  0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	0FEh,  0Dh, 0FDh,  0Bh,	0F8h,  20h, 0B2h,    6,	 70h, 0B1h
					; DATA XREF: ROM:D7D0o
		db   54h, 0F0h,	 0Ch, 0B2h,  18h, 0B1h,	   6,  70h, 0F8h,  40h,	0B5h,  12h,  34h, 0B1h,	   6,  70h
		db  0F8h, 0A0h,	0F8h,  60h, 0B8h,  12h,	 37h, 0B5h,    6,  70h,	0FEh,  1Ah, 0FDh,  0Ah,	 25h,  26h
		db   25h,  26h,	 28h,  29h,  28h,  29h,	 2Ch,  2Dh,  2Ch,  2Dh,	 30h,  31h,  30h,  31h,	 32h,  34h
		db   32h,  34h,	 35h,  37h,  35h,  37h,	 38h,  39h,  38h,  39h,	 3Ch,  3Dh,  3Ch,  3Dh,	 3Eh, 0F0h
		db   12h, 0FEh,	 0Dh, 0FDh,  0Bh, 0F8h,	 20h, 0ADh,  18h, 0B2h,	 12h,  31h, 0B0h,    6,	 70h, 0AFh
		db   60h, 0F8h,	 40h, 0F0h,  18h, 0F8h,	0A0h, 0F8h,  60h, 0ADh,	   6, 0ADh,    4, 0F0h,	   8, 0ADh
		db     4, 0F0h,	   8, 0ADh,  18h, 0F0h,	   6,  2Fh, 0AFh,    4,	0F0h,	 8, 0AFh,    6,	 30h, 0B0h
		db     4, 0F0h,	   8, 0B0h,    4, 0F0h,	   8, 0B0h,  18h, 0F0h,	   6,  32h, 0B2h,    4,	0F0h,	 8
		db  0B2h,    6,	0F8h, 0C1h, 0B3h,    6,	 33h, 0B3h,    4, 0F0h,	 14h, 0F8h, 0E0h, 0F8h,	0C2h, 0B3h
		db     6,  33h,	0B3h,	 4, 0F0h,    8,	0F8h, 0E0h, 0F0h,  30h,	0F8h, 0A1h
MUSIC_2E_YM2:	db  0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	0F8h, 0C1h, 0FEh,  0Dh,	0FDh,  0Ah, 0ADh,    6,	 70h, 0ADh
					; DATA XREF: ROM:D7D2o
		db   3Ch, 0F0h,	 0Ch, 0ACh,  42h, 0F0h,	 0Ch, 0ACh,  12h, 0ACh,	   6,  70h, 0F8h, 0E0h,	0FEh,  1Ah
		db  0FDh,  0Ah,	 9Ch,	 6,  1Dh,  1Ch,	 1Dh,  20h,  21h,  20h,	 21h,  24h,  25h,  24h,	 25h,  28h
		db   29h,  28h,	 29h,  29h,  2Bh,  29h,	 2Bh,  2Dh,  2Eh,  2Dh,	 2Eh,  30h,  31h,  30h,	 31h,  34h
		db   35h,  34h,	 35h, 0B5h,  60h, 0F8h,	 20h, 0F0h,  18h,  32h,	0B7h,  12h,  35h, 0B4h,	   6,  70h
		db  0F8h,  40h,	0B2h,  60h, 0F8h, 0A0h,	0F8h,  60h, 0FEh,  0Dh,	0FDh,  0Ah, 0A9h,    6,	0A9h,	 4
		db  0F0h,    8,	0A9h,	 4, 0F0h,    8,	0A9h,  18h, 0F0h,    6,	 2Bh, 0ABh,    4, 0F0h,	   8, 0ABh
		db     6,  2Dh,	0ADh,	 4, 0F0h,    8,	0ADh,	 4, 0F0h,    8,	0ADh,  18h, 0F0h,    6,	 2Fh, 0AFh
		db     4, 0F0h,	   8, 0AFh,    6, 0F8h,	0C1h, 0AEh,    6,  2Eh,	0AEh,	 4, 0F0h,  14h,	0F8h, 0E0h
		db  0F8h, 0C2h,	0AEh,	 6,  2Eh, 0AEh,	   4, 0F0h,    8, 0F8h,	0E0h, 0F0h,  30h, 0F8h,	0A1h
MUSIC_2E_YM3:	db  0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	0F8h, 0C1h, 0FEh,  0Dh,	0FDh,  0Ah, 0A9h,    6,	 70h, 0A9h
					; DATA XREF: ROM:D7D4o
		db   3Ch, 0F0h,	 0Ch, 0A9h,  42h, 0F0h,	 0Ch, 0A9h,  12h, 0A9h,	   6,  70h, 0F8h, 0E0h,	0FEh,  1Ah
		db  0FDh,  0Ah,	 99h,	 6,  1Ah,  19h,	 1Ah,  1Ch,  1Dh,  1Ch,	 1Dh,  20h,  21h,  20h,	 21h,  24h
		db   25h,  24h,	 25h,  26h,  28h,  26h,	 28h,  29h,  2Bh,  29h,	 2Bh,  2Ch,  2Dh,  2Ch,	 2Dh,  30h
		db   31h,  30h,	 31h, 0B2h,  60h, 0F8h,	 20h, 0F0h,  18h,  29h,	0AFh,  12h,  2Dh, 0ABh,	   6,  70h
		db  0F8h,  40h,	0A9h,  60h, 0F8h, 0A0h,	0F8h,  60h, 0FEh,  0Dh,	0FDh,  0Ah, 0A6h,    6,	0A6h,	 4
		db  0F0h,    8,	0A6h,	 4, 0F0h,    8,	0A6h,  18h, 0F0h,    6,	 28h, 0A8h,    4, 0F0h,	   8, 0A8h
		db     6,  29h,	0A9h,	 4, 0F0h,    8,	0A9h,	 4, 0F0h,    8,	0A9h,  18h, 0F0h,    6,	 2Bh, 0ABh
		db     4, 0F0h,	   8, 0ABh,    6, 0F8h,	0C1h, 0ACh,    6,  2Ch,	0ACh,	 4, 0F0h,  14h,	0F8h, 0E0h
		db  0F8h, 0C2h,	0ACh,	 6,  2Ch, 0ACh,	   4, 0F0h,    8, 0F8h,	0E0h, 0F0h,  30h, 0F8h,	0A1h
MUSIC_2E_YM4:	db  0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	0F8h, 0C1h, 0FEh,  19h,	0FDh,  0Ch,  8Eh,    6,	0F0h,  1Eh
					; DATA XREF: ROM:D7D6o
		db   95h,    6,	0F0h,  12h,  89h,    6,	0F0h,  12h,  8Ah,  6Ch,	0F8h, 0E0h, 0F0h,  0Ch,	 8Eh,	 6
		db  0F0h,  12h,	 8Eh,	 6, 0F0h,  12h,	 8Eh,	 6, 0F0h,  12h,	 8Eh,	 6,  70h, 0F0h,	 0Ch,  8Ch
		db     6, 0F0h,	 12h,  8Bh,    6, 0F0h,	 12h,  8Ah,    6, 0F0h,	 12h,  89h,    6,  70h,	0F8h, 0C3h
		db   8Eh,  36h,	0F0h,  0Ch,  8Eh,  12h,	 8Eh,	 6,  70h, 0F8h,	0E0h,  8Eh,    6,  8Eh,	   4, 0F0h
		db     8,  8Eh,	   4, 0F0h,    8,  8Eh,	 18h, 0F0h,    6,  0Ch,	 8Ch,	 4, 0F0h,    8,	 8Ch,	 6
		db   0Ah,  8Ah,	   4, 0F0h,    8,  8Ah,	   4, 0F0h,    8,  8Ah,	 18h, 0F0h,    6,    8,	 88h,	 4
		db  0F0h,    8,	 88h,	 6,  12h,  70h,	 0Dh, 0F0h,  12h,  8Fh,	   6,  70h,    8, 0F0h,	 12h,  8Ah
		db     6,  70h,	 0Dh,  70h,  0Fh,  70h,	 12h,  70h,  14h,  70h,	 19h, 0F0h,  36h, 0F8h,	0A1h
MUSIC_2E_YM5:	db  0F9h,  20h,	0F0h,	 6, 0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	0FAh,  40h, 0FEh,  0Dh,	0FDh,	 9
					; DATA XREF: ROM:D7D8o
		db  0F8h,  20h,	0B2h,	 6,  70h, 0B1h,	 54h, 0F0h,  0Ch, 0B2h,	 18h, 0B1h,    6,  70h,	0F8h,  40h
		db  0B5h,  12h,	 34h, 0B1h,    6,  70h,	0F8h, 0A0h, 0F8h,  60h,	0B8h,  12h,  37h, 0B5h,	   6,  70h
		db  0FEh,  1Ah,	0FDh,	 8, 0FAh,  80h,	 25h,  26h,  25h,  26h,	 28h,  29h,  28h,  29h,	 2Ch,  2Dh
		db   2Ch,  2Dh,	 30h,  31h,  30h,  31h,	 32h,  34h,  32h,  34h,	 35h,  37h,  35h,  37h,	 38h,  39h
		db   38h,  39h,	 3Ch,  3Dh,  3Ch,  3Dh,	 3Eh, 0F0h,  12h, 0FEh,	 0Dh, 0FDh,    9, 0FAh,	 40h, 0F8h
		db   20h, 0ADh,	 18h, 0B2h,  12h,  31h,	0B0h,	 6,  70h, 0AFh,	 60h, 0F8h,  40h, 0F0h,	 18h, 0F8h
		db  0A0h, 0F8h,	 60h, 0FAh, 0C0h, 0ADh,	   6, 0ADh,    4, 0F0h,	   8, 0ADh,    4, 0F0h,	   8, 0ADh
		db   18h, 0F0h,	   6,  2Fh, 0AFh,    4,	0F0h,	 8, 0AFh,    6,	 30h, 0B0h,    4, 0F0h,	   8, 0B0h
		db     4, 0F0h,	   8, 0B0h,  18h, 0F0h,	   6,  32h, 0B2h,    4,	0F0h,	 8, 0B2h,    6,	0F8h, 0C1h
		db  0B3h,    6,	 33h, 0B3h,    4, 0F0h,	 14h, 0F8h, 0E0h, 0F8h,	0C2h, 0B3h,    6,  33h,	0B3h,	 4
		db  0F0h,    8,	0F8h, 0E0h, 0F0h,  30h,	0F8h, 0A1h
MUSIC_2E_YM6:	db  0F8h,    0,	0F8h, 0C1h,  85h,  0Ch,	 85h,  18h,  89h,    6,	 0Ah,  89h,  0Ch,  8Ah,	   6,  0Ah
					; DATA XREF: ROM:D7DAo
		db   89h,  0Ch,	   9, 0F0h,  30h,  89h,	   6,  0Bh,  0Bh,    9,	 0Bh,  0Bh,    9,  0Bh,	0F8h, 0E0h
		db   8Bh,    6,	 0Bh,  0Bh,  0Bh,  0Ah,	 0Bh,  0Bh,  0Bh,  0Ah,	 0Bh,  0Bh,  0Bh,  0Ah,	 0Bh,  0Bh
		db   0Bh,    9,	 0Ah,  0Ah,  0Ah,    9,	 0Ah,  0Ah,  0Ah,    9,	 0Ah,  0Ah,  0Ah,    9,	 0Ah,  0Ah
		db   0Ah, 0F8h,	0C1h,  89h,  18h,  85h,	 2Ah,  80h,  12h,  80h,	 0Ch,	 0,  8Bh,    3,	 8Bh,	 2
		db   0Bh,  0Bh,	 8Ah,	 3,  89h,  18h,	 89h,  0Ch,  8Ah,    6,	 89h,  0Ch,  8Ah,    6,	 89h,  0Ch
		db  0F8h, 0E0h,	0F8h, 0C1h,  89h,    6,	 89h,  0Ch,    9,  80h,	   6,  80h,  0Ch,    0,	 89h,	 6
		db   89h,  0Ch,	 89h,	 6, 0F8h, 0E0h,	0F8h, 0C1h,  85h,  0Ch,	   5,	 9, 0F8h, 0E0h,	 89h,	 6
		db   0Ah,  89h,	 0Ch, 0F8h, 0C3h,  85h,	 0Ch, 0F8h, 0E0h, 0F0h,	   6,  0Bh,  0Bh,  0Ah,	 89h,  0Ch
		db     0, 0F8h,	0A1h
MUSIC_2E_PSG1:	db  0FCh,    1,	0FBh,  4Ch, 0F8h,    0,	0FDh,	 0, 0F0h,  60h,	0F8h, 0C3h, 0FDh,  7Bh,	0BAh,	 6
					; DATA XREF: ROM:D7DCo
		db   3Bh,  3Eh,	 41h, 0F8h, 0E0h, 0FDh,	   0, 0F0h,  60h, 0F8h,	0C3h, 0FDh,  7Bh, 0BAh,	   6,  3Bh
		db   3Eh,  41h,	0F8h, 0E0h, 0F8h, 0C1h,	0FDh,	 0, 0F0h,  0Ch,	0FDh,  7Ah, 0ADh,    6,	0FDh,	 0
		db  0F0h,  12h,	0FDh,  7Ah, 0ADh,    6,	0FDh,	 0, 0F0h,  12h,	0FDh,  7Ah, 0ADh,    6,	0FDh,	 0
		db  0F0h,  12h,	0FDh,  7Ah, 0ADh,    6,	0FDh,	 0,  70h, 0F8h,	0E0h, 0FDh,  7Ah, 0F8h,	0C3h, 0A6h
		db     6,  29h,	 2Dh,  29h, 0F8h, 0E0h,	0F8h, 0C3h, 0A6h,    6,	 2Bh,  2Fh,  2Bh, 0F8h,	0E0h, 0F8h
		db  0C3h, 0A6h,	   6,  29h,  2Dh,  29h,	0F8h, 0E0h, 0F8h, 0C3h,	0A6h,	 6,  2Bh,  2Fh,	 2Bh, 0F8h
		db  0E0h, 0FDh,	   0, 0F0h,  18h, 0FDh,	 1Bh, 0BEh,    6,  39h,	 35h,  32h, 0FDh,    0,	0F0h,  24h
		db  0F0h,  18h,	0FDh,  1Bh, 0BCh,    6,	 39h,  35h,  30h, 0FDh,	   0, 0F0h,  24h, 0F8h,	0C1h, 0FDh
		db   1Bh, 0BAh,	   6,  3Ah,  3Ah, 0FDh,	   0, 0F0h,  12h, 0F8h,	0E0h, 0F8h, 0C2h, 0FDh,	 1Bh, 0BAh
		db     6,  3Ah,	 3Ah, 0FDh,    0,  70h,	0F8h, 0E0h, 0F0h,  30h,	0F8h, 0A1h
MUSIC_2E_PSG2:	db  0FCh,    1,	0FBh,  4Ch, 0F8h,    0,	0FDh,	 0, 0F0h,  63h,	0F8h, 0C3h, 0FCh,  7Ch,	0BAh,	 6
					; DATA XREF: ROM:D7DEo
		db   3Bh,  3Eh,	 41h, 0F8h, 0E0h, 0FDh,	   0, 0F0h,  60h, 0F8h,	0C3h, 0FDh,  79h, 0BAh,	   6,  3Bh
		db   3Eh,  41h,	0F8h, 0E0h, 0FDh,    0,	0F0h,	 9, 0FDh,  7Ah,	0A9h,	 6, 0FDh,    0,	0F0h,  12h
		db  0FDh,  7Ah,	0A9h,	 6, 0FDh,    0,	0F0h,  12h, 0FDh,  7Ah,	0A9h,	 6, 0FDh,    0,	0F0h,  12h
		db  0FDh,  7Ah,	0A9h,	 6, 0FDh,    0,	 70h, 0F0h,  0Ch, 0FDh,	 7Ah, 0A9h,    6, 0FDh,	   0, 0F0h
		db   12h, 0FDh,	 7Ah, 0A9h,    6, 0FDh,	   0, 0F0h,  12h, 0FDh,	 7Ah, 0A9h,    6, 0FDh,	   0, 0F0h
		db   12h, 0FDh,	 7Ah, 0A9h,    6, 0FDh,	   0, 0F0h,    9, 0F8h,	0C3h, 0FDh,  78h, 0A6h,	   6,  29h
		db   2Dh,  29h,	0F8h, 0E0h, 0F8h, 0C3h,	0A6h,	 6,  2Bh,  2Fh,	 2Bh, 0F8h, 0E0h, 0F8h,	0C3h, 0A6h
		db     6,  29h,	 2Dh,  29h, 0F8h, 0E0h,	0F8h, 0C3h, 0A6h,    6,	 2Bh,  2Fh,  2Bh, 0F8h,	0E0h, 0FDh
		db     0, 0F0h,	 18h, 0FDh,  19h, 0BEh,	   6,  39h,  35h,  32h,	0FDh,	 0, 0F0h,  24h,	0F0h,  18h
		db  0FDh,  19h,	0BCh,	 6,  39h,  35h,	 30h, 0FDh,    0, 0F0h,	 21h, 0F8h, 0C1h, 0FDh,	 1Bh, 0B8h
		db     6,  38h,	 38h, 0FDh,    0, 0F0h,	 12h, 0F8h, 0E0h, 0F8h,	0C2h, 0FDh,  1Bh, 0B8h,	   6,  38h
		db   38h, 0FDh,	   0,  70h, 0F8h, 0E0h,	0F0h,  30h, 0F8h, 0A1h
MUSIC_2E_PSG3:	db  0FFh,    0,	   0, 0F0h,    0, 0FFh,	   0,	 0,    2,  21h,	0DDh,  21h, 0DDh,  21h,	0DDh
					; DATA XREF: ROM:D7E0o	ROM:D7E2o
MUSIC_NULL:	db 0			; DATA XREF: ROM:8000o
		db 0
		db 0
		db 200
		dw MUSIC_NULL_CMD
		dw MUSIC_NULL_CMD
		dw MUSIC_NULL_CMD
		dw MUSIC_NULL_CMD
		dw MUSIC_NULL_CMD
		dw MUSIC_NULL_CMD
		dw MUSIC_NULL_CMD
		dw MUSIC_NULL_CMD
		dw MUSIC_NULL_CMD
		dw MUSIC_NULL_CMD
MUSIC_NULL_CMD:	db  0FFh,    0,	   0
		end
