#!/bin/sh
set -e

chown -R www-data /home/www-data

exec su-exec www-data "$@"