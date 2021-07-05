#!/bin/sh
if [ "$1" ]
then
  file_path=$1
  file_name=$(basename "$file_path")
  DEVICE=$(echo $TARGET_PRODUCT | cut -d "_" -f2)
  if [ -f $file_path ]; then
    file_size=$(stat -c%s $file_path)
    id=$(cat "$file_path.md5sum" | cut -d' ' -f1)
    datetime=$(grep ro\.build\.date\.utc ./out/target/product/$DEVICE/system/build.prop | cut -d= -f2);
    styx_version=$(grep org\.styxproject\.version ./out/target/product/$DEVICE/system/build.prop | cut -d= -f2 | cut -d "v" -f2);
    custom_build_type=$(grep org\.styxproject\.release_type ./out/target/product/$DEVICE/system/build.prop | cut -d= -f2);
    echo "{\n  \"response\": [\n    {\n      \"datetime\": $datetime,\n      \"filename\": \"$file_name\",\n      \"id\": \"$id\",\n      \"romtype\": \"$custom_build_type\",\n      \"size\": $file_size,\n      \"url\": \"https://sourceforge.net/projects/styx-os/files/Athena/release/$DEVICE/$file_name\",\n      \"version\": \"$styx_version\"\n    }\n  ]\n}" > $file_path.json
  fi
fi
