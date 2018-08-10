#!/bin/sh
set -e

/usr/sbin/sshd && crond -l 2
chown -R www-data:www-data /home/www-data

exec su-exec www-data "$@"