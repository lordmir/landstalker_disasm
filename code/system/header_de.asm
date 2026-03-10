ConsoleName:	dc.b 'SEGA MEGA DRIVE '
Copyright:	dc.b '(C)SEGA 1993.NOV'
DomesticName:	dc.b 'Landstalker                                     '
OverseasName:	dc.b 'Landstalker                                     '
SerialNumber:	dc.b 'GM MK-1353 -00'
Checksum:	dc.w $C867
IOSupport:	dc.b 'J               '
RomStart:	dc.l $00000000
RomEnd:		ROM_End
RamStart:	dc.l RAM_Start
RamEnd:		dc.l ExceptAddr+3
SRamFormat:	dc.l $5241F820
SRamStart:	dc.l SRAM_Begin
SRamEnd:	dc.l SRAM_End
Memo:		dc.b '                                                    '
CountrySupport:	dc.b 'E               '
SlowDown:	dc.w $0000		; DATA XREF: GameLoop+9Ar
BuildDate:	dc.b '93/11/05 13:58'
DebugModeEnable:dc.w $FFFF		; DATA XREF: HandleDirectionalInput:loc_18DCr
					; ROM:CheckForDebugButtonsr ...
