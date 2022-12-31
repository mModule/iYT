#!/system/bin/sh

## This script is part of the iYT module project.
## ipdev @ xda-developers

# __ Define variables. __

### Magisk variables
## MODPATH (path): the path where your module files should be installed.

# Mount Directory
MNTDIR=/data/adb/iyt

# __ Define functions. __

### Magisk functions
## set_perm <target> <owner> <group> <permission> [context]

# __ Here we go. __

# Check and remove the previous version.
if [ -d "$MNTDIR" ]; then
    rm -rf "$MNTDIR"
fi

# Move the modified apk file out of the module folder.
mkdir "$MNTDIR"
mv "$MODPATH"/base.apk "$MNTDIR"

# __ Finish and Cleanup. __

# Set owner, group, permission and security.
set_perm "$MNTDIR"/base.apk 1000 1000 0644 u:object_r:system_file:s0
# Correct permissions of the script file(s).
for i in "$MODPATH"/*.sh; do
    chmod 0755 $i
done
