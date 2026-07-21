; Initialised runtime state for the sound driver: loaded from ROM with the
; driver and updated as it runs.
;
; Incremented in YM1_SetStereo_Ignore and zeroed at track start, but never
; read anywhere - a genuinely dead counter.
USELESS_BYTE:					db 0
; PSG latch bits (5-6) for the channel being processed; OR'd into every
; write to the PSG port to address the right channel.
CURRENT_PSG_CHANNEL:			db 0
; Index of the channel currently being processed. iy points here throughout,
; and the parse loops write/inc (iy+0) to walk the channels.
CURRENT_CHANNEL:				db 0
; Flag: nonzero while a fade-out is in progress (see UpdateSound / FadeOut).
; Only the first byte is used; the second is padding.
CURRENTLY_FADING_OUT:			db 0, 0
; Routes YM_Input to the YM2612's second address/data port (the registers
; for channels 4-6) when nonzero, the first port (channels 1-3) when 0.
CALL_YM2_INSTEAD_OF_YM1:		db 0
; Flag: set while processing the type-2 SFX channels, which conditionally
; override the music channels. Gates the *_ConditionalInput writes.
CURRENTLY_MANAGING_SFX_TYPE_2:	db 0
; Frames between fade-out volume steps (set to 12h by FadeOut).
FADE_OUT_LENGTH:				db 1
; Countdown of frames to the next fade-out step; reloaded from FADE_OUT_LENGTH.
FADE_OUT_TIMER:					db 63h
; Fade-out steps taken so far (0-0Ch); at 0Ch the music is stopped. Also
; biases the level during instrument load, dimming the output as it rises.
FADE_OUT_COUNTER:				db 0
; 16-bit frame countdown taken from the song header: UpdateSound decrements
; it each frame and triggers a fade-out when it reaches zero; an initial 0
; disables it (the track plays until stopped).
MUSIC_AUTOFADE_TIMER:			dw 0
; ROM bank holding the DAC sample being loaded (used by LoadBank).
BANK_TO_LOAD:					db 0
; ROM bank holding the current song / instrument data (0 or 1 by song id;
; used by LoadMusicBank).
MUSIC_BANK_TO_LOAD:				db 0
; Priority of an incoming type-2 SFX, compared against SFX_TYPE2_PRIORITY_CUR
; in Load_SFX_Type_2. Reset to 0FFh at every track/channel end. Because CUR is
; always 0 the comparison is inert (see there). The trailing 0 byte is unused
; padding.
SFX_TYPE2_PRIORITY_NEW:				db 0FFh, 0
; 16-bit scratch for the FM portamento / pitch-slide math.
TEMP_FREQUENCY:					dw 0
; Scratch holding the next YM register base across the instrument-load loops.
TEMP_REGISTER:					db 0
; Frame counter for the fade-in ramp; when it reaches the configured rate
; MUSIC_LEVEL is bumped up a step. Reset when a track loads.
FADE_IN_TIMER:					db 0
