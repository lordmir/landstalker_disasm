ConsoleName:	dc.b 'SEGA GENESIS    '
Copyright:	dc.b '(C)SEGA 1993.JUL'
DomesticName:	dc.b 'Landstalker                                '
		dc.b '     '
OverseasName:	dc.b 'Landstalker                                '
		dc.b '     '
SerialNumber:	dc.b 'GM MK-1353 -00'
Checksum:	dc.w $F37C
IOSupport:	dc.b 'J               '
RomStart:	dc.l $00000000
RomEnd:		ROM_End
RamStart:	dc.l RAM_Start
RamEnd:		dc.l ExceptAddr+3
SRamFormat:	dc.l $5241F820
SRamStart:	dc.l SRAM_Begin
SRamEnd:	dc.l SRAM_End
Memo:		dc.b '                                           '
		dc.b '         '
CountrySupport:	dc.b 'U               '           ; DATA XREF: AddStatusEffect+22t
SlowDown:	dc.w $0000			  ; DATA XREF: GameLoop+9Ar
BuildDate:	dc.b '93/07/13 20:03'
DebugModeEnable:dc.w $FFFF			  ; DATA XREF: HandleDirectionalInput:loc_18DCr
						  ; ROM:CheckForDebugButtonsr ...
