#!/bin/sh
set -e

# parameters
SSH_ROOT_PWD=${SSH_ROOT_PWD:-"mydock123!@#"}

echo "root:$SSH_ROOT_PWD" | chpasswd

/usr/sbin/sshd && crond -l 2

chown -R www-data:www-data /home/www-data

exec su-exec www-data "$@"