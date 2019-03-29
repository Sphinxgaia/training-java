#!/bin/bash
set -e
cat /tmp/txt

if [ "$1" = 'java' ]; then
    echo "Welcome, my name is : $(cat /etc/hostname)"
    java -version
    exec "$@"
fi

exec "$@"