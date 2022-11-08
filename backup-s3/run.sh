#!/bin/sh

ENDPOINT=`jq -r .awsendpoint /data/options.json`
KEY=`jq -r .awskey /data/options.json`
SECRET=`jq -r .awssecret /data/options.json`
BUCKET=`jq -r .bucketname /data/options.json`

now="$(date +'%d/%m/%Y - %H:%M:%S')"

echo $now

aws configure set aws_access_key_id ${KEY}
aws configure set aws_secret_access_key ${SECRET}
aws configure set plugins.endpoint awscli_plugin_endpoint

aws s3 sync /backup/ s3://${BUCKET}/  --delete --endpoint-url ${ENDPOINT}

echo "Done"
