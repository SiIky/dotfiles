#!/usr/bin/env sh
# script run by slstatus to show the song currently playing on cmus
F=/tmp/cmus-status

if ps -C cmus > /dev/null; then
    [ -f "$F" ] && cat "$F"
else
    [ -f "$F" ] && rm "$F"
fi
