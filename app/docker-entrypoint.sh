#!/bin/bash -e

./setup_cron.sh

# start cron service
crond -b -L /var/log/cron

exec "$@"
