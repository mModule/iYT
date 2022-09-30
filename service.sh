#!/system/bin/sh

## Mount a modified YouTube over stock YouTube.
## ipdev @ xda-developers

## Requires YouTube to be installed as a user app.
## Required YouTube version is 17.03.38

# Module directory set by Magisk.
MODDIR=${0%/*}

# Required YT versionCode.
RYTVC=1527248320

# Get SDK level and architecture.
SDK=$(getprop ro.build.version.sdk);
# ARCH=$(getprop ro.product.cpu.abi);

# Find and set YouTube path.
if [ $SDK -ge 30 ]; then
	YTPATH=$(readlink -f /data/app/*/com.google.android.youtube*/lib | sed 's/\/lib//g');
else
	YTPATH=$(readlink -f /data/app/com.google.android.youtube*/lib | sed 's/\/lib//g');
fi;

# Check YouTube path.
if [ ! -f $YTPATH/base.apk ]; then
	echo "$(date '+%Y%m%d_%H%M')" "No user installed YouTube path found." >>$MODDIR/error.log;
	YTMOD=ABORT;
fi;

# Find installed (active) YouTube versionCode.
if [ -z $YTMOD ]; then
	while [ -z $YTVCODE ]; do
		YTVCODE=$(dumpsys package com.google.android.youtube | grep versionCode | cut -f2 -d'=' | tr -d '\n' | cut -f1 -d' ');
		# sleep 1;
		date +%N > /dev/null;
	done;
fi;

# Check YouTube versionCode.
if [ ! $YTVCODE = $RYTVC ]; then
	echo "$(date '+%Y%m%d_%H%M')" "Wrong version of YouTube found." >>$MODDIR/error.log;
	YTMOD=ABORT;
elif [ -z $YTVCODE ]; then
	echo "$(date '+%Y%m%d_%H%M')" "No user installed version of YouTube found." >>$MODDIR/error.log;
	YTMOD=ABORT;
fi;

# Mount if failsafe(s) pass.
if [ -z $YTMOD ]; then
	# su -c mount -o bind $MODDIR/base.apk $YTPATH/base.apk;
	su -c mount $MODDIR/base.apk $YTPATH/base.apk;
fi;
