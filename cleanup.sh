#!/bin/bash

set -e;

M=/mnt;
P=/build;
H=$(hostname);
T=600;
V=patchy;


function cleanup()
{
    killall -15 glusterfs glusterfsd glusterd glusterd 2>&1 || true;
    killall -9 glusterfs glusterfsd glusterd glusterd 2>&1 || true;
    pkill /opt/qa/regression.sh 2>&1
    umount -l $M 2>&1 || true;
    rm -rf /var/lib/glusterd/* /etc/glusterd/* /var/log/glusterfs/* $P/export;
}


function main ()
{
    cleanup;
}

main "$@";
