; Music Track 0x04 - Receive Item

		db 0, 0, 0, 178
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

MUSIC_04_YM1:
		db  0FEh,  0Dh,	0FDh,  0Bh, 0FCh,    1,	0FBh,  2Ch, 0ABh,    5,	0F0h,	 3, 0A9h,    5,	0F0h,	 3
		db  0ABh,    5,	0F0h,	 3, 0ACh,  36h,	0F0h,	 6, 0FFh,    0,	   0
MUSIC_04_YM2:
		db  0FEh,  0Dh,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0A4h,    5,	0F0h,	 3, 0A2h,    5,	0F0h,	 3
		db  0A4h,    5,	0F0h,	 3, 0A5h,  36h,	0F0h,	 6, 0FFh,    0,	   0
MUSIC_04_YM3:
		db  0FEh,  0Dh,	0FDh,  0Ah, 0FCh,    1,	0FBh,  2Ch, 0A2h,    5,	0F0h,	 3, 0A0h,    5,	0F0h,	 3
		db  0A2h,    5,	0F0h,	 3,  9Dh,  36h,	0F0h,	 6, 0FFh,    0,	   0
MUSIC_04_YM4:
		db  0FEh,  0Dh,	0FDh,  0Ch, 0FCh,    1,	0FBh,  2Ch,  94h,    8,	 12h,  11h,  8Fh,  36h,	0F0h,	 6
		db  0FFh,    0,	   0
MUSIC_04_YM5:
		db  0F9h,  20h,	0F0h,	 3, 0FEh,  0Dh,	0FDh,	 9, 0FCh,    1,	0FBh,  2Ch, 0ABh,    5,	0F0h,	 3
		db  0A9h,    5,	0F0h,	 3, 0ABh,    5,	0F0h,	 3, 0ACh,  36h,	0F0h,	 3, 0FFh,    0,	   0
MUSIC_04_YM6:
		db   89h,    8,	   9,	 9,  8Ah,    4,	 8Ah,	 3,  8Ah,    2,	 0Ah,  0Ah,  0Ah, 0F8h,	0CCh,  8Bh
		db     2, 0F8h,	0E0h,  8Ah,    2,  0Ah,	 8Ah,	 3,  89h,    6,	0FFh,	 0,    0
MUSIC_04_PSG1:
		db  0FFh,    0,	   0
MUSIC_04_PSG2:
		db  0FFh,    0,	   0
MUSIC_04_PSG3:
		db  0FFh,    0,	   0
