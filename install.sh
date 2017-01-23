#!/usr/bin/env sh
for D in *; do
    if [ -d $D ]; then
        echo $D
        cd $D
        [ -d .git ] && git pull
        [ -f $D-install.sh ] && sh $D-install.sh
        cd ..
    fi
done
