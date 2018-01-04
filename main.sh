#!/bin/sh -xe


if [ -z "${AWS_KEY}" ]; then
    echo "The environment variable key is not set. Attempting to create empty creds file to use role."
    aws_key=""
fi

if [ -z "${AWS_SECRET}" ]; then
    echo "The environment variable secret is not set."
    aws_secret=""
fi

TIMESTAMP=`date +%F-%H%M`
S3_BUCKET_PATH="mongodumps"

# Create backup
mongodump -h ${MONGO_HOST} -d ${MONGO_DATABASE} -u ${MONGO_USER} -p ${MONGO_PASSWORD}

# Add timestamp to backup
mv dump mongodb-$TIMESTAMP
tar cf mongodb-$TIMESTAMP.tar mongodb-$TIMESTAMP

# Upload to S3
s3cmd --access_key=${AWS_KEY} --secret_key=${AWS_SECRET} put mongodb-$TIMESTAMP.tar s3://${S3_BUCKET_NAME}/${S3_BUCKET_PATH}/mongodb-$TIMESTAMP.tar

echo "Backup done."
