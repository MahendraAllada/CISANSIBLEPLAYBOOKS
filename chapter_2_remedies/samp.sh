#!/bin/sh
for BucketName in `aws s3api list-buckets | jq '.Buckets[].Name' | sed 's/"//g'`;
do
if [ "$(aws s3api put-bucket-policy --bucket $BucketName --policy file://policy.json)" ]; then
echo "Passed"
elso
echo "Failed"
fi
done
