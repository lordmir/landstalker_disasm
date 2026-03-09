
; ---------------------------------------------------------------------------

; enum CHR
CHR_Space:	 equ $00
CHR_0:		 equ $01
CHR_1:		 equ $02
CHR_2:		 equ $03
CHR_3:		 equ $04
CHR_4:		 equ $05
CHR_5:		 equ $06
CHR_6:		 equ $07
CHR_7:		 equ $08
CHR_8:		 equ $09
CHR_9:		 equ $0A
CHR_A:		 equ $0B
CHR_B:		 equ $0C
CHR_C:		 equ $0D
CHR_D:		 equ $0E
CHR_E:		 equ $0F
CHR_F:		 equ $10
CHR_G:		 equ $11
CHR_H:		 equ $12
CHR_I:		 equ $13
CHR_J:		 equ $14
CHR_K:		 equ $15
CHR_L:		 equ $16
CHR_M:		 equ $17
CHR_N:		 equ $18
CHR_O:		 equ $19
CHR_P:		 equ $1A
CHR_Q:		 equ $1B
CHR_R:		 equ $1C
CHR_S:		 equ $1D
CHR_T:		 equ $1E
CHR_U:		 equ $1F
CHR_V:		 equ $20
CHR_W:		 equ $21
CHR_X:		 equ $22
CHR_Y:		 equ $23
CHR_Z:		 equ $24
CHR_a:		 equ $25
CHR_b:		 equ $26
CHR_c:		 equ $27
CHR_d:		 equ $28
CHR_e:		 equ $29
CHR_f:		 equ $2A
CHR_g:		 equ $2B
CHR_h:		 equ $2C
CHR_i:		 equ $2D
CHR_j:		 equ $2E
CHR_k:		 equ $2F
CHR_l:		 equ $30
CHR_m:		 equ $31
CHR_n:		 equ $32
CHR_o:		 equ $33
CHR_p:		 equ $34
CHR_q:		 equ $35
CHR_r:		 equ $36
CHR_s:		 equ $37
CHR_t:		 equ $38
CHR_u:		 equ $39
CHR_v:		 equ $3A
CHR_w:		 equ $3B
CHR_x:		 equ $3C
CHR_y:		 equ $3D
CHR_z:		 equ $3E
CHR_Asterisk:	 equ $3F
CHR_FullStop:	 equ $40
CHR_Comma:	 equ $41
CHR_QuestionMark: equ $42
CHR_ExclamationMark: equ $43
CHR_Slash:	 equ $44
CHR_LessThan:	 equ $45
CHR_GreaterThan: equ $46
CHR_Colon:	 equ $47
CHR_BEGIN_TALK:	 equ $47
CHR_Dash:	     equ $48
CHR_Apostrophe:	 equ $49
CHR_DoubleQuote: equ $4A
CHR_Percent:	 equ $4B
CHR_MULT:	     equ $4B
CHR_Hash:	     equ $4C
CHR_Ampersand:	 equ $4D
CHR_OpenBracket: equ $4E
CHR_CloseBracket: equ $4F
CHR_Equals:	 equ $50
CHR_NWArrow:	 equ $51
CHR_NEArrow:	 equ $52
CHR_SEArrow:	 equ $53
CHR_SWArrow:	 equ $54
CHR_e_Acute:     equ $55
CHR_a_Grave:     equ $56
CHR_e_Grave:     equ $57
CHR_57:		 equ $57			  ; Newline
CHR_u_Grave: equ $58
CHR_58:		 equ $58			  ; Yes/No prompt
CHR_a_Circumflex:   equ $59
CHR_59:		 equ $59			  ; Pause
CHR_e_Circumflex:   equ $5A
CHR_5A:		 equ $5A			  ; Numeric value
CHR_i_Circumflex:   equ $5B
CHR_5B:		 equ $5B			  ; Character name
CHR_o_Circumflex:   equ $5C
CHR_5C:		 equ $5C
CHR_u_Circumflex:   equ $5D
CHR_5D:		 equ $5D
CHR_c_Cedilla:  equ $5E
CHR_5E:		 equ $5E			  ; String end
CHR_e_Umlaut:   equ $5F
CHR_5F:		 equ $5F			  ; Item name
CHR_i_Umlaut:   equ $60
CHR_60:		 equ $60
CHR_u_Umlaut:   equ $61
CHR_61:		 equ $61
CHR_Semicolon:  equ $62
CHR_62:		 equ $62			  ; Clear display
CHR_Backtick:   equ $63
CHR_63:		 equ $63
CHR_64:		 equ $64
CHR_STR_BEGIN:	 equ $64			  ; String begin
CHR_65:		 equ $65
CHR_ARROW_PROMPT: equ $65			  ; Down arrow prompt
CHR_66:		 equ $66
CHR_67:		 equ $67
CHR_68:		 equ $68
CHR_69:      equ $69
CHR_6A:      equ $6A
CHR_6B:      equ $6B
CHR_6C:		 equ $6C
CHR_6D:		 equ $6D
CHR_6E:		 equ $6E
CHR_6F:		 equ $6F
CHR_HYPHENATION_POINT: equ $78
CHR_BREAKING_SPACE: equ	$79
CHR_BREAK_POINT: equ $7A

; ---------------------------------------------------------------------------

; enum Constants
NUM_CHAR_NAMES:	 equ $3D
SCRIPT_STRINGS_BEGIN: equ $4E

False:                  equ     0
True:                   equ     1

US:                     equ     0
JP:                     equ     1
UK:                     equ     2
FR:                     equ     3
DE:                     equ     4
US_BETA:                equ     5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
