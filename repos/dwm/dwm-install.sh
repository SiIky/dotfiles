#!/usr/bin/env sh
wget 'https://dwm.suckless.org/patches/pertag/dwm-pertag-20170513-ceac8c9.diff' -O - | git apply -
make clean all
sudo make clean install
