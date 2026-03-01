		db 0, 0, 0, 176
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
MUSIC_0D_YM1:
		db  0FCh,    1,	0FBh,  2Ch, 0F0h,  60h,	 70h, 0F8h,    0, 0F0h,	 0Ch, 0FEh,    5, 0FDh,	 0Ch,  1Ch
		db   1Dh,  20h,	 23h,  24h,  2Bh,  2Ah,	0FCh,  80h, 0A9h,    3,	 2Bh,  29h, 0FCh,    1,	0A8h,  4Bh
		db  0ABh,  0Ch,	0FCh,  80h, 0A9h,    3,	 2Bh,  29h, 0FCh,    1,	0A8h,  57h, 0A7h,    0,	0FCh,  85h
		db  0A8h,  48h,	0FCh, 0FFh,  9Dh,  30h,	0FCh,  80h, 0A0h,    4,	0A3h,	 3, 0FCh,    1,	0A0h,  35h
		db   9Dh,  16h,	0A0h,	 9, 0A3h,    8,	 26h, 0F0h,  0Ah, 0A5h,	   0, 0FCh,  85h, 0A6h,	 93h, 0FCh
		db  0FFh, 0A0h,	 30h, 0A1h,    4, 0A0h,	 2Ch, 0A8h,    0, 0FCh,	 85h, 0A9h,  30h, 0FCh,	0FFh, 0F8h
		db  0A1h
MUSIC_0D_YM2:
		db  0FEh,  35h,	0FDh,  0Bh, 0FCh,    8,	0FBh,  2Ch, 0F8h,    0,	 97h,  18h,  97h,  0Ch,	 17h, 0F8h
		db  0A1h
MUSIC_0D_YM3:
		db  0FEh,  35h,	0FDh,  0Bh, 0FCh,    8,	0FBh,  2Ch, 0F8h,    0,	 95h,  18h,  95h,  0Ch,	 15h, 0F8h
		db  0A1h
MUSIC_0D_YM4:
		db  0FEh,  35h,	0FDh,  0Dh, 0FCh,    8,	0FBh,  2Ch, 0F8h,    0,	 89h,  18h,  90h,  0Ch,	 10h, 0F8h
		db  0A1h
MUSIC_0D_YM5:
		db  0F9h,  20h,	0FCh,	 1, 0FBh,  2Ch,	0F0h,  66h, 0F0h,  60h,	0F8h,	 0, 0F0h,  0Ch,	0FEh,	 5
		db  0FDh,  0Ah,	 1Ch,  1Dh,  20h,  23h,	 24h,  2Bh,  2Ah, 0FCh,	 80h, 0A9h,    3,  2Bh,	0FCh,	 1
		db   29h, 0A8h,	 4Bh, 0ABh,  0Ch, 0FCh,	 80h, 0A9h,    3,  2Bh,	 29h, 0FCh,    1, 0A8h,	 57h, 0A7h
		db     0, 0FCh,	 85h, 0A8h,  48h, 0FCh,	0FFh,  9Dh,  30h, 0FCh,	 80h, 0A0h,    4, 0A3h,	   3, 0FCh
		db     1, 0A0h,	 35h,  9Dh,  16h, 0A0h,	   9, 0A3h,    8,  26h,	0F0h,  0Ah, 0A5h,    0,	0FCh,  85h
		db  0A6h,  93h,	0FCh, 0FFh, 0A0h,  30h,	0A1h,	 4, 0A0h,  2Ch,	0A8h,	 0, 0FCh,  85h,	0A9h,  30h
		db  0FCh, 0FFh,	0F8h, 0A1h
MUSIC_0D_YM6:
		db  0F0h,  60h,	0F0h,  0Ch,  84h,    6,	   4,  80h,  0Ch,    4,	   0,  84h,  18h,  84h,	 0Ch, 0F8h
		db     0,    0,	   0,  84h,    6,    4,	   0,	 0,    4,  80h,	   6,  84h,  0Ch,  84h,	   6,  80h
		db   0Ch,    4,	0F8h, 0A1h
MUSIC_0D_PSG1:
		db  0FDh,    0,	0FCh,	 1, 0FBh,  4Ch,	0F0h,  60h,  70h,  70h,	 70h, 0F8h,    0, 0F0h,	 18h, 0FDh
		db   7Dh, 0BAh,	 0Ch, 0B8h,    3, 0BAh,	   2, 0B8h,    7, 0BDh,	   6, 0F0h,  0Fh, 0B6h,	   3, 0B8h
		db   24h, 0BAh,	 0Ch, 0B8h,    3,  3Ah,	0B8h,	 6,  3Dh,  36h,	0B8h,  60h, 0FDh,    0,	0F0h,  30h
		db  0F0h,  3Ch,	0FDh,  7Dh, 0B3h,    6,	 31h, 0B8h,  0Ch, 0B6h,	   3,  38h, 0B6h,    6,	 3Ah,  33h
		db  0B5h,  24h,	0AEh,	 2, 0B0h,    6,	0F0h,	 4, 0AEh,    2,	0B0h,  52h, 0F0h,  18h,	0B8h,  20h
		db  0B6h,    8,	0B5h,	 7,  32h, 0AFh,	   6, 0ABh,    5, 0ACh,	   6, 0AEh,    5, 0ACh,	   3,  2Eh
		db   2Ch,  2Eh,	 2Ch,  2Eh,  2Ch,  2Eh,	0ACh,  0Ch, 0F0h,    8,	0FDh,	 0, 0F0h,  48h,	0FDh,  7Dh
		db  0B8h,    2,	0B6h,	 5,  70h, 0BAh,	   2, 0B8h,  0Ch, 0F0h,	 0Ah, 0BCh,    2, 0BAh,	 22h, 0F8h
		db  0A1h
MUSIC_0D_PSG2:
		db  0F9h,  10h,	0FDh,	 0, 0FCh,    1,	0FBh,  4Ch, 0F0h,  66h,	0F0h,  60h,  70h,  70h,	0F8h,	 0
		db  0F0h,  18h,	0FDh,  7Bh, 0BAh,  0Ch,	0B8h,	 3, 0BAh,    2,	0B8h,	 7, 0BDh,    6,	0F0h,  0Fh
		db  0B6h,    3,	0B8h,  24h, 0BAh,  0Ch,	0B8h,	 3,  3Ah, 0B8h,	   6,  3Dh,  36h, 0B8h,	 60h, 0FDh
		db     0, 0F0h,	 30h, 0F0h,  3Ch, 0FDh,	 7Bh, 0B3h,    6,  31h,	0B8h,  0Ch, 0B6h,    3,	 38h, 0B6h
		db     6,  3Ah,	 33h, 0B5h,  24h, 0AEh,	   2, 0B0h,    6, 0F0h,	   4, 0AEh,    2, 0B0h,	 52h, 0F0h
		db   18h, 0B8h,	 20h, 0B6h,    8, 0B5h,	   7,  32h, 0AFh,    6,	0ABh,	 5, 0ACh,    6,	0AEh,	 5
		db  0ACh,    3,	 2Eh,  2Ch,  2Eh,  2Ch,	 2Eh,  2Ch,  2Eh, 0ACh,	 0Ch, 0F0h,    8, 0FDh,	   0, 0F0h
		db   48h, 0FDh,	 7Bh, 0B8h,    2, 0B6h,	   5,  70h, 0BAh,    2,	0B8h,  0Ch, 0F0h,  0Ah,	0BCh,	 2
		db  0BAh,  22h,	0F8h, 0A1h
MUSIC_0D_PSG3:
		db  0FFh,    0,	   0
