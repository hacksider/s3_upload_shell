#!/bin/bash

# Set variables
AWS_ACCESS_KEY="<your-aws-access-key>"
AWS_SECRET_KEY="<your-aws-secret-key>"
AWS_REGION="<your-region>"
BUCKET_NAME="<your-bucket-name>"
FOLDER_PATH="<your-folder-path>"
DAYS_TO_KEEP=10

# Upload files to AWS S3
aws configure set aws_access_key_id $AWS_ACCESS_KEY
aws configure set aws_secret_access_key $AWS_SECRET_KEY
aws configure set default.region $AWS_REGION

aws s3 sync $FOLDER_PATH s3://$BUCKET_NAME/$FOLDER_PATH

# Delete files older than 10 days
find $FOLDER_PATH -type f -mtime +$DAYS_TO_KEEP -exec rm {} \;
