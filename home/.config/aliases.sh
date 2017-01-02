alias exit='while true; do echo "^D scrub"; sleep 0.5; done'

LS='ls --group-directories-first --color=auto'
alias l='$LS -CF'
alias ls='$LS -ABCF'
alias lh='$LS -ABFGghl'
alias ll='$LS -AFl'

VIM='vim -p'
alias ed='$VIM'
alias vi='$VIM'
alias vim='$VIM'
alias vimup='vim +PlugUpgrade +PlugClean +PlugInstall +PlugUpdate'

# Git aliases (if no hub replace with git)
if [ -f ~/bin/hub ]; then
    GIT='hub'
else
    GIT='git'
fi

if [ -f ~/.config/hub/hub.bash_completion.sh ]; then
    . ~/.config/hub/hub.bash_completion.sh
fi

alias git='$GIT'
alias gadd='$GIT add'
alias gmv='$GIT mv'
alias grm='$GIT rm'
alias glog='$GIT log'
alias gcommit='$GIT commit -v'
alias gpush='$GIT push'
alias gpull='$GIT pull --stat'
alias gstatus='$GIT status'
alias gdiff='$GIT diff'
alias gblame='$GIT blame'
alias gclone='$GIT clone'
alias gconfig='$GIT config'

alias cp='cp -ri'
alias mv='mv -i'
alias rm='rm -ri'
alias detox='detox -f ~/.config/detoxrc'
alias less='less -N'
alias lessn='less'
alias lynx='lynx -vikeys'
alias mk='make'
alias tmux='tmux -2u'
alias wget='wget -c'
alias mpv='mpv --fs --no-audio-display'
