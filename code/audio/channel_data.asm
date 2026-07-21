; Per-channel runtime state: one 32-byte record per channel, addressed as
; (ix+N) throughout the driver. Each record is 30 bytes of working state
; followed by the 2-byte field labelled *_STEREO; the parsers step between
; records with `add ix, 20h`. The bytes below are the reset state (channel
; idle), most of which a loading track overwrites. Field layout:
;   +00 +01  read cursor into the track's event data
;   +02      event duration countdown (0 = fetch the next event)
;   +03      channel-idle flag: set at end of data; while set the channel
;            is skipped each frame
;   +04      volume level (added to MUSIC_LEVEL to form the attenuation)
;   +05      scratch: FM algorithm during instrument load / PSG output
;            attenuation before transmit
;   +06      key-off point: release the note once the duration counter
;            (+02) reaches this
;   +07      default event duration, reused when an event omits its own
;   +08      key/gate flags (bit 7 = hold past the key-off point)
;   +09      vibrato speed / initial delay
;   +0A      vibrato delay countdown
;   +0B +0C  pointer to the active pitch-effect (vibrato) table
;   +0D      step index within that table
;   +0E +0F  current output frequency (FM block/F-number, or PSG period)
;   +10..+12 channel-type-specific (see below)
;   +13 +14  loop: saved position, marker 0
;   +15 +16  loop: saved position, marker 1
;   +17 +18  loop: counted-loop return position
;   +19      loop: counted-loop iteration counter
;   +1A +1B  loop: one-shot flags for the conditional loop jumps
;   +1C      note transpose in semitones (signed)
;   +1D      fine pitch offset added to the frequency
;   +1E      stereo/pan: FM writes it to YM2612 register B4h; PSG has no
;            such register and reuses it as a "note changed" flag
;   +1F      portamento / pitch-slide speed (0 = off)
; The two bytes labelled *_STEREO are +1E and +1F above (pan and slide
; speed) - only the first is actually stereo.
;
; +10..+12 differ by channel type:
;   FM   +10      instrument number
;        +11 +12  portamento target frequency (low/high), slid toward when
;                 +1F is non-zero
;   PSG  +10 +11  pointer to the amplitude envelope
;        +12      envelope step index (key-off scans it to the release part)
YM_CHANNEL_DATA_1:					db 0, 0, 0, 1, 0Eh, 0, 1, 18h, 0, 0, 0, 3, 12h, 17 dup (0)
YM_CHANNEL_1_STEREO:				db 0, 0
YM_CHANNEL_DATA_2:					db 0, 0, 0, 1, 0Eh, 0, 1, 18h, 0, 0, 0, 3, 12h, 17 dup (0)
YM_CHANNEL_2_STEREO:				db 0, 0
YM_CHANNEL_DATA_3:					db 0, 0, 0, 1, 0Eh, 0, 1, 18h, 0, 0, 0, 3, 12h, 17 dup (0)
YM_CHANNEL_3_STEREO:				db 0, 0
YM_CHANNEL_DATA_4:					db 0, 0, 0, 1, 0Eh, 0, 1, 18h, 0, 0, 0, 3, 12h, 17 dup (0)
YM_CHANNEL_4_STEREO:				db 0, 0
YM_CHANNEL_DATA_5:					db 0, 0, 0, 1, 0Eh, 0, 1, 18h, 0, 0, 0, 3, 12h, 17 dup (0)
YM_CHANNEL_5_STEREO:				db 0, 0
YM_CHANNEL_DATA_6:					db 0, 0, 0, 1, 0Eh, 0, 0, 18h, 0, 0, 0, 3, 12h, 17 dup (0)
YM_CHANNEL_6_STEREO:				db 0, 0
PSG_CHANNEL_DATA_TONE_1:			db 0, 0, 0, 1, 0Eh, 0, 1, 18h, 0, 0, 0, 3, 12h, 17 dup (0)
PSG_CHANNEL_1_STEREO:				db 0, 0
PSG_CHANNEL_DATA_TONE_2:			db 0, 0, 0, 1, 0Eh, 0, 1, 18h, 0, 0, 0, 3, 12h, 17 dup (0)
PSG_CHANNEL_2_STEREO:				db 0, 0
PSG_CHANNEL_DATA_TONE_3:			db 0, 0, 0, 1, 0Eh, 0, 1, 18h, 0, 0, 0, 3, 12h, 17 dup (0)
PSG_CHANNEL_3_STEREO:				db 0, 0
PSG_CHANNEL_DATA_NOISE:				db 0, 0, 0, 1, 0Eh, 0, 1, 18h, 0, 0, 0, 3, 12h, 17 dup (0)
PSG_CHANNEL_NOISE_STEREO:			db 0, 0
SFX_TYPE_2_CHANNEL_DATA_1:			db 0, 0, 0, 1, 0Eh, 0, 1, 18h, 0, 0, 0, 3, 12h, 17 dup (0)
SFX_TYPE_2_CHANNEL_1_STEREO:		db 0, 0
SFX_TYPE_2_CHANNEL_DATA_2:			db 0, 0, 0, 1, 0Eh, 0, 1, 18h, 0, 0, 0, 3, 12h, 17 dup (0)
SFX_TYPE_2_CHANNEL_2_STEREO:		db 0, 0
SFX_TYPE_2_CHANNEL_DATA_3:			db 0, 0, 0, 1, 0Eh, 0, 0, 18h, 0, 0, 0, 3, 12h, 17 dup (0)
SFX_TYPE_2_CHANNEL_3_STEREO:		db 0, 0
SFX_TYPE_2_CHANNEL_DATA_NOISE:		db 30 dup (0)
SFX_TYPE_2_CHANNEL_NOISE_STEREO:	db 0, 0
