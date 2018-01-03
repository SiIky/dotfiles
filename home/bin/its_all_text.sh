#!/usr/bin/env bash
if $(hash nvim 2> /dev/null); then
    exec st -c VIM -t VIM -n VIM nvim "$@"
elif $(hash vim 2> /dev/null); then
    exec st -c VIM -t VIM -n VIM vim "$@"
else
    exec st -c VIM -t VIM -n VIM vi "$@"
fi
