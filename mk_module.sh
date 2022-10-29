#!/bin/bash

## Inject YouTube
## ipdev @ xda-developers

# Set main variables
DATE=$(date '+%Y%m%d')
TDIR=$(pwd)
SDIR="$TDIR"/staging
OUT="$TDIR"/out/"$DATE"

# Set additional variables
## None

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
		elif [ $MODID = d ]; then
			BUZD=""$OUT"/"$BACKUPFILE"";
		fi;
	fi;
}

change_log() {
	echo "## YouTube v"$VNAME"" >update.md;
	echo "" >>update.md;
	echo "- Module updated to YouTube v"$VNAME"" >>update.md;
	echo "- Requires YouTube to be updated to v"$VNAME" also." >>update.md;
}

create_json() {
	JSON="$TDIR"/iyt"$MODID".json

	echo "{" >"$JSON";
	echo "  \"versionCode\": \""$VCODE"\"," >>"$JSON";
	echo "  \"version\": \"Module\"," >>"$JSON";
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

# get_app_abi() {
# 	ABI=$(aapt dump badging "$i" | grep native-code | cut -f2 -d "'" | cut -f2 -d "-");
# 	if [ "$ABI" = "v7a" ]; then
# 		ARCH=arm
# 	elif [ "$ABI" = "v8a" ]; then
# 		ARCH=arm64
# 	fi
# }

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

set_mod_id() {
	if [ $NAME = iYT ]; then
		if [ $i = black.apk ]; then
			MODID=b
			THEME="Black"
		elif [ $i = dark.apk ]; then
			MODID=d
			THEME="Dark"
		fi
	fi;
}

zip_yt(){
	echo ""
	echo "iYT ("$THEME")."
	cp -rf META-INF "$SDIR"
	cp customize.sh "$SDIR"
	cp post-fs-data.sh "$SDIR"
	cp service.sh "$SDIR"
	cp "$i" "$SDIR"/base.apk
	cd "$SDIR"
	get_app_version
	module_prop
	edit_service_script
	ZIPNAME="$NAME"-"$THEME"-v"$VER".zip
	if [ $MODID = b ]; then
		IYTB=""$OUT"/"$ZIPNAME""
	elif [ $MODID = d ]; then
		IYTD=""$OUT"/"$ZIPNAME""
	fi
	zip -r "$ZIPNAME" META-INF/* base.apk customize.sh module.prop post-fs-data.sh service.sh # > /dev/null 2>&1
	backup
	create_json
	change_log
	mv "$ZIPNAME" "$OUT"
	mv update.md "$OUT"
	rm -rf *
	cd "$TDIR"
}

# Check and create directory(s) if needed.
check_dir

# __ Make zip file(s). __
### Modified APK file names..
### YouTube (currently full apk only)
## YouTube black theme 'black.apk'
## YouTube regular theme 'dark.apk'

for i in *.apk; do
	if [ -f "$i" ]; then
		if [ "$(aapt dump badging "$i" | grep version | cut -f2 -d"'")" = "com.google.android.youtube" ]; then
			NAME=iYT
			# get_app_abi
			set_mod_id
			zip_yt
		fi
	fi
done

if [ -z $NAME ]; then
	echo ""; echo "Nothing to do.";
fi;

# Note backup file(s).
if [ -n "$BUZB" ] || [ -n "$BUZD" ]; then
	echo ""; echo "Your previous zip file(s) renamed.";
	if [ -n "$BUZB" ]; then
		echo " iYT Black backup as "$BUZB"";
	fi;
	if [ -n "$BUZD" ]; then
		echo " iYT Dark backup as "$BUZD"";
	fi;
fi;

# Note new file(s).
if [ -n "$IYTB" ] || [ -n "$IYTD" ]; then
	echo ""; echo "New zip file(s).";
	if [ -n "$IYTB" ]; then
		echo " iYT Black saved as "$IYTB"";
	fi;
	if [ -n "$IYTD" ]; then
		echo " iYT Dark saved as "$IYTD"";
	fi;
fi;

# Finish script.
echo ""; echo "Done."; echo "";
exit 0;
