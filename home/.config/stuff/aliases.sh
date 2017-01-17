alias exit='while true; do echo "^D scrub"; sleep 0.5; done'

# Git aliases (if no hub replace with git)
[ -f $HOME/bin/hub ] && [ -f $HOME/.config/hub/hub.bash_completion.sh ] && source $HOME/.config/hub/hub.bash_completion.sh

function gadd() { GIT='git'; [ -f $HOME/bin/hub ] && GIT='hub'; $GIT add "$@"; }
function gblame() { GIT='git'; [ -f $HOME/bin/hub ] && GIT='hub'; $GIT blame "$@"; }
function gclone() { GIT='git'; [ -f $HOME/bin/hub ] && GIT='hub'; $GIT clone "$@"; }
function gcommit() { GIT='git'; [ -f $HOME/bin/hub ] && GIT='hub'; $GIT commit -v "$@"; }
function gconfig() { GIT='git'; [ -f $HOME/bin/hub ] && GIT='hub'; $GIT config "$@"; }
function gdiff() { GIT='git'; [ -f $HOME/bin/hub ] && GIT='hub'; $GIT diff "$@"; }
function git() { GIT='git'; [ -f $HOME/bin/hub ] && GIT='hub'; $GIT "$@"; }
function glog() { GIT='git'; [ -f $HOME/bin/hub ] && GIT='hub'; $GIT log "$@"; }
function gmv() { GIT='git'; [ -f $HOME/bin/hub ] && GIT='hub'; $GIT mv "$@"; }
function gpull() { GIT='git'; [ -f $HOME/bin/hub ] && GIT='hub'; $GIT pull --stat "$@"; }
function gpush() { GIT='git'; [ -f $HOME/bin/hub ] && GIT='hub'; $GIT push "$@"; }
function grm() { GIT='git'; [ -f $HOME/bin/hub ] && GIT='hub'; $GIT rm "$@"; }
function gstatus() { GIT='git'; [ -f $HOME/bin/hub ] && GIT='hub'; $GIT status "$@"; }

function vi() { command vim -p "$@"; }
function vim() { command vim -p "$@"; }
function vimup() { command vim +PlugUpgrade +PlugClean +PlugInstall +PlugUpdate "$@"; }

function l() { command ls --group-directories-first --color=auto -CF "$@"; }
function lh() { command ls --group-directories-first --color=auto -ABFGghl "$@"; }
function ll() { command ls --group-directories-first --color=auto -AFl "$@"; }
function ls() { command ls --group-directories-first --color=auto -ABCF "$@"; }

function cp() { command cp -ri "$@"; }
function mk() { command make "$@"; }
function mv() { command mv -i "$@"; }
function rm() { command rm -ri "$@"; }

# https://github.com/ogeno/oneliners
function adm() { command abduco -A $(echo "$(abduco | sed -r 's/Active sessions.*//g;s/\*.*//g;s/\t/ /g' | dmenu)" | sed 's/.* //g'); }

function bandit() { TERM=xterm256 ssh bandit$1@bandit.labs.overthewire.org "$@"; }
function detox() { command detox -f $HOME/.config/stuff/detoxrc "$@"; }
function less() { command less -N "$@"; }
function lessn() { command less "$@"; }
function lynx() { command lynx -vikeys "$@"; }
function mpv() { command mpv --fs --no-audio-display "$@"; }
function rexp() { command rustc --explain "$@" | less "$@"; }
function tmux() { command tmux -2u "$@"; }
function wget() { command wget -c "$@"; }
function ytadl() { command youtube-dl --restrict-filenames -x --audio-format "best" --audio-quality 0 -o "$HOME/Videos/ytdls/audio/%(upload_date)s-%(title)s-%(id)s.%(ext)s" "$@"; }
function ytpdl() { command youtube-dl --restrict-filenames -o "$HOME/Videos/ytdls/playlists/%(playlist_title)s/%(upload_date)s-%(title)s-%(id)s.%(ext)s" "$@"; }
function ytvdl() { command youtube-dl --restrict-filenames -o "$HOME/Videos/ytdls/video/%(upload_date)s-%(title)s-%(id)s.%(ext)s" "$@"; }
