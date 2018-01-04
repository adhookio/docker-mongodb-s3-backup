docker-mongodb-s3-backup
============

# Description
Backup your MongoDB to your Amazon S3 bucket.


# Usage

    docker run -i \
        -e aws_key=<<YOUR_AWS_KEY>> \
        -e aws_secret=<<YOUR_AWS_SECRET>> \
        -e MONGO_HOST=<<MONGODB_SERVER:MONGODB_PORT>> \
        -e MONGO_DATABASE=<<DATABASE_NAME>> \
        -e MONGO_USER=<<DATABASE_USER>> \
        -e MONGO_PASSWORD=<<DATABASE_PW>> \ 
        -e S3_BUCKET_NAME=<<S3_BUCKET_NAME>> \
        adhook/docker-mongodb-s3-backup \
