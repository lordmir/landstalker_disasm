# landstalker_disasm

Disassembly of the US Landstalker ROM in IDA Pro 6.8

## Build instructions

1. Open the idb file in IDA pro 6.8
2. In IDA, run the script `tools\ida_scripts\fix_asm.idc` on the disassembly (File->Script File...). This will fix some 68000 instructions that haven't been correctly disassembled by IDA.
3. In IDA, run the script `tools\ida_scripts\split_asm.py` on the disassembly (File->Script File...). This will split the main assembly file into different files (binary data, assembler) which will be output to the `disassembly` directory.
4. Run the build.bat file - this will assemble the previously disassembled files. If no changes have been made to the disassembly, you should end up with a file identical to the US release ROM.

Enjoy!

## Notes on disassembly

- Many of the files are in binary or compressed formats. Some files are uncompressed - these files end with the `.bin` extension, and can be viewed and edited using a hex-editor (e.g. HxD) or a tile bitmap editor (e.g. Tile Layer Pro). Files ending with extensions `.1bpp` are also uncompressed graphics files that can be viewed/edited in TLP - you just have to select the right mode:
- - For .bin graphics files, select View->Format->Genesis
- - For .1bpp graphics files, select View->Format->1bpp
- - Unfortunately, there is no way to view 2bpp format images in TLP. There may be other tools out there that can display these bitmaps.
- - The main font uses a 1bpp, 16x15 pixel character size, which doesn't fit nicely with most tile editors.
- - Images with extensions ending with `.lz77` are compressed with the LZ77 algorithm. A tool will be released very soon to extract and recompress these graphics.
- Palettes are stored in the Sega VDP format - i.e. each colour is made up of two bytes in the following format: 00000bbb0ggg0rrr - where b,g and r are the blue, green and red components respectively.
- Most strings are encoded with the Huffman algorithm. The [Landstalker Translation Tool by Gufino2] (https://www.romhacking.net/utilities/423/) can be used to extract and recompress the string data.
- The game script comprises of a script table (assets_packed\script\script.bin) and source files that index into that script.
- - The script contains a number of 16-bit values, with the following format:
- - - Bit 15 - if set, treat the bottom 11 bits as an index into the string table. Strings are indexed from position 77 onwards: index 0 returns string 77 ("`? Error 7`"). Strings below index 77 are system/debug strings that do not normally appear in gameplay.
- - - If Bit 15 is cleared, this indicates a special function is to take place - see below.
- - - Bit 14 - if set, the textbox is cleared at the end of the character's dialogue.
- - - Bit 13 - if set, stop the script here. Otherwise, continue on to the next entry.
- - - Special actions (Bit 15 clear) - The value of bits 10-12 are used to determine the action, and bits 0-9 determine the parameter:
- - - - Actions 0-3: Load the parameter into item variables 0,1,2 or 3 respectively. These are used to recall the name of an item during speech, or for the player to receive items.
- - - - Action 4: Load the parameter into the numeric variable. This is used to recall a numeric value during speech, or for the player to receive money.
- - - - Action 5: If the parameter is below 1000 in decimal, set the game flag corresponding to parameter.
- - - - - If the parameter is equal to 1000, give the player the item in item variable slot 0.
- - - - - If the parameter is equal to 1001, give the player `numeric variable` golds.
- - - - - If the parameter is equal to 1002 or 1003, play the music tracks "Heh Heh, I Think I Will Disrupt This Good Cheer" or "Black Market" respectively.
- - - - Action 6: If the parameter is below 1000, set the current speaker to the character indicated by the parameter.
- - - - - Otherwise, set the current speaker to a special character - e.g. 1000 - Nigel, 1001 - Friday, etc.
- - - - Action 7: Jump to the function CSA_XXXX, where XXXX is the value of the parameter in hex.
- Maps: my other project - Landstalker Graphics Viewer (github.com/lordmir/landstalker_gfx) can be used to view the various maps and sprites in the game. There will be enhancements made to the viewer in the future to turn it into a full editor.
