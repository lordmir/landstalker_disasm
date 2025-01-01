;
; +-------------------------------------------------------------------------+
; |   This file	has been generated by The Interactive Disassembler (IDA)    |
; |	      Copyright	(c) 2015 Hex-Rays, <support@hex-rays.com>	    |
; |			 License info: 48-3057-7374-2C			    |
; |	Zhou Tao, Jiangsu Australia Sinuo Network Technology Co., Ltd.	    |
; +-------------------------------------------------------------------------+
;
; Input	MD5   :	04AE2B65F3A11A7504339E60735BEED8
; Input	CRC32 :	FBBB5B97

; File Name   :	C:\Users\Tom\Documents\hacks\lstalker\landstalker.bin
; Format      :	Binary file
; Base Address:	0000h Range: 0000h - 200000h Loaded length: 200000h

	    org	    $000000

; Processor	  : 68000
; Target assembler: 680x0 Assembler in MRI compatible mode
; This file should be compiled with "as	-M"

; ===========================================================================

; Segment type:	Pure code
; segment "ROM"
ResetSP:	dc.l $00000000			  ; DATA XREF: ROM:loc_4B8o
						  ; ROM:EndGameo ...
ResetPC:	dc.l EntryPoint
BusError:	dc.l HandleGenericError
AddressError:	dc.l HandleAddressError
IllegalInstr:	dc.l HandleIllegalInst
DivBy0:		dc.l HandleDiv0
CHKInstr:	dc.l HandleGenericError
TRAPVInstr:	dc.l HandleGenericError
PrivViolation:	dc.l HandleGenericError
Trace:		dc.l HandleGenericError
LineA:		dc.l HandleGenericError
LineF:		dc.l HandleGenericError
Reserved0:	dc.l HandleGenericError
Reserved1:	dc.l HandleGenericError
Reserved2:	dc.l HandleGenericError
UninitInterrupt:dc.l HandleGenericError
Reserved3:	dc.l HandleGenericError
Reserved4:	dc.l HandleGenericError
Reserved5:	dc.l HandleGenericError
Reserved6:	dc.l HandleGenericError
Reserved7:	dc.l HandleGenericError
Reserved8:	dc.l HandleGenericError
Reserved9:	dc.l HandleGenericError
Reserved10:	dc.l HandleGenericError
SpuriousInt:	dc.l HandleGenericError
IRQ1:		dc.l HandleUnexpectedInterrupt
EXT_Interrupt:	dc.l HandleUnexpectedInterrupt
IRQ3:		dc.l HandleUnexpectedInterrupt
HBlank_Interrupt:dc.l HandleHBlankInterrupt
IRQ5:		dc.l HandleUnexpectedInterrupt
VBlank_Interrupt:dc.l HandleVBlankInterrupt
IRQ7:		dc.l HandleIRQ7
Trap00:		dc.l Trap00Handler		  ; Play sound
Trap01:		dc.l Trap01Handler
Trap02:		dc.l Trap02Handler
Trap03:		dc.l HandleUnexpectedInterrupt
Trap04:		dc.l HandleUnexpectedInterrupt
Trap05:		dc.l HandleUnexpectedInterrupt
Trap06:		dc.l HandleUnexpectedInterrupt
Trap07:		dc.l HandleUnexpectedInterrupt
Trap08:		dc.l HandleUnexpectedInterrupt
Trap09:		dc.l HandleUnexpectedInterrupt
Trap0A:		dc.l HandleUnexpectedInterrupt
Trap0B:		dc.l HandleUnexpectedInterrupt
Trap0C:		dc.l HandleUnexpectedInterrupt
Trap0D:		dc.l HandleUnexpectedInterrupt
Trap0E:		dc.l HandleUnexpectedInterrupt
Trap0F:		dc.l HandleUnexpectedInterrupt
FP_BranchUnorderedCond:dc.l HandleGenericError
FP_InexactResult:dc.l HandleGenericError
FP_Div0:	dc.l HandleGenericError
FP_Underflow:	dc.l HandleGenericError
FP_OperandError:dc.l HandleGenericError
FP_Overflow:	dc.l HandleGenericError
FP_SignalingNAN:dc.l HandleGenericError
FP_UnimplementedType:dc.l HandleGenericError
MMU_ConfigError:dc.l HandleGenericError
MMU_IllegalOperation:dc.l HandleGenericError
MMU_AccessViolation:dc.l HandleGenericError
Reserved11:	dc.l HandleGenericError
Reserved12:	dc.l HandleGenericError
Reserved13:	dc.l HandleGenericError
Reserved14:	dc.l HandleGenericError
Reserved15:	dc.l HandleGenericError