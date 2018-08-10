#!/bin/sh
set -e

/usr/sbin/sshd
chown -R www-data /home/www-data

exec su-exec www-data "$@"
