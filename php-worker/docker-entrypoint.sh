#!/bin/sh
set -e

# parameters
SSH_ROOT_PWD=${SSH_ROOT_PWD:-"mydock123!@#"}

echo "root:$SSH_ROOT_PWD" | chpasswd

chown -R www-data:www-data /home/www-data
su-exec www-data pm2 start /etc/pm2/pm2process.yml

exec "$@"
