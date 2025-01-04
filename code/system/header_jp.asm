ConsoleName:	dc.b 'SEGA MEGA DRIVE '
Copyright:	dc.b '(C)SEGA 1992.SEP'
DomesticName:	dc.b 'LAND STALKER                                    '
					; DATA XREF: ROM:0000E78Ar
OverseasName:	dc.b 'LAND STALKER                                    '
SerialNumber:	dc.b 'GM 00005517-00'
Checksum:	dc.w $35A6
IOSupport:	dc.b 'J               '
RomStart:	dc.l 0
RomEnd:		ROM_End
RamStart:	dc.l RAM_Start
RamEnd:		dc.l ExceptAddr+3
SRamFormat:	dc.l $5241F820
SRamStart:	dc.l SRAM_Begin
SRamEnd:	dc.l SRAM_End
Memo:		dc.b '                                                    '
CountrySupport:	dc.b 'J               '
SlowDown:	dc.w 0			; DATA XREF: GameLoop+9Ar
BuildDate:	dc.b '92/09/18 14:30'
DebugModeEnable:dc.w $FFFF		; DATA XREF: HandleDirectionalInput:loc_18D6r
					; ROM:CheckForDebugButtonsr ...
