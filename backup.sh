#!/bin/bash

set -e

TODAY=$(date +%Y-%m-%d)
BACKUP_DIR="/backup/$TODAY"
S3_BUCKET=${S3_BUCKET}
MONGO_URI=${MONGO_URI}

mongodump --uri="${MONGO_URI}" --out="${BACKUP_DIR}"

aws s3 cp --recursive "${BACKUP_DIR}" "s3://${S3_BUCKET}/${TODAY}/"

rm -rf "${BACKUP_DIR}"
