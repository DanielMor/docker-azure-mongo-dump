#!/bin/bash

docker run \
  -e MONGO_HOST=mongo:27017 \
  -e BACKUP_FILENAME=file-prefix \
  -e AZURE_STORAGE_CONTAINER= \
  -e AZURE_STORAGE_ACCOUNT= \
  -e AZURE_STORAGE_ACCESS_KEY= \
  -e CRON_SCHEDULE="* * * * *" \
  --link mongo:mongo \
  azure-mongo-dump