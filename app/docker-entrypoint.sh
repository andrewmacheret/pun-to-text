#!/bin/bash -e

./setup_cron.sh

exec "$@"
