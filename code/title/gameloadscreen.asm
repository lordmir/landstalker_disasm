GameLoadScreenRoutines1:    include "code\title\gameloadscreen1.asm"
GameStartPalette:           incbin  "assets_packed\graphics\static\loadgame\loadgame.pal"
GameLoadScreenRoutines2:    include "code\title\gameloadscreen2.asm"
InitialPlayerPal:           incbin  "assets_packed\graphics\static\loadgame\nigel.pal"
LoadGameScreenCharsCmp:     incbin  "assets_packed\graphics\static\loadgame\chars.lz77"
LoadGameScreenGfxCmp:       incbin  "assets_packed\graphics\static\loadgame\tiles.lz77"
LoadGameScreenTilemapCmp:   incbin  "assets_packed\graphics\static\loadgame\tilemap.rle"
                            Align   $2
GameLoadScreenRoutines3:    include "code\title\gameloadscreen3.asm"