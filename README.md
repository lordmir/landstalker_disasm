# landstalker_disasm

Disassemblies of Landstalker ROMs.

## Build instructions

- Run the `build.bat` (Windows) or `build.sh` (Linux) script - this will assemble the previously disassembled files. If no changes have been made to the disassembly, you should end up with a file identical to the various release ROMs.
- The following command line parameters can be passed to the build script:
    - `-r`: Specify ROM region. Can be one of `JP`, `US`, `EUR`, `FR`, `DE` or `BETA`.
    - `-e`: Build a 4MByte expanded ROM. This increases the size of the ROM to 4 Megabytes, significantly increasing the available storage space for modifications.
    - `-o`: Specify the output ROM filename.

*Note:* Linux users will need to install `wine` in order to build the ROM. Python is required for generating the ROM checksum.

Enjoy!

## Credits

- [Wiz](https://github.com/wizardwhosaysni) for his excellent work on disassembling the Shining Force II audio driver. This project would have taken a lot longer to complete without his work.

## Notes on disassembly

- The [Landstalker Editor](https://github.com/lordmir/landstalker_editor) is designed to work on this disassembly. It can detect, decompress, edit and recompress the various assets.
