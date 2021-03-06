#!/bin/bash

echo "Mongo dump setup"

LOGFIFO='/var/log/cron.log'
touch "$LOGFIFO"

CRON_ENV="AZURE_STORAGE_CONTAINER='$AZURE_STORAGE_CONTAINER'"
CRON_ENV="$CRON_ENV\nAZURE_STORAGE_ACCOUNT='$AZURE_STORAGE_ACCOUNT'"
CRON_ENV="$CRON_ENV\nAZURE_STORAGE_ACCESS_KEY='$AZURE_STORAGE_ACCESS_KEY'"
FILE_PREFIX=${BACKUP_FILENAME:-"db-backup"}

echo -e "$CRON_ENV\n $CRON_SCHEDULE /src/dump.sh $MONGO_HOST $FILE_PREFIX > $LOGFIFO 2>&1" | crontab -
cron

tail -f "$LOGFIFO" 2>/dev/null