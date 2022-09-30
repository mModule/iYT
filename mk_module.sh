#!/bin/bash

## Inject YouTube
## ipdev @ xda-developers

# Set main variables
DATE=$(date '+%Y%m%d')
TDIR=$(pwd)
SDIR="$TDIR"/staging
OUT="$TDIR"/out/"$DATE"

# Set additional variables
NAME=iYT
IYTB=NONE
IYTD=NONE
BUZB=NONE
BUZD=NONE

# Set main functions

check_dir() {
	[[ ! -d $OUT ]] && mkdir -p $OUT;
	[[ ! -d $SDIR ]] && mkdir -p $SDIR;
}

# Set additional functions

backup() {
	if [ -f "$OUT"/"$ZIPNAME" ]; then
		FLTM=$(date -r "$OUT"/"$ZIPNAME" '+%H%M');
		BACKUPFILE=$(printf "$ZIPNAME" | sed 's/.zip/-'"$FLTM".zip'/g');
		mv "$OUT"/"$ZIPNAME" "$OUT"/"$BACKUPFILE";
		if [ $MODID = b ]; then
			BUZB=""$OUT"/"$BACKUPFILE"";
		fi;

		if [ $MODID = d ]; then
			BUZD=""$OUT"/"$BACKUPFILE"";
		fi;
	fi;
}

change_log() {
	echo "## YouTube v"$VNAME"" >update.md;
	echo "" >>update.md;
	echo "- Module updated to YouTube v"$VNAME"" >>update.md;
	# echo "<br>" >>update.md;
	echo "- Requires YouTube to also be updated to v_"$VNAME"_." >>update.md;
}

create_json() {
	JSON="$TDIR"/iyt"$MODID".json

	echo "{" >"$JSON";
	echo "  \"versionCode\": \""$VCODE"\"," >>"$JSON";
	echo "  \"version\": \"Module\"," >>"$JSON";
	# echo "  \"version\": \""$VNAME"\"," >>$JSON;
	echo "  \"zipUrl\": \"https://github.com/mModule/iYT/releases/download/v"$VNAME"/"$ZIPNAME"\"," >>"$JSON";
	echo "  \"changelog\": \"https://github.com/mModule/iYT/releases/download/v"$VNAME"/update.md\"" >>"$JSON";
	echo "}" >>"$JSON";
}

edit_service_script() {
	if [ "$(uname -s)" = Darwin ]; then
		RNAME=$(grep "Required YouTube" service.sh | cut -f6 -d' ');
		sed -i "" s/$RNAME/$VNAME/ service.sh;
		RCODE=$(grep "RYTVC=" service.sh);
		sed -i "" s/$RCODE/RYTVC=$VCODE/ service.sh;
	else
		RNAME=$(grep "Required YouTube" service.sh | cut -f6 -d' ');
		sed -i s/$RNAME/$VNAME/ service.sh;
		RCODE=$(grep "RYTVC=" service.sh);
		sed -i s/$RCODE/RYTVC=$VCODE/ service.sh;
	fi;
}

get_app_version() {
	VCODE=$(aapt dump badging base.apk| grep version | cut -f4 -d"'");
	VNAME=$(aapt dump badging base.apk| grep version | cut -f6 -d"'");
	VER=$(aapt dump badging base.apk| grep version | cut -f6 -d"'" | sed 's/\.//g');
}

module_prop() {
	echo "id=iyt"$MODID"" >>module.prop
	echo "name=Inject YouTube "$THEME"" >>module.prop
	echo "version=Module" >>module.prop
	echo "versionCode="$VCODE"" >>module.prop
	echo "author=ip" >>module.prop
	echo "description=YouTube v"$VNAME" "$THEME" Theme" >>module.prop
	echo "updateJson=https://raw.githubusercontent.com/mModule/iYT/master/iyt"$MODID".json" >>module.prop
}

# Check and create directory(s) if needed.
check_dir

# Make zip file(s).

if [ -f black.apk ]; then
	echo ""; echo "iYT Black";
	MODID=b
	THEME="Black"
	cp -rf META-INF "$SDIR"
	cp customize.sh "$SDIR"
	cp post-fs-data.sh "$SDIR"
	cp service.sh "$SDIR"
	cp black.apk "$SDIR"/base.apk
	cd "$SDIR"
	get_app_version
	module_prop
	edit_service_script
	ZIPNAME="$NAME"-"$THEME"-v"$VER".zip
	IYTB=""$OUT"/"$ZIPNAME""
	zip -r "$ZIPNAME" META-INF/* base.apk customize.sh module.prop post-fs-data.sh service.sh
	backup
	create_json
	change_log
	mv "$ZIPNAME" "$OUT"
	mv update.md "$OUT"
	rm -rf *
	cd "$TDIR"
fi;

if [ -f dark.apk ]; then
	echo ""; echo "iYT Dark";
	MODID=d
	THEME="Dark"
	cp -rf META-INF "$SDIR"
	cp customize.sh "$SDIR"
	cp post-fs-data.sh "$SDIR"
	cp service.sh "$SDIR"
	cp dark.apk "$SDIR"/base.apk
	cd "$SDIR"
	get_app_version
	module_prop
	edit_service_script
	ZIPNAME="$NAME"-"$THEME"-v"$VER".zip
	IYTD=""$OUT"/"$ZIPNAME""
	zip -r "$ZIPNAME" META-INF/* base.apk customize.sh module.prop post-fs-data.sh service.sh
	backup
	create_json
	change_log
	mv "$ZIPNAME" "$OUT"
	mv update.md "$OUT"
	rm -rf *
	cd "$TDIR"
fi;

if [ ! -f black.apk ] | [ ! -f dark.apk ]; then
	echo ""; echo "Nothing to do.";
fi;

# Note backup file(s).
if [ -f $BUZB ] || [ -f $BUZD ]; then
	echo ""; echo "Your previous zip file(s) renamed.";
fi;

if [ -f $BUZB ]; then
	echo " iYT Black backup as "$BUZB"";
fi;

if [ -f $BUZD ]; then
	echo " iYT Dark backup as "$BUZD"";
fi;

# Note new file(s).
if [ -f $IYTB ] || [ -f $IYTD ]; then
	echo ""; echo "New zip file(s).";
fi;

if [ -f $IYTB ]; then
	echo " iYT Black saved as "$IYTB"";
fi;

if [ -f $IYTD ]; then
	echo " iYT Dark saved as "$IYTD"";
fi;

# Finish script.
echo ""; echo "Done."; echo "";
exit 0;
