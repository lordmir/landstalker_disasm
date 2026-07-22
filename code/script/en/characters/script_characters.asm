;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                        Character Script Functions                        ;;
;;             code/script/en/characters/script_characters.asm              ;;
;;                                                                          ;;
;;              Generated using the Landstalker Editor v0.3.4:              ;;
;;              https://github.com/lordmir/landstalker_editor               ;;
;;                For use with the Landstalker disassembly:                 ;;
;;              https://github.com/lordmir/landstalker_disasm               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


CS_0143:             bsr.w    HandleYesNoPrompt
                     ScriptID $0102,$0000
                     ScriptID $0104,$0001
                     ScriptJump ClearTextbox,$0002
                     rts     
CS_0000:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $00
                     ScriptID $010E,$0001
                     dc.b     $00, $01
                     ScriptID $010F,$0003
                     dc.b     $00, $02
                     ScriptID $0110,$0005
                     dc.b     $00, $04
                     ScriptID $0111,$0007
                     dc.b     $00, $05
                     ScriptID $0118,$0009
                     dc.w     $FFFF
CS_0001:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $00
                     ScriptID $0119,$0001
                     dc.b     $00, $01
                     ScriptID $011A,$0003
                     dc.b     $00, $02
                     ScriptID $011B,$0005
                     dc.b     $00, $04
                     ScriptID $011C,$0007
                     dc.w     $FFFF
CS_007B:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $00
                     ScriptID $011E,$0001
                     dc.b     $00, $02
                     ScriptID $011F,$0003
                     dc.b     $00, $03
                     ScriptID $0120,$0005
                     dc.b     $00, $04
                     ScriptID $0122,$0007
                     dc.w     $FFFF
CS_007C:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $00
                     ScriptID $0123,$0001
                     dc.b     $00, $02
                     ScriptID $0124,$0003
                     dc.b     $00, $04
                     ScriptID $0126,$0005
                     dc.w     $FFFF
CS_0002:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $00
                     ScriptJump CS_0002_1,$0001
                     dc.b     $00, $02
                     ScriptID $012D,$0003
                     dc.b     $00, $03
                     ScriptID $012E,$0005
                     dc.b     $00, $04
                     ScriptID $012F,$0007
                     dc.w     $FFFF
CS_0002_1:           bsr.w    HandleYesNoPrompt
                     ScriptID $0128,$0000
                     ScriptID $0129,$0001
                     ScriptID $012A,$0002
                     rts     
CS_007D:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $00
                     ScriptID $0130,$0001
                     dc.b     $00, $02
                     ScriptID $0136,$0003
                     dc.b     $00, $03
                     ScriptID $0137,$0005
                     dc.b     $00, $04
                     ScriptID $0138,$0007
                     dc.b     $00, $14
                     ScriptID $013B,$0009
                     dc.w     $FFFF
CS_007E:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $00
                     ScriptID $0140,$0001
                     dc.b     $00, $02
                     ScriptID $0142,$0003
                     dc.b     $00, $04
                     ScriptID $0143,$0005
                     dc.w     $FFFF
CS_007F:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $00
                     ScriptID $0144,$0001
                     dc.b     $00, $01
                     ScriptID $0147,$0003
                     dc.b     $00, $04
                     ScriptID $0148,$0005
                     dc.w     $FFFF
CS_0080:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $00
                     ScriptID $0149,$0001
                     dc.b     $00, $01
                     ScriptID $014B,$0003
                     dc.b     $00, $02
                     ScriptID $014C,$0005
                     dc.b     $00, $04
                     ScriptID $014D,$0007
                     dc.w     $FFFF
CS_0003:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $00
                     ScriptJump CS_0003_1,$0001
                     dc.b     $00, $03
                     ScriptJump CS_0003_2,$0003
                     dc.b     $00, $04
                     ScriptID $015B,$0005
                     dc.b     $00, $07
                     ScriptJump CS_0003_3,$0007
                     dc.b     $00, $1B
                     ScriptID $0160,$0009
                     dc.b     $00, $1D
                     ScriptID $0161,$000B
                     dc.w     $FFFF
CS_0003_1:           bsr.w    HandleYesNoPrompt
                     ScriptID $014E,$0000
                     ScriptID $0151,$0001
                     ScriptID $0152,$0002
                     rts     
CS_0003_2:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00C1
                     ScriptID $0153,$0001
                     ScriptID $0159,$0002
                     rts     
CS_0003_3:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00DA
                     ScriptID $015C,$0001
                     ScriptID $015E,$0002
                     rts     
CS_0081:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $00
                     ScriptID $0165,$0001
                     dc.b     $00, $02
                     ScriptID $0166,$0003
                     dc.b     $00, $04
                     ScriptID $0167,$0005
                     dc.w     $FFFF
CS_0082:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $00
                     ScriptJump CS_0082_1,$0001
                     dc.b     $00, $02
                     ScriptID $016A,$0003
                     dc.b     $00, $04
                     ScriptID $016B,$0005
                     dc.b     $00, $05
                     ScriptID $016C,$0007
                     dc.w     $FFFF
CS_0082_1:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00C0
                     ScriptID $0168,$0001
                     ScriptID $0169,$0002
                     rts     
CS_0083:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $00
                     ScriptID $016D,$0001
                     dc.b     $00, $02
                     ScriptID $0170,$0003
                     dc.b     $00, $04
                     ScriptID $016D,$0005
                     dc.w     $FFFF
CS_0084:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $00
                     ScriptID $0171,$0001
                     dc.b     $00, $02
                     ScriptID $0172,$0003
                     dc.b     $00, $04
                     ScriptID $0173,$0005
                     dc.w     $FFFF
CS_0085:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $00
                     ScriptJump CS_0085_1,$0001
                     dc.b     $00, $02
                     ScriptID $0179,$0003
                     dc.b     $00, $04
                     ScriptID $017B,$0005
                     dc.w     $FFFF
CS_0085_1:           bsr.w    HandleYesNoPrompt
                     ScriptID $0174,$0000
                     ScriptID $0176,$0001
                     ScriptID $0177,$0002
                     rts     
CS_0004:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $00
                     ScriptID $017C,$0001
                     dc.b     $02, $01
                     ScriptID $017D,$0003
                     dc.b     $02, $03
                     ScriptJump CS_0004_1,$0005
                     dc.w     $FFFF
CS_0004_1:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00E2
                     ScriptID $0184,$0001
                     ScriptID $0185,$0002
                     rts     
CS_0086:             trap     #$01
                     ScriptID $0188,$0000
                     rts     
CS_0087:             trap     #$01
                     ScriptID $0189,$0000
                     rts     
CS_0005:             trap     #$01
                     ScriptID $018A,$0000
                     rts     
CS_0006:             trap     #$01
                     ScriptID $018B,$0000
                     rts     
CS_0088:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $00
                     ScriptID $018D,$0001
                     dc.b     $00, $02
                     ScriptID $018E,$0003
                     dc.b     $00, $04
                     ScriptID $018F,$0005
                     dc.w     $FFFF
CS_0007:             trap     #$01
                     ScriptID $0190,$0000
                     rts     
CS_0089:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $01
                     ScriptID $0193,$0001
                     dc.b     $00, $04
                     ScriptID $0194,$0003
                     dc.w     $FFFF
CS_0008:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $01
                     ScriptID $0195,$0001
                     dc.b     $00, $02
                     ScriptJump CS_0008_1,$0003
                     dc.b     $00, $03
                     ScriptID $0198,$0005
                     dc.b     $00, $04
                     ScriptID $019B,$0007
                     dc.b     $00, $08
                     ScriptID $019E,$0009
                     dc.b     $00, $09
                     ScriptID $01A1,$000B
                     dc.b     $00, $14
                     ScriptID $01A2,$000D
                     dc.b     $00, $17
                     ScriptID $01A4,$000F
                     dc.b     $00, $18
                     ScriptID $01A6,$0011
                     dc.b     $00, $1A
                     ScriptID $01AA,$0013
                     dc.w     $FFFF
CS_0008_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $0012
                     ScriptID $0198,$0001
                     ScriptID $0197,$0002
                     rts     
CS_008B:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $02
                     ScriptID $01AE,$0001
                     dc.b     $00, $04
                     ScriptID $01AF,$0003
                     dc.w     $FFFF
CS_008C:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $02
                     ScriptID $01B0,$0001
                     dc.b     $00, $04
                     ScriptID $01B1,$0003
                     dc.w     $FFFF
CS_008D:             trap     #$01
                     ScriptID $01B2,$0000
                     rts     
CS_0009:             bsr.w    SetFlagBitOnTalking
                     dc.w     $00C2
                     ScriptID $01B4,$0001
                     ScriptID $01B6,$0002
                     rts     
CS_000A:             trap     #$01
                     ScriptID $01B7,$0000
                     rts     
CS_008E:             trap     #$01
                     ScriptID $01B8,$0000
                     rts     
CS_008F:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $03
                     ScriptID $01B9,$0001
                     dc.b     $00, $04
                     ScriptID $01BA,$0003
                     dc.w     $FFFF
CS_0090:             trap     #$01
                     ScriptID $01BB,$0000
                     rts     
CS_0091:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $03
                     ScriptID $01BC,$0001
                     dc.b     $00, $04
                     ScriptID $01BD,$0003
                     dc.w     $FFFF
CS_0092:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $04
                     ScriptID $01BE,$0001
                     dc.b     $00, $05
                     ScriptID $01BF,$0003
                     dc.w     $FFFF
CS_0093:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $04
                     ScriptID $01C0,$0001
                     dc.b     $00, $05
                     ScriptJump CS_0093_1,$0003
                     dc.w     $FFFF
CS_0093_1:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00C3
                     ScriptID $01C2,$0001
                     ScriptID $01C3,$0002
                     rts     
CS_0094:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $02
                     ScriptID $01C4,$0001
                     dc.b     $00, $19
                     ScriptID $01C5,$0003
                     dc.w     $FFFF
CS_0095:             trap     #$01
                     ScriptID $01C6,$0000
                     rts     
CS_000B:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $03
                     ScriptID $01C7,$0001
                     dc.b     $00, $04
                     ScriptID $01C8,$0003
                     dc.w     $FFFF
CS_000C:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $03
                     ScriptID $01CA,$0001
                     dc.b     $00, $04
                     ScriptID $01CB,$0003
                     dc.w     $FFFF
CS_0096:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $04
                     ScriptID $01CC,$0001
                     dc.b     $00, $05
                     ScriptJump CS_0096_1,$0003
                     dc.w     $FFFF
CS_0096_1:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00C3
                     ScriptID $01CE,$0001
                     ScriptID $01CF,$0002
                     rts     
CS_0097:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $01D0,$0001
                     dc.b     $00, $06
                     ScriptID $01D1,$0003
                     dc.b     $00, $08
                     ScriptID $01D2,$0005
                     dc.b     $00, $0A
                     ScriptID $01D3,$0007
                     dc.b     $00, $18
                     ScriptID $01D4,$0009
                     dc.b     $00, $1A
                     ScriptID $01D0,$000B
                     dc.w     $FFFF
CS_0098:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $01D5,$0001
                     dc.b     $00, $06
                     ScriptID $01D6,$0003
                     dc.b     $00, $08
                     ScriptID $01D7,$0005
                     dc.b     $00, $18
                     ScriptID $01D8,$0007
                     dc.b     $00, $1A
                     ScriptID $01D7,$0009
                     dc.w     $FFFF
CS_0099:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $01DA,$0001
                     dc.b     $00, $08
                     ScriptID $01DC,$0003
                     dc.b     $00, $18
                     ScriptID $01DD,$0005
                     dc.w     $FFFF
CS_009A:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $01DE,$0001
                     dc.b     $00, $08
                     ScriptID $01E0,$0003
                     dc.w     $FFFF
CS_000D:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $01E1,$0001
                     dc.b     $00, $06
                     ScriptID $01E2,$0003
                     dc.b     $00, $08
                     ScriptID $01E4,$0005
                     dc.b     $00, $18
                     ScriptID $01E5,$0007
                     dc.b     $00, $1A
                     ScriptID $01E4,$0009
                     dc.w     $FFFF
CS_009B:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $01E7,$0001
                     dc.b     $00, $06
                     ScriptID $01E8,$0003
                     dc.b     $00, $08
                     ScriptID $01E9,$0005
                     dc.w     $FFFF
CS_009C:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $01EA,$0001
                     dc.b     $00, $06
                     ScriptID $01EB,$0003
                     dc.b     $00, $08
                     ScriptID $01EC,$0005
                     dc.b     $00, $18
                     ScriptID $01ED,$0007
                     dc.w     $FFFF
CS_009D:             trap     #$01
                     ScriptID $01F0,$0000
                     rts     
CS_000E:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $01F1,$0001
                     dc.b     $00, $06
                     ScriptID $01F2,$0003
                     dc.b     $00, $08
                     ScriptID $01F3,$0005
                     dc.b     $00, $18
                     ScriptID $01F4,$0007
                     dc.w     $FFFF
CS_009E:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $01F5,$0001
                     dc.b     $00, $06
                     ScriptID $01F6,$0003
                     dc.b     $00, $08
                     ScriptID $01F7,$0005
                     dc.b     $00, $18
                     ScriptID $01F8,$0007
                     dc.b     $00, $1A
                     ScriptID $01F9,$0009
                     dc.w     $FFFF
CS_009F:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $01FA,$0001
                     dc.b     $00, $06
                     ScriptID $01FC,$0003
                     dc.b     $00, $08
                     ScriptID $01FD,$0005
                     dc.b     $00, $18
                     ScriptID $01FE,$0007
                     dc.b     $00, $1A
                     ScriptID $0200,$0009
                     dc.w     $FFFF
CS_000F:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $08
                     ScriptID $0202,$0001
                     dc.b     $00, $18
                     ScriptID $0205,$0003
                     dc.w     $FFFF
CS_00A0:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $0208,$0001
                     dc.b     $00, $06
                     ScriptID $0209,$0003
                     dc.b     $00, $08
                     ScriptID $020A,$0005
                     dc.b     $00, $18
                     ScriptID $020B,$0007
                     dc.w     $FFFF
CS_00A1:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $020D,$0001
                     dc.b     $00, $06
                     ScriptID $020E,$0003
                     dc.b     $00, $08
                     ScriptID $020F,$0005
                     dc.b     $00, $18
                     ScriptID $0210,$0007
                     dc.b     $00, $1A
                     ScriptID $0213,$0009
                     dc.w     $FFFF
CS_00A2:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $08
                     ScriptJump CS_00A2_1,$0001
                     dc.b     $00, $18
                     ScriptID $0218,$0003
                     dc.b     $00, $1A
                     ScriptID $08BD,$0005
                     dc.w     $FFFF
CS_00A2_1:           bsr.w    HandleYesNoPrompt
                     ScriptID $0214,$0000
                     ScriptID $0216,$0001
                     ScriptID $0217,$0002
                     rts     
CS_0010:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $021B,$0001
                     dc.b     $00, $06
                     ScriptID $021F,$0003
                     dc.b     $00, $18
                     ScriptID $0220,$0005
                     dc.b     $00, $1A
                     ScriptID $0221,$0007
                     dc.b     $00, $1D
                     ScriptID $0222,$0009
                     dc.w     $FFFF
CS_00A3:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $0223,$0001
                     dc.b     $00, $08
                     ScriptID $0225,$0003
                     dc.b     $00, $18
                     ScriptID $0227,$0005
                     dc.w     $FFFF
CS_00A4:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $0229,$0001
                     dc.b     $00, $06
                     ScriptID $022A,$0003
                     dc.b     $00, $08
                     ScriptID $022C,$0005
                     dc.b     $00, $18
                     ScriptID $022D,$0007
                     dc.b     $00, $1A
                     ScriptID $022C,$0009
                     dc.w     $FFFF
CS_00A5:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $0230,$0001
                     dc.b     $00, $06
                     ScriptID $0231,$0003
                     dc.b     $00, $08
                     ScriptID $0232,$0005
                     dc.b     $00, $0A
                     ScriptID $0233,$0007
                     dc.b     $00, $18
                     ScriptID $0234,$0009
                     dc.b     $00, $1A
                     ScriptID $0233,$000B
                     dc.w     $FFFF
CS_00A6:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $0237,$0001
                     dc.b     $00, $06
                     ScriptJump CS_00A6_1,$0003
                     dc.b     $00, $07
                     ScriptID $023C,$0005
                     dc.b     $00, $08
                     ScriptID $0240,$0007
                     dc.b     $00, $18
                     ScriptID $0241,$0009
                     dc.b     $00, $1A
                     ScriptID $0240,$000B
                     dc.w     $FFFF
CS_00A6_1:           bsr.w    HandleYesNoPrompt
                     ScriptID $0238,$0000
                     ScriptID $023A,$0001
                     ScriptJump CS_00A6_2,$0002
                     rts     
CS_00A6_2:           bsr.w    HandleYesNoPrompt
                     ScriptID $023D,$0000
                     ScriptID $023B,$0001
                     ScriptID $023F,$0002
                     rts     
CS_00A7:             trap     #$01
                     ScriptID $0245,$0000
                     rts     
CS_00A8:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $0246,$0001
                     dc.b     $00, $06
                     ScriptID $0247,$0003
                     dc.b     $00, $08
                     ScriptID $0248,$0005
                     dc.b     $00, $18
                     ScriptID $0249,$0007
                     dc.w     $FFFF
CS_00A9:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $024A,$0001
                     dc.b     $00, $19
                     ScriptID $024B,$0003
                     dc.w     $FFFF
CS_0011:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $08
                     ScriptID $024C,$0001
                     dc.b     $00, $09
                     ScriptID $024D,$0003
                     dc.b     $00, $18
                     ScriptID $024F,$0005
                     dc.w     $FFFF
CS_008A:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $0250,$0001
                     dc.b     $00, $06
                     ScriptID $0251,$0003
                     dc.b     $00, $08
                     ScriptID $0252,$0005
                     dc.w     $FFFF
CS_00AA:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $0253,$0001
                     dc.b     $00, $09
                     ScriptID $0255,$0003
                     dc.b     $00, $17
                     ScriptID $0256,$0005
                     dc.w     $FFFF
CS_00AB:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $0257,$0001
                     dc.b     $00, $09
                     ScriptID $0259,$0003
                     dc.b     $00, $17
                     ScriptID $025A,$0005
                     dc.w     $FFFF
CS_0012:             trap     #$01
                     ScriptID $025B,$0000
                     rts     
CS_00AC:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $025C,$0001
                     dc.b     $00, $0E
                     ScriptID $025D,$0003
                     dc.b     $00, $14
                     ScriptID $025E,$0005
                     dc.w     $FFFF
CS_00AD:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $025F,$0001
                     dc.b     $00, $0E
                     ScriptID $0260,$0003
                     dc.b     $00, $0F
                     ScriptID $0261,$0005
                     dc.b     $00, $18
                     ScriptID $0262,$0007
                     dc.b     $00, $1A
                     ScriptID $0265,$0009
                     dc.b     $00, $1B
                     ScriptID $0266,$000B
                     dc.b     $00, $1D
                     ScriptID $0267,$000D
                     dc.w     $FFFF
CS_00AE:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0268,$0001
                     dc.b     $00, $0E
                     ScriptID $0269,$0003
                     dc.b     $00, $14
                     ScriptID $026A,$0005
                     dc.w     $FFFF
CS_0013:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $026B,$0001
                     dc.b     $00, $0D
                     ScriptID $026C,$0003
                     dc.b     $00, $0E
                     ScriptID $026D,$0005
                     dc.b     $00, $0F
                     ScriptID $026E,$0007
                     dc.b     $00, $14
                     ScriptID $026F,$0009
                     dc.b     $00, $18
                     ScriptJump CS_0013_1,$000B
                     dc.b     $00, $1A
                     ScriptID $0276,$000D
                     dc.w     $FFFF
CS_0013_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $0132
                     ScriptID $0274,$0001
                     ScriptID $0270,$0002
                     rts     
CS_00AF:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0278,$0001
                     dc.b     $00, $0F
                     ScriptID $0279,$0003
                     dc.w     $FFFF
CS_00B0:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $027A,$0001
                     dc.b     $00, $0F
                     ScriptID $027B,$0003
                     dc.w     $FFFF
CS_00B1:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $027C,$0001
                     dc.b     $00, $1A
                     ScriptID $027D,$0003
                     dc.b     $00, $1D
                     ScriptID $027E,$0005
                     dc.w     $FFFF
CS_00B2:             trap     #$01
                     ScriptID $0280,$0000
                     rts     
CS_00B3:             trap     #$01
                     ScriptID $0282,$0000
                     rts     
CS_00B4:             trap     #$01
                     ScriptID $0284,$0000
                     rts     
CS_00B5:             trap     #$01
                     ScriptID $0286,$0000
                     rts     
CS_00B6:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0288,$0001
                     dc.b     $00, $18
                     ScriptID $028A,$0003
                     dc.b     $00, $1D
                     ScriptID $028B,$0005
                     dc.w     $FFFF
CS_00B7:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $028C,$0001
                     dc.b     $00, $17
                     ScriptID $028F,$0003
                     dc.b     $00, $18
                     ScriptID $0290,$0005
                     dc.b     $00, $1D
                     ScriptID $0291,$0007
                     dc.w     $FFFF
CS_00B8:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0292,$0001
                     dc.b     $00, $14
                     ScriptID $0294,$0003
                     dc.w     $FFFF
CS_00B9:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0295,$0001
                     dc.b     $00, $14
                     ScriptID $0297,$0003
                     dc.b     $00, $18
                     ScriptID $0298,$0005
                     dc.b     $00, $1A
                     ScriptID $029B,$0007
                     dc.w     $FFFF
CS_0014:             trap     #$01
                     ScriptID $029C,$0000
                     rts     
CS_00BA:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $029D,$0001
                     dc.b     $00, $14
                     ScriptID $029E,$0003
                     dc.w     $FFFF
CS_00BB:             trap     #$01
                     ScriptID $02A0,$0000
                     rts     
CS_00BC:             trap     #$01
                     ScriptID $02A1,$0000
                     rts     
CS_0015:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $02A2,$0001
                     dc.b     $00, $0C
                     ScriptID $02A3,$0003
                     dc.b     $00, $0E
                     ScriptJump CS_0015_1,$0005
                     dc.b     $00, $0F
                     ScriptID $02A6,$0007
                     dc.w     $FFFF
CS_0015_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $001A
                     ScriptID $02A5,$0001
                     ScriptID $02A4,$0002
                     rts     
CS_0016:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptJump CS_0016_1,$0001
                     dc.b     $00, $0C
                     ScriptJump CS_0016_2,$0003
                     dc.b     $00, $0E
                     ScriptID $02AB,$0005
                     dc.b     $00, $0F
                     ScriptID $02AC,$0007
                     dc.w     $FFFF
CS_0016_1:           trap     #$01
                     ScriptID $02A7,$0000
                     move.w   #$000000C8,d0
CS_0016_3:           bsr.w    TestFlagBit
                     beq.s    CS_0016_4
                     move.w   #$0000002C,d0
                     bsr.w    SetFlagBit
CS_0016_4:           rts     
CS_0016_2:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $001E
                     ScriptID $02AC,$0001
                     ScriptID $02AA,$0002
                     rts     
CS_0017:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $02AD,$0001
                     dc.b     $00, $0C
                     ScriptID $02AE,$0003
                     dc.b     $00, $0E
                     ScriptID $02B1,$0005
                     dc.b     $00, $0F
                     ScriptID $02B2,$0007
                     dc.w     $FFFF
CS_00BD:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $02B4,$0001
                     dc.b     $00, $18
                     ScriptID $02B6,$0003
                     dc.b     $00, $1A
                     ScriptID $02B8,$0005
                     dc.b     $00, $1B
                     ScriptID $02B9,$0007
                     dc.b     $00, $1D
                     ScriptID $02BA,$0009
                     dc.w     $FFFF
CS_00BE:             trap     #$01
                     ScriptID $02BB,$0000
                     rts     
CS_00BF:             trap     #$01
                     ScriptID $02BC,$0000
                     rts     
CS_00C0:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptJump CS_00C0_1,$0001
                     dc.b     $01, $01
                     ScriptJump CS_00C0_2,$0003
                     dc.b     $01, $02
                     ScriptID $02D7,$0005
                     dc.b     $00, $1A
                     ScriptJump CS_00C0_8,$0007
                     dc.b     $01, $03
                     ScriptJump CS_00C0_7,$0009
                     dc.w     $FFFF
CS_00C0_1:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00C7
                     ScriptID $02BE,$0001
                     ScriptID $02C3,$0002
                     rts     
CS_00C0_2:           trap     #$01
                     ScriptID $02C4,$0000
                     bsr.w    GetYesNoAnswer
                     bcs.s    CS_00C0_3
                     trap     #$01
                     ScriptID $02C7,$0000
                     bra.s    CS_00C0_9
CS_00C0_3:           trap     #$01
                     ScriptID $02C8,$0000
                     bsr.w    GetYesNoAnswer
                     bcc.s    CS_00C0_4
                     trap     #$01
                     ScriptID $02CD,$0000
                     bra.s    CS_00C0_6
CS_00C0_4:           trap     #$01
                     ScriptID $02C9,$0000
                     bsr.w    GetYesNoAnswer
                     bcc.s    CS_00C0_5
                     trap     #$01
                     ScriptID $02CF,$0000
                     bra.s    CS_00C0_6
CS_00C0_5:           trap     #$01
                     ScriptID $02CA,$0000
                     bra.s    CS_00C0_3
CS_00C0_6:           trap     #$01
                     ScriptID $02D0,$0000
CS_00C0_9:           rts     
CS_00C0_7:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00DD
                     ScriptID $02D8,$0001
                     ScriptID $02DD,$0002
                     rts     
CS_00C0_8:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $0152
                     ScriptID $02DE,$0001
                     ScriptJump CS_00C0_1,$0002
                     rts     
CS_00C1:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $02E0,$0001
                     dc.b     $01, $01
                     ScriptID $02E1,$0003
                     dc.b     $01, $02
                     ScriptJump CS_00C1_1,$0005
                     dc.b     $00, $1A
                     ScriptJump CS_00C1_2,$0007
                     dc.b     $01, $03
                     ScriptID $02E4,$0009
                     dc.w     $FFFF
CS_00C1_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $0153
                     ScriptID $02E2,$0001
                     ScriptID $02E3,$0002
                     rts     
CS_00C1_2:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $0152
                     ScriptID $02E4,$0001
                     ScriptID $02E0,$0002
                     rts     
CS_0018:             bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $00E4
                     ScriptID $0659,$0001
                     ScriptID $02E5,$0002
                     rts     
CS_00C2:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $02E7,$0001
                     dc.b     $00, $14
                     ScriptID $02E9,$0003
                     dc.b     $00, $17
                     ScriptID $02EB,$0005
                     dc.b     $00, $18
                     ScriptID $02EE,$0007
                     dc.b     $00, $1A
                     ScriptID $02F0,$0009
                     dc.b     $00, $1B
                     ScriptID $02F1,$000B
                     dc.b     $00, $1D
                     ScriptID $02F2,$000D
                     dc.w     $FFFF
CS_00C3:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $02F3,$0001
                     dc.b     $00, $14
                     ScriptID $02F4,$0003
                     dc.b     $00, $17
                     ScriptID $02F5,$0005
                     dc.b     $00, $18
                     ScriptID $02F6,$0007
                     dc.b     $00, $1A
                     ScriptID $02F8,$0009
                     dc.b     $00, $1D
                     ScriptID $02F9,$000B
                     dc.w     $FFFF
CS_00C4:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $02FA,$0001
                     dc.b     $00, $14
                     ScriptID $02FC,$0003
                     dc.b     $00, $17
                     ScriptID $02FD,$0005
                     dc.b     $00, $18
                     ScriptID $02FE,$0007
                     dc.b     $00, $1A
                     ScriptID $0300,$0009
                     dc.b     $00, $1B
                     ScriptID $0303,$000B
                     dc.b     $00, $1D
                     ScriptID $0304,$000D
                     dc.w     $FFFF
CS_0019:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0305,$0001
                     dc.b     $00, $14
                     ScriptID $0307,$0003
                     dc.b     $00, $17
                     ScriptID $0309,$0005
                     dc.b     $00, $18
                     ScriptID $030A,$0007
                     dc.b     $00, $1D
                     ScriptJump CS_0019_1,$0009
                     dc.w     $FFFF
CS_0019_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $014A
                     ScriptID $09F5,$0001
                     ScriptID $030C,$0002
                     rts     
CS_001A:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptJump CS_001A_1,$0001
                     dc.b     $00, $14
                     ScriptID $0315,$0003
                     dc.w     $FFFF
CS_001A_1:           trap     #$01
                     ScriptID $030E,$0000
CS_001A_2:           bsr.w    GetYesNoAnswer
                     bcc.s    CS_001A_3
                     trap     #$01
                     ScriptID $0310,$0000
                     bra.s    CS_001A_4
CS_001A_3:           trap     #$01
                     ScriptID $0314,$0000
                     bra.s    CS_001A_2
CS_001A_4:           rts     
CS_00C5:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0318,$0001
                     dc.b     $00, $14
                     ScriptID $0319,$0003
                     dc.b     $00, $18
                     ScriptID $031B,$0005
                     dc.b     $00, $1D
                     ScriptID $031E,$0007
                     dc.w     $FFFF
CS_00C6:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $031F,$0001
                     dc.b     $00, $14
                     ScriptID $0320,$0003
                     dc.b     $00, $1D
                     ScriptID $0322,$0005
                     dc.w     $FFFF
CS_00C7:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0323,$0001
                     dc.b     $00, $17
                     ScriptID $0325,$0003
                     dc.b     $00, $18
                     ScriptID $0326,$0005
                     dc.b     $00, $1D
                     ScriptID $0328,$0007
                     dc.w     $FFFF
CS_00C8:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0329,$0001
                     dc.b     $00, $14
                     ScriptID $032A,$0003
                     dc.b     $00, $1D
                     ScriptJump CS_00C8_1,$0005
                     dc.w     $FFFF
CS_00C8_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $014A
                     ScriptID $09F3,$0001
                     ScriptID $032B,$0002
                     rts     
CS_00C9:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptJump CS_00C9_1,$0001
                     dc.b     $00, $14
                     ScriptID $032E,$0003
                     dc.w     $FFFF
CS_00C9_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $0028
                     ScriptID $032D,$0001
                     ScriptID $032C,$0002
                     rts     
CS_00CA:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $032F,$0001
                     dc.b     $00, $14
                     ScriptID $0332,$0003
                     dc.b     $00, $17
                     ScriptID $0334,$0005
                     dc.b     $00, $18
                     ScriptID $0335,$0007
                     dc.w     $FFFF
CS_00CB:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0337,$0001
                     dc.b     $00, $14
                     ScriptID $0339,$0003
                     dc.b     $00, $17
                     ScriptID $033B,$0005
                     dc.b     $00, $18
                     ScriptID $033C,$0007
                     dc.b     $00, $1A
                     ScriptID $0340,$0009
                     dc.b     $00, $1B
                     ScriptJump CS_00CB_1,$000B
                     dc.b     $00, $1D
                     ScriptID $0345,$000D
                     dc.w     $FFFF
CS_00CB_1:           bsr.w    HandleYesNoPrompt
                     ScriptID $0341,$0000
                     ScriptID $0343,$0001
                     ScriptID $0342,$0002
                     rts     
CS_00CC:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0346,$0001
                     dc.b     $00, $14
                     ScriptJump CS_00CC_1,$0003
                     dc.b     $00, $15
                     ScriptID $034B,$0005
                     dc.w     $FFFF
CS_00CC_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $00A2
                     ScriptID $034A,$0001
                     ScriptID $0347,$0002
                     rts     
CS_001B:             cmpi.w   #$00000640,(g_Flags+FLAGWORD_GREENPEA_WINNINGS).l
                     blt.s    CS_001B_1
                     bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $0008
                     ScriptID $0671,$0001
                     ScriptID $066F,$0002
                     bra.s    CS_001B_2
CS_001B_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $0008
                     ScriptID $034D,$0001
                     ScriptID $034C,$0002
CS_001B_2:           rts     
CS_00CD:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $034F,$0001
                     dc.b     $00, $14
                     ScriptID $0351,$0003
                     dc.b     $00, $18
                     ScriptID $0353,$0005
                     dc.w     $FFFF
CS_00CE:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0356,$0001
                     dc.b     $00, $14
                     ScriptID $0357,$0003
                     dc.w     $FFFF
CS_00CF:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0359,$0001
                     dc.b     $00, $14
                     ScriptID $035A,$0003
                     dc.b     $00, $16
                     ScriptID $035B,$0005
                     dc.w     $FFFF
CS_00D0:             move.w   #$0000001B,d0
                     bsr.w    TestFlagBit
                     beq.s    CS_00D0_3
                     move.w   #$0000000F,d0
                     bsr.w    TestFlagBit
                     bne.s    CS_00D0_1
                     trap     #$01
                     ScriptID $0681,$0000
                     bra.s    CS_00D0_2
CS_00D0_1:           trap     #$01
                     ScriptID $067F,$0000
CS_00D0_2:           bra.s    CS_00D0_5
CS_00D0_3:           move.w   #$0000001A,d0
                     bsr.w    TestFlagBit
                     bne.s    CS_00D0_4
                     trap     #$01
                     ScriptID $035C,$0000
                     bra.s    CS_00D0_5
CS_00D0_4:           trap     #$01
                     ScriptID $0684,$0000
CS_00D0_5:           rts     
CS_00D1:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $035D,$0001
                     dc.b     $00, $14
                     ScriptID $0360,$0003
                     dc.b     $00, $18
                     ScriptID $0361,$0005
                     dc.b     $00, $1A
                     ScriptID $0366,$0007
                     dc.b     $00, $1B
                     ScriptID $0367,$0009
                     dc.b     $00, $1D
                     ScriptID $0369,$000B
                     dc.w     $FFFF
CS_00D2:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $036A,$0001
                     dc.b     $00, $14
                     ScriptID $036C,$0003
                     dc.b     $00, $18
                     ScriptID $036E,$0005
                     dc.b     $00, $1A
                     ScriptID $0370,$0007
                     dc.b     $00, $1B
                     ScriptID $0371,$0009
                     dc.b     $00, $1D
                     ScriptID $0372,$000B
                     dc.w     $FFFF
CS_001C:             trap     #$01
                     ScriptID $0373,$0000
                     rts     
CS_00D3:             trap     #$01
                     ScriptID $0374,$0000
                     rts     
CS_00D4:             trap     #$01
                     ScriptID $0375,$0000
                     rts     
CS_00D5:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0377,$0001
                     dc.b     $00, $0E
                     ScriptID $0378,$0003
                     dc.b     $00, $0F
                     ScriptID $0377,$0005
                     dc.b     $00, $14
                     ScriptID $037A,$0007
                     dc.b     $00, $17
                     ScriptID $037B,$0009
                     dc.b     $00, $18
                     ScriptID $037C,$000B
                     dc.b     $00, $1A
                     ScriptID $037E,$000D
                     dc.b     $00, $1D
                     ScriptID $037F,$000F
                     dc.w     $FFFF
CS_00D6:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0381,$0001
                     dc.b     $00, $0E
                     ScriptID $0382,$0003
                     dc.b     $00, $0F
                     ScriptID $0381,$0005
                     dc.b     $00, $14
                     ScriptID $0384,$0007
                     dc.w     $FFFF
CS_00D7:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0385,$0001
                     dc.b     $00, $0E
                     ScriptID $0386,$0003
                     dc.b     $00, $14
                     ScriptID $0387,$0005
                     dc.b     $00, $18
                     ScriptID $0388,$0007
                     dc.b     $00, $1A
                     ScriptID $0389,$0009
                     dc.b     $00, $1D
                     ScriptID $038B,$000B
                     dc.w     $FFFF
CS_00D8:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $038C,$0001
                     dc.b     $00, $14
                     ScriptID $038D,$0003
                     dc.b     $00, $18
                     ScriptID $038E,$0005
                     dc.b     $00, $1A
                     ScriptID $038F,$0007
                     dc.b     $00, $1D
                     ScriptID $0391,$0009
                     dc.w     $FFFF
CS_00D9:             trap     #$01
                     ScriptID $0392,$0000
                     rts     
CS_00DA:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0393,$0001
                     dc.b     $00, $14
                     ScriptID $0394,$0003
                     dc.b     $00, $17
                     ScriptID $0395,$0005
                     dc.w     $FFFF
CS_00DB:             trap     #$01
                     ScriptID $0396,$0000
                     rts     
CS_00DC:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0397,$0001
                     dc.b     $00, $19
                     ScriptID $0398,$0003
                     dc.w     $FFFF
CS_001D:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptJump CS_001D_1,$0001
                     dc.b     $00, $0C
                     ScriptID $039B,$0003
                     dc.b     $00, $0E
                     ScriptID $039C,$0005
                     dc.b     $00, $14
                     ScriptID $039D,$0007
                     dc.b     $00, $18
                     ScriptID $039F,$0009
                     dc.b     $00, $1A
                     ScriptID $03A0,$000B
                     dc.w     $FFFF
CS_001D_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $002A
                     ScriptID $039A,$0001
                     ScriptID $0399,$0002
                     rts     
CS_00DD:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $03A1,$0001
                     dc.b     $00, $14
                     ScriptID $03A3,$0003
                     dc.b     $00, $18
                     ScriptID $03A4,$0005
                     dc.w     $FFFF
CS_00DE:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $03A5,$0001
                     dc.b     $00, $14
                     ScriptID $03A6,$0003
                     dc.b     $00, $18
                     ScriptID $03A7,$0005
                     dc.b     $00, $1D
                     ScriptID $03A9,$0007
                     dc.w     $FFFF
CS_00DF:             trap     #$01
                     ScriptID $03AA,$0000
                     rts     
CS_00E0:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $03AC,$0001
                     dc.b     $00, $14
                     ScriptID $03AD,$0003
                     dc.w     $FFFF
CS_00E1:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $03AE,$0001
                     dc.b     $00, $14
                     ScriptID $03B0,$0003
                     dc.w     $FFFF
CS_00E2:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $03B1,$0001
                     dc.b     $00, $14
                     ScriptID $03B3,$0003
                     dc.w     $FFFF
CS_00E3:             trap     #$01
                     ScriptID $03B4,$0000
                     rts     
CS_00E4:             trap     #$01
                     ScriptID $03B6,$0000
                     rts     
CS_00E5:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptJump CS_00E5_1,$0001
                     dc.b     $00, $0F
                     ScriptID $03B9,$0003
                     dc.b     $00, $14
                     ScriptID $03BA,$0005
                     dc.b     $00, $17
                     ScriptJump CS_00E5_2,$0007
                     dc.b     $00, $18
                     ScriptID $03BE,$0009
                     dc.b     $00, $1D
                     ScriptID $03BF,$000B
                     dc.w     $FFFF
CS_00E5_1:           trap     #$01
                     ScriptID $03B7,$0000
CS_00E5_3:           move.w   #$000000C6,d0
                     bra.w    CS_0016_3
CS_00E5_2:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00DC
                     ScriptID $03BB,$0001
                     ScriptID $03BD,$0002
                     rts     
CS_00E6:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptJump CS_00E6_1,$0001
                     dc.b     $00, $0F
                     ScriptID $03C3,$0003
                     dc.b     $00, $14
                     ScriptID $03C4,$0005
                     dc.b     $00, $17
                     ScriptJump CS_00E6_2,$0007
                     dc.b     $00, $18
                     ScriptID $03C7,$0009
                     dc.b     $00, $1D
                     ScriptID $03C8,$000B
                     dc.w     $FFFF
CS_00E6_1:           trap     #$01
                     ScriptID $03C0,$0000
                     bra.s    CS_00E5_3
CS_00E6_2:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00DC
                     ScriptID $03BB,$0001
                     ScriptID $03C6,$0002
                     rts     
CS_00E7:             trap     #$01
                     ScriptID $03CA,$0000
                     rts     
CS_00E8:             bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $0028
                     ScriptID $03CC,$0001
                     ScriptID $03CB,$0002
                     rts     
CS_001E:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptJump CS_001E_1,$0001
                     dc.b     $00, $12
                     ScriptID $049D,$0003
                     dc.b     $00, $13
                     ScriptJump CS_001E_3,$0005
                     dc.b     $00, $14
                     ScriptJump CS_001E_4,$0007
                     dc.b     $00, $18
                     ScriptJump CS_001E_5,$0009
                     dc.b     $00, $1D
                     ScriptJump CS_001E_6,$000B
                     dc.w     $FFFF
CS_001E_1:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00CE
                     ScriptID $049A,$0001
                     ScriptJump CS_001E_2,$0002
                     rts     
CS_001E_2:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $00DB
                     ScriptID $049C,$0001
                     ScriptID $049B,$0002
                     rts     
CS_001E_3:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00CF
                     ScriptID $049F,$0001
                     ScriptID $04A5,$0002
                     rts     
CS_001E_4:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00D1
                     ScriptID $04A6,$0001
                     ScriptID $04AA,$0002
                     rts     
CS_001E_5:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00D5
                     ScriptID $04AB,$0001
                     ScriptID $04AC,$0002
                     rts     
CS_001E_6:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00DE
                     ScriptID $04AD,$0001
                     ScriptJump CS_001E_7,$0002
                     rts     
CS_001E_7:           move.w   #ITM_CASINOTICKET,d0
                     bsr.w    CheckIfItemIsOwned
                     beq.s    CS_001E_8
                     trap     #$01
                     ScriptID $04B6,$0000
                     bra.s    CS_001E_9
CS_001E_8:           trap     #$01
                     ScriptID $04B8,$0000
CS_001E_9:           rts     
CS_00EA:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $0A
                     ScriptID $03CD,$0001
                     dc.b     $00, $0C
                     ScriptID $0697,$0003
                     dc.w     $FFFF
CS_001F:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $14
                     ScriptID $03CE,$0001
                     dc.b     $00, $18
                     ScriptID $03CF,$0003
                     dc.b     $00, $1A
                     ScriptID $03D0,$0005
                     dc.w     $FFFF
CS_00EB:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $03D1,$0001
                     dc.b     $00, $18
                     ScriptID $03D2,$0003
                     dc.b     $00, $1A
                     ScriptID $03D4,$0005
                     dc.w     $FFFF
CS_00EC:             trap     #$01
                     ScriptID $03D7,$0000
                     rts     
CS_00ED:             trap     #$01
                     ScriptID $03D8,$0000
                     rts     
CS_00EE:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $14
                     ScriptID $03D9,$0001
                     dc.b     $00, $18
                     ScriptID $03DA,$0003
                     dc.b     $00, $1A
                     ScriptID $03DB,$0005
                     dc.w     $FFFF
CS_00EF:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $14
                     ScriptID $03DC,$0001
                     dc.b     $00, $18
                     ScriptID $03DE,$0003
                     dc.b     $00, $1A
                     ScriptID $03DF,$0005
                     dc.w     $FFFF
CS_00F0:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $14
                     ScriptID $03E0,$0001
                     dc.b     $00, $18
                     ScriptID $03E3,$0003
                     dc.b     $00, $1A
                     ScriptID $03E6,$0005
                     dc.w     $FFFF
CS_00F1:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1A
                     ScriptJump CS_00F1_2,$0001
                     dc.b     $01, $01
                     ScriptID $03E7,$0003
                     dc.b     $01, $02
                     ScriptJump CS_00F1_1,$0005
                     dc.b     $01, $03
                     ScriptID $03EA,$0007
                     dc.w     $FFFF
CS_00F1_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $00A5
                     ScriptID $03E9,$0001
                     ScriptID $03E8,$0002
                     rts     
CS_00F1_2:           bsr.w    HandleYesNoPrompt
                     ScriptID $03EB,$0000
                     ScriptID $03EC,$0001
                     ScriptID $03EE,$0002
                     rts     
CS_00F2:             trap     #$01
                     ScriptID $03F1,$0000
                     rts     
CS_00F3:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $14
                     ScriptID $03FB,$0001
                     dc.b     $00, $16
                     ScriptID $03FC,$0003
                     dc.w     $FFFF
CS_00F4:             bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $00A4
                     ScriptJump CS_00F4_1,$0001
                     ScriptID $03F2,$0002
                     rts     
CS_00F4_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $00D2
                     ScriptID $03F4,$0001
                     ScriptID $03F3,$0002
                     rts     
CS_00F5:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $14
                     ScriptID $03F5,$0001
                     dc.b     $00, $18
                     ScriptID $03F6,$0003
                     dc.b     $00, $1A
                     ScriptID $03F7,$0005
                     dc.w     $FFFF
CS_00F6:             trap     #$01
                     ScriptID $03F9,$0000
                     rts     
CS_0020:             trap     #$01
                     ScriptID $02E6,$0000
                     rts     
CS_00F7:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $14
                     ScriptID $03FE,$0001
                     dc.b     $00, $1A
                     ScriptJump CS_00F7_1,$0003
                     dc.w     $FFFF
CS_00F7_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $00D9
                     ScriptID $08CC,$0001
                     ScriptID $03FF,$0002
                     rts     
CS_00F8:             trap     #$01
                     ScriptID $0400,$0000
                     rts     
CS_00F9:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $0F
                     ScriptID $0401,$0001
                     dc.b     $00, $14
                     ScriptJump CS_00F9_1,$0003
                     dc.b     $00, $17
                     ScriptID $0405,$0005
                     dc.b     $00, $18
                     ScriptJump CS_00F9_2,$0007
                     dc.b     $00, $19
                     ScriptID $0409,$0009
                     dc.b     $00, $1D
                     ScriptID $040A,$000B
                     dc.w     $FFFF
CS_00F9_1:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00D4
                     ScriptID $0402,$0001
                     ScriptID $0404,$0002
                     rts     
CS_00F9_2:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00E8
                     ScriptID $0406,$0001
                     ScriptID $0408,$0002
                     rts     
CS_00FA:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $0F
                     ScriptID $040C,$0001
                     dc.b     $00, $14
                     ScriptID $040E,$0003
                     dc.b     $00, $17
                     ScriptID $0410,$0005
                     dc.b     $00, $18
                     ScriptID $0411,$0007
                     dc.b     $00, $1D
                     ScriptID $0413,$0009
                     dc.w     $FFFF
CS_00FB:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $0F
                     ScriptID $0416,$0001
                     dc.b     $00, $14
                     ScriptID $0417,$0003
                     dc.b     $00, $17
                     ScriptID $0419,$0005
                     dc.b     $00, $18
                     ScriptID $041A,$0007
                     dc.b     $00, $19
                     ScriptID $041C,$0009
                     dc.w     $FFFF
CS_00FC:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $041D,$0001
                     dc.b     $00, $12
                     ScriptID $041E,$0003
                     dc.b     $00, $13
                     ScriptID $041F,$0005
                     dc.b     $00, $14
                     ScriptID $0421,$0007
                     dc.b     $00, $17
                     ScriptID $0422,$0009
                     dc.w     $FFFF
CS_00FD:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $0423,$0001
                     dc.b     $00, $12
                     ScriptID $0424,$0003
                     dc.b     $00, $13
                     ScriptID $0425,$0005
                     dc.b     $00, $14
                     ScriptID $0426,$0007
                     dc.b     $00, $17
                     ScriptID $0427,$0009
                     dc.w     $FFFF
CS_00FE:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $0428,$0001
                     dc.b     $00, $14
                     ScriptJump CS_00FE_1,$0003
                     dc.w     $FFFF
CS_00FE_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $00A1
                     ScriptID $0429,$0001
                     ScriptID $0428,$0002
                     rts     
CS_00FF:             bsr.w    SetFlagBitOnTalking
                     dc.w     $00CB
                     ScriptID $042B,$0001
                     ScriptID $042E,$0002
                     rts     
CS_0100:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptJump CS_0100_1,$0001
                     dc.b     $00, $12
                     ScriptID $0433,$0003
                     dc.w     $FFFF
CS_0100_1:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00CC
                     ScriptID $042F,$0001
                     ScriptID $0432,$0002
                     rts     
CS_0101:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $0435,$0001
                     dc.b     $00, $14
                     ScriptID $0436,$0003
                     dc.w     $FFFF
CS_0102:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $10
                     ScriptID $0437,$0001
                     dc.b     $00, $14
                     ScriptID $0438,$0003
                     dc.w     $FFFF
CS_0103:             trap     #$01
                     ScriptID $043A,$0000
                     rts     
CS_0021:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $10
                     ScriptJump CS_0021_1,$0001
                     dc.b     $00, $13
                     ScriptID $043F,$0003
                     dc.w     $FFFF
CS_0021_1:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00CA
                     ScriptID $043B,$0001
                     ScriptID $043E,$0002
                     rts     
CS_0104:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $044F,$0001
                     dc.b     $00, $12
                     ScriptID $0450,$0003
                     dc.b     $00, $13
                     ScriptID $0451,$0005
                     dc.b     $00, $14
                     ScriptID $0452,$0007
                     dc.w     $FFFF
CS_0105:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $0453,$0001
                     dc.b     $00, $12
                     ScriptID $0454,$0003
                     dc.b     $00, $13
                     ScriptID $0455,$0005
                     dc.b     $00, $14
                     ScriptID $0456,$0007
                     dc.w     $FFFF
CS_0106:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $0457,$0001
                     dc.b     $00, $12
                     ScriptID $0458,$0003
                     dc.b     $00, $13
                     ScriptID $0459,$0005
                     dc.b     $00, $14
                     ScriptID $045A,$0007
                     dc.w     $FFFF
CS_0107:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $045B,$0001
                     dc.b     $00, $14
                     ScriptID $045C,$0003
                     dc.w     $FFFF
CS_0108:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $045D,$0001
                     dc.b     $00, $12
                     ScriptID $045E,$0003
                     dc.b     $00, $14
                     ScriptID $045F,$0005
                     dc.w     $FFFF
CS_0109:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $0460,$0001
                     dc.b     $00, $12
                     ScriptID $0461,$0003
                     dc.b     $00, $14
                     ScriptID $0462,$0005
                     dc.w     $FFFF
CS_010A:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $0463,$0001
                     dc.b     $00, $14
                     ScriptID $0464,$0003
                     dc.b     $00, $18
                     ScriptID $0465,$0005
                     dc.w     $FFFF
CS_010B:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $0467,$0001
                     dc.b     $00, $12
                     ScriptID $0469,$0003
                     dc.b     $00, $13
                     ScriptID $046A,$0005
                     dc.w     $FFFF
CS_010C:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $046B,$0001
                     dc.b     $00, $13
                     ScriptID $046D,$0003
                     dc.b     $00, $14
                     ScriptID $046F,$0005
                     dc.w     $FFFF
CS_010D:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $0470,$0001
                     dc.b     $00, $13
                     ScriptID $0472,$0003
                     dc.b     $00, $14
                     ScriptID $0473,$0005
                     dc.w     $FFFF
CS_010E:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptJump CS_010E_1,$0001
                     dc.b     $00, $12
                     ScriptID $0478,$0003
                     dc.b     $00, $13
                     ScriptID $0479,$0005
                     dc.w     $FFFF
CS_010E_1:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00CD
                     ScriptID $0475,$0001
                     ScriptID $0477,$0002
                     rts     
CS_010F:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $047A,$0001
                     dc.b     $00, $13
                     ScriptID $047B,$0003
                     dc.b     $00, $14
                     ScriptID $047C,$0005
                     dc.b     $00, $18
                     ScriptID $047E,$0007
                     dc.w     $FFFF
CS_0110:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $047F,$0001
                     dc.b     $00, $13
                     ScriptID $0481,$0003
                     dc.w     $FFFF
CS_0111:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $0483,$0001
                     dc.b     $00, $13
                     ScriptID $0484,$0003
                     dc.w     $FFFF
CS_0112:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptJump CS_0112_1,$0001
                     dc.b     $00, $12
                     ScriptID $0489,$0003
                     dc.b     $00, $13
                     ScriptID $048A,$0005
                     dc.w     $FFFF
CS_0112_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $00CE
                     ScriptID $0487,$0001
                     ScriptID $0485,$0002
                     rts     
CS_0113:             trap     #$01
                     ScriptID $048B,$0000
                     rts     
CS_0114:             trap     #$01
                     ScriptID $048E,$0000
                     rts     
CS_0115:             trap     #$01
                     ScriptID $0490,$0000
                     rts     
CS_0116:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $11
                     ScriptID $0491,$0001
                     dc.b     $00, $13
                     ScriptID $0493,$0003
                     dc.b     $00, $14
                     ScriptID $0494,$0005
                     dc.w     $FFFF
CS_0117:             trap     #$01
                     ScriptID $0496,$0000
                     rts     
CS_0118:             trap     #$01
                     ScriptID $0497,$0000
                     rts     
CS_0119:             trap     #$01
                     ScriptID $0498,$0000
                     rts     
CS_011A:             trap     #$01
                     ScriptID $0499,$0000
                     rts     
CS_011B:             trap     #$01
                     ScriptID $0414,$0000
                     rts     
CS_011C:             trap     #$01
                     ScriptID $0415,$0000
                     rts     
CS_011D:             trap     #$01
                     ScriptID $04BB,$0000
                     rts     
CS_0022:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $17
                     ScriptID $04CB,$0001
                     dc.b     $00, $18
                     ScriptID $081E,$0003
                     dc.w     $FFFF
CS_011E:             bsr.w    SetFlagBitOnTalking
                     dc.w     $00D0
                     ScriptID $04CC,$0001
                     ScriptID $04CD,$0002
                     rts     
CS_011F:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1A
                     ScriptID $04ED,$0001
                     dc.b     $00, $1B
                     ScriptID $04F0,$0003
                     dc.w     $FFFF
CS_0023:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1A
                     ScriptID $04F1,$0001
                     dc.b     $00, $1B
                     ScriptID $04F2,$0003
                     dc.w     $FFFF
CS_0024:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1A
                     ScriptID $04F3,$0001
                     dc.b     $00, $1B
                     ScriptID $04F4,$0003
                     dc.w     $FFFF
CS_0120:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1A
                     ScriptJump CS_0120_1,$0001
                     dc.b     $00, $1B
                     ScriptID $04FA,$0003
                     dc.w     $FFFF
CS_0120_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $0135
                     ScriptID $04F6,$0001
                     ScriptID $04F5,$0002
                     rts     
CS_0121:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1A
                     ScriptJump CS_0121_1,$0001
                     dc.b     $00, $1B
                     ScriptID $04FE,$0003
                     dc.w     $FFFF
CS_0121_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $0135
                     ScriptID $04FC,$0001
                     ScriptID $04FB,$0002
                     rts     
CS_0122:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1A
                     ScriptJump CS_0122_1,$0001
                     dc.b     $00, $1B
                     ScriptID $0501,$0003
                     dc.w     $FFFF
CS_0122_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $0135
                     ScriptID $0500,$0001
                     ScriptID $04FF,$0002
                     rts     
CS_0123:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1A
                     ScriptJump CS_0123_1,$0001
                     dc.b     $00, $1B
                     ScriptID $0505,$0003
                     dc.w     $FFFF
CS_0123_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $0136
                     ScriptID $0503,$0001
                     ScriptID $0502,$0002
                     rts     
CS_0124:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1A
                     ScriptID $0508,$0001
                     dc.b     $00, $1B
                     ScriptID $0509,$0003
                     dc.w     $FFFF
CS_0125:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1A
                     ScriptJump CS_0125_1,$0001
                     dc.b     $00, $1B
                     ScriptID $050D,$0003
                     dc.w     $FFFF
CS_0125_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $0136
                     ScriptID $050C,$0001
                     ScriptID $050B,$0002
                     rts     
CS_0126:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1A
                     ScriptJump CS_0126_1,$0001
                     dc.b     $00, $1B
                     ScriptID $0513,$0003
                     dc.w     $FFFF
CS_0126_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $0137
                     ScriptID $0510,$0001
                     ScriptID $050F,$0002
                     rts     
CS_0127:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1A
                     ScriptJump CS_0127_1,$0001
                     dc.b     $00, $1B
                     ScriptID $0518,$0003
                     dc.w     $FFFF
CS_0127_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $0137
                     ScriptID $0517,$0001
                     ScriptID $0516,$0002
                     rts     
CS_0128:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1A
                     ScriptJump CS_0128_1,$0001
                     dc.b     $00, $1B
                     ScriptID $051C,$0003
                     dc.w     $FFFF
CS_0128_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $0137
                     ScriptJump CS_0128_2,$0001
                     ScriptID $0519,$0002
                     rts     
CS_0128_2:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $013D
                     ScriptID $08E4,$0001
                     ScriptID $051A,$0002
                     rts     
CS_0129:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1A
                     ScriptID $051D,$0001
                     dc.b     $00, $1B
                     ScriptID $051E,$0003
                     dc.w     $FFFF
CS_012A:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1A
                     ScriptID $0520,$0001
                     dc.b     $00, $1B
                     ScriptID $0521,$0003
                     dc.w     $FFFF
CS_012B:             trap     #$01
                     ScriptID $0523,$0000
                     rts     
CS_012C:             trap     #$01
                     ScriptID $0524,$0000
                     rts     
CS_0025:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1B
                     ScriptID $0525,$0001
                     dc.b     $00, $1C
                     ScriptID $052A,$0003
                     dc.w     $FFFF
CS_012D:             trap     #$01
                     ScriptID $052C,$0000
                     rts     
CS_012E:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1B
                     ScriptID $052D,$0001
                     dc.b     $00, $1C
                     ScriptID $0530,$0003
                     dc.w     $FFFF
CS_0026:             trap     #$01
                     ScriptID $0532,$0000
                     rts     
CS_0027:             trap     #$01
                     ScriptID $0533,$0000
                     rts     
CS_012F:             trap     #$01
                     ScriptID $0534,$0000
                     rts     
CS_0028:             trap     #$01
                     ScriptID $0535,$0000
                     rts     
CS_0130:             trap     #$01
                     ScriptID $0537,$0000
                     rts     
CS_0131:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1B
                     ScriptID $0538,$0001
                     dc.b     $00, $1C
                     ScriptID $0539,$0003
                     dc.w     $FFFF
CS_0132:             trap     #$01
                     ScriptID $053A,$0000
                     rts     
CS_0133:             trap     #$01
                     ScriptID $053C,$0000
                     rts     
CS_0134:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $1B
                     ScriptID $053E,$0001
                     dc.b     $00, $1C
                     ScriptID $0540,$0003
                     dc.w     $FFFF
CS_0029:             trap     #$01
                     ScriptID $0542,$0000
                     rts     
CS_002A:             trap     #$01
                     ScriptID $0543,$0000
                     rts     
CS_002B:             trap     #$01
                     ScriptID $0544,$0000
                     rts     
CS_0135:             trap     #$01
                     ScriptID $0546,$0000
                     rts     
CS_0136:             trap     #$01
                     ScriptID $0548,$0000
                     rts     
CS_002C:             trap     #$01
                     ScriptID $054C,$0000
                     rts     
CS_0137:             trap     #$01
                     ScriptID $054E,$0000
                     rts     
CS_0138:             trap     #$01
                     ScriptID $0551,$0000
                     rts     
CS_002D:             trap     #$01
                     ScriptID $0553,$0000
                     rts     
CS_0139:             move.w   #$0000000A,d0
                     bsr.w    TestFlagBit
                     beq.s    CS_0139_1
                     trap     #$01
                     ScriptID $0A03,$0000
                     bra.s    CS_0139_3
CS_0139_1:           move.w   #$00000008,d0
                     bsr.w    TestFlagBit
                     beq.s    CS_0139_2
                     trap     #$01
                     ScriptID $09FC,$0000
                     bra.s    CS_0139_3
CS_0139_2:           move.w   #$00000132,(g_PendingCutsceneAction).l
CS_0139_3:           rts     
CS_013A:             move.w   #$0000000A,d0
                     bsr.w    TestFlagBit
                     beq.s    CS_013A_1
                     trap     #$01
                     ScriptID $0A03,$0000
                     bra.s    CS_013A_3
CS_013A_1:           move.w   #$00000008,d0
                     bsr.w    TestFlagBit
                     beq.s    CS_013A_2
                     trap     #$01
                     ScriptID $09FC,$0000
                     bra.s    CS_013A_3
CS_013A_2:           move.w   #$00000159,(g_PendingCutsceneAction).l
CS_013A_3:           rts     
CS_013B:             move.w   #$0000000A,d0
                     bsr.w    TestFlagBit
                     beq.s    CS_013B_1
                     trap     #$01
                     ScriptID $0A03,$0000
                     bra.s    CS_013B_3
CS_013B_1:           move.w   #$00000008,d0
                     bsr.w    TestFlagBit
                     beq.s    CS_013B_2
                     trap     #$01
                     ScriptID $09FC,$0000
                     bra.s    CS_013B_3
CS_013B_2:           move.w   #$00000135,(g_PendingCutsceneAction).l
CS_013B_3:           rts     
CS_013C:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $09
                     ScriptID $0A14,$0001
                     dc.b     $00, $1D
                     ScriptJump CS_013C_1,$0003
                     dc.w     $FFFF
CS_013C_1:           move.w   #$0000014B,d0
                     bsr.w    TestFlagBit
                     bne.s    CS_013C_2
                     move.w   #$00000137,(g_PendingCutsceneAction).l
                     bra.s    CS_013C_3
CS_013C_2:           trap     #$01
                     ScriptID $0A19,$0000
CS_013C_3:           rts     
CS_013D:             bsr.w    SetFlagBitOnTalking
                     dc.w     $00E5
                     ScriptID $0A67,$0001
                     ScriptID $0A6E,$0002
                     rts     
CS_013E:             bsr.w    SetFlagBitOnTalking
                     dc.w     $00E6
                     ScriptID $0A70,$0001
                     ScriptID $0A77,$0002
                     rts     
CS_NULL:             rts     
CS_002E:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $17
                     ScriptID $04BC,$0001
                     dc.b     $00, $1D
                     ScriptJump CS_002E_1,$0003
                     dc.w     $FFFF
CS_002E_1:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00E7
                     ScriptID $04BD,$0001
                     ScriptID $04C2,$0002
                     rts     
CS_002F:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $12
                     ScriptID $04C3,$0001
                     dc.b     $00, $17
                     ScriptID $04C4,$0003
                     dc.b     $00, $1D
                     ScriptID $04C5,$0005
                     dc.w     $FFFF
CS_0030:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $12
                     ScriptID $04C6,$0001
                     dc.b     $00, $17
                     ScriptID $07DF,$0003
                     dc.b     $00, $1D
                     ScriptID $04C7,$0005
                     dc.w     $FFFF
CS_0031:             trap     #$01
                     ScriptID $04C8,$0000
                     rts     
CS_0032:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $10
                     ScriptJump CS_0032_1,$0001
                     dc.b     $00, $11
                     ScriptID $0447,$0003
                     dc.b     $00, $13
                     ScriptID $0448,$0005
                     dc.b     $00, $1D
                     ScriptID $044A,$0007
                     dc.w     $FFFF
CS_0032_1:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00C9
                     ScriptJump CS_0032_2,$0001
                     ScriptID $0446,$0002
                     rts     
CS_0032_2:           bsr.w    HandleYesNoPrompt
                     ScriptID $0441,$0000
                     ScriptID $0443,$0001
                     ScriptID $0444,$0002
                     rts     
CS_0033:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $10
                     ScriptID $044B,$0001
                     dc.b     $00, $11
                     ScriptID $044C,$0003
                     dc.b     $00, $13
                     ScriptID $044E,$0005
                     dc.w     $FFFF
CS_0034:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $16
                     ScriptID $04CF,$0001
                     dc.w     $FFFF
CS_0035:             rts     
CS_0036:             rts     
CS_0037:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $18
                     ScriptID $04E1,$0001
                     dc.b     $00, $19
                     ScriptID $04E2,$0003
                     dc.w     $FFFF
CS_0038:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $18
                     ScriptID $04E3,$0001
                     dc.b     $00, $19
                     ScriptID $0851,$0003
                     dc.w     $FFFF
CS_0039:             bsr.w    SetFlagBitOnTalking
                     dc.w     $00DF
                     ScriptID $08A7,$0001
                     ScriptJump CS_0039_1,$0002
                     rts     
CS_0039_1:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00E3
                     ScriptID $08B0,$0001
                     ScriptID $08AF,$0002
                     rts     
CS_003A:             move.w   #ITM_SUNSTONE,d0
                     bsr.w    CheckIfItemIsOwned
                     beq.s    CS_003A_1
                     trap     #$01
                     ScriptID $04DE,$0000
                     bra.s    CS_003A_2
CS_003A_1:           bsr.w    SetFlagBitOnTalking
                     dc.w     $00D7
                     ScriptID $04D0,$0001
                     ScriptID $04D6,$0002
                     bsr.w    HandleYesNoPrompt
                     ScriptJump CS_NULL,$0000
                     ScriptID $04D7,$0001
                     ScriptID $04DC,$0002
CS_003A_2:           rts     
CS_013F:             trap     #$01
                     ScriptID $04CE,$0000
                     rts     
CS_0140:             trap     #$01
                     ScriptID $04E4,$0000
                     rts     
CS_003B:             trap     #$01
                     ScriptID $04E8,$0000
                     rts     
CS_003C:             bsr.w    HandleProgressDependentDialogue
                     dc.b     $00, $05
                     ScriptID $04E9,$0001
                     dc.b     $02, $01
                     ScriptID $04EC,$0003
                     dc.b     $02, $02
                     ScriptID $04EA,$0005
                     dc.b     $02, $03
                     ScriptID $04EB,$0007
                     dc.w     $FFFF
CS_0141:             move.w   #$00000138,(g_PendingCutsceneAction).l
                     rts     
CS_0142:             bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $014D
                     ScriptJump CS_0142_1,$0001
                     ScriptID $0A2A,$0002
                     rts     
CS_0142_1:           bsr.w    CheckFlagAndDisplayMessage
                     dc.w     $015B
                     ScriptID $0A32,$0001
                     ScriptID $0A2F,$0002
                     rts     
