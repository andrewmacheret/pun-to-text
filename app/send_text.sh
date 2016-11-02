#!/bin/bash -e

error() {
  echo "$1" 1>&2
  exit 1
}

[[ "$#" -gt 1 ]] || error "At least one topic is required"

MESSAGE="$1"; shift

AWS="$( which aws )"

AWS_SERVICE="sns"
[[ "AWS_PARTITION" != "" ]] || error "AWS_PARTITION is not set - should be set to something like 'aws'"
[[ "AWS_REGION" != "" ]] || error "AWS_REGION is not set - should be set to something like 'us-east-1'"
[[ "AWS_ACCOUNT_ID" != "" ]] || error "AWS_ACCOUNT_ID is not set - should be set to something like '515875352897'"

for AWS_TOPIC in "$@"; do
  AWS_TOPIC_ARN="arn:${AWS_PARTITION}:${AWS_SERVICE}:${AWS_REGION}:${AWS_ACCOUNT_ID}:${AWS_TOPIC}"

  "$AWS" sns publish --topic-arn "${AWS_TOPIC_ARN}" --message "$MESSAGE"
done
