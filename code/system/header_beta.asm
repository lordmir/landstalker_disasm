ConsoleName:		dc.b 'SEGA GENESIS    '
Copyright:			dc.b '(C)SEGA 1993.FEB'
DomesticName:		dc.b 'LAND STALKER                                    '
OverseasName:		dc.b 'LAND STALKER                                    '
SerialNumber:		dc.b 'MK-1353       '
Checksum:			dc.w $FBD3
IOSupport:			dc.b 'J               '
RomStart:			dc.l $00000000
RomEnd:				ROM_End
RamStart:			dc.l RAM_Start
RamEnd:				dc.l ExceptAddr+3
SRamFormat:			dc.l $5241F820
SRamStart:			dc.l SRAM_Begin
SRamEnd:			dc.l SRAM_End
Memo:				dc.b '                                                    '
CountrySupport:		dc.b 'J               '
SlowDown:			dc.w $0000
BuildDate:			dc.b '93/02/24 11:55'
DebugModeEnable:	dc.w $FFFF
