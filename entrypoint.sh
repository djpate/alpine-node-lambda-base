#!/bin/sh
if [ -z "${AWS_LAMBDA_RUNTIME_API}" ]; then
  /usr/local/bin/aws-lambda-rie /usr/local/bin/aws-lambda-ric $1
else
  /usr/local/bin/aws-lambda-ric $1
fi