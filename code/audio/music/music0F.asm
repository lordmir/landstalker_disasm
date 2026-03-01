		db 0, 0, 0, 198
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
MUSIC_0F_YM1:
		db  0F8h, 0C1h,	0F0h,  0Ch, 0FEh,  3Dh,	0FDh,  0Ah, 0FAh,  40h,	0BCh,	 6,  3Ch, 0BCh,	 18h, 0FAh
		db   80h, 0BCh,	   6,  3Ch, 0BCh,  18h,	0FAh,  40h, 0BCh,    6,	 3Ch, 0F8h, 0E0h, 0FAh,	0C0h, 0FEh
		db     7, 0FDh,	 0Ch, 0FCh,    1, 0FBh,	 2Fh,  82h,    0, 0FCh,	0A1h, 0FBh,  20h, 0BFh,	 60h, 0FCh
		db  0FFh, 0FEh,	 14h, 0FDh,  0Ch, 0A7h,	 12h, 0FDh,    8, 0A7h,	   6, 0FDh,    6,  27h,	 70h, 0FFh
		db     0,    0
MUSIC_0F_YM2:
		db  0F0h,  60h,	 70h, 0FEh,    7, 0FDh,	 0Ch, 0FCh,    1, 0FBh,	 2Fh,  80h,    0, 0FCh,	 9Fh, 0BAh
		db   60h, 0FCh,	0FFh, 0FEh,  14h, 0FDh,	 0Ch, 0A2h,  12h, 0FDh,	   8, 0A2h,    6, 0FDh,	   6,  22h
		db   70h, 0FFh,	   0,	 0
MUSIC_0F_YM3:
		db  0FCh,    1,	0FBh,  2Ch, 0FAh,  80h,	0FEh,  11h, 0FDh,  0Ch,	0B4h,  12h, 0FDh,  0Ah,	0B4h,  36h
		db  0B4h,  12h,	0FDh,	 8, 0B4h,  36h,	0FDh,  0Ch, 0B2h,  12h,	0FDh,  0Ah, 0B2h,  7Eh,	0FAh, 0C0h
		db  0FEh,  14h,	0FDh,  0Ch,  9Fh,  12h,	0FDh,	 8,  9Fh,    6,	0FDh,	 6,  1Fh,  70h,	0FFh,	 0
		db     0
MUSIC_0F_YM4:
		db  0F0h,  60h,	 70h, 0FEh,  32h, 0FDh,	 0Ch,  11h, 0FDh,    0,	0F0h,	 6, 0FEh,  14h,	0FDh,  0Ch
		db  0A7h,  12h,	0F9h,  20h, 0FEh,  0Ch,	0FDh,  0Ah, 0FCh,  80h,	 8Fh,  48h, 0FBh,  20h,	0FDh,  0Ah
		db   8Fh,    6,	0FDh,	 8,  0Fh, 0FDh,	   6,  0Fh, 0FDh,    4,	0FCh,	 1,  0Fh, 0FFh,	   0,	 0
MUSIC_0F_YM5:
		db  0FCh,    1,	0FBh,  2Ch, 0FAh,  40h,	0F9h,  20h, 0F0h,    6,	0FEh,  11h, 0FDh,  0Bh,	0B4h,  12h
		db  0FDh,    9,	0B4h,  36h, 0B4h,  12h,	0FDh,	 7, 0B4h,  36h,	0FDh,  0Bh, 0B2h,  12h,	0FDh,	 9
		db  0B2h,  7Eh,	0FAh, 0C0h, 0F0h,  12h,	0F9h,	 0, 0FEh,  0Ch,	0FDh,  0Ch, 0FCh,  80h,	 8Fh,  48h
		db  0FBh,  20h,	0FDh,  0Ch,  8Fh,    6,	0FDh,  0Ah,  0Fh, 0FDh,	   8,  0Fh, 0FCh,    1,	0FDh,	 6
		db   0Fh, 0FFh,	   0,	 0
MUSIC_0F_YM6:
		db  0F0h,  60h,	0F0h, 0C0h,  81h,  18h,	 80h,  48h, 0FFh,    0,	   0
MUSIC_0F_PSG1:
		db  0FCh,    1,	0FDh,  87h, 0B5h,    4,	 38h,  3Bh,  40h,  3Eh,	 3Bh, 0FDh,  88h,  35h,	 38h,  3Bh
		db   40h,  3Eh,	 3Bh, 0FDh,  89h,  35h,	 38h,  3Bh,  40h,  3Eh,	 3Bh, 0FDh,  8Ah,  35h,	 38h,  3Bh
		db   40h,  3Eh,	 3Bh, 0FDh,  8Bh, 0F8h,	0C4h, 0B5h,    4,  38h,	 3Bh,  40h,  3Eh,  3Bh,	0F8h, 0E0h
		db  0FDh,  8Ah,	0B5h,	 4,  38h,  3Bh,	 40h,  3Eh,  3Bh, 0FDh,	 89h,  35h,  38h,  3Bh,	 40h,  3Eh
		db   3Bh, 0FDh,	 88h,  35h,  38h,  3Bh,	 40h,  3Eh,  3Bh, 0FDh,	 0Dh, 0BFh,  18h, 0F0h,	   6, 0FDh
		db     0, 0FFh,	   0,	 0
MUSIC_0F_PSG2:
		db  0FDh,    0,	0F0h,	 6, 0FCh,    1,	0FDh,  85h, 0B5h,    4,	 38h,  3Bh,  40h,  3Eh,	 3Bh, 0FDh
		db   86h,  35h,	 38h,  3Bh,  40h,  3Eh,	 3Bh, 0FDh,  87h,  35h,	 38h,  3Bh,  40h,  3Eh,	 3Bh, 0FDh
		db   88h,  35h,	 38h,  3Bh,  40h,  3Eh,	 3Bh, 0FDh,    9, 0F8h,	0C4h, 0B5h,    4,  38h,	 3Bh,  40h
		db   3Eh,  3Bh,	0F8h, 0E0h, 0FDh,  88h,	0B5h,	 4,  38h,  3Bh,	 40h,  3Eh,  3Bh, 0FDh,	 87h,  35h
		db   38h,  3Bh,	 40h,  3Eh,  3Bh, 0FDh,	 86h,  35h,  38h,  3Bh,	 40h,  3Eh,  3Bh, 0FDh,	 0Bh, 0B7h
		db   18h, 0F0h,	   6, 0FDh,    0, 0FFh,	   0,	 0
MUSIC_0F_PSG3:
		db  0FFh,    0,	   0
