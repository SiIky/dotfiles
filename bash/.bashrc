case $- in
    *i*) ;;
    *) return;;
esac

HISTCONTROL=ignoreboth
HISTSIZE=250
HISTFILESIZE=500

# cool stuff, check `man bash`
shopt -s histappend checkwinsize autocd cdspell cmdhist dirspell dotglob execfail extglob globstar

PS1=$'[\[\033[1;32m\]\u\[\033[0m\]]@[\[\033[0;31m\]\h\[\033[0m\]]:[\[\033[1;34m\]\w\[\033[0m\]]\n[\A] \u21DD '

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

if [ -f $HOME/.config/stuff.sh ]; then
    . $HOME/.config/stuff.sh
fi

stty -ixon
export PATH=$HOME/bin:$PATH
export VISUAL=vim
export EDITOR=vim
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH: # Add libs here
export STEAM_FRAME_FORCE_CLOSE=1
export RANGER_LOAD_DEFAULT_RC=FALSE
if [ -f $HOME/.config/dircolors ]; then
    eval $(dircolors -b $HOME/.config/dircolors)
fi
