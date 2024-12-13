;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LANDSTALKER US ROM Disassembly ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; To build, run:
;; .\build\asm68k.exe /p /o ae-,e+,w+,c+,op+,os+,ow+,oz+,l_ /e EXPANDED=0 landstalker.asm,landstalker.bin

                            include "code\include\landstalker.inc"
                            include "code\include\ram.inc"
                            include "code\include\macros.inc"


                            org     $000000
                            include "code\system\header.asm"
                            include "code\system\system_jmps.asm"
                            include "code\system\system.asm"
                            include "code\system\savegame.asm"
                            include "code\gamelogic\gamelogic1.asm"
                            include "code\maps\lavapalette.asm"
LavaPaletteRotation:        incbin  "assets_packed\graphics\miscpalettes\lavapalette.pal"
                            include "code\maps\mapload.asm"
LabrynthLitPal:             incbin  "assets_packed\graphics\miscpalettes\labrynthlit.pal"
                            include "code\gamelogic\gamelogic2.asm"
                            include "code\misc\fridayanimation.asm"
FridayAnimation1:           incbin  "assets_packed\misc\fridayanim\fridayanim01.bin"
                            Align   $2
FridayAnimation2:           incbin  "assets_packed\misc\fridayanim\fridayanim02.bin"
                            Align   $2
FridayAnimation3:           incbin  "assets_packed\misc\fridayanim\fridayanim03.bin"
                            Align   $2
FridayAnimation4:           incbin  "assets_packed\misc\fridayanim\fridayanim04.bin"
                            Align   $2
FridayAnimation5:           incbin  "assets_packed\misc\fridayanim\fridayanim05.bin"
                            Align   $2
FridayAnimation6:           incbin  "assets_packed\misc\fridayanim\fridayanim06.bin"
                            Align   $2
FridayAnimation7:           incbin  "assets_packed\misc\fridayanim\fridayanim07.bin"
                            Align   $2
FridayAnimation8:           incbin  "assets_packed\misc\fridayanim\fridayanim08.bin"
                            Align   $2
FridayAnimation9:           incbin  "assets_packed\misc\fridayanim\fridayanim09.bin"
                            Align   $2
FridayAnimation10:          incbin  "assets_packed\misc\fridayanim\fridayanim10.bin"
                            Align   $2
FridayAnimation11:          incbin  "assets_packed\misc\fridayanim\fridayanim11.bin"
                            Align   $2
FridayAnimation12:          incbin  "assets_packed\misc\fridayanim\fridayanim12.bin"
                            Align   $2
FridayAnimation13:          incbin  "assets_packed\misc\fridayanim\fridayanim13.bin"
                            Align   $2
FridayAnimation14:          incbin  "assets_packed\misc\fridayanim\fridayanim14.bin"
                            Align   $2
FridayAnimation15:          incbin  "assets_packed\misc\fridayanim\fridayanim15.bin"
                            Align   $2
                            include "code\gamelogic\gamelogic3.asm"
                            include "code\maps\mapflagchanges.asm"
RoomGfxSwapFlags:           incbin  "assets_packed\roomdata\flagactions\roomgfxswapflags.bin"
                            Align   $2
LockedDoorGfxSwapFlags:     incbin  "assets_packed\roomdata\flagactions\lockeddoorgfxswapflags.bin"
                            Align   $2
TreeWarpGfxSwapFlags:       incbin  "assets_packed\roomdata\flagactions\treewarpgfxswapflags.bin"
                            Align   $2
TileSwaps:                  incbin  "assets_packed\roomdata\flagactions\tileswaps.bin"
                            Align   $2
                            include "code\gamelogic\gamelogic4.asm"
                            include "code\inventory\inventory1.asm"
InvItemPal:                 incbin  "assets_packed\graphics\static\inventory\invitempal.pal"
                            include "code\misc\equipmentpaletteswap.asm"
SwordPalSwaps:              incbin  "assets_packed\graphics\miscpalettes\swordpalswaps.pal"
ArmourPalSwaps:             incbin  "assets_packed\graphics\miscpalettes\armourpalswaps.pal"
                            include "code\inventory\inventory2.asm"
SwordGfxData:               include "code\graphics\staticimages\swordfx.asm"
                            Align   $2
                            include "code\items\items1.asm"
ItemPreUseTable:            include "code\pointertables\items\items_preusejmptable.asm"
ItemPostUseTable:           include "code\pointertables\items\items_postusejmptable.asm"
ItemFuncs1:                 include "code\items\items2.asm"
LightableRooms:             incbin  "assets_packed\roomdata\flagactions\lanternflags.bin"
                            Align   $2
ItemFuncs2:                 include "code\items\items3.asm"
                            include "code\gamelogic\gamelogic5.asm"
DefaultPlayerPal:           incbin  "assets_packed\graphics\miscpalettes\defaultplayer.pal"
StatusBarPal:               incbin  "assets_packed\graphics\static\hud\hud.pal"
                            include "code\gamelogic\gamelogic6.asm"
StatusBarTilemap:           incbin  "assets_packed\graphics\static\hud\hudtilemap.map"
StatusBarGfx:               incbin  "assets_packed\graphics\static\hud\hud.lz77"
                            Align   $2
                            include "code\maps\doors.asm"
DoorLookup:                 incbin  "assets_packed\roomdata\misc\doorlookup.bin"
                            Align   $2
DoorTable:                  incbin  "assets_packed\roomdata\misc\doortable.bin"
                            Align   $2
                            include "code\gamelogic\shops\shops1.asm"
Shops:                      incbin  "assets_packed\roomdata\misc\shops.bin"
                            Align   $2
                            include "code\gamelogic\shops\shops2.asm"
LifestockSoldFlags:         incbin  "assets_packed\roomdata\flagactions\lifestocksoldflags.bin"
                            Align   $2
                            include "code\maps\animtilesets.asm"
AnimatedTilesetTable:       include "code\maps\animtilesettbl.asm"
                            Align   $2
                            include "code\maps\room1.asm"
RoomFallDestination:        incbin  "assets_packed\roomdata\warps\roomfalldests.bin"
                            Align   $2
RoomClimbDestination:       incbin  "assets_packed\roomdata\warps\roomclimbdests.bin"
                            Align   $2
RoomTransitionLookup:       incbin  "assets_packed\roomdata\flagactions\roomtransitions.bin"
                            Align   $2
                            include "code\blocks\loadisometricblocks1.asm"
VDPCopyBlockCmds:           incbin  "assets_packed\misc\data\vdpcopyblockcmds.bin"
                            Align   $2
TopLeftMapOffsets:          incbin  "assets_packed\misc\data\ulmapoffsets.bin"
                            Align   $2
BottomMapOffsets:           incbin  "assets_packed\misc\data\dmapoffsets.bin"
                            Align   $2
RightMapOffsets:            incbin  "assets_packed\misc\data\rmapoffsets.bin"
                            Align   $2
                            include "code\blocks\loadisometricblocks2.asm"
IntroStrings:               include "code\text\introstrings.asm"
RoomVisitedFlagLookup:      incbin  "assets_packed\roomdata\flagactions\roomvisitflags.bin"
                            Align   $2
                            include "code\maps\mapdecompress.asm"
                            include "code\blocks\blockdecompress.asm"
                            include "code\inventory\inventory3.asm"
InventoryItems:             incbin  "assets_packed\misc\inventory\inventoryitems.bin"
                            Align   $2
                            include "code\inventory\inventory4.asm"
InventoryGraphics:          include "code\inventory\graphics.asm"
                            Align   $2
                            include "code\graphics\visualeffects1.asm"
KazaltWarpPalette:          incbin  "assets_packed\graphics\miscpalettes\kazaltwarp.pal"
                            include "code\graphics\visualeffects2.asm"
                            include "code\inventory\inventory5.asm"
EquipInventoryLayout:       incbin  "assets_packed\misc\inventory\inventoryequip.bin"
                            Align   $2
                            include "code\inventory\inventory6.asm"
GameLoadScreen:             include "code\title\gameloadscreen.asm"
                            PadTo   $010300
                            include "code\sprites\spritefuncsjumptable.asm"
                            include "code\sprites\spritefuncs1.asm"
SpriteAnimFlags:            incbin  "assets_packed\spritedata\spriteanimflags.bin"
                            Align   $2
                            include "code\gamelogic\playbackinput.asm"
InputPlayback:              incbin  "assets_packed\misc\playbackinputtable.bin"
                            Align   $2
                            include "code\sprites\spritefuncs2.asm"
BehaviourTriggerJumpTable:  include "code\scripthandling\triggeractionjumptable.asm"
BehaviourTriggerFuncs:      include "code\scripthandling\triggeractions.asm"
CutsceneJumpTable:          include "code\scripthandling\dialogueactionjumptable.asm"
CutsceneFuncs:              include "code\scripthandling\dialogueactions.asm"
                            include "code\gamelogic\combat.asm"
                            include "code\graphics\hud.asm"
                            include "code\graphics\statusanim.asm"
StatusAnimPtrs:             include "code\pointertables\graphics\statusanimptrs.asm"
StatusAnimData:             include "code\graphics\staticimages\statusfx.asm"
                            Align   $2
                            include "code\gamelogic\gamefuncs.asm"
                            include "code\sprites\spritebehaviourjumptable.asm"
                            include "code\sprites\spritebehaviours.asm"
                            dcb.b   $200, $FF
                            include "code\maps\loadroomsprites.asm"
CustomRoomActions1:         include "code\maps\customroomactions1.asm"
BigTreeLocations:           incbin  "assets_packed\roomdata\misc\bigtreelocs.bin"
                            Align   $2
CustomRoomActions2:         include "code\maps\customroomactions2.asm"
                            include "code\maps\roomspriteflags.asm"
SpriteVisibilityFlags:      incbin  "assets_packed\roomdata\flagactions\spritevisibility.bin"
                            Align   $2
OneTimeEventFlags:          incbin  "assets_packed\roomdata\flagactions\onetime.bin"
                            Align   $2
RoomClearFlags:             incbin  "assets_packed\roomdata\flagactions\roomcleared.bin"
                            Align   $2
LockedDoorSpriteFlags:      incbin  "assets_packed\roomdata\flagactions\lockeddoorsprites.bin"
                            Align   $2
PermanentSwitchFlags:       incbin  "assets_packed\roomdata\flagactions\permanentswitches.bin"
                            Align   $2
SacredTreeFlags:            incbin  "assets_packed\roomdata\flagactions\sacredtrees.bin"
SpriteGfxIdxLookup:         incbin  "assets_packed\spritedata\spritegfx.bin"
SpriteDimensionsLookup:     incbin  "assets_packed\spritedata\spritedimensions.bin"
                            Align   $2
RoomSpriteTableOffset:      incbin  "assets_packed\spritedata\roomtableoffsets.bin"
EnemyStats:                 incbin  "assets_packed\spritedata\enemystats.bin"
                            Align   $2
RoomSpriteTable:            incbin  "assets_packed\spritedata\roomspritetable.bin"
                            dcb.b   $30, $FF
                            Align   $2
StringPtrs:                 include "code\pointertables\strings\stringbankptr.asm"
                            include "code\text\stringfuncsjumptable.asm"
                            include "code\text\stringfuncs1.asm"
DownArrowGfx:               incbin  "assets_packed\graphics\static\textbox\downarrow.bin"
                            include "code\text\stringfuncs2.asm"
TextBoxTilemap:             incbin  "assets_packed\graphics\static\textbox\threelinetextbox.map"
InventoryTextBoxTilemap:    incbin  "assets_packed\graphics\static\textbox\twolinetextbox.map"
HuffTableOffsets:           incbin  "assets_packed\strings\main\huffmancharoffsets.bin"
HuffTables:                 incbin  "assets_packed\strings\main\huffmantables.bin"
                            Align   $2
                            include "code\text\stringfuncs3.asm"
RightArrowGfx:              incbin  "assets_packed\graphics\static\textbox\rightarrow.bin"
                            include "code\scripthandling\shops\shopscriptfuncs1.asm"
ShopSpecialItemsScript:     include "code\script\shops\shoptable_specialitems.asm"
                            include "code\scripthandling\shops\shopscriptfuncs2.asm"
ShopScript:	                include "code\script\shops\shoptable.asm"
                            include "code\scripthandling\scriptfuncs1.asm"
ShopSpecialItemsFuncs:      include "code\script\shops\script_shopspecialitems.asm"
                            include "code\scripthandling\scriptfuncs2.asm"
ScriptProgressFlags:        include "code\script\scriptflagcheck.asm"
                            include "code\scripthandling\scriptfuncs3.asm"
CutsceneScriptTable:        include "code\script\cutscenes\script_cutscenetable.asm"
RoomDialogueTable:          incbin  "assets_packed\roomdata\roomcharatertable.bin"
                            Align   $2
CharacterScriptTable:       include "code\script\characters\script_charactertable.asm"
                            include "code\scripthandling\scriptfuncs4.asm"
ShopScriptFuncs:            include "code\script\shops\script_shops.asm"
                            include "code\scripthandling\scriptfuncs5.asm"
CharacterScriptFuncs:       include "code\script\characters\script_characters.asm"
CutsceneScriptFuncs:        include "code\script\cutscenes\script_cutscenes.asm"
Script:                     incbin  "assets_packed\script\script.bin"
                            Align   $2
                            include "code\scripthandling\scriptfuncs6.asm"
SpriteIdToTalkSfx:          incbin  "assets_packed\script\spritetalksfx.bin"
                            Align   $2
                            include "code\scripthandling\scriptfuncs7.asm"
SpecialCharacterSfxList:    incbin  "assets_packed\script\charactertalksfx.bin"
                            Align   $2
                            include "code\scripthandling\scriptfuncs8.asm"
ItemProperties:             incbin  "assets_packed\script\items.bin"
                            Align   $2
                            include "code\scripthandling\scriptfuncs9.asm"
SaveGameLocations:          incbin  "assets_packed\script\savegamelocations.bin"
                            Align   $2
                            include "code\scripthandling\islandmaplocations.asm"
IslandMapLocations:         incbin  "assets_packed\script\islandmaplocations.bin"
                            Align   $2
StringTables:               include "code\text\stringtables.asm"
                            include "code\scripthandling\script_visualfx.asm"
SineTable:                  incbin  "assets_packed\misc\data\sinetable.bin"
                            Align   $2
                            include "code\misc\debugmenu.asm"
StringData:                 include "code\text\strings.asm"
                            Align   $2
StringBankPtrs:             include "code\pointertables\strings\stringptrs.asm"
                            PadTo   $038600
                            include "code\graphics\staticimages\staticgraphicjumps.asm"
SegaLogo:                   include "code\graphics\staticimages\segalogo.asm"
                            include "code\graphics\staticimages\lithograph.asm"
LithographData:             include "code\graphics\staticimages\lithographdata.asm"
TitleScreen:                include "code\graphics\staticimages\titlescreen.asm"
                            include "code\graphics\staticimages\climaxlogo.asm"
ClimaxLogoData:             include "code\graphics\staticimages\climaxlogodata.asm"
                            include "code\graphics\staticimages\islandmaproutines.asm"
IslandMap:                  include "code\graphics\staticimages\islandmap.asm"
                            PadTo   $044010
TilesetPtrTable:            include "code\pointertables\graphics\tilesetpointers.asm"
TilesetData:                include "code\graphics\tileset_data.asm"
                            PadTo   $09B000
                            include "code\sprites\sprites1.asm"
SpriteBehaviourOffsets:     incbin  "assets_packed\spritedata\behaviouroffsets.bin"
SpriteBehaviourTable:       incbin  "assets_packed\spritedata\behaviourtable.bin"
                            Align   $2
                            include "code\maps\chests1.asm"
RoomChestOffsets:           incbin  "assets_packed\roomdata\chests\chestoffsets.bin"
ChestContents:              incbin  "assets_packed\roomdata\chests\chestcontents.bin"
                            Align   $2
                            include "code\maps\chests2.asm"
                            include "code\ending\endcredits1.asm"
EndCreditText:              incbin  "assets_packed\strings\ending\credits.bin"
                            Align   $2
                            include "code\ending\endcredits2.asm"
EndCreditsData:             include "code\ending\endcreditsdata.asm"
                            PadTo   $0A0A00
                            include "code\pointertables\maps\mappointers.asm"
                            include "code\system\regioncheckjump.asm"
RoomData_0:                 include "code\pointertables\maps\roomlist.asm"
RoomMaps:                   include "code\graphics\roommaps.asm"
                            Align   $2
RoomPals:                   include "code\palettes\roompals.asm"
RoomExits:                  incbin  "assets_packed\roomdata\warps\exits.bin"
                            Align   $2
RegionCheck:                include "code\system\regioncheck.asm"
                            PadTo   $120000
                            include "code\pointertables\sprites\spritegraphicsptr.asm"
SpriteGfxOffsetTable:       incbin  "assets_packed\spritedata\spritegfxoffsettable.bin"
                            Align   $2
SpriteAnimationPtrs:        include "code\pointertables\sprites\spriteanimations.asm"
SpriteFramePtrs:            include "code\pointertables\sprites\spriteanimationframes.asm"
SpriteFrames:               include "code\sprites\spriteframes.asm"
                            PadTo   $1A4400
                            include "code\sprites\spritefuncsjumptable2.asm"
                            include "code\sprites\spritefuncs3.asm"
SpritePalettes:             include "code\sprites\spritepalettes.asm"
                            include "code\gamelogic\ai\enemyai1.asm"
ProjectilePalette1:         incbin  "assets_packed\graphics\spritepalettes\projectile1.pal"
                            include "code\gamelogic\ai\enemyai2.asm"
ProjectilePalette2:         incbin  "assets_packed\graphics\spritepalettes\projectile2.pal"
                            PadTo   $1AF800
BlocksetPrimaryPointers:    include "code\pointertables\blocks\primaryblocksetpointers.asm"
BlocksetSecondaryPointers:  include "code\pointertables\blocks\secondaryblocksetpointers.asm"
Blocksets:                  include "code\blocks\blocksets.asm"
                            PadTo   $1E0000
SoundBank1:                 incbin  "assets_packed\sound\soundbank1.bin"
                            PadTo   $1E8000
SoundBank2:                 incbin  "assets_packed\sound\soundbank2.bin"
                            PadTo   $1F0000
SoundBank3:                 incbin  "assets_packed\sound\soundbank3.bin"
                            PadTo   $1F6000
SoundDriver:                incbin  "assets_packed\sound\sounddrv.z80"
                            PadTo   $1F8000
SoundBank4:                 incbin  "assets_packed\sound\soundbank4.bin"
                            PadTo   $200000
