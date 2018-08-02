docker-mongodb-s3-backup
============

# Description
Backup your MongoDB to your Amazon S3 bucket.


# Build image

    docker build -t adhook/docker-mongodb-s3-backup .

# Usage

    docker run -i \
        -e AWS_KEY=<<YOUR_AWS_KEY>> \
        -e AWS_SECRET=<<YOUR_AWS_SECRET>> \
        -e MONGO_HOST=<<MONGODB_SERVER:MONGODB_PORT>> \
        -e MONGO_DATABASE=<<DATABASE_NAME>> \
        -e MONGO_USER=<<DATABASE_USER>> \
        -e MONGO_PASSWORD=<<DATABASE_PW>> \ 
        -e S3_BUCKET_NAME=<<S3_BUCKET_NAME>> \
        --rm \
        adhook/docker-mongodb-s3-backup \

The params ```MONGO_USER``` and ```MONGO_PASSWORD``` are optional.

👉 The container will be deleted after the backup (`--rm` Option).



# Create a cronjob

    crontab -e 

    # m h  dom mon dow   command
    30 2 * * * docker run -i -e AWS_KEY=<<YOUR_AWS_KEY>> -e AWS_SECRET=<<YOUR_AWS_SECRET>> -e MONGO_HOST=<<MONGODB_SERVER:MONGODB_PORT>> -e MONGO_DATABASE=<<DATABASE_NAME>> -e MONGO_USER=<<DATABASE_USER>> -e MONGO_PASSWORD=<<DATABASE_PW>> -e S3_BUCKET_NAME=<<S3_BUCKET_NAME>> --rm adhook/docker-mongodb-s3-backup

    
