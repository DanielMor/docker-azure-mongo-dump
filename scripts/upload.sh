#!/bin/bash

FILE=$1
FILENAME=$2
set -e

RESULT=$(az storage container exists \
  -n $AZURE_STORAGE_CONTAINER \
  --account-name $AZURE_STORAGE_ACCOUNT \
  --account-key $AZURE_STORAGE_ACCESS_KEY)

EXIST=$(echo $RESULT | cut -f3 -d " ")

if [ $EXIST == "false" ]
then
  echo "Container does not exist"

  az storage container create \
    -n $AZURE_STORAGE_CONTAINER \
    --account-name $AZURE_STORAGE_ACCOUNT \
    --account-key $AZURE_STORAGE_ACCESS_KEY
else
    echo "Container exists"
fi

echo "Uploading $FILENAME"

az storage blob upload \
    --container-name $AZURE_STORAGE_CONTAINER \
    --name $FILENAME \
    --file $FILE \
    --account-name $AZURE_STORAGE_ACCOUNT \
    --account-key $AZURE_STORAGE_ACCESS_KEY

rm -rf $FILE
