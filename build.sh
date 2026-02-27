#!/bin/bash
STANDARD_BUILDOPTS="/p /o ae-,e+,w+,c+,op+,os+,ow+,oz+,l_"
AS="wine tools/build/asm68k.exe"
REGION="US"
EXPANDED=0

while getopts r:o:e flag; do
    case "${flag}" in
        r) REGION=${OPTARG};;
        o) MANUAL_OUTPUT=${OPTARG};;
        e) EXPANDED=1;;
        *) echo "Usage: ${0} [-r (US|JP|EUR)] [-e] [-o <Output ROM Filename>]";;
    esac
done

# Options
if [ ${REGION} == "US" ]; then
    if [ ${EXPANDED} -eq 1 ]; then
        SOURCE="landstalker_us_expanded.asm"
        OUTPUT="landstalker_us_expanded.bin"
        SYMBOL="landstalker_us_expanded.sym"
        LISTING="landstalker_us_expanded.lst"
    else
        SOURCE="landstalker_us.asm"
        OUTPUT="landstalker_us.bin"
        SYMBOL="landstalker_us.sym"
        LISTING="landstalker_us.lst"
    fi
    REGION_CODE=0
    NTSC=1
    ENABLE_REGION_CHECK=1
    FIX_COLLISION_GLITCH=1
    FIX_ARMLET_SKIP=1
    FIX_EINSTEIN_WHISTLE_FLAG_CHECK=1
    FIX_SPRITE_HIDE_BUG=1
    ENABLE_GOLD_COUNTUP_ON_TREASURE=1
    FIX_POTENTIAL_CORRUPTION_ON_GOLA=1
    FIX_GOLD_CAP_ON_FILE_LOAD=1
    FIX_END_CREDITS_GLITCH=0
elif [ ${REGION} == "JP" ]; then
    if [ ${EXPANDED} -eq 1 ]; then
        SOURCE="landstalker_jp_expanded.asm"
        OUTPUT="landstalker_jp_expanded.bin"
        SYMBOL="landstalker_jp_expanded.sym"
        LISTING="landstalker_jp_expanded.lst"
    else
        SOURCE="landstalker_jp.asm"
        OUTPUT="landstalker_jp.bin"
        SYMBOL="landstalker_jp.sym"
        LISTING="landstalker_jp.lst"
    fi
    REGION_CODE=1
    NTSC=1
    ENABLE_REGION_CHECK=0
    FIX_COLLISION_GLITCH=0
    FIX_ARMLET_SKIP=0
    FIX_EINSTEIN_WHISTLE_FLAG_CHECK=0
    FIX_SPRITE_HIDE_BUG=0
    ENABLE_GOLD_COUNTUP_ON_TREASURE=0
    FIX_POTENTIAL_CORRUPTION_ON_GOLA=0
    FIX_GOLD_CAP_ON_FILE_LOAD=0
    FIX_END_CREDITS_GLITCH=0
elif [ ${REGION} == "EUR" ]; then
    if [ ${EXPANDED} -eq 1 ]; then
        SOURCE="landstalker_eur_expanded.asm"
        OUTPUT="landstalker_eur_expanded.bin"
        SYMBOL="landstalker_eur_expanded.sym"
        LISTING="landstalker_eur_expanded.lst"
    else
        SOURCE="landstalker_eur.asm"
        OUTPUT="landstalker_eur.bin"
        SYMBOL="landstalker_eur.sym"
        LISTING="landstalker_eur.lst"
    fi
    REGION_CODE=2
    NTSC=0
    ENABLE_REGION_CHECK=1
    FIX_COLLISION_GLITCH=1
    FIX_ARMLET_SKIP=1
    FIX_EINSTEIN_WHISTLE_FLAG_CHECK=1
    FIX_SPRITE_HIDE_BUG=1
    ENABLE_GOLD_COUNTUP_ON_TREASURE=1
    FIX_POTENTIAL_CORRUPTION_ON_GOLA=1
    FIX_GOLD_CAP_ON_FILE_LOAD=1
    FIX_END_CREDITS_GLITCH=1
else
    echo Unsupported Region
    exit 1
fi

if [ -n "${MANUAL_OUTPUT}" ]; then
    OUTPUT=${MANUAL_OUTPUT}
fi

DEFINES="/e "
DEFINES=${DEFINES}"REGION="${REGION_CODE}
DEFINES=${DEFINES}";EXPANDED="${EXPANDED}
DEFINES=${DEFINES}";NTSC="${NTSC}
DEFINES=${DEFINES}";ENABLE_REGION_CHECK="${ENABLE_REGION_CHECK}
DEFINES=${DEFINES}";FIX_COLLISION_GLITCH="${FIX_COLLISION_GLITCH}
DEFINES=${DEFINES}";FIX_ARMLET_SKIP="${FIX_ARMLET_SKIP}
DEFINES=${DEFINES}";FIX_WHISTLE_CHECK="${FIX_EINSTEIN_WHISTLE_FLAG_CHECK}
DEFINES=${DEFINES}";FIX_SPRITE_HIDE_BUG="${FIX_SPRITE_HIDE_BUG}
DEFINES=${DEFINES}";ENABLE_GOLD_COUNT_AT_END="${ENABLE_GOLD_COUNTUP_ON_TREASURE}
DEFINES=${DEFINES}";FIX_GOLA_BUG="${FIX_POTENTIAL_CORRUPTION_ON_GOLA}
DEFINES=${DEFINES}";FIX_GOLD_CAP="${FIX_GOLD_CAP_ON_FILE_LOAD}
DEFINES=${DEFINES}";FIX_END_CREDITS="${FIX_END_CREDITS_GLITCH}

echo ${AS} ${STANDARD_BUILDOPTS} ${DEFINES} ${SOURCE},${OUTPUT},${SYMBOL},${LISTING}

${AS} ${STANDARD_BUILDOPTS} ${DEFINES} ${SOURCE},${OUTPUT},${SYMBOL},${LISTING}
python3 tools/build/fix_checksum.py ${OUTPUT}

