; Z80 sound-driver RAM (1F80h-1FFFh): the scratch region above the driver's
; code and data. The last eight bytes (from NEW_SAMPLE_TO_LOAD) are the
; command interface the 68000 pokes to control playback.
        org 1F80h
; Stack space: SP starts at STACK_START and grows down through here. The
; driver's code and data must fit below 1F80h.
END_OF_DRIVER:			ds 70h
; Initial stack pointer (the stack grows downward into END_OF_DRIVER); the
; 8-byte gap keeps early pushes clear of the command bytes below.
STACK_START:			ds 8
; Pending DAC sample: a 1-based sample id for LoadDacSound to start, 0FEh
; for silence, 0 = nothing pending. Cleared once the sample is loaded.
NEW_SAMPLE_TO_LOAD:		ds 1
; Written once at init (0FFh) and never read - apparently unused/reserved.
YM_TIMER_VALUE:			ds 3
; Fade-in configuration: low nibble = the music level a track starts at,
; upper bits = the fade-in speed (see Load_Music and UpdateSound).
FADE_IN_PARAMETERS:		ds 1
; Current music volume, 0-0Fh (0Fh = full); ramped up by the fade-in and
; used as the base attenuation for every channel.
MUSIC_LEVEL:			ds 1
; Priority of the type-2 SFX currently playing. Set to 0 at init and never
; updated, so the priority gate in Load_SFX_Type_2 (NEW - CUR) can never
; borrow and a type-2 SFX always loads - the check is vestigial.
SFX_TYPE2_PRIORITY_CUR:		ds 1
; Command byte, at the very top of sound RAM (1FFFh): the 68000 writes a
; request here and Main dispatches it - 0FFh mute, 0FEh stop, 0FDh fade out,
; 0F0h set level, >=41h play that SFX, otherwise play the music track of
; that id. Cleared once consumed.
NEW_OPERATION:			ds 1
