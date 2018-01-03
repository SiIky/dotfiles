#!/usr/bin/env sh
wget 'https://st.suckless.org/patches/hidecursor/st-hidecursor-20170404-745c40f.diff' -O - | git apply -
make clean all
sudo make clean install
