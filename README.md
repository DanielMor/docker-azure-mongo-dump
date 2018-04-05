# docker-azure-mongo-dump
Cron job for mongodump and upload to azure storage

# Description

Docker image that executes native mongodump for mongodb backup. After that uploads an gzip file to an azure storage container.

### Configuration (envs)

- MONGO_HOST: host/ip mongodb
- AZURE_STORAGE_CONTAINER: your storage container
- AZURE_STORAGE_ACCOUNT: your storage account
- AZURE_STORAGE_ACCESS_KEY: your storage key
- CRON_SCHEDULE: cron job to run mongodump
- BACKUP_FILENAME: prefix of file name (default = "db-backup" )

# Usage

```
  docker run \
    -e MONGO_HOST=mongo:27017 \
    -e AZURE_STORAGE_CONTAINER="container-name" \
    -e AZURE_STORAGE_ACCOUNT="storage-name" \
    -e AZURE_STORAGE_ACCESS_KEY="" \
    -e CRON_SCHEDULE="* * * * *" \
    -e BACKUP_FILENAME="db-production" \
    --link mongo:mongo \
    danielmor/azure-mongo-dump

```