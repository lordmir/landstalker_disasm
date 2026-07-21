; DAC sample directory, indexed by (NEW_SAMPLE_TO_LOAD - 1). One 8-byte
; entry per sample - four little-endian words, the first two of which use
; only their low byte:
;   +0  playback rate: patched into the DAC inter-byte delay loop
;       (Dac_Loop+1); larger = slower playback / lower pitch.  (+1 unused)
;   +2  ROM bank holding the PCM (-> BANK_TO_LOAD).                (+3 unused)
;   +4  sample length in bytes.
;   +6  start address within the banked window (8000h-DFFFh).
; LoadDacSound reads the chosen entry; the main loop then streams the
; unsigned 8-bit PCM from +6 to the YM2612 DAC (register 2Ah), one byte per
; pass, until the length runs out. Samples are packed consecutively within
; a bank, and several entries alias the same PCM at different rates (e.g.
; the three below share start 99C8h at rates 01h/05h/09h). Sample id 0FEh
; is the "silence" sentinel (start 0C000h, length 0), handled specially.
t_SAMPLE_LOAD_DATA:
		db 01h, 00h, 00h, 00h,  52h, 09h,  00h, 80h
		db 01h,	00h, 00h, 00h,  76h, 10h,  52h, 89h
		db 01h,	00h, 00h, 00h, 0AFh, 10h, 0C8h,	99h
		db 05h,	00h, 00h, 00h, 0AFh, 10h, 0C8h,	99h
		db 09h,	00h, 00h, 00h, 0AFh, 10h, 0C8h,	99h
		db 03h,	00h, 00h, 00h,  00h, 19h,  77h, 0AAh
		db 09h,	00h, 00h, 00h,  76h, 10h,  52h, 89h
		db 14h,	00h, 00h, 00h,  52h, 09h,  00h, 80h
		db 14h,	00h, 00h, 00h, 0AFh, 10h, 0C8h,	99h
		db 01h,	00h, 00h, 00h, 0E5h, 10h,  77h, 0C3h
		db 01h,	00h, 00h, 00h, 0E5h, 10h,  5Ch, 0D4h
		db 01h,	00h, 01h, 00h,  4Eh, 0Bh,  00h, 80h
		db 01h,	00h, 01h, 00h, 0EAh, 0Bh, 0E2h,	99h
		db 05h,	00h, 00h, 00h,  93h, 0Ah,  41h, 0E5h
		db 01h,	00h, 00h, 00h,  93h, 0Ah,  41h, 0E5h
		db 05h,	00h, 01h, 00h, 0EAh, 0Bh, 0E2h,	99h
		db 01h,	00h, 01h, 00h, 0D2h, 31h, 0CCh,	0A5h
		db 09h,	00h, 00h, 00h, 0F9h, 0Fh, 0D4h,	0EFh
		db 09h,	00h, 01h, 00h,  94h, 0Eh,  4Eh, 8Bh
		db 14h,	00h, 00h, 00h, 0F9h, 0Fh, 0D4h,	0EFh
		db 14h,	00h, 01h, 00h,  94h, 0Eh,  4Eh, 8Bh
		db 0Ah,	00h, 01h, 00h,  3Eh, 21h,  9Eh, 0D7h
		db 14h,	00h, 01h, 00h,  3Eh, 21h,  9Eh, 0D7h
		db 01h,	00h, 01h, 00h,  0Fh, 07h, 0DCh, 0F8h
