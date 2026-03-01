;; Sound Bank 4 ASM Listing (YM Instrument Data and music Tracks 0x00 - 0x1E)

        cpu z80
        listing	off
        phase	0
; ===========================================================================
		org 8000h
YM_INSTMT_00:	db   20h,  40h,	 33h,  32h,  1Bh,  7Fh,	 7Fh,  7Fh,  5Fh,  1Fh,	 1Fh,  1Fh,    3,  11h,	 11h
		db   11h,    0,	   6,	 6,    6,  5Ah,	   0,	 0,    0,    0,	   0,	 0,    0,  3Dh
YM_INSTMT_01:	db     3,  32h,	 31h,  71h,  23h,  24h,	 7Fh,  7Fh, 0DFh, 0DFh,	 9Fh,  99h,    0,    0,	 10h
		db   13h,    8,	   8,	 5,    5,  40h,	 40h,  35h,    5,    0,	   0,	 0,    0,  1Ch
YM_INSTMT_02:	db   30h,  30h,	 30h,  31h,  19h,  7Fh,	 7Fh,  7Fh,  1Fh,  1Fh,	 1Fh,  1Fh,  18h,  19h,	 13h
		db   0Dh,    0,	 1Bh,	 5,    5,  0Fh,	 3Fh,  2Fh, 0FFh,    0,	   0,	 0,    0,    5
YM_INSTMT_03:	db   61h,  41h,	 3Ah,  22h,  17h,  1Ah,	 3Ah,  7Fh,  10h,  51h,	 91h,  11h,  0Eh,  0Eh,	 0Eh
		db     3,    0,	   0,	 0,    0,  17h,	 17h, 0F7h,    7,    0,	   0,	 0,    0,  32h
YM_INSTMT_04:	db   20h,  20h,	 20h,  21h,  21h,  7Fh,	 7Fh,  7Fh,  5Ch,  1Ch,	 5Ch, 0DEh,    9,    8,	 0Eh
		db     7,    7,	 0Ah,  0Ah,  0Ah, 0F9h,	 49h,  59h,  89h,    0,	   0,	 0,    0,  3Eh
YM_INSTMT_05:	db   71h,  33h,	 0Ch,	 1,  25h,  25h,	 2Fh,  7Fh,  1Ch,  1Dh,	 16h,  1Fh,    4,    4,	   6
		db     8,    0,	   3,	 1,    0,  16h,	 16h,  17h, 0A6h,    0,	   0,	 0,    0,  3Ah
YM_INSTMT_06:	db   32h,  32h,	 31h,  31h,  1Dh,  30h,	 2Ah,  7Fh,  5Fh,  1Fh,	 5Fh,  9Fh,  0Ch,    6,	 0Dh
		db   0Ch,    0,	   5,	 6,    7, 0F4h,	 15h,  15h,  14h,    0,	   0,	 0,    0,  39h
YM_INSTMT_07:	db   0Ah,    1,	   8,	 2,  28h,  24h,	 23h,  7Fh,  14h,  10h,	 14h,  0Eh,    5,    2,	   8
		db     8,    0,	   0,	 0,    0,  99h,	   9,	 9,  19h,    0,	   0,	 0,    0,  38h
YM_INSTMT_08:	db   32h,  71h,	   3,  32h,  1Eh,  7Ah,	 7Fh,  7Ah,  1Dh, 0CCh,	 8Ch,  5Dh,    4,    3,	   4
		db   1Ch,    7,	   2,	 1,    2,  76h,	0A6h, 0C5h,  15h,    0,	   0,	 0,    0,  3Dh
YM_INSTMT_09:	db   46h,  42h,	 42h,  41h,  1Fh,  1Fh,	 39h,  7Fh,  12h,  19h,	 14h,  4Fh,    8,    1,	   5
		db     1,    1,	   1,	 1,    1,  76h,	0F8h, 0FAh, 0F9h,    0,	   0,	 0,    0,  3Bh
YM_INSTMT_0A:	db   68h,  35h,	 24h,  31h,  1Eh,  41h,	 19h,  7Fh,  5Fh,  5Eh,	 9Bh,  9Eh,  0Ch,    8,	   3
		db     3,    0,	   3,	 3,    3, 0BAh,	0B6h,  77h,  67h,    0,	   0,	 0,    0,  24h
YM_INSTMT_0B:	db   14h,  51h,	 30h,  62h,  7Dh,  76h,	 78h,  76h,  96h,  92h,	 90h,  94h,    0,    0,	   0
		db     0,    0,	   0,	 0,    0, 0F8h,	0F7h, 0F7h, 0F7h,    0,	   0,	 0,    0,  2Fh
YM_INSTMT_0C:	db   30h,  60h,	   1,  60h,  10h,    6,	 7Fh,  7Fh,  5Fh,  9Fh,	 5Fh,  9Fh,    1,    6,	   4
		db   0Ah,    1,	   5,	 1,  1Fh,  55h,	 25h,  25h, 0A8h,    0,	   0,	 0,    0,  2Ch
YM_INSTMT_0D:	db   61h,  11h,	 6Ah,  62h,  17h,  1Ah,	 3Ah,  7Fh,  10h,  51h,	 91h,  11h,  0Eh,  0Eh,	 0Eh
		db     3,    0,	   0,	 0,    0,  17h,	 17h, 0F7h,    7,    0,	   0,	 0,    0,  3Ah
YM_INSTMT_0E:	db   17h,  67h,	 11h,  61h,  24h,  24h,	 7Fh,  7Fh,  1Fh,  1Fh,	 1Fh,  1Fh,  0Ch,  0Ch,	 0Dh
		db   0Dh,    2,	   2,	 5,    5, 0F2h,	0F2h,  36h,  36h,    0,	   0,	 0,    0,  3Ch
YM_INSTMT_0F:	db   21h,  58h,	 41h,  11h,  23h,  5Ah,	 7Fh,  7Fh, 0DFh, 0DFh,	 99h,  99h,    0,    0,	   7
		db     8,    8,	   8,	 2,    2, 0F0h,	0F0h,  37h,  37h,    0,	   0,	 0,    0,    4
YM_INSTMT_10:	db     1,  62h,	 36h,  32h,  2Ch,  26h,	 42h,  7Fh, 0DAh, 0D0h,	 54h,  0Eh,    9,  0Bh,	   7
		db     4,    3,	   0,	 0,    0, 0E6h,	 26h, 0F6h,  0Bh,    0,	   0,	 0,    0,    3
YM_INSTMT_11:	db   76h,  36h,	 0Ch,	 1,  25h,  21h,	 29h,  7Fh,  1Ch,  1Dh,	 16h,  1Fh,    4,  0Ah,	 0Bh
		db     9,    0,	   9,  0Dh,    8,  16h,	 16h,  17h,  16h,    0,	   0,	 0,    0,  2Ah
YM_INSTMT_12:	db     2,    2,	   1,	 1,  1Eh,  28h,	 32h,  7Fh,  1Fh,  1Fh,	 1Fh,  12h,    0,    0,	   0
		db     0,    0,	   0,	 0,    0, 0F8h,	0F8h, 0F8h, 0F8h,    0,	   0,	 0,    0,  39h
YM_INSTMT_13:	db   21h,  42h,	   2,  62h,  15h,  1Ch,	 7Fh,  7Fh,  59h,  56h,	 50h,  50h,  0Bh,    0,	 0Bh
		db   0Bh,    0,	   0,	 5,    5,  1Bh,	 1Bh,  3Ah,  3Ah,    0,	   0,	 0,    0,  34h
YM_INSTMT_14:	db   41h,  53h,	 11h,  61h,  1Ah,  7Fh,	 7Fh,  7Fh,  4Eh, 0DAh,	0DDh, 0DBh,    0,    1,	   0
		db     0,    0,	   1,	 0,    0,  25h,	 65h,  98h,  98h,    0,	   0,	 0,    0,  3Dh
YM_INSTMT_15:	db   3Fh,  70h,	 5Fh,  3Fh,    0,    1,	 7Fh,  7Fh,  1Fh,  1Dh,	 1Fh,  1Fh,  12h,  10h,	 0Ch
		db   0Bh,    0,	 0Ah,	 7,  0Eh,  0Fh,	 3Fh, 0CFh, 0FFh,    0,	   9,	 0,    0,  3Ch
YM_INSTMT_16:	db   3Fh,  70h,	 5Fh,  3Fh,    0,    1,	 7Fh,  7Fh,  1Fh,  1Fh,	 1Fh,  1Fh,  12h,  14h,	 0Fh
		db   10h,    0,	 0Eh,	 7,  14h,  0Fh,	 3Fh, 0CFh, 0FFh,    0,	   0,	 0,    0,  3Ch
YM_INSTMT_17:	db   0Fh,  39h,	 52h,  31h,  1Ch,  20h,	 7Fh,  7Fh,  1Fh,  1Fh,	 1Fh,  1Fh,  1Eh,  1Fh,	 15h
		db   15h,  18h,	 11h,  0Eh,  0Eh,    5,	   5,	 5,    5,    0,	   0,	 0,    0,  3Ch
YM_INSTMT_18:	db   17h,  67h,	 11h,  61h,  24h,  24h,	 7Fh,  7Fh,  1Fh,  1Fh,	 1Fh,  1Fh,    9,  0Ch,	   8
		db     8,    2,	   2,	 5,    3, 0F2h,	0F2h,  76h,  76h,    0,	   0,	 0,    0,  3Ch
YM_INSTMT_19:	db   71h,  33h,	 0Ch,	 1,  25h,  25h,	 2Fh,  7Fh,  1Ch,  1Dh,	 16h,  0Fh,    4,    4,	   6
		db     4,    0,	   3,	 1,    0,  16h,	 16h,  17h, 0A6h,    0,	   0,	 0,    0,  3Ah
YM_INSTMT_1A:	db   51h,  11h,	   1,	 1,  1Ch,  28h,	 7Fh,  7Fh,  0Fh,  0Fh,	 10h,  10h,    6,    0,	 0Fh
		db     6,    0,	   0,	 0,    0,  29h,	 2Ah,  29h,  29h,    0,	   0,	 0,    0,  3Ch
YM_INSTMT_1B:	db     1,    2,	   1,	 1,  1Dh,  7Fh,	 7Fh,  7Fh,  4Ch,  50h,	 4Fh,  52h,  0Bh,    1,	   5
		db     2,    1,	   0,	 0,    0,  27h,	 27h,  27h,  17h,    0,	   0,	 0,    0,  3Dh
YM_INSTMT_1C:	db   61h,  51h,	   8,	 2,  1Bh,  23h,	 2Eh,  7Fh,  1Fh,  16h,	 14h,  1Fh,    4,  1Fh,	 0Fh
		db   1Fh,    0,	   0,	 0,    0,  1Ah,	 0Ah,  5Bh,  0Ah,    0,	   0,	 0,    0,  3Ah
YM_INSTMT_1D:	db   0Ah,  30h,	 70h,	 0,  24h,  13h,	 2Dh,  7Fh,  9Fh,  9Fh,	 9Fh,  9Fh,  12h,  0Ah,	 0Eh
		db   0Ah,    0,	   4,	 4,    3,  28h,	 25h,  25h,  25h,    0,	   0,	 0,    0,    8
YM_INSTMT_1E:	db   72h,  33h,	 72h,  32h,  19h,  17h,	 7Fh,  7Fh,  9Fh,  9Fh,	 93h, 0D4h,    1,    1,	   3
		db     3,    1,	   1,	 1,    1,  16h,	 15h,  25h,  25h,    0,	   0,	 0,    0,  2Ch
YM_INSTMT_1F:	db     3,  32h,	 31h,  71h,  23h,  24h,	 7Fh,  7Fh, 0DFh, 0DFh,	 9Fh,  99h,    0,    0,	 0Ah
		db     8,    8,	   8,	 2,    1,  40h,	 40h,  35h,  45h,    0,	   0,	 0,    0,    4
YM_INSTMT_20:	db   73h,  10h,	 10h,  71h,  1Dh,  0Eh,	 1Dh,  7Fh, 0CFh,  9Fh,	 9Fh,  5Fh,  0Ah,  0Ah,	   4
		db     2,    0,	   4,	 6,    7,  1Fh,	0FFh, 0ECh, 0E8h,    0,	   0,	 0,    0,  3Bh
YM_INSTMT_21:	db   4Ch,  40h,	 41h,  40h,  27h,  18h,	 18h,  7Fh,  9Fh,  1Fh,	 1Fh,  1Fh,  0Fh,    9,	 0Eh
		db   0Bh,    0,	   0,	 0,    0,  7Ch,	 5Bh,  2Ch,  16h,    0,	   0,	 0,    0,  3Bh
YM_INSTMT_22:	db   51h,  11h,	   1,	 2,  1Ch,  28h,	 7Fh,  7Fh,  1Fh,  1Fh,	 19h,  16h,    6,    0,	 0Fh
		db     6,    0,	   0,	 0,    0,  29h,	 2Ah,  29h,  29h,    0,	   0,	 0,    0,  3Ch
YM_INSTMT_23:	db   75h,  71h,	 13h,  11h,  1Eh,  1Eh,	 1Eh,  7Fh, 0DFh,  1Fh,	 5Fh,  1Fh,  0Ch,    1,	 0Dh
		db     1,    0,	   0,	 0,    0, 0FFh,	0FFh, 0FFh, 0FFh,    0,	   0,	 0,    0,  38h
YM_INSTMT_24:	db   41h,  70h,	 10h,  41h,  2Dh,  20h,	 14h,  7Fh,  0Bh,  54h,	 56h,  16h,    2,    5,	   8
		db     1,    0,	   0,  0Fh,    0,  18h,	 58h,  38h,  17h,    0,	   0,	 0,    0,  38h
YM_INSTMT_25:	db   21h,  21h,	 21h,  21h,  7Fh,    0,	 7Fh,	 0, 0D6h, 0D6h,	0D6h, 0D6h,    4,    4,	   4
		db     4,  1Fh,	 1Fh,  1Fh,  1Fh, 0F8h,	0F8h, 0F8h, 0F7h,    0,	   0,	 0,    0,    7
YM_INSTMT_26:	db   51h,  11h,	   1,	 1,  1Ch,  24h,	 7Fh,  7Fh,  15h,  17h,	 12h,  12h,    6,    0,	 0Fh
		db     6,    0,	   0,	 0,    0,  28h,	 28h,  28h,  28h,    0,	   0,	 0,    0,  3Ch
YM_INSTMT_27:	db   52h,  23h,	   1,  71h,  22h,  20h,	 7Fh,  7Fh,  9Fh,  9Fh,	 9Eh,  9Fh,  18h,  18h,	 0Dh
		db   0Ch,  0Bh,	 0Bh,  0Bh,    9,    6,	   6,  16h,    6,    8,	   8,	 0,    0,  3Ch
YM_INSTMT_28:	db   50h,  71h,	 60h,  21h,  21h,  24h,	 7Fh,  7Fh,  5Eh,  5Eh,	 9Eh,  9Fh,    6,    6,	 14h
		db   12h,    6,	   6,  0Dh,  0Bh, 0C6h,	0D6h,  36h,  36h,    0,	   0,	 0,    0,  14h
YM_INSTMT_29:	db   52h,  23h,	   1,  71h,  22h,  20h,	 7Fh,  7Fh,  9Fh,  9Fh,	 9Eh,  9Fh,  1Ah,  1Ah,	 0Dh
		db   0Ch,  0Ch,	 0Ch,  0Bh,    9,    6,	   6,  16h,    6,    0,	   0,	 0,    0,  3Ch
YM_INSTMT_2A:	db     9,  65h,	 21h,  42h,  1Bh,  2Bh,	 7Ah,  7Fh,  0Bh,  13h,	 17h,  17h,    8,  0Eh,	   0
		db   0Ah,  0Bh,	   8,	 8,    9,    5,	 85h, 0F5h, 0A7h,    0,	   0,	 0,    0,  3Ch
YM_INSTMT_2B:	db   21h,  11h,	 12h,	 2,  19h,  1Ch,	 10h,  7Fh,  51h,  1Fh,	 16h,  16h,    8,    6,	   6
		db     1,    7,	   6,	 6,  0Dh,  42h,	 42h,  12h,  69h,    0,	   0,	 0,    0,  3Dh
YM_INSTMT_2C:	db   41h,  42h,	 42h,  42h,  1Dh,  2Bh,	 32h,  7Fh,  1Ch,  10h,	 10h,  11h,  10h,    1,	 0Eh
		db     1,  0Dh,	   1,  13h,    1,  2Ah,	 19h, 0F9h,  19h,    0,	   0,	 0,    0,  38h
YM_INSTMT_2D:	db   27h,  42h,	 38h,  32h,  25h,  2Ah,	 72h,  7Fh,  5Fh,  1Fh,	 1Fh,  0Dh,    0,  10h,	 0Bh
		db   12h,    0,	 10h,	 0,    0, 0DAh,	 0Ah,  69h,  0Bh,    0,	 0Eh,	 0,    0,  0Ch
YM_INSTMT_2E:	db   40h,  10h,	 62h,  31h,  20h,  21h,	 1Fh,  7Fh,  1Fh,  1Eh,	 1Fh, 0DEh,  19h,  0Fh,	   6
		db     9,  13h,	 0Dh,	 5,    8,    6,	   6,  46h,    8,    0,	   0,	 0,    0,  39h
YM_INSTMT_2F:	db   2Fh,  40h,	 3Fh,  3Fh,    0,  0Ch,	 7Fh,  7Fh,  5Fh,  1Fh,	 0Eh,  11h,    0,    9,	 0Bh
		db   0Dh,    0,	   0,	 0,    9, 0FAh,	 5Ch, 0FCh, 0FCh,    0,	   0,	 0,    0,  3Ch
YM_INSTMT_30:	db   50h,  70h,	 61h,  21h,  25h,  2Eh,	 7Fh,  7Fh,  5Eh,  5Eh,	 9Eh,  9Fh,    6,    6,	 0Ah
		db   0Bh,    6,	   6,  0Dh,  0Bh, 0C6h,	0D6h,  36h,  36h,    0,	   0,	 0,    0,  14h
YM_INSTMT_31:	db   41h,  41h,	 42h,  42h,  23h,  32h,	 78h,  7Fh,  1Ch,  1Bh,	 1Fh,  0Bh,  10h,    1,	 0Fh
		db     1,  0Dh,	   1,  0Fh,    1,  29h,	 19h, 0FAh,  1Ah,    0,	   0,  0Eh,    0,  3Ch
YM_INSTMT_32:	db   63h,  31h,	 31h,  30h,  19h,  20h,	 17h,  7Fh,    7,  14h,	 0Bh,  1Bh,    6,    0,	   0
		db     4,    2,	   0,	 0,    4,  84h,	 82h,  84h,  84h,    0,	   0,	 0,    0,  38h
YM_INSTMT_33:	db   44h,  60h,	 62h,  60h,  1Dh,  0Bh,	 37h,  7Fh,  16h,  1Fh,	 1Fh,  1Fh,    1,  0Eh,	   1
		db     1,    4,	   4,  0Ah,    1,  5Ah,	 28h,  77h,  19h,    0,	   0,	 0,    0,  1Bh
YM_INSTMT_34:	db   71h,  71h,	 41h,  41h,  19h,  19h,	 13h,  7Fh,  1Fh,  15h,	 1Fh,  1Fh,  0Ah,    8,	 13h
		db     4,  12h,	   3,  0Eh,    1, 0C6h,	 1Ah,  15h,  1Bh,    0,	   0,	 0,    0,  3Ah
YM_INSTMT_35:	db   51h,  51h,	 34h,  41h,  1Dh,  39h,	 22h,  7Fh,  1Fh,  1Fh,	 1Dh,  0Fh,    4,    5,	   8
		db     2,    2,	   1,	 6,    2, 0E2h,	0D1h, 0A2h, 0D7h,    0,	   0,	 0,    0,  3Ah
YM_INSTMT_36:	db   46h,  42h,	 42h,  41h,  1Fh,  1Fh,	 39h,  7Fh,  12h,  19h,	 14h,  4Fh,    8,    1,	   5
		db     8,    1,	   1,	 1,    1,  76h,	0F8h, 0FAh,  29h,    0,	   0,	 0,    0,  3Bh
YM_INSTMT_37:	db   34h,  74h,	 4Bh,  7Fh,  23h,  29h,	 7Fh,  75h,  5Bh,  5Fh,	 9Fh,  1Fh,    4,    7,	   7
		db     8,    0,	   0,	 0,    0, 0F6h,	0E4h, 0F7h, 0F7h,    0,	   0,	 0,    0,  34h
YM_INSTMT_38:	db   31h,  41h,	 3Ah,  22h,  17h,  1Ah,	 3Ah,  7Fh,  10h,  51h,	 91h,  11h,  0Eh,  0Eh,	 0Eh
		db     2,    0,	 0Ah,	 0,    2,  17h,	 17h, 0F7h,    7,    0,	   0,	 0,    0,  32h
YM_INSTMT_39:	db   40h,  71h,	 41h,	 1,    0,  7Fh,	 7Fh,  7Fh,  1Fh,  5Fh,	 5Fh,  5Fh,  1Bh,  11h,	 11h
		db   11h,  15h,	 0Ch,  0Ch,  0Ch, 0AFh,	 1Ch,  1Ch,  2Ch,    0,	   0,	 0,    0,  3Dh
YM_INSTMT_3A:	db   72h,  32h,	 42h,  32h,  23h,  23h,	 7Fh,  7Fh,  12h,  12h,	 12h,  12h,    0,    0,	   0
		db     0,    0,	   0,	 0,    0,  0Ah,	 0Ah,  0Ah,  0Ah,    0,	   0,	 0,    0,    4
YM_INSTMT_3B:	db   72h,  32h,	 72h,  32h,  14h,  14h,	 7Fh,  7Bh,  15h,  1Fh,	 12h,  1Fh,    0,    0,	 0Fh
		db   0Fh,    0,	   0,	 9,    9,    0,	   0,  36h,  36h,    0,	   0,	 0,    0,  2Ch
YM_INSTMT_3C:	db   0Fh,  39h,	 52h,  31h,  1Ch,  20h,	 7Fh,  7Fh,  1Fh,  1Fh,	 1Fh,  1Fh,  1Eh,  1Fh,	 1Fh
		db   1Fh,  18h,	 11h,  10h,  0Eh,    5,	   5,	 5,    5,    0,	   0,	 0,    0,  3Ch
YM_INSTMT_3D:	db   7Bh,  40h,	 5Bh,  40h,  21h,    1,	   1,  7Fh,  9Fh,  1Fh,	 1Fh,  1Fh,  0Fh,    5,	 0Bh
		db   0Ch,  0Fh,	 0Ch,  19h,  13h, 0F9h,	0F9h, 0F5h,    6,    0,	   0,	 0,    0,  3Ah
YM_INSTMT_3E:	db   7Bh,  40h,	 5Bh,  40h,  21h,    1,	   1,  7Fh,  9Fh,  1Fh,	 1Fh,  1Fh,  0Fh,    5,	 0Bh
		db   0Ch,  0Fh,	 0Ch,  19h,  0Dh, 0F9h,	0F9h, 0F5h,    6,    0,	   0,	 0,    0,  3Ah
YM_INSTMT_3F:	db   40h,  40h,	 4Fh,  4Fh,  0Eh,  11h,	 7Fh,  7Fh,  0Eh,  12h,	 9Fh,  9Fh,  12h,  0Eh,	 0Ch
		db   0Eh,    0,	   0,	 0,    0, 0F7h,	0FFh, 0FFh, 0FFh,    0,	   0,	 0,    0,    4
YM_INSTMT_40:	db   2Fh,  40h,	 3Fh,  38h,    0,  10h,	 7Fh,  7Fh,  5Fh,  1Dh,	 1Fh,  1Fh,    0,    9,	 0Bh
		db   0Dh,    0,	   0,	 0,    9, 0FAh,	 5Eh, 0FCh, 0FCh,    0,	   0,	 0,    0,  3Ch
YM_INSTMT_41:	db   14h,  51h,	 30h,  62h,  7Dh,  76h,	 78h,  76h,  95h,  97h,	 96h,  98h,    0,    0,	   0
		db     0,    0,	   0,	 0,    0, 0F8h,	0F8h, 0F8h, 0F8h,    0,	   0,	 0,    0,  2Fh
YM_INSTMT_42:	db   30h,  30h,	 30h,  31h,  19h,  7Fh,	 7Fh,  7Fh,  1Fh,  1Fh,	 1Fh,  1Fh,  18h,  19h,	 13h
		db   0Dh,    0,	 1Bh,	 5,    5,  0Fh,	 3Fh,  2Fh, 0FFh,    0,	   0,	 0,    0,    5
YM_INSTMT_43:	db   20h,  40h,	 33h,  32h,  14h,  7Fh,	 7Fh,  7Fh,  5Fh,  1Dh,	 1Fh,  1Fh,    3,  0Dh,	 12h
		db   11h,    0,	   0,	 0,    0,  5Ah,	 38h,  18h,  18h,    0,	   0,	 0,    0,  2Dh
YM_INSTMT_44:	db   2Fh,  2Eh,	 21h,  2Fh,  0Bh,    3,	 7Fh,  7Fh,  5Ch,  1Ch,	 5Ch, 0DEh,  0Ch,  16h,	 0Eh
		db   11h,  0Ch,	 0Fh,  0Fh,  0Fh, 0FBh,	 5Bh, 0BBh, 0EBh,    0,	   0,	 0,    0,  3Ch
YM_INSTMT_45:	db   21h,  58h,	 41h,  11h,  23h,  5Ah,	 7Fh,  7Fh, 0DFh, 0DFh,	 99h,  99h,    0,    0,	   7
		db     8,    8,	   8,	 2,    2, 0F0h,	0F0h,  37h,  37h,    0,	   0,	 0,    0,    4
YM_INSTMT_46:	db     0,  61h,	 21h,  41h,  0Ah,  11h,	 0Dh,  7Fh,  12h,  1Fh,	 1Fh,  1Fh,  14h,    0,	   0
		db     0,    5,	   8,	 8,    0, 0F5h,	0F5h, 0F5h, 0F7h,    0,	   0,	 0,    0,  38h
YM_INSTMT_47:	db   0Ah,    1,	   8,	 2,  28h,  24h,	 23h,  7Fh,  14h,  10h,	 14h,  0Eh,    5,    2,	   8
		db     8,    0,	   0,	 0,    0,  99h,	   9,	 9,  19h,    0,	   0,	 0,    0,  38h
YM_INSTMT_48:	db   0Fh,  61h,	 3Fh,  31h,    3,  20h,	 7Fh,  7Dh, 0D2h, 0CFh,	 8Fh,  0Eh,    0,  0Bh,	   7
		db     4,    0,	   0,	 0,    0,    2,	 26h,  16h,  0Bh,    0,	   0,	 0,    0,  3Ch
YM_INSTMT_49:	db   46h,  42h,	 42h,  43h,  41h,  2Bh,	 23h,  7Fh,  10h,  19h,	 12h,  4Fh,    8,    1,	   5
		db     1,    1,	   1,	 1,    1,  76h,	0F7h, 0F1h, 0F9h,    0,	   0,	 0,    0,  3Bh
YM_INSTMT_4A:	db   75h,  71h,	 13h,  11h,  1Eh,  1Eh,	 1Eh,  7Fh, 0DFh,  1Fh,	 5Fh,  1Fh,  0Ch,    1,	 0Dh
		db     1,    0,	   0,	 0,    0, 0FFh,	0FFh, 0FFh, 0FFh,    0,	   0,	 0,    0,  38h
YM_INSTMT_4B:	db   7Bh,  40h,	 5Bh,  40h,  21h,    1,	   1,  7Fh,  9Fh,  1Fh,	 1Fh,  1Fh,  0Fh,    5,	 0Bh
		db   0Ch,  0Fh,	 0Ch,  19h,  0Dh, 0FFh,	0FFh, 0FFh,  0Fh,    0,	   0,	 0,    0,  3Ah
YM_INSTMT_4C:	db     2,  61h,	 20h,  41h,  0Ah,  11h,	 0Dh,  7Fh,  12h,  1Fh,	 1Fh,  1Fh,  14h,    0,	   0
		db     0,    5,	   8,	 8,    0, 0F6h,	0F6h, 0F6h, 0F7h,    0,	   0,	 0,    0,  38h
YM_INSTMT_4D:	db   61h,  11h,	 6Ah,  62h,  17h,  1Ah,	 3Ah,  7Fh,  10h,  51h,	 91h,  11h,  0Eh,  0Eh,	 0Eh
		db     3,    0,	   0,	 0,    0,  17h,	 17h, 0F7h,    7,    0,	   0,	 0,    0,  3Ah
YM_INSTMT_4E:	db   23h,  45h,	 18h,  56h,  21h,  1Ah,	 7Fh,  7Fh,  1Dh,  1Dh,	 1Dh,  1Eh,    4,    4,	 14h
		db     9,    0,	   0,	 0,    0,  55h,	 55h,  56h,  56h,    0,	   0,	 0,    0,  14h
YM_INSTMT_4F:	db   21h,  58h,	 41h,  11h,  23h,  5Ah,	 7Fh,  7Fh, 0DFh, 0DFh,	 99h,  99h,    0,    0,	   7
		db     8,    8,	   8,	 2,    2, 0F0h,	0F0h,  37h,  37h,    0,	   0,	 0,    0,    4
MUSIC_BEGIN:	dw MUSIC_00,MUSIC_01,MUSIC_02,MUSIC_03
		dw MUSIC_04,MUSIC_05,MUSIC_06,MUSIC_07
		dw MUSIC_08,MUSIC_09,MUSIC_0A,MUSIC_0B
		dw MUSIC_0C,MUSIC_0D,MUSIC_0E,MUSIC_0F
		dw MUSIC_10,MUSIC_11,MUSIC_12,MUSIC_13
		dw MUSIC_14,MUSIC_15,MUSIC_NULL,MUSIC_NULL
		dw MUSIC_NULL,MUSIC_NULL,MUSIC_1A,MUSIC_NULL
		dw MUSIC_1C,MUSIC_NULL,MUSIC_1E,MUSIC_NULL
MUSIC_00:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 186
		dw MUSIC_00_YM1
		dw MUSIC_00_YM2
		dw MUSIC_00_YM3
		dw MUSIC_00_YM4
		dw MUSIC_00_YM5
		dw MUSIC_00_YM6
		dw MUSIC_00_PSG1
		dw MUSIC_00_PSG2
		dw MUSIC_00_PSG3
		dw MUSIC_00_PSG3
MUSIC_00_YM1:	db  0FCh,    1,	0FBh,  2Ch, 0FEh,    9,	0FDh,  0Ch, 0FAh, 0C0h,	0ABh,	 4, 0F0h,    8,	0B0h,  0Ch
					; DATA XREF: ROM:8954o
		db  0B2h,    4,	0F0h,	 8, 0F8h,    0,	0F8h,  20h, 0B4h,  32h,	0F0h,  0Ah, 0ABh,    4,	0F0h,	 8
		db  0B0h,  0Ch,	0B2h,	 4, 0F0h,    8,	0B4h,	 4, 0F0h,    8,	0B7h,	 4, 0F0h,    8,	0B5h,  12h
		db  0B4h,    6,	 32h,  70h, 0ADh,    4,	0F0h,	 8, 0B2h,  0Ch,	0B4h,	 4, 0F0h,    8,	0B5h,  32h
		db  0F0h,  0Ah,	0ADh,	 4, 0F0h,    8,	0B2h,  0Ch, 0B4h,    4,	0F0h,	 8, 0B5h,    4,	0F0h,	 8
		db  0B9h,    4,	0F0h,	 8, 0BCh,  12h,	0BBh,	 6, 0B9h,  0Ch,	0B7h,	 4, 0F0h,    8,	0F8h,  40h
		db  0FEh,  1Ah,	0FDh,  0Bh, 0ABh,    3,	 2Dh,  2Fh,  30h,  32h,	 34h,  35h,  37h, 0B9h,	 0Ah, 0F0h
		db   0Eh, 0B0h,	 24h, 0AFh,  0Ch,  30h,	 39h, 0B7h,  41h, 0F0h,	   7, 0B4h,  18h, 0B5h,	 0Ah, 0F0h
		db   0Eh, 0ADh,	 24h, 0ACh,  0Ch,  2Dh,	 35h, 0B4h,  3Ch, 0ABh,	 0Ch,  34h,  33h, 0B2h,	 0Ah, 0F0h
		db   0Eh, 0AEh,	 24h, 0AFh,  0Ch,  35h,	 34h,  32h,  2Fh,  30h,	 34h, 0B9h,  18h, 0F0h,	 0Ch,  39h
		db  0B7h,    6,	0F0h,  1Eh, 0B9h,  0Ch,	0B7h,	 6, 0F0h,  1Eh,	0B9h,  0Ch, 0B7h,    6,	0F0h,  1Eh
		db  0B9h,  0Ch,	0B7h,	 6,  70h, 0FEh,	   9, 0FDh,  0Ch, 0ABh,	   4, 0F0h,    8, 0B0h,	 0Ch, 0B2h
		db     4, 0F0h,	   8, 0F8h, 0A0h, 0F8h,	 60h, 0F0h,  18h, 0FEh,	 3Dh, 0F8h, 0C7h, 0F0h,	 0Ch, 0FDh
		db     8,  29h,	 29h, 0FDh,  0Bh, 0B0h,	   6, 0FDh,    8,  24h,	0F8h, 0E0h, 0F8h, 0C2h,	0FEh,  3Eh
		db  0FDh,    9,	0A4h,  18h, 0FEh,  3Dh,	0FDh,  0Bh, 0A9h,    6,	0FDh,	 8,  24h, 0FDh,	 0Bh, 0B0h
		db   0Ch, 0F8h,	0E0h, 0FEh,  3Eh, 0FDh,	   9, 0A4h,  18h, 0FEh,	 3Dh, 0FDh,  0Bh, 0B0h,	   6, 0FDh
		db     8,  2Dh,	 29h,  24h, 0F8h, 0C2h,	0FEh,  3Eh, 0FDh,    9,	0A4h,  18h, 0FEh,  3Dh,	0FDh,  0Bh
		db  0A9h,    6,	0FDh,	 8,  24h, 0FDh,	 0Bh, 0B0h,  0Ch, 0F8h,	0E0h, 0FEh,  3Eh, 0FDh,	   9, 0A4h
		db   18h, 0FEh,	 3Dh, 0FDh,  0Bh, 0B0h,	   6, 0FDh,    8,  2Dh,	 29h,  24h, 0F8h, 0C6h,	0FDh,  0Bh
		db  0B0h,    6,	0FDh,	 8,  2Dh,  29h,	 24h, 0F8h, 0E0h, 0FEh,	 1Ah, 0FDh,  0Bh, 0AEh,	   4,  30h
		db   32h,  34h,	 35h,  37h, 0B9h,  0Ah,	0F0h,  0Eh, 0B0h,  24h,	0AFh,  0Ch,  30h,  39h,	0B7h,  41h
		db  0F0h,    7,	0B4h,  18h, 0B5h,  0Ah,	0F0h,  0Eh, 0ADh,  24h,	0ACh,  0Ch,  2Dh,  35h,	0B4h,  3Ch
		db  0ABh,  0Ch,	 34h,  33h, 0B2h,  0Ah,	0F0h,  0Eh, 0AEh,  24h,	0AFh,  0Ch,  35h,  34h,	 32h,  2Fh
		db   30h,  34h,	0B9h,  18h, 0F0h,  0Ch,	 39h, 0B7h,    6,  70h,	0FEh,  3Dh, 0FDh,  0Bh,	 29h, 0FDh
		db     8,  24h,	0FDh,  0Bh, 0B0h,  0Ch,	0FEh,  1Ah, 0FDh,  0Bh,	 39h, 0B7h,    6,  70h,	0FEh,  3Dh
		db  0FDh,  0Bh,	 29h, 0FDh,    8,  24h,	0FDh,  0Bh, 0B0h,  0Ch,	0FEh,  1Ah, 0FDh,  0Bh,	 39h, 0B7h
		db     6,  70h,	0FEh,  3Dh, 0FDh,  0Bh,	 30h, 0FDh,    8,  29h,	0FEh,  1Ah, 0FDh,  0Bh,	0AFh,  18h
		db  0B0h,    6,	 70h, 0FEh,    9, 0FDh,	 0Ch, 0ABh,    4, 0F0h,	   8, 0B0h,  0Ch, 0B2h,	   4, 0F0h
		db     8, 0F8h,	0A1h
MUSIC_00_YM2:	db  0F0h,  24h,	0FCh,	 1, 0FBh,  2Ch,	0FEh,  23h, 0FDh,  0Bh,	0FAh, 0C0h, 0F8h,    0,	0F8h,  20h
					; DATA XREF: ROM:8956o
		db   8Ch,  0Ch,	 98h,	 6,  70h,  8Bh,	 0Ch,  97h,    6,  70h,	 89h,  0Ch,  95h,    6,	 70h,  87h
		db   0Ch,  93h,	   6,  70h,  8Ch,  0Ch,	 98h,	 6,  70h,  8Dh,	 0Ch,  99h,    6,  70h,	 8Eh,  0Ch
		db   9Ah,    6,	 70h,  89h,  0Ch,  95h,	   6,  70h,  8Eh,  0Ch,	 9Ah,	 6,  70h,  8Dh,	 0Ch,  99h
		db     6,  70h,	 8Ch,  0Ch,  98h,    6,	 70h,  8Bh,  0Ch,  97h,	   6,  70h,  89h,  0Ch,	 95h,	 6
		db   70h,  88h,	 0Ch,  94h,    6,  70h,	0F8h,  40h,  87h,  0Ch,	 93h,	 6,  70h,  87h,	 18h,  85h
		db   24h,  85h,	   4, 0F0h,    8,  87h,	 24h,  87h,    4, 0F0h,	   8,  84h,  24h,  84h,	   4, 0F0h
		db     8,  89h,	 24h,  89h,    4, 0F0h,	   8,  8Eh,  24h,  8Eh,	   4, 0F0h,    8,  87h,	 24h,  87h
		db     4, 0F0h,	   8,  8Ch,  24h,  8Ch,	   4, 0F0h,    8,  8Ch,	 24h,  8Ch,    4, 0F0h,	   8,  84h
		db   24h,  84h,	   4, 0F0h,    8,  88h,	 18h,	 4,    9,    7,	   6,  70h, 0F0h,  0Ch,	 93h,	 6
		db   70h,    7,	0F0h,  1Eh,  93h,    6,	 70h,	 7, 0F0h,  12h,	0F0h,  0Ch,  93h,    6,	 70h,	 7
		db  0F0h,  1Eh,	 93h,	 6,  70h,  87h,	 0Ch,  70h, 0F8h, 0A0h,	0F8h,  60h,  87h,  0Ch,	 8Eh,	 6
		db   70h,  93h,	 0Ch,  11h,  8Fh,  24h,	 8Fh,	 4, 0F0h,    8,	 88h,  30h,  8Ah,  24h,	 8Ah,	 4
		db  0F0h,    8,	 88h,  30h,  86h,  24h,	 86h,	 4, 0F0h,    8,	 8Bh,  30h,  8Dh,  18h,	 0Bh,  8Ah
		db   30h,  8Fh,	 0Ch,  70h,  8Fh,    6,	 0Eh,  0Fh,  70h,  91h,	 0Ch,  70h,  91h,    6,	 10h,  11h
		db   70h,  92h,	 0Ch,  70h,  92h,    6,	 11h,  12h,  70h,  93h,	 0Ch,  70h,  87h,    6,	   8,  0Ah
		db     7,  88h,	 0Ch,  70h,  88h,    6,	   7,	 8,  70h,  8Ah,	 0Ch,  70h,  8Ah,    6,	   9,  0Ah
		db   70h,  8Bh,	 0Ch,  70h,  8Bh,    6,	 0Ah,  0Bh,  70h,  8Ch,	 0Ch,  70h,  88h,    6,	 0Ah,  0Ch
		db     8,  8Dh,	 0Ch,  99h,    6,  70h,	 86h,  0Ch,  92h,    6,	 70h,  8Bh,  0Ch,  97h,	   6,  70h
		db   84h,  0Ch,	 90h,	 6,  70h,  89h,	 0Ch,  95h,    6,  70h,	 8Eh,  0Ch,  9Ah,    6,	 70h,  87h
		db   0Ch,  93h,	   6,  70h,  8Ch,  18h,	 85h,  24h,  85h,    4,	0F0h,	 8,  87h,  24h,	 87h,	 4
		db  0F0h,    8,	 84h,  24h,  84h,    4,	0F0h,	 8,  89h,  24h,	 89h,	 4, 0F0h,    8,	 8Eh,  24h
		db   8Eh,    4,	0F0h,	 8,  87h,  24h,	 87h,	 4, 0F0h,    8,	 8Ch,  24h,  8Ch,    4,	0F0h,	 8
		db   8Ch,  24h,	 8Ch,	 4, 0F0h,    8,	 84h,  24h,  84h,    4,	0F0h,	 8,  88h,  18h,	   4,	 9
		db     7,    6,	 70h, 0F0h,  0Ch,  93h,	   6,  70h,    7, 0F0h,	 1Eh,  93h,    6,  70h,	   7,  70h
		db   13h,  70h,	   7, 0F0h,  12h,  93h,	 18h,  98h,    6,  70h,	 13h,  70h,  8Ch,  0Ch,	 70h, 0F8h
		db  0A1h
MUSIC_00_YM3:	db  0F0h,  24h,	0F8h,	 0, 0FCh,    1,	0FBh,  2Ch, 0FAh, 0C0h,	0F8h, 0C3h, 0F0h,  60h,	0F8h, 0E0h
					; DATA XREF: ROM:8958o
		db  0FEh,  1Fh,	0FDh,	 9, 0A9h,    6,	 24h,  28h,  29h,  2Dh,	 29h,  28h,  24h,  26h,	 22h,  23h
		db   26h,  29h,	 26h,  23h,  1Fh,  2Bh,	 27h,  28h,  2Bh,  2Fh,	 2Bh,  28h,  26h,  25h,	 2Dh,  2Bh
		db   21h,  29h,	 21h,  28h,  21h,  26h,	 21h,  25h,  26h,  29h,	 26h,  24h,  21h,  23h,	 22h,  23h
		db   26h,  2Bh,	 29h,  26h,  23h,  24h,	 1Fh,  23h,  24h,  28h,	 2Bh,  2Fh,  32h,  30h,	 28h,  2Fh
		db   24h,  2Eh,	 28h,  2Dh,  24h,  2Ch,	 26h,  28h,  2Ch,  2Fh,	 2Ch,  28h,  26h,  28h,	 23h,  26h
		db   28h,  2Ch,	 28h,  26h,  23h,  24h,	 23h,  24h,  26h,  28h,	 27h,  28h,  2Bh,  2Dh,	 2Ch,  2Dh
		db   2Fh,  30h,	 2Fh,  30h,  34h, 0F0h,	 0Ch, 0B2h,    6,  31h,	 32h, 0F0h,  1Eh, 0B3h,	   6,  32h
		db   33h, 0F0h,	 1Eh, 0B4h,    6,  33h,	 34h, 0F0h,  1Eh, 0B5h,	   6,  34h,  32h,  30h,	 2Fh,  2Bh
		db  0FDh,    8,	0F8h, 0C5h, 0F0h,  0Ch,	0A8h,	 6,  70h, 0F8h,	0E0h, 0F8h, 0C6h, 0F0h,	 0Ch, 0A9h
		db     6,  70h,	0F8h, 0E0h, 0F0h,  0Ch,	0AAh,	 6, 0F0h,  12h,	0ABh,	 6,  70h, 0ABh,	 18h, 0FDh
		db     7, 0FCh,	   6, 0F0h,  0Ch,  1Fh,	 22h,  1Fh,  70h,  24h,	 24h,  24h,  70h,  22h,	 22h,  22h
		db   70h,  22h,	 26h,  22h,  70h,  22h,	 25h,  22h,  70h,  27h,	 27h,  27h,  70h,  25h,	 29h,  25h
		db   29h,  26h,	 26h,  26h, 0FCh,    1,	0FEh,  1Ah, 0FDh,    9,	0AAh,  30h,  29h,  27h,	0A7h,	 6
		db   70h,  27h,	 29h, 0A7h,  18h, 0A7h,	 48h, 0A6h,  18h, 0A7h,	 30h, 0A7h,    6,  70h,	 27h,  2Eh
		db  0A7h,  18h,	0B1h,  0Ch,  2Fh,  2Ah,	 28h,  2Fh,  2Dh,  28h,	 26h,  2Dh,  2Bh,  26h,	 24h,  2Bh
		db   29h,  24h,	 22h, 0FEh,  1Fh, 0FDh,	   9, 0A9h,    6,  24h,	 28h,  29h,  2Dh,  29h,	 28h,  24h
		db   26h,  22h,	 23h,  26h,  29h,  26h,	 23h,  1Fh,  2Bh,  27h,	 28h,  2Bh,  2Fh,  2Bh,	 28h,  26h
		db   25h,  2Dh,	 2Bh,  21h,  29h,  21h,	 28h,  21h,  26h,  21h,	 25h,  26h,  29h,  26h,	 24h,  21h
		db   23h,  22h,	 23h,  26h,  2Bh,  29h,	 26h,  23h,  24h,  1Fh,	 23h,  24h,  28h,  2Bh,	 2Fh,  32h
		db   30h,  28h,	 2Fh,  24h,  2Eh,  28h,	 2Dh,  24h,  2Ch,  26h,	 28h,  2Ch,  2Fh,  2Ch,	 28h,  26h
		db   28h,  23h,	 26h,  28h,  2Ch,  28h,	 26h,  23h,  24h,  23h,	 24h,  26h,  28h,  27h,	 28h,  2Bh
		db   2Dh,  2Ch,	 2Dh,  2Fh,  30h,  2Fh,	 30h,  34h, 0F0h,  0Ch,	0FDh,	 8, 0AFh,    6,	 2Eh,  2Fh
		db  0F0h,  1Eh,	0B0h,	 6,  2Fh,  30h,	 70h,  31h,  70h, 0B2h,	 0Ch,  70h, 0A9h,  18h,	0A8h,  0Ch
		db   70h,  28h,	 70h, 0F8h, 0A1h
MUSIC_00_YM4:	db  0F0h,  24h,	0F8h,	 0, 0FCh,    1,	0FBh,  2Ch, 0FAh, 0C0h,	0FEh,  3Dh, 0F8h, 0C2h,	0FDh,  0Bh
					; DATA XREF: ROM:895Ao
		db  0F0h,  0Ch,	0ADh,	 6, 0FDh,    8,	 24h, 0FDh,  0Bh, 0B0h,	 0Ch, 0FDh,    8,  24h,	0FDh,  0Bh
		db  0B0h,    6,	0FDh,	 8,  2Dh,  29h,	 24h, 0FDh,  0Bh, 0B0h,	 0Ch, 0FDh,    8,  24h,	0F8h, 0E0h
		db  0FEh,  3Dh,	0FDh,  0Bh, 0F0h,  0Ch,	0ADh,	 6, 0FDh,    8,	 24h, 0FDh,  0Bh, 0B0h,	 0Ch, 0FDh
		db     8,  24h,	0FDh,  0Bh, 0B0h,    6,	0FDh,	 8,  2Dh,  29h,	 24h, 0FDh,  0Bh, 0B0h,	 0Ch, 0FEh
		db   3Eh, 0FDh,	   9,  24h, 0F8h, 0C4h,	0F0h,  0Ch, 0FEh,  3Dh,	0FDh,  0Bh, 0B0h,    6,	0FDh,	 8
		db   2Dh, 0FEh,	 3Eh, 0FDh,    9, 0A4h,	 1Eh, 0FEh,  3Dh, 0FDh,	   8, 0ADh,    6,  29h,	 24h, 0FEh
		db   3Eh, 0FDh,	   9, 0A4h,  0Ch, 0FEh,	 3Dh, 0FDh,    8,  24h,	0F8h, 0E0h, 0F0h,  0Ch,	0FEh,  3Dh
		db  0FDh,  0Bh,	0B0h,	 6, 0FDh,    8,	 2Dh, 0FEh,  3Eh, 0FDh,	   9, 0A4h,  1Eh, 0FEh,	 3Dh, 0FDh
		db     8, 0ADh,	   6,  29h,  24h, 0FDh,	 0Bh, 0A4h,  0Ch, 0FEh,	 3Eh, 0FDh,    9,  24h,	0F8h, 0C2h
		db  0FEh,  3Dh,	0FDh,	 8, 0A4h,  0Ch,	0FDh,  0Bh, 0B0h,    6,	0FDh,	 8,  29h, 0FDh,	 0Bh, 0B0h
		db   0Ch, 0FEh,	 3Eh, 0FDh,    9,  24h,	0F8h, 0E0h, 0FEh,  3Dh,	0FDh,	 8, 0A4h,  0Ch,	0FDh,  0Bh
		db  0B0h,    6,	0FDh,	 8,  29h, 0FEh,	 3Eh, 0FDh,    9, 0A4h,	 18h, 0FEh,  3Dh, 0F8h,	0C2h, 0FDh
		db   0Bh, 0F0h,	 0Ch, 0ADh,    6, 0FDh,	   8,  24h, 0FDh,  0Bh,	0B0h,  0Ch, 0FDh,    8,	 24h, 0FDh
		db   0Bh, 0B0h,	   6, 0FDh,    8,  2Dh,	 29h,  24h, 0FDh,  0Bh,	0B0h,  0Ch, 0FDh,    8,	 24h, 0F8h
		db  0E0h, 0FEh,	 3Dh, 0FDh,  0Bh, 0F0h,	 0Ch, 0ADh,    6, 0FDh,	   8,  24h, 0FDh,  0Bh,	0B0h,  0Ch
		db  0FDh,    8,	 24h, 0FDh,  0Bh, 0B0h,	   6, 0FDh,    8,  2Dh,	 29h,  24h, 0FDh,  0Bh,	0B0h,  0Ch
		db  0FEh,  3Eh,	0FDh,	 9,  24h, 0FEh,	 1Fh, 0FDh,    8, 0FCh,	   6,  70h,  27h,  2Bh,	 27h,  70h
		db   27h,  2Ch,	 27h,  70h,  29h,  2Ch,	 29h,  70h,  26h,  29h,	 26h,  70h,  2Ah,  2Eh,	 2Ah,  70h
		db   2Ah,  2Fh,	 2Ah,  70h,  2Ch,  31h,	 2Ch,  32h,  2Eh,  2Ch,	 29h, 0FCh,    1, 0FEh,	 1Ah, 0FDh
		db     9, 0AEh,	 48h, 0ADh,  18h, 0AEh,	 30h, 0AEh,    6,  70h,	 2Eh,  2Fh, 0B1h,  18h,	0AFh,  30h
		db   2Eh,  2Ch,	0ACh,	 6,  70h,  2Ch,	 2Eh, 0B0h,  18h,  29h,	 2Eh,  27h,  2Ch,  25h,	 2Ah,  23h
		db  0A8h,    6,	0FEh,  3Dh, 0FDh,    8,	 29h, 0FEh,  3Eh, 0FDh,	   9, 0A4h,  0Ch, 0F8h,	0C4h, 0F0h
		db   0Ch, 0FEh,	 3Dh, 0FDh,  0Bh, 0B0h,	   6, 0FDh,    8,  2Dh,	0FEh,  3Eh, 0FDh,    9,	0A4h,  1Eh
		db  0FEh,  3Dh,	0FDh,	 8, 0ADh,    6,	 29h,  24h, 0FEh,  3Eh,	0FDh,	 9, 0A4h,  0Ch,	0FEh,  3Dh
		db  0FDh,    8,	 24h, 0F8h, 0E0h, 0F0h,	 0Ch, 0FEh,  3Dh, 0FDh,	 0Bh, 0B0h,    6, 0FDh,	   8,  2Dh
		db  0FEh,  3Eh,	0FDh,	 9, 0A4h,  1Eh,	0FEh,  3Dh, 0FDh,    8,	0ADh,	 6,  29h,  24h,	0FDh,  0Bh
		db  0A4h,  0Ch,	0FEh,  3Eh, 0FDh,    9,	 24h, 0FEh,  3Dh, 0FDh,	 0Bh,  30h, 0FEh,  1Fh,	0FDh,	 9
		db  0B2h,    6,	 31h,  32h,  70h, 0FEh,	 3Eh, 0FDh,    9, 0B0h,	 0Ch, 0FEh,  3Dh, 0FDh,	 0Bh,  3Ch
		db  0FEh,  1Fh,	0FDh,	 9, 0B3h,    6,	 32h,  33h,  70h,  34h,	 70h, 0B5h,  0Ch,  70h,	0ABh,  18h
		db  0ABh,  0Ch,	0FEh,  3Dh, 0FDh,  0Bh,	 30h, 0FEh,  1Fh, 0FDh,	   9,  2Bh, 0FEh,  3Eh,	0FDh,	 9
		db   30h, 0F8h,	0A1h
MUSIC_00_YM5:	db  0F0h,    6,	0F9h,  20h, 0FCh,    1,	0FBh,  2Ch, 0FEh,    9,	0FDh,	 9, 0FAh,  80h,	0ABh,	 4
					; DATA XREF: ROM:895Co
		db  0F0h,    8,	0B0h,  0Ch, 0B2h,    4,	0F0h,	 8, 0F8h,    0,	0F8h,  20h, 0B4h,  32h,	0F0h,  0Ah
		db  0ABh,    4,	0F0h,	 8, 0B0h,  0Ch,	0B2h,	 4, 0F0h,    8,	0B4h,	 4, 0F0h,    8,	0B7h,	 4
		db  0F0h,    8,	0B5h,  12h, 0B4h,    6,	 32h,  70h, 0ADh,    4,	0F0h,	 8, 0B2h,  0Ch,	0B4h,	 4
		db  0F0h,    8,	0B5h,  32h, 0F0h,  0Ah,	0ADh,	 4, 0F0h,    8,	0B2h,  0Ch, 0B4h,    4,	0F0h,	 8
		db  0B5h,    4,	0F0h,	 8, 0B9h,    4,	0F0h,	 8, 0BCh,  12h,	0BBh,	 6, 0B9h,  0Ch,	0B7h,	 4
		db  0F0h,    8,	0F8h,  40h, 0FEh,  1Ah,	0FDh,	 9, 0FAh,  40h,	0ABh,	 3,  2Dh,  2Fh,	 30h,  32h
		db   34h,  35h,	 37h, 0B9h,  0Ah, 0F0h,	 0Eh, 0B0h,  24h, 0AFh,	 0Ch,  30h,  39h, 0B7h,	 41h, 0F0h
		db     7, 0B4h,	 18h, 0B5h,  0Ah, 0F0h,	 0Eh, 0ADh,  24h, 0ACh,	 0Ch,  2Dh,  35h, 0B4h,	 3Ch, 0ABh
		db   0Ch,  34h,	 33h, 0B2h,  0Ah, 0F0h,	 0Eh, 0AEh,  24h, 0AFh,	 0Ch,  35h,  34h,  32h,	 2Fh,  30h
		db   34h, 0B9h,	 18h, 0F0h,  0Ch,  39h,	0B7h,	 6, 0F0h,  1Eh,	0B9h,  0Ch, 0B7h,    6,	0F0h,  1Eh
		db  0B9h,  0Ch,	0B7h,	 6, 0F0h,  1Eh,	0B9h,  0Ch, 0B7h,    6,	 70h, 0FEh,    9, 0FDh,	   9, 0FAh
		db   80h, 0ABh,	   4, 0F0h,    8, 0B0h,	 0Ch, 0B2h,    4, 0F0h,	   8, 0F8h, 0A0h, 0F8h,	 60h, 0F8h
		db  0C9h, 0F0h,	 60h, 0F8h, 0E0h, 0FEh,	 1Ah, 0FDh,    9, 0FAh,	 40h, 0AEh,    4,  30h,	 32h,  34h
		db   35h,  37h,	0B9h,  0Ah, 0F0h,  0Eh,	0B0h,  24h, 0AFh,  0Ch,	 30h,  39h, 0B7h,  41h,	0F0h,	 7
		db  0B4h,  18h,	0B5h,  0Ah, 0F0h,  0Eh,	0ADh,  24h, 0ACh,  0Ch,	 2Dh,  35h, 0B4h,  3Ch,	0ABh,  0Ch
		db   34h,  33h,	0B2h,  0Ah, 0F0h,  0Eh,	0AEh,  24h, 0AFh,  0Ch,	 35h,  34h,  32h,  2Fh,	 30h,  34h
		db  0B9h,  18h,	0F0h,  0Ch,  39h, 0B7h,	   6, 0F0h,  1Eh, 0B9h,	 0Ch, 0B7h,    6, 0F0h,	 1Eh, 0B9h
		db   0Ch, 0B7h,	   6, 0F0h,  12h, 0AFh,	 18h, 0B0h,    6,  70h,	0FEh,	 9, 0FDh,    9,	0FAh,  80h
		db  0ABh,    4,	0F0h,	 8, 0B0h,  0Ch,	0B2h,	 4, 0F0h,    8,	0F8h, 0A1h
MUSIC_00_YM6:	db  0FFh,    0,	   0	; DATA XREF: ROM:895Eo
MUSIC_00_PSG1:	db  0FCh,    0,	0FBh,  4Ch, 0FDh,    0,	0F0h,  24h, 0F8h,    0,	0F0h,  0Ch, 0FDh,  1Ah,	 9Fh,  18h
					; DATA XREF: ROM:8960o
		db   1Fh,  1Fh,	 1Fh,  1Fh,  21h,  21h,	 21h,  21h,  21h,  21h,	 21h,  21h,  24h, 0A4h,	 0Ch, 0A3h
		db   18h, 0F8h,	 20h, 0FDh,    0, 0F0h,	 0Ch, 0FDh,  7Ah,  29h,	 2Dh,  34h, 0B2h,  30h,	0F0h,  0Ch
		db   28h,  2Bh,	 32h, 0B1h,  30h, 0F0h,	 0Ch,  26h,  29h,  30h,	0AFh,  18h, 0B0h,  0Ch,	 32h,  30h
		db  0AFh,    4,	 30h,  34h, 0B9h,  18h,	0B7h,  30h, 0F0h,  0Ch,	 28h,  2Ch,  35h, 0B4h,	 18h, 0B2h
		db   0Ch,  30h,	 2Fh,  2Ch,  2Dh,  2Fh,	0F8h,  40h, 0B0h,  18h,	0FDh,	 0, 0F0h,  24h,	0FDh,  1Ah
		db  0AFh,    6,	 2Eh, 0AFh,  24h, 0B0h,	   6,  2Fh, 0B0h,  24h,	0B1h,	 6,  30h, 0B1h,	 24h, 0B2h
		db     6,  30h,	 2Fh,  2Dh,  2Bh,  23h,	0FDh,	 0, 0F0h,  0Ch,	0FDh,  7Ah, 0FCh,    3,	0C3h,	 6
		db   42h,  43h,	 70h,  48h,  70h, 0FCh,	   0, 0C3h,    3,  45h,	 43h,  45h,  43h,  45h,	 43h,  45h
		db   43h,  45h,	 43h,  45h,  43h,  45h,	 43h,  70h, 0F0h,    6,	 37h,  3Ch,  40h,  45h,	 70h,  43h
		db   70h, 0C1h,	 12h, 0C0h,    6,  3Eh,	0F0h,  12h, 0FDh,    0,	0F0h,  0Ch, 0FDh,  7Ah,	0FCh,	 3
		db  0C5h,    6,	 44h,  45h,  70h,  4Ah,	 70h, 0FCh,    0, 0C5h,	   3,  47h,  45h,  47h,	 45h,  47h
		db   45h,  47h,	 45h,  47h,  45h,  47h,	 45h,  47h,  45h,  70h,	0F0h,	 6,  39h,  3Eh,	 40h,  42h
		db   70h,  3Eh,	 70h, 0BCh,  0Ch, 0BBh,	   6,  70h,  37h,  70h,	0FDh,  7Bh,  37h,  38h,	0BAh,	 4
		db  0F0h,    8,	0B3h,	 6,  32h, 0B3h,	   4, 0F0h,    8, 0BAh,	   4, 0F0h,    8, 0B8h,	   3, 0BAh
		db     2, 0B8h,	   3, 0BAh,    2,  38h,	0B7h,  0Ch,  35h,  33h,	0B2h,	 3,  33h,  32h,	 33h,  32h
		db   33h,  32h,	 33h, 0B2h,  0Ch,  30h,	0AEh,	 6,  70h, 0BAh,	   8, 0F0h,    4, 0BAh,	 0Ch,  3Bh
		db  0BDh,    4,	0F0h,	 8, 0B6h,    6,	 35h, 0B6h,    4, 0F0h,	   8, 0BDh,    4, 0F0h,	   8, 0BBh
		db     3, 0BDh,	   2, 0BBh,    3, 0BDh,	   2,  3Bh, 0BAh,  0Ch,	 38h,  36h, 0B5h,    3,	 36h,  35h
		db   36h, 0B5h,	 0Ch,  36h,  38h, 0BAh,	 24h, 0B8h,  0Ch, 0B6h,	   4, 0F0h,    8, 0B3h,	   6,  32h
		db   33h, 0F0h,	 12h, 0FDh,    0, 0F0h,	 0Ch, 0FDh,  7Bh, 0B3h,	   6,  32h,  33h, 0F0h,	 12h, 0FDh
		db     0, 0F0h,	 0Ch, 0FDh,  7Bh, 0B3h,	   6,  32h,  33h,  70h,	 36h,  70h,  2Eh, 0F0h,	 12h, 0BAh
		db     3,  3Bh,	 3Ah,  3Bh,  3Ah,  3Bh,	0BAh,	 6, 0FDh,    0,	0F0h,  0Ch, 0FDh,  7Bh,	0B8h,	 6
		db   37h,  38h,	0F0h,  12h, 0FDh,    0,	0F0h,  0Ch, 0FDh,  7Bh,	0B8h,	 6,  37h,  38h,	0F0h,  12h
		db  0FDh,    0,	0F0h,  0Ch, 0FDh,  7Bh,	0B8h,	 6,  37h,  38h,	 70h,  3Bh,  70h, 0C4h,	 0Ch, 0C2h
		db     4,  44h,	 42h, 0C1h,  0Ch,  3Fh,	0BBh,	 6,  3Dh,  41h,	 44h,  42h,  40h,  3Dh,	 3Ah,  39h
		db   3Bh,  3Fh,	 42h,  40h,  3Eh,  3Bh,	 38h,  37h,  39h,  3Dh,	 40h,  3Eh,  3Ch,  39h,	 36h, 0B5h
		db     4,  36h,	 37h,  3Ah,  3Bh,  3Eh,	0BCh,	 3,  3Eh,  3Ch,	 3Eh,  3Ch,  3Eh,  3Ch,	 70h, 0F8h
		db  0A0h, 0F8h,	 60h, 0B0h,  18h, 0F0h,	 0Ch,  39h, 0B7h,    6,	0F0h,  0Ch, 0FDh,    0,	0F0h,  12h
		db  0FDh,  7Bh,	0B9h,  0Ch, 0B7h,    6,	0F0h,  0Ch, 0FDh,    0,	0F0h,  12h, 0FDh,  7Bh,	0B9h,  0Ch
		db  0B7h,    6,	0F0h,  12h, 0B7h,    3,	 39h,  37h,  39h, 0B7h,	   2, 0B9h,    3, 0B7h,	   2, 0B6h
		db     3, 0B7h,	   2, 0BCh,    6, 0F0h,	 0Ch, 0FDh,    0, 0F0h,	 1Eh, 0F8h, 0A1h
MUSIC_00_PSG2:	db  0FCh,    0,	0FBh,  4Ch, 0FDh,    0,	0F0h,  2Ah, 0F8h,    0,	0F0h,	 6, 0FDh,  1Ah,	0A8h,  18h
					; DATA XREF: ROM:8962o
		db   28h,  28h,	 28h,  28h,  28h,  29h,	 29h,  29h,  29h,  29h,	 29h,  29h,  2Ah, 0ABh,	 0Ch, 0ABh
		db   18h, 0F0h,	   6, 0F8h,  20h, 0FDh,	   0, 0F0h,  0Ch, 0FDh,	 78h,  29h,  2Dh,  34h,	0B2h,  30h
		db  0F0h,  0Ch,	 28h,  2Bh,  32h, 0B1h,	 30h, 0F0h,  0Ch,  26h,	 29h,  30h, 0AFh,  18h,	0B0h,  0Ch
		db   32h,  30h,	0AFh,	 4,  30h,  34h,	0B9h,  18h, 0B7h,  30h,	0F0h,  0Ch,  28h,  2Ch,	 35h, 0B4h
		db   18h, 0B2h,	 0Ch,  30h,  2Fh,  2Ch,	 2Dh,  2Fh, 0F8h,  40h,	0B0h,  18h, 0FDh,    0,	0F0h,  1Eh
		db  0FDh,  1Ah,	0B2h,	 6,  31h, 0B2h,	 24h, 0B3h,    6,  32h,	0B3h,  24h, 0B4h,    6,	 33h, 0B4h
		db   24h, 0B5h,	   6,  34h,  32h,  30h,	 2Dh,  2Bh, 0FDh,    0,	0F0h,  12h, 0FDh,  78h,	0FCh,	 3
		db  0C3h,    6,	 42h,  43h,  70h,  48h,	 70h, 0FCh,    0, 0C3h,	   3,  45h,  43h,  45h,	 43h,  45h
		db   43h,  45h,	 43h,  45h,  43h,  45h,	 43h,  45h,  43h,  70h,	0F0h,	 6,  37h,  3Ch,	 40h,  45h
		db   70h,  43h,	 70h, 0C1h,  12h, 0C0h,	   6,  3Eh, 0F0h,  12h,	0FDh,	 0, 0F0h,  0Ch,	0FDh,  78h
		db  0FCh,    3,	0C5h,	 6,  44h,  45h,	 70h,  4Ah,  70h, 0FCh,	   0, 0C5h,    3,  47h,	 45h,  47h
		db   45h,  47h,	 45h,  47h,  45h,  47h,	 45h,  47h,  45h,  47h,	 45h,  70h, 0F0h,    6,	 39h,  3Eh
		db   40h,  42h,	 70h,  3Eh,  70h, 0BCh,	 0Ch, 0BBh,    6,  70h,	 37h,  70h, 0FDh,  79h,	 37h,  38h
		db  0BAh,    4,	0F0h,	 8, 0B3h,    6,	 32h, 0B3h,    4, 0F0h,	   8, 0BAh,    4, 0F0h,	   8, 0B8h
		db     3, 0BAh,	   2, 0B8h,    3, 0BAh,	   2,  38h, 0B7h,  0Ch,	 35h,  33h, 0B2h,    3,	 33h,  32h
		db   33h,  32h,	 33h,  32h,  33h, 0B2h,	 0Ch,  30h, 0AEh,    6,	 70h, 0BAh,    8, 0F0h,	   4, 0BAh
		db   0Ch,  3Bh,	0BDh,	 4, 0F0h,    8,	0B6h,	 6,  35h, 0B6h,	   4, 0F0h,    8, 0BDh,	   4, 0F0h
		db     8, 0BBh,	   3, 0BDh,    2, 0BBh,	   3, 0BDh,    2,  3Bh,	0BAh,  0Ch,  38h,  36h,	0B5h,	 3
		db   36h,  35h,	 36h, 0B5h,  0Ch,  36h,	 38h, 0BAh,  24h, 0B8h,	 0Ch, 0B6h,    4, 0F0h,	   8, 0B3h
		db     6,  32h,	 33h, 0F0h,  12h, 0FDh,	   0, 0F0h,  0Ch, 0FDh,	 79h, 0B3h,    6,  32h,	 33h, 0F0h
		db   12h, 0FDh,	   0, 0F0h,  0Ch, 0FDh,	 79h, 0B3h,    6,  32h,	 33h,  70h,  36h,  70h,	 2Eh, 0F0h
		db   12h, 0BAh,	   3,  3Bh,  3Ah,  3Bh,	 3Ah,  3Bh, 0BAh,    6,	0FDh,	 0, 0F0h,  0Ch,	0FDh,  79h
		db  0B8h,    6,	 37h,  38h, 0F0h,  12h,	0FDh,	 0, 0F0h,  0Ch,	0FDh,  79h, 0B8h,    6,	 37h,  38h
		db  0F0h,  12h,	0FDh,	 0, 0F0h,  0Ch,	0FDh,  79h, 0B8h,    6,	 37h,  38h,  70h,  3Bh,	 70h, 0C4h
		db   0Ch, 0C2h,	   4,  44h,  42h, 0C1h,	 0Ch,  3Fh, 0BBh,    6,	 3Dh,  41h,  44h,  42h,	 40h,  3Dh
		db   3Ah,  39h,	 3Bh,  3Fh,  42h,  40h,	 3Eh,  3Bh,  38h,  37h,	 39h,  3Dh,  40h,  3Eh,	 3Ch,  39h
		db   36h, 0B5h,	   4,  36h,  37h,  3Ah,	 3Bh,  3Eh, 0BCh,    3,	 3Eh,  3Ch,  3Eh,  3Ch,	 3Eh,  3Ch
		db   70h, 0F8h,	0A0h, 0F8h,  60h, 0B0h,	 18h, 0F0h,  0Ch,  39h,	0B7h,	 6, 0F0h,  0Ch,	0FDh,	 0
		db  0F0h,  12h,	0FDh,  79h, 0B9h,  0Ch,	0B7h,	 6, 0F0h,  0Ch,	0FDh,	 0, 0F0h,  12h,	0FDh,  79h
		db  0B9h,  0Ch,	0B7h,	 6, 0F0h,  12h,	0B7h,	 3,  39h,  37h,	 39h, 0B7h,    2, 0B9h,	   3, 0B7h
		db     2, 0B6h,	   3, 0B7h,    2, 0BCh,	   6, 0F0h,  0Ch, 0FDh,	   0, 0F0h,  1Eh, 0F8h,	0A1h
MUSIC_00_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:8964o	ROM:8966o
MUSIC_01:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 186
		dw MUSIC_01_YM1
		dw MUSIC_01_YM2
		dw MUSIC_01_YM3
		dw MUSIC_01_YM4
		dw MUSIC_01_YM5
		dw MUSIC_01_YM6
		dw MUSIC_01_PSG1
		dw MUSIC_01_PSG2
		dw MUSIC_01_PSG3
		dw MUSIC_01_PSG3
MUSIC_01_YM1:	db  0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	0F0h,  30h, 0FEh,  31h,	0FDh,  0Bh,  2Fh,  37h,	0B8h,  48h
					; DATA XREF: ROM:9586o
		db  0AFh,  18h,	 37h,  38h,  3Ah,  3Bh,	 37h,  38h, 0FCh,  80h,	0B4h, 0C0h, 0FBh,  20h,	0FCh,	 1
		db  0B4h,  60h,	0FBh,  2Ch,  2Ch, 0F0h,	 18h,  27h,  2Bh, 0ACh,	 30h, 0ABh,  18h,  26h,	 27h,  2Bh
		db  0ACh,  30h,	0ABh,  18h,  70h,  23h,	 25h, 0A6h,  30h, 0A9h,	 18h,  22h,  23h,  25h,	0A6h,  30h
		db  0A9h,  18h,	 37h,  36h,  37h,  36h,	0B7h,  30h, 0FCh,  80h,	0B8h,  90h, 0FBh,  20h,	0FCh,	 1
		db  0B8h, 0D8h,	0FBh,  2Ch, 0FDh,  0Ch,	0B8h,  18h,  3Ah,  3Bh,	 37h,  38h, 0FDh,  0Bh,	0B4h, 0F0h
		db  0FDh,  0Ch,	0B5h,  18h,  31h,  2Fh,	 2Eh,  2Ch,  2Ah, 0F8h,	0A1h
MUSIC_01_YM2:	db  0FEh,  31h,	0FCh,	 1, 0FBh,  2Ch,	0F8h,	 0, 0F0h,  18h,	0FDh,  0Bh,  29h,  2Bh,	 2Ch, 0A8h
					; DATA XREF: ROM:9588o
		db   48h, 0A9h,	 18h, 0A6h,  30h, 0A8h,	 18h,  29h,  2Bh,  2Ch,	 2Eh,  2Fh,  31h,  2Bh,	 2Ch, 0A6h
		db   48h, 0B1h,	 18h,  2Bh,  2Ch,  26h,	0B1h,  48h, 0B3h,  18h,	 34h,  36h, 0FDh,  0Ah,	0FCh,  80h
		db  0B7h,  90h,	0FBh,  20h, 0FCh,    1,	 37h, 0FBh,  2Ch, 0FCh,	 80h,  35h, 0FBh,  20h,	0FCh,	 1
		db   35h, 0F0h,	 30h, 0F8h, 0C9h, 0F0h,	 60h, 0F8h, 0E0h, 0F8h,	0A1h
MUSIC_01_YM3:	db  0FEh,  24h,	0FDh,  0Bh, 0FCh,    0,	0FBh,  2Ch, 0F8h,    0,	 96h, 0C0h,  16h,  96h,	 60h,  10h
					; DATA XREF: ROM:958Ao
		db   16h,  10h,	0FDh,  0Ah,  94h,  90h,	 14h,  19h, 0FDh,    9,	 19h,  70h,  70h, 0FDh,	 0Ch,  90h
		db   30h, 0FDh,	 0Bh,  1Ch,  1Dh, 0F0h,	 18h, 0FDh,  0Ch,  10h,	0FDh,  0Bh,  1Ch,  1Dh,	 1Fh,  20h
		db   1Ch,  1Dh,	0A5h,  60h,  23h, 0A2h,	0C0h, 0F8h, 0A1h
MUSIC_01_YM4:	db  0FAh,  40h,	0FEh,  3Bh, 0F9h,  84h,	0FDh,  0Ah, 0FCh,    0,	0FBh,  2Ch, 0F8h,    0,	0BEh,  60h
					; DATA XREF: ROM:958Co
		db   3Eh,  3Eh,	 3Eh,  3Dh,  3Dh,  3Dh,	 3Dh, 0B7h,  30h,  32h,	 3Eh,  37h,  32h,  3Eh,	 35h,  2Fh
		db   3Bh,  35h,	 2Fh,  3Bh, 0B0h,  18h,	 31h,  30h,  31h,  30h,	 31h,  32h,  31h,  32h,	 31h,  32h
		db   31h,  32h,	 31h,  32h,  31h,  32h,	 31h,  32h,  31h,  32h,	 31h,  32h,  31h,  32h,	 31h,  2Fh
		db   31h,  32h,	 34h,  35h,  37h,  38h,	 3Ah, 0BBh,  60h,  3Dh,	0F8h, 0A1h
MUSIC_01_YM5:	db  0FAh,  80h,	0F9h,  84h, 0FEh,  3Bh,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	0BBh,  60h
					; DATA XREF: ROM:958Eo
		db   3Bh,  3Bh,	 3Bh,  3Ah,  3Ah,  3Ah,	 3Ah, 0B3h,  30h,  2Eh,	 3Ah,  33h,  2Eh,  3Ah,	 31h,  2Bh
		db   37h,  31h,	 2Bh,  37h, 0ACh,  18h,	 2Dh,  2Ch,  2Dh,  2Ch,	 2Dh,  2Eh,  2Fh,  2Eh,	 2Fh,  2Eh
		db   2Fh,  2Eh,	 2Fh,  2Eh,  2Fh,  2Eh,	 2Fh,  2Eh,  2Fh,  2Eh,	 2Fh,  2Eh,  2Fh,  2Eh,	 2Fh,  2Bh
		db   2Eh,  2Fh,	 31h,  32h,  34h,  35h,	 37h, 0B8h,  60h,  3Ah,	0F8h, 0A1h
MUSIC_01_YM6:	db  0FFh,    0,	   0	; DATA XREF: ROM:9590o
MUSIC_01_PSG1:	db  0FDh,  28h,	0FCh,	 0, 0FBh,    0,	0F8h,	 0, 0BEh,  60h,	 3Eh,  3Eh,  3Eh,  3Dh,	 3Dh,  3Dh
					; DATA XREF: ROM:9592o
		db   3Dh, 0B7h,	 30h,  32h,  3Eh,  37h,	 32h,  3Eh,  35h,  2Fh,	 3Bh,  35h,  2Fh,  3Bh,	0B0h,  18h
		db   31h,  30h,	 31h,  30h,  31h,  32h,	 31h,  32h,  31h,  32h,	 31h,  32h,  31h,  32h,	 31h,  32h
		db   31h,  32h,	 31h,  32h,  31h,  32h,	 31h,  32h,  31h,  2Fh,	 31h,  32h,  34h,  35h,	 37h,  38h
		db   3Ah, 0BBh,	 60h,  3Dh, 0F8h, 0A1h
MUSIC_01_PSG2:	db  0FDh,  28h,	0FCh,	 0, 0FBh,    0,	0F8h,	 0, 0BBh,  60h,	 3Bh,  3Bh,  3Bh,  3Ah,	 3Ah,  3Ah
					; DATA XREF: ROM:9594o
		db   3Ah, 0B3h,	 30h,  2Eh,  3Ah,  33h,	 2Eh,  3Ah,  31h,  2Bh,	 37h,  31h,  2Bh,  37h,	0ACh,  18h
		db   2Dh,  2Ch,	 2Dh,  2Ch,  2Dh,  2Eh,	 2Fh,  2Eh,  2Fh,  2Eh,	 2Fh,  2Eh,  2Fh,  2Eh,	 2Fh,  2Eh
		db   2Fh,  2Eh,	 2Fh,  2Eh,  2Fh,  2Eh,	 2Fh,  2Eh,  2Fh,  2Bh,	 2Eh,  2Fh,  31h,  32h,	 34h,  35h
		db   37h, 0B8h,	 60h,  3Ah, 0F8h, 0A1h
MUSIC_01_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:9596o	ROM:9598o
MUSIC_09:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 188
		dw MUSIC_09_YM1
		dw MUSIC_09_YM2
		dw MUSIC_09_YM3
		dw MUSIC_09_YM4
		dw MUSIC_09_YM5
		dw MUSIC_09_YM6
		dw MUSIC_09_PSG1
		dw MUSIC_09_PSG2
		dw MUSIC_09_PSG3
		dw MUSIC_09_PSG3
MUSIC_09_YM1:	db  0F8h,    0,	0FCh,	 1, 0FBh,  2Ch,	0FEh,  31h, 0FDh,  0Bh,	0F8h, 0CBh, 0B7h,    4,	 33h,  2Fh
					; DATA XREF: ROM:97B7o
		db  0F8h, 0E0h,	0FDh,  0Ah, 0B7h,    4,	 33h,  2Fh, 0FDh,    9,	 37h,  33h,  2Fh, 0FDh,	   8,  37h
		db   33h,  2Fh,	0FDh,	 7,  37h,  33h,	 2Fh, 0FDh,  0Bh, 0F8h,	0CBh, 0B5h,    4,  31h,	 2Dh, 0F8h
		db  0E0h, 0FDh,	 0Ah, 0B5h,    4,  31h,	 2Dh, 0FDh,    9,  35h,	 31h,  2Dh, 0FDh,    8,	 35h,  31h
		db   2Dh, 0FDh,	   7,  35h,  31h,  2Dh,	0FDh,  0Bh, 0F8h, 0CBh,	0B0h,	 4,  2Ch,  28h,	 30h,  2Ch
		db   28h, 0F8h,	0E0h, 0FDh,  0Ah, 0B0h,	   4,  2Ch,  28h, 0FDh,	   9,  30h,  2Ch,  28h,	0FDh,	 8
		db   30h,  2Ch,	 28h, 0FDh,    7,  30h,	 2Ch,  28h, 0FDh,    6,	 30h,  2Ch,  28h, 0FDh,	   5,  30h
		db   2Ch,  28h,	0FDh,	 4,  30h,  2Ch,	 28h, 0FDh,    3,  30h,	 2Ch,  28h, 0F0h,  30h,	0FEh,  31h
		db  0FDh,  0Bh,	0B8h,  18h,  33h,  32h,	0ADh,  30h, 0B8h,  18h,	 33h,  32h,  2Dh, 0BAh,	 48h, 0BBh
		db   30h,  70h,	0B7h,  18h,  32h,  31h,	0ACh,  30h, 0B7h,  18h,	 32h,  31h,  2Ch, 0B9h,	 48h, 0BAh
		db   30h, 0FEh,	 31h, 0FDh,    9, 0ABh,	 60h, 0FDh,  0Ah,  2Ch,	0FDh,  0Bh,  2Dh, 0FDh,	 0Ch,  2Eh
		db  0FEh,  2Dh,	0FDh,  0Bh, 0AFh,  18h,	 2Fh,  2Fh,  2Fh,  2Fh,	 2Eh,  2Fh,  2Eh,  2Fh,	0B2h,  30h
		db   32h, 0AEh,	 18h,  2Fh,  32h,  31h,	 32h, 0B5h,  30h,  35h,	0B1h,  18h,  32h,  35h,	 36h,  35h
		db   36h, 0B9h,	 30h,  39h, 0B5h,  18h,	0B6h,  30h,  3Ah,  3Bh,	0BCh,  0Ah, 0BCh,    6,	0B7h,  0Ah
		db  0B7h,    6,	0C3h,  0Ah, 0C3h,    6,	0FDh,  0Ah, 0C2h,  0Ah,	0C2h,	 6, 0BBh,  0Ah,	0BBh,	 6
		db  0BCh,  0Ah,	0BCh,	 6, 0FDh,    9,	0B7h,  0Ah, 0B7h,    6,	0C3h,  0Ah, 0C3h,    6,	0C2h,  0Ah
		db  0C2h,    6,	0FDh,	 8, 0BBh,  0Ah,	0BBh,	 6, 0BCh,  0Ah,	0BCh,	 6, 0B7h,  0Ah,	0B7h,	 6
		db  0FDh,    7,	0C3h,  0Ah, 0C3h,    6,	0C2h,  0Ah, 0C2h,    6,	0BBh,  0Ah, 0BBh,    6,	0FDh,	 6
		db  0BCh,  0Ah,	0BCh,	 6, 0B7h,  0Ah,	0B7h,	 6, 0C3h,  0Ah,	0C3h,	 6, 0FDh,    5,	0C2h,  0Ah
		db  0C2h,    6,	0BBh,  0Ah, 0BBh,    6,	0F0h,  30h, 0FEh,  37h,	0FDh,  0Bh, 0F8h, 0C5h,	0C2h,	 4
		db   41h, 0F8h,	0E0h, 0FDh,  0Ah, 0C2h,	   4,  41h,  42h,  41h,	0FDh,	 9,  42h,  41h,	0FDh,	 8
		db   42h,  41h,	0FDh,	 7,  42h,  41h,	0FDh,	 6,  42h,  41h,	0FDh,	 5,  42h,  41h,	0FDh,	 4
		db   42h,  41h,	0FDh,	 3,  42h,  41h,	0FDh,	 2,  42h,  41h,	0FDh,	 1,  42h,  41h,	0F0h,	 8
		db  0F8h, 0A1h
MUSIC_09_YM2:	db  0F8h,    0,	0FCh,	 1, 0FBh,  2Ch,	0FEh,  31h, 0FDh,  0Bh,	0FAh,  40h, 0F8h, 0CBh,	0B3h,	 4
					; DATA XREF: ROM:97B9o
		db   2Fh,  37h,	0F8h, 0E0h, 0FDh,  0Ah,	0B3h,	 4,  2Fh,  37h,	0FDh,	 9,  33h,  2Fh,	 37h, 0FDh
		db     8,  33h,	 2Fh,  37h, 0FDh,    7,	 33h,  2Fh,  37h, 0FDh,	 0Bh, 0F8h, 0CBh, 0B1h,	   4,  2Dh
		db   35h, 0F8h,	0E0h, 0FDh,  0Ah, 0B1h,	   4,  2Dh,  35h, 0FDh,	   9,  31h,  2Dh,  35h,	0FDh,	 8
		db   31h,  2Dh,	 35h, 0FDh,    7,  31h,	 2Dh,  35h, 0FDh,  0Bh,	0F8h, 0CBh, 0ACh,    4,	 28h,  30h
		db   2Ch,  28h,	 30h, 0F8h, 0E0h, 0FDh,	 0Ah, 0ACh,    4,  28h,	 30h, 0FDh,    9,  2Ch,	 28h,  30h
		db  0FDh,    8,	 2Ch,  28h,  30h, 0FDh,	   7,  2Ch,  28h,  30h,	0FDh,	 6,  2Ch,  28h,	 30h, 0FDh
		db     5,  2Ch,	 28h,  30h, 0FDh,    4,	 2Ch,  28h,  30h, 0FDh,	   3,  2Ch,  28h,  30h,	0F0h,  60h
		db  0FAh, 0C0h,	0FEh,  2Ch, 0FDh,    8,	 26h, 0FCh,    3, 0A6h,	 18h, 0A6h,  4Ah, 0FCh,	   1, 0A6h
		db   0Ch, 0A7h,	   8,  28h, 0A9h,    6,	 28h,  27h, 0A6h,  30h,	0F0h,  60h,  25h, 0FCh,	   3, 0A5h
		db   18h, 0A5h,	 4Ah, 0FCh,    1, 0A5h,	 0Ch, 0A6h,    8,  27h,	0A8h,	 6,  27h,  26h,	0A5h,  30h
		db  0FEh,  31h,	0FDh,	 9, 0A3h,  60h,	0FDh,  0Ah,  24h, 0FDh,	 0Bh,  25h, 0FDh,  0Ch,	 26h, 0FEh
		db   2Dh, 0FDh,	 0Ah, 0A7h,  18h,  27h,	 27h,  27h,  27h,  26h,	 27h,  26h,  27h, 0AAh,	 30h,  2Ah
		db  0A6h,  18h,	 27h,  2Ah,  29h,  2Ah,	0ADh,  30h,  2Dh, 0A9h,	 18h,  2Ah,  2Dh,  2Eh,	 2Dh,  2Eh
		db  0B1h,  30h,	 31h, 0ADh,  18h, 0AEh,	 30h,  32h,  33h, 0FCh,	 80h, 0B4h, 0A0h, 0FBh,	 20h, 0FCh
		db     1,  34h,	0F0h,  30h, 0FEh,  37h,	0FDh,  0Bh, 0F8h, 0C5h,	0C1h,	 4,  40h, 0F8h,	0E0h, 0FDh
		db   0Ah, 0C1h,	   4,  40h,  41h,  40h,	0FDh,	 9,  41h,  40h,	0FDh,	 8,  41h,  40h,	0FDh,	 7
		db   41h,  40h,	0FDh,	 6,  41h,  40h,	0FDh,	 5,  41h,  40h,	0FDh,	 4,  41h,  40h,	0FDh,	 3
		db   41h,  40h,	0FDh,	 2,  41h,  40h,	0FDh,	 1,  41h,  40h,	0F0h,	 8, 0F8h, 0A1h
MUSIC_09_YM3:	db  0F8h,    0,	0FCh,	 1, 0FBh,  2Ch,	0FEh,  31h, 0FDh,  0Bh,	0FAh,  80h, 0F8h, 0CBh,	0AFh,	 4
					; DATA XREF: ROM:97BBo
		db   37h,  33h,	0F8h, 0E0h, 0FDh,  0Ah,	0AFh,	 4,  37h,  33h,	0FDh,	 9,  2Fh,  37h,	 33h, 0FDh
		db     8,  2Fh,	 37h,  33h, 0FDh,    7,	 2Fh,  37h,  33h, 0FDh,	 0Bh, 0F8h, 0CBh, 0ADh,	   4,  35h
		db   31h, 0F8h,	0E0h, 0FDh,  0Ah, 0ADh,	   4,  35h,  31h, 0FDh,	   9,  2Dh,  35h,  31h,	0FDh,	 8
		db   2Dh,  35h,	 31h, 0FDh,    7,  2Dh,	 35h,  31h, 0FDh,  0Bh,	0F8h, 0CBh, 0A8h,    4,	 30h,  2Ch
		db   28h,  30h,	 2Ch, 0F8h, 0E0h, 0FDh,	 0Ah, 0A8h,    4,  30h,	 2Ch, 0FDh,    9,  28h,	 30h,  2Ch
		db  0FDh,    8,	 28h,  30h,  2Ch, 0FDh,	   7,  28h,  30h,  2Ch,	0FDh,	 6,  28h,  30h,	 2Ch, 0FDh
		db     5,  28h,	 30h,  2Ch, 0FDh,    4,	 28h,  30h,  2Ch, 0FDh,	   3,  28h,  30h,  2Ch,	0F0h,  60h
		db  0FAh, 0C0h,	0FEh,  2Ch, 0FDh,    8,	 23h, 0FCh,    3, 0A3h,	 18h, 0A3h,  4Ah, 0FCh,	   1, 0A3h
		db   0Ch, 0A4h,	   8,  25h, 0A6h,    6,	 25h,  24h, 0A3h,  30h,	0F0h,  60h,  22h, 0FCh,	   3, 0A2h
		db   18h, 0A2h,	 4Ah, 0FCh,    1, 0A2h,	 0Ch, 0A3h,    8,  24h,	0A5h,	 6,  24h,  23h,	0A2h,  30h
		db  0FEh,  31h,	0FDh,	 9,  9Bh,  60h,	0FDh,  0Ah,  1Ch, 0FDh,	 0Bh,  1Dh, 0FDh,  0Ch,	 1Eh, 0FEh
		db   2Dh, 0FDh,	   8,  9Fh,  18h,  1Eh,	 1Dh,  1Fh,  1Eh,  1Dh,	 1Fh,  20h,  1Fh, 0A0h,	 30h,  22h
		db  0A0h,  18h,	 1Fh,  22h, 0FDh,    9,	 23h,  22h, 0A3h,  30h,	 25h, 0A3h,  18h,  22h,	 23h,  26h
		db   27h,  26h,	0A7h,  30h,  29h, 0A7h,	 18h, 0A6h,  30h,  2Ah,	 29h, 0FCh,  80h, 0ACh,	0A0h, 0FBh
		db   20h, 0FCh,	   1,  2Ch, 0F0h,  30h,	0FEh,  37h, 0FDh,  0Bh,	0F8h, 0C5h, 0C0h,    4,	 3Fh, 0F8h
		db  0E0h, 0FDh,	 0Ah, 0C0h,    4,  3Fh,	 40h,  3Fh, 0FDh,    9,	 40h,  3Fh, 0FDh,    8,	 40h,  3Fh
		db  0FDh,    7,	 40h,  3Fh, 0FDh,    6,	 40h,  3Fh, 0FDh,    5,	 40h,  3Fh, 0FDh,    4,	 40h,  3Fh
		db  0FDh,    3,	 40h,  3Fh, 0FDh,    2,	 40h,  3Fh, 0FDh,    1,	 40h,  3Fh, 0F0h,    8,	0F8h, 0A1h
MUSIC_09_YM4:	db  0F8h,    0,	0FCh,	 1, 0FBh,  2Ch,	0F0h,  30h, 0FEh,    4,	0FDh,  0Bh,  15h,  9Bh,	 18h,  17h
					; DATA XREF: ROM:97BDo
		db   1Eh,  1Dh,	0F0h,  30h,  1Bh, 0A1h,	 18h,  1Dh,  22h,  23h,	0F0h,  30h,  25h, 0A4h,	 20h,  20h
		db   1Fh,  9Eh,	 30h,  1Ah,  19h,  16h,	0FAh,  40h, 0FEh,  0Ch,	0FDh,  0Dh, 0FCh,  80h,	 90h,  0Ch
		db  0FCh,  82h,	 91h, 0B4h, 0FCh,    1,	 91h,  90h, 0F0h,  30h,	0FCh,  80h,  91h,  0Ch,	0FCh,  81h
		db   90h, 0B4h,	0FCh,	 1,  90h, 0C0h,	0FCh, 0FFh, 0FAh, 0C0h,	0FDh,  0Ah,  91h,  60h,	0FDh,  0Bh
		db   0Eh,  13h,	0FDh,  0Ch,  10h, 0FEh,	 2Dh, 0FDh,  0Ah,  95h,	 18h,  14h,  13h,  15h,	 14h,  13h
		db   0Eh,  11h,	 0Eh,  96h,  30h,  17h,	 91h,  18h,  0Eh,  11h,	 14h,  11h,  99h,  30h,	 1Ah,  94h
		db   18h,  11h,	 12h,  15h,  18h,  15h,	0FDh,	 9,  9Dh,  30h,	 1Eh,  98h,  18h,  95h,	 30h,  20h
		db   1Fh, 0FCh,	 80h, 0A5h, 0A0h, 0FBh,	 20h, 0FCh,    1,  25h,	0F0h, 0C0h, 0F8h, 0A1h
MUSIC_09_YM5:	db  0F8h,    0,	0FCh,	 1, 0FBh,  2Ch,	0F0h,  38h, 0FEh,    4,	0FDh,	 8,  95h,  30h,	 9Bh,  18h
					; DATA XREF: ROM:97BFo
		db   17h,  1Eh,	 1Dh, 0F0h,  30h,  1Bh,	0A1h,  18h,  1Dh,  22h,	 23h, 0F0h,  30h,  25h,	0A4h,  20h
		db   20h,  1Fh,	 9Eh,  30h,  1Ah,  99h,	 28h, 0FEh,  3Eh, 0FDh,	 0Bh,  96h,  34h, 0FAh,	 80h, 0FEh
		db   0Ch, 0FDh,	 0Dh, 0FCh,  80h,  90h,	 0Ch, 0FCh,  82h,  91h,	0B4h, 0FCh,    1,  91h,	 8Ch, 0FCh
		db  0FFh, 0FAh,	0C0h, 0FEh,  3Eh, 0FDh,	 0Bh,  91h,  34h, 0FAh,	 80h, 0FEh,  0Ch, 0FDh,	 0Dh, 0FCh
		db   80h,  91h,	 0Ch, 0FCh,  81h,  90h,	0B4h, 0FCh,    1,  90h,	0BCh, 0FCh, 0FFh, 0FEh,	 32h, 0FAh
		db  0C0h, 0FDh,	   9,  91h,  30h,  70h,	 0Eh,  70h,  13h,  70h,	 10h,  70h, 0F0h,  18h,	0FEh,  2Fh
		db  0FDh,    8,	0F8h, 0C8h, 0B4h,    8,	 2Eh,  1Eh, 0BAh,  48h,	0F8h, 0E8h, 0B4h,    8,	 2Eh,  1Eh
		db  0FDh,    9,	0BAh,  18h,  39h, 0FDh,	   8,  38h,  37h, 0FDh,	   7,  36h,  35h, 0FDh,	   6,  34h
		db   33h, 0FDh,	   5,  32h,  31h, 0FDh,	   4,  30h, 0FDh,    3,	 2Fh, 0FDh,    2,  2Eh,	0F0h, 0E0h
		db  0F8h, 0A1h
MUSIC_09_YM6:	db  0F8h,    0,	0F8h, 0C3h, 0F0h, 0C0h,	0F8h, 0E0h, 0F8h, 0C6h,	0FAh,  40h,  8Ah,  0Ch,	0FAh,  80h
					; DATA XREF: ROM:97C1o
		db   8Bh,  24h,	0F8h, 0E0h, 0F0h,  30h,	0F8h, 0C7h, 0FAh,  40h,	 8Ah,  0Ch, 0FAh,  80h,	 8Bh,  24h
		db  0F8h, 0E0h,	0F0h,  30h, 0FAh, 0C0h,	   0,  80h,  18h,  80h,	 78h,  80h,  30h,  80h,	 22h,	 0
		db   80h,  1Ch,	0F8h, 0C7h, 0F0h, 0B5h,	0F8h, 0E0h, 0F8h, 0A1h
MUSIC_09_PSG1:	db  0FFh,    0,	   0	; DATA XREF: ROM:97C3o
MUSIC_09_PSG2:	db  0FFh,    0,	   0	; DATA XREF: ROM:97C5o
MUSIC_09_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:97C7o	ROM:97C9o
MUSIC_11:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 201
		dw MUSIC_11_YM1
		dw MUSIC_11_YM2
		dw MUSIC_11_YM3
		dw MUSIC_11_YM4
		dw MUSIC_11_YM5
		dw MUSIC_11_YM6
		dw MUSIC_11_PSG1
		dw MUSIC_11_PSG2
		dw MUSIC_11_PSG3
		dw MUSIC_11_PSG3
MUSIC_11_YM1:	db  0F0h,  48h,	0F8h,	 0, 0FEh,    8,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Eh, 0A2h,  18h,	0F8h,  20h
					; DATA XREF: ROM:9D12o
		db  0A7h,  24h,	0A9h,	 5, 0F0h,    7,	0A9h,  30h, 0F0h,  0Ch,	 22h,  27h,  29h,  2Bh,	 2Ch,  29h
		db   2Bh, 0A7h,	 24h, 0B0h,    6,  70h,	0AEh,  60h, 0F0h,  18h,	 27h, 0ACh,  24h, 0AEh,	   6,  70h
		db  0AEh,  30h,	0F0h,  0Ch,  27h,  2Ch,	 2Eh,  30h,  31h,  2Eh,	 30h, 0ACh,  24h, 0B5h,	   6,  70h
		db  0B3h,  6Ch,	0F0h,  0Ch,  33h,  35h,	0F8h,  40h, 0B6h,  18h,	 35h,  33h,  31h,  38h,	 36h,  35h
		db   33h, 0BAh,	 30h, 0B3h,  24h, 0B8h,	   6,  70h, 0B6h,  24h,	0FCh,  80h, 0B5h,  11h,	0FCh,  8Ah
		db  0FCh,    1,	0A8h,  0Ah, 0F0h,    9,	0FCh, 0FFh, 0A2h,  18h,	0F8h, 0A0h, 0F8h,  60h,	0B6h,  18h
		db   35h,  33h,	0B1h,	 6,  33h,  36h,	 70h, 0B8h,    8,  70h,	 36h,  70h,  35h,  70h,	0B3h,  18h
		db   31h, 0FEh,	 14h, 0FDh,  0Bh, 0FCh,	   6, 0B2h,  0Ch,  29h,	 29h,  30h,  29h,  30h,	0B2h,  78h
		db  0B5h,  0Ch,	 2Ch,  2Ch,  33h,  2Ch,	 33h, 0B5h,  78h, 0B6h,	 0Ch,  2Ch,  2Ch,  34h,	 2Ch,  34h
		db  0B6h,  78h,	0B3h,  0Ch,  2Ah,  2Ah,	 31h,  2Ah,  31h, 0B3h,	 78h, 0B0h,  0Ch,  27h,	 27h,  2Eh
		db   27h,  2Eh,	0B0h,  78h, 0B3h,  0Ch,	 2Ah,  2Ah,  31h,  2Ah,	 31h, 0B3h,  78h, 0B4h,	 0Ch,  2Ah
		db   2Ah,  32h,	 2Ah,  32h, 0B4h,  78h,	0B4h,  0Ch,  29h,  29h,	 32h,  29h,  32h, 0B4h,	 24h, 0A9h
		db   0Ch,  32h,	 29h, 0FCh,    1,  32h,	0B4h,	 6,  70h, 0FEh,	 19h, 0FDh,  0Ch, 0B0h,	 0Ch,  32h
		db  0B3h,  18h,	 32h,  30h,  2Eh,  35h,	 33h,  32h, 0B3h,  0Ch,	 35h, 0B6h,  18h,  35h,	 33h,  31h
		db   38h,  36h,	 35h,  33h, 0F8h, 0C1h,	0BAh,  30h, 0B3h,  24h,	0BAh,	 6,  70h, 0F8h,	0E0h, 0BAh
		db  0A8h, 0F8h,	0A1h
MUSIC_11_YM2:	db  0F0h,  60h,	0F8h,	 0, 0F8h,  20h,	0FEh,  1Ah, 0FDh,    8,	0FCh,	 6, 0FBh,  2Ch,	0F8h, 0C1h
					; DATA XREF: ROM:9D14o
		db  0AEh,  24h,	0AEh,  18h,  2Eh, 0AEh,	 0Ch, 0AEh,  24h, 0AEh,	 3Ch, 0F8h, 0E0h, 0ACh,	 24h, 0ACh
		db   18h,  2Eh,	0AEh,  0Ch, 0ACh,  24h,	0ACh,  3Ch, 0ACh,  24h,	0ACh,  18h,  2Eh, 0ACh,	 0Ch, 0ACh
		db   24h, 0ABh,	 3Ch, 0FCh,    1, 0AFh,	 0Ch, 0FCh,    6,  27h,	 2Ch, 0AFh,  18h, 0A7h,	 0Ch, 0FCh
		db     1, 0A7h,	 18h, 0F8h,  40h, 0B1h,	 0Ch, 0FCh,    6,  29h,	 2Eh, 0B1h,  18h, 0A9h,	 0Ch, 0FCh
		db     1, 0A9h,	 18h, 0B3h,  0Ch, 0FCh,	   6,  2Ah,  2Fh, 0B3h,	 18h, 0AAh,  0Ch, 0FCh,	   1, 0AAh
		db   18h, 0ACh,	 1Eh, 0F0h,    6, 0ACh,	 24h, 0F0h,  18h, 0F8h,	0A0h, 0F8h,  60h, 0FCh,	   6, 0B1h
		db   10h,  31h,	 2Eh, 0F0h,  0Ch,  29h,	 29h,  29h, 0FEh,  33h,	0FDh,  0Ah, 0A7h,  66h,	0F0h,	 6
		db   9Bh,  0Ch,	 20h,  22h,  27h,  29h,	 20h,  22h,  9Eh,  66h,	0F0h,	 6,  9Eh,  0Ch,	 23h,  25h
		db   2Ah,  2Ch,	 23h,  25h,  9Ch,  66h,	0F0h,	 6,  9Ch,  0Ch,	 21h,  23h,  26h,  28h,	 21h,  23h
		db   92h,  24h,	 94h,  42h, 0F0h,    6,	0A0h,  0Ch,  25h,  27h,	 2Ch,  2Ah,  27h,  20h,	0A5h,  66h
		db  0F0h,    6,	0A5h,  0Ch,  2Ah,  2Ch,	 31h,  33h,  2Ah,  2Ch,	0A8h,  66h, 0F0h,    6,	 9Ch,  0Ch
		db   21h,  23h,	 28h,  2Ah,  21h,  23h,	0A4h,  24h, 0A6h,  42h,	0F0h,	 6,  9Ah,  0Ch,	 1Fh,  21h
		db   24h,  26h,	 1Fh,  21h,  9Dh,  24h,	 1Fh,  1Dh, 0ABh,  0Ch,	 29h,  26h,  24h,  26h,	0FCh,	 1
		db   9Fh,  18h,	0FEh,  1Ah, 0FDh,    8,	0ACh,  0Ch, 0FCh,    6,	 24h,  29h, 0ACh,  18h,	0A4h,  0Ch
		db  0FCh,    1,	0A4h,  18h, 0AEh,  0Ch,	0FCh,	 6,  26h,  2Bh,	0AEh,  18h, 0A6h,  0Ch,	0FCh,	 1
		db  0A6h,  18h,	0AFh,  0Ch, 0FCh,    6,	 27h,  2Ch, 0AFh,  18h,	0A7h,  0Ch, 0FCh,    1,	0A7h,  18h
		db  0B1h,  0Ch,	0FCh,	 6,  29h,  2Eh,	0B1h,  18h, 0A9h,  0Ch,	0FCh,	 1, 0A9h,  18h,	0AFh,  0Ch
		db  0FCh,    6,	 27h,  2Ch, 0AFh,  18h,	0A7h,  0Ch, 0FCh,    1,	0A7h,  18h, 0AFh,  0Ch,	0FCh,	 6
		db   27h,  29h,	0AFh,  18h, 0A9h,  0Ch,	0FCh,	 1, 0A9h,  18h,	0ABh,  90h, 0F0h,  30h,	0F8h, 0A1h
MUSIC_11_YM3:	db  0F0h,  60h,	0F8h,	 0, 0FEh,  1Ah,	0FDh,	 8, 0FCh,    6,	0FBh,  2Ch, 0F8h,  20h,	0ABh,  24h
					; DATA XREF: ROM:9D16o
		db  0ABh,  18h,	 2Ch, 0ACh,  0Ch, 0ABh,	 24h, 0ABh,  3Ch, 0ACh,	 24h, 0ACh,  18h,  29h,	0A9h,  0Ch
		db  0ABh,  24h,	0ABh,  3Ch, 0F8h, 0C1h,	0A7h,  24h, 0A7h,  18h,	 27h, 0A7h,  0Ch, 0A7h,	 24h, 0A7h
		db   3Ch, 0F8h,	0E0h, 0B3h,  24h, 0B3h,	 18h, 0ACh,  0Ch, 0ACh,	 18h, 0F8h,  40h, 0B5h,	 24h, 0B5h
		db   18h, 0AEh,	 0Ch, 0AEh,  18h, 0B6h,	 24h, 0B6h,  18h, 0AFh,	 0Ch, 0AFh,  18h, 0B1h,	 24h, 0B1h
		db   2Ah, 0F0h,	 12h, 0F8h, 0A0h, 0F8h,	 60h, 0B5h,  10h,  35h,	 31h, 0F0h,  0Ch,  2Eh,	 2Eh,  2Eh
		db  0FAh,  80h,	0FEh,  14h, 0FDh,  0Bh,	 2Eh, 0F0h,  18h, 0ACh,	 0Ch,  70h,  2Ch, 0AEh,	 78h, 0B1h
		db   0Ch, 0F0h,	 18h, 0AFh,  0Ch,  70h,	 2Fh, 0B1h,  78h, 0B2h,	 0Ch, 0F0h,  18h, 0B1h,	 0Ch,  70h
		db   31h, 0B2h,	 78h, 0B0h,  0Ch, 0F0h,	 18h, 0AEh,  0Ch,  70h,	 2Eh, 0B0h,  78h, 0ACh,	 0Ch, 0F0h
		db   18h, 0AAh,	 0Ch,  70h,  2Ah, 0ACh,	 78h, 0AFh,  0Ch, 0F0h,	 18h, 0ADh,  0Ch,  70h,	 2Dh, 0AFh
		db   78h, 0B0h,	 0Ch, 0F0h,  18h, 0AFh,	 0Ch,  70h,  2Fh, 0B0h,	 78h, 0B0h,  0Ch, 0F0h,	 18h, 0AFh
		db   0Ch,  70h,	 2Fh, 0B0h,  24h, 0F0h,	 0Ch,  2Fh,  70h, 0FCh,	   1,  2Fh, 0B0h,    6,	0F0h,  1Eh
		db  0FAh, 0C0h,	0FCh,	 6, 0FEh,  1Ah,	0FDh,	 8, 0B0h,  24h,	0B0h,  18h, 0A9h,  0Ch,	0A9h,  18h
		db  0B2h,  24h,	0B2h,  18h, 0ABh,  0Ch,	0ABh,  18h, 0B3h,  24h,	0B3h,  18h, 0ACh,  0Ch,	0ACh,  18h
		db  0B5h,  24h,	0B5h,  18h, 0AEh,  0Ch,	0AEh,  18h, 0B3h,  24h,	0B3h,  18h, 0ACh,  0Ch,	0ACh,  18h
		db  0B5h,  24h,	0B5h,  18h, 0ACh,  0Ch,	0ACh,  18h, 0AEh,  90h,	0F0h,  30h, 0F8h, 0A1h
MUSIC_11_YM4:	db  0F0h,  60h,	0F8h,	 0, 0FEh,  26h,	0FDh,  0Ch, 0FCh,    6,	0FBh,  2Ch, 0F8h, 0CFh,	 8Fh,  0Ch
					; DATA XREF: ROM:9D18o
		db  0F8h, 0E0h,	0F8h, 0CFh,  8Dh,  0Ch,	0F8h, 0E0h, 0F8h, 0CFh,	 8Ch,  0Ch, 0F8h, 0E0h,	0F8h, 0C7h
		db   8Bh,  0Ch,	0F8h, 0E0h, 0F8h, 0C7h,	 8Ah,  0Ch, 0F8h, 0E0h,	0F8h, 0C2h,  88h,  0Ch,	0F8h, 0E0h
		db  0FCh,    1,	 88h,  18h,  94h,    6,	 70h,  88h,  18h, 0F8h,	0C2h,  8Ah,    6,  70h,	0F8h, 0E0h
		db   8Ah,  18h,	 96h,	 6,  70h,  8Ah,	 18h, 0F8h, 0C2h,  8Bh,	   6,  70h, 0F8h, 0E0h,	 8Bh,  18h
		db   97h,    6,	 70h,  8Bh,  0Ch, 0FCh,	 80h,  8Ah,    6, 0FCh,	   1,  0Bh, 0F8h, 0C2h,	 8Dh,	 6
		db   70h, 0F8h,	0E0h,  8Dh,  18h,  99h,	   6,  70h,  8Dh,  18h,	0F8h, 0C6h,  8Fh,    6,	 70h, 0F8h
		db  0E0h, 0FCh,	 80h,  88h,    6, 0FCh,	   1,  0Ah, 0F8h, 0C3h,	 8Fh,	 6,  70h, 0F8h,	0E0h,  8Fh
		db     6, 0FCh,	 80h,  14h, 0FCh,    1,	 16h, 0FCh,  80h,  0Dh,	0FCh,	 1,  0Fh, 0FCh,	 80h,	 8
		db  0FCh,    1,	 0Ah,  0Fh, 0F8h, 0C6h,	 8Dh,	 6,  70h, 0F8h,	0E0h, 0FCh,  80h,  94h,	   6, 0FCh
		db     1,  16h,	0F8h, 0C3h,  8Dh,    6,	 70h, 0F8h, 0E0h,  8Dh,	   6, 0FCh,  80h,  14h,	0FCh,	 1
		db   16h, 0FCh,	 80h,  0Dh, 0FCh,    1,	 0Fh,  1Bh,  0Dh,  19h,	0F8h, 0C6h,  8Ch,    6,	 70h, 0F8h
		db  0E0h, 0FCh,	 80h,  87h,    6, 0FCh,	   1,	 8, 0F8h, 0C3h,	 8Ch,	 6,  70h, 0F8h,	0E0h,  8Ch
		db     6,  14h,	0FCh,  80h,  0Eh, 0FCh,	   1,  0Fh, 0FCh,  80h,	 0Bh, 0FCh,    1,  0Ch,	0FCh,  80h
		db     7, 0FCh,	   1,	 8, 0F8h, 0C6h,	 8Bh,	 6,  70h, 0F8h,	0E0h, 0FCh,  80h,  8Dh,	   6, 0FCh
		db     1,  0Bh,	0F8h, 0C3h,  8Ah,    6,	 70h, 0F8h, 0E0h,  8Fh,	   6, 0FCh,  80h,  14h,	0FCh,	 1
		db   16h, 0FCh,	 80h,	 8, 0FCh,    1,	 0Ah, 0FCh,  80h,    1,	0FCh,	 1,    3,  0Ah,	0F8h, 0C2h
		db   88h,    6,	 70h, 0F8h, 0E0h,  88h,	 12h,  94h,    6, 0FCh,	 80h,  0Bh, 0FCh,    1,	 0Dh, 0FCh
		db   80h,  86h,	 0Ch, 0FCh,    1,  88h,	   6,  70h,  8Ah,    8,	 70h,  0Ah,  70h,  8Ah,	 16h,  96h
		db     6, 0FCh,	 80h,  0Dh, 0FCh,    1,	 0Fh,	 8,  14h,  0Ah,	 70h, 0FCh,    6,  8Fh,	 66h, 0F0h
		db     6,  83h,	 0Ch,	 8,  0Ah,  0Fh,	 11h,	 8,  0Ah,  86h,	 66h, 0F0h,    6,  86h,	 0Ch,  0Bh
		db   0Dh,  12h,	 14h,  0Bh,  0Dh,  84h,	 66h, 0F0h,    6,  84h,	 0Ch,	 9,  0Bh,  0Eh,	 10h,	 9
		db   0Bh,  86h,	 24h,  88h,  42h, 0F0h,	   6,  88h,  0Ch,  0Dh,	 0Fh,  14h,  12h,  0Fh,	   8,  8Dh
		db   66h, 0F0h,	   6,  8Dh,  0Ch,  12h,	 14h,  19h,  1Bh,  12h,	 14h,  90h,  66h, 0F0h,	   6,  84h
		db   0Ch,    9,	 0Bh,  10h,  12h,    9,	 0Bh,  8Ch,  24h,  8Eh,	 42h, 0F0h,    6,  82h,	 0Ch,	 7
		db     9,  0Ch,	 0Eh,	 7,    9,  85h,	 24h,	 7,    5,  93h,	 0Ch,  11h,  0Eh,  0Ch,	 0Eh, 0FCh
		db     1,  87h,	 18h, 0F8h, 0C2h,  85h,	   6,  70h, 0F8h, 0E0h,	 85h,  12h,  91h,    6,	0FCh,  80h
		db     8, 0FCh,	   1,  0Ah, 0FCh,  80h,	 83h,  0Ch, 0FCh,    1,	 85h,	 6,  70h, 0F8h,	0C2h,  87h
		db     6,  70h,	0F8h, 0E0h,  87h,  12h,	0FCh,  80h,  91h,    6,	0FCh,	 1,  13h,  70h,	 87h,  18h
		db  0F8h, 0C2h,	 88h,	 6,  70h, 0F8h,	0E0h,  88h,  12h,  94h,	   6, 0FCh,  80h,  0Bh,	0FCh,	 1
		db   0Dh, 0FCh,	 80h,  86h,  0Ch, 0FCh,	   1,  88h,    6,  70h,	0F8h, 0C2h,  8Ah,    6,	 70h, 0F8h
		db  0E0h,  8Ah,	 12h,  96h,    6, 0FCh,	 80h,  0Dh, 0FCh,    1,	 0Fh,	 8,  14h,  0Ah,	 16h, 0F8h
		db  0C2h,  8Bh,	   6,  70h, 0F8h, 0E0h,	 8Bh,  12h,  97h,    6,	0FCh,  80h,    8, 0FCh,	   1,  0Ah
		db   0Bh,  17h,	 8Bh,  0Ch,  8Dh,    6,	 70h,  0Dh,  19h,  0Dh,	 70h,  8Dh,  18h, 0FCh,	 80h,  88h
		db     6, 0FCh,	   1,  0Ah,  0Dh,  19h,	 8Dh,  0Ch,  8Fh,  9Ch,	0FEh,  23h, 0FDh,  0Ch,	0FCh,  80h
		db   96h,    0,	0FCh, 0A5h, 0FCh,    1,	 9Bh,	 6,  70h, 0FCh,	0FFh, 0FCh,  80h,  8Ah,	   0, 0FCh
		db   8Bh, 0FCh,	   1,  83h,  18h, 0FCh,	0FFh, 0F8h, 0A1h
MUSIC_11_YM5:	db  0F9h,  20h,	0FCh,	 1, 0FEh,  15h,	0FDh,	 6, 0FAh,  40h,	0B9h,	 6,  39h, 0FDh,	   7, 0FAh
					; DATA XREF: ROM:9D1Ao
		db   80h,  39h,	 39h, 0FDh,    8, 0FAh,	 40h,  39h,  39h, 0FDh,	   9, 0FAh,  80h,  39h,	 39h, 0FDh
		db     8, 0FAh,	0C0h,  39h,  39h, 0FDh,	   9,  39h,  39h, 0FDh,	 0Ah,  39h, 0F8h,    0,	0FAh,  40h
		db  0FEh,    8,	0FDh,	 9, 0FCh,    1,	0FBh,  2Eh, 0A2h,  18h,	0F8h,  20h, 0A7h,  24h,	0A9h,	 5
		db  0F0h,    7,	0A9h,  30h, 0F0h,  0Ch,	 22h,  27h,  29h,  2Bh,	 2Ch,  29h,  2Bh, 0A7h,	 24h, 0B0h
		db     6,  70h,	0AEh,  60h, 0F0h,  18h,	 27h, 0ACh,  24h, 0AEh,	   6,  70h, 0AEh,  30h,	0F0h,  0Ch
		db   27h,  2Ch,	 2Eh,  30h,  31h,  2Eh,	 30h, 0ACh,  24h, 0B5h,	   6,  70h, 0B3h,  6Ch,	0F0h,  0Ch
		db   33h,  35h,	0F8h,  40h, 0B6h,  18h,	 35h,  33h,  31h,  38h,	 36h,  35h,  33h, 0BAh,	 30h, 0B3h
		db   24h, 0B8h,	   6,  70h, 0B6h,  24h,	0FCh,  80h, 0B5h,  11h,	0FCh,  8Ah, 0FCh,    1,	0A8h,  0Ah
		db  0F0h,    9,	0FCh, 0FFh, 0FAh,  80h,	0A2h,  18h, 0F8h, 0A0h,	0F8h,  60h, 0B6h,  18h,	 35h,  33h
		db  0B1h,    6,	 33h,  36h,  70h, 0B8h,	   8,  70h,  36h,  70h,	 35h,  70h, 0B3h,  18h,	 31h, 0FAh
		db   40h, 0FEh,	 14h, 0FDh,    9, 0FCh,	   6, 0B2h,  0Ch,  29h,	 29h,  30h,  29h,  30h,	0B2h,  78h
		db  0B5h,  0Ch,	 2Ch,  2Ch,  33h,  2Ch,	 33h, 0B5h,  78h, 0B6h,	 0Ch,  2Ch,  2Ch,  34h,	 2Ch,  34h
		db  0B6h,  78h,	0B3h,  0Ch,  2Ah,  2Ah,	 31h,  2Ah,  31h, 0B3h,	 78h, 0B0h,  0Ch,  27h,	 27h,  2Eh
		db   27h,  2Eh,	0B0h,  78h, 0B3h,  0Ch,	 2Ah,  2Ah,  31h,  2Ah,	 31h, 0B3h,  78h, 0B4h,	 0Ch,  2Ah
		db   2Ah,  32h,	 2Ah,  32h, 0B4h,  78h,	0B4h,  0Ch,  29h,  29h,	 32h,  29h,  32h, 0B4h,	 24h, 0A9h
		db   0Ch,  32h,	 29h, 0FCh,    1,  32h,	0B4h,	 6,  70h, 0FAh,	 80h, 0FEh,  19h, 0FDh,	 0Ah, 0B0h
		db   0Ch,  32h,	0B3h,  18h,  32h,  30h,	 2Eh,  35h,  33h,  32h,	0B3h,  0Ch,  35h, 0B6h,	 18h,  35h
		db   33h,  31h,	 38h,  36h,  35h,  33h,	0F8h, 0C1h, 0BAh,  30h,	0B3h,  24h, 0BAh,    6,	 70h, 0F8h
		db  0E0h, 0BAh,	0A8h, 0F8h, 0A1h
MUSIC_11_YM6:	db  0F0h,  30h,	0FAh,  80h,  82h,    6,	   2, 0FAh, 0C0h,    3,	   3, 0FAh,  40h,    4,	   4, 0FAh
					; DATA XREF: ROM:9D1Co
		db  0C0h,  81h,	 0Ch, 0F8h,    0, 0F8h,	0C6h,  80h,  18h,    1,	 80h,  0Ch,    0,  81h,	 18h, 0F8h
		db  0E0h,  80h,	 18h,	 1,  80h,  0Ch,	0FAh,  80h,    2, 0FAh,	0C0h,	 3, 0FAh,  40h,	   4, 0FAh
		db  0C0h, 0F8h,	0C1h,  80h,  0Ch,    0,	   1,  85h,  18h,  80h,	 0Ch,  81h,  18h, 0F8h,	0E0h,  80h
		db   18h,  81h,	 0Ch,	 0, 0FAh,  80h,	   2, 0FAh, 0C0h,  83h,	   6,  83h,  0Ch,  83h,	   6, 0FAh
		db   40h,  84h,	 0Ch, 0FAh, 0C0h,    1,	   0,	 0,  85h,  18h,	0F8h, 0C2h,  81h,  0Ch,	0F8h, 0E0h
		db  0F8h, 0C6h,	 80h,  18h,    1,  80h,	 0Ch,	 0,  81h,  18h,	0F8h, 0E0h,  80h,  18h,	   1,  80h
		db   0Ch, 0FAh,	 80h,	 2, 0FAh, 0C0h,	   3, 0FAh,  40h,    4,	0FAh, 0C0h,    0,    0,	   1,  85h
		db   18h,  80h,	 0Ch,  81h,  18h, 0F8h,	0C2h,  80h,  10h, 0F8h,	0E0h,  81h,    6,    1,	 80h,  0Ch
		db   81h,    6,	   1,  80h,  0Ch, 0F8h,	0C2h,  80h,  18h,  81h,	 0Ch,  80h,  18h,  80h,	 0Ch,  81h
		db   18h, 0F0h,	 0Ch,	 0,  81h,  18h,	0FAh,  80h,  82h,  0Ch,	   2, 0FAh, 0C0h,    3,	0FAh,  40h
		db     4, 0FAh,	0C0h, 0F8h, 0E0h,  80h,	 18h,  81h,  0Ch,  80h,	 18h,  80h,  0Ch,  81h,	 18h, 0F0h
		db   0Ch,    0,	 81h,  18h, 0FAh,  80h,	 82h,	 6,    2, 0FAh,	0C0h,	 3,    3, 0FAh,	 40h,	 4
		db     4, 0FAh,	0C0h,  81h,  0Ch, 0F8h,	0C2h,  80h,  18h,  81h,	 0Ch,  80h,  18h,  80h,	 0Ch,  81h
		db   18h, 0F0h,	 0Ch,	 0,  81h,  18h,	0FAh,  80h,  82h,  0Ch,	   2, 0FAh, 0C0h,    3,	0FAh,  40h
		db     4, 0FAh,	0C0h, 0F8h, 0E0h,  80h,	 18h,  81h,  0Ch,  80h,	 18h,  80h,  0Ch,  81h,	 18h, 0F0h
		db   0Ch, 0F8h,	0C1h,  80h,  0Ch,    1,	0F8h, 0E0h,  80h,  0Ch,	0F8h, 0C3h,  81h,    6,	0F8h, 0E0h
		db   80h,  0Ch,	   0,	 1,  85h,  18h,	 80h,  0Ch,  81h,  18h,	 80h,  0Ch,    0,    1,	 85h,  18h
		db   80h,  0Ch,	0FAh,  80h,    2, 0FAh,	0C0h,	 3,    0,    0,	   1,  85h,  18h,  80h,	 0Ch,  81h
		db   18h,  80h,	 0Ch,	 0,    1,  85h,	 18h,  80h,  0Ch,    1,	   1,  80h,  18h,    1,	 80h,  0Ch
		db   81h,  18h,	 81h,  0Ch,  80h,  18h,	 81h,  0Ch,    0, 0FAh,	 80h, 0F8h, 0C3h,  82h,	   6, 0F8h
		db  0E0h, 0FAh,	0C0h,  83h,    6,    3,	0FAh,  40h,  84h,  0Ch,	0FAh, 0C0h,  85h,  18h,	0F8h, 0C4h
		db   80h,  18h,	0F8h, 0E0h, 0F8h, 0C5h,	 81h,	 6, 0F8h, 0E0h,	 81h,  0Ch, 0F8h, 0A1h
MUSIC_11_PSG1:	db  0FCh,    0,	0FBh,  4Ch, 0FDh,  1Ah,	0F8h, 0C1h, 0C6h,    6,	 3Ah,  3Ah,  3Fh,  3Ah,	 3Ah, 0F8h
					; DATA XREF: ROM:9D1Eo
		db  0E0h, 0C6h,	   6,  3Ah,  3Fh,  3Ah,	0F8h,	 0, 0F8h,  20h,	0FDh,  1Ah, 0F8h, 0C3h,	0C6h,	 6
		db   3Ah,  3Ah,	 3Fh,  3Ah,  3Ah,  46h,	 3Ah,  3Ah,  3Fh,  3Ah,	 3Ah,  46h,  3Ah,  3Fh,	 3Ah, 0F8h
		db  0E0h, 0F8h,	0C2h, 0C6h,    6,  38h,	 38h,  3Fh,  38h,  38h,	 46h,  38h,  38h,  3Fh,	 38h,  38h
		db   46h,  38h,	 3Fh,  38h, 0F8h, 0E0h,	0C6h,	 6,  3Ah,  3Ah,	 3Fh,  3Ah,  3Ah,  46h,	 3Ah,  3Ah
		db   3Fh,  3Ah,	 3Ah,  46h,  3Ah,  3Fh,	 3Ah,  46h,  38h,  38h,	 3Fh,  38h,  38h,  46h,	 38h,  3Fh
		db  0FDh,  1Bh,	 3Bh,  3Fh,  42h,  44h,	 46h,  47h,  4Bh, 0FDh,	 1Ah,  46h,  3Ah,  3Ah,	 41h,  3Ah
		db   3Ah,  46h,	 3Ah,  41h, 0FDh,  1Bh,	 38h,  3Ah,  3Dh,  41h,	 44h,  46h,  49h, 0F8h,	 40h, 0FDh
		db   1Ah, 0C6h,	   6,  3Ah,  3Ah,  42h,	 3Ah,  3Ah,  46h,  3Ah,	 42h, 0FDh,  1Bh,  3Ah,	 3Bh,  3Fh
		db   44h,  46h,	 47h,  4Bh, 0FDh,  1Ah,	 49h,  3Dh,  3Dh,  44h,	 38h,  38h,  3Dh,  31h,	 3Dh, 0FDh
		db   1Bh,  49h,	 47h,  46h,  44h,  42h,	 41h,  3Dh, 0F8h, 0A0h,	0F8h,  60h, 0FDh,  4Bh,	0F8h, 0C7h
		db  0A7h,    6,	 2Eh,  33h,  2Eh, 0F8h,	0E0h, 0F8h, 0C7h, 0AAh,	   6,  31h,  36h,  31h,	0F8h, 0E0h
		db  0F8h, 0C7h,	0A8h,	 6,  2Fh,  34h,	 2Fh, 0F8h, 0E0h, 0F8h,	0C7h, 0A7h,    6,  2Ch,	 33h,  2Ch
		db  0F8h, 0E0h,	0F8h, 0C7h, 0A5h,    6,	 2Ch,  31h,  2Ch, 0F8h,	0E0h, 0F8h, 0C7h, 0A8h,	   6,  2Fh
		db   34h,  2Fh,	0F8h, 0E0h, 0F8h, 0C7h,	0A6h,	 6,  2Dh,  32h,	 2Dh, 0F8h, 0E0h, 0F8h,	0C7h, 0A6h
		db     6,  2Bh,	 32h,  2Bh, 0F8h, 0E0h,	0FDh,  1Ah, 0C3h,    6,	 35h,  35h,  3Ch,  35h,	 35h,  43h
		db   35h,  3Ch,	0FDh,  1Bh,  38h,  3Ch,	 3Fh,  41h,  43h,  44h,	 48h, 0FDh,  1Ah,  43h,	 37h,  37h
		db   3Eh,  37h,	 37h,  43h,  37h,  3Eh,	0FDh,  1Bh,  35h,  37h,	 3Ah,  3Eh,  41h,  43h,	 46h, 0FDh
		db   1Ah,  46h,	 38h,  38h,  3Fh,  38h,	 38h,  46h,  38h,  3Fh,	0FDh,  1Bh,  3Bh,  3Fh,	 42h,  44h
		db   46h,  47h,	 4Bh, 0FDh,  1Ah,  46h,	 3Ah,  3Ah,  41h,  3Ah,	 3Ah,  46h,  3Ah,  41h,	0FDh,  1Bh
		db   38h,  3Ah,	 3Dh,  41h,  44h,  46h,	 49h, 0FDh,  1Ah, 0F8h,	0C1h, 0C6h,    6,  38h,	 38h,  3Fh
		db   38h,  38h,	0F8h, 0E0h, 0C6h,    6,	 38h,  3Fh,  38h, 0F8h,	0C2h, 0C6h,    6,  3Ah,	 3Ah,  3Fh
		db   3Ah,  3Ah,	 46h,  3Ah,  3Ah,  3Fh,	 3Ah,  3Ah,  46h,  3Ah,	 3Fh,  3Ah, 0F8h, 0E0h,	0F8h, 0A1h
MUSIC_11_PSG2:	db  0FCh,    0,	0FBh,  4Ch, 0FDh,  1Ah,	0F8h, 0C1h, 0C4h,  12h,	 3Dh, 0F8h, 0E0h, 0C4h,	 0Ch,  3Dh
					; DATA XREF: ROM:9D20o
		db  0F8h,    0,	0F8h,  20h, 0FDh,  1Ah,	0F8h, 0C7h, 0C4h,  12h,	 3Dh,  44h,  3Dh, 0C4h,	 0Ch,  3Dh
		db  0F8h, 0E0h,	0C4h,  12h,  3Dh, 0C4h,	 0Ch, 0BDh,    6, 0FDh,	 1Bh,  38h,  3Bh,  38h,	 3Bh,  42h
		db   3Fh,  42h,	0FDh,  1Ah, 0C4h,  12h,	 3Fh, 0C4h,  0Ch, 0BFh,	   6, 0FDh,  1Bh,  35h,	 31h,  35h
		db   38h,  3Ah,	 3Dh,  41h, 0F8h,  40h,	0FDh,  1Ah, 0C4h,  12h,	 3Fh, 0C4h,  0Ch, 0BFh,	   6, 0FDh
		db   1Bh,  36h,	 38h,  36h,  3Bh,  3Dh,	 3Fh,  42h, 0FDh,  1Ah,	0C7h,  12h,  42h,  3Bh,	0FDh,  1Bh
		db  0C1h,    6,	 3Fh,  3Dh,  3Bh,  3Ah,	 38h,  35h, 0F8h, 0A0h,	0F8h,  60h, 0FDh,    0,	0F8h, 0C7h
		db  0F0h, 0C0h,	0F8h, 0E0h, 0FDh,  1Ah,	0C1h,  12h,  3Ah, 0C1h,	 0Ch, 0BAh,    6, 0FDh,	 1Bh,  35h
		db   38h,  35h,	 38h,  3Fh,  3Ch,  3Fh,	0FDh,  1Ah, 0C1h,  12h,	 3Ch, 0C1h,  0Ch, 0BCh,	   6, 0FDh
		db   1Bh,  32h,	 2Eh,  32h,  35h,  37h,	 3Ah,  3Eh, 0FDh,  1Ah,	0C4h,  12h,  3Dh, 0C4h,	 0Ch, 0BDh
		db     6, 0FDh,	 1Bh,  38h,  3Bh,  38h,	 3Bh,  42h,  3Fh,  42h,	0FDh,  1Ah, 0C4h,  12h,	 3Fh, 0C4h
		db   0Ch, 0BFh,	   6, 0FDh,  1Bh,  35h,	 31h,  35h,  38h,  3Ah,	 3Dh,  41h, 0FDh,  1Ah,	0F8h, 0C3h
		db  0C4h,  12h,	 3Dh,  44h,  3Dh, 0C4h,	 0Ch,  3Dh, 0F8h, 0E0h,	0F8h, 0A1h
MUSIC_11_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:9D22o	ROM:9D24o
MUSIC_12:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 183
		dw MUSIC_12_YM1
		dw MUSIC_12_YM2
		dw MUSIC_12_YM3
		dw MUSIC_12_YM4
		dw MUSIC_12_YM5
		dw MUSIC_12_YM6
		dw MUSIC_12_PSG1
		dw MUSIC_12_PSG2
		dw MUSIC_12_PSG3
		dw MUSIC_12_PSG3
MUSIC_12_YM1:	db  0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	0F0h, 0B4h, 0F8h,  20h,	0FEh,  14h, 0FDh,  0Ah,	0ADh,	 6
					; DATA XREF: ROM:A796o
		db   70h,  32h,	 34h, 0B5h,  18h, 0ADh,	   6,  70h,  34h,  35h,	0B7h,  18h, 0ADh,    6,	 70h,  35h
		db   37h, 0B9h,	 3Ch, 0F0h,  0Ch, 0B9h,	   6,  70h,  3Ah,  39h,	 37h,  70h, 0B7h,  24h,	0B4h,  0Ch
		db   39h,  37h,	0B7h,	 6,  35h,  34h,	 35h, 0B4h,  30h, 0B2h,	 0Ch,  70h, 0B7h,    6,	 39h, 0BAh
		db   18h, 0B2h,	   6,  70h,  39h,  3Ah,	0BCh,  18h, 0B2h,    6,	 70h,  3Ah,  3Ch, 0BEh,	 24h, 0F0h
		db   0Ch,  32h,	 34h,  35h, 0F8h,  40h,	0B7h,  18h, 0F0h,  0Ch,	0B7h,	 6,  39h, 0BAh,	 18h, 0F0h
		db   0Ch,  3Ah,	0B9h,  48h, 0F0h,  0Ch,	0F8h, 0A0h, 0F8h,  60h,	0B7h,  1Eh, 0F0h,    6,	 37h,  35h
		db  0B4h,  0Ch,	 32h,  31h,  34h, 0FCh,	   0, 0B4h,  30h, 0B2h,	 24h, 0FCh,    1, 0FEh,	 1Bh, 0FDh
		db   0Bh, 0FAh,	 40h, 0A1h,  0Ch, 0A2h,	   6,  70h,  22h,  22h,	0A9h,  24h, 0A6h,    6,	 28h,  29h
		db   70h,  2Dh,	 70h, 0ABh,  0Ch,  28h,	0A4h,  30h, 0F0h,  0Ch,	0FAh,  80h, 0FEh,  0Dh,	0FDh,  0Dh
		db   24h, 0A5h,	   6,  70h,  25h,  25h,	0ACh,  24h, 0A9h,    6,	 2Bh,  2Ch,  70h,  30h,	 70h, 0AEh
		db   0Ch,  2Bh,	0A7h,  48h, 0FAh, 0C0h,	0FEh,  38h, 0FDh,  0Ch,	0FCh,	 6, 0B9h,  24h,	0B7h,  0Ch
		db   39h,  37h,	0B9h,  24h, 0B7h,  0Ch,	 39h,  3Ah, 0BAh,  24h,	0B8h,  0Ch,  3Ah,  38h,	0BAh,  24h
		db  0B8h,  0Ch,	 3Ah,  3Ch, 0FCh,    1,	0BCh,  90h, 0F0h,  18h,	0FEh,  1Ah, 0FDh,  0Ch,	 20h,  25h
		db   27h, 0F0h,	 0Ch,  20h,  25h,  27h,	 29h,  2Ah,  27h,  29h,	 25h,  27h,  23h,  25h,	0A6h,  90h
		db  0F0h,  18h,	 26h,  2Bh,  2Dh, 0F0h,	 0Ch,  26h,  2Bh,  2Dh,	 2Fh,  30h,  2Dh,  2Fh,	 2Bh,  2Dh
		db   29h,  2Bh,	0ACh, 0C0h,  70h, 0F8h,	0A1h
MUSIC_12_YM2:	db  0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	0F0h, 0C0h, 0F8h,  20h,	0FEh,  26h, 0FDh,  0Ah,	0A6h,  30h
					; DATA XREF: ROM:A798o
		db   25h,  24h,	 23h, 0A2h,  18h, 0ABh,	   6,  2Dh,  2Eh,  32h,	0B1h,  18h, 0AFh,  0Ch,	 31h,  32h
		db   70h, 0A6h,	   6,  28h,  29h,  2Bh,	0ADh,  28h, 0F0h,    8,	0ABh,  30h,  2Ah,  29h,	0A8h,	 6
		db   70h, 0A9h,	 0Ch,  2Bh,  2Dh, 0F8h,	 40h, 0AEh,  18h, 0F0h,	 0Ch, 0AEh,    6,  30h,	0B2h,  18h
		db  0F0h,  0Ch,	 32h, 0B2h,  30h, 0B1h,	 18h,  70h, 0F8h, 0A0h,	0F8h,  60h, 0AEh,  1Eh,	0F0h,	 6
		db   2Eh,  2Dh,	0ABh,  0Ch,  29h,  28h,	 2Bh, 0ABh,  30h,  29h,	0FEh,  2Fh, 0FDh,  0Ah,	0BDh,  60h
		db  0BFh,  18h,	0FEh,  1Fh, 0FDh,    9,	0BCh,	 6,  3Eh,  40h,	 45h,  43h,  37h,  41h,	 37h,  40h
		db   37h,  3Eh,	 3Ch, 0FEh,  2Fh, 0FDh,	 0Ah, 0BFh,  60h, 0C1h,	 18h, 0FEh,  1Fh, 0FDh,	 0Ah, 0BFh
		db     6,  41h,	 43h,  48h,  46h,  3Ah,	 44h,  3Ah,  43h,  3Ah,	 41h,  3Fh,  70h, 0FEh,	   9, 0FDh
		db   0Bh,  29h,	 2Eh,  30h, 0B0h,  1Eh,	0A9h,	 6,  2Eh,  30h,	 33h,  35h,  32h,  33h,	 30h,  32h
		db   2Eh,  30h,	 29h,  2Eh,  30h,  35h,	 70h,  27h,  2Ch,  2Eh,	0AEh,  18h, 0F0h,    6,	 27h,  2Ch
		db   2Eh,  31h,	 33h,  30h,  31h,  2Eh,	 30h,  2Ch,  2Eh,  2Bh,	 2Eh,  33h,  37h, 0F0h,	 18h, 0FEh
		db   1Ah, 0FDh,	 0Bh, 0A0h,    6,  70h,	 20h,  20h, 0ACh,  24h,	0AAh,	 6,  70h,  29h,	 70h,  25h
		db   70h, 0A7h,	 30h, 0F0h, 0D8h, 0FAh,	 40h, 0FEh,    7, 0FDh,	 0Ch, 0A9h,    4, 0F0h,	   8, 0A9h
		db     6,  29h,	0AEh,	 4, 0F0h,    8,	0B3h,  0Ch, 0B2h,    4,	0F0h,	 8, 0AEh,    6,	 2Eh, 0B0h
		db     4, 0F0h,	   8, 0B8h,  0Ch, 0B7h,	   4, 0F0h,  0Eh, 0B3h,	   6, 0B5h,  30h, 0F0h,	0D8h, 0FAh
		db   80h, 0FEh,	 10h, 0FDh,  0Dh, 0AFh,	   4, 0F0h,    8, 0AFh,	   6,  2Fh, 0B4h,    4,	0F0h,	 8
		db  0B9h,  0Ch,	0B8h,	 4, 0F0h,    8,	0B4h,	 6,  34h, 0B6h,	   4, 0F0h,    8, 0BEh,	 0Ch, 0BDh
		db     4, 0F0h,	 0Eh, 0B9h,    6, 0BBh,	 30h, 0F0h,  18h, 0FAh,	 40h, 0FEh,    7, 0FDh,	 0Ch, 0B1h
		db     6,  32h,	 34h,  39h, 0B7h,  24h,	0F0h,  0Ch, 0ADh,    6,	 2Fh,  31h,  37h, 0B5h,	 30h,  34h
		db  0FAh, 0C0h,	0F8h, 0A1h
MUSIC_12_YM3:	db  0FEh,  26h,	0FDh,  0Ch, 0FCh,    1,	0FBh,  2Ch, 0FAh, 0C0h,	0F8h, 0C2h,  8Eh,    6,	0F0h,  12h
					; DATA XREF: ROM:A79Ao
		db  0F8h, 0E0h,	 8Eh,	 6,  70h,  89h,	 0Ch, 0F8h, 0C3h,  8Eh,	   6, 0F0h,  12h, 0F8h,	0E0h, 0F8h
		db     0, 0F8h,	 20h, 0F8h, 0C7h,  8Eh,	   6, 0F0h,  12h, 0F8h,	0E0h, 0F8h, 0C1h,  87h,	   6, 0F0h
		db   12h, 0F8h,	0E0h, 0F8h, 0C1h,  89h,	   6, 0F0h,  12h, 0F8h,	0E0h, 0F8h, 0C2h,  8Eh,	   6, 0F0h
		db   12h, 0F8h,	0E0h,  82h,    6,    4,	   5,	 9, 0F8h, 0C6h,	 87h,	 6, 0F0h,  12h,	0F8h, 0E0h
		db   93h,  18h,	 70h,  10h, 0F8h,  40h,	 8Fh,	 6,  70h,  0Fh,	 11h,  93h,  18h,  95h,	 30h,  89h
		db   18h,  70h,	0F8h, 0A0h, 0F8h,  60h,	 95h,  30h,  96h,  60h,	 13h,  15h,  16h,  18h,	0F0h,  0Ch
		db  0FCh,    6,	 0Ch,  91h,  1Eh, 0F0h,	   6,  8Ch,  0Ch,  11h,	 0Ah, 0FCh,    1,  8Ch,	 18h,  11h
		db  0F0h,  0Ch,	0FCh,	 6,  0Ah,  8Fh,	 1Eh, 0F0h,    6,  8Ah,	 0Ch,  0Fh,    8, 0FCh,	   1,  8Ah
		db   18h,  0Fh,	   8, 0F0h,  0Ch, 0FCh,	   6,	 3,    8,    1,	   3,	 6,    8,  94h,	 18h,  12h
		db   11h, 0FCh,	   1,  8Fh,  0Ch, 0F8h,	0C1h,  8Dh,  18h, 0F0h,	 0Ch, 0FCh,    6,    8,	 0Dh,	 6
		db  0FCh,    1,	 88h,  18h, 0F8h, 0E0h,	 8Ah,  18h, 0F0h,  0Ch,	0FCh,	 6,    5,  0Ah,	   3,	 5
		db     8,  0Ah,	0FCh,	 1,  16h,  94h,	   6,  70h,  91h,  0Ch,	 8Eh,	 6,  70h,  8Ah,	 0Ch, 0FCh
		db     6,    8,	   5, 0F8h, 0C1h, 0FCh,	   6,  87h,  1Eh, 0F0h,	   6,  82h,  0Ch,    7,	 0Ch, 0FCh
		db     1,  8Eh,	 18h, 0F8h, 0E0h,  90h,	 18h, 0F0h,  0Ch, 0FCh,	   6,  0Bh,  10h,    9,	 0Bh,  0Eh
		db   10h,  97h,	 18h,  15h,  94h,  0Ch,	0FCh,	 1,  90h,  18h,	 95h,	 6,  70h, 0F8h,	0C4h,  94h
		db     6,  15h,	 95h,	 4, 0F0h,    8,	0F8h, 0E0h, 0FDh,  0Bh,	 94h,	 6,  15h,  95h,	   4, 0F0h
		db     8, 0FDh,	 0Ah,  94h,    6,  15h,	 95h,	 4, 0F0h,    8,	0FDh,  0Ch,  89h,  0Ch,	0F8h, 0C2h
		db   8Eh,    6,	0F0h,  12h, 0F8h, 0E0h,	 8Eh,	 6,  70h,  89h,	 0Ch,  8Eh,    6,  70h,	   9,  70h
		db  0F8h, 0C2h,	 8Eh,	 6, 0F0h,  12h,	0F8h, 0E0h, 0F8h, 0A1h
MUSIC_12_YM4:	db  0F9h,  20h,	0FCh,	 1, 0FBh,  2Ch,	0F0h,	 6, 0F8h,    0,	0F0h, 0B4h, 0FAh,  40h,	0F8h,  20h
					; DATA XREF: ROM:A79Co
		db  0FEh,  14h,	0FDh,	 8, 0ADh,    6,	 70h,  32h,  34h, 0B5h,	 18h, 0ADh,    6,  70h,	 34h,  35h
		db  0B7h,  18h,	0ADh,	 6,  70h,  35h,	 37h, 0B9h,  3Ch, 0F0h,	 0Ch, 0B9h,    6,  70h,	 3Ah,  39h
		db   37h,  70h,	0B7h,  24h, 0B4h,  0Ch,	 39h,  37h, 0B7h,    6,	 35h,  34h,  35h, 0B4h,	 30h, 0B2h
		db   0Ch,  70h,	0B7h,	 6,  39h, 0BAh,	 18h, 0B2h,    6,  70h,	 39h,  3Ah, 0BCh,  18h,	0B2h,	 6
		db   70h,  3Ah,	 3Ch, 0BEh,  24h, 0F0h,	 0Ch,  32h,  34h,  35h,	0F8h,  40h, 0B7h,  18h,	0F0h,  0Ch
		db  0B7h,    6,	 39h, 0BAh,  18h, 0F0h,	 0Ch,  3Ah, 0B9h,  48h,	0F0h,  0Ch, 0FAh,  80h,	0F8h, 0A0h
		db  0F8h,  60h,	0B7h,  1Eh, 0F0h,    6,	 37h,  35h, 0B4h,  0Ch,	 32h,  31h,  34h, 0FCh,	   0, 0B4h
		db   30h, 0B2h,	 24h, 0FCh,    1, 0FEh,	 1Bh, 0FDh,    9, 0A1h,	 0Ch, 0A2h,    6,  70h,	 22h,  22h
		db  0A9h,  24h,	0A6h,	 6,  28h,  29h,	 70h,  2Dh,  70h, 0ABh,	 0Ch,  28h, 0A4h,  30h,	0F0h,  0Ch
		db  0FAh,  40h,	0FEh,  0Dh, 0FDh,  0Ah,	 24h, 0A5h,    6,  70h,	 25h,  25h, 0ACh,  24h,	0A9h,	 6
		db   2Bh,  2Ch,	 70h,  30h,  70h, 0AEh,	 0Ch,  2Bh, 0A7h,  48h,	0FAh,  80h, 0FEh,  38h,	0FDh,  0Ah
		db  0FCh,    6,	0B9h,  24h, 0B7h,  0Ch,	 39h,  37h, 0B9h,  24h,	0B7h,  0Ch,  39h,  3Ah,	0BAh,  24h
		db  0B8h,  0Ch,	 3Ah,  38h, 0BAh,  24h,	0B8h,  0Ch,  3Ah,  3Ch,	0FCh,	 1, 0BCh,  90h,	0F0h,  18h
		db  0FAh, 0C0h,	0FEh,  1Ah, 0FDh,  0Ah,	 20h,  25h,  27h, 0F0h,	 0Ch,  20h,  25h,  27h,	 29h,  2Ah
		db   27h,  29h,	 25h,  27h,  23h,  25h,	0A6h,  90h, 0F0h,  18h,	 26h,  2Bh,  2Dh, 0F0h,	 0Ch,  26h
		db   2Bh,  2Dh,	 2Fh,  30h,  2Dh,  2Fh,	 2Bh,  2Dh,  29h,  2Bh,	0ACh, 0C0h,  70h, 0F8h,	0A1h
MUSIC_12_YM5:	db  0F0h,  54h,	0FEh,  30h, 0FDh,  0Dh,	 95h,  0Ch,  1Ah, 0F0h,	 54h, 0F8h,    0, 0F0h,	   6, 0FAh
					; DATA XREF: ROM:A79Eo
		db   80h, 0F9h,	 20h, 0FEh,  26h, 0FDh,	   8, 0F8h,  20h, 0A6h,	 30h,  25h,  24h,  23h,	0A2h,  18h
		db  0ABh,    6,	 2Dh,  2Eh,  32h, 0B1h,	 18h, 0AFh,  0Ch,  31h,	 32h,  70h, 0A6h,    6,	 28h,  29h
		db   2Bh, 0ADh,	 28h, 0F0h,    8, 0ABh,	 30h,  2Ah,  29h, 0A8h,	   6,  70h, 0A9h,  0Ch,	 2Bh,  2Dh
		db  0F8h,  40h,	0AEh,  18h, 0F0h,  0Ch,	0AEh,	 6,  30h, 0B2h,	 18h, 0F0h,  0Ch,  32h,	0B2h,  30h
		db  0B1h,  18h,	 70h, 0FAh,  40h, 0F8h,	0A0h, 0F8h,  60h, 0AEh,	 1Eh, 0F0h,    6,  2Eh,	 2Dh, 0ABh
		db   0Ch,  29h,	 28h,  2Bh, 0ABh,  30h,	 29h, 0F0h,  78h, 0FEh,	 1Fh, 0FDh,    7, 0BCh,	   6,  3Eh
		db   40h,  45h,	 43h,  37h,  41h,  37h,	 40h,  37h,  3Eh,  3Ch,	0F0h,  60h, 0F0h,  18h,	0FAh,  80h
		db  0BFh,    6,	 41h,  43h,  48h,  46h,	 3Ah,  44h,  3Ah,  43h,	 3Ah,  41h,  3Fh,  70h,	0FAh,  40h
		db  0FEh,    9,	0FDh,	 8,  29h,  2Eh,	 30h, 0B0h,  1Eh, 0A9h,	   6,  2Eh,  30h,  33h,	 35h,  32h
		db   33h,  30h,	 32h,  2Eh,  30h,  29h,	 2Eh,  30h,  35h,  70h,	 27h,  2Ch,  2Eh, 0AEh,	 18h, 0F0h
		db     6,  27h,	 2Ch,  2Eh,  31h,  33h,	 30h,  31h,  2Eh,  30h,	 2Ch,  2Eh,  2Bh,  2Eh,	 33h,  37h
		db  0F0h,  18h,	0FAh, 0C0h, 0FEh,  1Ah,	0FDh,	 8, 0A0h,    6,	 70h,  20h,  20h, 0ACh,	 24h, 0AAh
		db     6,  70h,	 29h,  70h,  25h,  70h,	0A7h,  30h, 0F0h, 0D8h,	0FAh,  40h, 0FEh,    7,	0FDh,	 9
		db  0A9h,    4,	0F0h,	 8, 0A9h,    6,	 29h, 0AEh,    4, 0F0h,	   8, 0B3h,  0Ch, 0B2h,	   4, 0F0h
		db     8, 0AEh,	   6,  2Eh, 0B0h,    4,	0F0h,	 8, 0B8h,  0Ch,	0B7h,	 4, 0F0h,  0Eh,	0B3h,	 6
		db  0B5h,  30h,	0F0h, 0D8h, 0FAh,  80h,	0FEh,  10h, 0FDh,  0Ah,	0AFh,	 4, 0F0h,    8,	0AFh,	 6
		db   2Fh, 0B4h,	   4, 0F0h,    8, 0B9h,	 0Ch, 0B8h,    4, 0F0h,	   8, 0B4h,    6,  34h,	0B6h,	 4
		db  0F0h,    8,	0BEh,  0Ch, 0BDh,    4,	0F0h,  0Eh, 0B9h,    6,	0BBh,  30h, 0F0h,  18h,	0FAh,  40h
		db  0FEh,    7,	0FDh,	 9, 0B1h,    6,	 32h,  34h,  39h, 0B7h,	 24h, 0F0h,  0Ch, 0ADh,	   6,  2Fh
		db   31h,  37h,	0B5h,  30h, 0B4h,  2Ah,	0F9h,	 0, 0FAh, 0C0h,	0FEh,  30h, 0FDh,  0Dh,	 9Ah,  54h
		db   95h,  0Ch,	 1Ah,  15h,  9Ah,  30h,	0F0h,  18h, 0F8h, 0A1h
MUSIC_12_YM6:	db   89h,  0Ch,	 89h,	 4,  8Ah,    3,	 8Bh,	 2,  0Bh,  8Bh,	   1,  89h,  24h,  89h,	   4,  8Ah
					; DATA XREF: ROM:A7A0o
		db     3,  8Bh,	   2,  0Bh,  8Bh,    1,	 89h,  0Ch,  0Ah,    9,	 89h,	 4,  8Ah,    3,	 8Bh,	 2
		db   0Bh,  8Bh,	   1,  89h,  24h,  89h,	   4,  8Ah,    3,  8Bh,	   2,  0Bh,  8Bh,    1,	 89h,  0Ch
		db   0Ah, 0F8h,	   0, 0F8h,  20h, 0F8h,	0C4h,  89h,  0Ch,  89h,	   4,  8Ah,    3,  8Bh,	   2,  0Bh
		db   8Bh,    1,	 89h,  24h,  89h,    4,	 8Ah,	 3,  8Bh,    2,	 0Bh,  8Bh,    1,  89h,	 0Ch,  0Ah
		db  0F8h, 0E0h,	 89h,  0Ch,  89h,    4,	 8Ah,	 3,  8Bh,    2,	 0Bh,  8Bh,    1,  89h,	 0Ch,  89h
		db     4,  8Ah,	   3,  8Bh,    2,  0Bh,	 8Bh,	 1,  89h,  18h,	 89h,	 4,  8Ah,    3,	 8Ah,	 2
		db   0Bh,  0Bh,	 0Bh,  0Bh,  8Bh,    7,	0F8h,  40h, 0F0h,  78h,	 89h,  0Ch,  89h,    4,	 8Ah,	 3
		db   8Bh,    2,	 0Bh,  8Bh,    1,  89h,	 30h, 0F8h, 0A0h, 0F8h,	 60h, 0F8h, 0C4h, 0F0h,	 60h, 0F8h
		db  0E0h, 0F0h,	 48h,  8Bh,    3,  8Bh,	   2,  0Bh,  0Bh,  0Bh,	 0Bh,  0Bh,  0Bh,  0Ah,	 0Ah,  8Ah
		db     3, 0F8h,	0C1h,  89h,  18h,  85h,	 24h,  89h,    6,  0Ah,	 89h,  0Ch,  89h,    4,	 8Ah,	 3
		db   8Bh,    2,	 0Bh,  8Bh,    1,  89h,	 0Ch,  89h,    6,  0Ah,	 89h,  0Ch,  89h,    6,	 0Ah, 0F8h
		db  0E0h,  89h,	 0Ch,  89h,  30h,  89h,	   6,  0Ah,  89h,  18h,	 89h,  0Ch,  89h,  18h,	   9,  0Ah
		db   8Bh,  0Ch,	0F0h, 0C0h, 0F8h,  20h,	0F0h,  18h,  89h,  0Ch,	 89h,	 6,  0Ah,  89h,	 0Ch,  89h
		db     6,  0Ah,	 89h,  0Ch,  89h,    4,	 8Ah,	 3,  8Bh,    2,	 0Bh,  8Bh,    1,  89h,	 0Ch,  89h
		db   18h,  89h,	   6,  0Ah,  89h,  0Ch,	 89h,	 4,  8Ah,    3,	 8Bh,	 2,  0Bh,  8Bh,	   1,  89h
		db   18h, 0F8h,	 40h, 0F0h, 0C0h, 0F8h,	0A0h, 0F8h,  60h,  85h,	 3Ch,  8Bh,    4,  8Bh,	   3,  8Bh
		db     2,  0Ah,	 8Ah,	 1,  89h,  18h,	0F0h,  0Ch,  89h,  18h,	 89h,	 4,  8Ah,    3,	 8Bh,	 2
		db   0Bh,  8Bh,	   1,  89h,  24h,  8Bh,	 0Ch,  0Ah,  89h,    4,	 8Ah,	 3,  8Bh,    2,	 0Bh,  8Bh
		db     1,  89h,	 24h,  89h,    4,  8Ah,	   3,  8Bh,    2,  0Bh,	 8Bh,	 1,  89h,  0Ch,	 0Ah,	 9
		db   89h,    6,	 0Ah,  89h,  0Ch,  89h,	   4,  8Ah,    3,  8Bh,	   2,  0Bh,  8Bh,    1,	 89h,  0Ch
		db   89h,    4,	 8Ah,	 3,  8Bh,    2,	 0Bh,  8Bh,    1,  89h,	 0Ch,  0Ah, 0F8h, 0A1h
MUSIC_12_PSG1:	db  0FCh,    1,	0FBh,  4Ch, 0F8h,    0,	0FDh,  7Ah, 0F8h, 0C2h,	0B9h,	 4, 0F0h,    8,	0B8h,	 6
					; DATA XREF: ROM:A7A2o
		db   39h, 0F8h,	0E0h, 0B9h,    4, 0F0h,	   8, 0B9h,    4, 0F0h,	   8, 0F8h, 0C2h, 0B9h,	   4, 0F0h
		db     8, 0B8h,	   6,  39h, 0F8h, 0E0h,	0B9h,	 3,  37h,  35h,	 34h,  32h,  30h,  2Eh,	 2Dh, 0F8h
		db   20h, 0F8h,	0C2h, 0ADh,    4, 0F0h,	   8, 0ADh,    6,  2Dh,	0F8h, 0E0h, 0ADh,    4,	0F0h,	 8
		db  0ADh,    4,	0F0h,	 8, 0F8h, 0C2h,	0ADh,	 4, 0F0h,    8,	0ADh,	 6,  2Dh, 0F8h,	0E0h, 0ADh
		db     4, 0F0h,	   8, 0ADh,    4, 0F0h,	   8, 0F8h, 0C2h, 0ABh,	   4, 0F0h,    8, 0ABh,	   6,  2Bh
		db  0F8h, 0E0h,	0ABh,	 4, 0F0h,    8,	0ABh,	 4, 0F0h,    8,	0F8h, 0C2h, 0A9h,    4,	0F0h,	 8
		db  0A9h,    6,	 29h, 0F8h, 0E0h, 0A9h,	   4, 0F0h,    8, 0A9h,	   4, 0F0h,    8, 0F8h,	0C2h, 0A6h
		db     4, 0F0h,	   8, 0A6h,    6,  26h,	0F8h, 0E0h, 0A6h,    4,	0F0h,	 8, 0A6h,    4,	0F0h,	 8
		db  0F8h, 0C1h,	0A6h,	 4, 0F0h,    8,	0A6h,	 6,  26h, 0F8h,	0E0h, 0A6h,    4, 0F0h,	 14h, 0A6h
		db   18h,  70h,	0F8h,  40h, 0ABh,  0Ch,	 70h, 0ABh,    6,  70h,	 2Bh,  2Dh, 0AEh,  18h,	0ADh,  14h
		db  0F0h,    4,	 2Dh, 0F0h,    8, 0ADh,	   6,  2Dh, 0ADh,  18h,	 70h, 0F8h, 0A0h, 0F8h,	 60h, 0ABh
		db   18h, 0ADh,	 30h, 0FDh,  79h, 0AEh,	 60h,  35h,  34h,  38h,	 37h, 0FDh,  0Ah, 0FCh,	   6, 0B5h
		db   1Eh, 0F0h,	   6, 0B3h,  0Ch,  35h,	 33h, 0B5h,  24h, 0B3h,	 0Ch,  35h,  37h, 0B7h,	 1Eh, 0F0h
		db     6, 0B5h,	 0Ch,  37h,  35h, 0B7h,	 24h, 0B5h,  0Ch,  37h,	 37h, 0FCh,    1,  38h,	0FDh,  0Bh
		db  0C3h,    6,	 44h, 0C4h,    4, 0F0h,	   8, 0BFh,    4, 0F0h,	   8, 0BCh,    4, 0F0h,	   8, 0BBh
		db     6,  3Ch,	0BCh,	 4, 0F0h,    8,	0B3h,	 4, 0F0h,    8,	0B8h,	 4, 0F0h,    8,	0FDh,  7Ah
		db  0F8h, 0C2h,	0AFh,	 6,  30h, 0B0h,	   4, 0F0h,    8, 0F8h,	0E0h, 0B0h,    4, 0F0h,	   8, 0F8h
		db  0C2h, 0ACh,	   4, 0F0h,    8, 0ACh,	   6,  2Ch, 0F8h, 0E0h,	0ACh,	 4, 0F0h,    8,	0ACh,	 4
		db  0F0h,    8,	0F8h, 0C2h, 0ACh,    4,	0F0h,	 8, 0ACh,    6,	 2Ch, 0F8h, 0E0h, 0ACh,	   4, 0F0h
		db     8, 0ACh,	   4, 0F0h,    8, 0F8h,	0C2h, 0AEh,    4, 0F0h,	   8, 0AEh,    6,  2Eh,	0F8h, 0E0h
		db  0AEh,    4,	0F0h,	 8, 0AEh,    4,	0F0h,	 8, 0F8h, 0C2h,	0AEh,	 4, 0F0h,    8,	0AEh,	 6
		db   2Eh, 0F8h,	0E0h, 0AEh,    4, 0F0h,	   8, 0AEh,    4, 0F0h,	   8, 0F8h, 0C2h, 0AFh,	   4, 0F0h
		db     8, 0AFh,	   6,  2Fh, 0F8h, 0E0h,	0AFh,	 4, 0F0h,    8,	0AFh,	 4, 0F0h,    8,	0F8h, 0C2h
		db  0AFh,    4,	0F0h,	 8, 0AFh,    6,	 2Fh, 0F8h, 0E0h, 0AFh,	   4, 0F0h,    8, 0AFh,	   4, 0F0h
		db     8, 0F8h,	0C2h, 0AFh,    4, 0F0h,	   8, 0AFh,    6,  2Fh,	0F8h, 0E0h, 0AFh,    4,	0F0h,	 8
		db  0AFh,    4,	0F0h,	 8, 0F8h, 0C2h,	0AFh,	 4, 0F0h,    8,	0AFh,	 6,  2Fh, 0F8h,	0E0h, 0AFh
		db   18h, 0FDh,	 79h, 0B1h, 0C0h, 0F8h,	0A1h
MUSIC_12_PSG2:	db  0FCh,    1,	0FBh,  4Ch, 0F8h,    0,	0FDh,  7Ah, 0F8h, 0C2h,	0B5h,	 4, 0F0h,    8,	0B4h,	 6
					; DATA XREF: ROM:A7A4o
		db   35h, 0F8h,	0E0h, 0B5h,    4, 0F0h,	   8, 0B5h,    4, 0F0h,	   8, 0F8h, 0C2h, 0B5h,	   4, 0F0h
		db     8, 0B4h,	   6,  35h, 0F8h, 0E0h,	0B5h,	 3,  34h,  32h,	 30h,  2Eh,  2Dh,  2Bh,	 29h, 0F8h
		db   20h, 0F8h,	0C2h, 0A9h,    4, 0F0h,	   8, 0A9h,    6,  29h,	0F8h, 0E0h, 0A9h,    4,	0F0h,	 8
		db  0A9h,    4,	0F0h,	 8, 0F8h, 0C2h,	0A9h,	 4, 0F0h,    8,	0A9h,	 6,  29h, 0F8h,	0E0h, 0A9h
		db     4, 0F0h,	   8, 0A9h,    4, 0F0h,	   8, 0F8h, 0C1h, 0A6h,	   4, 0F0h,    8, 0A6h,	   6,  26h
		db  0F8h, 0E0h,	0A8h,	 4, 0F0h,    8,	0A8h,	 6,  28h, 0A8h,	   4, 0F0h,    8, 0A8h,	   4, 0F0h
		db     8, 0F8h,	0C1h, 0A6h,    4, 0F0h,	   8, 0A6h,    6,  26h,	0F8h, 0E0h, 0A4h,    4,	0F0h,	 8
		db  0A4h,    6,	 24h, 0A4h,    4, 0F0h,	   8, 0A4h,    4, 0F0h,	   8, 0F8h, 0C2h, 0AEh,	   4, 0F0h
		db     8, 0AEh,	   6,  2Eh, 0F8h, 0E0h,	0AEh,	 4, 0F0h,    8,	0AEh,	 4, 0F0h,    8,	0F8h, 0C1h
		db  0AEh,    4,	0F0h,	 8, 0AEh,    6,	 2Eh, 0F8h, 0E0h, 0AEh,	   4, 0F0h,  14h, 0AEh,	 18h,  70h
		db  0F8h,  40h,	0A6h,  0Ch,  70h,  27h,	 70h, 0A7h,  18h, 0A8h,	 14h, 0F0h,    4,  28h,	0F0h,	 8
		db  0A8h,    6,	 28h, 0A8h,  18h,  70h,	0F8h, 0A0h, 0F8h,  60h,	0A6h,  18h, 0A5h,  30h,	0FDh,  79h
		db  0A6h,  60h,	 2Eh,  30h,  31h,  33h,	0FDh,  0Ah, 0FCh,    6,	0B0h,  1Eh, 0F0h,    6,	0B0h,  0Ch
		db   30h,  30h,	0B0h,  24h, 0B0h,  0Ch,	 30h,  30h, 0B3h,  1Eh,	0F0h,	 6, 0B3h,  0Ch,	 33h,  33h
		db  0B3h,  24h,	0B3h,  0Ch,  33h,  33h,	0FCh,	 1,  33h, 0FDh,	 0Bh, 0BBh,    6,  3Ch,	0BCh,	 4
		db  0F0h,    8,	0BCh,	 4, 0F0h,    8,	0B8h,	 4, 0F0h,    8,	0B7h,	 6,  38h, 0B8h,	   4, 0F0h
		db     8, 0B0h,	   4, 0F0h,    8, 0B0h,	   4, 0F0h,    8, 0FDh,	 7Ah, 0F8h, 0C2h, 0ABh,	   6,  2Ch
		db  0ACh,    4,	0F0h,	 8, 0F8h, 0E0h,	0ACh,	 4, 0F0h,    8,	0F8h, 0C2h, 0A9h,    4,	0F0h,	 8
		db  0A9h,    6,	 29h, 0F8h, 0E0h, 0A9h,	   4, 0F0h,    8, 0A9h,	   4, 0F0h,    8, 0F8h,	0C2h, 0A9h
		db     4, 0F0h,	   8, 0A9h,    6,  29h,	0F8h, 0E0h, 0A9h,    4,	0F0h,	 8, 0A9h,    4,	0F0h,	 8
		db  0F8h, 0C2h,	0A9h,	 4, 0F0h,    8,	0A9h,	 6,  29h, 0F8h,	0E0h, 0A9h,    4, 0F0h,	   8, 0A9h
		db     4, 0F0h,	   8, 0F8h, 0C2h, 0A9h,	   4, 0F0h,    8, 0A9h,	   6,  29h, 0F8h, 0E0h,	0A9h,	 4
		db  0F0h,    8,	0A9h,	 4, 0F0h,    8,	0F8h, 0C2h, 0ABh,    4,	0F0h,	 8, 0ABh,    6,	 2Bh, 0F8h
		db  0E0h, 0ABh,	   4, 0F0h,    8, 0ABh,	   4, 0F0h,    8, 0F8h,	0C2h, 0ABh,    4, 0F0h,	   8, 0ABh
		db     6,  2Bh,	0F8h, 0E0h, 0ABh,    4,	0F0h,	 8, 0ABh,    4,	0F0h,	 8, 0F8h, 0C2h,	0A8h,	 4
		db  0F0h,    8,	0A8h,	 6,  28h, 0F8h,	0E0h, 0A8h,    4, 0F0h,	   8, 0A8h,    4, 0F0h,	   8, 0F8h
		db  0C2h, 0A8h,	   4, 0F0h,    8, 0A8h,	   6,  28h, 0F8h, 0E0h,	0A8h,  18h, 0FDh,  79h,	0A8h, 0C0h
		db  0F8h, 0A1h
MUSIC_12_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:A7A6o	ROM:A7A8o
MUSIC_13:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 186
		dw MUSIC_13_YM1
		dw MUSIC_13_YM2
		dw MUSIC_13_YM3
		dw MUSIC_13_YM4
		dw MUSIC_13_YM5
		dw MUSIC_13_YM6
		dw MUSIC_13_PSG1
		dw MUSIC_13_PSG2
		dw MUSIC_13_PSG3
		dw MUSIC_13_PSG3
MUSIC_13_YM1:	db  0FEh,  31h,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Ch, 0A1h,  30h,	0F8h,	 0, 0A8h,  18h,	0A9h,  30h
					; DATA XREF: ROM:B276o
		db  0A5h,  18h,	 26h,  29h,  2Dh,  32h,	0B5h,  24h, 0B4h,  0Ch,	0B4h,  50h, 0F0h,  10h,	0A1h,  30h
		db  0AAh,  18h,	0ABh,  30h, 0A7h,  18h,	 28h,  2Bh,  2Eh,  31h,	0B4h,  24h, 0B2h,  0Ch,	0B2h,  18h
		db   34h, 0B5h,	 3Ch, 0F0h,  0Ch, 0B2h,	 18h, 0B9h,  48h, 0B8h,	 18h, 0B7h,  28h, 0F0h,	   8, 0B1h
		db   0Ch,  32h,	 34h,  70h, 0B7h,  48h,	0B6h,  18h, 0B5h,  28h,	0F0h,	 8, 0AFh,  0Ch,	 30h,  32h
		db   70h, 0B2h,	 18h, 0B3h,  30h, 0AFh,	 18h,  30h,  33h,  37h,	 3Ch, 0BCh,  48h, 0BCh,	 18h,  3Dh
		db   3Ch,  3Ah,	 38h, 0B7h,  30h, 0B5h,	 18h,  37h, 0B8h,  3Ch,	0F0h,  0Ch, 0AEh,  18h,	 36h, 0B7h
		db   30h, 0B2h,	 18h,  33h,  37h,  3Ah,	 3Fh, 0BFh,  48h, 0BEh,	 1Ch, 0BDh, 0F8h, 0F0h,	 32h, 0A1h
		db   30h, 0F8h,	0A1h
MUSIC_13_YM2:	db  0F0h,  30h,	0F8h,	 0, 0FEh,    6,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0F0h,  0Ch,	 2Dh,  32h
					; DATA XREF: ROM:B278o
		db   35h,  70h,	 2Dh,  31h,  34h,  70h,	 2Dh,  32h,  35h,  38h,	 39h,  35h,  32h,  70h,	 2Ch,  2Fh
		db   32h,  35h,	 34h,  32h,  2Fh,  2Dh,	 31h,  34h,  3Ah, 0B9h,	 10h,  37h,  34h, 0F0h,	 0Ch,  2Dh
		db   31h,  34h,	 70h,  2Dh,  31h,  37h,	 70h,  2Dh,  31h,  34h,	 37h,  3Ah,  39h,  37h,	 70h,  2Dh
		db   32h,  35h,	 34h,  35h,  32h,  2Dh,	 70h,  2Fh,  32h,  35h,	0B9h,  10h,  37h,  35h,	0F0h,  0Ch
		db   28h,  2Fh,	 32h, 0B4h,  10h,  35h,	 34h, 0F0h,  0Ch,  2Dh,	 31h,  34h, 0B9h,  18h,	 43h, 0F0h
		db   0Ch,  26h,	 2Dh,  30h, 0B2h,  10h,	 33h,  32h, 0F0h,  0Ch,	 2Bh,  2Fh,  32h, 0B7h,	 18h,  41h
		db  0F0h,  0Ch,	 30h,  33h,  37h,  70h,	 2Fh,  33h,  37h,  70h,	 30h,  33h,  37h,  3Bh,	 3Ch,  37h
		db   33h,  70h,	 2Bh,  2Ch,  30h, 0B3h,	 10h,  38h,  3Ch, 0BDh,	 0Ch,  38h,  3Ch,  38h,	 3Ah,  35h
		db   38h,  33h,	 70h,  2Bh,  32h,  35h,	 37h,  35h,  32h,  2Fh,	 70h,  2Eh,  32h,  35h,	0BCh,  10h
		db   3Ah,  38h,	0F0h,  0Ch,  2Bh,  2Eh,	 33h,  70h,  2Ch,  2Eh,	 32h,  70h,  2Bh,  2Eh,	 33h,  36h
		db   37h,  3Ah,	 3Fh, 0C3h,  10h,  41h,	 3Fh, 0BAh,  34h, 0F0h,	 20h, 0FDh,  0Ch, 0B9h,	 14h, 0B7h
		db   10h, 0B5h,	 0Eh, 0B4h,  0Ch, 0B2h,	 0Ah, 0B1h,  0Bh, 0AEh,	 0Ch, 0ACh,  0Bh, 0ADh,	 0Ah, 0AEh
		db     9, 0ADh,	   8,  28h, 0A6h,  0Ah,	0A5h,  0Ch, 0FDh,  0Dh,	0A8h,  0Ah, 0ABh,    8,	0ADh,	 6
		db  0FDh,  0Ch,	0B1h,	 5, 0B4h,    4,	 37h,  39h, 0FDh,  0Bh,	 3Dh,  40h, 0C3h,    6,	0FDh,  0Ah
		db  0C5h,  60h,	0F8h, 0A1h
MUSIC_13_YM3:	db  0F0h,  30h,	0FEh,  31h, 0FDh,  0Ah,	0FCh,	 1, 0FBh,  2Ch,	0F8h,	 0, 0A1h,  60h,	0A1h,  30h
					; DATA XREF: ROM:B27Ao
		db   1Dh, 0A0h,	 18h,  21h, 0A3h,  30h,	0A5h,  5Ah, 0F0h,    6,	0A5h,  30h,  1Fh,  21h,	 2Bh, 0ABh
		db   24h, 0A9h,	 0Ch, 0A9h,  18h,  2Bh,	0ADh,  60h, 0AFh,  18h,	 30h, 0B2h,  30h, 0B1h,	 28h, 0F0h
		db     8, 0ADh,	 0Ch,  2Fh,  31h,  70h,	0ADh,  18h,  2Fh, 0B0h,	 30h, 0AFh,  28h, 0F0h,	   8, 0ABh
		db   0Ch,  2Dh,	 2Fh,  70h, 0AFh,  18h,	 30h, 0A9h,  30h,  2Bh,	 27h, 0B3h,  48h, 0B3h,	 18h,  31h
		db   33h,  35h,	 33h, 0B2h,  30h,  2Bh,	0A6h,  60h,  2Eh, 0AEh,	 30h, 0ABh,  18h,  2Eh,	0AEh,  64h
		db  0ADh, 0F8h,	0F0h,  62h, 0F8h, 0A1h
MUSIC_13_YM4:	db  0F0h,  30h,	0FEh,  3Ah, 0FDh,  0Ah,	0FCh,	 1, 0FBh,  2Ch,	0F8h,	 0,  8Eh,  30h,	 10h,  91h
					; DATA XREF: ROM:B27Co
		db   18h,  10h,	 0Eh,  0Ch,  0Bh,    9,	 88h,  30h,  89h,  5Ah,	0F0h,	 6,  89h,  30h,	 0Bh,  8Dh
		db   18h,  0Eh,	 90h,  30h,  0Eh,  0Ch,	 8Bh,  60h,  10h,    9,	 0Eh,	 7,  8Ch,  30h,	 0Eh,  8Fh
		db   18h,  0Eh,	 0Ch,  0Ah,    8,  0Fh,	 14h,  12h,  11h,  0Fh,	 0Dh,  0Ch,  8Bh,  60h,	 0Ah,  8Fh
		db   30h,  11h,	 93h,  18h,  0Fh,  0Ah,	   8,  87h,  64h,  89h,	0F8h, 0F0h,  62h, 0F8h,	0A1h
MUSIC_13_YM5:	db  0F9h,  20h,	0F0h,	 6, 0FEh,  31h,	0FDh,	 9, 0FCh,    1,	0FBh,  2Ch, 0A1h,  30h,	0F8h,	 0
					; DATA XREF: ROM:B27Eo
		db  0A8h,  18h,	0A9h,  30h, 0A5h,  18h,	 26h,  29h,  2Dh,  32h,	0B5h,  24h, 0B4h,  0Ch,	0B4h,  50h
		db  0F0h,  10h,	0A1h,  30h, 0AAh,  18h,	0ABh,  30h, 0A7h,  18h,	 28h,  2Bh,  2Eh,  31h,	0B4h,  24h
		db  0B2h,  0Ch,	0B2h,  18h,  34h, 0B5h,	 3Ch, 0F0h,  0Ch, 0B2h,	 18h, 0B9h,  48h, 0B8h,	 18h, 0B7h
		db   28h, 0F0h,	   8, 0B1h,  0Ch,  32h,	 34h,  70h, 0B7h,  48h,	0B6h,  18h, 0B5h,  28h,	0F0h,	 8
		db  0AFh,  0Ch,	 30h,  32h,  70h, 0B2h,	 18h, 0B3h,  30h, 0AFh,	 18h,  30h,  33h,  37h,	 3Ch, 0BCh
		db   48h, 0BCh,	 18h,  3Dh,  3Ch,  3Ah,	 38h, 0B7h,  30h, 0B5h,	 18h,  37h, 0B8h,  3Ch,	0F0h,  0Ch
		db  0AEh,  18h,	 36h, 0B7h,  30h, 0B2h,	 18h,  33h,  37h,  3Ah,	 3Fh, 0BFh,  48h, 0BEh,	 1Ch, 0BDh
		db  0F8h, 0F0h,	 32h, 0A1h,  30h, 0F8h,	0A1h
MUSIC_13_YM6:	db  0FFh,    0,	   0	; DATA XREF: ROM:B280o
MUSIC_13_PSG1:	db  0FDh,    0,	0F0h,  36h, 0F8h,    0,	0FCh,	 1, 0FBh,  2Ch,	0F0h,  0Ch, 0FDh,  87h,	 2Dh,  32h
					; DATA XREF: ROM:B282o
		db   35h, 0FDh,	   0,  70h, 0FDh,  87h,	 2Dh,  31h,  34h, 0FDh,	   0,  70h, 0FDh,  87h,	 2Dh,  32h
		db   35h,  38h,	 39h,  35h,  32h, 0FDh,	   0,  70h, 0FDh,  87h,	 2Ch,  2Fh,  32h,  35h,	 34h,  32h
		db   2Fh,  2Dh,	 31h,  34h,  3Ah, 0B9h,	 10h,  37h,  34h, 0FDh,	   0, 0F0h,  0Ch, 0FDh,	 87h,  2Dh
		db   31h,  34h,	0FDh,	 0,  70h, 0FDh,	 87h,  2Dh,  31h,  37h,	0FDh,	 0,  70h, 0FDh,	 87h,  2Dh
		db   31h,  34h,	 37h,  3Ah,  39h,  37h,	0FDh,	 0,  70h, 0FDh,	 87h,  2Dh,  32h,  35h,	 34h,  35h
		db   32h,  2Dh,	0FDh,	 0,  70h, 0FDh,	 87h,  2Fh,  32h,  35h,	0B9h,  10h,  37h,  35h,	0FDh,	 0
		db  0F0h,  0Ch,	0FDh,  87h,  28h,  2Fh,	 32h, 0B4h,  10h,  35h,	 34h, 0FDh,    0, 0F0h,	 0Ch, 0FDh
		db   87h,  2Dh,	 31h,  34h,  39h, 0FDh,	   0,  70h, 0FDh,    7,	 43h, 0FDh,    0, 0F0h,	 18h, 0FDh
		db   87h, 0A6h,	 0Ch,  2Dh,  30h, 0B2h,	 10h,  33h,  32h, 0FDh,	   0, 0F0h,  0Ch, 0FDh,	 87h,  2Bh
		db   2Fh,  32h,	 37h, 0FDh,    0,  70h,	0FDh,  87h,  41h, 0FDh,	   0, 0F0h,  18h, 0FDh,	 87h, 0B0h
		db   0Ch,  33h,	 37h, 0FDh,    0,  70h,	0FDh,  87h,  2Fh,  33h,	 37h, 0FDh,    0,  70h,	0FDh,  87h
		db   30h,  33h,	 37h,  3Bh,  3Ch,  37h,	 33h, 0FDh,    0,  70h,	0FDh,  87h,  2Bh,  2Ch,	 30h, 0B3h
		db   10h,  38h,	 3Ch, 0BDh,  0Ch,  38h,	 3Ch,  38h,  3Ah,  35h,	 38h,  33h, 0FDh,    0,	 70h, 0FDh
		db   87h,  2Bh,	 32h,  35h,  37h,  35h,	 32h,  2Fh, 0FDh,    0,	 70h, 0FDh,  87h,  2Eh,	 32h,  35h
		db  0BCh,  10h,	 3Ah,  38h, 0FDh,    0,	0F0h,  0Ch, 0FDh,  87h,	 2Bh,  2Eh,  33h, 0FDh,	   0,  70h
		db  0FDh,  87h,	 2Ch,  2Eh,  32h, 0FDh,	   0,  70h, 0FDh,  87h,	 2Bh,  2Eh,  33h,  36h,	 37h,  3Ah
		db   3Fh, 0C3h,	 10h,  41h,  3Fh,  3Ah,	0FDh,	 0, 0F0h,  44h,	0FDh,  89h, 0B9h,  14h,	0B7h,  10h
		db  0B5h,  0Eh,	0B4h,  0Ch, 0B2h,  0Ah,	0B1h,  0Bh, 0AEh,  0Ch,	0ACh,  0Bh, 0ADh,  0Ah,	0AEh,	 9
		db  0ADh,    8,	 28h, 0A6h,  0Ah, 0A5h,	 0Ch, 0FDh,  8Ah, 0A8h,	 0Ah, 0ABh,    8, 0ADh,	   6, 0FDh
		db   0Ah, 0B1h,	   5, 0B4h,    4,  37h,	 39h, 0FDh,  88h,  3Dh,	 40h, 0C3h,    6, 0FDh,	 87h, 0C5h
		db   14h, 0FDh,	 84h,  45h, 0FDh,    0,	0F0h,  38h, 0F8h, 0A1h
MUSIC_13_PSG2:	db  0FFh,    0,	   0	; DATA XREF: ROM:B284o
MUSIC_13_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:B286o	ROM:B288o
MUSIC_14:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 181
		dw MUSIC_14_YM1
		dw MUSIC_14_YM2
		dw MUSIC_14_YM3
		dw MUSIC_14_YM4
		dw MUSIC_14_YM5
		dw MUSIC_14_YM6
		dw MUSIC_14_PSG1
		dw MUSIC_14_PSG2
		dw MUSIC_14_PSG3
		dw MUSIC_14_PSG3
MUSIC_14_YM1:	db  0FEh,  27h,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0B5h,    6,	 31h,  2Dh,  34h,  31h,	 2Bh,  32h
					; DATA XREF: ROM:B6A4o
		db   2Dh,  2Ah,	 30h,  2Dh,  2Ah,  2Fh,	 28h,  26h,  2Ch,  26h,	 23h,  2Dh, 0F0h,  1Eh,	0F8h,	 0
		db  0FAh, 0C0h,	0FEh,  10h, 0FDh,  0Dh,	0F8h,  20h, 0F8h, 0C1h,	0B9h,	 5, 0BBh,    4,	0B9h,	 3
		db   3Bh,  39h,	 3Bh,  39h, 0B8h,    4,	0F0h,	 8, 0F8h, 0E0h,	0B9h,	 5, 0BBh,    4,	0B9h,	 3
		db   3Bh,  39h,	 38h,  39h, 0BEh,    4,	0F0h,	 8, 0F8h,  40h,	0B5h,  24h, 0FCh,    7,	0B4h,  0Ch
		db   36h,  38h,	 39h,  3Bh,  3Dh,  3Eh,	 40h,  43h, 0FCh,    1,	0B9h,	 5, 0F0h,    6,	0C4h,	 2
		db  0C5h,    5,	0F0h,  12h, 0F8h, 0A0h,	0F8h,  60h, 0C1h,  24h,	0F0h,  0Ch, 0FCh,    7,	 42h,  3Dh
		db   3Eh,  3Ah,	 3Bh,  38h,  39h,  31h,	0FCh,	 1,  32h, 0FEh,	 36h, 0FDh,  0Ch, 0A6h,	   4,  28h
		db   2Ah,  2Bh,	 2Dh,  2Eh, 0AFh,  18h,	 2Fh,  2Fh, 0AFh,    5,	0F0h,	 7, 0AFh,  0Ch,	 2Eh, 0B2h
		db     5, 0F0h,	   7, 0ACh,  18h,  2Dh,	 2Dh,  2Dh, 0ADh,    5,	0F0h,	 7, 0ADh,  0Ch,	 2Ch, 0AFh
		db     5, 0F0h,	   7, 0ADh,  18h,  30h,	 30h,  30h, 0B0h,    5,	0F0h,	 7, 0B0h,  0Ch,	 2Fh,  2Dh
		db  0ABh,  12h,	0ADh,	 6, 0AFh,    5,	0F0h,	 7, 0B2h,  84h,	0B4h,  18h,  34h,  34h,	0B4h,	 5
		db  0F0h,    7,	0B4h,  0Ch,  33h, 0B7h,	   5, 0F0h,    7, 0B1h,	 18h,  32h,  32h,  32h,	0B2h,	 5
		db  0F0h,    7,	0B2h,  0Ch,  31h, 0B4h,	   5, 0F0h,    7, 0B2h,	 18h,  35h,  35h,  35h,	0B5h,	 5
		db  0F8h, 0C3h,	0F0h,	 7, 0B2h,    6,	 34h, 0B5h,  11h, 0F8h,	0E0h, 0F0h,    7, 0B2h,	   6,  34h
		db   35h,  37h,	 39h,  37h,  35h,  34h,	 32h,  30h,  2Fh,  2Dh,	 2Bh,  29h,  28h,  26h,	 25h, 0F0h
		db   66h, 0F8h,	0A1h
MUSIC_14_YM2:	db  0FEh,  29h,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0B1h,  24h,	 32h,  34h, 0B4h,  29h,	0F9h,  20h
					; DATA XREF: ROM:B6A6o
		db  0F8h,    0,	0FAh,  80h, 0FEh,  10h,	0FDh,  0Bh, 0F8h,  20h,	0F8h, 0C1h, 0B9h,    5,	0BBh,	 4
		db  0B9h,    3,	 3Bh,  39h,  3Bh,  39h,	0B8h,	 4, 0F0h,    8,	0F8h, 0E0h, 0B9h,    5,	0BBh,	 4
		db  0B9h,    3,	 3Bh,  39h,  38h,  39h,	0BEh,	 4, 0F0h,    8,	0F8h,  40h, 0B5h,  24h,	0FCh,	 7
		db  0B4h,  0Ch,	 36h,  38h,  39h,  3Bh,	 3Dh,  3Eh,  40h,  43h,	0FCh,	 1, 0B9h,    5,	0F0h,	 6
		db  0C4h,    2,	0C5h,	 5, 0F0h,  12h,	0F8h, 0A0h, 0F8h,  60h,	0C1h,  24h, 0F0h,  0Ch,	0FCh,	 7
		db   42h,  3Dh,	 3Eh,  3Ah,  3Bh,  38h,	 39h,  31h, 0FCh,    1,	 32h, 0FAh,  40h, 0FEh,	 36h, 0FDh
		db   0Ah, 0A6h,	   4,  28h,  2Ah,  2Bh,	 2Dh,  2Eh, 0AFh,  18h,	 2Fh,  2Fh, 0AFh,    5,	0F0h,	 7
		db  0AFh,  0Ch,	 2Eh, 0B2h,    5, 0F0h,	   7, 0ACh,  18h,  2Dh,	 2Dh,  2Dh, 0ADh,    5,	0F0h,	 7
		db  0ADh,  0Ch,	 2Ch, 0AFh,    5, 0F0h,	   7, 0ADh,  18h,  30h,	 30h,  30h, 0B0h,    5,	0F0h,	 7
		db  0B0h,  0Ch,	 2Fh,  2Dh, 0ABh,  12h,	0ADh,	 6, 0AFh,    5,	0F0h,	 7, 0B2h,  84h,	0B4h,  18h
		db   34h,  34h,	0B4h,	 5, 0F0h,    7,	0B4h,  0Ch,  33h, 0B7h,	   5, 0F0h,    7, 0B1h,	 18h,  32h
		db   32h,  32h,	0B2h,	 5, 0F0h,    7,	0B2h,  0Ch,  31h, 0B4h,	   5, 0F0h,    7, 0B2h,	 18h,  35h
		db   35h,  35h,	0B5h,	 5, 0F8h, 0C3h,	0F0h,	 7, 0B2h,    6,	 34h, 0B5h,  11h, 0F8h,	0E0h, 0F0h
		db     7, 0B2h,	   6,  34h,  35h,  37h,	 39h,  37h,  35h,  34h,	 32h,  30h,  2Fh,  2Dh,	 2Bh,  29h
		db   28h,  26h,	 25h, 0F0h,  66h, 0F8h,	0A1h
MUSIC_14_YM3:	db  0FEh,  29h,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0ABh,  24h,	 2Ah,  2Ch,  2Dh, 0F8h,	   0, 0FEh
					; DATA XREF: ROM:B6A8o
		db   29h, 0FDh,	   9, 0F8h, 0C1h, 0F0h,	 0Ch, 0A6h,  24h, 0A6h,	 18h, 0F8h, 0E0h, 0FEh,	 27h, 0FDh
		db   0Ah, 0B2h,	 0Ch,  31h,  2Fh,  2Dh,	 2Bh,  2Ah,  29h,  28h,	 26h,  25h, 0B1h,  18h,	0FEh,  29h
		db  0FDh,    9,	0F8h, 0C1h, 0F0h,  0Ch,	0A6h,  24h, 0A6h,  18h,	0F8h, 0E0h, 0FEh,  27h,	0FDh,  0Ah
		db  0AAh,  18h,	0ADh,  0Ch, 0AFh,  18h,	0B2h,  0Ch, 0B1h,  18h,	0B4h,  0Ch, 0B2h,  30h,	0FEh,  3Ah
		db  0FDh,    9,	0ABh,	 6,  2Fh,  32h,	0F0h,  12h, 0AAh,    6,	 2Eh,  32h, 0F0h,  12h,	0A9h,	 6
		db   2Dh,  32h,	 70h,  28h,  2Ch,  2Fh,	 32h,  2Fh,  2Ch, 0F0h,	 0Ch, 0A8h,    6,  2Dh,	 30h, 0F0h
		db   12h, 0A8h,	   6,  2Ch,  30h, 0F0h,	 12h, 0A8h,    6,  2Bh,	 30h,  70h,  2Ah,  2Dh,	 30h,  34h
		db   30h,  2Dh,	0F0h,  0Ch, 0A8h,    6,	 2Bh,  30h, 0F0h,  12h,	0A7h,	 6,  2Bh,  30h,	0F0h,  12h
		db  0A6h,    6,	 2Ah,  30h,  70h,  28h,	 2Ah,  2Dh,  30h,  34h,	 32h, 0ABh,  24h,  2Ah,	0A9h,  18h
		db  0A6h,  0Ch,	0A3h,  24h, 0F0h,  0Ch,	0A4h,	 6,  28h,  2Bh,	0F0h,  12h, 0A3h,    6,	 27h,  2Bh
		db  0F0h,  12h,	0A2h,	 6,  26h,  2Bh,	 70h,  21h,  25h,  28h,	 2Bh,  28h,  25h, 0F0h,	 0Ch, 0A6h
		db     6,  29h,	 2Dh, 0F0h,  12h, 0A5h,	   6,  29h,  2Dh, 0F0h,	 12h, 0A4h,    6,  29h,	 2Dh,  70h
		db   23h,  26h,	 29h,  2Dh,  29h,  26h,	0F0h,  0Ch, 0A4h,    6,	 29h,  2Dh, 0F0h,  12h,	0A4h,	 6
		db   29h,  2Ch,	 70h,  2Bh, 0F0h,  0Ch,	0F8h, 0C1h, 0F0h,    6,	 23h,  24h,  26h,  28h,	 29h,  70h
		db   29h,  2Bh,	 2Dh,  2Bh,  29h, 0F8h,	0E0h, 0A8h,    6,  26h,	 24h,  23h, 0F0h,  1Eh,	0F0h,  24h
		db  0A1h,    6,	 1Fh,  1Eh,  1Ch,  1Ah,	 19h,  1Ch, 0F0h,  42h,	0F8h, 0A1h
MUSIC_14_YM4:	db  0FCh,    1,	0FBh,  2Ch, 0FEh,  29h,	0FDh,  0Bh, 0A1h,  24h,	 21h,  26h, 0A5h,  0Ch,	 21h,  15h
					; DATA XREF: ROM:B6AAo
		db  0FDh,  0Ah,	0F8h,	 0, 0F8h,  20h,	0F8h, 0C2h,  9Ah,  0Ch,	 1Eh,  15h, 0F8h, 0E0h,	0F8h,  40h
		db   96h,  0Ch,	 20h,  16h,  1Ch,  23h,	 1Ch,  1Eh,  25h,  1Eh,	 17h,  21h,  16h,  95h,	 18h, 0A1h
		db   0Ch, 0F8h,	0A0h, 0F8h,  60h,  97h,	 0Ch,  20h,  17h,  95h,	 24h,  15h,  15h,  1Ah,	 93h,  18h
		db   9Fh,  0Ch,	 92h,  18h,  9Eh,  0Ch,	 91h,  18h,  9Dh,  0Ch,	 90h,  18h,  9Ch,  0Ch,	 95h,  18h
		db  0A1h,  0Ch,	 94h,  18h, 0A0h,  0Ch,	 93h,  18h,  9Fh,  0Ch,	 92h,  18h,  9Eh,  0Ch,	 90h,  18h
		db   9Ch,  0Ch,	 8Fh,  18h,  9Bh,  0Ch,	 8Eh,  18h,  9Ah,  0Ch,	 92h,  18h,  9Eh,  0Ch,	 93h,  18h
		db   1Fh,  9Fh,	 0Ch,  1Ah,  93h,  18h,	 9Fh,  0Ch,  93h,    6,	 15h,  17h,  1Ah,  21h,	 1Fh,  98h
		db   18h, 0A4h,	 0Ch,  97h,  18h, 0A3h,	 0Ch,  96h,  18h, 0A2h,	 0Ch,  95h,  18h, 0A1h,	 0Ch,  9Ah
		db   18h, 0A6h,	 0Ch,  99h,  18h, 0A5h,	 0Ch,  98h,  18h, 0A4h,	 0Ch,  97h,  18h, 0A3h,	 0Ch,  95h
		db   18h, 0A1h,	 0Ch,  94h,  18h, 0A0h,	 0Ch, 0F8h, 0C1h,  93h,	 18h,  1Fh,  9Fh,  0Ch,	 1Ah, 0F8h
		db  0E0h,  93h,	 2Ah, 0F0h,  42h,  95h,	 24h,  95h,  18h,  9Ch,	 0Ch,  21h,  1Ch,  15h,	0F8h, 0A1h
MUSIC_14_YM5:	db  0F9h,  20h,	0FAh,  80h, 0F0h,    6,	0FEh,  27h, 0FDh,    8,	0FCh,	 1, 0FBh,  2Ch,	 35h,  31h
					; DATA XREF: ROM:B6ACo
		db   2Dh,  34h,	 31h,  2Bh,  32h,  2Dh,	 2Ah,  30h,  2Dh,  2Ah,	 2Fh,  28h,  26h,  2Ch,	 26h,  23h
		db   2Dh, 0F0h,	 1Eh, 0F8h,    0, 0F0h,	 90h, 0FAh,  40h, 0FEh,	 27h, 0FDh,    8, 0B2h,	 0Ch,  31h
		db   2Fh,  2Dh,	 2Bh,  2Ah,  29h,  28h,	 26h,  25h, 0B1h,  18h,	0F0h,  90h, 0AAh,  18h,	0ADh,  0Ch
		db  0AFh,  18h,	0B2h,  0Ch, 0B1h,  18h,	0B4h,  0Ch, 0B2h,  30h,	0FAh,  80h, 0FEh,  3Ah,	0FDh,	 7
		db  0ABh,    6,	 2Fh,  32h, 0F0h,  12h,	0AAh,	 6,  2Eh,  32h,	0F0h,  12h, 0A9h,    6,	 2Dh,  32h
		db   70h,  28h,	 2Ch,  2Fh,  32h,  2Fh,	 2Ch, 0F0h,  0Ch, 0A8h,	   6,  2Dh,  30h, 0F0h,	 12h, 0A8h
		db     6,  2Ch,	 30h, 0F0h,  12h, 0A8h,	   6,  2Bh,  30h,  70h,	 2Ah,  2Dh,  30h,  34h,	 30h,  2Dh
		db  0F0h,  0Ch,	0A8h,	 6,  2Bh,  30h,	0F0h,  12h, 0A7h,    6,	 2Bh,  30h, 0F0h,  12h,	0A6h,	 6
		db   2Ah,  30h,	 70h,  28h,  2Ah,  2Dh,	 30h,  34h,  32h, 0ABh,	 24h,  2Ah, 0A9h,  18h,	0A6h,  0Ch
		db  0A3h,  24h,	0F0h,  0Ch, 0A4h,    6,	 28h,  2Bh, 0F0h,  12h,	0A3h,	 6,  27h,  2Bh,	0F0h,  12h
		db  0A2h,    6,	 26h,  2Bh,  70h,  21h,	 25h,  28h,  2Bh,  28h,	 25h, 0F0h,  0Ch, 0A6h,	   6,  29h
		db   2Dh, 0F0h,	 12h, 0A5h,    6,  29h,	 2Dh, 0F0h,  12h, 0A4h,	   6,  29h,  2Dh,  70h,	 23h,  26h
		db   29h,  2Dh,	 29h,  26h, 0F0h,  0Ch,	0A4h,	 6,  29h,  2Dh,	0F0h,  12h, 0A4h,    6,	 29h,  2Ch
		db   70h,  2Bh,	0F0h,  0Ch, 0F8h, 0C1h,	0F0h,	 6,  23h,  24h,	 26h,  28h,  29h,  70h,	 29h,  2Bh
		db   2Dh,  2Bh,	 29h, 0F8h, 0E0h, 0A8h,	   6,  26h,  24h,  23h,	0F0h,  1Eh, 0F0h,  24h,	0A1h,	 6
		db   1Fh,  1Eh,	 1Ch,  1Ah,  19h,  1Ch,	0F0h,  42h, 0F8h, 0A1h
MUSIC_14_YM6:	db  0FFh,    0,	   0	; DATA XREF: ROM:B6AEo
MUSIC_14_PSG1:	db  0FDh,    0,	0FCh,	 1, 0FBh,  4Ch,	0F0h,  90h, 0F8h,    0,	0F0h,  90h,  70h,  70h,	0FDh,	 7
					; DATA XREF: ROM:B6B0o
		db  0ADh,  24h,	 2Fh,  31h, 0FDh,    8,	0B2h,  0Ch, 0FDh,    0,	0F0h,  18h, 0F8h, 0C3h,	0FDh,	 0
		db  0F0h,  0Ch,	0FDh,  29h,  26h,  26h,	0F8h, 0E0h, 0F8h, 0C3h,	0FDh,	 0, 0F0h,  0Ch,	0FDh,  29h
		db   28h,  28h,	0F8h, 0E0h, 0F8h, 0C2h,	0FDh,	 0, 0F0h,  0Ch,	0FDh,  29h,  24h,  24h,	0F8h, 0E0h
		db  0FDh,    0,	0F0h,  0Ch, 0FDh,  29h,	 28h,  28h, 0F8h, 0C3h,	0FDh,	 0, 0F0h,  0Ch,	0FDh,  2Ah
		db   32h,  32h,	0F8h, 0E0h, 0FDh,    0,	0F0h,  0Ch, 0FDh,  29h,	 28h,  28h, 0FDh,    0,	 70h, 0FDh
		db   29h,  27h,	 27h, 0FDh,    0,  70h,	0FDh,  29h,  26h,  26h,	 25h,  28h,  28h, 0F8h,	0CAh, 0FDh
		db     0, 0F0h,	 0Ch, 0FDh,  29h,  29h,	 29h, 0F8h, 0E0h, 0A9h,	 0Ch, 0FDh,    0, 0F0h,	 3Ch, 0FDh
		db     7, 0B1h,	 24h, 0FDh,  2Bh, 0AFh,	 0Ch,  3Bh,  37h,  39h,	0FDh,	 0, 0F0h,  18h,	0F8h, 0A1h
MUSIC_14_PSG2:	db  0FDh,    0,	0FCh,	 1, 0FBh,  4Ch,	0F0h,  90h, 0F8h,    0,	0F0h,  90h,  70h,  70h,	0FDh,	 7
					; DATA XREF: ROM:B6B2o
		db  0AAh,  24h,	 2Bh, 0ADh,  18h, 0ABh,	 0Ch, 0FDh,    8,  2Ah,	0FDh,	 0, 0F0h,  18h,	0FDh,	 0
		db  0F0h,  0Ch,	0FDh,  29h,  23h,  23h,	0FDh,	 0,  70h, 0FDh,	 29h,  22h,  22h, 0FDh,	   0,  70h
		db  0FDh,  29h,	 21h,  21h,  20h,  23h,	 23h, 0F8h, 0C3h, 0FDh,	   0, 0F0h,  0Ch, 0FDh,	 29h,  24h
		db   24h, 0F8h,	0E0h, 0F8h, 0C1h, 0FDh,	   0, 0F0h,  0Ch, 0FDh,	 29h,  1Fh,  1Fh, 0F8h,	0E0h, 0FDh
		db     0, 0F0h,	 0Ch, 0FDh,  29h,  1Eh,	 1Eh, 0FDh,    0,  70h,	0FDh,  29h,  21h,  21h,	0F8h, 0C3h
		db  0FDh,    0,	0F0h,  0Ch, 0FDh,  2Ah,	 2Fh,  2Fh, 0F8h, 0E0h,	0F8h, 0C3h, 0FDh,    0,	0F0h,  0Ch
		db  0FDh,  29h,	 1Fh,  1Fh, 0F8h, 0E0h,	0F8h, 0C3h, 0FDh,    0,	0F0h,  0Ch, 0FDh,  29h,	 21h,  21h
		db  0F8h, 0E0h,	0F8h, 0C1h, 0FDh,    0,	0F0h,  0Ch, 0FDh,  29h,	 24h,  24h, 0F8h, 0E0h,	0F8h, 0C4h
		db  0FDh,    0,	0F0h,  0Ch, 0FDh,  29h,	 23h,  23h, 0F8h, 0E0h,	0A3h,  0Ch, 0FDh,    0,	0F0h,  3Ch
		db  0FDh,    7,	0ABh,  24h, 0FDh,  2Bh,	0ABh,  0Ch,  37h,  34h,	 31h, 0FDh,    0, 0F0h,	 18h, 0F8h
		db  0A1h
MUSIC_14_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:B6B4o	ROM:B6B6o
MUSIC_15:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 184
		dw MUSIC_15_YM1
		dw MUSIC_15_YM2
		dw MUSIC_15_YM3
		dw MUSIC_15_YM4
		dw MUSIC_15_YM5
		dw MUSIC_15_YM6
		dw MUSIC_15_PSG1
		dw MUSIC_15_PSG2
		dw MUSIC_15_PSG3
		dw MUSIC_15_PSG3
MUSIC_15_YM1:	db  0FEh,  2Bh,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0B7h,    6,	 37h,  37h,  37h, 0B7h,	   4, 0F0h
					; DATA XREF: ROM:BCD3o
		db   14h, 0BCh,	   4, 0F0h,  0Eh, 0BBh,	   4, 0F0h,  0Eh, 0BAh,	 6Ch, 0F0h,  48h, 0FEh,	 33h, 0FDh
		db   0Bh, 0B6h,	 10h, 0B7h,    8, 0F8h,	   0, 0F0h,  10h, 0B4h,	 30h, 0F0h,    8, 0AFh,	 10h, 0B0h
		db     8, 0F0h,	 10h, 0AEh,  30h, 0F0h,	   8, 0B6h,  10h, 0B7h,	   8, 0F0h,  10h, 0B9h,	   0, 0FCh
		db   90h, 0BAh,	 18h, 0FCh, 0FFh, 0B9h,	   8,  37h, 0F0h,  10h,	 33h, 0B4h,  44h, 0F0h,	 0Ch, 0B7h
		db   10h, 0B8h,	   8, 0B9h,  10h, 0BCh,	   8, 0F0h,  10h, 0B9h,	   8, 0F0h,  10h, 0BCh,	   8, 0F0h
		db   10h, 0B9h,	   8, 0F0h,  10h, 0BEh,	   0, 0FCh,  86h, 0BFh,	 18h, 0FCh, 0FFh, 0BEh,	   8, 0BCh
		db   10h, 0B9h,	 18h, 0B7h,    8, 0F0h,	 18h, 0B7h,    8, 0F0h,	 10h, 0B9h,    8, 0F0h,	 10h,  34h
		db  0FCh,  80h,	0B7h,  0Ch, 0FCh,  84h,	0B6h,  10h, 0FCh,    1,	0B7h,  28h, 0FCh, 0FFh,	0F0h,  0Ch
		db  0B4h,  10h,	0B2h,  68h, 0F0h,  10h,	0FCh,  88h, 0B2h,    0,	0B3h,  18h, 0FCh, 0FFh,	0B2h,	 8
		db   30h, 0F0h,	 10h,  2Dh, 0B0h,  68h,	0F0h,  10h, 0FEh,  0Dh,	0FDh,  0Ah, 0B7h,    8,	0F0h,  10h
		db  0B9h,    8,	0F0h,  10h, 0BBh,  20h,	0FEh,	 1, 0FDh,  0Bh,	0FCh,	 0, 0F8h,  20h,	0F8h, 0C1h
		db  0B3h,    3,	 70h,  33h,  70h,  33h,	 70h,  33h,  70h, 0B3h,	 10h, 0B2h,    8, 0B3h,	 10h, 0B2h
		db     8, 0B0h,	 10h, 0ADh,    8, 0F8h,	0E0h, 0B0h,  10h, 0B3h,	   8, 0F0h,  10h, 0AAh,	 98h, 0F8h
		db   40h, 0F8h,	0A0h, 0F8h,  60h, 0FEh,	 0Dh, 0FDh,  0Ah, 0FCh,	   1, 0B7h,    8, 0F0h,	 58h, 0F0h
		db   40h, 0B7h,	   4,  70h, 0B6h,  18h,	0B5h,	 8, 0F0h,  58h,	0F0h,  40h, 0B5h,    4,	 70h, 0B3h
		db   18h, 0F0h,	   8, 0FEh,    1, 0FDh,	 0Bh, 0A2h,    7,  23h,	 24h,  27h, 0A9h,    6,	 2Ah,  2Bh
		db   2Eh,  29h,	0AAh,	 5,  2Bh,  2Eh,	 2Fh,  30h,  33h, 0B5h,	   4,  36h,  37h,  3Ah,	 36h,  3Ah
		db  0F8h,  20h,	0F8h, 0C3h, 0B6h,    3,	 3Ah, 0F8h, 0E0h, 0F8h,	 40h, 0FDh,  0Ah, 0F8h,	0A0h, 0F8h
		db   60h, 0FDh,	   9, 0F8h, 0A0h, 0F8h,	 80h, 0FDh,    8, 0F8h,	 20h, 0F8h, 0C3h, 0B6h,	   3,  3Ah
		db  0F8h, 0E0h,	0F8h,  40h, 0FDh,    7,	0F8h, 0A0h, 0F8h,  60h,	0FDh,	 6, 0F8h, 0C5h,	0B6h,	 3
		db   3Ah, 0F8h,	0E0h, 0B6h,    3, 0F0h,	   9, 0FEh,  0Dh, 0FDh,	 0Ah, 0BCh,  10h, 0BBh,	   4, 0F0h
		db   14h, 0BAh,	 20h, 0FEh,  33h, 0FDh,	 0Bh, 0B6h,  10h, 0B7h,	   8, 0F8h, 0A1h
MUSIC_15_YM2:	db  0FEh,  2Bh,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0B2h,    6,	 32h,  32h,  32h, 0B2h,	   4, 0F0h
					; DATA XREF: ROM:BCD5o
		db   14h, 0B7h,	   4, 0F0h,  0Eh, 0B7h,	   4, 0F0h,  0Eh, 0B5h,	 6Ch, 0F0h,  60h, 0F8h,	   0, 0FEh
		db     1, 0FDh,	 0Ah, 0F8h, 0C2h, 0F0h,	 18h, 0ABh,    6, 0F0h,	 2Ah, 0ABh,    6, 0F0h,	 12h, 0F8h
		db  0E0h, 0F0h,	 18h, 0B0h,    6, 0F0h,	 12h, 0B2h,    6, 0F0h,	 12h, 0B4h,    6, 0F0h,	 12h, 0F8h
		db  0C1h, 0F0h,	 18h, 0ADh,    6, 0F0h,	 2Ah, 0ADh,    6, 0F0h,	 12h, 0F8h, 0E0h, 0F8h,	0C1h, 0F0h
		db   18h, 0ABh,	   6, 0F0h,  2Ah, 0ABh,	   6, 0F0h,  12h, 0F8h,	0E0h, 0F0h,  18h, 0AFh,	   6, 0F0h
		db   2Ah, 0AFh,	   6, 0F0h,  12h, 0B0h,	   6, 0F0h,  2Ah, 0B0h,	   6, 0F0h,  2Ah, 0F0h,	 18h,  34h
		db  0B5h,  10h,	0B5h,	 4, 0F0h,  14h,	0B4h,	 4,  70h, 0F0h,	 10h, 0FEh,  0Dh, 0FDh,	 0Ah, 0AFh
		db     8, 0F0h,	 10h, 0B0h,    8, 0F0h,	 10h, 0B2h,  20h, 0F8h,	0C1h, 0F0h,  18h, 0FEh,	   1, 0FDh
		db   0Ah, 0ABh,	   6, 0F0h,  2Ah, 0ABh,	   6, 0F0h,  12h, 0F8h,	0E0h, 0F8h,  20h, 0F0h,	 18h, 0FEh
		db   36h, 0FDh,	   9,  37h, 0B9h,  10h,	0B9h,	 6, 0F0h,  12h,	0BAh,  18h, 0F0h,    8,	0B9h,  10h
		db  0F0h,    8,	0B7h,  10h, 0F0h,    8,	0B9h,  10h, 0F0h,    8,	0F8h,  40h, 0F8h, 0C1h,	0F0h,  18h
		db  0FEh,    1,	0FDh,  0Ah, 0ADh,    6,	0F0h,  2Ah, 0ADh,    6,	0F0h,  12h, 0F8h, 0E0h,	0F8h, 0A0h
		db  0F8h,  60h,	0FEh,  0Dh, 0FDh,  0Ah,	0AFh,	 8, 0F0h,  98h,	0AFh,	 4,  70h, 0AEh,	 18h, 0ADh
		db     8, 0F0h,	 98h, 0ADh,    4,  70h,	0ABh,  18h,  70h, 0FEh,	 36h, 0FDh,    9,  37h,	0B9h,  10h
		db  0B9h,    8,	0F0h,  10h, 0BAh,  18h,	0F0h,	 8, 0B9h,  10h,	0F0h,	 8, 0B7h,  10h,	0F0h,	 8
		db  0B9h,  10h,	0F0h,  20h, 0B7h,  18h,	0B9h,  10h, 0B9h,    8,	0F0h,  10h, 0B7h,    8,	0FEh,  0Dh
		db  0FDh,  0Ah,	0B7h,  10h, 0B7h,    4,	0F0h,  14h, 0B5h,  20h,	0F0h,  18h, 0F8h, 0A1h
MUSIC_15_YM3:	db  0FEh,  2Bh,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0B0h,    6,	 30h,  30h,  30h, 0B0h,	   4, 0F0h
					; DATA XREF: ROM:BCD7o
		db   14h, 0B2h,	   4, 0F0h,  0Eh, 0B2h,	   4, 0F0h,  0Eh, 0AFh,	 6Ch, 0F0h,  60h, 0F8h,	   0, 0FEh
		db     1, 0FDh,	 0Ah, 0F8h, 0C2h, 0F0h,	 18h, 0A8h,    6, 0F0h,	 2Ah, 0A8h,    6, 0F0h,	 12h, 0F8h
		db  0E0h, 0F0h,	 18h, 0A8h,    6, 0F0h,	 12h, 0A9h,    6, 0F0h,	 12h, 0ABh,    6, 0F0h,	 12h, 0F8h
		db  0C1h, 0F0h,	 18h, 0A9h,    6, 0F0h,	 2Ah, 0A9h,    6, 0F0h,	 12h, 0F8h, 0E0h, 0F8h,	0C1h, 0F0h
		db   18h, 0A8h,	   6, 0F0h,  2Ah, 0A8h,	   6, 0F0h,  12h, 0F8h,	0E0h, 0F0h,  18h, 0A6h,	   6, 0F0h
		db   2Ah, 0A6h,	   6, 0F0h,  12h, 0A7h,	   6, 0F0h,  2Ah, 0A9h,	   6, 0F0h,  2Ah, 0F0h,	 18h,  2Bh
		db  0ADh,  10h,	0ADh,	 4, 0F0h,  14h,	0ABh,	 4,  70h, 0F0h,	 10h, 0FEh,  0Dh, 0FDh,	 0Ah, 0A9h
		db     8, 0F0h,	 10h, 0A9h,    8, 0F0h,	 10h, 0A9h,  20h, 0F8h,	0C1h, 0F0h,  18h, 0FEh,	   1, 0FDh
		db   0Ah, 0A7h,	   6, 0F0h,  2Ah, 0A7h,	   6, 0F0h,  12h, 0F8h,	0E0h, 0F8h,  20h, 0F0h,	 18h, 0FEh
		db   36h, 0FDh,	   9,  33h, 0B5h,  10h,	0B5h,	 6, 0F0h,  12h,	0B7h,  18h, 0F0h,    8,	0B5h,  10h
		db  0F0h,    8,	0B3h,  10h, 0F0h,    8,	0B5h,  10h, 0F0h,    8,	0F8h,  40h, 0F8h, 0C1h,	0F0h,  18h
		db  0FEh,    1,	0FDh,  0Ah, 0A9h,    6,	0F0h,  2Ah, 0A9h,    6,	0F0h,  12h, 0F8h, 0E0h,	0F8h, 0A0h
		db  0F8h,  60h,	0FCh,	 7, 0FEh,  39h,	0FDh,  0Bh, 0F8h, 0C1h,	0FAh,  40h, 0AFh,    8,	0FAh,  80h
		db   24h,  24h,	0FAh,  40h,  2Fh,  70h,	0FAh,  80h,  24h, 0F8h,	0E0h, 0FAh,  40h, 0AFh,	   8, 0FAh
		db   80h,  24h,	 24h,  24h,  24h,  24h,	0FAh,  40h,  2Fh, 0F0h,	 28h, 0FAh,  80h, 0A4h,	   8,  24h
		db   24h, 0FAh,	 40h,  2Fh, 0FAh,  80h,	 24h,  24h,  24h,  24h,	0FAh,  40h,  2Fh, 0FAh,	 80h,  24h
		db  0FAh,  40h,	 2Fh, 0FAh,  80h,  24h,	 24h,  24h,  24h, 0FAh,	 40h,  2Fh, 0FAh,  80h,	 24h,  24h
		db  0FAh,  40h,	 2Fh, 0F0h,  40h, 0FCh,	   1, 0FAh, 0C0h, 0FEh,	 36h, 0FDh,    9, 0B3h,	 18h, 0B5h
		db   10h, 0B5h,	   8, 0F0h,  10h, 0B7h,	 18h, 0F0h,    8, 0B5h,	 10h, 0F0h,    8, 0B3h,	 10h, 0F0h
		db     8, 0B5h,	 10h, 0F0h,  20h, 0B3h,	 18h, 0B5h,  10h, 0B5h,	   8, 0F0h,  10h, 0B3h,	   8, 0FEh
		db   0Dh, 0FDh,	 0Ah, 0B2h,  10h, 0B2h,	   4, 0F0h,  14h, 0AFh,	 20h, 0F0h,  18h, 0F8h,	0A1h
MUSIC_15_YM4:	db  0FEh,  26h,	0FDh,  0Ch, 0FCh,    1,	0FBh,  2Ch, 0FEh,  26h,	 93h,	 6,  13h,  13h,	 13h,  13h
					; DATA XREF: ROM:BCD9o
		db  0F0h,  12h,	 87h,	 4, 0F0h,  0Eh,	 87h,	 4, 0F0h,  0Eh,	 87h,  6Ch, 0F0h,  10h,	0FDh,  0Dh
		db   93h,    8,	 11h, 0F0h,  10h,  90h,	   8, 0F0h,  10h,  8Eh,	   8, 0F0h,  10h, 0FDh,	 0Ch, 0F8h
		db     0, 0F8h,	0C2h,  8Ch,  18h,  18h,	 95h,	 4,  70h,  15h,	 70h,  15h,  70h,  90h,	   8,  70h
		db   13h, 0F8h,	0E0h,  8Ch,  0Ch,  70h,	 8Ch,  18h,  0Eh,  10h,	   5,  11h,  8Eh,    4,	 70h,  0Eh
		db   70h,  0Eh,	 70h,  89h,    8,  70h,	 0Ch,  85h,  18h,  11h,	 8Eh,	 4,  70h,  0Eh,	 70h,  0Eh
		db   70h,  89h,	   8,  70h,  0Eh, 0F8h,	0C1h,  8Ch,  18h,  18h,	 95h,	 4,  70h,  15h,	 70h,  15h
		db   70h,  90h,	   8,  70h,  13h, 0F8h,	0E0h,  87h,  18h,  13h,	 8Eh,	 4,  70h,  0Eh,	 70h,  0Eh
		db   70h,  8Bh,	   8,  70h,  0Eh,  11h,	0F0h,  28h,  93h,    8,	0F0h,  28h,  8Ch,  18h,	 18h,  95h
		db     4,  70h,	 15h,  70h,  15h,  70h,	 90h,	 8,  70h,  13h,	0F0h,  10h,  87h,    8,	0F0h,  10h
		db   87h,    8,	0F0h,  10h,  87h,  20h,	0F8h, 0C1h,  8Ch,  18h,	 18h,  96h,    4,  70h,	 16h,  70h
		db   16h,  70h,	 91h,	 8,  70h,  13h,	0F8h, 0E0h, 0F8h, 0C1h,	 8Ch,  18h,  18h,  96h,	   4,  70h
		db   16h,  70h,	 16h,  70h,  8Fh,    8,	 70h,  11h, 0F8h, 0E0h,	 85h,  18h,  11h,  8Fh,	   4,  70h
		db   0Fh,  70h,	 0Fh,  70h,  8Ah,    8,	 70h,  0Ch,  85h,  18h,	 11h,  8Fh,    4,  70h,	 0Fh,  70h
		db   0Fh,  70h,	 8Ah,	 8,  70h,  0Bh,	0F8h, 0C1h,  8Ch,  18h,	 18h,  96h,    4,  70h,	 16h,  70h
		db   16h,  70h,	 8Fh,	 8,  70h,  11h,	0F8h, 0E0h,  87h,    8,	0F0h,  58h, 0F0h,  40h,	 93h,	 8
		db   92h,  18h,	 91h,	 8, 0F0h,  58h,	0F0h,  40h,  91h,    8,	 8Fh,  18h, 0F8h,  20h,	 8Ch,  18h
		db   18h,  96h,	   4,  70h,  16h,  70h,	 16h,  70h,  91h,    8,	 70h, 0F8h,  40h,  93h,	   8, 0F8h
		db  0A0h, 0F8h,	 60h,  93h,    8, 0F8h,	0A0h, 0F8h,  80h,  92h,	   8,  93h,  10h,  87h,	   4, 0F0h
		db   14h,  87h,	 38h, 0F8h, 0A1h
MUSIC_15_YM5:	db  0FCh,    1,	0FBh,  2Ch, 0F0h,  54h,	0FEh,  3Eh, 0FDh,  0Bh,	 9Fh,  18h, 0FEh,  3Dh,	0FDh,  0Ch
					; DATA XREF: ROM:BCDBo
		db  0A1h,    6,	0FDh,	 9,  21h, 0FDh,	 0Ch, 0A1h,    4, 0FDh,	   9,  21h,  21h,  21h,	 21h,  21h
		db  0FDh,  0Ch,	0A1h,	 6, 0FDh,    9,	 21h,  21h, 0FDh,  0Ch,	 21h, 0FDh,    9,  21h,	 21h, 0FDh
		db   0Ch,  21h,	0FDh,	 9,  21h, 0A1h,	 40h, 0A1h,    8, 0FEh,	 3Eh, 0FDh,  0Ah, 0A1h,	 18h, 0F8h
		db     0, 0F8h,	0C8h, 0FEh,  3Dh, 0FDh,	 0Ch, 0A1h,  10h, 0FDh,	 0Ah, 0A1h,    8, 0FEh,	 3Eh, 0FDh
		db   0Ah, 0A1h,	 18h, 0FEh,  3Dh, 0FDh,	 0Ch, 0A1h,  10h, 0FDh,	 0Ah, 0A1h,    8, 0FEh,	 3Eh, 0FDh
		db   0Ah,  21h,	0FEh,  3Dh, 0FDh,  0Ah,	 21h,  21h, 0F8h, 0E0h,	0FEh,  3Dh, 0FDh,  0Ch,	0A1h,  30h
		db  0A1h,  10h,	0FDh,  0Ah, 0A1h,    8,	0FEh,  3Eh, 0FDh,  0Ah,	0A1h,  18h, 0FEh,  3Dh,	0FDh,  0Ch
		db  0A1h,  10h,	0FDh,  0Ah, 0A1h,    8,	0FEh,  3Eh, 0FDh,  0Ah,	0A1h,  18h, 0FEh,  3Dh,	0FDh,  0Ch
		db  0A1h,  10h,	0FDh,  0Ah, 0A1h,    8,	0FEh,  3Eh, 0FDh,  0Ah,	 21h, 0FEh,  3Dh, 0FDh,	 0Ah,  21h
		db   21h, 0FEh,	 3Dh, 0FDh,  0Ch, 0A1h,	 60h, 0F8h, 0C3h, 0FEh,	 3Dh, 0FDh,  0Ch, 0A1h,	 10h, 0FDh
		db   0Ah, 0A1h,	   8, 0FEh,  3Eh, 0FDh,	 0Ah, 0A1h,  18h, 0FEh,	 3Dh, 0FDh,  0Ch, 0A1h,	   8, 0FDh
		db   0Ah,  21h,	 21h, 0FEh,  3Eh, 0FDh,	 0Ah, 0A1h,  10h, 0FEh,	 3Dh, 0FDh,  0Ah, 0A1h,	   8, 0FEh
		db   3Dh, 0FDh,	 0Ch, 0A1h,  10h, 0FDh,	 0Ah, 0A1h,    8, 0FEh,	 3Eh, 0FDh,  0Ah, 0A1h,	 18h, 0FEh
		db   3Dh, 0FDh,	 0Ch, 0A1h,  10h, 0FDh,	 0Ah, 0A1h,    8, 0FEh,	 3Eh, 0FDh,  0Ah,  21h,	0FEh,  3Dh
		db  0FDh,  0Ah,	 21h,  21h, 0F8h, 0E0h,	0FEh,  0Dh, 0FDh,  0Ah,	0ABh,	 8, 0F0h,  98h,	0ABh,	 4
		db   70h, 0AAh,	 18h, 0A9h,    8, 0F0h,	 98h, 0A9h,    4,  70h,	0A7h,  18h, 0FEh,  3Dh,	0FDh,  0Ch
		db  0A1h,  10h,	0FDh,  0Ah, 0A1h,    8,	0FEh,  3Eh, 0FDh,  0Ah,	0A1h,  18h, 0FEh,  3Dh,	0FDh,  0Ch
		db  0A1h,    8,	0FDh,  0Ah,  21h,  21h,	0FEh,  3Eh, 0FDh,  0Ah,	0A1h,  10h, 0FEh,  3Dh,	0FDh,  0Ah
		db  0A1h,    8,	0FEh,  3Dh, 0FDh,  0Ch,	0A1h,  10h, 0FDh,  0Ah,	0A1h,	 8, 0FEh,  3Eh,	0FDh,  0Ah
		db  0A1h,  18h,	0FEh,  3Dh, 0FDh,  0Ch,	0A1h,  10h, 0FDh,  0Ah,	0A1h,	 8, 0FEh,  3Eh,	0FDh,  0Ah
		db   21h, 0FEh,	 3Dh, 0FDh,  0Ah,  21h,	 21h, 0FEh,  3Dh, 0FDh,	 0Ch, 0A1h,  10h, 0FDh,	 0Ah, 0A1h
		db     8, 0FEh,	 3Eh, 0FDh,  0Ah, 0A1h,	 18h, 0FEh,  3Dh, 0FDh,	 0Ch, 0A1h,    8, 0FDh,	 0Ah,  21h
		db   21h, 0FEh,	 3Eh, 0FDh,  0Ah, 0A1h,	 10h, 0FEh,  3Dh, 0FDh,	 0Ah, 0A1h,    8, 0FDh,	 0Ch, 0A1h
		db   10h, 0A1h,	 18h,  21h, 0A1h,    8,	0FEh,  3Eh, 0FDh,  0Ah,	0A1h,  18h, 0F8h, 0A1h
MUSIC_15_YM6:	db   81h,    6,	   1,	 1,    1,  81h,	 18h,  80h,  12h,    0,	 85h,  3Ch, 0FAh,  80h,	 82h,  12h
					; DATA XREF: ROM:BCDDo
		db  0FAh, 0C0h,	   3, 0FAh,  40h,  84h,	 0Ch, 0FAh, 0C0h,  80h,	 60h, 0F8h,    0, 0F8h,	0C2h,  80h
		db   18h,    1,	   0,	 1, 0F8h, 0E0h,	 80h,  18h,    1,    1,	 81h,  10h,  80h,    8,	0F8h, 0C2h
		db   80h,  18h,	   1,	 0,    1, 0F8h,	0E0h,  80h,  10h, 0FAh,	 40h,  84h,    8, 0FAh,	0C0h,  81h
		db   10h, 0FAh,	 80h,  82h,  18h, 0FAh,	0C0h,  80h,    8,  81h,	 10h,  80h,    8,  80h,	 18h,  81h
		db   10h,  80h,	 18h,  81h,    8,    0,	   1,	 1,  81h,  30h,	   0,  80h,  18h,    1,	   0,	 1
		db   80h,  10h,	 81h,  18h,    1,  81h,	   8, 0FAh,  80h,  82h,	 10h, 0FAh,  40h,  84h,	   8, 0F8h
		db  0C2h, 0FAh,	0C0h,  80h,  18h,    1,	 80h,  10h,  80h,    8,	 81h,  18h,    0,    1,	 80h,	 8
		db     0,    0,	 81h,  18h, 0F8h, 0E0h,	 80h,  18h,    1,  80h,	 10h,  80h,    8,  81h,	 18h,  80h
		db   10h, 0FAh,	 80h,  82h,  18h, 0FAh,	0C0h,	 3, 0FAh,  40h,	 84h,	 8, 0FAh, 0C0h,	   1,	 1
		db     1, 0F8h,	0C1h,  81h, 0A0h,  81h,	   8,  81h,  18h, 0F8h,	0E0h,  80h,  18h,    1,	 80h,  10h
		db   80h,    8,	 81h,  18h,    0,    1,	 80h,	 8,    0,    0,	 81h,  18h,    0,    1,	 80h,  10h
		db   80h,    8,	 81h,  18h,  81h,  10h,	 81h,  18h,    1,  80h,	   8,  81h,  18h, 0F8h,	0A1h
MUSIC_15_PSG1:	db  0FDh,    0,	0FAh, 0C4h, 0F0h,  60h,	 70h, 0FAh, 0BCh, 0FDh,	   0, 0FFh,    0,    0
					; DATA XREF: ROM:BCDFo
MUSIC_15_PSG2:	db  0FFh,    0,	   0	; DATA XREF: ROM:BCE1o
MUSIC_15_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:BCE3o	ROM:BCE5o
MUSIC_1C:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 176
		dw MUSIC_1C_YM1
		dw MUSIC_1C_YM2
		dw MUSIC_1C_YM3
		dw MUSIC_1C_YM4
		dw MUSIC_1C_YM5
		dw MUSIC_1C_YM6
		dw MUSIC_1C_PSG1
		dw MUSIC_1C_PSG2
		dw MUSIC_1C_PSG3
		dw MUSIC_1C_PSG3
MUSIC_1C_YM1:	db  0FAh,  80h,	0F8h,	 0, 0FEh,  17h,	0FDh,  0Ch, 0FCh,    1,	0FBh,	 0, 0F8h, 0C1h,	0ABh,  0Ch
					; DATA XREF: ROM:C47Bo
		db  0ABh,    6,	0A9h,  0Ch, 0A5h,    6,	0ADh,  12h,  9Fh,    6,	 2Bh, 0A9h,  0Ch, 0A5h,	   6, 0ADh
		db   0Ch, 0F8h,	0E0h, 0F0h,    6,  25h,	 26h,  28h,  29h,  2Bh,	 2Dh,  2Fh,  31h,  29h,	0FDh,  0Bh
		db   31h,  29h,	0FDh,  0Ah,  31h,  29h,	0FDh,	 9,  31h,  29h,	0FDh,	 8,  31h,  29h,	0FDh,	 7
		db   31h,  29h,	0FDh,	 6,  31h,  29h,	 31h,  29h, 0FDh,  0Bh,	0F8h, 0C1h, 0ABh,  0Ch,	0ABh,	 6
		db  0A9h,  0Ch,	0A5h,	 6, 0ADh,  12h,	 9Fh,	 6,  2Bh, 0A9h,	 0Ch, 0A5h,    6, 0ADh,	 0Ch, 0F8h
		db  0E0h, 0AFh,	 0Ch, 0AFh,    6, 0ADh,	 0Ch, 0A9h,    6, 0B1h,	 12h, 0A3h,    6,  2Fh,	0ADh,  0Ch
		db  0A9h,    6,	0B1h,  0Ch,  2Fh, 0AFh,	   6, 0ADh,  0Ch, 0A9h,	   6, 0B1h,  0Ch, 0FDh,	 0Ch, 0A3h
		db   30h, 0ADh,	   6,  25h, 0FDh,  0Bh,	 2Dh,  25h, 0FDh,  0Ah,	 2Dh,  25h, 0FDh,    9,	 2Dh,  25h
		db  0FDh,    8,	 2Dh,  25h, 0FDh,    7,	 2Dh,  25h, 0FDh,    6,	 2Dh,  25h,  2Dh,  25h,	0FDh,  0Ch
		db   2Bh,  23h,	0FDh,  0Bh,  2Bh,  23h,	0FDh,  0Ah,  2Bh,  23h,	0FDh,	 9,  2Bh,  23h,	0FDh,	 8
		db   2Bh,  23h,	0FDh,	 7,  2Bh,  23h,	0FDh,	 6,  2Bh,  23h,	 2Bh,  23h, 0FDh,  0Ch,	0A6h,  3Ch
		db  0AAh,    6,	0A8h,  0Ch, 0A4h,    6,	0ACh,  12h,  9Eh,    6,	 2Ah, 0A8h,  0Ch, 0A4h,	   6, 0ACh
		db   12h, 0FAh,	 40h, 0FDh,  0Bh, 0A6h,	   6,  22h,  24h,  1Ch,	 20h,  24h,  20h,  22h,	 26h,  22h
		db   24h,  1Ch,	 20h,  24h, 0A0h,  0Ch,	0FAh,  80h, 0FDh,  0Ch,	0A9h,	 6,  29h,  29h,	 29h,  29h
		db   29h,  29h,	0F8h, 0A1h
MUSIC_1C_YM2:	db  0FAh,  40h,	0F8h,	 0, 0FEh,  17h,	0FDh,  0Bh, 0FCh,    1,	0FBh,	 0, 0F8h, 0C3h,	0A3h,	 6
					; DATA XREF: ROM:C47Do
		db   27h,  23h,	 25h,  1Dh,  21h,  25h,	 21h, 0F8h, 0E0h,  9Ah,	   6, 0FDh,  0Ch,  21h,	 23h,  25h
		db   26h,  28h,	 29h,  2Bh,  2Dh,  28h,	0FDh,  0Bh,  2Dh,  28h,	0FDh,  0Ah,  2Dh,  28h,	0FDh,	 9
		db   2Dh,  28h,	0FDh,	 8,  2Dh,  28h,	0FDh,	 7,  2Dh,  28h,	0FDh,	 6,  2Dh,  28h,	 2Dh,  28h
		db  0FDh,  0Ah,	0F8h, 0C3h, 0A3h,    6,	 27h,  23h,  25h,  1Dh,	 21h,  25h,  21h, 0F8h,	0E0h, 0F8h
		db  0C2h, 0A7h,	   6,  2Bh,  27h,  29h,	 20h,  25h,  29h,  25h,	0F8h, 0E0h, 0FDh,  0Bh,	0ABh,  30h
		db  0A9h,    6,	 24h, 0FDh,  0Ah,  29h,	 24h, 0FDh,    9,  29h,	 24h, 0FDh,    8,  29h,	 24h, 0FDh
		db     7,  29h,	 24h, 0FDh,    6,  29h,	 24h, 0FDh,    5,  29h,	 24h,  29h,  24h, 0FDh,	 0Bh,  27h
		db   22h, 0FDh,	 0Ah,  27h,  22h, 0FDh,	   9,  27h,  22h, 0FDh,	   8,  27h,  22h, 0FDh,	   7,  27h
		db   22h, 0FDh,	   6,  27h,  22h, 0FDh,	   5,  27h,  22h,  27h,	 22h, 0FDh,  0Bh,  9Eh,	 3Ch, 0FAh
		db  0C0h, 0FEh,	 0Fh, 0FDh,  0Ah, 0FCh,	   3, 0B6h,    6,  34h,	 70h,  30h,  38h, 0F0h,	 0Ch, 0AAh
		db     6,  36h,	 34h,  70h,  30h,  38h,	0F0h,  0Ch, 0FDh,    9,	0B2h,	 6,  2Eh,  30h,	 28h,  2Ch
		db   30h,  2Ch,	 2Eh,  32h,  2Eh,  30h,	 28h,  2Ch,  30h,  2Ch,	 70h, 0FCh,    1, 0FEh,	 17h, 0FDh
		db   0Bh, 0FAh,	 40h,  23h,  23h,  23h,	 23h,  23h,  23h,  23h,	0F8h, 0A1h
MUSIC_1C_YM3:	db  0F8h,    0,	0FEh,  17h, 0FDh,  0Bh,	0FCh,	 1, 0FBh,    0,	0F8h, 0C3h,  93h,  12h,	 15h,  91h
					; DATA XREF: ROM:C47Fo
		db   0Ch, 0F8h,	0E0h, 0FDh,  0Ch,  9Ah,	 30h,  95h,    6, 0FDh,	 0Bh,  21h, 0FDh,  0Ah,	 15h,  21h
		db  0FDh,    9,	 15h,  21h, 0FDh,    8,	 15h,  21h, 0FDh,    7,	 15h,  21h, 0FDh,    6,	 15h,  21h
		db  0FDh,    5,	 15h,  21h,  15h,  21h,	0FDh,  0Bh, 0F8h, 0C3h,	 93h,  12h,  15h,  91h,	 0Ch, 0F8h
		db  0E0h, 0F8h,	0C2h,  97h,  12h,  19h,	 95h,  0Ch, 0F8h, 0E0h,	0FDh,  0Ch,  97h,  30h,	 95h,	 6
		db  0FDh,  0Bh,	 21h, 0FDh,  0Ah,  15h,	 21h, 0FDh,    9,  15h,	 21h, 0FDh,    8,  15h,	 21h, 0FDh
		db     7,  15h,	 21h, 0FDh,    6,  15h,	 21h, 0FDh,    5,  15h,	 21h,  15h,  21h, 0FDh,	 0Ch,  0Dh
		db  0FDh,  0Bh,	 19h, 0FDh,  0Ah,  0Dh,	 19h, 0FDh,    9,  0Dh,	 19h, 0FDh,    8,  0Dh,	 19h, 0FDh
		db     7,  0Dh,	 19h, 0FDh,    6,  0Dh,	 19h, 0FDh,    5,  0Dh,	 19h,  0Dh,  19h, 0FDh,	 0Ch,  8Eh
		db   60h, 0F0h,	 6Ch,  92h,    6,  94h,	 0Ch,  94h,    6,  90h,	 12h,  99h,    6,  19h,	 19h,  19h
		db   19h,  19h,	 19h, 0F8h, 0A1h
MUSIC_1C_YM4:	db  0F8h,    0,	0F0h, 0C6h, 0FEh,  0Fh,	0FDh,  0Ah, 0FCh,    3,	0FBh,	 0, 0ADh,    6,	 2Fh,  31h
					; DATA XREF: ROM:C481o
		db   32h,  34h,	 35h,  37h,  39h,  34h,	0FDh,	 9,  39h,  34h,	0FDh,	 8,  39h,  34h,	0FDh,	 7
		db   39h,  34h,	0FDh,	 6,  39h,  34h,	0FDh,	 5,  39h,  34h,	0FDh,	 4,  39h,  34h,	0FEh,  2Ch
		db  0FDh,  0Dh,	0FCh,	 1, 0FBh,  2Ch,	0B5h,	 4,  31h,  2Dh,	0F8h, 0C1h, 0AFh,  12h,	0B1h,	 6
		db  0F0h,  0Ch,	0B5h,	 4,  31h,  2Dh,	0F8h, 0E0h, 0AFh,    4,	 31h,  35h,  34h,  31h,	 32h,  34h
		db   39h,  38h,	 35h,  38h,  3Ch, 0BBh,	 1Dh, 0F0h,    7, 0B9h,	   4,  35h,  31h, 0F8h,	0C1h, 0B3h
		db   12h, 0B5h,	   4, 0F0h,  0Eh, 0B9h,	   4,  35h,  31h, 0F8h,	0E0h, 0B3h,    4,  35h,	 39h,  38h
		db   35h,  36h,	 38h,  3Dh,  3Ch,  39h,	 3Ch,  40h, 0FCh,    7,	0BFh,  0Ch,  3Bh,  37h,	 33h, 0FCh
		db     1, 0B1h,	   3,  33h,  31h,  33h,	0FDh,  0Ch,  31h,  33h,	 31h,  33h, 0FDh,  0Bh,	 31h,  33h
		db   31h,  33h,	0FDh,  0Ah,  31h,  33h,	 31h,  33h, 0FDh,    9,	 31h,  33h,  31h,  33h,	0FDh,	 8
		db   31h,  33h,	 31h,  33h, 0FDh,    7,	 31h,  33h,  31h,  33h,	0FDh,  0Dh,  31h,  33h,	 35h,  39h
		db   2Fh,  31h,	 2Fh,  31h, 0FDh,  0Ch,	 2Fh,  31h,  2Fh,  31h,	0FDh,  0Bh,  2Fh,  31h,	 2Fh,  31h
		db  0FDh,  0Ah,	 2Fh,  31h,  2Fh,  31h,	0FDh,	 9,  2Fh,  31h,	 2Fh,  31h, 0FDh,    8,	 2Fh,  31h
		db   2Fh,  31h,	0FDh,	 7,  2Fh,  31h,	 2Fh,  31h, 0FDh,    6,	 2Fh,  31h,  2Fh, 0F0h,	 0Fh, 0FDh
		db   0Dh, 0B2h,	   4,  34h,  3Bh, 0B9h,	   5, 0F0h,    7, 0B7h,	   4,  39h,  40h, 0FDh,	 0Ch, 0BEh
		db   54h, 0F0h,	   9, 0FCh,  80h, 0B4h,	   3, 0FCh,    1, 0B2h,	 60h, 0F0h,  18h, 0FDh,	 0Dh, 0AFh
		db     3,  31h,	 35h,  38h,  37h,  38h,	 3Bh,  3Fh, 0F8h, 0A1h
MUSIC_1C_YM5:	db  0F8h,    0,	0F9h,	 0, 0FAh, 0C0h,	0FEh,  0Fh, 0FDh,  0Ah,	0FCh,	 3, 0FBh,    0,	0F8h, 0C1h
					; DATA XREF: ROM:C483o
		db  0B7h,    6,	 70h,  37h,  35h,  70h,	 31h,  39h, 0F0h,  0Ch,	0ABh,	 6,  37h,  35h,	 70h,  31h
		db   39h,  70h,	0F8h, 0E0h, 0F0h,    6,	 31h,  32h,  34h,  35h,	 37h,  39h,  3Bh,  3Dh,	 35h, 0FDh
		db     9,  3Dh,	 35h, 0FDh,    8,  3Dh,	 35h, 0FDh,    7,  3Dh,	 35h, 0FDh,    6,  3Dh,	 35h, 0FDh
		db     5,  3Dh,	 35h, 0FDh,    4,  3Dh,	0B5h,	 9, 0F9h,  20h,	0FAh,  40h, 0FEh,  2Ch,	0FDh,  0Bh
		db  0FCh,    1,	0FBh,  2Ch, 0B5h,    4,	 31h,  2Dh, 0F8h, 0C1h,	0AFh,  12h, 0B1h,    6,	0F0h,  0Ch
		db  0B5h,    4,	 31h,  2Dh, 0F8h, 0E0h,	0AFh,	 4,  31h,  35h,	 34h,  31h,  32h,  34h,	 39h,  38h
		db   35h,  38h,	 3Ch, 0BBh,  1Dh, 0F0h,	   7, 0B9h,    4,  35h,	 31h, 0F8h, 0C1h, 0B3h,	 12h, 0B5h
		db     4, 0F0h,	 0Eh, 0B9h,    4,  35h,	 31h, 0F8h, 0E0h, 0B3h,	   4,  35h,  39h,  38h,	 35h,  36h
		db   38h,  3Dh,	 3Ch,  39h,  3Ch,  40h,	0FCh,	 7, 0BFh,  0Ch,	 3Bh,  37h,  33h, 0FCh,	   1, 0B1h
		db     3,  33h,	 31h,  33h, 0FDh,  0Ah,	 31h,  33h,  31h,  33h,	0FDh,	 9,  31h,  33h,	 31h,  33h
		db  0FDh,    8,	 31h,  33h,  31h,  33h,	0FDh,	 7,  31h,  33h,	 31h,  33h, 0FDh,    6,	 31h,  33h
		db   31h,  33h,	0FDh,	 5,  31h,  33h,	 31h,  33h, 0FDh,  0Bh,	 31h,  33h,  35h,  39h,	 2Fh,  31h
		db   2Fh,  31h,	0FDh,  0Ah,  2Fh,  31h,	 2Fh,  31h, 0FDh,    9,	 2Fh,  31h,  2Fh,  31h,	0FDh,	 8
		db   2Fh,  31h,	 2Fh,  31h, 0FDh,    7,	 2Fh,  31h,  2Fh,  31h,	0FDh,	 6,  2Fh,  31h,	 2Fh,  31h
		db  0FDh,    5,	 2Fh,  31h,  2Fh,  31h,	0FDh,	 4,  2Fh,  31h,	 2Fh, 0FEh,  17h, 0FDh,	 0Bh,  9Ah
		db   0Fh, 0FEh,	 2Ch, 0FDh,  0Bh, 0B2h,	   4,  34h,  3Bh, 0B9h,	   5, 0F0h,    7, 0B7h,	   4,  39h
		db   40h, 0FDh,	 0Ah, 0BEh,  54h, 0F0h,	   9, 0FCh,  80h, 0B4h,	   3, 0FCh,    1, 0B2h,	 60h, 0F0h
		db   18h, 0FDh,	 0Bh, 0AFh,    3,  31h,	 35h,  38h,  37h,  38h,	 3Bh, 0F8h, 0A1h
MUSIC_1C_YM6:	db  0FFh,    0,	   0	; DATA XREF: ROM:C485o
MUSIC_1C_PSG1:	db  0F8h,    0,	0FDh,	 0, 0F8h, 0D7h,	0F0h,  30h, 0F8h, 0E0h,	0F0h,	 6, 0FDh,  19h,	0FCh,	 3
					; DATA XREF: ROM:C487o
		db  0F8h, 0C6h,	0A9h,	 6, 0F8h, 0E0h,	0F8h, 0A1h
MUSIC_1C_PSG2:	db  0F8h,    0,	0FDh,	 0, 0F8h, 0D7h,	0F0h,  30h, 0F8h, 0E0h,	0F0h,	 6, 0FDh,  19h,	0FCh,	 3
					; DATA XREF: ROM:C489o
		db  0F8h, 0C6h,	0A8h,	 6, 0F8h, 0E0h,	0F8h, 0A1h
MUSIC_1C_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:C48Bo	ROM:C48Do
MUSIC_10:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 202
		dw MUSIC_10_YM1
		dw MUSIC_10_YM2
		dw MUSIC_10_YM3
		dw MUSIC_10_YM4
		dw MUSIC_10_YM5
		dw MUSIC_10_YM6
		dw MUSIC_10_PSG1
		dw MUSIC_10_PSG2
		dw MUSIC_10_PSG3
		dw MUSIC_10_PSG3
MUSIC_10_YM1:	db  0FEh,    8,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	0F8h,  20h, 0ABh,  39h,	0F0h,  0Ch
					; DATA XREF: ROM:C975o
		db  0ABh,    6,	0F0h,  12h, 0ABh,  39h,	0F0h,  0Ch, 0ABh,    6,	0F0h,  12h, 0AEh,  39h,	0F0h,  0Ch
		db  0AEh,    6,	0F0h,  12h, 0ADh,  5Dh,	0ABh,  39h, 0F0h,  0Ch,	0ABh,	 6, 0F0h,  12h,	0F8h,  40h
		db  0ABh,  2Dh,	0A9h,  30h, 0A9h,  39h,	0F0h,  0Ch, 0A9h,    6,	0F0h,  12h, 0ABh,  2Dh,	0ABh,  30h
		db  0F8h, 0A0h,	0F8h,  60h, 0A9h,  39h,	0F0h,  0Ch, 0A9h,    6,	0F0h,  12h, 0ACh,  39h,	0F0h,  0Ch
		db  0ACh,    6,	0F0h,  12h, 0AEh,  39h,	0F0h,  0Ch, 0AEh,    6,	0F0h,  12h, 0F8h, 0A1h
MUSIC_10_YM2:	db  0FEh,  26h,	0FDh,  0Eh, 0FCh,    1,	0FBh,  2Ch, 0F0h,    9,	0F0h,  5Dh,  70h, 0F8h,	   0, 0F0h
					; DATA XREF: ROM:C977o
		db   5Dh,  70h,	 70h,  70h,  70h,  70h,	0F0h,  0Ch, 0FEh,  0Dh,	0FDh,  0Ch,  30h,  32h,	0B4h,  18h
		db  0B7h,  0Ch,	 39h, 0B7h,  39h, 0F0h,	 0Ch,  37h,  39h, 0BAh,	 39h, 0F0h,  0Ch,  35h,	 37h, 0B9h
		db   51h, 0F0h,	 0Ch, 0BCh,  45h, 0BAh,	 0Ch,  39h, 0BAh,  21h,	0B9h,	 6,  37h, 0B5h,	 30h, 0B8h
		db   21h, 0B3h,	 0Ch, 0B1h,    6, 0B3h,	 2Ah, 0BAh,  21h, 0B5h,	 0Ch, 0B3h,    6, 0BCh,	   0, 0FCh
		db   85h, 0BEh,	 2Ah, 0FCh, 0FFh, 0FCh,	 80h, 0BCh,  66h, 0FBh,	 20h, 0FCh,    1, 0BCh,	 5Dh, 0FBh
		db   2Ch, 0F8h,	0A1h
MUSIC_10_YM3:	db  0F9h,  20h,	0F0h,	 6, 0FAh,  40h,	0FEh,	 8, 0FDh,    9,	0FCh,	 1, 0FBh,  2Ch,	0ABh,  39h
					; DATA XREF: ROM:C979o
		db  0F0h,  0Ch,	0ABh,	 6, 0F0h,  12h,	0ABh,  39h, 0F0h,  0Ch,	0ABh,	 6, 0F0h,  12h,	0F8h,	 0
		db  0FAh,  40h,	0FEh,	 8, 0FDh,    9,	0AEh,  39h, 0F0h,  0Ch,	0AEh,	 6, 0F0h,  12h,	0ADh,  5Dh
		db  0ABh,  39h,	0F0h,  0Ch, 0ABh,    6,	0F0h,  12h, 0ABh,  2Dh,	0A9h,  30h, 0A9h,  39h,	0F0h,  0Ch
		db  0A9h,    6,	0F0h,  12h, 0ABh,  2Dh,	0ABh,  30h, 0F0h,  15h,	0FAh,  80h, 0FEh,  0Dh,	0FDh,  0Ah
		db  0B0h,  0Ch,	 32h, 0B4h,  18h, 0B7h,	 0Ch,  39h, 0B7h,  39h,	0F0h,  0Ch,  37h,  39h,	0BAh,  39h
		db  0F0h,  0Ch,	 35h,  37h, 0B9h,  51h,	0F0h,  0Ch, 0BCh,  45h,	0BAh,  0Ch,  39h, 0BAh,	 21h, 0B9h
		db     6,  37h,	0B5h,  30h, 0B8h,  21h,	0B3h,  0Ch, 0B1h,    6,	0B3h,  2Ah, 0BAh,  21h,	0B5h,  0Ch
		db  0B3h,    6,	0BCh,	 0, 0FCh,  85h,	0BEh,  2Ah, 0FCh, 0FFh,	0FCh,  80h, 0BCh,  66h,	0FBh,  20h
		db  0FCh,    1,	0BCh,  54h, 0FBh,  2Ch,	0F8h, 0A1h
MUSIC_10_YM4:	db  0FEh,  20h,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	0F8h,  20h, 0F8h, 0C3h,	 9Dh,  15h
					; DATA XREF: ROM:C97Bo
		db   9Dh,    3,	 70h,  1Dh,  70h,  9Dh,	 0Ch,  9Dh,    3,  70h,	 1Dh,  70h,  9Dh,  0Ch,	 9Dh,	 3
		db   70h,  1Dh,	 70h,  1Dh,  70h,  1Dh,	 70h, 0F8h, 0E0h, 0F8h,	 40h,  9Bh,  15h,  9Bh,	   3,  70h
		db   1Bh,  70h,	 9Bh,  0Ch,  9Bh,    3,	 70h,  1Bh,  70h,  9Bh,	 0Ch,  9Bh,    3,  70h,	 1Bh,  70h
		db   1Bh,  70h,	 1Bh,  70h,  9Ah,  15h,	 9Ah,	 3,  70h,  1Ah,	 70h,  9Ah,  0Ch,  9Ah,	   3,  70h
		db   1Ah,  70h,	 9Ah,  0Ch,  9Ah,    3,	 70h,  1Ah,  70h,  1Ah,	 70h,  1Ah,  70h,  99h,	 15h,  99h
		db     3,  70h,	 19h,  70h,  99h,  0Ch,	 99h,	 3,  70h,  19h,	 70h,  99h,  0Ch,  99h,	   3,  70h
		db   19h,  70h,	 19h,  70h,  19h,  70h,	 98h,  15h,  98h,    3,	 70h,  18h,  70h,  98h,	 0Ch,  98h
		db     3,  70h,	 18h,  70h,  98h,  0Ch,	 98h,	 3,  70h,  18h,	 70h,  18h,  70h,  18h,	 70h, 0F8h
		db  0A0h, 0F8h,	 60h,  9Bh,  15h,  9Bh,	   3,  70h,  1Bh,  70h,	 9Bh,  0Ch,  9Bh,    3,	 70h,  1Bh
		db   70h,  9Bh,	 0Ch,  9Bh,    3,  70h,	 1Bh,  70h,  1Bh,  70h,	 1Bh,  70h,  9Ah,  15h,	 9Ah,	 3
		db   70h,  1Ah,	 70h,  9Ah,  0Ch,  9Ah,	   3,  70h,  1Ah,  70h,	 9Ah,  0Ch,  9Ah,    3,	 70h,  1Ah
		db   70h,  1Ah,	 70h,  1Ah,  70h,  99h,	 15h,  99h,    3,  70h,	 19h,  70h,  99h,  0Ch,	 99h,	 3
		db   70h,  19h,	 70h,  99h,  0Ch,  99h,	   3,  70h,  19h,  70h,	 19h,  70h,  19h,  70h,	 9Bh,  15h
		db   9Bh,    3,	 70h,  1Bh,  70h,  9Bh,	 0Ch,  9Bh,    3,  70h,	 1Bh,  70h,  9Bh,  0Ch,	 9Bh,	 3
		db   70h,  1Bh,	 70h,  1Bh,  70h,  1Bh,	 70h, 0F8h, 0A1h
MUSIC_10_YM5:	db  0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	0FEh,  3Eh, 0FDh,  0Ch,	 96h,  15h, 0FEh,  3Dh,	0FDh,  0Dh
					; DATA XREF: ROM:C97Do
		db   92h,    6,	0FDh,  0Bh,  12h, 0FEh,	 3Eh, 0FDh,  0Ah,  96h,	 0Ch, 0FEh,  3Dh, 0FDh,	 0Dh,  92h
		db     6, 0FDh,	 0Bh,  12h, 0FEh,  3Eh,	0FDh,  0Ah,  96h,  0Ch,	0FEh,  3Dh, 0FDh,  0Dh,	 92h,	 6
		db  0FDh,  0Bh,	 12h,  12h,  12h, 0F8h,	0A1h
MUSIC_10_YM6:	db  0F8h, 0C4h,	 80h,  45h,  80h,  18h,	0F8h, 0E0h,  80h,  2Dh,	 80h,  30h,  80h,  45h,	 80h,  18h
					; DATA XREF: ROM:C97Fo
		db   80h,  2Dh,	 80h,  24h,  81h,    6,	   1, 0F8h,    0,  85h,	 21h,  81h,  18h,    0,	 81h,  0Ch
		db  0F8h, 0C5h,	 80h,  21h,  81h,  18h,	   0,  81h,  0Ch, 0F8h,	0E0h,  80h,  15h, 0FAh,	 80h,  82h
		db   18h, 0FAh,	0C0h,  83h,    6, 0FAh,	 40h,	 4, 0FAh, 0C0h,	   0,	 1,    1,    1,	 81h,  0Ch
		db  0F8h, 0C4h,	 80h,  21h,  81h,  18h,	   0,  81h,  0Ch, 0F8h,	0E0h,  80h,  21h,  81h,	 0Ch,  80h
		db   18h,  80h,	 0Ch,	 1,  80h,  21h,	 81h,  18h,    0,  81h,	 0Ch,  80h,  21h,  81h,	 0Ch,  80h
		db   18h,  80h,	 0Ch,  81h,    6,    1,	0F8h, 0A1h
MUSIC_10_PSG1:	db  0FCh,    1,	0FBh,  4Ch, 0F8h,    0,	0F8h,  20h, 0FDh,  0Ah,	0A8h,  39h, 0FDh,    0,	0F0h,  0Ch
					; DATA XREF: ROM:C981o
		db  0FDh,  0Ah,	0A8h,	 6, 0FDh,    0,	0F0h,  12h, 0FDh,  0Ah,	0A6h,  39h, 0FDh,    0,	0F0h,  0Ch
		db  0FDh,  0Ah,	0A6h,	 6, 0FDh,    0,	0F0h,  12h, 0FDh,  0Ah,	0A9h,  39h, 0FDh,    0,	0F0h,  0Ch
		db  0FDh,  0Ah,	0A9h,	 6, 0FDh,    0,	0F0h,  12h, 0FDh,  0Ah,	0A8h,  5Dh, 0F8h,  40h,	0A6h,  39h
		db  0FDh,    0,	0F0h,  0Ch, 0FDh,  0Ah,	0A6h,	 6, 0FDh,    0,	0F0h,  12h, 0FDh,  0Ah,	0A6h,  2Dh
		db  0A6h,  30h,	0A4h,  39h, 0FDh,    0,	0F0h,  0Ch, 0FDh,  0Ah,	0A4h,	 6, 0FDh,    0,	0F0h,  12h
		db  0FDh,  0Ah,	0A9h,  2Dh, 0A8h,  30h,	0F8h, 0A0h, 0F8h,  60h,	0A9h,  39h, 0FDh,    0,	0F0h,  0Ch
		db  0FDh,  0Ah,	0A9h,	 6, 0FDh,    0,	0F0h,  12h, 0FDh,  0Ah,	0A6h,  39h, 0FDh,    0,	0F0h,  0Ch
		db  0FDh,  0Ah,	0A6h,	 6, 0FDh,    0,	0F0h,  12h, 0FDh,  0Ah,	0A7h,  39h, 0FDh,    0,	0F0h,  0Ch
		db  0FDh,  0Ah,	0A7h,	 6, 0FDh,    0,	0F0h,  12h, 0FDh,  0Ah,	0A9h,  39h, 0FDh,    0,	0F0h,  0Ch
		db  0FDh,  0Ah,	0A9h,	 6, 0FDh,    0,	0F0h,  12h, 0F8h, 0A1h
MUSIC_10_PSG2:	db  0FCh,    1,	0FBh,  4Ch, 0F8h,    0,	0F8h,  20h, 0FDh,  0Ah,	0A4h,  39h, 0FDh,    0,	0F0h,  0Ch
					; DATA XREF: ROM:C983o
		db  0FDh,  0Ah,	0A4h,	 6, 0FDh,    0,	0F0h,  12h, 0FDh,  0Ah,	0A3h,  39h, 0FDh,    0,	0F0h,  0Ch
		db  0FDh,  0Ah,	0A3h,	 6, 0FDh,    0,	0F0h,  12h, 0FDh,  0Ah,	0A6h,  39h, 0FDh,    0,	0F0h,  0Ch
		db  0FDh,  0Ah,	0A6h,	 6, 0FDh,    0,	0F0h,  12h, 0FDh,  0Ah,	0A4h,  5Dh, 0F8h,  40h,	0A4h,  39h
		db  0FDh,    0,	0F0h,  0Ch, 0FDh,  0Ah,	0A4h,	 6, 0FDh,    0,	0F0h,  12h, 0FDh,  0Ah,	0A4h,  2Dh
		db  0A4h,  30h,	0A2h,  39h, 0FDh,    0,	0F0h,  0Ch, 0FDh,  0Ah,	0A2h,	 6, 0FDh,    0,	0F0h,  12h
		db  0FDh,  0Ah,	0A2h,  2Dh, 0A2h,  30h,	0F8h, 0A0h, 0F8h,  60h,	0A4h,  39h, 0FDh,    0,	0F0h,  0Ch
		db  0FDh,  0Ah,	0A4h,	 6, 0FDh,    0,	0F0h,  12h, 0FDh,  0Ah,	0A4h,  39h, 0FDh,    0,	0F0h,  0Ch
		db  0FDh,  0Ah,	0A4h,	 6, 0FDh,    0,	0F0h,  12h, 0FDh,  0Ah,	0A5h,  39h, 0FDh,    0,	0F0h,  0Ch
		db  0FDh,  0Ah,	0A5h,	 6, 0FDh,    0,	0F0h,  12h, 0FDh,  0Ah,	0A7h,  39h, 0FDh,    0,	0F0h,  0Ch
		db  0FDh,  0Ah,	0A7h,	 6, 0FDh,    0,	0F0h,  12h, 0F8h, 0A1h
MUSIC_10_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:C985o	ROM:C987o
MUSIC_02:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 181
		dw MUSIC_02_YM1
		dw MUSIC_02_YM2
		dw MUSIC_02_YM3
		dw MUSIC_02_YM4
		dw MUSIC_02_YM5
		dw MUSIC_02_YM6
		dw MUSIC_02_PSG1
		dw MUSIC_02_PSG2
		dw MUSIC_02_PSG3
		dw MUSIC_02_PSG3
MUSIC_02_YM1:	db  0F8h,    0,	0FEh,  35h, 0FDh,  0Ch,	0FCh,	 1, 0FBh,  2Ch,	0A1h,  30h,  28h, 0A7h,	 18h,  23h
					; DATA XREF: ROM:CDD5o
		db   1Fh,  21h,	 9Eh,  3Ch, 0F0h,  0Ch,	 9Eh,	 6,  70h,  1Eh,	 70h,  9Fh,  5Ah, 0F0h,	   6, 0A2h
		db   30h,  2Ah,	0A9h,  18h,  25h,  21h,	 22h, 0A8h,  3Ch, 0F0h,	 0Ch, 0A8h,    6,  70h,	 28h,  70h
		db  0A9h,  5Ah,	0F0h,	 6, 0FEh,  3Ah,	0FDh,  0Ah, 0FCh,    6,	0B8h,  0Ch,  33h,  32h,	0FCh,	 1
		db  0ADh,  24h,	0FCh,	 6, 0B8h,  0Ch,	 33h,  32h,  2Dh, 0FCh,	   1, 0BAh,  48h, 0FCh,	   6, 0B7h
		db   0Ch,  32h,	 31h, 0FCh,    1, 0ACh,	 24h, 0FCh,    6, 0B7h,	 0Ch,  32h,  31h,  2Ch,	0FCh,	 1
		db  0B9h,  48h,	0FEh,  0Dh, 0FDh,  0Ah,	0F0h,  0Ch, 0FCh,    6,	 2Bh,  2Bh,  2Bh,  2Bh,	 70h,  2Bh
		db   2Ah,  2Bh,	0AEh,  18h,  2Eh, 0ABh,	 0Ch,  70h,  2Ch,  2Ch,	 2Ch,  2Ch,  70h,  2Ch,	 2Bh,  2Ch
		db  0AFh,  18h,	 2Fh, 0ACh,  0Ch,  70h,	 31h,  31h,  31h, 0B1h,	 1Eh, 0F0h,    6, 0B1h,	 0Ch,  31h
		db   31h,  31h,	 70h,  31h,  31h,  31h,	0B1h,  18h, 0B1h,  0Ch,	 31h,  31h,  31h,  70h,	 31h,  30h
		db  0B1h,  12h,	0F0h,	 6, 0B5h,  18h,	 35h, 0F8h, 0A1h
MUSIC_02_YM2:	db  0FEh,  23h,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Ch, 0F8h,    0,	 89h,  10h,    9,    9,	0F0h,  18h
					; DATA XREF: ROM:CDD7o
		db   89h,  0Ch,	   9,  89h,  10h,    9,	   9, 0F0h,  0Ch,    9,	   9,	 9,  89h,  10h,	   9,	 9
		db  0F0h,  18h,	 89h,  0Ch,    9,  89h,	 10h,	 9,    9, 0F0h,	 0Ch,	 9,    9,    8,	 87h,  10h
		db     7,    7,	0F0h,  18h,  87h,  0Ch,	   7,  87h,  10h,    7,	   7, 0F0h,  0Ch,    7,	   7,	 7
		db   87h,  10h,	   7,	 7, 0F0h,  18h,	 87h,  0Ch,    7,  86h,	 10h,	 6,    6, 0F0h,	 0Ch,	 6
		db     6,    6,	 85h,  60h,    5,  0Bh,	 0Bh, 0F0h,  0Ch,  10h,	 10h,  10h,  10h,  70h,	 10h,  0Fh
		db   10h,  8Bh,	 18h,  0Bh,  90h,  0Ch,	 70h,  0Bh,  0Bh,  0Bh,	 0Bh,  70h,  0Bh,  0Ah,	 0Bh,  88h
		db   18h,    8,	 8Bh,  0Ch,  70h,    5,	   5,	 5,  85h,  1Eh,	0F0h,	 6,  85h,  0Ch,	   5,	 5
		db     5,  70h,	   5,	 5,    5,  85h,	 18h,  85h,  0Ch,    5,	   5,	 5,  70h,  11h,	   5,	 5
		db   70h,  84h,	 18h,	 4, 0F8h, 0A1h
MUSIC_02_YM3:	db  0F8h,    0,	0FAh, 0C0h, 0FEh,  12h,	0FDh,	 7, 0FCh,    1,	0FBh,  2Ch, 0A8h,  60h,	 27h,  26h
					; DATA XREF: ROM:CDD9o
		db   25h,  26h,	 25h,  23h,  24h, 0FDh,	   9, 0ADh,  0Ch, 0F0h,	 18h, 0A9h,  3Ch, 0ADh,	 0Ch,  70h
		db  0A9h,  48h,	0A9h,  0Ch, 0F0h,  18h,	0A6h,  3Ch, 0A9h,  0Ch,	 70h, 0A6h,  48h, 0FAh,	 40h, 0FEh
		db   23h, 0FDh,	 0Ah, 0F0h,  0Ch, 0FCh,	   6,  2Bh,  2Bh,  2Bh,	 2Bh,  70h,  2Bh,  2Ah,	 2Bh, 0AEh
		db   18h,  2Eh,	0ABh,  0Ch,  70h,  2Ch,	 2Ch,  2Ch,  2Ch,  70h,	 2Ch,  2Bh,  2Ch, 0AFh,	 18h,  2Fh
		db  0ACh,  0Ch,	 70h,  31h,  31h,  31h,	0B1h,  1Eh, 0F0h,    6,	0B1h,  0Ch,  31h,  31h,	 31h,  70h
		db   31h,  31h,	 31h, 0B1h,  18h, 0B1h,	 0Ch,  31h,  31h,  31h,	 70h,  31h,  30h, 0B1h,	 12h, 0F0h
		db     6, 0B5h,	 18h,  35h, 0F8h, 0A1h
MUSIC_02_YM4:	db  0F8h,    0,	0FEh,  1Eh, 0FDh,  0Ah,	0FCh,	 1, 0FBh,  2Ch,	 89h,  60h,    9,    9,	 89h,  48h
					; DATA XREF: ROM:CDDBo
		db   89h,  0Ch,	   8,  87h,  60h,    7,	 87h,  48h,  87h,  0Ch,	   7,  86h,  60h,  85h,	 3Ch,  8Bh
		db     6,  70h,	 85h,  1Eh, 0F0h,    6,	 0Bh,  70h,  10h,  70h,	 11h,  70h,  14h,  70h,	0FCh,  93h
		db   97h,  18h,	0FCh, 0FFh,  94h,    6,	 70h,  8Bh,  3Ch,  91h,	   6,  70h,  8Bh,  1Eh,	0F0h,	 6
		db     5,  70h,	 0Ah,  70h,  0Bh,  70h,	 0Eh,  70h, 0FCh,  90h,	 91h,  18h, 0FCh, 0FFh,	 8Eh,	 6
		db   70h, 0F0h,	 0Ch, 0FCh,    6,  10h,	 10h,  10h,  10h,  70h,	 10h,  0Fh,  10h,  8Bh,	 18h,  0Bh
		db   90h,  0Ch,	 70h,  0Bh,  0Bh,  0Bh,	 0Bh,  70h,  0Bh,  0Ah,	 0Bh,  88h,  18h,    8,	 8Bh,  0Ch
		db   70h,    5,	   5,	 5,  85h,  1Eh,	0F0h,	 6,  85h,  0Ch,	   5,	 5,    5,  70h,	   5,	 5
		db     5,  85h,	 18h,  85h,  0Ch,    5,	   5,	 5,  70h,  11h,	   5,	 5,  70h,  84h,	 18h,	 4
		db  0F8h, 0A1h
MUSIC_02_YM5:	db  0F9h,  20h,	0F0h,	 6, 0F8h,    0,	0FAh,  80h, 0FEh,  35h,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch
					; DATA XREF: ROM:CDDDo
		db  0A1h,  30h,	 28h, 0A7h,  18h,  23h,	 1Fh,  21h,  9Eh,  3Ch,	0F0h,  0Ch,  9Eh,    6,	 70h,  1Eh
		db   70h,  9Fh,	 5Ah, 0F0h,    6, 0A2h,	 30h,  2Ah, 0A9h,  18h,	 25h,  21h,  22h, 0A8h,	 3Ch, 0F0h
		db   0Ch, 0A8h,	   6,  70h,  28h,  70h,	0A9h,  5Ah, 0F0h,    6,	0FAh,  40h, 0FEh,  3Ah,	0FDh,	 8
		db  0FCh,    6,	0B8h,  0Ch,  33h,  32h,	0FCh,	 1, 0ADh,  24h,	0FCh,	 6, 0B8h,  0Ch,	 33h,  32h
		db   2Dh, 0FCh,	   1, 0BAh,  48h, 0FCh,	   6, 0B7h,  0Ch,  32h,	 31h, 0FCh,    1, 0ACh,	 24h, 0FCh
		db     6, 0B7h,	 0Ch,  32h,  31h,  2Ch,	0FCh,	 1, 0B9h,  48h,	0FAh,  80h, 0FEh,  0Dh,	0FDh,	 9
		db  0F0h,  0Ch,	0FCh,	 6,  2Bh,  2Bh,	 2Bh,  2Bh,  70h,  2Bh,	 2Ah,  2Bh, 0AEh,  18h,	 2Eh, 0ABh
		db   0Ch,  70h,	 2Ch,  2Ch,  2Ch,  2Ch,	 70h,  2Ch,  2Bh,  2Ch,	0AFh,  18h,  2Fh, 0ACh,	 0Ch,  70h
		db   31h,  31h,	 31h, 0B1h,  1Eh, 0F0h,	   6, 0B1h,  0Ch,  31h,	 31h,  31h,  70h,  31h,	 31h,  31h
		db  0B1h,  18h,	0B1h,  0Ch,  31h,  31h,	 31h,  70h,  31h,  30h,	0B1h,  12h, 0F0h,    6,	0B5h,  18h
		db   35h, 0F8h,	0A1h
MUSIC_02_YM6:	db  0F8h,    0,	0F8h, 0C6h,  89h,  10h,	 0Ah,  0Bh, 0F0h,  30h,	0F8h, 0E0h,  89h,  10h,	 0Ah,  0Bh
					; DATA XREF: ROM:CDDFo
		db  0F0h,  0Ch,	0FAh,  80h,    2, 0FAh,	0C0h,	 3, 0FAh,  40h,	   4, 0FAh, 0C0h, 0F8h,	0C1h,  85h
		db   60h, 0F0h,	 36h,  80h,    6,    0,	   0,	 1,  81h,  12h,	0F8h, 0E0h,  80h,  0Ch,	   1,	 1
		db     1,  81h,	 18h,  81h,  0Ch,    1,	   1,	 0,    0,    1,	   0,	 1,    0,    1,	   1,	 1
		db   81h,  18h,	 81h,  0Ch,    1,    1,	   0,	 0,    1,    0,	   1,	 0,    1,    1,	   1,	 1
		db  0FAh,  80h,	 82h,	 6, 0FAh, 0C0h,	   3, 0FAh,  40h,  84h,	 0Ch, 0FAh, 0C0h,    1,	   1,	 1
		db   81h,    6,	0FAh,  80h,    2, 0FAh,	0C0h,	 3, 0FAh,  40h,	   4, 0FAh, 0C0h,  81h,	 0Ch,	 1
		db     1,    1,	   0,	 1,    1,    1,	 81h,	 6,    0,  80h,	 0Ch,	 1,    1,  80h,	 18h,  81h
		db   0Ch,  8Bh,	   4,  0Ah,    9,  81h,	 18h, 0F8h, 0A1h
MUSIC_02_PSG1:	db  0F8h,    0,	0FDh,  78h, 0FCh,    1,	0FBh,  4Ch, 0A4h,  60h,	 23h,  22h,  21h,  22h,	 21h,  20h
					; DATA XREF: ROM:CDE1o
		db   21h, 0FDh,	 7Ah, 0A9h,  0Ch, 0F0h,	 18h, 0A6h,  3Ch, 0A9h,	 0Ch,  70h, 0A6h,  48h,	0A3h,  0Ch
		db  0F0h,  18h,	0A3h,  3Ch, 0A3h,  0Ch,	 70h, 0A3h,  48h, 0FDh,	   0, 0F0h,  0Ch, 0FDh,	 7Bh, 0FCh
		db     6,  26h,	 26h,  26h,  26h,  70h,	 26h,  25h,  26h, 0A9h,	 18h,  29h, 0A6h,  0Ch,	0FDh,	 0
		db   70h, 0FDh,	 7Bh,  27h,  27h,  27h,	 27h,  70h,  27h,  26h,	 27h, 0ABh,  18h,  2Bh,	0A7h,  0Ch
		db  0FDh,    0,	 70h, 0FDh,  7Bh,  2Ch,	 2Ch,  2Ch, 0ACh,  1Eh,	0F0h,	 6, 0ACh,  0Ch,	 2Ch,  2Ch
		db   2Ch, 0FDh,	   0,  70h, 0FDh,  7Bh,	 2Ch,  2Ch,  2Ch, 0ACh,	 18h, 0ACh,  0Ch,  2Ch,	 2Ch,  2Ch
		db  0FDh,    0,	 70h, 0FDh,  7Bh,  2Ch,	 2Bh, 0ACh,  12h, 0FDh,	   0, 0F0h,    6, 0FDh,	 7Bh, 0B1h
		db   18h,  31h,	0F8h, 0A1h
MUSIC_02_PSG2:	db  0F8h,    0,	0FDh,  78h, 0FCh,    1,	0FBh,  4Ch, 0A1h,  60h,	 1Fh,  1Eh,  1Dh,  1Fh,	 1Dh,  1Ch
					; DATA XREF: ROM:CDE3o
		db   1Dh, 0FDh,	 7Ah, 0A3h,  0Ch, 0F0h,	 18h, 0A3h,  3Ch, 0A3h,	 0Ch,  70h, 0A3h,  48h,	0A0h,  0Ch
		db  0F0h,  18h,	 9Dh,  3Ch, 0A0h,  0Ch,	 70h,  9Dh,  48h, 0FDh,	   0, 0F0h,  0Ch, 0FDh,	 7Bh, 0FCh
		db     6,  20h,	 20h,  20h,  20h,  70h,	 20h,  1Fh,  20h, 0A6h,	 18h,  26h, 0A0h,  0Ch,	0FDh,	 0
		db   70h, 0FDh,	 7Bh,  21h,  21h,  21h,	 21h,  70h,  21h,  20h,	 21h, 0A6h,  18h,  26h,	0A1h,  0Ch
		db  0FDh,    0,	 70h, 0FDh,  7Bh,  26h,	 26h,  26h, 0A6h,  1Eh,	0F0h,	 6, 0A6h,  0Ch,	 26h,  26h
		db   26h, 0FDh,	   0,  70h, 0FDh,  7Bh,	 26h,  26h,  26h, 0A6h,	 18h, 0A6h,  0Ch,  26h,	 26h,  26h
		db  0FDh,    0,	 70h, 0FDh,  7Bh,  26h,	 25h, 0A6h,  12h, 0FDh,	   0, 0F0h,    6, 0FDh,	 7Bh, 0ACh
		db   18h,  2Ch,	0F8h, 0A1h
MUSIC_02_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:CDE5o	ROM:CDE7o
MUSIC_1E:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 206
		dw MUSIC_1E_YM1
		dw MUSIC_1E_YM2
		dw MUSIC_1E_YM3
		dw MUSIC_1E_YM4
		dw MUSIC_1E_YM5
		dw MUSIC_1E_YM6
		dw MUSIC_1E_PSG1
		dw MUSIC_1E_PSG2
		dw MUSIC_1E_PSG3
		dw MUSIC_1E_PSG3
MUSIC_1E_YM1:	db  0FCh,    1,	0FBh,  2Ch, 0F0h,  84h,	0FEh,  33h, 0FDh,    9,	0FCh, 0FFh, 0ADh,  0Ch,	0F8h,	 0
					; DATA XREF: ROM:D27Bo
		db  0B2h,  18h,	0FCh,  90h, 0B4h,  3Ch,	0FCh, 0FFh, 0ADh,  0Ch,	 32h,  34h,  37h,  35h,	0B4h,  78h
		db  0B2h,    6,	0F0h,  12h, 0FCh,  9Eh,	0FCh,  80h, 0B9h, 0D8h,	0FBh,  20h, 0FCh,    1,	0B9h,  30h
		db  0F0h,  0Ch,	0FBh,  2Ch, 0FCh, 0FFh,	 32h, 0B7h,  18h, 0FCh,	 90h, 0B9h,  3Ch, 0FCh,	0FFh, 0B2h
		db   0Ch,  37h,	 39h, 0FCh,  9Fh,  3Ch,	 3Ah, 0FCh, 0FFh, 0B9h,	 78h, 0B7h,    6, 0F0h,	 12h, 0FCh
		db   80h, 0FCh,	0A0h, 0C0h, 0D8h, 0FBh,	 20h, 0FCh,    1, 0C0h,	 48h, 0FBh,  2Ch, 0FCh,	0FFh, 0F8h
		db  0C1h, 0C1h,	   6,  70h,  3Bh,  70h,	 3Ch,  70h, 0B6h,  24h,	0C1h,	 6,  70h,  3Bh,	 70h,  3Ch
		db   70h, 0B6h,	 0Ch, 0C4h,    6, 0F0h,	 12h, 0C0h,    6,  70h,	 3Ah,  70h,  3Bh,  70h,	0B5h,  24h
		db  0C0h,    6,	 70h,  3Ah,  70h,  3Bh,	 70h, 0B5h,  0Ch, 0C3h,	   6, 0F0h,  12h, 0F8h,	0E0h, 0FEh
		db   0Dh, 0FDh,	 0Ah, 0FCh,    3, 0ABh,	 0Ch,  2Bh,  2Bh,  2Bh,	 2Bh,  2Ah, 0F8h, 0C1h,	0ABh,  0Ch
		db   2Ah,  2Bh,	0AEh,  18h,  2Eh, 0AAh,	 0Ch, 0F8h, 0E0h, 0ABh,	 0Ch,  70h, 0AFh,  18h,	0FCh,	 1
		db  0AFh,  0Ch,	0FEh,  33h, 0FDh,  0Bh,	 2Dh, 0F8h, 0A1h
MUSIC_1E_YM2:	db  0FCh,    1,	0FBh,  2Ch, 0F0h,  84h,	0FEh,  26h, 0FDh,  0Bh,	0A1h,  0Ch, 0F8h,    0,	0A6h,  18h
					; DATA XREF: ROM:D27Do
		db  0A8h,  3Ch,	0A1h,  0Ch,  26h,  28h,	 2Bh,  29h, 0A8h,  78h,	0A6h,	 6, 0F0h,  12h,	0FCh,  80h
		db  0ADh, 0D8h,	0FBh,  20h, 0FCh,    1,	0ADh,  30h, 0F0h,  0Ch,	0FBh,  2Ch,  26h, 0ABh,	 18h, 0ADh
		db   3Ch, 0A6h,	 0Ch,  2Bh,  2Dh,  30h,	 2Eh, 0ADh,  78h, 0ABh,	   6, 0F0h,  12h, 0FCh,	 80h, 0B4h
		db  0D8h, 0FBh,	 20h, 0FCh,    1, 0B4h,	 48h, 0FBh,  2Ch, 0FEh,	 3Ch, 0FDh,  0Ch, 0F8h,	0C1h, 0B5h
		db     6,  70h,	 2Fh,  70h,  30h,  70h,	0AAh,  24h, 0B5h,    6,	 70h,  2Fh,  70h,  30h,	 70h, 0AAh
		db   0Ch, 0B8h,	   6, 0F0h,  12h, 0B4h,	   6,  70h,  2Eh,  70h,	 2Fh,  70h, 0A9h,  24h,	0B4h,	 6
		db   70h,  2Eh,	 70h,  2Fh,  70h, 0A9h,	 0Ch, 0B7h,    6, 0F0h,	 12h, 0F8h, 0E0h, 0FEh,	 0Dh, 0FDh
		db   0Ah, 0FCh,	   3, 0A6h,  0Ch,  26h,	 26h,  26h,  26h,  25h,	0F8h, 0C1h, 0A6h,  0Ch,	 25h,  26h
		db  0A9h,  18h,	 29h, 0A6h,  0Ch, 0F8h,	0E0h, 0A7h,  0Ch,  70h,	0A9h,  18h, 0FCh,    1,	0A9h,  0Ch
		db  0FEh,  26h,	0FDh,  0Bh,  21h, 0F8h,	0A1h
MUSIC_1E_YM3:	db  0FCh,    1,	0FBh,  2Ch, 0F0h,  8Ah,	0F9h,  20h, 0FEh,  33h,	0FAh,  80h, 0FDh,    9,	0FCh, 0FFh
					; DATA XREF: ROM:D27Fo
		db  0ADh,  0Ch,	0F8h,	 0, 0B2h,  18h,	0FCh,  90h, 0B4h,  3Ch,	0FCh, 0FFh, 0ADh,  0Ch,	 32h,  34h
		db   37h,  35h,	0B4h,  78h, 0B2h,    6,	0F0h,  12h, 0FCh,  9Eh,	0FCh,  80h, 0B9h, 0D8h,	0FBh,  20h
		db  0FCh,    1,	0B9h,  30h, 0F0h,  0Ch,	0FCh, 0FFh, 0FBh,  2Ch,	 32h, 0B7h,  18h, 0FCh,	 90h, 0B9h
		db   3Ch, 0FCh,	0FFh, 0B2h,  0Ch,  37h,	 39h, 0FCh,  9Fh,  3Ch,	 3Ah, 0FCh, 0FFh, 0B9h,	 78h, 0B7h
		db     6, 0F0h,	 12h, 0FCh,  80h, 0FCh,	0A0h, 0C0h, 0D8h, 0FBh,	 20h, 0FCh,    1, 0C0h,	 48h, 0FAh
		db   40h, 0FBh,	 2Ch, 0FCh, 0FFh, 0F8h,	 20h, 0C1h,    6,  70h,	 3Bh,  70h,  3Ch,  70h,	0B6h,  24h
		db  0C1h,    6,	 70h,  3Bh,  70h,  3Ch,	 70h, 0B6h,  0Ch, 0C4h,	   6, 0F0h,  12h, 0C0h,	   6,  70h
		db   3Ah,  70h,	 3Bh,  70h, 0B5h,  24h,	0C0h,	 6,  70h,  3Ah,	 70h,  3Bh,  70h, 0B5h,	 0Ch, 0C3h
		db     6, 0F8h,	 40h, 0F0h,  12h, 0F8h,	0A0h, 0F8h,  60h, 0F0h,	 0Ch, 0F9h,    0, 0FAh,	0C0h, 0FEh
		db   0Dh, 0FDh,	 0Ah, 0FCh,    3,  20h,	 20h,  20h,  20h,  20h,	 1Fh, 0F8h, 0C1h, 0A0h,	 0Ch,  1Fh
		db   20h, 0A3h,	 18h,  23h, 0A2h,  0Ch,	0F8h, 0E0h, 0A3h,  0Ch,	 70h, 0A5h,  18h, 0A5h,	 0Ch, 0F0h
		db     6, 0FCh,	   1, 0F9h,  20h, 0FAh,	 80h, 0FEh,  33h, 0FDh,	   9, 0ADh,  0Ch, 0F8h,	0A1h
MUSIC_1E_YM4:	db  0FEh,  26h,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Ch, 0F8h, 0C1h,	 8Eh,  0Ch, 0FCh,  80h,	 99h,	 6
					; DATA XREF: ROM:D281o
		db  0FCh,    1,	 9Ah,	 3,  70h,  1Ah,	 70h,  1Ah,  70h,  1Ah,	 70h,  1Ah,  70h,  95h,	   5, 0F0h
		db     7,  89h,	   5, 0F0h,    7, 0F8h,	0E0h, 0F8h,    0, 0F8h,	0C7h,  8Eh,  0Ch, 0FCh,	 80h,  99h
		db     6, 0FCh,	   1,  9Ah,    3,  70h,	 1Ah,  70h,  1Ah,  70h,	 1Ah,  70h,  1Ah,  70h,	 95h,	 5
		db  0F0h,    7,	 89h,	 5, 0F0h,    7,	0F8h, 0E0h, 0F8h, 0C7h,	 87h,  0Ch, 0FCh,  80h,	 92h,	 6
		db  0FCh,    1,	 93h,	 3,  70h,  13h,	 70h,  13h,  70h,  13h,	 70h,  13h,  70h,  8Eh,	   5, 0F0h
		db     7,  82h,	   5, 0F0h,    7, 0F8h,	0E0h, 0FEh,  1Dh, 0FDh,	 0Ch, 0F8h, 0C1h,  9Ah,	 0Ch,  70h
		db   9Ah,    5,	0F0h,	 7,  94h,    5,	0F0h,	 7,  95h,    5,	0F0h,	 7,  91h,  11h,	0F0h,	 7
		db   9Ah,    5,	0F0h,	 7,  94h,    5,	0F0h,	 7,  95h,    5,	0F0h,	 7,  92h,    5,	0F0h,	 7
		db   9Ah,    5,	0F0h,	 7,  99h,  0Ch,	 70h,  99h,    5, 0F0h,	   7,  93h,    5, 0F0h,	   7,  94h
		db     5, 0F0h,	   7,  90h,  11h, 0F0h,	   7,  99h,    5, 0F0h,	   7,  93h,    5, 0F0h,	   7,  94h
		db     5, 0F0h,	   7,  91h,    5, 0F0h,	   7,  99h,    5, 0F0h,	   7, 0F8h, 0E0h, 0FEh,	 26h, 0FDh
		db   0Bh, 0FCh,	   3,  8Bh,  0Ch,  0Bh,	 0Bh,  0Bh,  0Bh,  0Ah,	 0Bh,  0Ah,  0Bh,  88h,	 18h,	 8
		db   84h,  0Ch,	 0Bh,  0Ah,  0Bh,  88h,	 18h,	 8,  83h,  0Ch,	   4,  70h,  89h,  18h,	   9, 0FCh
		db     1, 0F8h,	0A1h
MUSIC_1E_YM5:	db  0FAh,  40h,	0FEh,  3Dh, 0FCh,    0,	0FBh,	 0, 0F8h, 0C5h,	0FDh,  0Dh, 0B9h,    6,	0FDh,	 9
					; DATA XREF: ROM:D283o
		db   39h,  39h,	 39h, 0F8h, 0E0h, 0F8h,	   0, 0FEh,  3Dh, 0F8h,	0D7h, 0FDh,  0Dh, 0B9h,	   6, 0FDh
		db     9,  39h,	 39h,  39h, 0FDh,  0Dh,	 39h, 0FDh,    9,  39h,	 39h,  39h, 0FDh,  0Dh,	 39h, 0FDh
		db     9,  39h,	 39h,  39h, 0F8h, 0E0h,	0FDh,  0Dh, 0B9h,    6,	0FDh,	 9,  39h, 0FDh,	 0Dh,  39h
		db  0FDh,    9,	 39h, 0FDh,  0Dh,  39h,	0FDh,	 9,  39h, 0FDh,	 0Dh,  39h, 0FDh,    9,	 39h, 0FDh
		db   0Dh,  39h,	0FDh,	 9,  39h, 0FEh,	 3Eh, 0FDh,  0Ch, 0B9h,	 0Ch, 0F8h, 0C1h, 0FEh,	 3Dh, 0FDh
		db   0Dh, 0B9h,	   6, 0FDh,    9,  39h,	0FDh,  0Dh,  39h, 0FDh,	   9,  39h, 0FDh,  0Dh,	 39h, 0FDh
		db     9,  39h,	0FEh,  3Eh, 0FDh,  0Ch,	0B9h,  0Ch, 0FEh,  3Dh,	0FDh,  0Dh, 0B9h,    6,	0FDh,	 9
		db   39h, 0FEh,	 3Eh, 0FDh,  0Ch, 0B9h,	 0Ch, 0FEh,  3Dh, 0FDh,	 0Dh, 0B9h,    6, 0FDh,	   9,  39h
		db  0FEh,  3Eh,	0FDh,  0Ch, 0B9h,  0Ch,	0F8h, 0E0h, 0FEh,  3Dh,	0FDh,  0Dh, 0B9h,    6,	0FDh,	 9
		db   39h,  39h,	 39h, 0FEh,  3Eh, 0FDh,	 0Ch, 0B9h,  18h,  39h,	0F8h, 0A1h
MUSIC_1E_YM6:	db  0F8h, 0CEh,	0F0h,  90h, 0F8h, 0E0h,	0F0h,  24h,  80h,  0Ch,	0F8h, 0C6h,  80h,  3Ch,	 80h,  0Ch
					; DATA XREF: ROM:D285o
		db     0,  80h,	 3Ch, 0F8h, 0E0h,  80h,	 3Ch,  80h,  0Ch,    0,	 80h,  18h,  81h,  0Ch,	 80h,	 6
		db     0,  81h,	 0Ch, 0F8h, 0C1h,  80h,	 0Ch,  80h,  24h,  81h,	 18h,  80h,  0Ch,    0,	0FAh,  80h
		db     2, 0FAh,	0C0h,  83h,    6,    3,	0FAh,  40h,  84h,  0Ch,	0FAh, 0C0h,    1,    0,	 80h,  24h
		db   81h,  18h,	 80h,  0Ch,    0,    1,	0FAh,  80h,  82h,    4,	0FAh, 0C0h,    3, 0FAh,	 40h,	 4
		db  0FAh, 0C0h,	 81h,  0Ch,    1, 0F8h,	0E0h,  80h,    6,    0,	 81h,  18h,  81h,  0Ch,	 80h,	 6
		db     0,  81h,	 0Ch,  80h,    6,    0,	 80h,  0Ch,    0,  81h,	 18h,  81h,  0Ch,  80h,	   6,	 0
		db   81h,  0Ch,	   1,  80h,    6,    0,	 80h,  0Ch,  81h,  18h,	 81h,  0Ch,  80h,    6,	   0,  81h
		db   0Ch,    1,	 80h,	 6,    0,  81h,	 18h,  81h,  0Ch,    0,	0F8h,	 0, 0F8h, 0C6h,	 80h,  24h
		db   81h,  18h,	 80h,  0Ch,    0,  80h,	 18h,  81h,  24h, 0F8h,	0E0h,  80h,  24h,  81h,	 18h,  80h
		db   0Ch,    0,	 80h,  18h,  81h,  0Ch,	 80h,	 6,    0,  81h,	 0Ch, 0F8h, 0C1h,  80h,	 0Ch,  80h
		db   24h,  81h,	 18h,  80h,  0Ch,    0,	0FAh,  80h,    2, 0FAh,	0C0h,  83h,    6,    3,	0FAh,  40h
		db   84h,  0Ch,	0FAh, 0C0h,    1,    0,	 80h,  24h,  81h,  18h,	 80h,  0Ch,    0,    1,	0FAh,  80h
		db   82h,    4,	0FAh, 0C0h,    3, 0FAh,	 40h,	 4, 0FAh, 0C0h,	 81h,  0Ch,    1, 0F8h,	0E0h,  80h
		db     6,    0,	 81h,  18h,  81h,  0Ch,	 80h,	 6,    0,  81h,	 0Ch,  80h,    6,    0,	 80h,  0Ch
		db     0,  81h,	 18h,  81h,  0Ch,  80h,	   6,	 0,  81h,  0Ch,	   1,  80h,    6,    0,	 80h,  0Ch
		db   81h,  18h,	 81h,  0Ch,  80h,    6,	   0,  81h,  0Ch,    1,	 80h,	 6,    0,  81h,	 18h,  81h
		db   0Ch,    0,	0F8h, 0A1h
MUSIC_1E_PSG1:	db  0FDh,  7Bh,	0FCh,	 3, 0FBh,  4Ch,	0F8h, 0C7h, 0ADh,    6,	 2Dh,  29h, 0F8h, 0E0h,	0F8h,	 0
					; DATA XREF: ROM:D287o
		db  0F8h, 0C3h,	0ADh,	 6,  2Dh,  29h,	0F8h, 0E0h, 0F8h, 0C3h,	0AFh,	 6,  2Fh,  29h,	0F8h, 0E0h
		db  0F8h, 0C3h,	0B0h,	 6,  30h,  29h,	0F8h, 0E0h, 0F8h, 0C3h,	0AFh,	 6,  2Fh,  29h,	0F8h, 0E0h
		db  0F8h, 0C3h,	0ADh,	 6,  2Dh,  29h,	0F8h, 0E0h, 0F8h, 0C3h,	0AFh,	 6,  2Fh,  29h,	0F8h, 0E0h
		db  0F8h, 0C3h,	0B0h,	 6,  30h,  29h,	0F8h, 0E0h, 0F8h, 0C3h,	0AFh,	 6,  2Fh,  29h,	0F8h, 0E0h
		db  0F8h, 0C3h,	0B2h,	 6,  32h,  2Eh,	0F8h, 0E0h, 0F8h, 0C3h,	0B4h,	 6,  34h,  2Eh,	0F8h, 0E0h
		db  0F8h, 0C3h,	0B5h,	 6,  35h,  2Eh,	0F8h, 0E0h, 0F8h, 0C3h,	0B4h,	 6,  34h,  2Eh,	0F8h, 0E0h
		db  0F8h, 0C3h,	0B2h,	 6,  32h,  2Eh,	0F8h, 0E0h, 0F8h, 0C3h,	0B4h,	 6,  34h,  2Eh,	0F8h, 0E0h
		db  0F8h, 0C3h,	0B5h,	 6,  35h,  2Eh,	0F8h, 0E0h, 0F8h, 0C3h,	0B4h,	 6,  34h,  2Eh,	0F8h, 0E0h
		db  0F8h, 0C3h,	0ADh,	 6,  2Dh,  2Ah,	 30h,  30h,  2Ah, 0F8h,	0E0h, 0F8h, 0C3h, 0ACh,	   6,  2Ch
		db   29h,  2Fh,	 2Fh,  29h, 0F8h, 0E0h,	0F8h, 0C3h, 0ADh,    6,	 2Dh,  2Ah,  30h,  30h,	 2Ah, 0F8h
		db  0E0h, 0F8h,	0C3h, 0ACh,    6,  2Ch,	 29h,  2Fh,  2Fh,  29h,	0F8h, 0E0h, 0F8h, 0C4h,	0B2h,	 6
		db   2Ch, 0F8h,	0E0h, 0B1h,    6,  2Bh,	0F8h, 0C1h, 0B2h,    6,	 2Ch,  31h,  2Bh,  32h,	 2Ch,  32h
		db   2Ch,  32h,	 2Ch,  32h,  2Ch,  32h,	 2Ch,  32h,  2Eh, 0F8h,	0E0h, 0B3h,    6,  2Fh,	 2Fh,  2Bh
		db   29h,  2Dh,	 31h,  35h,  31h,  35h,	 39h,  3Dh, 0F8h, 0A1h
MUSIC_1E_PSG2:	db  0FDh,  7Bh,	0FCh,	 3, 0FBh,  4Ch,	0F8h, 0C7h, 0A9h,    6,	 29h,  26h, 0F8h, 0E0h,	0F8h,	 0
					; DATA XREF: ROM:D289o
		db  0F8h, 0C3h,	0A9h,	 6,  29h,  26h,	0F8h, 0E0h, 0F8h, 0C3h,	0ABh,	 6,  2Bh,  26h,	0F8h, 0E0h
		db  0F8h, 0C3h,	0ADh,	 6,  2Dh,  26h,	0F8h, 0E0h, 0F8h, 0C3h,	0ABh,	 6,  2Bh,  26h,	0F8h, 0E0h
		db  0F8h, 0C3h,	0A9h,	 6,  29h,  26h,	0F8h, 0E0h, 0F8h, 0C3h,	0ABh,	 6,  2Bh,  26h,	0F8h, 0E0h
		db  0F8h, 0C3h,	0ADh,	 6,  2Dh,  26h,	0F8h, 0E0h, 0F8h, 0C3h,	0ABh,	 6,  2Bh,  26h,	0F8h, 0E0h
		db  0F8h, 0C3h,	0AEh,	 6,  2Eh,  2Bh,	0F8h, 0E0h, 0F8h, 0C3h,	0B0h,	 6,  30h,  2Bh,	0F8h, 0E0h
		db  0F8h, 0C3h,	0B2h,	 6,  32h,  2Bh,	0F8h, 0E0h, 0F8h, 0C3h,	0B0h,	 6,  30h,  2Bh,	0F8h, 0E0h
		db  0F8h, 0C3h,	0AEh,	 6,  2Eh,  2Bh,	0F8h, 0E0h, 0F8h, 0C3h,	0B0h,	 6,  30h,  2Bh,	0F8h, 0E0h
		db  0F8h, 0C3h,	0B2h,	 6,  32h,  2Bh,	0F8h, 0E0h, 0F8h, 0C3h,	0B0h,	 6,  30h,  2Bh,	0F8h, 0E0h
		db  0F8h, 0C3h,	0AAh,	 6,  2Ah,  26h,	 2Dh,  2Dh,  26h, 0F8h,	0E0h, 0F8h, 0C3h, 0A9h,	   6,  29h
		db   25h,  2Ch,	 2Ch,  25h, 0F8h, 0E0h,	0F8h, 0C3h, 0AAh,    6,	 2Ah,  26h,  2Dh,  2Dh,	 26h, 0F8h
		db  0E0h, 0F8h,	0C3h, 0A9h,    6,  29h,	 25h,  2Ch,  2Ch,  25h,	0F8h, 0E0h, 0F8h, 0C4h,	0AFh,	 6
		db   29h, 0F8h,	0E0h, 0AEh,    6,  28h,	0F8h, 0C1h, 0AFh,    6,	 29h,  2Eh,  28h,  2Fh,	 29h,  2Fh
		db   29h,  2Fh,	 29h,  2Fh,  29h,  2Fh,	 29h,  2Eh,  2Ah, 0F8h,	0E0h, 0AFh,    6,  2Bh,	 2Bh,  27h
		db   25h,  29h,	 2Dh,  31h,  2Dh,  31h,	 35h,  39h, 0F8h, 0A1h
MUSIC_1E_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:D28Bo	ROM:D28Do
MUSIC_03:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 180
		dw MUSIC_03_YM1
		dw MUSIC_03_YM2
		dw MUSIC_03_YM3
		dw MUSIC_03_YM4
		dw MUSIC_03_YM5
		dw MUSIC_03_YM6
		dw MUSIC_03_PSG1
		dw MUSIC_03_PSG2
		dw MUSIC_03_PSG3
		dw MUSIC_03_PSG3
MUSIC_03_YM1:	db  0FCh,    1,	0FBh,  2Ch, 0FEh,  1Ah,	0FDh,  0Bh, 0A9h,    4,	 2Eh,  30h,  35h,  3Ah,	 3Ch, 0C1h
					; DATA XREF: ROM:D93Co
		db     6,  70h,	0FDh,  0Ah,  35h,  70h,	 35h,  70h,  35h,  70h,	0F8h, 0C1h, 0B5h,  0Ch,	0B5h,	 6
		db   70h,  35h,	 70h,  35h,  70h, 0F8h,	0E0h, 0B5h,  30h, 0B6h,	 18h,  38h, 0BAh,  36h,	0F0h,	 6
		db  0FFh,    0,	   0
MUSIC_03_YM2:	db  0FCh,    1,	0FBh,  2Ch, 0F0h,    4,	0FEh,  1Ah, 0FDh,    9,	 29h,  2Eh,  30h,  35h,	 3Ah, 0BCh
					; DATA XREF: ROM:D93Eo
		db     6,  70h,	0FDh,	 9,  30h,  70h,	 30h,  70h,  30h,  70h,	0F8h, 0C1h, 0B0h,  0Ch,	0B0h,	 6
		db   70h,  30h,	 70h,  30h,  70h, 0F8h,	0E0h, 0B1h,  30h, 0B3h,	 18h,  33h, 0B2h,  36h,	0F0h,	 6
		db  0FFh,    0,	   0
MUSIC_03_YM3:	db  0FCh,    1,	0FBh,  2Ch, 0F0h,  18h,	0F0h,  0Ch, 0FEh,    3,	0FDh,  0Ch,  9Dh,    6,	 70h,  22h
					; DATA XREF: ROM:D940o
		db   70h,  24h,	 70h, 0F8h, 0C1h, 0A7h,	 0Ch, 0A6h,    4,  24h,	 22h, 0A4h,    6,  70h,	 29h,  70h
		db  0F8h, 0E0h,	0ACh,  30h, 0AAh,  18h,	 2Ch, 0AEh,  36h, 0F0h,	   6, 0FFh,    0,    0
MUSIC_03_YM4:	db  0FCh,    1,	0FBh,  2Ch, 0F0h,  18h,	0FEh,  35h, 0FDh,  0Dh,	 91h,  90h,  92h,  30h,	 97h,  18h
					; DATA XREF: ROM:D942o
		db   10h,  8Ah,	 36h, 0F0h,    6, 0FFh,	   0,	 0
MUSIC_03_YM5:	db  0FCh,    1,	0FBh,  2Ch, 0F0h,  18h,	0FEh,  1Ah, 0FDh,    9,	0BAh,	 6,  70h,  2Eh,	 70h,  2Eh
					; DATA XREF: ROM:D944o
		db   70h,  2Eh,	 70h, 0F8h, 0C1h, 0AEh,	 0Ch, 0AEh,    6,  70h,	 2Eh,  70h,  2Eh,  70h,	0F8h, 0E0h
		db  0AEh,  30h,	0AEh,  18h,  2Fh, 0AEh,	 36h, 0F0h,    6, 0FFh,	   0,	 0
MUSIC_03_YM6:	db  0F0h,  18h,	 85h,  0Ch,    9,    9,	   9, 0F8h, 0C1h,  89h,	   3,  8Ah,    2,  0Ah,	 0Bh,  8Bh
					; DATA XREF: ROM:D946o
		db     3,  89h,	   4,  0Ah,  0Ah,  89h,	 0Ch,  0Ah, 0F8h, 0E0h,	 85h,  0Ch,  89h,    4,	 0Ah,  0Ah
		db   89h,  18h,	0F8h, 0C1h,  80h,  0Bh,	 8Ah,	 1,  89h,  0Ch,	0F8h, 0E0h,  89h,    4,	 8Ah,	 3
		db   8Ah,    2,	 0Ah,  0Ah, 0F8h, 0C6h,	 8Bh,	 2, 0F8h, 0E0h,	0F8h, 0C8h,  8Ah,    2,	0F8h, 0E0h
		db   8Ah,    3,	 89h,	 6, 0FFh,    0,	   0
MUSIC_03_PSG1:	db  0FCh,    1,	0FBh,  4Ch, 0FDh,  0Ch,	0A9h,	 4,  2Eh,  30h,	 35h,  3Ah,  3Ch, 0C1h,	   6,  70h
					; DATA XREF: ROM:D948o
		db  0FDh,    0,	0F0h,  84h, 0FDh,  0Ch,	0A2h,	 4,  25h,  29h,	 2Ah,  2Eh,  31h,  35h,	 31h,  2Eh
		db   2Ah,  29h,	 25h,  27h,  2Ah,  2Eh,	 2Fh,  33h,  36h,  28h,	 2Ch,  2Fh,  33h,  34h,	 38h,  22h
		db   26h,  29h,	 2Eh,  32h,  35h, 0BAh,	 1Eh, 0FDh,    0, 0F0h,	   6, 0FFh,    0,    0
MUSIC_03_PSG2:	db  0FFh,    0,	   0	; DATA XREF: ROM:D94Ao
MUSIC_03_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:D94Co	ROM:D94Eo
MUSIC_04:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 178
		dw MUSIC_04_YM1
		dw MUSIC_04_YM2
		dw MUSIC_04_YM3
		dw MUSIC_04_YM4
		dw MUSIC_04_YM5
		dw MUSIC_04_YM6
		dw MUSIC_04_PSG1
		dw MUSIC_04_PSG2
		dw MUSIC_04_PSG3
		dw MUSIC_04_PSG3
MUSIC_04_YM1:	db  0FEh,  0Dh,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Ch, 0ABh,    5,	0F0h,	 3, 0A9h,    5,	0F0h,	 3
					; DATA XREF: ROM:DAB7o
		db  0ABh,    5,	0F0h,	 3, 0ACh,  36h,	0F0h,	 6, 0FFh,    0,	   0
MUSIC_04_YM2:	db  0FEh,  0Dh,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0A4h,    5,	0F0h,	 3, 0A2h,    5,	0F0h,	 3
					; DATA XREF: ROM:DAB9o
		db  0A4h,    5,	0F0h,	 3, 0A5h,  36h,	0F0h,	 6, 0FFh,    0,	   0
MUSIC_04_YM3:	db  0FEh,  0Dh,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0A2h,    5,	0F0h,	 3, 0A0h,    5,	0F0h,	 3
					; DATA XREF: ROM:DABBo
		db  0A2h,    5,	0F0h,	 3,  9Dh,  36h,	0F0h,	 6, 0FFh,    0,	   0
MUSIC_04_YM4:	db  0FEh,  0Dh,	0FDh,  0Ch, 0FCh,    1,	0FBh,  2Ch,  94h,    8,	 12h,  11h,  8Fh,  36h,	0F0h,	 6
					; DATA XREF: ROM:DABDo
		db  0FFh,    0,	   0
MUSIC_04_YM5:	db  0F9h,  20h,	0F0h,	 3, 0FEh,  0Dh,	0FDh,	 9, 0FCh,    1,	0FBh,  2Ch, 0ABh,    5,	0F0h,	 3
					; DATA XREF: ROM:DABFo
		db  0A9h,    5,	0F0h,	 3, 0ABh,    5,	0F0h,	 3, 0ACh,  36h,	0F0h,	 3, 0FFh,    0,	   0
MUSIC_04_YM6:	db   89h,    8,	   9,	 9,  8Ah,    4,	 8Ah,	 3,  8Ah,    2,	 0Ah,  0Ah,  0Ah, 0F8h,	0CCh,  8Bh
					; DATA XREF: ROM:DAC1o
		db     2, 0F8h,	0E0h,  8Ah,    2,  0Ah,	 8Ah,	 3,  89h,    6,	0FFh,	 0,    0
MUSIC_04_PSG1:	db  0FFh,    0,	   0	; DATA XREF: ROM:DAC3o
MUSIC_04_PSG2:	db  0FFh,    0,	   0	; DATA XREF: ROM:DAC5o
MUSIC_04_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:DAC7o	ROM:DAC9o
MUSIC_05:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 168
		dw MUSIC_05_YM1
		dw MUSIC_05_YM2
		dw MUSIC_05_YM3
		dw MUSIC_05_YM4
		dw MUSIC_05_YM5
		dw MUSIC_05_YM6
		dw MUSIC_05_PSG1
		dw MUSIC_05_PSG2
		dw MUSIC_05_PSG3
		dw MUSIC_05_PSG3
MUSIC_05_YM1:	db  0FEh,  1Ah,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0A0h,  19h,	 9Dh,  18h, 0F0h,    9,	0FDh,  0Bh
					; DATA XREF: ROM:DB78o
		db  0AFh,    8,	 31h, 0B5h,  12h, 0B3h,	   8, 0B2h,  64h, 0F0h,	   6, 0FFh,    0,    0
MUSIC_05_YM2:	db  0FEh,  1Ah,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Ch, 0F0h,    9,	0A8h,	 8,  29h, 0ACh,	 11h, 0ABh
					; DATA XREF: ROM:DB7Ao
		db     7, 0ACh,	 33h, 0FDh,  0Ah, 0ABh,	 64h, 0F0h,    6, 0FFh,	   0,	 0
MUSIC_05_YM3:	db  0FEh,  1Ah,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0A6h,  31h,	0A7h,  19h, 0A3h,  1Ah,	0F0h,  18h
					; DATA XREF: ROM:DB7Co
		db  0FEh,  3Fh,	0FDh,	 7, 0FCh,    1,	0ABh,  0Ah, 0A4h,    3,	 24h, 0A4h,    4, 0A4h,	   3, 0A4h
		db     4,  24h,	0ABh,	 8,  98h,    5,	 18h,  98h,    6, 0A4h,	   9,  9Fh,    6,  9Fh,	   5,  9Fh
		db     6, 0F0h,	   1, 0FFh,    0,    0
MUSIC_05_YM4:	db  0FEh,  1Ah,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch,  96h,  31h,	 99h,  33h,  9Bh,  64h,	0F0h,	 6
					; DATA XREF: ROM:DB7Eo
		db  0FFh,    0,	   0
MUSIC_05_YM5:	db  0F0h,  64h,	0F0h,  22h, 0FEh,  3Fh,	0FDh,	 6, 0FCh,    1,	0FBh,	 0, 0ADh,    2,	 2Dh,  2Dh
					; DATA XREF: ROM:DB80o
		db  0B0h,    3,	 30h,  30h,  30h, 0A9h,	   4,  29h, 0A9h,    2,	 2Dh,  2Dh,  2Dh,  30h,	0B0h,	 3
		db  0B0h,    2,	0B0h,	 3, 0B0h,    4,	0ADh,	 2,  2Dh,  29h,	0A9h,	 3, 0A9h,    2,	 26h,  2Dh
		db  0ADh,    3,	0ADh,	 4, 0F0h,    2,	0FFh,	 0,    0
MUSIC_05_YM6:	db  0FFh,    0,	   0	; DATA XREF: ROM:DB82o
MUSIC_05_PSG1:	db  0FDh,    0,	0FCh,	 1, 0FBh,  4Ch,	0F0h,  75h, 0FDh,  2Ah,	0C3h,	 6, 0BFh,    5,	0BEh,	 4
					; DATA XREF: ROM:DB84o
		db   3Ah, 0B7h,	   3,  33h,  32h,  2Eh,	 2Bh,  27h,  26h,  22h,	 1Fh,  9Bh,  24h, 0FDh,	   0, 0F0h
		db     7, 0FFh,	   0,	 0
MUSIC_05_PSG2:	db  0FDh,    0,	0FCh,	 1, 0FBh,  4Ch,	0F0h,  78h, 0FDh,  28h,	0C3h,	 6, 0BFh,    5,	0BEh,	 4
					; DATA XREF: ROM:DB86o
		db   3Ah, 0B7h,	   3,  33h,  32h,  2Eh,	 2Bh,  27h,  26h,  22h,	 1Fh,  9Bh,  24h, 0FDh,	   0, 0F0h
		db     4, 0FFh,	   0,	 0
MUSIC_05_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:DB88o	ROM:DB8Ao
MUSIC_06:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 190
		dw MUSIC_06_YM1
		dw MUSIC_06_YM2
		dw MUSIC_06_YM3
		dw MUSIC_06_YM4
		dw MUSIC_06_YM5
		dw MUSIC_06_YM6
		dw MUSIC_06_PSG1
		dw MUSIC_06_PSG2
		dw MUSIC_06_PSG3
		dw MUSIC_06_PSG3
MUSIC_06_YM1:	db  0FEh,  13h,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Ch, 0F0h,  0Ch,	0B0h,	 6,  70h, 0B5h,	 12h, 0B7h
					; DATA XREF: ROM:DC9Ao
		db     6, 0FCh,	   4, 0B7h,  0Ah, 0FDh,	   9,  37h, 0FDh,    7,	 37h, 0FDh,    5,  37h,	0FDh,	 3
		db   37h, 0FDh,	   2,  37h, 0FDh,    1,	 37h, 0F0h,    1, 0FFh,	   0,	 0
MUSIC_06_YM2:	db  0FEh,  1Fh,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0ABh,  30h,	0FCh,	 4, 0FEh,  28h,	0FDh,  0Ch
					; DATA XREF: ROM:DC9Co
		db  0B2h,  0Ah,	0FDh,  0Ah,  32h, 0FDh,	   8,  32h, 0FDh,    6,	 32h, 0FDh,    4,  32h,	0FDh,	 3
		db   32h, 0FDh,	   2,  32h, 0F0h,    1,	0FFh,	 0,    0
MUSIC_06_YM3:	db  0FEh,  1Fh,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0A9h,  30h,	0FCh,	 4, 0FEh,  28h,	0FDh,  0Ch
					; DATA XREF: ROM:DC9Eo
		db  0B0h,  0Ah,	0FDh,  0Ah,  30h, 0FDh,	   8,  30h, 0FDh,    6,	 30h, 0FDh,    4,  30h,	0FDh,	 3
		db   30h, 0FDh,	   2,  30h, 0F0h,    1,	0FFh,	 0,    0
MUSIC_06_YM4:	db  0FEh,  35h,	0FDh,  0Ch, 0FCh,    1,	0FBh,  2Ch,  80h,  30h,	0FCh,	 4, 0FEh,  28h,	0FDh,  0Ch
					; DATA XREF: ROM:DCA0o
		db  0AEh,  0Ah,	0FDh,  0Ah,  2Eh, 0FDh,	   8,  2Eh, 0FDh,    6,	 2Eh, 0FDh,    4,  2Eh,	0FDh,	 3
		db   2Eh, 0FDh,	   2,  2Eh, 0F0h,    1,	0FFh,	 0,    0
MUSIC_06_YM5:	db  0FEh,  27h,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Ch, 0F0h,  0Ch,	0B0h,	 6,  70h, 0B5h,	 12h, 0B7h
					; DATA XREF: ROM:DCA2o
		db     6, 0B7h,	 0Ah, 0FDh,    9,  37h,	0FDh,	 7,  37h, 0FDh,	   5,  37h, 0FDh,    3,	 37h, 0FDh
		db     2,  37h,	0FDh,	 1,  37h, 0F0h,	   1, 0FFh,    0,    0
MUSIC_06_YM6:	db  0FFh,    0,	   0	; DATA XREF: ROM:DCA4o
MUSIC_06_PSG1:	db  0FFh,    0,	   0	; DATA XREF: ROM:DCA6o
MUSIC_06_PSG2:	db  0FFh,    0,	   0	; DATA XREF: ROM:DCA8o
MUSIC_06_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:DCAAo	ROM:DCACo
MUSIC_07:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 188
		dw MUSIC_07_YM1
		dw MUSIC_07_YM2
		dw MUSIC_07_YM3
		dw MUSIC_07_YM4
		dw MUSIC_07_YM5
		dw MUSIC_07_YM6
		dw MUSIC_07_PSG1
		dw MUSIC_07_PSG2
		dw MUSIC_07_PSG3
		dw MUSIC_07_PSG3
MUSIC_07_YM1:	db  0FEh,  1Ah,	0FDh,  0Ch, 0FCh,    1,	0FBh,  2Ch, 0B7h,  10h,	0BAh,  0Eh, 0B9h,  0Dh,	0B8h,  0Ch
					; DATA XREF: ROM:DD8Fo
		db  0B7h,  0Bh,	0BAh,  0Ah, 0B9h,    9,	 38h, 0B5h,    6, 0B1h,	   5, 0B5h,    4,  38h,	0BBh,	 3
		db   3Dh,  41h,	0BFh,  44h, 0F0h,    6,	0FFh,	 0,    0
MUSIC_07_YM2:	db  0FEh,  1Ah,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Ch, 0B3h,  10h,	0B7h,  0Eh, 0B5h,  0Dh,	0B4h,  0Ch
					; DATA XREF: ROM:DD91o
		db  0B3h,  0Bh,	0B7h,  0Ah, 0B5h,    9,	 34h, 0A9h,  60h, 0F0h,	   6, 0FFh,    0,    0
MUSIC_07_YM3:	db  0F0h,    8,	0FEh,  1Ah, 0FDh,    9,	0FCh,	 1, 0FBh,  2Ch,	0AEh,  0Fh, 0B3h,  0Eh,	0B0h,  0Ch
					; DATA XREF: ROM:DD93o
		db   2Fh, 0AEh,	 0Ah,  33h, 0B0h,    8,	0AFh,	 5, 0FDh,  0Ah,	0A3h,  60h, 0F0h,    6,	0FFh,	 0
		db     0
MUSIC_07_YM4:	db  0FEh,  1Ah,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Ch, 0ACh,  10h,	0A8h,  0Eh, 0AAh,  0Dh,	0ABh,  0Ch
					; DATA XREF: ROM:DD95o
		db  0ACh,  0Bh,	0A8h,  0Ah, 0AAh,    9,	 2Bh, 0FEh,  22h,  8Dh,	 60h, 0F0h,    6, 0FFh,	   0,	 0
MUSIC_07_YM5:	db  0F9h,  20h,	0F0h,	 6, 0FEh,  1Ah,	0FDh,	 9, 0FCh,    1,	0FBh,  2Ch, 0B7h,  10h,	0BAh,  0Eh
					; DATA XREF: ROM:DD97o
		db  0B9h,  0Dh,	0B8h,  0Ch, 0B7h,  0Bh,	0BAh,  0Ah, 0B9h,    9,	 38h, 0B5h,    6, 0B1h,	   5, 0B5h
		db     4,  38h,	0BBh,	 3,  3Dh,  41h,	0BFh,  44h, 0FFh,    0,	   0
MUSIC_07_YM6:	db  0FFh,    0,	   0	; DATA XREF: ROM:DD99o
MUSIC_07_PSG1:	db  0FFh,    0,	   0	; DATA XREF: ROM:DD9Bo
MUSIC_07_PSG2:	db  0FFh,    0,	   0	; DATA XREF: ROM:DD9Do
MUSIC_07_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:DD9Fo	ROM:DDA1o
MUSIC_08:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 185
		dw MUSIC_08_YM1
		dw MUSIC_08_YM2
		dw MUSIC_08_YM3
		dw MUSIC_08_YM4
		dw MUSIC_08_YM5
		dw MUSIC_08_YM6
		dw MUSIC_08_PSG1
		dw MUSIC_08_PSG2
		dw MUSIC_08_PSG3
		dw MUSIC_08_PSG3
MUSIC_08_YM1:	db  0FEh,    6,	0FDh,  0Ch, 0FCh,    1,	0FBh,  2Ch, 0F8h, 0C1h,	0ACh,	 3,  31h,  32h,	 34h,  38h
					; DATA XREF: ROM:DE66o
		db   3Ah,  3Eh,	 31h,  38h,  39h,  3Bh,	 3Fh,  43h,  41h, 0F8h,	0E0h, 0BDh,    3,  3Ch,	0F0h,	 5
		db  0FFh,    0,	   0
MUSIC_08_YM2:	db  0FEh,    6,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Ch, 0FAh,  40h,	0F0h,	 2, 0F8h, 0C1h,	0ACh,	 3
					; DATA XREF: ROM:DE68o
		db   31h,  32h,	 34h,  38h,  3Ah,  3Eh,	 31h,  38h,  39h,  3Bh,	 3Fh,  43h,  41h, 0F8h,	0E0h, 0BDh
		db     3,  3Ch,	 70h, 0FFh,    0,    0
MUSIC_08_YM3:	db  0FEh,    6,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0FAh,  80h,	0F0h,	 4, 0F8h, 0C1h,	0ACh,	 3
					; DATA XREF: ROM:DE6Ao
		db   31h,  32h,	 34h,  38h,  3Ah,  3Eh,	 31h,  38h,  39h,  3Bh,	 3Fh,  43h,  41h, 0F8h,	0E0h, 0BDh
		db     3,  3Ch,	0F0h,	 1, 0FFh,    0,	   0
MUSIC_08_YM4:	db  0FFh,    0,	   0	; DATA XREF: ROM:DE6Co
MUSIC_08_YM5:	db  0FFh,    0,	   0	; DATA XREF: ROM:DE6Eo
MUSIC_08_YM6:	db  0FFh,    0,	   0	; DATA XREF: ROM:DE70o
MUSIC_08_PSG1:	db  0FFh,    0,	   0	; DATA XREF: ROM:DE72o
MUSIC_08_PSG2:	db  0FFh,    0,	   0	; DATA XREF: ROM:DE74o
MUSIC_08_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:DE76o	ROM:DE78o
MUSIC_0B:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 208
		dw MUSIC_0B_YM1
		dw MUSIC_0B_YM2
		dw MUSIC_0B_YM3
		dw MUSIC_0B_YM4
		dw MUSIC_0B_YM5
		dw MUSIC_0B_YM6
		dw MUSIC_0B_PSG1
		dw MUSIC_0B_PSG2
		dw MUSIC_0B_PSG3
		dw MUSIC_0B_PSG3
MUSIC_0B_YM1:	db  0FEh,  0Dh,	0FDh,  0Ah, 0FCh,    1,	0FBh,  4Ah, 0B5h,  0Ah,	0F0h,  0Eh, 0B5h,  0Ah,	0F0h,  0Eh
					; DATA XREF: ROM:DF00o
		db  0B5h,  0Ah,	0F0h,  0Eh, 0F8h, 0C1h,	0B5h,  14h, 0F0h,    4,	 35h,  70h,  35h,  70h,	 35h,  70h
		db  0B5h,    6,	0F0h,  12h, 0B5h,    6,	0F0h,  12h, 0F8h, 0E0h,	0B5h,  3Ch, 0F0h,  0Ch,	0B5h,	 4
		db   70h,  35h,	 70h,  35h,  70h, 0B5h,	 60h, 0F0h,    6, 0FFh,	   0,	 0
MUSIC_0B_YM2:	db  0FEh,  0Dh,	0FDh,  0Ah, 0FCh,    1,	0FBh,  4Ah, 0AEh,  0Ah,	0F0h,  0Eh, 0AEh,  0Ah,	0F0h,  0Eh
					; DATA XREF: ROM:DF02o
		db  0AEh,  0Ah,	0F0h,  0Eh, 0F8h, 0C1h,	0AEh,  14h, 0F0h,    4,	 2Eh,  70h,  2Eh,  70h,	 2Eh,  70h
		db  0AEh,    6,	0F0h,  12h, 0AEh,    6,	0F0h,  12h, 0F8h, 0E0h,	0A9h,  3Ch, 0F0h,  0Ch,	0A9h,	 4
		db   70h,  29h,	 70h,  29h,  70h, 0A9h,	 60h, 0F0h,    6, 0FFh,	   0,	 0
MUSIC_0B_YM3:	db  0FEh,  0Dh,	0FDh,  0Ah, 0FCh,    1,	0FBh,  4Ah, 0A7h,  0Ah,	0F0h,  0Eh, 0A7h,  0Ah,	0F0h,  0Eh
					; DATA XREF: ROM:DF04o
		db  0A9h,  0Ah,	0F0h,  0Eh, 0F8h, 0C1h,	0ABh,  14h, 0F0h,    4,	 29h,  70h,  29h,  70h,	 29h,  70h
		db  0A7h,    6,	0F0h,  12h, 0A7h,    6,	0F0h,  12h, 0F8h, 0E0h,	0A5h,  3Ch, 0F0h,  0Ch,	0A5h,	 4
		db   70h,  25h,	 70h,  25h,  70h, 0A4h,	 60h, 0F0h,    6, 0FFh,	   0,	 0
MUSIC_0B_YM4:	db  0FEh,  1Ah,	0FDh,  0Ch, 0FCh,    1,	0FBh,  4Ah,  9Dh,  0Ch,	 70h,  22h,  70h,  24h,	 70h, 0F8h
					; DATA XREF: ROM:DF06o
		db  0C1h, 0A7h,	 16h, 0F0h,    2, 0A6h,	   6, 0F0h,    2, 0A4h,	   6, 0F0h,    2, 0A2h,	   6, 0F0h
		db     2, 0A4h,	   8, 0F0h,  10h, 0A9h,	   8, 0F0h,  10h, 0F8h,	0E0h, 0ACh,  3Eh, 0F0h,	 0Ah, 0ACh
		db     6, 0F0h,	   2, 0ACh,    6, 0F0h,	   2, 0ACh,    6, 0F0h,	   2, 0ADh,  60h, 0F0h,	   6, 0FFh
		db     0,    0
MUSIC_0B_YM5:	db  0F0h,    6,	0F9h,  20h, 0FEh,  1Ah,	0FDh,	 9, 0FCh,    1,	0FBh,  4Ah,  9Dh,  0Ch,	 70h,  22h
					; DATA XREF: ROM:DF08o
		db   70h,  24h,	 70h, 0F8h, 0C1h, 0A7h,	 16h, 0F0h,    2, 0A6h,	   6, 0F0h,    2, 0A4h,	   6, 0F0h
		db     2, 0A2h,	   6, 0F0h,    2, 0A4h,	   8, 0F0h,  10h, 0A9h,	   8, 0F0h,  10h, 0F8h,	0E0h, 0ACh
		db   3Eh, 0F0h,	 0Ah, 0ACh,    6, 0F0h,	   2, 0ACh,    6, 0F0h,	   2, 0ACh,    6, 0F0h,	   2, 0ADh
		db   60h, 0F0h,	   1, 0FFh,    0,    0
MUSIC_0B_YM6:	db  0FFh,    0,	   0	; DATA XREF: ROM:DF0Ao
MUSIC_0B_PSG1:	db  0FFh,    0,	   0	; DATA XREF: ROM:DF0Co
MUSIC_0B_PSG2:	db  0FFh,    0,	   0	; DATA XREF: ROM:DF0Eo
MUSIC_0B_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:DF10o	ROM:DF12o
MUSIC_0A:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 204
		dw MUSIC_0A_YM1
		dw MUSIC_0A_YM2
		dw MUSIC_0A_YM3
		dw MUSIC_0A_YM4
		dw MUSIC_0A_YM5
		dw MUSIC_0A_YM6
		dw MUSIC_0A_PSG1
		dw MUSIC_0A_PSG2
		dw MUSIC_0A_PSG3
		dw MUSIC_0A_PSG3
MUSIC_0A_YM1:	db  0FEh,  38h,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Fh, 0B2h,  3Ch,	0F0h,  0Ch, 0ABh,    8,	0F0h,  10h
					; DATA XREF: ROM:E060o
		db  0B0h,  1Ch,	0F0h,  0Ah,  32h, 0B2h,	 3Ch, 0F0h,  0Ch, 0ABh,	   8, 0F0h,  0Eh, 0B0h,	   8, 0F0h
		db   0Ah, 0B2h,	   8,  70h,  34h,  70h,	0B5h,  3Ch, 0F0h,  0Ch,	0AEh,	 8, 0F0h,  10h,	0B3h,  1Ch
		db  0F0h,  0Ah,	 35h, 0B5h,  3Ch, 0F0h,	 0Ch, 0AEh,    8, 0F0h,	 0Eh, 0B3h,    8, 0F0h,	 0Ah, 0B5h
		db     8,  70h,	 37h,  70h, 0B9h,  0Ah,	0F0h,  0Eh, 0B6h,  0Ah,	0F0h,  0Eh, 0B2h,  0Ah,	0F0h,  0Eh
		db  0AFh,  0Ah,	0F0h,  0Eh, 0ABh,  1Ch,	0F0h,  0Ah,  2Dh, 0FCh,	 80h, 0AFh,  90h, 0FBh,	 20h, 0FCh
		db     1, 0AFh,	0A0h, 0F0h,    7, 0FFh,	   0,	 0
MUSIC_0A_YM2:	db  0F0h,  30h,	0FEh,  1Bh, 0FDh,  0Ah,	0FCh,	 1, 0FBh,  2Fh,	 9Ah,  1Eh, 0F0h,    8,	 9Ah,  0Ah
					; DATA XREF: ROM:E062o
		db  0A6h,  48h,	0F0h,  18h,  9Ah,  1Eh,	0F0h,	 8,  9Ah,  0Ah,	0A6h,  48h, 0F0h,  18h,	 96h,  1Eh
		db  0F0h,    8,	 96h,  0Ah, 0A2h,  48h,	0F0h,  18h, 0A2h,  1Eh,	0F0h,	 8, 0A2h,  0Ah,	0AEh,  30h
		db  0F0h,  90h,	0F0h,  48h,  9Eh,  0Ah,	0F0h,  0Eh, 0A3h,  26h,	0A5h,  0Ah, 0A7h, 0A0h,	0F0h,	 7
		db  0FFh,    0,	   0
MUSIC_0A_YM3:	db  0FCh,    1,	0FBh,  2Fh, 0F8h, 0C1h,	0F0h,  18h, 0FEh,  1Ah,	0FDh,  0Bh,  9Ah,    8,	 1Fh,  21h
					; DATA XREF: ROM:E064o
		db   24h,  1Fh,	 21h,  24h,  26h,  21h,	 24h,  26h,  2Bh,  26h,	 2Bh,  2Dh, 0F8h, 0E0h,	0F8h, 0C1h
		db  0F0h,  18h,	 9Dh,	 8,  22h,  24h,	 27h,  22h,  24h,  27h,	 29h,  24h,  27h,  29h,	 2Eh,  29h
		db   2Eh,  30h,	0F8h, 0E0h, 0B9h,    8,	 39h,  39h,  36h,  36h,	 36h,  32h,  32h,  32h,	 2Fh,  2Fh
		db   2Fh, 0ABh,	 1Ch, 0F0h,  0Ah,  2Dh,	0AFh,  0Ch,  70h, 0A3h,	   8,  28h,  2Ah,  2Dh,	 2Ah,  2Dh
		db   2Fh,  31h,	 34h, 0B6h, 0D0h, 0F0h,	   7, 0FFh,    0,    0
MUSIC_0A_YM4:	db  0FEh,  1Eh,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Fh, 0F8h, 0C1h,	0F0h,  30h, 0FCh,  80h,	0FCh, 0FFh
					; DATA XREF: ROM:E066o
		db   85h,    2,	0FCh, 0A0h,    6, 0FCh,	   1,  87h,  5Ch, 0F8h,	0E0h, 0F0h,  30h, 0FCh,	 80h, 0FCh
		db  0FFh,  88h,	   2, 0FCh, 0A0h,    9,	0FCh,	 1,  8Ah,  5Ch,	0F0h,  30h, 0FCh,  80h,	0FCh, 0FFh
		db   84h,    2,	0FCh, 0A0h,    5, 0FCh,	   1,  86h,  5Ch, 0FCh,	0FFh,  87h,  0Ah, 0F0h,	 0Eh,  8Bh
		db   0Ah, 0F0h,	 0Eh,  8Ch,  0Ah, 0F0h,	 0Eh,  90h,  0Ah, 0F0h,	 26h,  8Eh,  18h, 0F0h,	 30h, 0FCh
		db   80h,  89h,	   2, 0FCh, 0A0h,  0Ah,	0FCh,	 1,  8Bh, 0FCh,	0F0h,	 7, 0FFh,    0,	   0
MUSIC_0A_YM5:	db  0F9h,  20h,	0F0h,	 6, 0FEh,  38h,	0FDh,	 9, 0FCh,    1,	0FBh,  2Fh, 0B2h,  3Ch,	0F0h,  0Ch
					; DATA XREF: ROM:E068o
		db  0ABh,    8,	0F0h,  10h, 0B0h,  1Ch,	0F0h,  0Ah,  32h, 0B2h,	 3Ch, 0F0h,  0Ch, 0ABh,	   8, 0F0h
		db   0Eh, 0B0h,	   8, 0F0h,  0Ah, 0B2h,	   8,  70h,  34h,  70h,	0B5h,  3Ch, 0F0h,  0Ch,	0AEh,	 8
		db  0F0h,  10h,	0B3h,  1Ch, 0F0h,  0Ah,	 35h, 0B5h,  3Ch, 0F0h,	 0Ch, 0AEh,    8, 0F0h,	 0Eh, 0B3h
		db     8, 0F0h,	 0Ah, 0B5h,    8,  70h,	 37h,  70h, 0B9h,  0Ah,	0F0h,  0Eh, 0B6h,  0Ah,	0F0h,  0Eh
		db  0B2h,  0Ah,	0F0h,  0Eh, 0AFh,  0Ah,	0F0h,  0Eh, 0ABh,  1Ch,	0F0h,  0Ah,  2Dh, 0FCh,	 80h, 0AFh
		db   90h, 0FBh,	 20h, 0FCh,    1, 0AFh,	0A0h, 0F0h,    1, 0FFh,	   0,	 0
MUSIC_0A_YM6:	db  0F8h, 0C3h,	 85h,  30h,  80h,  18h,	   9,  89h,    4,  0Ah,	 0Ah,  0Ah,  0Ah,  0Bh,	 89h,  18h
					; DATA XREF: ROM:E06Ao
		db  0F8h, 0E0h,	 89h,  18h,    9,    9,	   9,  89h,    4,  0Ah,	 0Ah,  0Ah,  0Ah,  0Bh,	 81h,  18h
		db   85h,  30h,	 80h,  60h, 0F0h, 0A0h,	0FFh,	 0,    0
MUSIC_0A_PSG1:	db  0FDh,  7Bh,	0FCh,	 1, 0FBh,  4Fh,	0ADh,  3Ch, 0F0h,  0Ch,	0A6h,	 8, 0F0h,  10h,	0ABh,  1Ch
					; DATA XREF: ROM:E06Co
		db  0F0h,  0Ah,	 2Dh, 0ADh,  3Ch, 0F0h,	 0Ch, 0A6h,    8, 0F0h,	 0Eh, 0ABh,    8, 0F0h,	 0Ah, 0ADh
		db     8,  70h,	 2Fh,  70h, 0B0h,  3Ch,	0F0h,  0Ch, 0A9h,    8,	0F0h,  10h, 0AEh,  1Ch,	0F0h,  0Ah
		db   30h, 0B0h,	 3Ch, 0F0h,  0Ch, 0A9h,	   8, 0F0h,  0Eh, 0AEh,	   8, 0F0h,  0Ah, 0B0h,	   8,  70h
		db   32h,  70h,	0B6h,  0Ah, 0F0h,  0Eh,	0B3h,  0Ah, 0F0h,  0Eh,	0AFh,  0Ah, 0F0h,  0Eh,	0ACh,  0Ah
		db  0F0h,  0Eh,	0A8h,  1Ch, 0F0h,  0Ah,	 28h, 0FCh,  80h, 0A7h,	 90h, 0FBh,  40h, 0FCh,	   1, 0A7h
		db  0A0h, 0FDh,	   0, 0F0h,    7, 0FFh,	   0,	 0
MUSIC_0A_PSG2:	db  0FDh,  7Bh,	0FCh,	 1, 0FBh,  4Fh,	0ABh,  3Ch, 0F0h,  0Ch,	0A4h,	 8, 0F0h,  10h,	0A9h,  1Ch
					; DATA XREF: ROM:E06Eo
		db  0F0h,  0Ah,	 2Bh, 0ABh,  3Ch, 0F0h,	 0Ch, 0A4h,    8, 0F0h,	 0Eh, 0A9h,    8, 0F0h,	 0Ah, 0ABh
		db     8,  70h,	 2Dh,  70h, 0AEh,  3Ch,	0F0h,  0Ch, 0A7h,    8,	0F0h,  10h, 0ACh,  1Ch,	0F0h,  0Ah
		db   2Eh, 0AEh,	 3Ch, 0F0h,  0Ch, 0A7h,	   8, 0F0h,  0Eh, 0ACh,	   8, 0F0h,  0Ah, 0AEh,	   8,  70h
		db   30h,  70h,	0B2h,  0Ah, 0F0h,  0Eh,	0AFh,  0Ah, 0F0h,  0Eh,	0ABh,  0Ah, 0F0h,  0Eh,	0A8h,  0Ah
		db  0F0h,  0Eh,	0A4h,  1Ch, 0F0h,  0Ah,	 24h, 0FCh,  80h, 0A3h,	 90h, 0FBh,  40h, 0FCh,	   1, 0A3h
		db  0A0h, 0FDh,	   0, 0F0h,    7, 0FFh,	   0,	 0
MUSIC_0A_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:E070o	ROM:E072o
MUSIC_0C:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 196
		dw MUSIC_0C_YM1
		dw MUSIC_0C_YM2
		dw MUSIC_0C_YM3
		dw MUSIC_0C_NULL
		dw MUSIC_0C_NULL
		dw MUSIC_0C_NULL
		dw MUSIC_0C_NULL
		dw MUSIC_0C_NULL
		dw MUSIC_0C_NULL
		dw MUSIC_0C_NULL
MUSIC_0C_YM1:	db  0F8h,    0,	0FEh,  12h, 0FDh,  0Dh,	0FCh,	 0, 0FBh,  4Ch,	0FCh,  80h, 0D1h,  48h,	0FCh,  87h
					; DATA XREF: ROM:E344o
		db  0D2h,    3,	 51h,  52h,  51h,  52h,	 51h,  52h,  51h,  52h,	 51h,  52h,  51h,  52h,	 51h,  52h
		db   51h,  52h,	 51h,  52h,  51h,  52h,	 51h, 0FDh,  0Ch,  52h,	 51h, 0FDh,  0Bh,  52h,	 51h, 0FDh
		db   0Ah,  52h,	 51h, 0FDh,    9,  52h,	 51h, 0FDh,    8,  52h,	 51h, 0FDh,    7,  52h,	 51h, 0FDh
		db     6,  52h,	 51h, 0FDh,    5,  52h,	 51h, 0FDh,    4,  52h,	0FCh,	 1,  51h, 0F0h,	 60h,  70h
		db   70h, 0F8h,	0A1h
MUSIC_0C_YM2:	db  0F8h,    0,	0F0h,	 2, 0FAh,  40h,	0F9h,  20h, 0FEh,  12h,	0FDh,  0Bh, 0FCh,    0,	0FBh,  4Ch
					; DATA XREF: ROM:E346o
		db  0FCh,  80h,	0D1h,  48h, 0FCh,  87h,	0D2h,	 3,  51h,  52h,	 51h,  52h,  51h,  52h,	 51h,  52h
		db   51h,  52h,	 51h,  52h,  51h,  52h,	 51h,  52h,  51h,  52h,	 51h,  52h,  51h, 0FDh,	 0Ah,  52h
		db   51h, 0F0h,	 30h, 0FDh,  0Dh, 0FCh,	 80h, 0D1h,  48h, 0FCh,	 87h, 0D2h,    3,  51h,	 52h,  51h
		db   52h,  51h,	 52h,  51h,  52h,  51h,	 52h,  51h,  52h,  51h,	 52h,  51h,  52h,  51h,	 52h,  51h
		db   52h,  51h,	0FDh,  0Ch,  52h,  51h,	0FDh,  0Bh,  52h,  51h,	0FDh,  0Ah,  52h,  51h,	0FDh,	 9
		db   52h,  51h,	0FDh,	 8,  52h,  51h,	0FDh,	 7,  52h,  51h,	0FDh,	 6,  52h,  51h,	0FDh,	 5
		db   52h,  51h,	0FDh,	 4,  52h, 0FCh,	   1,  51h, 0F0h,  2Eh,	0F8h, 0A1h
MUSIC_0C_YM3:	db  0F8h,    0,	0FAh,  80h, 0F0h,    1,	0F9h,  10h, 0FEh,  12h,	0FDh,  0Bh, 0FCh,    0,	0FBh,  4Ch
					; DATA XREF: ROM:E348o
		db  0FCh,  80h,	0D1h,  48h, 0FCh,  87h,	0D2h,	 3,  51h,  52h,	 51h,  52h,  51h,  52h,	 51h,  52h
		db   51h,  52h,	 51h,  52h,  51h,  52h,	 51h,  52h,  51h,  52h,	 51h,  52h,  51h, 0FDh,	 0Ah,  52h
		db   51h, 0F0h,	   5, 0FDh,  0Dh, 0FCh,	 80h, 0D1h,  48h, 0FCh,	 87h, 0D2h,    3,  51h,	 52h,  51h
		db   52h,  51h,	 52h,  51h,  52h,  51h,	 52h,  51h,  52h,  51h,	 52h,  51h,  52h,  51h,	 52h,  51h
		db   52h,  51h,	0FDh,  0Ch,  52h,  51h,	0FDh,  0Bh,  52h,  51h,	0FDh,  0Ah,  52h,  51h,	0FDh,	 9
		db   52h,  51h,	0FDh,	 8,  52h,  51h,	0FDh,	 7,  52h,  51h,	0FDh,	 6,  52h,  51h,	0FDh,	 5
		db   52h,  51h,	0FDh,	 4,  52h, 0FCh,	   1,  51h, 0F0h,  59h,	0F8h, 0A1h
MUSIC_0C_NULL:	db  0FFh,    0,	   0	; DATA XREF: ROM:E34Ao	ROM:E34Co ...
MUSIC_0D:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 176
		dw MUSIC_0D_YM1
		dw MUSIC_0D_YM2
		dw MUSIC_0D_YM3
		dw MUSIC_0D_YM4
		dw MUSIC_0D_YM5
		dw MUSIC_0D_YM6
		dw MUSIC_0D_PSG1
		dw MUSIC_0D_PSG2
		dw MUSIC_0D_PSG3
		dw MUSIC_0D_PSG3
MUSIC_0D_YM1:	db  0FCh,    1,	0FBh,  2Ch, 0F0h,  60h,	 70h, 0F8h,    0, 0F0h,	 0Ch, 0FEh,    5, 0FDh,	 0Ch,  1Ch
					; DATA XREF: ROM:E4AAo
		db   1Dh,  20h,	 23h,  24h,  2Bh,  2Ah,	0FCh,  80h, 0A9h,    3,	 2Bh,  29h, 0FCh,    1,	0A8h,  4Bh
		db  0ABh,  0Ch,	0FCh,  80h, 0A9h,    3,	 2Bh,  29h, 0FCh,    1,	0A8h,  57h, 0A7h,    0,	0FCh,  85h
		db  0A8h,  48h,	0FCh, 0FFh,  9Dh,  30h,	0FCh,  80h, 0A0h,    4,	0A3h,	 3, 0FCh,    1,	0A0h,  35h
		db   9Dh,  16h,	0A0h,	 9, 0A3h,    8,	 26h, 0F0h,  0Ah, 0A5h,	   0, 0FCh,  85h, 0A6h,	 93h, 0FCh
		db  0FFh, 0A0h,	 30h, 0A1h,    4, 0A0h,	 2Ch, 0A8h,    0, 0FCh,	 85h, 0A9h,  30h, 0FCh,	0FFh, 0F8h
		db  0A1h
MUSIC_0D_YM2:	db  0FEh,  35h,	0FDh,  0Bh, 0FCh,    8,	0FBh,  2Ch, 0F8h,    0,	 97h,  18h,  97h,  0Ch,	 17h, 0F8h
					; DATA XREF: ROM:E4ACo
		db  0A1h
MUSIC_0D_YM3:	db  0FEh,  35h,	0FDh,  0Bh, 0FCh,    8,	0FBh,  2Ch, 0F8h,    0,	 95h,  18h,  95h,  0Ch,	 15h, 0F8h
					; DATA XREF: ROM:E4AEo
		db  0A1h
MUSIC_0D_YM4:	db  0FEh,  35h,	0FDh,  0Dh, 0FCh,    8,	0FBh,  2Ch, 0F8h,    0,	 89h,  18h,  90h,  0Ch,	 10h, 0F8h
					; DATA XREF: ROM:E4B0o
		db  0A1h
MUSIC_0D_YM5:	db  0F9h,  20h,	0FCh,	 1, 0FBh,  2Ch,	0F0h,  66h, 0F0h,  60h,	0F8h,	 0, 0F0h,  0Ch,	0FEh,	 5
					; DATA XREF: ROM:E4B2o
		db  0FDh,  0Ah,	 1Ch,  1Dh,  20h,  23h,	 24h,  2Bh,  2Ah, 0FCh,	 80h, 0A9h,    3,  2Bh,	0FCh,	 1
		db   29h, 0A8h,	 4Bh, 0ABh,  0Ch, 0FCh,	 80h, 0A9h,    3,  2Bh,	 29h, 0FCh,    1, 0A8h,	 57h, 0A7h
		db     0, 0FCh,	 85h, 0A8h,  48h, 0FCh,	0FFh,  9Dh,  30h, 0FCh,	 80h, 0A0h,    4, 0A3h,	   3, 0FCh
		db     1, 0A0h,	 35h,  9Dh,  16h, 0A0h,	   9, 0A3h,    8,  26h,	0F0h,  0Ah, 0A5h,    0,	0FCh,  85h
		db  0A6h,  93h,	0FCh, 0FFh, 0A0h,  30h,	0A1h,	 4, 0A0h,  2Ch,	0A8h,	 0, 0FCh,  85h,	0A9h,  30h
		db  0FCh, 0FFh,	0F8h, 0A1h
MUSIC_0D_YM6:	db  0F0h,  60h,	0F0h,  0Ch,  84h,    6,	   4,  80h,  0Ch,    4,	   0,  84h,  18h,  84h,	 0Ch, 0F8h
					; DATA XREF: ROM:E4B4o
		db     0,    0,	   0,  84h,    6,    4,	   0,	 0,    4,  80h,	   6,  84h,  0Ch,  84h,	   6,  80h
		db   0Ch,    4,	0F8h, 0A1h
MUSIC_0D_PSG1:	db  0FDh,    0,	0FCh,	 1, 0FBh,  4Ch,	0F0h,  60h,  70h,  70h,	 70h, 0F8h,    0, 0F0h,	 18h, 0FDh
					; DATA XREF: ROM:E4B6o
		db   7Dh, 0BAh,	 0Ch, 0B8h,    3, 0BAh,	   2, 0B8h,    7, 0BDh,	   6, 0F0h,  0Fh, 0B6h,	   3, 0B8h
		db   24h, 0BAh,	 0Ch, 0B8h,    3,  3Ah,	0B8h,	 6,  3Dh,  36h,	0B8h,  60h, 0FDh,    0,	0F0h,  30h
		db  0F0h,  3Ch,	0FDh,  7Dh, 0B3h,    6,	 31h, 0B8h,  0Ch, 0B6h,	   3,  38h, 0B6h,    6,	 3Ah,  33h
		db  0B5h,  24h,	0AEh,	 2, 0B0h,    6,	0F0h,	 4, 0AEh,    2,	0B0h,  52h, 0F0h,  18h,	0B8h,  20h
		db  0B6h,    8,	0B5h,	 7,  32h, 0AFh,	   6, 0ABh,    5, 0ACh,	   6, 0AEh,    5, 0ACh,	   3,  2Eh
		db   2Ch,  2Eh,	 2Ch,  2Eh,  2Ch,  2Eh,	0ACh,  0Ch, 0F0h,    8,	0FDh,	 0, 0F0h,  48h,	0FDh,  7Dh
		db  0B8h,    2,	0B6h,	 5,  70h, 0BAh,	   2, 0B8h,  0Ch, 0F0h,	 0Ah, 0BCh,    2, 0BAh,	 22h, 0F8h
		db  0A1h
MUSIC_0D_PSG2:	db  0F9h,  10h,	0FDh,	 0, 0FCh,    1,	0FBh,  4Ch, 0F0h,  66h,	0F0h,  60h,  70h,  70h,	0F8h,	 0
					; DATA XREF: ROM:E4B8o
		db  0F0h,  18h,	0FDh,  7Bh, 0BAh,  0Ch,	0B8h,	 3, 0BAh,    2,	0B8h,	 7, 0BDh,    6,	0F0h,  0Fh
		db  0B6h,    3,	0B8h,  24h, 0BAh,  0Ch,	0B8h,	 3,  3Ah, 0B8h,	   6,  3Dh,  36h, 0B8h,	 60h, 0FDh
		db     0, 0F0h,	 30h, 0F0h,  3Ch, 0FDh,	 7Bh, 0B3h,    6,  31h,	0B8h,  0Ch, 0B6h,    3,	 38h, 0B6h
		db     6,  3Ah,	 33h, 0B5h,  24h, 0AEh,	   2, 0B0h,    6, 0F0h,	   4, 0AEh,    2, 0B0h,	 52h, 0F0h
		db   18h, 0B8h,	 20h, 0B6h,    8, 0B5h,	   7,  32h, 0AFh,    6,	0ABh,	 5, 0ACh,    6,	0AEh,	 5
		db  0ACh,    3,	 2Eh,  2Ch,  2Eh,  2Ch,	 2Eh,  2Ch,  2Eh, 0ACh,	 0Ch, 0F0h,    8, 0FDh,	   0, 0F0h
		db   48h, 0FDh,	 7Bh, 0B8h,    2, 0B6h,	   5,  70h, 0BAh,    2,	0B8h,  0Ch, 0F0h,  0Ah,	0BCh,	 2
		db  0BAh,  22h,	0F8h, 0A1h
MUSIC_0D_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:E4BAo	ROM:E4BCo
MUSIC_0E:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 181
		dw MUSIC_0E_YM1
		dw MUSIC_0E_YM2
		dw MUSIC_0E_YM3
		dw MUSIC_0E_YM4
		dw MUSIC_0E_YM5
		dw MUSIC_0E_YM6
		dw MUSIC_0E_NULL
		dw MUSIC_0E_NULL
		dw MUSIC_0E_NULL
		dw MUSIC_0E_NULL
MUSIC_0E_YM1:	db  0FEh,  35h,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Ch, 0BEh,  30h,	0F0h,	 6, 0FFh,    0,	   0
					; DATA XREF: ROM:E6E6o
MUSIC_0E_YM2:	db  0FEh,  35h,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0BDh,  30h,	0F0h,	 6, 0FFh,    0,	   0
					; DATA XREF: ROM:E6E8o
MUSIC_0E_YM3:	db  0FEh,  35h,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0BAh,  30h,	0F0h,	 6, 0FFh,    0,	   0
					; DATA XREF: ROM:E6EAo
MUSIC_0E_YM4:	db  0FEh,  0Eh,	0FDh,  0Bh, 0FCh,    0,	0FBh,	 0, 0B1h,  30h,	0F0h,	 6, 0FFh,    0,	   0
					; DATA XREF: ROM:E6ECo
MUSIC_0E_YM5:	db  0FEh,  0Eh,	0FDh,  0Ch, 0FCh,    0,	0FBh,	 0, 0B2h,  30h,	0F0h,	 6, 0FFh,    0,	   0
					; DATA XREF: ROM:E6EEo
MUSIC_0E_YM6:	db  0F0h,    5,	 0Bh,  0Ah,  89h,  0Ch ; DATA XREF: ROM:E6F0o
MUSIC_0E_NULL:	db  0FFh,    0,	   0	; DATA XREF: ROM:E6F2o	ROM:E6F4o ...
MUSIC_0F:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 198
		dw MUSIC_0F_YM1
		dw MUSIC_0F_YM2
		dw MUSIC_0F_YM3
		dw MUSIC_0F_YM4
		dw MUSIC_0F_YM5
		dw MUSIC_0F_YM6
		dw MUSIC_0F_PSG1
		dw MUSIC_0F_PSG2
		dw MUSIC_0F_PSG3
		dw MUSIC_0F_PSG3
MUSIC_0F_YM1:	db  0F8h, 0C1h,	0F0h,  0Ch, 0FEh,  3Dh,	0FDh,  0Ah, 0FAh,  40h,	0BCh,	 6,  3Ch, 0BCh,	 18h, 0FAh
					; DATA XREF: ROM:E752o
		db   80h, 0BCh,	   6,  3Ch, 0BCh,  18h,	0FAh,  40h, 0BCh,    6,	 3Ch, 0F8h, 0E0h, 0FAh,	0C0h, 0FEh
		db     7, 0FDh,	 0Ch, 0FCh,    1, 0FBh,	 2Fh,  82h,    0, 0FCh,	0A1h, 0FBh,  20h, 0BFh,	 60h, 0FCh
		db  0FFh, 0FEh,	 14h, 0FDh,  0Ch, 0A7h,	 12h, 0FDh,    8, 0A7h,	   6, 0FDh,    6,  27h,	 70h, 0FFh
		db     0,    0
MUSIC_0F_YM2:	db  0F0h,  60h,	 70h, 0FEh,    7, 0FDh,	 0Ch, 0FCh,    1, 0FBh,	 2Fh,  80h,    0, 0FCh,	 9Fh, 0BAh
					; DATA XREF: ROM:E754o
		db   60h, 0FCh,	0FFh, 0FEh,  14h, 0FDh,	 0Ch, 0A2h,  12h, 0FDh,	   8, 0A2h,    6, 0FDh,	   6,  22h
		db   70h, 0FFh,	   0,	 0
MUSIC_0F_YM3:	db  0FCh,    1,	0FBh,  2Ch, 0FAh,  80h,	0FEh,  11h, 0FDh,  0Ch,	0B4h,  12h, 0FDh,  0Ah,	0B4h,  36h
					; DATA XREF: ROM:E756o
		db  0B4h,  12h,	0FDh,	 8, 0B4h,  36h,	0FDh,  0Ch, 0B2h,  12h,	0FDh,  0Ah, 0B2h,  7Eh,	0FAh, 0C0h
		db  0FEh,  14h,	0FDh,  0Ch,  9Fh,  12h,	0FDh,	 8,  9Fh,    6,	0FDh,	 6,  1Fh,  70h,	0FFh,	 0
		db     0
MUSIC_0F_YM4:	db  0F0h,  60h,	 70h, 0FEh,  32h, 0FDh,	 0Ch,  11h, 0FDh,    0,	0F0h,	 6, 0FEh,  14h,	0FDh,  0Ch
					; DATA XREF: ROM:E758o
		db  0A7h,  12h,	0F9h,  20h, 0FEh,  0Ch,	0FDh,  0Ah, 0FCh,  80h,	 8Fh,  48h, 0FBh,  20h,	0FDh,  0Ah
		db   8Fh,    6,	0FDh,	 8,  0Fh, 0FDh,	   6,  0Fh, 0FDh,    4,	0FCh,	 1,  0Fh, 0FFh,	   0,	 0
MUSIC_0F_YM5:	db  0FCh,    1,	0FBh,  2Ch, 0FAh,  40h,	0F9h,  20h, 0F0h,    6,	0FEh,  11h, 0FDh,  0Bh,	0B4h,  12h
					; DATA XREF: ROM:E75Ao
		db  0FDh,    9,	0B4h,  36h, 0B4h,  12h,	0FDh,	 7, 0B4h,  36h,	0FDh,  0Bh, 0B2h,  12h,	0FDh,	 9
		db  0B2h,  7Eh,	0FAh, 0C0h, 0F0h,  12h,	0F9h,	 0, 0FEh,  0Ch,	0FDh,  0Ch, 0FCh,  80h,	 8Fh,  48h
		db  0FBh,  20h,	0FDh,  0Ch,  8Fh,    6,	0FDh,  0Ah,  0Fh, 0FDh,	   8,  0Fh, 0FCh,    1,	0FDh,	 6
		db   0Fh, 0FFh,	   0,	 0
MUSIC_0F_YM6:	db  0F0h,  60h,	0F0h, 0C0h,  81h,  18h,	 80h,  48h, 0FFh,    0,	   0
					; DATA XREF: ROM:E75Co
MUSIC_0F_PSG1:	db  0FCh,    1,	0FDh,  87h, 0B5h,    4,	 38h,  3Bh,  40h,  3Eh,	 3Bh, 0FDh,  88h,  35h,	 38h,  3Bh
					; DATA XREF: ROM:E75Eo
		db   40h,  3Eh,	 3Bh, 0FDh,  89h,  35h,	 38h,  3Bh,  40h,  3Eh,	 3Bh, 0FDh,  8Ah,  35h,	 38h,  3Bh
		db   40h,  3Eh,	 3Bh, 0FDh,  8Bh, 0F8h,	0C4h, 0B5h,    4,  38h,	 3Bh,  40h,  3Eh,  3Bh,	0F8h, 0E0h
		db  0FDh,  8Ah,	0B5h,	 4,  38h,  3Bh,	 40h,  3Eh,  3Bh, 0FDh,	 89h,  35h,  38h,  3Bh,	 40h,  3Eh
		db   3Bh, 0FDh,	 88h,  35h,  38h,  3Bh,	 40h,  3Eh,  3Bh, 0FDh,	 0Dh, 0BFh,  18h, 0F0h,	   6, 0FDh
		db     0, 0FFh,	   0,	 0
MUSIC_0F_PSG2:	db  0FDh,    0,	0F0h,	 6, 0FCh,    1,	0FDh,  85h, 0B5h,    4,	 38h,  3Bh,  40h,  3Eh,	 3Bh, 0FDh
					; DATA XREF: ROM:E760o
		db   86h,  35h,	 38h,  3Bh,  40h,  3Eh,	 3Bh, 0FDh,  87h,  35h,	 38h,  3Bh,  40h,  3Eh,	 3Bh, 0FDh
		db   88h,  35h,	 38h,  3Bh,  40h,  3Eh,	 3Bh, 0FDh,    9, 0F8h,	0C4h, 0B5h,    4,  38h,	 3Bh,  40h
		db   3Eh,  3Bh,	0F8h, 0E0h, 0FDh,  88h,	0B5h,	 4,  38h,  3Bh,	 40h,  3Eh,  3Bh, 0FDh,	 87h,  35h
		db   38h,  3Bh,	 40h,  3Eh,  3Bh, 0FDh,	 86h,  35h,  38h,  3Bh,	 40h,  3Eh,  3Bh, 0FDh,	 0Bh, 0B7h
		db   18h, 0F0h,	   6, 0FDh,    0, 0FFh,	   0,	 0
MUSIC_0F_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:E762o	ROM:E764o
MUSIC_1A:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
		db 0
		db 0
		db 196
		dw MUSIC_1A_YM1
		dw MUSIC_1A_YM2
		dw MUSIC_1A_YM3
		dw MUSIC_1A_YM4
		dw MUSIC_1A_YM5
		dw MUSIC_1A_YM6
		dw MUSIC_1A_PSG1
		dw MUSIC_1A_PSG2
		dw MUSIC_1A_PSG3
		dw MUSIC_1A_PSG3
MUSIC_1A_YM1:	db  0FEh,  31h,	0FDh,  0Ch, 0FCh,    1,	0FBh,  2Ch, 0F8h,  20h,	0BBh,  3Ch, 0B2h,  0Ch,	 37h,  3Bh
					; DATA XREF: ROM:E92Fo
		db  0B9h,  3Ch,	0B0h,  0Ch,  35h,  39h,	0F8h,  40h, 0B7h,  3Ch,	0AFh,  0Ch,  32h,  37h,	0B5h,  30h
		db  0B4h,  0Ch,	0B5h,  24h, 0F8h, 0A0h,	0F8h,  60h, 0B7h,  18h,	0B4h,  0Ch, 0B5h,  18h,	0B4h,  0Ch
		db  0B2h,  48h,	0FEh,	 7, 0FDh,  0Bh,	0B0h,  0Ch, 0B2h,  24h,	0B4h,  10h,  34h,  32h,	0B9h,  60h
		db  0B4h,  30h,	0B2h,  10h,  32h,  30h,	0B7h,  90h, 0B0h,  10h,	 30h,  2Fh, 0B5h,  3Ch,	0F0h,  0Ch
		db  0B9h,  18h,	 39h,  3Bh, 0BBh,  24h,	0BCh,  0Ch, 0B7h,  90h,	0B9h,  0Ch,  3Bh,  3Ch,	 3Eh, 0C0h
		db   60h, 0BEh,	 30h, 0BCh,  24h, 0BEh,	 0Ch, 0BEh,  60h, 0F0h,	 18h, 0BEh,  0Ch,  3Ch,	0BBh,  48h
		db  0BCh,  0Ch,	 3Bh, 0B9h,  48h, 0BBh,	 18h, 0B9h,  24h, 0B7h,	 6Ch, 0F0h,  18h, 0B7h,	 0Ch,  39h
		db  0BAh,  60h,	0F0h,  18h,  3Ah,  39h,	 34h, 0B4h,  10h,  35h,	 37h, 0B5h,  30h, 0F0h,	 18h,  39h
		db   3Bh,  3Ch,	0C0h,  24h, 0BEh,  0Ch,	0BEh,  78h, 0C0h,  18h,	0C0h, 0C0h, 0FEh,  1Ah,	0FDh,  0Dh
		db  0B4h,  10h,	 34h,  32h, 0B9h,  60h,	0B4h,  30h, 0B2h,  10h,	 32h,  30h, 0B7h,  90h,	0B0h,  10h
		db   30h,  2Fh,	0B5h,  40h, 0B4h,  10h,	 35h, 0B9h,  18h,  3Bh,	0BBh,  24h, 0BCh,  0Ch,	0B7h,  90h
		db  0FDh,  0Ch,	0ADh,  0Ch,  2Fh,  30h,	 32h, 0B4h,  78h, 0B2h,	 18h, 0B0h,  24h, 0B2h,	 0Ch, 0B2h
		db   90h, 0AFh,	 0Ch,  30h,  34h,  37h,	0BBh,  78h, 0BCh,  18h,	0C0h,  24h, 0BEh,  0Ch,	0BEh,  90h
		db  0B4h,  10h,	 34h,  32h, 0B8h,  70h,	0B7h,  10h,  35h,  37h,	 37h,  34h, 0BBh,  60h,	0B9h,  30h
		db  0FEh,  38h,	0FDh,  0Bh, 0ADh,  24h,	0AFh,  0Ch, 0F0h,  18h,	0B0h,  78h, 0B2h,  24h,	0B3h,  0Ch
		db  0F0h,  18h,	0B5h,  78h, 0FEh,  26h,	0FDh,  0Ch, 0B7h,  48h,	0AEh,  0Ch, 0B0h,  3Ch,	0BAh,  10h
		db   38h,  37h,	0B7h,  48h, 0B3h,  0Ch,	0B5h,  6Ch, 0B5h,  48h,	0ACh,  0Ch, 0AEh,  3Ch,	0B6h,  10h
		db   35h,  36h,	0B8h,  48h, 0B6h,  0Ch,	0B8h,  24h, 0BDh,  0Ch,	0BBh,  3Ch, 0B3h,  24h,	0B1h,  18h
		db  0B3h,  0Ch,	0B4h,  18h, 0ADh,  60h,	0B8h,  24h, 0B6h,  18h,	0B8h,  0Ch, 0B9h,  18h,	0B1h,  60h
		db  0BBh,  24h,	0B9h,  18h, 0BBh,  0Ch,	0BDh,  18h, 0BBh,  24h,	0B9h,  18h, 0B8h,  0Ch,	0B9h,  18h
		db  0BBh, 0C0h,	0FEh,  1Ah, 0FDh,  0Dh,	0AFh,  10h,  2Fh,  2Dh,	0B4h,  60h, 0B2h,  30h,	0B2h,  10h
		db   32h,  30h,	0B7h,  90h, 0B0h,  10h,	 30h,  2Fh, 0B2h,  18h,	 30h,  34h,  32h,  35h,	 2Fh, 0ADh
		db   24h, 0AFh,	 0Ch, 0ABh,  90h, 0F8h,	 20h, 0ADh,  0Ch,  2Fh,	 30h,  32h, 0B4h,  78h,	0B2h,  18h
		db  0B0h,  24h,	0B2h,  0Ch, 0B2h,  81h,	0B2h,	 6, 0B1h,    5,	0B0h,	 4, 0AFh,  0Ch,	 30h,  34h
		db   37h, 0BBh,	 78h, 0BCh,  18h, 0C0h,	 24h, 0BEh,  0Ch, 0BEh,	 90h, 0B4h,  10h,  34h,	 32h, 0B8h
		db   70h, 0B7h,	 10h,  35h,  37h,  37h,	 34h, 0BBh,  60h, 0B9h,	 30h, 0F8h,  40h, 0BCh,	 0Ch,  39h
		db   35h,  34h,	 32h,  30h,  2Dh,  29h,	 3Ch,  38h,  37h,  35h,	 32h,  2Fh,  2Ch,  29h,	 2Bh,  23h
		db   24h,  28h,	 2Bh,  27h,  28h,  2Bh,	 2Fh,  2Ah,  2Bh,  2Fh,	 30h,  2Fh,  30h,  34h,	0F8h, 0A0h
		db  0F8h,  60h,	0F0h,  30h, 0ADh,  18h,	 2Fh,  30h,  32h,  34h,	 35h, 0B7h,  48h, 0B2h,	 0Ch, 0B3h
		db   3Ch, 0BAh,	 10h,  38h,  37h, 0B7h,	 4Ah, 0B0h,  0Eh, 0B2h,	 56h, 0F0h,  0Ah, 0BAh,	 24h, 0B8h
		db   2Ah, 0B7h,	 32h, 0FCh,  80h, 0B7h,	0C0h, 0FBh,  20h, 0FCh,	   1, 0B7h,  8Ch, 0F0h,	   6, 0FFh
		db     0,    0
MUSIC_1A_YM2:	db  0FEh,    9,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0F8h,  20h,	0A6h,  12h,  23h, 0FDh,	 0Bh, 0ABh
					; DATA XREF: ROM:E931o
		db   0Ch, 0FDh,	 0Ah, 0A6h,  30h, 0A4h,	 12h,  21h, 0FDh,  0Bh,	0A9h,  0Ch, 0FDh,  0Ah,	0A4h,  30h
		db  0F8h,  40h,	0A3h,  12h,  1Fh, 0FDh,	 0Bh, 0A6h,  0Ch, 0FDh,	 0Ah, 0A3h,  30h, 0A1h,	 12h,  1Dh
		db  0FDh,  0Bh,	0A4h,  0Ch, 0FDh,  0Ah,	0A1h,  30h, 0F8h, 0A0h,	0F8h,  60h, 0A3h,  18h,	0ABh,  0Ch
		db  0ADh,  18h,	0ABh,  0Ch, 0A9h,  78h,	0FEh,	 5, 0FDh,    9,	0ADh, 0C0h,  2Bh, 0A9h,	 90h, 0A9h
		db   30h,  28h,	0A8h,  90h,  2Dh, 0ADh,	 30h, 0ACh,  90h, 0ACh,	 30h, 0ABh,  60h,  2Ah,	0A8h,  24h
		db  0A8h,  6Ch,	0A8h,  30h, 0ABh,  60h,	 2Bh,  29h,  29h,  29h,	 29h,  28h, 0FEh,  19h,	0FDh,  0Bh
		db  0A1h,  10h,	 23h,  25h,  28h,  2Dh,	 31h, 0FEh,  35h, 0FDh,	 0Bh, 0BCh,  40h, 0BCh,	 10h,  3Eh
		db  0C0h,  18h,	0BEh,  30h, 0BCh,  18h,	0BBh,  40h, 0BBh,  10h,	 3Ch, 0BEh,  18h,  3Ch,	0BBh,  30h
		db  0B9h,  40h,	0B9h,  10h,  3Bh,  39h,	 38h,  39h, 0BCh,  18h,	 3Eh, 0BEh,  24h, 0C0h,	 0Ch, 0C0h
		db   30h, 0C1h,	 0Ch,  40h,  3Ch,  37h,	 35h,  34h,  30h,  2Bh,	0F0h,  52h, 0FEh,  18h,	0FDh,  0Ah
		db  0B8h,    2,	0B9h,  30h, 0B4h,    6,	 32h, 0B0h,  0Ch, 0ADh,	   6,  70h,  2Bh,  70h,	0A9h,  30h
		db  0A8h,    6,	 29h, 0ACh,  0Ch,  2Bh,	 29h, 0B1h,    2, 0B2h,	 0Ah, 0B0h,  0Ch,  2Eh,	 70h, 0B6h
		db     2, 0B7h,	 16h, 0B5h,  24h, 0F0h,	 2Ch, 0B2h,    2,  33h,	0B4h,	 6,  70h,  34h,	 70h,  34h
		db   70h, 0B4h,	 30h, 0B2h,    6,  30h,	0B0h,  0Ch, 0B1h,    2,	0B2h,  16h, 0B0h,  48h,	0ADh,  0Ch
		db   2Bh, 0AAh,	 24h, 0A9h,  0Ch, 0AAh,	 3Ch, 0F0h,  18h, 0A9h,	   8,  2Bh,  2Ch, 0B0h,	 0Ch, 0B2h
		db     2, 0B3h,	 16h, 0B2h,  18h,  30h,	0B1h,	 2, 0B2h,  16h,	0B0h,  18h, 0AFh,    6,	 2Dh, 0F0h
		db   0Ch, 0ABh,	 18h, 0ADh,    6,  2Fh,	0B2h,  0Ch, 0B6h,    2,	0B7h,  0Ch, 0F0h,  0Ah,	0B7h,  18h
		db  0B5h,  0Ch,	 34h,  31h,  70h, 0B8h,	   2, 0B9h,  22h, 0F0h,	 72h, 0C0h,  12h, 0BCh,	 0Ah, 0BBh
		db     8, 0B9h,	   6,  37h,  35h,  34h,	 30h,  2Dh,  29h, 0F0h,	 18h, 0A6h,  0Ch, 0A5h,	   6,  26h
		db   27h, 0AAh,	   2, 0ABh,  0Ah,  29h,	0A8h,	 6,  29h, 0ACh,	 0Ch, 0AEh,  0Ah, 0B0h,	   8, 0B2h
		db     6,  33h,	 34h,  35h,  37h,  38h,	0BAh,  0Ah, 0BCh,  0Ch,	0BEh,  10h, 0FEh,  0Eh,	0FDh,	 8
		db  0F0h,  0Ch,	0B2h,	 6,  70h,  32h,	0F0h,  12h, 0AEh,    6,	 70h,  2Bh, 0F0h,  12h,	0B2h,	 6
		db   70h,  30h,	0F0h,  12h, 0AFh,    6,	 70h,  30h, 0F0h,  12h,	0B0h,  24h, 0F0h,  0Ch,	0B2h,	 6
		db   70h,  32h,	0F0h,  12h, 0AEh,    6,	 70h,  2Bh, 0F0h,  12h,	0B2h,	 6,  70h,  30h,	0F0h,  12h
		db  0AEh,    6,	 70h,  30h, 0F0h,  12h,	0B0h,  24h, 0F0h,  0Ch,	0B1h,	 6,  70h,  31h,	0F0h,  12h
		db  0AEh,    6,	 70h,  2Ah, 0F0h,  12h,	0B1h,	 6,  70h,  2Eh,	0F0h,  12h, 0ACh,    6,	 70h,  2Eh
		db  0F0h,  12h,	0AEh,  24h, 0F0h,  0Ch,	0B1h,	 6,  70h,  31h,	0F0h,  12h, 0AEh,    6,	 70h,  2Ah
		db  0F0h,  12h,	0B1h,	 6,  70h,  2Fh,	0F0h,  12h, 0AEh,    6,	 70h,  2Fh, 0F0h,  12h,	0AFh,  24h
		db  0F0h,  18h,	0FEh,  19h, 0FDh,  0Ah,	0ADh,  30h,  2Ch,  2Ah,	 28h,  31h,  2Fh,  2Dh,	 2Ch,  2Ah
		db   2Ch,  2Dh,	0B6h,  18h, 0B4h, 0C0h,	0FEh,	 5, 0FDh,    9,	0B0h,  30h, 0B0h,  60h,	0AFh,  30h
		db   2Fh, 0AFh,	 60h, 0B0h,  30h, 0ADh,	 48h, 0ADh,  18h, 0AFh,	 48h, 0ABh,  18h, 0A8h,	 30h, 0F0h
		db   0Ch, 0A8h,	 24h, 0A8h,  60h, 0F8h,	 20h, 0FEh,  19h, 0FDh,	 0Ah, 0A9h,  3Ch, 0ADh,	 0Ch,  2Ch
		db   2Dh,  2Fh,	 2Dh,  2Fh, 0B0h,  24h,	0ADh,  18h, 0ACh,  3Ch,	0A4h,  0Ch,  26h,  29h,	 2Bh,  29h
		db   2Bh, 0ACh,	 18h, 0ABh,  0Ch, 0A9h,	 18h, 0ADh,  3Ch, 0B2h,	 0Ch,  30h,  32h,  34h,	 33h,  34h
		db   38h, 0B9h,	 18h,  37h, 0B6h,  60h,	0B7h,  24h, 0B6h,  0Ch,	0B6h,  30h, 0A9h,  3Ch,	0ACh,  0Ch
		db   30h,  34h,	0B2h,  60h, 0A8h,  3Ch,	0ABh,  0Ch,  2Fh,  32h,	0B1h,  60h, 0F8h,  40h,	0B9h,  0Ch
		db   35h,  32h,	 30h,  2Fh,  2Dh,  29h,	 26h,  38h,  35h,  34h,	 32h,  2Fh,  2Ch,  29h,	 26h, 0FEh
		db   0Dh, 0FDh,	 0Bh, 0B0h,  3Ch, 0F0h,	 0Ch, 0B0h,    8,  30h,	 30h, 0B0h,    6, 0F0h,	 0Ah, 0B0h
		db     6, 0F0h,	 0Ah, 0B0h,    6, 0F0h,	 0Ah, 0B0h,    6, 0F0h,	 12h, 0B0h,    8, 0F0h,	 10h, 0F8h
		db  0A0h, 0F8h,	 60h, 0FEh,  19h, 0FDh,	 0Bh,  9Dh,  30h, 0FDh,	 0Ah, 0A9h,  18h,  2Bh,	 2Dh,  2Dh
		db   2Fh,  30h,	0FEh,  35h, 0FDh,  0Ah,	0B0h, 0C0h, 0ACh, 0AEh,	0F0h,  0Ah, 0A9h,  24h,	0A7h,  2Ah
		db  0A6h,  32h,	0FCh,  80h, 0A8h, 0C0h,	0FCh,	 1, 0FBh,  20h,	0A8h,  8Ch, 0F0h,    6,	0FFh,	 0
		db     0
MUSIC_1A_YM3:	db  0FEh,    9,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0ABh,  60h,	 29h,  26h,  24h,  2Bh,	 29h, 0A6h
					; DATA XREF: ROM:E933o
		db   24h, 0A6h,	 0Ch, 0F0h,  18h, 0A1h,	 78h, 0FEh,    5, 0FDh,	   9, 0A9h, 0C0h,  28h,	0A6h,  90h
		db  0A6h,  30h,	 26h, 0A4h,  90h,  29h,	0A9h,  30h, 0A9h,  90h,	0A9h,  30h, 0A8h,  60h,	 27h, 0A3h
		db   24h, 0A3h,	 6Ch, 0A3h,  30h, 0A8h,	 60h,  25h,  26h,  26h,	 26h,  26h,  25h, 0FEh,	 19h, 0FDh
		db   0Bh,  99h,	 10h,  1Ah,  1Ch,  21h,	 25h,  28h, 0FDh,    9,	0ADh,  30h, 0A9h,  60h,	0ADh,  30h
		db   2Bh, 0A8h,	 90h, 0A9h,  30h, 0A6h,	 60h, 0A9h,  30h, 0ABh,	 60h, 0FEh,  35h, 0FDh,	 0Bh, 0B9h
		db   0Ch,  37h,	 34h,  30h,  2Dh,  2Bh,	 28h,  24h, 0F0h,  58h,	0F9h,  20h, 0FAh,  80h,	0FEh,  18h
		db  0FDh,    7,	0B8h,	 2, 0B9h,  30h,	0B4h,	 6,  32h, 0B0h,	 0Ch, 0ADh,    6,  70h,	 2Bh,  70h
		db  0A9h,  30h,	0F0h,	 0, 0A8h,    6,	 29h, 0ACh,  0Ch,  2Bh,	 29h, 0B1h,    2, 0B2h,	 0Ah, 0B0h
		db   0Ch,  2Eh,	 70h, 0B6h,    2, 0B7h,	 16h, 0B5h,  24h, 0F0h,	 2Ch, 0B2h,    2,  33h,	0B4h,	 6
		db   70h,  34h,	 70h,  34h,  70h, 0B4h,	 30h, 0B2h,    6,  30h,	0B0h,  0Ch, 0B1h,    2,	0B2h,  16h
		db  0B0h,  48h,	0F0h,	 0, 0ADh,  0Ch,	 2Bh, 0AAh,  24h, 0A9h,	 0Ch, 0AAh,  3Ch, 0F0h,	 18h, 0A9h
		db     8,  2Bh,	 2Ch, 0B0h,  0Ch, 0B2h,	   2, 0B3h,  16h, 0B2h,	 18h,  30h, 0B1h,    2,	0B2h,  16h
		db  0B0h,  18h,	0AFh,	 6,  2Dh, 0F0h,	 0Ch, 0ABh,  18h, 0ADh,	   6,  2Fh, 0B2h,  0Ch,	0B6h,	 2
		db  0B7h,  0Ch,	0F0h,  0Ah, 0B7h,  18h,	0B5h,  0Ch,  34h,  31h,	 70h, 0B8h,    2, 0B9h,	 1Ch, 0FAh
		db  0C0h, 0F9h,	   0, 0FEh,  38h, 0FDh,	 0Ah, 0A4h,  24h, 0A6h,	 0Ch, 0F0h,  18h, 0A8h,	 78h, 0A9h
		db   24h, 0ABh,	 0Ch, 0F0h,  18h, 0ACh,	 78h, 0FEh,  0Eh, 0FDh,	   8, 0F8h, 0C1h, 0F0h,	 0Ch, 0AEh
		db     6,  70h,	 2Eh, 0F0h,  12h, 0ABh,	   6,  70h,  27h, 0F0h,	 12h, 0AEh,    6,  70h,	 2Ch, 0F0h
		db   12h, 0ABh,	   6,  70h,  2Ch, 0F0h,	 12h, 0ACh,  24h, 0F8h,	0E0h, 0F0h,  0Ch, 0A9h,	   6,  70h
		db   29h, 0F0h,	 12h, 0A5h,    6,  70h,	 22h, 0F0h,  12h, 0A9h,	   6,  70h,  2Ah, 0F0h,	 12h, 0A9h
		db     6,  70h,	 2Ah, 0F0h,  12h, 0AAh,	 24h, 0F0h,  0Ch, 0A9h,	   6,  70h,  29h, 0F0h,	 12h, 0A5h
		db     6,  70h,	 22h, 0F0h,  12h, 0A9h,	   6,  70h,  2Ch, 0F0h,	 12h, 0AAh,    6,  70h,	 2Ch, 0F0h
		db   12h, 0ACh,	 24h, 0FEh,  19h, 0FDh,	   9, 0A8h,  60h,  25h,	 21h,  2Ah,  26h, 0A5h,	 48h, 0ADh
		db   18h, 0ACh,	0C0h, 0FEh,    5, 0FDh,	   9, 0ADh,  30h, 0ADh,	 60h, 0ADh,  30h,  2Bh,	0A8h,  60h
		db  0A8h,  30h,	0A9h,  48h, 0A9h,  18h,	0ABh,  48h, 0A6h,  18h,	0A4h,  30h, 0F0h,  0Ch,	0A4h,  24h
		db  0A4h,  60h,	0F8h,  20h, 0FEh,  19h,	0FDh,	 9, 0A4h,  78h,	0A3h,  18h,  21h,  24h,	0A2h,  78h
		db  0A6h,  18h,	 29h,  2Ch, 0A8h, 0C0h,	 2Dh, 0A0h,  30h,  24h,	0A3h,  60h, 0A3h,  30h,	 1Fh, 0A8h
		db   60h, 0F8h,	 40h, 0A4h,  60h, 0A4h,	 30h,  23h, 0FEh,  0Dh,	0FDh,  0Ah, 0A8h,  3Ch,	0F0h,  0Ch
		db  0A8h,    8,	 28h,  28h, 0A8h,    6,	0F0h,  0Ah, 0A8h,    6,	0F0h,  0Ah, 0A8h,    6,	0F0h,  0Ah
		db  0A8h,    6,	0F0h,  12h, 0A8h,    8,	0F0h,  10h, 0F8h, 0A0h,	0F8h,  60h, 0FEh,  19h,	0FDh,  0Bh
		db   91h,  30h,	0FDh,  0Ah, 0A4h,  18h,	 26h,  29h,  29h,  2Bh,	 2Dh, 0A7h,  60h, 0ABh,	 30h, 0ABh
		db   10h,  29h,	 27h, 0A6h,  66h, 0A9h,	 48h, 0F0h,  0Ah, 0A6h,	 24h, 0A4h,  2Ah, 0A2h,	 32h, 0FCh
		db   80h, 0A3h,	0C0h, 0FCh,    1, 0FBh,	 20h, 0A3h,  8Ch, 0F0h,	   6, 0FFh,    0,    0
MUSIC_1A_YM4:	db  0FEh,    2,	0FDh,  0Ch, 0FBh,  2Ch,	0FCh,  80h, 0A3h,    0,	0FCh,  85h, 0A4h, 0C0h,	0FBh,  20h
					; DATA XREF: ROM:E935o
		db  0FCh,    1,	0A4h, 0A8h, 0FCh, 0FFh,	0FBh,  2Ch,  9Fh,  18h,	 98h, 0C0h,  97h,    0,	0FCh,  85h
		db   98h,  1Eh,	0FCh, 0FFh, 0F0h,    6,	 98h,  0Ch, 0F0h,  18h,	 93h,  60h,  9Fh,  18h,	 9Dh, 0C0h
		db   1Ch,  9Ah,	 90h,  9Fh,  30h, 0A4h,	0C0h,  9Dh,  54h,  98h,	   6,  70h,  1Dh,  70h,	 9Dh,  3Ch
		db  0A4h,  18h,	0A2h,  54h, 0FCh,  80h,	 9Ch,  0Ch, 0FCh,    1,	 1Dh,  20h, 0FCh,  80h,	 24h, 0FCh
		db     1,  26h,	 70h, 0A4h,  24h, 0A1h,	 60h,  23h,  9Ch,  54h,	0FCh,  80h, 0AAh,  0Ch,	0FCh,	 1
		db   2Bh, 0FCh,	 80h,  27h, 0FCh,    1,	 28h,  23h,  70h,  9Ch,	 18h,  9Ah,  0Ch,  99h,	 30h, 0F0h
		db   0Ch,  19h,	 1Ah,  1Ch,  95h,  30h,	 21h, 0A6h,  3Ch, 0F0h,	 0Ch,  26h,  25h, 0A4h,	 60h, 0A3h
		db   48h, 0A3h,	 18h, 0A2h,  60h, 0A1h,	0C0h,  9Dh,  54h,  98h,	   6,  70h,  1Dh,  70h,	 9Dh,  54h
		db   1Ch, 0FCh,	 80h, 0A6h,  0Ch, 0FCh,	   1,  28h, 0FCh,  80h,	 21h, 0FCh,    1,  23h,	 1Fh,  70h
		db   9Ch,  24h,	 9Ah,  54h,  9Ah,    6,	 70h,  13h,  70h,  93h,	 24h,  9Fh,  30h,  98h,	 78h, 0A4h
		db   18h,  1Fh,	 18h,  9Dh,  54h,  98h,	   6,  70h,  1Dh,  70h,	 9Dh,  0Ch,  26h, 0A4h,	   6, 0F0h
		db   12h, 0A1h,	 0Ch,  9Dh,  18h,  96h,	 54h,  95h,  0Ch,  96h,	   6,  70h,  16h,  70h,	0FCh,  80h
		db   9Ch,  0Ch,	0FCh,	 1,  9Dh,    6,	0F0h,  12h, 0A4h,  18h,	0A2h,  0Ch, 0A1h,  30h,	0F0h,  0Ch
		db   1Ah,  1Ch,	 18h,  95h,    6,  70h,	 95h,  24h,  9Ch,  30h,	 9Ah, 0C0h,  9Dh,  30h,	0F0h,  0Ch
		db   1Ch,  1Dh,	 70h,  9Fh,  30h,  13h,	 1Ch, 0F0h,  0Ch,  1Bh,	 1Ch,  70h, 0A1h,  30h,	 15h,  91h
		db   24h,  91h,	 0Ch, 0F0h,  18h,  91h,	 30h,  9Ch,  18h,  1Ah,	 18h,  96h,  24h,  96h,	 0Ch, 0F0h
		db   18h,  96h,	 48h, 0A2h,  30h,  9Bh,	 54h,  93h,  0Ch,  94h,	   6,  70h,  94h,  54h,	 1Bh,  9Bh
		db     6,  70h,	 19h,  70h,  99h,  54h,	 1Eh,  95h,  0Ch,  97h,	   6,  70h,  97h,  54h,	 1Eh,  9Eh
		db     6,  70h,	 1Ch,  70h,  9Ch,  54h,	 15h,  94h,  0Ch,  95h,	   6,  70h,  95h,  24h,	0A1h,  18h
		db   20h,  9Eh,	 54h,  9Dh,  0Ch,  9Eh,	   6,  70h,  9Eh,  24h,	 9Eh,  18h,  1Ch,  9Ah,	 54h,  9Ah
		db     6,  70h,	 1Bh,  70h,  9Bh,  3Ch,	 9Bh,  0Ch,  70h,  9Ch,	0C0h,  9Dh,  54h,  9Dh,	   6,  70h
		db   1Fh,  70h,	 9Fh,  3Ch,  9Ah,  18h,	 9Ch,  30h, 0F0h,  0Ch,	 1Ch,  1Bh,  1Ch, 0A1h,	   6,  70h
		db  0A1h,  3Ch,	 95h,  18h,  9Ah,  24h,	 9Ah,	 6, 0F0h,  12h,	 9Ah,  0Ch,  1Ch,  1Dh,	 9Fh,	 6
		db   70h,  9Fh,	 24h,  93h,  30h,  98h,	 24h,  97h,  0Ch,  98h,	   6,  70h,  98h,  0Ch,	 1Ah,  18h
		db   70h, 0ABh,	 18h, 0FCh,  80h, 0A6h,	 0Ch, 0FCh,    1,  28h,	0A4h,	 6, 0F0h,  12h,	 98h,  0Ch
		db  0F8h,  20h,	 9Dh,  54h,  98h,    6,	 70h,  1Dh,  70h,  9Dh,	 0Ch,  26h, 0A4h,    6,	0F0h,  12h
		db  0A1h,  0Ch,	 9Dh,  18h,  96h,  54h,	 95h,  0Ch,  96h,    6,	 70h,  16h,  70h,  9Ch,	 0Ch,  9Dh
		db     6, 0F0h,	 12h, 0A4h,  18h, 0A2h,	 0Ch, 0A1h,  30h, 0F0h,	 0Ch,  1Ah,  1Ch,  18h,	 95h,	 6
		db   70h,  95h,	 24h,  9Ch,  30h,  1Ah,	0F0h,  0Ch,  15h,  14h,	 15h,  70h,  28h,  26h,	0A1h,	 6
		db  0F0h,  12h,	 95h,  18h,  9Ah,  0Ch,	 9Dh,  30h, 0F0h,  0Ch,	 1Ch,  1Dh,  70h,  9Fh,	 30h,  13h
		db   1Ch, 0F0h,	 0Ch,  1Bh,  1Ch,  70h,	0A1h,  30h,  15h, 0F8h,	 40h,  9Dh,  3Ch, 0F0h,	 0Ch,  9Dh
		db     6,  70h,	 1Dh,  70h,  9Fh,  30h,	0F0h,  0Ch,  1Fh,  13h,	 70h,  98h,  48h,  97h,	 0Ch,  18h
		db  0F0h,  10h,	0A4h,	 8,  70h,  24h,	 70h,  9Fh,  18h,  18h,	0F8h, 0A0h, 0F8h,  60h,	 91h,  30h
		db   9Dh,  18h,	 1Ch,  1Ah,  18h,  17h,	 15h,  94h,  30h, 0F0h,	 0Ch,  13h,  14h,  16h,	 94h,  3Ch
		db  0F0h,  0Ch,	 14h,  15h,  96h,  33h,	0F0h,  0Ch,  22h, 0A1h,	 0Dh, 0A2h,  0Eh,  96h,	 48h, 0F0h
		db   0Ah,  96h,	 24h,  96h,  2Ah,  96h,	 32h, 0FCh,  80h,  98h,	0C0h, 0FCh,    1, 0FBh,	 20h,  98h
		db   8Ch, 0F0h,	   6, 0FFh,    0,    0
MUSIC_1A_YM5:	db  0FAh, 0C0h,	0FEh,  27h, 0FDh,  0Ah,	0FCh,	 1, 0FBh,  2Ch,	0F8h,  20h, 0BBh,  3Ch,	0B2h,  0Ch
					; DATA XREF: ROM:E937o
		db   37h,  3Bh,	0B9h,  3Ch, 0B0h,  0Ch,	 35h,  39h, 0F8h,  40h,	0B7h,  3Ch, 0AFh,  0Ch,	 32h,  37h
		db  0B5h,  30h,	0B4h,  0Ch, 0B5h,  24h,	0F8h, 0A0h, 0F8h,  60h,	0B7h,  18h, 0B4h,  0Ch,	0B5h,  18h
		db  0B4h,  0Ch,	0B2h,  4Eh, 0F9h,  10h,	0FAh,  80h, 0FEh,    7,	0FDh,	 9, 0B0h,  0Ch,	0B2h,  24h
		db  0B4h,  10h,	 34h,  32h, 0B9h,  60h,	0B4h,  30h, 0B2h,  10h,	 32h,  30h, 0B7h,  90h,	0B0h,  10h
		db   30h,  2Fh,	0B5h,  3Ch, 0F0h,  0Ch,	0B9h,  18h,  39h,  3Bh,	0BBh,  24h, 0BCh,  0Ch,	0B7h,  90h
		db  0B9h,  0Ch,	 3Bh,  3Ch,  3Eh, 0C0h,	 60h, 0BEh,  30h, 0BCh,	 24h, 0BEh,  0Ch, 0BEh,	 60h, 0F0h
		db   18h, 0BEh,	 0Ch,  3Ch, 0BBh,  48h,	0BCh,  0Ch,  3Bh, 0B9h,	 48h, 0BBh,  18h, 0B9h,	 24h, 0B7h
		db   6Ch, 0F0h,	 18h, 0B7h,  0Ch,  39h,	0BAh,  60h, 0F0h,  18h,	 3Ah,  39h,  34h, 0B4h,	 10h,  35h
		db   37h, 0B5h,	 30h, 0F0h,  18h,  39h,	 3Bh,  3Ch, 0C0h,  24h,	0BEh,  0Ch, 0BEh,  78h,	0C0h,  18h
		db  0C0h, 0C0h,	0FAh,  40h, 0FEh,  1Ah,	0FDh,  0Bh, 0B4h,  10h,	 34h,  32h, 0B9h,  60h,	0B4h,  30h
		db  0B2h,  10h,	 32h,  30h, 0B7h,  90h,	0B0h,  10h,  30h,  2Fh,	0B5h,  40h, 0B4h,  10h,	 35h, 0B9h
		db   18h,  3Bh,	0BBh,  24h, 0BCh,  0Ch,	0B7h,  90h, 0FDh,  0Ah,	0ADh,  0Ch,  2Fh,  30h,	 32h, 0B4h
		db   78h, 0B2h,	 18h, 0B0h,  24h, 0B2h,	 0Ch, 0B2h,  90h, 0AFh,	 0Ch,  30h,  34h,  37h,	0BBh,  78h
		db  0BCh,  18h,	0C0h,  24h, 0BEh,  0Ch,	0BEh,  90h, 0B4h,  10h,	 34h,  32h, 0B8h,  70h,	0B7h,  10h
		db   35h,  37h,	 37h,  34h, 0BBh,  60h,	0B9h,  30h, 0FAh,  80h,	0FEh,  38h, 0FDh,  0Ah,	0ADh,  24h
		db  0AFh,  0Ch,	0F0h,  18h, 0B0h,  78h,	0B2h,  24h, 0B3h,  0Ch,	0F0h,  18h, 0B5h,  78h,	0FEh,  26h
		db  0FDh,  0Ah,	0B7h,  48h, 0AEh,  0Ch,	0B0h,  3Ch, 0BAh,  10h,	 38h,  37h, 0B7h,  48h,	0B3h,  0Ch
		db  0B5h,  6Ch,	0B5h,  48h, 0ACh,  0Ch,	0AEh,  3Ch, 0B6h,  10h,	 35h,  36h, 0B8h,  48h,	0B6h,  0Ch
		db  0B8h,  24h,	0BDh,  0Ch, 0BBh,  3Ch,	0B3h,  24h, 0B1h,  18h,	0B3h,  0Ch, 0B4h,  18h,	0ADh,  60h
		db  0B8h,  24h,	0B6h,  18h, 0B8h,  0Ch,	0B9h,  18h, 0B1h,  60h,	0BBh,  24h, 0B9h,  18h,	0BBh,  0Ch
		db  0BDh,  18h,	0BBh,  24h, 0B9h,  18h,	0B8h,  0Ch, 0B9h,  18h,	0BBh, 0C0h, 0FAh,  40h,	0FEh,  1Ah
		db  0FDh,  0Bh,	0AFh,  10h,  2Fh,  2Dh,	0B4h,  60h, 0B2h,  30h,	0B2h,  10h,  32h,  30h,	0B7h,  90h
		db  0B0h,  10h,	 30h,  2Fh, 0B2h,  18h,	 30h,  34h,  32h,  35h,	 2Fh, 0ADh,  24h, 0AFh,	 0Ch, 0ABh
		db   90h, 0F8h,	 20h, 0ADh,  0Ch,  2Fh,	 30h,  32h, 0B4h,  78h,	0B2h,  18h, 0B0h,  24h,	0B2h,  0Ch
		db  0B2h,  81h,	0B2h,	 6, 0B1h,    5,	0B0h,	 4, 0AFh,  0Ch,	 30h,  34h,  37h, 0BBh,	 78h, 0BCh
		db   18h, 0C0h,	 24h, 0BEh,  0Ch, 0BEh,	 90h, 0B4h,  10h,  34h,	 32h, 0B8h,  70h, 0B7h,	 10h,  35h
		db   37h,  37h,	 34h, 0BBh,  60h, 0B9h,	 30h, 0F8h,  40h, 0BCh,	 0Ch,  39h,  35h,  34h,	 32h,  30h
		db   2Dh,  29h,	 3Ch,  38h,  37h,  35h,	 32h,  2Fh,  2Ch,  29h,	 2Bh,  23h,  24h,  28h,	 2Bh,  27h
		db   28h,  2Bh,	 2Fh,  2Ah,  2Bh,  2Fh,	 30h,  2Fh,  30h,  34h,	0F8h, 0A0h, 0F8h,  60h,	0F0h,  30h
		db  0ADh,  18h,	 2Fh,  30h,  32h,  34h,	 35h, 0B7h,  48h, 0B2h,	 0Ch, 0B3h,  3Ch, 0BAh,	 10h,  38h
		db   37h, 0B7h,	 4Ah, 0B0h,  0Eh, 0B2h,	 56h, 0F0h,  0Ah, 0BAh,	 24h, 0B8h,  2Ah, 0B7h,	 32h, 0FCh
		db   80h, 0B7h,	0C0h, 0FBh,  20h, 0FCh,	   1, 0B7h,  8Ch, 0F0h,	   6, 0FFh,    0,    0
MUSIC_1A_YM6:	db  0F0h, 0C0h,	 70h,  70h, 0F0h,  78h,	0FAh,  80h,  82h,  24h,	0FAh, 0C0h,  83h,  18h,	0FAh,  40h
					; DATA XREF: ROM:E939o
		db   84h,  0Ch,	0F8h, 0CAh, 0FAh, 0C0h,	 80h,  54h,  80h,  0Ch,	   0,  80h,  24h,  8Ah,	 30h, 0F8h
		db  0E0h,  80h,	 18h, 0FAh,  80h,  82h,	 24h, 0FAh, 0C0h,  83h,	 18h, 0FAh,  80h,  82h,	 0Ch, 0FAh
		db  0C0h,    0,	 83h,  18h, 0FAh,  40h,	 84h,  0Ch, 0FAh, 0C0h,	 80h,  18h,    1, 0F8h,	0C2h,  80h
		db   30h,  81h,	 24h,  80h,  0Ch,    0,	 80h,  24h,  81h,  30h,	0F8h, 0E0h,  80h,  30h,	 81h,  24h
		db   80h,  0Ch,	   0,	 0,  81h,  18h,	0FAh,  80h,  82h,  0Ch,	0FAh,  40h,  83h,  24h,	0FAh, 0C0h
		db  0F8h, 0C5h,	 80h,  30h,  81h,  24h,	 80h,  0Ch,    0,  80h,	 24h,  81h,  30h, 0F8h,	0E0h,  80h
		db   18h,  81h,	 0Ch,  80h,  18h,  81h,	 0Ch,  80h,  30h, 0FAh,	 80h,  82h,  18h, 0FAh,	0C0h,	 3
		db  0FAh,  40h,	   4, 0FAh, 0C0h,    0,	 81h,  0Ch,  80h,  18h,	 81h,  0Ch,  80h,  24h,	0FAh,  80h
		db   82h,  0Ch,	 82h,  18h, 0FAh, 0C0h,	 83h,  0Ch, 0FAh,  40h,	 84h,  18h, 0FAh, 0C0h,	 81h,  0Ch
		db  0F8h, 0C2h,	 80h,  24h,  80h,  0Ch,	 81h,  30h,  80h,  0Ch,	 80h,  24h,  81h,  30h,	0F8h, 0E0h
		db   80h,  24h,	 80h,  0Ch,  81h,  30h,	 80h,  0Ch,  80h,  24h,	 81h,  0Ch,  81h,  24h,	   0,  80h
		db   0Ch,    1,	0FAh,  80h,  82h,  24h,	0FAh, 0C0h,    0,  80h,	 0Ch,	 1, 0FAh,  40h,	 84h,  24h
		db  0FAh, 0C0h,	   0,  80h,  0Ch,    1,	0FAh,  80h,  83h,  24h,	0FAh, 0C0h,    0,  80h,	 0Ch,	 1
		db  0FAh,  40h,	 84h,  24h, 0FAh, 0C0h,	   0,  80h,  0Ch,    1,	0FAh,  80h,  82h,  18h,	0FAh, 0C0h
		db   80h,  0Ch,	 80h,  24h,  80h,  0Ch,	   1,  83h,  18h, 0FAh,	 40h,  84h,  0Ch, 0FAh,	0C0h,  80h
		db   24h,  80h,	 0Ch,  81h,  24h, 0FAh,	 80h,  82h,    4,    2,	   2,  82h,  0Ch, 0FAh,	0C0h,  83h
		db   18h,    3,	0FAh,  40h,  84h,  0Ch,	0FAh, 0C0h,  80h,  18h,	0F8h, 0C2h,  80h,  24h,	 80h,  0Ch
		db   81h,  30h,	 80h,  0Ch,  80h,  24h,	 81h,  30h, 0F8h, 0E0h,	 80h,  24h,  80h,  0Ch,	 81h,  30h
		db   80h,  18h,	 80h,  0Ch,  81h,  18h,	0FAh,  80h,  83h,  0Ch,	0FAh,  40h,  84h,  18h,	0F8h,  20h
		db  0F8h, 0C3h,	0FAh, 0C0h,  80h,  24h,	 80h,  0Ch,  81h,  30h,	 80h,  0Ch,  80h,  24h,	 81h,  30h
		db  0F8h, 0E0h,	0F8h, 0C1h,  80h,  30h,	   1,	 0,  81h,  18h,	   0, 0F8h, 0E0h, 0F8h,	 40h,  80h
		db   30h,    1,	   0, 0FAh,  80h,  82h,	 0Ch, 0FAh,  40h,    3,	0FAh, 0C0h,  81h,  18h,	 80h,  30h
		db   81h,  24h,	 80h,  0Ch,  80h,  10h,	   1,	 1,  81h,  18h,	 81h,  0Ch,    0, 0F8h,	0A0h, 0F8h
		db   60h,  80h,	 30h, 0FAh,  80h,  82h,	 0Ch,	 2, 0FAh, 0C0h,	 83h,  18h,  83h,  0Ch,	   3, 0FAh
		db   40h,  84h,	 18h, 0FAh,  80h,  82h,	   8, 0FAh, 0C0h,    3,	0FAh,  40h,    4, 0FAh,	0C0h,	 1
		db     1,    1,	 80h,  24h, 0FAh,  40h,	 83h,	 4,    3,    3,	0FAh,  80h,  82h,  0Ch,	 82h,  18h
		db  0FAh, 0C0h,	 80h,  0Ch,  80h,  30h,	   1,	 0,  81h,  2Bh,	0FAh,  40h,  84h,    4,	   4,	 4
		db  0FAh, 0C0h,	 83h,  0Eh,  83h,  12h,	 80h,  32h, 0FAh,  80h,	 82h,  24h, 0FAh, 0C0h,	 83h,  2Ah
		db  0FAh,  40h,	 84h,  32h, 0FAh, 0C0h,	 80h,  60h, 0FFh,    0,	   0
MUSIC_1A_PSG1:	db  0FDh,  7Ah,	0FCh,	 1, 0FBh,  4Ch,	0ABh,  60h,  29h,  26h,	 24h,  2Bh,  29h, 0A6h,	 24h, 0A6h
					; DATA XREF: ROM:E93Bo
		db   0Ch, 0FDh,	   0, 0F0h,  18h, 0FDh,	 7Ah, 0A9h,  78h, 0FDh,	   0, 0F0h, 0C0h,  70h,	 70h, 0F0h
		db   60h, 0FDh,	 7Bh, 0B5h,  0Ch,  34h,	 30h,  2Bh,  29h,  28h,	 24h,  1Fh, 0FDh,  2Bh,	0F8h, 0C3h
		db  0ADh,  0Ch,	 24h,  28h,  29h, 0F8h,	0E0h, 0F8h, 0C3h, 0ACh,	 0Ch,  24h,  26h,  29h,	0F8h, 0E0h
		db  0F8h, 0C1h,	0ABh,  0Ch,  23h,  24h,	 28h, 0F8h, 0E0h, 0F8h,	0C1h, 0AAh,  0Ch,  23h,	 25h,  27h
		db  0F8h, 0E0h,	0A8h,  0Ch,  23h,  28h,	 2Ah,  2Bh,  28h,  2Bh,	 2Dh,  2Fh,  2Bh,  36h,	 37h,  34h
		db   2Fh,  2Bh,	 28h, 0F8h, 0C1h, 0ADh,	 0Ch,  28h,  2Bh,  2Eh,	0F8h, 0E0h, 0F8h, 0C1h,	0B1h,  0Ch
		db   28h,  2Bh,	 2Dh, 0F8h, 0E0h, 0F8h,	0C7h, 0B2h,  0Ch,  28h,	 29h,  2Dh, 0F8h, 0E0h,	0F8h, 0C1h
		db  0B1h,  0Ch,	 28h,  2Dh,  2Fh, 0F8h,	0E0h, 0B1h,  18h,  2Fh,	 2Dh,  28h, 0F8h, 0C3h,	0ADh,  0Ch
		db   28h,  26h,	 24h, 0F8h, 0E0h, 0F8h,	0C3h, 0ABh,  0Ch,  26h,	 24h,  23h, 0F8h, 0E0h,	0F8h, 0C3h
		db  0A9h,  0Ch,	 24h,  23h,  21h, 0F8h,	0E0h, 0A8h,  0Ch,  23h,	 21h,  1Fh,  23h,  24h,	 28h,  2Bh
		db   35h,  34h,	 30h,  2Bh,  29h,  28h,	 24h,  1Fh, 0F8h, 0C3h,	0ADh,  0Ch,  24h,  28h,	 29h, 0F8h
		db  0E0h, 0F8h,	0C3h, 0ACh,  0Ch,  24h,	 26h,  29h, 0F8h, 0E0h,	0F8h, 0C3h, 0ABh,  0Ch,	 23h,  24h
		db   28h, 0F8h,	0E0h, 0F8h, 0C3h, 0AAh,	 0Ch,  21h,  24h,  26h,	0F8h, 0E0h, 0A8h,  0Ch,	 20h,  24h
		db   26h,  28h,	 20h,  24h,  28h, 0F8h,	0C1h, 0A6h,  0Ch,  1Dh,	 23h,  24h, 0F8h, 0E0h,	0A6h,  0Ch
		db   1Fh,  23h,	 24h,  26h,  1Fh,  23h,	 26h, 0F8h, 0C1h, 0A5h,	 0Ch,  1Ch,  1Fh,  21h,	0F8h, 0E0h
		db  0FDh,  7Ah,	0A9h,  0Ch,  28h,  29h,	 2Bh,  29h,  2Bh, 0ADh,	 78h, 0A9h,  0Ch,  28h,	 29h,  2Bh
		db   29h,  2Bh,	0ACh,  78h, 0FDh,    0,	0F0h, 0C0h,  70h,  70h,	 70h,  70h,  70h,  70h,	0F0h,  18h
		db  0FDh,  7Bh,	0B8h,	 6,  70h,  38h,	0F0h,  12h, 0B4h,    6,	0F0h,  12h, 0AFh,    6,	 70h,  2Dh
		db   70h,  2Ch,	0F0h,  12h, 0A8h,    6,	0F0h,  12h, 0A3h,  24h,	0FDh,  2Bh, 0F8h, 0C1h,	0ADh,  0Ch
		db   28h,  26h,	 24h, 0F8h, 0E0h, 0F8h,	0C3h, 0ABh,  0Ch,  26h,	 24h,  23h, 0F8h, 0E0h,	0F8h, 0C1h
		db  0ABh,  0Ch,	 28h,  26h,  24h, 0F8h,	0E0h, 0F8h, 0C1h, 0A9h,	 0Ch,  24h,  23h,  21h,	0F8h, 0E0h
		db  0F8h, 0C1h,	0A9h,  0Ch,  26h,  24h,	 23h, 0F8h, 0E0h, 0A4h,	 0Ch,  1Fh,  23h,  24h,	 28h,  23h
		db   24h,  28h,	 2Bh,  27h,  28h,  2Bh,	 2Fh,  2Bh,  2Fh,  30h,	0F8h,  20h, 0F8h, 0C3h,	0ADh,  0Ch
		db   24h,  28h,	 29h, 0F8h, 0E0h, 0F8h,	0C3h, 0ACh,  0Ch,  24h,	 26h,  29h, 0F8h, 0E0h,	0F8h, 0C3h
		db  0ABh,  0Ch,	 23h,  24h,  28h, 0F8h,	0E0h, 0F8h, 0C3h, 0AAh,	 0Ch,  21h,  24h,  26h,	0F8h, 0E0h
		db  0F8h, 0C1h,	0A6h,  0Ch,  20h,  23h,	 24h, 0F8h, 0E0h, 0F8h,	0C1h, 0A6h,  0Ch,  1Dh,	 23h,  24h
		db  0F8h, 0E0h,	0A6h,  0Ch,  1Fh,  23h,	 24h,  26h,  1Fh,  23h,	 26h, 0F8h, 0C1h, 0A5h,	 0Ch,  1Ch
		db   1Fh,  21h,	0F8h, 0E0h, 0F8h,  40h,	0BCh,  0Ch,  39h,  35h,	 34h,  32h,  30h,  2Dh,	 29h,  3Ch
		db   38h,  37h,	 35h,  32h,  2Fh,  2Ch,	 29h,  2Bh,  23h,  24h,	 28h,  2Bh,  27h,  28h,	 2Bh,  2Fh
		db   2Ah,  2Bh,	 2Fh,  30h,  2Fh,  30h,	 34h, 0F8h, 0A0h, 0F8h,	 60h, 0FDh,  7Ah,  9Dh,	 30h, 0A9h
		db   18h,  2Bh,	 2Dh,  2Dh,  2Fh,  30h,	0B0h, 0C0h, 0ACh, 0AEh,	0FDh,	 0, 0F0h,  0Ah,	0FDh,  7Ah
		db  0A9h,  24h,	0A7h,  2Ah, 0A6h,  32h,	0FCh,  80h, 0A8h, 0C0h,	0FCh,	 1, 0FBh,  40h,	0A8h,  8Ch
		db  0FDh,    0,	0F0h,	 6, 0FFh,    0,	   0
MUSIC_1A_PSG2:	db  0FDh,  7Ah,	0FCh,	 1, 0FBh,  4Ch,	0A6h,  60h,  24h,  23h,	 21h,  26h,  24h, 0A3h,	 24h, 0A3h
					; DATA XREF: ROM:E93Do
		db   0Ch, 0FDh,	   0, 0F0h,  18h, 0FDh,	 7Ah, 0A1h,  78h, 0FDh,	   0, 0F0h, 0C0h,  70h,	 70h, 0F0h
		db   66h, 0FDh,	 79h, 0B5h,  0Ch,  34h,	 30h,  2Bh,  29h,  28h,	 24h,  1Fh, 0FDh,  29h,	0F8h, 0C3h
		db  0ADh,  0Ch,	 24h,  28h,  29h, 0F8h,	0E0h, 0F8h, 0C3h, 0ACh,	 0Ch,  24h,  26h,  29h,	0F8h, 0E0h
		db  0F8h, 0C1h,	0ABh,  0Ch,  23h,  24h,	 28h, 0F8h, 0E0h, 0F8h,	0C1h, 0AAh,  0Ch,  23h,	 25h,  27h
		db  0F8h, 0E0h,	0A8h,  0Ch,  23h,  28h,	 2Ah,  2Bh,  28h,  2Bh,	 2Dh,  2Fh,  2Bh,  36h,	 37h,  34h
		db   2Fh,  2Bh,	 28h, 0F8h, 0C1h, 0ADh,	 0Ch,  28h,  2Bh,  2Eh,	0F8h, 0E0h, 0F8h, 0C1h,	0B1h,  0Ch
		db   28h,  2Bh,	 2Dh, 0F8h, 0E0h, 0F8h,	0C7h, 0B2h,  0Ch,  28h,	 29h,  2Dh, 0F8h, 0E0h,	0F8h, 0C1h
		db  0B1h,  0Ch,	 28h,  2Dh,  2Fh, 0F8h,	0E0h, 0B1h,  18h,  2Fh,	 2Dh,  28h, 0F8h, 0C3h,	0ADh,  0Ch
		db   28h,  26h,	 24h, 0F8h, 0E0h, 0F8h,	0C3h, 0ABh,  0Ch,  26h,	 24h,  23h, 0F8h, 0E0h,	0F8h, 0C3h
		db  0A9h,  0Ch,	 24h,  23h,  21h, 0F8h,	0E0h, 0A8h,  0Ch,  23h,	 21h,  1Fh,  23h,  24h,	 28h,  2Bh
		db   35h,  34h,	 30h,  2Bh,  29h,  28h,	 24h,  1Fh, 0F8h, 0C3h,	0ADh,  0Ch,  24h,  28h,	 29h, 0F8h
		db  0E0h, 0F8h,	0C3h, 0ACh,  0Ch,  24h,	 26h,  29h, 0F8h, 0E0h,	0F8h, 0C3h, 0ABh,  0Ch,	 23h,  24h
		db   28h, 0F8h,	0E0h, 0F8h, 0C3h, 0AAh,	 0Ch,  21h,  24h,  26h,	0F8h, 0E0h, 0A8h,  0Ch,	 20h,  24h
		db   26h,  28h,	 20h,  24h,  28h, 0F8h,	0C1h, 0A6h,  0Ch,  1Dh,	 23h,  24h, 0F8h, 0E0h,	0A6h,  0Ch
		db   1Fh,  23h,	 24h,  26h,  1Fh,  23h,	 26h,  25h,  1Ch,  1Fh,	 21h,  25h,  1Ch,  1Fh,	0A1h,	 6
		db  0FDh,  7Ah,	0A4h,  24h, 0A4h,  0Ch,	0FDh,	 0, 0F0h,  18h,	0FDh,  7Ah, 0A9h,  78h,	0A2h,  24h
		db  0A2h,  0Ch,	0FDh,	 0, 0F0h,  18h,	0FDh,  7Ah, 0A2h,  78h,	0FDh,	 0, 0F0h, 0C0h,	 70h,  70h
		db   70h,  70h,	 70h,  70h, 0F0h,  18h,	0FDh,  7Bh, 0AFh,    6,	 70h,  2Fh, 0F0h,  12h,	0ACh,	 6
		db  0F0h,  12h,	0ACh,	 6,  70h,  2Ah,	 70h,  28h, 0F0h,  12h,	0A0h,	 6, 0F0h,  12h,	0A0h,  24h
		db  0FDh,    0,	0F0h,	 6, 0FDh,  29h,	0F8h, 0C1h, 0ADh,  0Ch,	 28h,  26h,  24h, 0F8h,	0E0h, 0F8h
		db  0C3h, 0ABh,	 0Ch,  26h,  24h,  23h,	0F8h, 0E0h, 0F8h, 0C1h,	0ABh,  0Ch,  28h,  26h,	 24h, 0F8h
		db  0E0h, 0F8h,	0C1h, 0A9h,  0Ch,  24h,	 23h,  21h, 0F8h, 0E0h,	0F8h, 0C1h, 0A9h,  0Ch,	 26h,  24h
		db   23h, 0F8h,	0E0h, 0A4h,  0Ch,  1Fh,	 23h,  24h,  28h,  23h,	 24h,  28h,  2Bh,  27h,	 28h,  2Bh
		db   2Fh,  2Bh,	 2Fh,  30h, 0F8h,  20h,	0FDh,  29h, 0F8h, 0C3h,	0ADh,  0Ch,  24h,  28h,	 29h, 0F8h
		db  0E0h, 0F8h,	0C3h, 0ACh,  0Ch,  24h,	 26h,  29h, 0F8h, 0E0h,	0F8h, 0C3h, 0ABh,  0Ch,	 23h,  24h
		db   28h, 0F8h,	0E0h, 0F8h, 0C3h, 0AAh,	 0Ch,  21h,  24h,  26h,	0F8h, 0E0h, 0F8h, 0C1h,	0A6h,  0Ch
		db   20h,  23h,	 24h, 0F8h, 0E0h, 0F8h,	0C1h, 0A6h,  0Ch,  1Dh,	 23h,  24h, 0F8h, 0E0h,	0A6h,  0Ch
		db   1Fh,  23h,	 24h,  26h,  1Fh,  23h,	 26h,  25h,  1Ch,  1Fh,	 21h,  25h,  1Ch,  1Fh,	0A1h,	 6
		db  0F8h,  40h,	0B9h,  0Ch,  35h,  32h,	 30h,  2Fh,  2Dh,  29h,	 26h,  38h,  35h,  34h,	 32h,  2Fh
		db   2Ch,  29h,	 26h, 0FDh,  7Bh, 0B0h,	 3Ch, 0F0h,  0Ch, 0B0h,	   8,  30h,  30h, 0B0h,	   6, 0F0h
		db   0Ah, 0B0h,	   6, 0F0h,  0Ah, 0B0h,	   6, 0F0h,  0Ah, 0B0h,	   6, 0F0h,  12h, 0B0h,	   6, 0F0h
		db   18h, 0F8h,	0A0h, 0F8h,  60h, 0F0h,	 30h, 0FDh,  7Ah, 0A4h,	 18h,  26h,  29h,  29h,	 2Bh,  2Dh
		db  0A7h,  60h,	0ABh,  30h, 0ABh,  10h,	 29h,  27h, 0A6h,  66h,	0A9h,  48h, 0FDh,    0,	0F0h,  0Ah
		db  0FDh,  7Ah,	0A6h,  24h, 0A4h,  2Ah,	0A2h,  32h, 0FCh,  80h,	0A4h, 0C0h, 0FBh,  40h,	0FCh,	 1
		db  0A4h,  8Ch,	0FDh,	 0, 0F0h,    6,	0FFh,	 0,    0
MUSIC_1A_PSG3:	db  0FFh,    0,	   0	; DATA XREF: ROM:E93Fo	ROM:E941o
MUSIC_NULL:	db 0			; DATA XREF: ROM:MUSIC_BEGINo
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
