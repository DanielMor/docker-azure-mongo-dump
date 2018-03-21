#!/bin/bash

echo "Dump started: $(date)"
set -e

DATE=$(date +%Y%m%d_%H%M)
MONGO_HOST=$1
FILE_PREFIX=$2
FILENAME="$FILE_PREFIX-$DATE.tar.gz"

FILE="/backup/$FILENAME"
OUTPUT="dump/"

mongodump --quiet --host $MONGO_HOST --out $OUTPUT
tar -zcvf $FILE $OUTPUT
rm -rf $OUTPUT

/src/upload.sh $FILE $FILENAME

echo "Dump ended: $(date)"
