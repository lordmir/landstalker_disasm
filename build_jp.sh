#!/bin/bash

wine tools/build/asm68k.exe /p /o ae-,e+,w+,c+,op+,os+,ow+,oz+,l_ /e EXPANDED=0 landstalker_jp.asm,landstalker_jp.bin
python3 tools/build/fix_checksum.py landstalker_jp.bin

