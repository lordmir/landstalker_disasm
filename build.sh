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
        *) echo "Usage: ${0} [-r (US|JP)] [-e] [-o <Output ROM Filename>]";;
    esac
done

# Options
if [ ${REGION} == "US" ]; then
    if [ ${EXPANDED} -eq 1 ]; then
        SOURCE="landstalker_us_expanded.asm"
        OUTPUT="landstalker_us_expanded.bin"
    else
        SOURCE="landstalker_us.asm"
        OUTPUT="landstalker_us.bin"
    fi
    REGION_CODE=0
    ENABLE_REGION_CHECK=1
    FIX_COLLISION_GLITCH=1
    FIX_ARMLET_SKIP=1
    FIX_EINSTEIN_WHISTLE_FLAG_CHECK=1
    FIX_SPRITE_HIDE_BUG=1
    ENABLE_GOLD_COUNTUP_ON_TREASURE=1
    FIX_POTENTIAL_CORRUPTION_ON_GOLA=1
    FIX_GOLD_CAP_ON_FILE_LOAD=1
elif [ ${REGION} == "JP" ]; then
    if [ ${EXPANDED} -eq 1 ]; then
        SOURCE="landstalker_jp_expanded.asm"
        OUTPUT="landstalker_jp_expanded.bin"
    else
        SOURCE="landstalker_jp.asm"
        OUTPUT="landstalker_jp.bin"
    fi
    REGION_CODE=1
    ENABLE_REGION_CHECK=0
    FIX_COLLISION_GLITCH=0
    FIX_ARMLET_SKIP=0
    FIX_EINSTEIN_WHISTLE_FLAG_CHECK=0
    FIX_SPRITE_HIDE_BUG=0
    ENABLE_GOLD_COUNTUP_ON_TREASURE=0
    FIX_POTENTIAL_CORRUPTION_ON_GOLA=0
    FIX_GOLD_CAP_ON_FILE_LOAD=0
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
DEFINES=${DEFINES}";ENABLE_REGION_CHECK="${ENABLE_REGION_CHECK}
DEFINES=${DEFINES}";FIX_COLLISION_GLITCH="${FIX_COLLISION_GLITCH}
DEFINES=${DEFINES}";FIX_ARMLET_SKIP="${FIX_ARMLET_SKIP}
DEFINES=${DEFINES}";FIX_EINSTEIN_WHISTLE_FLAG_CHECK="${FIX_EINSTEIN_WHISTLE_FLAG_CHECK}
DEFINES=${DEFINES}";FIX_SPRITE_HIDE_BUG="${FIX_SPRITE_HIDE_BUG}
DEFINES=${DEFINES}";ENABLE_GOLD_COUNTUP_ON_TREASURE="${ENABLE_GOLD_COUNTUP_ON_TREASURE}
DEFINES=${DEFINES}";FIX_POTENTIAL_CORRUPTION_ON_GOLA="${FIX_POTENTIAL_CORRUPTION_ON_GOLA}
DEFINES=${DEFINES}";FIX_GOLD_CAP_ON_FILE_LOAD="${FIX_GOLD_CAP_ON_FILE_LOAD}

echo ${AS} ${STANDARD_BUILDOPTS} ${DEFINES} ${SOURCE},${OUTPUT}

${AS} ${STANDARD_BUILDOPTS} ${DEFINES} ${SOURCE},${OUTPUT}
python3 tools/build/fix_checksum.py ${OUTPUT}

