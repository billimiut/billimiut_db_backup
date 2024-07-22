#!/bin/bash

set -e

TODAY=`date +%y-%m-%d`

BACKUP_DIR="$TODAY"

MONGO_URI=${MONGO_URI}
S3_BUCKET=${S3_BUCKET}


mongodump --uri="$MONGO_URI" --out=BACKUP_DIR"

aws s3 cp --recursive "$BACKUP_DIR" "s3://$S3_BUCKET/$TODAY"

rm -rf "$BACKUP_DIR"
