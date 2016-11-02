#!/bin/bash -e

error() {
  echo "$1" 1>&2
  exit 1
}

[[ "$#" -gt 0 ]] || error "At least one topic is required"

CURL="$( which curl )"

PUN="$( "$CURL" -s -H "Accept: text/plain" https://pun.andrewmacheret.com )"

[[ $PUN != "" ]] || error "PUN is empty"

./send_text.sh "$PUN" "$@"
