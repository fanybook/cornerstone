#!/bin/sh
set -e

# parameters
SSH_ROOT_PWD=${SSH_ROOT_PWD:-"mydock123!@#"}

echo "root:$SSH_ROOT_PWD" | chpasswd
/usr/sbin/sshd

chown -R www-data:www-data /home/www-data

su-exec www-data pm2 update

exec su-exec www-data "$@"
