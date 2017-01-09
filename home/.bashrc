# fun for the whole family
# `telnet nyancat.dakko.us`

case $- in
    *i*) ;;
    *) return;;
esac

# cool stuff, check `man bash`
shopt -s autocd cdspell checkhash checkjobs checkwinsize cmdhist direxpand dirspell dotglob execfail extglob globstar histappend hostcomplete no_empty_cmd_completion nocaseglob progcomp
stty -ixon

# fancy prompt
export PS1=$'\u250F[\[\033[1;32m\]\u\[\033[0m\]]@[\[\033[0;31m\]\h\[\033[0m\]]:[\[\033[1;34m\]\w\[\033[0m\]]\n\u2517[\A] ($?) \u21DD '
export PS2=$'\u21AA '

export HISTCONTROL=ignoreboth
export HISTFILE=$HOME/.config/bash_history
export HISTFILESIZE=500
export HISTSIZE=250

export ABDUCO_SOCKET_DIR=$HOME/.config/abduco # directory abduco will use to save sessions
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH # Add libs here
export PATH=$HOME/bin:$PATH:$HOME/.cargo/bin
export RANGER_LOAD_DEFAULT_RC=FALSE
export STEAM_FRAME_FORCE_CLOSE=1 # prevent steam from closing when clicking the X button
export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

export EDITOR=vim
export VISUAL=vim

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

[ -f $HOME/.config/extras.sh ] && source $HOME/.config/extras.sh
[ -f $HOME/.config/dircolors ] && eval $(dircolors -b $HOME/.config/dircolors)
[ -f $HOME/.config/aliases.sh ] && source $HOME/.config/aliases.sh
[ -f $HOME/.config/stuff.sh ] && source $HOME/.config/stuff.sh # load extra stuff (i.e. not ont the public repo)
[ -f $HOME/.config/pomodoro/pomodoro.sh ] && source $HOME/.config/pomodoro/pomodoro.sh # load the pomodoro script
[ -f $HOME/projects/minoca/minoca.sh ] && source $HOME/projects/minoca/minoca.sh # stuff for minoca
