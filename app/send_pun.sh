#!/bin/bash -e

AWS="$( which aws )"
CURL="$( which curl )"

PUN="$( "$CURL" -s -H "Accept: text/plain" https://pun.andrewmacheret.com )"

if [[ $PUN == "" ]]; then
  exit 1
fi

#AWS_TOPIC="arn:aws:sns:us-east-1:515875352897:a1-test"

"$AWS" sns publish --topic-arn "$AWS_TOPIC" --message "$PUN"
