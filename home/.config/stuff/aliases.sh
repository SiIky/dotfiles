alias exit='while true; do echo "^D scrub"; sleep 0.5; done'

# Git aliases (if no hub replace with git)
if $(hash git); then
    # execute git pull on all directories
    function gitup() {
        for D in *; do
            if [ -d "$D" ] && [ -d "$D/.git" ]; then
                echo "Updating $D"
                cd "$D"
                git pull "$@"
                cd ..
            fi
        done
    }

    if $(hash hub); then
        [ -f $HOME/.config/hub/hub.bash_completion.sh ] && source $HOME/.config/hub/hub.bash_completion.sh
        eval "$(hub alias -s)"
        function g() { command hub "$@";}
        function gadd() { command hub add "$@"; }
        function gblame() { command hub blame "$@"; }
        function gclone() { command hub clone "$@"; }
        function gcommit() { command hub commit -v "$@"; }
        function gconfig() { command hub config "$@"; }
        function gdiff() { command hub diff "$@"; }
        function glog() { command hub log "$@"; }
        function gmv() { command hub mv "$@"; }
        function gpull() { command hub pull --stat "$@"; }
        function gpush() { command hub push "$@"; }
        function grm() { command hub rm "$@"; }
        function gstatus() { command hub status "$@"; }
        function gui() { command hub gui "$@" & }
    else
        function g() { command git "$@";}
        function gadd() { command git add "$@"; }
        function gblame() { command git blame "$@"; }
        function gclone() { command git clone "$@"; }
        function gcommit() { command git commit -v "$@"; }
        function gconfig() { command git config "$@"; }
        function gdiff() { command git diff "$@"; }
        function glog() { command git log "$@"; }
        function gmv() { command git mv "$@"; }
        function gpull() { command git pull --stat "$@"; }
        function gpush() { command git push "$@"; }
        function grm() { command git rm "$@"; }
        function gstatus() { command git status "$@"; }
        function gui() { command git gui "$@" & }
    fi
fi

if $(hash exa); then
    function l() { command exa --group-directories-first --color=automatic "$@"; }
    function l1() { command exa --group-directories-first --color=automatic -1 "$@"; }
    function lh() { command exa --group-directories-first --color=automatic -aBl "$@"; }
    function ll() { command exa --group-directories-first --color=automatic -agl "$@"; }
    function ls() { command exa --group-directories-first --color=automatic -a "$@"; }
    function tree() { command exa -T --group-directories-first --color=automatic "$@"; }
else
    function l() { command ls --group-directories-first --color=auto -CF "$@"; }
    function l1() { command ls --group-directories-first --color=auto -1CF "$@"; }
    function lh() { command ls --group-directories-first --color=auto -ABFGghl "$@"; }
    function ll() { command ls --group-directories-first --color=auto -AFl "$@"; }
    function ls() { command ls --group-directories-first --color=auto -ABCF "$@"; }
fi

if $(hash nvim); then
    function ex() { command nvim -E "$@"; }
    function vi() { command nvim "$@"; }
    function view() { command nvim -R "$@"; }
    function vim() { command nvim "$@"; }
    function vimup() { command nvim +PlugUpgrade +PlugClean +PlugInstall +PlugUpdate +PlugDiff "$@"; }
elif $(hash vim); then
    function vimup() { command vim +PlugUpgrade +PlugClean +PlugInstall +PlugUpdate +PlugDiff "$@"; }
fi

function mk() { command make "$@"; }
function cp() { command cp -ri "$@"; }
function mv() { command mv -i "$@"; }
function rm() { command rm -ri "$@"; }

function dfh() { command df -h "$@"; }
function bandit() { TERM=xterm256 command ssh bandit$1@bandit.labs.overthewire.org; }
function less() { command less -N "$@"; }
function lessn() { command less "$@"; }
function wget() { command wget -c "$@"; }

# https://github.com/ogeno/oneliners
if $(hash abduco); then
    function adm() { command abduco -A $(echo "$(abduco | sed -r 's/Active sessions.*//g;s/\*.*//g;s/\t/ /g' | dmenu)" | sed 's/.* //g'); }
fi

if $(hash detox); then
    function detox() { command detox -f $HOME/.config/stuff/detoxrc "$@"; }
fi

if $(hash podbeuter); then
    function podsclear() { [ -f ~/.local/share/newsbeuter/queue ] && command ex ~/.local/share/newsbeuter/queue -c 'g/downloaded$/d' +x; }
fi

if $(hash mpv); then
    function mpv() { command mpv --fs --no-audio-display "$@"; }
fi

if $(hash rustc); then
    function rexp() { command rustc --explain "$@" | less; }
fi

if $(hash youtube-dl); then
    function ytadl() { command youtube-dl --restrict-filenames -x --audio-format "best" --audio-quality 0 -o "$HOME/Videos/ytdls/audio/%(upload_date)s-%(title)s-%(id)s.%(ext)s" "$@"; }
    function ytpdl() { command youtube-dl --restrict-filenames -o "$HOME/Videos/ytdls/playlists/%(playlist_title)s/%(upload_date)s-%(title)s-%(id)s.%(ext)s" "$@"; }
    function ytvdl() { command youtube-dl --restrict-filenames -o "$HOME/Videos/ytdls/video/%(upload_date)s-%(title)s-%(id)s.%(ext)s" "$@"; }
fi

if $(hash lynx); then
    function lynx() { command lynx -vikeys "$@"; }
fi

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

function rp() {
    local file=${1:-/dev/stdin}
    curl --data-binary @${file} https://paste.rs
}
