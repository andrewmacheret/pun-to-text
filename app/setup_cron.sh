#!/bin/bash -e

cd "$( dirname "${BASH_SOURCE[0]}" )"
basedir="$( pwd )"

line="0 16 * * * /root/send_pun.sh >/dev/null 2>&1"

# Only add the line if it doesn't exist yet
if ! (crontab -l | fgrep "$line" >/dev/null); then
  echo "Adding following line to crontab: $line"
  (crontab -l 2>/dev/null ; echo "$line") | crontab -
fi
