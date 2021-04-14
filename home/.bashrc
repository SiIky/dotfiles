case $- in
    *i*) ;;
    *) return;;
esac

# cool stuff, check `man bash`
shopt -s autocd cdspell checkhash checkjobs checkwinsize cmdhist direxpand dirspell dotglob execfail extglob globstar histappend hostcomplete no_empty_cmd_completion nocaseglob progcomp
stty -ixon

# fancy prompt
export PS1=$'[\033[1;32m\u\033[0m@\033[0;31m\H\033[0m:\033[1;34m\w\033[0m] $(__git_ps1 "(%s)")\n[\A] ($?) '
export PS2=$'\u21AA '

export HISTCONTROL=ignoreboth
export HISTFILE=$HOME/.config/bash_history
export HISTFILESIZE=500
export HISTSIZE=250

# directory abduco will use to save sessions
export ABDUCO_SOCKET_DIR=$HOME/.config
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export MOSH_PREDICTION_DISPLAY=always

# prevent steam from closing when clicking the X button
export STEAM_FRAME_FORCE_CLOSE=1

if $(hash nvim); then
    export EDITOR=nvim
    export VISUAL=nvim
else
    export EDITOR=vim
    export VISUAL=vim
fi

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env
[ -f $HOME/.config/stuff/git-prompt.sh ] && source $HOME/.config/stuff/git-prompt.sh
[ -f $HOME/.config/stuff/extras.sh ] && source $HOME/.config/stuff/extras.sh
[ -f $HOME/.config/stuff/dircolors ] && eval $(dircolors -b $HOME/.config/stuff/dircolors)
[ -f $HOME/.config/stuff/aliases.sh ] && source $HOME/.config/stuff/aliases.sh
[ -f $HOME/.config/stuff/stuff.sh ] && source $HOME/.config/stuff/stuff.sh # load extra stuff (i.e. not on the public repo)
[ -f $HOME/.config/pomodoro/pomodoro.sh ] && source $HOME/.config/pomodoro/pomodoro.sh # load the pomodoro script
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library/
export _JAVA_AWT_WM_NONREPARENTING=1
export ERL_AFLAGS="-kernel shell_history enabled"
export CHICKEN_DOC_COLORS=auto

# For `chicken-install -test` with the `test` egg
export TEST_USE_ANSI=1

# Because I can never remember these...
# sshfs -C -oidmap=user,reconnect,cache=yes,kernel_cache,compression=yes host:/remote/path/ /local/path/
# rsync -e ssh -ahPzvv --stats host:/path/ .

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
