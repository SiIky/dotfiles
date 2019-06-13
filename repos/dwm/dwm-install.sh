#!/usr/bin/env sh
wget --continue 'https://dwm.suckless.org/patches/movestack/dwm-movestack-6.1.diff' -O movestack.diff
wget --continue 'https://dwm.suckless.org/patches/pertag/dwm-pertag-20170513-ceac8c9.diff' -O pertag.diff
make clean all
sudo make clean install
