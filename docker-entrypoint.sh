#!/usr/bin/env bash

if [ ! -z "$REDIS_GROUPID" ] && [ ! -z "$REDIS_USERID" ]
then
    sed -i -e "s/^\(redis:[^:]\):[0-9]*:/\1:$REDIS_GROUPID:/" /etc/group
    sed -i -e "s/^\(redis:[^:]\):[0-9]*:[0-9]*:/\1:$REDIS_USERID:$REDIS_GROUPID:/" /etc/passwd
fi

redis-server
