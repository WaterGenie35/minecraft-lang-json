#!/bin/bash
#
# Description: Minecraft Music Extractor
# See https://minecraft.wiki/w/Tutorials/Sound_directory#Extracting_Minecraft_music_on_Linux

#USER_DIR=$(echo ~ | grep "/")
MINECRAFT_ASSETS_DIR="./"
OUTPUT_DIR="./out"

JSON_FILE="./indexes/3.json"

# Version doesn't exist = Can't run
if [ ! -f $JSON_FILE ]; then
	echo -e "Unable to extract because that version isn't downloaded or doesn't exist without orgins."
	echo -e "Make sure to open the launcher and download the version you need to create a pack for.\n"
	read -p "Press [Enter] key to continue..." && exit
fi

#for ENTRY in `cat "$JSON_FILE" | python -c 'import sys,json; from pprint import pprint; data = json.load(sys.stdin); pprint(data);' | grep music | awk -F\' '{print $2 "," $6}'`
#cat "$JSON_FILE" | python -c 'import sys,json; from pprint import pprint; data = json.load(sys.stdin); pprint(data);'
#cat "$JSON_FILE" | python -c 'import sys,json; from pprint import pprint; data = json.load(sys.stdin); pprint(data);' | grep music


# for ENTRY in `cat "$JSON_FILE" | python3 -c 'import sys,json; from pprint import pprint; data = json.load(sys.stdin); pprint(data);' | grep sounds | awk -F\' '{print $2 "," $6}'`
for ENTRY in `cat "$JSON_FILE" | python3 -c 'import sys,json; from pprint import pprint; data = json.load(sys.stdin); pprint(data);' | grep lang | awk -F\' '{print $2 "," $6}'`
do
	echo "Processing $ENTRY..."
	echo $ENTRY | cut -d, -f1
	FILENAME=`echo $ENTRY | cut -d, -f1`
	FILEHASH=`echo $ENTRY | cut -d, -f2`

	#Locate the file in the assets directory structure
	FULLPATH_HASHFILE=`find "$MINECRAFT_ASSETS_DIR" -name $FILEHASH`

	#Copy the file

	mkdir -p  $OUTPUT_DIR/`echo $FILENAME | sed -E 's/\/[a-z0-9_]+\..+//'`
	cp "$FULLPATH_HASHFILE" "$OUTPUT_DIR/$FILENAME"

done