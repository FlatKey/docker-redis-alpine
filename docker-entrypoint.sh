#!/bin/sh

if [ ! -z "$REDIS_GROUPID" ] && [ ! -z "$REDIS_USERID" ]
then
    sed -i -e "s/^\(redis:[^:]\):[0-9]*:/\1:$REDIS_GROUPID:/" /etc/group
    sed -i -e "s/^\(redis:[^:]\):[0-9]*:[0-9]*:/\1:$REDIS_USERID:$REDIS_GROUPID:/" /etc/passwd
fi

redis-server &

pids=`jobs -p`

exitcode=0

terminate() {
    for pid in $pids; do
        if ! kill -0 $pid 2>/dev/null; then
            wait $pid
            exitcode=$?
        fi
    done
    kill $pids 2>/dev/null
}

trap terminate CHLD
wait

exit $exitcode
