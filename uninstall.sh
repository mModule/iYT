#!/system/bin/sh

## This script is part of the iYT module project.
## ipdev @ xda-developers

## Module directory(s) set by Magisk.
MODDIR=${0%/*}

# Module Directory
MDIR=${0%/*}
# Magisk Modules Directory
MMDIR=${MDIR%/*}
# ADB Directory
ADB=${MMDIR%/*}

# Remove the additional iYT mount directory.
rm -rf "$ADB"/iyt
