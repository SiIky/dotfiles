alias exit='while true; do echo "^D scrub"; sleep 0.5; done'

# Git aliases (if no hub replace with git)
if $(hash hub); then
    [ -f $HOME/.config/hub/hub.bash_completion.sh ] && source $HOME/.config/hub/hub.bash_completion.sh
    function gadd() { hub add "$@"; }
    function gblame() { hub blame "$@"; }
    function gclone() { hub clone "$@"; }
    function gcommit() { hub commit -v "$@"; }
    function gconfig() { hub config "$@"; }
    function gdiff() { hub diff "$@"; }
    function git() { hub "$@"; }
    function glog() { hub log "$@"; }
    function gmv() { hub mv "$@"; }
    function gpull() { hub pull --stat "$@"; }
    function gpush() { hub push "$@"; }
    function grm() { hub rm "$@"; }
    function gstatus() { hub status "$@"; }
else
    function gadd() { git add "$@"; }
    function gblame() { git blame "$@"; }
    function gclone() { git clone "$@"; }
    function gcommit() { git commit -v "$@"; }
    function gconfig() { git config "$@"; }
    function gdiff() { git diff "$@"; }
    function git() { git "$@"; }
    function glog() { git log "$@"; }
    function gmv() { git mv "$@"; }
    function gpull() { git pull --stat "$@"; }
    function gpush() { git push "$@"; }
    function grm() { git rm "$@"; }
    function gstatus() { git status "$@"; }
fi

if $(hash exa); then
    function l()    { command exa --group-directories-first --color=automatic "$@"; }
    function l1()    { command exa --group-directories-first --color=automatic -1 "$@"; }
    function lh()   { command exa --group-directories-first --color=automatic -aBl "$@"; }
    function ll()   { command exa --group-directories-first --color=automatic -agl "$@"; }
    function ls()   { command exa --group-directories-first --color=automatic -a "$@"; }
    function tree() { command exa -T --group-directories-first --color=automatic "$@"; }
else
    function l() { command ls --group-directories-first --color=auto -CF "$@"; }
    function l1() { command ls --group-directories-first --color=auto -1CF "$@"; }
    function lh() { command ls --group-directories-first --color=auto -ABFGghl "$@"; }
    function ll() { command ls --group-directories-first --color=auto -AFl "$@"; }
    function ls() { command ls --group-directories-first --color=auto -ABCF "$@"; }
fi

function vi() { command vim -p "$@"; }
function vim() { command vim -p "$@"; }
function vimup() { command vim +PlugUpgrade +PlugClean +PlugInstall +PlugUpdate "$@"; }

function mk() { command make "$@"; }
function cp() { command cp -ri "$@"; }
function mv() { command mv -i "$@"; }
function rm() { command rm -ri "$@"; }

# https://github.com/ogeno/oneliners
function adm() { command abduco -A $(echo "$(abduco | sed -r 's/Active sessions.*//g;s/\*.*//g;s/\t/ /g' | dmenu)" | sed 's/.* //g'); }

function dfh() { command df -h "$@"; }
function bandit() { TERM=xterm256 command ssh bandit$1@bandit.labs.overthewire.org; }
function detox() { command detox -f $HOME/.config/stuff/detoxrc "$@"; }
function less() { command less -N "$@"; }
function lessn() { command less "$@"; }
function lynx() { command lynx -vikeys "$@"; }
function mpv() { command mpv --fs --no-audio-display "$@"; }
function rexp() { command rustc --explain "$@" | less; }
function wget() { command wget -c "$@"; }
function ytadl() { command youtube-dl --restrict-filenames -x --audio-format "best" --audio-quality 0 -o "$HOME/Videos/ytdls/audio/%(upload_date)s-%(title)s-%(id)s.%(ext)s" "$@"; }
function ytpdl() { command youtube-dl --restrict-filenames -o "$HOME/Videos/ytdls/playlists/%(playlist_title)s/%(upload_date)s-%(title)s-%(id)s.%(ext)s" "$@"; }
function ytvdl() { command youtube-dl --restrict-filenames -o "$HOME/Videos/ytdls/video/%(upload_date)s-%(title)s-%(id)s.%(ext)s" "$@"; }
function podsclear() { [ -f ~/.local/share/newsbeuter/queue ] && command ex ~/.local/share/newsbeuter/queue -c 'g/downloaded$/d' +x; }

# functions to manage remote host
function tradd() {
    if [ "$RUSER" != "" ] && [ "$RHOSTNAME" != "" ] && [ "$RWDIR" != "" ]; then
        scp "$@" $RUSER@$RHOSTNAME:$RWDIR
    else
        echo "set the required environment variables"
    fi
}

function trclean() {
    if [ "$RUSER" != "" ] && [ "$RHOSTNAME" != "" ] && [ "$RWDIR" != "" ] && [ "$REXT" != "" ]; then
        ssh $RUSER@$RHOSTNAME rm $RWDIR/*.$REXT
    else
        echo "set the required environment variables"
    fi
}
