;                      C      C#     D      D#     E      F      F#     G	   G#	  A      A#     B
t_YM_FREQUENCIES:	dw 0A8Ah, 0AB1h, 0ADAh, 0B06h, 0B33h, 0B64h, 0B98h, 0BCEh, 0C09h, 0C46h, 0C87h, 1266h
					dw 128Ah, 12B1h, 12DAh,	1306h, 1333h, 1364h, 1398h, 13CEh, 1409h, 1446h, 1487h,	1A66h
					dw 1A8Ah, 1AB1h, 1ADAh,	1B06h, 1B33h, 1B64h, 1B98h, 1BCEh, 1C09h, 1C46h, 1C87h,	2266h
					dw 228Ah, 22B1h, 22DAh,	2306h, 2333h, 2364h, 2398h, 23CEh, 2409h, 2446h, 2487h,	2A66h
					dw 2A8Ah, 2AB1h, 2ADAh,	2B06h, 2B33h, 2B64h, 2B98h, 2BCEh, 2C09h, 2C46h, 2C87h,	3266h
					dw 328Ah, 32B1h, 32DAh,	3306h, 3333h, 3364h, 3398h, 33CEh, 3409h, 3446h, 3487h,	3A66h
					dw 3A8Ah, 3AB1h, 3ADAh,	3B06h, 3B33h, 3B64h, 3B98h, 3BCEh, 3C09h, 3C46h, 3C87h,	3CCBh
;                      A      A#     B      C      C#     D      D#     E      F      F#     G      G#
t_PSG_FREQUENCIES:	dw 03EFh, 03B6h, 0381h, 034Fh, 0320h, 02F2h, 02C8h, 02A0h, 027Ah, 0257h, 0235h, 0215h
					dw 01F7h, 01DCh, 01C1h,	01A7h, 018Fh, 0179h, 0164h, 0150h, 013Dh, 012Bh, 011Ah,	010Bh
					dw 00FCh, 00EEh, 00E1h,	00D4h, 00C8h, 00BDh, 00B2h, 00A8h, 009Fh, 0096h, 008Dh,	0085h
					dw 007Eh, 0077h, 0070h,	006Ah, 0064h, 005Eh, 0059h, 0054h, 004Fh, 004Bh, 0047h,	0043h
					dw 003Fh, 003Bh, 0038h,	0035h, 0032h, 002Fh, 002Ch, 002Ah, 0028h, 0025h, 0023h,	0022h
					dw 001Fh, 001Dh, 001Ch,	001Bh
t_YM_LEVELS:		db 70h,	60h, 50h, 40h, 38h, 30h, 2Ah, 26h, 20h,	1Ch, 18h, 14h, 10h, 0Bh, 08h, 04h
t_SLOTS_PER_ALGO:	db 08h, 08h, 08h, 08h,	0Ch, 0Eh, 0Eh, 0Fh
pt_PITCH_EFFECTS:	dw t_PITCH_EFFECT_0
					dw t_PITCH_EFFECT_1
					dw t_PITCH_EFFECT_2
					dw t_PITCH_EFFECT_3
					dw t_PITCH_EFFECT_4
					dw t_PITCH_EFFECT_5
					dw t_PITCH_EFFECT_6
					dw t_PITCH_EFFECT_7
					dw t_PITCH_EFFECT_8
					dw t_PITCH_EFFECT_9
					dw t_PITCH_EFFECT_10
					dw t_PITCH_EFFECT_11
					dw t_PITCH_EFFECT_12
					dw t_PITCH_EFFECT_13
					dw t_PITCH_EFFECT_14
					dw t_PITCH_EFFECT_15
t_PITCH_EFFECT_0:	db 00h, 80h
t_PITCH_EFFECT_1:	db 0F0h, 10h, 10h, 0F0h, 80h
t_PITCH_EFFECT_2:	db 0FDh, 0FDh,	0FFh, 1, 3, 3, 3, 1, 0FFh, 0FDh, 80h
t_PITCH_EFFECT_3:	db 0FEh, 0FEh,	0FFh, 1, 2, 2, 2, 1, 0FFh, 0FEh, 80h
t_PITCH_EFFECT_4:	db 0FFh, 0FFh,	0, 1, 1, 1, 1, 0, 0FFh,	0FFh, 80h
t_PITCH_EFFECT_5:	db 0FFh, 0, 0,	1, 0, 1, 0, 0, 0FFh, 0,	80h
t_PITCH_EFFECT_6:	db 2, 80h
t_PITCH_EFFECT_7:	db 0FEh, 80h
t_PITCH_EFFECT_8:	db 4, 80h
t_PITCH_EFFECT_9:	db 0FCh, 80h
t_PITCH_EFFECT_10:	db 8,	80h
t_PITCH_EFFECT_11:	db 0F8h, 80h
t_PITCH_EFFECT_12:	db 10h, 80h
t_PITCH_EFFECT_13:	db 0F0h, 80h
t_PITCH_EFFECT_14:	db 20h, 80h
t_PITCH_EFFECT_15:	db 0E0h, 80h
pt_PSG_INSTRUMENTS:	dw t_PSG_INSTRUMENT_0
					dw t_PSG_INSTRUMENT_1
					dw t_PSG_INSTRUMENT_2
					dw t_PSG_INSTRUMENT_3
					dw t_PSG_INSTRUMENT_4
					dw t_PSG_INSTRUMENT_5
					dw t_PSG_INSTRUMENT_6
					dw t_PSG_INSTRUMENT_7
					dw t_PSG_INSTRUMENT_8
					dw t_PSG_INSTRUMENT_9
					dw t_PSG_INSTRUMENT_10
					dw t_PSG_INSTRUMENT_11
					dw t_PSG_INSTRUMENT_12
					dw t_PSG_INSTRUMENT_13
					dw t_PSG_INSTRUMENT_14
					dw t_PSG_INSTRUMENT_15
t_PSG_INSTRUMENT_0:	db 8Fh, 8Bh
t_PSG_INSTRUMENT_1:	db 0Fh, 0Fh, 0Eh, 0Dh, 0Ch, 0Bh, 0Ah, 9, 8, 7, 6, 5, 4, 3, 2, 1
					db 80h,	80h
t_PSG_INSTRUMENT_2:	db 0Fh, 0Eh, 0Eh, 0Dh, 0Dh, 0Dh, 0Ch, 0Ch, 0Ch, 0Ch, 8Bh, 0Ah, 0Ah, 89h
t_PSG_INSTRUMENT_3:	db 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh
					db 0Eh,	0Eh, 8Dh, 0Bh, 0Bh, 0Bh, 8Ah
t_PSG_INSTRUMENT_4:	db 0Fh, 0Fh, 8Eh, 0Bh, 0Bh, 0Bh, 8Ah
t_PSG_INSTRUMENT_5:	db 0Fh, 0Eh, 8Dh, 0Bh, 9, 7, 5, 3, 2, 1, 80h
t_PSG_INSTRUMENT_6:	db 0Dh, 0Eh, 0Fh, 8Eh, 4, 2, 1, 80h
t_PSG_INSTRUMENT_7:	db 0Dh, 0Eh, 0Fh, 8Eh, 8Bh
t_PSG_INSTRUMENT_8:	db 0Fh, 0Fh, 0Eh, 0Eh, 0Dh, 0Ch, 0Fh, 0Fh, 0Eh, 0Eh, 0Dh, 0Dh, 8Ch, 8Ah
t_PSG_INSTRUMENT_9:	db 0Bh, 0Ch, 0Dh, 0Eh, 8Fh, 88h
t_PSG_INSTRUMENT_10:db 0Bh, 0Dh, 0Fh, 0Eh, 0Dh, 8Ch, 0Ah, 0Ah, 9, 9, 88h
t_PSG_INSTRUMENT_11:db 8Fh, 8Fh
t_PSG_INSTRUMENT_12:db 0Fh, 0Ah, 86h, 83h
t_PSG_INSTRUMENT_13:db 0Fh, 0Ch, 0Ah, 8, 86h, 83h
t_PSG_INSTRUMENT_14:db 0Fh, 0Dh, 0Bh, 9, 8, 7, 86h, 83h
t_PSG_INSTRUMENT_15:db 8Fh, 80h, 0, 0, 0, 0, 0, 0, 0, 0, 0
