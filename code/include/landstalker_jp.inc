; enum CHR
CHR_Space:	 equ $00000000
CHR_BREAKING_SPACE: equ	$0000007B
CHR_BREAK_POINT: equ $0000007C
CHR_MULT:	 equ $00000080
CHR_FullStop:	 equ $000000D8
CHR_BEGIN_TALK:	 equ $000000D9
CHR_STR_BEGIN:	 equ $000000E9			  ; String begin
CHR_ARROW_PROMPT: equ $000000EA			  ; Down arrow prompt

; ---------------------------------------------------------------------------

; enum Constants
NUM_CHAR_NAMES:	 equ $0000003C
SCRIPT_STRINGS_BEGIN: equ $0000004D


False:                  equ     0
True:                   equ     1

US:                     equ     0
JP:                     equ     1
UK:                     equ     2
FR:                     equ     3
DE:                     equ     4
US_BETA:                equ     5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
REGION:                             equ     JP
ENABLE_REGION_CHECK:                equ     False
FIX_COLLISION_GLITCH:               equ     False
FIX_ARMLET_SKIP:                    equ     False
FIX_EINSTEIN_WHISTLE_FLAG_CHECK:    equ     False
FIX_SPRITE_HIDE_BUG:                equ     False
ENABLE_GOLD_COUNTUP_ON_TREASURE:    equ     False
FIX_POTENTIAL_CORRUPTION_ON_GOLA:   equ     False
FIX_GOLD_CAP_ON_FILE_LOAD:          equ     False
