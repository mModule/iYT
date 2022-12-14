#!/system/bin/sh

## For compatibility reasons, competing script(s) and file(s) are removed.
## ipdev @ xda-developers

# Module Directory
MDIR=${0%/*}
# Magisk Modules Directory
MMDIR=${MDIR%/*}
# ADB Directory
ADB=${MMDIR%/*}

# Check and remove Vanced YouTube scripts and files.
[[ -f $ADB/post-fs-data.d/vanced.sh ]] && rm $ADB/post-fs-data.d/vanced.sh;
[[ -f $ADB/service.d/vanced.sh ]] && rm $ADB/service.d/vanced.sh;
[[ -d $ADB/Vanced ]] && rm -rf $ADB/Vanced;

# Check and remove ReVanced YouTube scripts and files.
[[ -f $ADB/post-fs-data.d/com.google.android.youtube.sh ]] && rm $ADB/post-fs-data.d/com.google.android.youtube.sh;
[[ -f $ADB/service.d/com.google.android.youtube.sh ]] && rm $ADB/service.d/com.google.android.youtube.sh;
[[ -d /data/local/tmp/revanced-manager/com.google.android.youtube ]] && rm -rf /data/local/tmp/revanced-manager/com.google.android.youtube;

# Check and remove ReVanced YouTube module.
[[ -f $ADB/com.google.android.youtube_rv.apk ]] && rm $ADB/com.google.android.youtube_rv.apk;
[[ -d $MMDIR/ytrv-magisk ]] && rm -rf $MMDIR/ytrv-magisk;

# Check and remove old iYT modules.
[[ -d $MMDIR/iytb ]] && rm -rf $MMDIR/iytb;
[[ -d $MMDIR/iytd ]] && rm -rf $MMDIR/iytd;
