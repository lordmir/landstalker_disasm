#!/bin/bash

wine tools/build/asm68k.exe /p /o ae-,e+,w+,c+,op+,os+,ow+,oz+,l_ /e EXPANDED=0 landstalker_us.asm,landstalker.bin
python3 tools/build/fix_checksum.py landstalker.bin

