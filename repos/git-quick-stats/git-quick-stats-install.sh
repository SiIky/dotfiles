#!/usr/bin/env sh
ex Makefile -c "g/^prefix/s/^.*$/prefix=\$(HOME)/" +x && make install
