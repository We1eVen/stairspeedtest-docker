#!/bin/bash
cd "$(dirname "$0")"
if [ "$THREAD" != "4" ]; then
   sed -i "s/thread_count=4/thread_count=$THREAD/g" pref.ini
fi
tools/gui/websocketd --port=$PORT --maxforks=$MAXFORKS --staticdir=tools/gui ./stairspeedtest /rpc
