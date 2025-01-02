
; ---------------------------------------------------------------------------

; enum CHR
CHR_Space:	 equ $00000000
CHR_0:		 equ $00000001
CHR_1:		 equ $00000002
CHR_2:		 equ $00000003
CHR_3:		 equ $00000004
CHR_4:		 equ $00000005
CHR_5:		 equ $00000006
CHR_6:		 equ $00000007
CHR_7:		 equ $00000008
CHR_8:		 equ $00000009
CHR_9:		 equ $0000000A
CHR_A:		 equ $0000000B
CHR_B:		 equ $0000000C
CHR_C:		 equ $0000000D
CHR_D:		 equ $0000000E
CHR_E:		 equ $0000000F
CHR_F:		 equ $00000010
CHR_G:		 equ $00000011
CHR_H:		 equ $00000012
CHR_I:		 equ $00000013
CHR_J:		 equ $00000014
CHR_K:		 equ $00000015
CHR_L:		 equ $00000016
CHR_M:		 equ $00000017
CHR_N:		 equ $00000018
CHR_O:		 equ $00000019
CHR_P:		 equ $0000001A
CHR_Q:		 equ $0000001B
CHR_R:		 equ $0000001C
CHR_S:		 equ $0000001D
CHR_T:		 equ $0000001E
CHR_U:		 equ $0000001F
CHR_V:		 equ $00000020
CHR_W:		 equ $00000021
CHR_X:		 equ $00000022
CHR_Y:		 equ $00000023
CHR_Z:		 equ $00000024
CHR_a:		 equ $00000025
CHR_b:		 equ $00000026
CHR_c:		 equ $00000027
CHR_d:		 equ $00000028
CHR_e:		 equ $00000029
CHR_f:		 equ $0000002A
CHR_g:		 equ $0000002B
CHR_h:		 equ $0000002C
CHR_i:		 equ $0000002D
CHR_j:		 equ $0000002E
CHR_k:		 equ $0000002F
CHR_l:		 equ $00000030
CHR_m:		 equ $00000031
CHR_n:		 equ $00000032
CHR_o:		 equ $00000033
CHR_p:		 equ $00000034
CHR_q:		 equ $00000035
CHR_r:		 equ $00000036
CHR_s:		 equ $00000037
CHR_t:		 equ $00000038
CHR_u:		 equ $00000039
CHR_v:		 equ $0000003A
CHR_w:		 equ $0000003B
CHR_x:		 equ $0000003C
CHR_y:		 equ $0000003D
CHR_z:		 equ $0000003E
CHR_Asterisk:	 equ $0000003F
CHR_FullStop:	 equ $00000040
CHR_Comma:	 equ $00000041
CHR_QuestionMark: equ $00000042
CHR_ExclamationMark: equ $00000043
CHR_Slash:	 equ $00000044
CHR_LessThan:	 equ $00000045
CHR_GreaterThan: equ $00000046
CHR_Colon:	 equ $00000047
CHR_BEGIN_TALK:	 equ $00000047
CHR_Dash:	 equ $00000048
CHR_Apostrophe:	 equ $00000049
CHR_DoubleQuote: equ $0000004A
CHR_Percent:	 equ $0000004B
CHR_Hash:	 equ $0000004C
CHR_Ampersand:	 equ $0000004D
CHR_OpenBracket: equ $0000004E
CHR_CloseBracket: equ $0000004F
CHR_Equals:	 equ $00000050
CHR_NWArrow:	 equ $00000051
CHR_NEArrow:	 equ $00000052
CHR_SEArrow:	 equ $00000053
CHR_SWArrow:	 equ $00000054
CHR_STR_BEGIN:	 equ $00000055			  ; String begin
CHR_MULT:	 equ $00000055
CHR_ARROW_PROMPT: equ $00000056			  ; Down arrow prompt
CHR_57:		 equ $00000057			  ; Newline
CHR_58:		 equ $00000058			  ; Yes/No prompt
CHR_59:		 equ $00000059			  ; Pause
CHR_5A:		 equ $0000005A			  ; Numeric value
CHR_5B:		 equ $0000005B			  ; Character name
CHR_5C:		 equ $0000005C
CHR_5D:		 equ $0000005D
CHR_5E:		 equ $0000005E			  ; String end
CHR_5F:		 equ $0000005F			  ; Item name
CHR_60:		 equ $00000060
CHR_61:		 equ $00000061
CHR_62:		 equ $00000062			  ; Clear display
CHR_63:		 equ $00000063
CHR_64:		 equ $00000064
CHR_65:		 equ $00000065
CHR_66:		 equ $00000066
CHR_67:		 equ $00000067
CHR_68:		 equ $00000068
CHR_HYPHENATION_POINT: equ $00000069
CHR_BREAKING_SPACE: equ	$0000006A
CHR_BREAK_POINT: equ $0000006B
CHR_6C:		 equ $0000006C
CHR_6D:		 equ $0000006D
CHR_6E:		 equ $0000006E
CHR_6F:		 equ $0000006F

; ---------------------------------------------------------------------------

; enum Constants
NUM_CHAR_NAMES:	 equ $0000003D
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
REGION:                             equ     US
ENABLE_REGION_CHECK:                equ     True
FIX_COLLISION_GLITCH:               equ     True
FIX_ARMLET_SKIP:                    equ     True
FIX_EINSTEIN_WHISTLE_FLAG_CHECK:    equ     True
FIX_SPRITE_HIDE_BUG:                equ     True
ENABLE_GOLD_COUNTUP_ON_TREASURE:    equ     True
FIX_POTENTIAL_CORRUPTION_ON_GOLA:   equ     True
FIX_GOLD_CAP_ON_FILE_LOAD:          equ     True
