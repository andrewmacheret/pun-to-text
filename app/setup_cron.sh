#!/bin/bash -e

# Only proceed if CRON is set (don't error out if it's not set)
if [[ "$CRON" == "" ]]; then
  exit
fi

# Split CRON on ';'
IFS=';' read -ra CRON_SPLIT <<< "$CRON"
for CRON_LINE in "${CRON_SPLIT[@]}"; do

  # Only add the line if it doesn't exist yet
  if ! (crontab -l | fgrep -x "${CRON_LINE}" >/dev/null); then
    echo "Adding following line to crontab:"
    echo "  ${CRON_LINE}"
    (crontab -l 2>/dev/null ; echo "${CRON_LINE}") | crontab -
  else
    echo "The following line was already found in crontab:"
    echo "  ${CRON_LINE}"
  fi

done
