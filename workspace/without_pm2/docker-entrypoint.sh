#!/bin/sh
set -e

/usr/sbin/sshd

exec "$@"