#!/bin/bash

wine tools/build/asm68k.exe /p /o ae-,e+,w+,c+,op+,os+,ow+,oz+,l_ /e EXPANDED=1 landstalker_us_expanded.asm,landstalker_expanded.bin
python3 tools/build/fix_checksum.py landstalker_expanded.bin
