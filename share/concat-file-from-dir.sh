#!/bin/sh
# the .d directory
DIR="$1"
# the target file
FILE="$2"
# (optional) additional file append to $FILE
ADDITIONAL_FILE_TO_CAT="$3"
cat > $FILE <<EOF 
# WARNING: this file is auto-generated from the files in
#          $DIR
#          on squid-deb-proxy (re)start, do NOT edit here
EOF
if [ -n "$ADDITIONAL_FILE_TO_CAT" ]; then
  cat "$ADDITIONAL_FILE_TO_CAT" >> "$FILE"
fi

for f in "$DIR"/*; do
  cat "$f" >> "$FILE"
done
