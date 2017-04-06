scriptencoding utf-8
let mapleader=' '
let maplocalleader=''

" general ==================================================
filetype plugin indent on
se ambiwidth=single
se autochdir
se autoindent
se autoread
se backspace=2
se clipboard=unnamedplus
se cmdheight=1
se colorcolumn=60
se complete=.,w,b,u,U,t
se conceallevel=0
se confirm
se cursorcolumn
se cursorline
se encoding=utf-8
se expandtab
se fileencoding=utf-8
se foldcolumn=1
se foldenable
se foldmethod=indent
se foldnestmax=3
se foldtext=getline(v:foldstart)
se hidden
se hlsearch
se incsearch
se laststatus=2
se lazyredraw
se linebreak
se matchpairs=(:),[:],{:},<:>
se nocompatible
se noerrorbells
se noruler
se nospell
se novisualbell
se nowrap
se nrformats=alpha,hex,bin
se number
se numberwidth=1
se omnifunc=syntaxcomplete#Complete
se relativenumber
se scrolljump=10
se scrolloff=5
se shiftwidth=4
se shortmess=at
se showcmd
se showmode
se showtabline=1
se smartindent
se smarttab
se softtabstop=0
se splitbelow
se splitright
se t_Co=256
se t_vb=
se tabpagemax=30
se tabstop=8
se tags=.tags;
se ttimeoutlen=0 " status bar change mode delay (ms)
se wildignore+=*.swp,*.o
se wildmenu
se wildmode=longest:full
highlight comment cterm=italic
syntax off
se mouse=r

if has('nvim')
    se dir=~/.config/nvim/swp//
else
    se dir=~/.vim/swp//
    se viminfo+=n~/.vim/viminfo
    se ttyfast
endif

if has("persistent_undo")
    if has('nvim')
        se undodir=~/.config/nvim/undo
    else
        se undodir=~/.vim/undo
    endif
    se undofile
endif

" Status Line ==============================================
se statusline=%(#%n\ %f%)\  " #buf fname
se statusline+=%(%m%r%h%w%) " modified/modifiable/etc
se statusline+=%y%=\  " ftype
se statusline+=%{strlen(&fenc)?&fenc:'none'}: "file encoding
se statusline+=%{&ff}\ \|\  "file format
se statusline+=%(%l:%c\ \|\ %L\ \|\ %) " #L:#C | #TL |

nnoremap <silent> <LEADER>R :redraw!<CR>

" bindings -------------------------------------------------
" = buffer/function
nnoremap <LEADER>M maggVG=`a_zz
nnoremap <LEADER>m ma][[[V%=`a_zz

nnoremap <LEADER>W :up<CR>
nnoremap <LEADER>X :x<CR>

nnoremap QQ :q!<CR>

" movement keys
nnoremap <C-J> 5j
nnoremap <C-K> 5k
vnoremap <C-J> 5j
vnoremap <C-K> 5k
nnoremap B b
nnoremap E e
nnoremap W w
nnoremap b B
nnoremap e E
nnoremap w W
vnoremap B b
vnoremap E e
vnoremap W w
vnoremap b B
vnoremap e E
vnoremap w W

nnoremap <LEADER><SPACE> za

" move cursor to the beggining/end of the line
nnoremap gh _
nnoremap gl $
nnoremap gj G
nnoremap gk gg
vnoremap gh _
vnoremap gl $
vnoremap gj G
vnoremap gk gg

" swap visual and visual block
nnoremap v <C-V>
nnoremap <C-V> v

" search
vnoremap / y/<C-R>"<CR>

" search and replace
nnoremap <C-S> :%s/<C-R><C-W>//cg<LEFT><LEFT><LEFT>
vnoremap <C-S> "yy:%s/<C-R>"//cg<LEFT><LEFT><LEFT>

" quickfix navigation
nnoremap <silent> <F4> :cwindow<CR>
nnoremap <silent> <F7> :cprevious<CR>
nnoremap <silent> <F8> :cnext<CR>
nnoremap <silent> <F9> :cclose<CR>

noremap <LEADER>s :sort<CR>
nnoremap <LEADER>ev :e $MYVIMRC<CR>

" remap :
nnoremap - :
vnoremap - :

" tabs
if has('nvim')
    nnoremap <M-1> 1gt
    nnoremap <M-2> 2gt
    nnoremap <M-3> 3gt
    nnoremap <M-4> 4gt
    nnoremap <M-5> 5gt
    nnoremap <M-6> 6gt
    nnoremap <M-7> 7gt
    nnoremap <M-8> 8gt
    nnoremap <M-9> 9gt
    nnoremap <M-j> gt
    nnoremap <M-k> gT
    nnoremap <M-l> :bnext<CR>
    nnoremap <M-h> :bprev<CR>
else
    nnoremap <LOCALLEADER>1 1gt
    nnoremap <LOCALLEADER>2 2gt
    nnoremap <LOCALLEADER>3 3gt
    nnoremap <LOCALLEADER>4 4gt
    nnoremap <LOCALLEADER>5 5gt
    nnoremap <LOCALLEADER>6 6gt
    nnoremap <LOCALLEADER>7 7gt
    nnoremap <LOCALLEADER>8 8gt
    nnoremap <LOCALLEADER>9 9gt
    nnoremap <LOCALLEADER>j gt
    nnoremap <LOCALLEADER>k gT
    nnoremap <silent> <LOCALLEADER>l :bnext<CR>
    nnoremap <silent> <LOCALLEADER>h :bprev<CR>
endif

nnoremap <C-W>tn :tabnew 

" windows
nnoremap <C-W>tf <C-W>f<C-W>T
nnoremap <C-W>n :new 
nnoremap <C-W>v :vnew 
nnoremap <C-L> :ls<CR>
nnoremap <C-C> :pwd<CR>

nnoremap <C-W>q :bdelete<CR>
nnoremap <C-W>tq :tabclose<CR>

" put stuff around words
nnoremap <LEADER>" viW<ESC>`>a"<ESC>`<i"<ESC>
nnoremap <LEADER>' viW<ESC>`>a'<ESC>`<i'<ESC>
nnoremap <LEADER>` viW<ESC>`>a`<ESC>`<i`<ESC>
nnoremap <LEADER>( viW<ESC>`>a)<ESC>`<i(<ESC>
nnoremap <LEADER>) viW<ESC>`>a)<ESC>`<i(<ESC>
nnoremap <LEADER>[ viW<ESC>`>a]<ESC>`<i[<ESC>
nnoremap <LEADER>] viW<ESC>`>a]<ESC>`<i[<ESC>
nnoremap <LEADER>{ viW<ESC>`>a}<ESC>`<i{<ESC>
nnoremap <LEADER>} viW<ESC>`>a}<ESC>`<i{<ESC>
nnoremap <LEADER>< viW<ESC>`>a><ESC>`<i<<ESC>
nnoremap <LEADER>> viW<ESC>`>a><ESC>`<i<<ESC>

" put stuff around selected text
vnoremap <LEADER>" <ESC>`>a"<ESC>`<i"<ESC>
vnoremap <LEADER>' <ESC>`>a'<ESC>`<i'<ESC>
vnoremap <LEADER>` <ESC>`>a`<ESC>`<i`<ESC>
vnoremap <LEADER>( <ESC>`>a)<ESC>`<i(<ESC>
vnoremap <LEADER>) <ESC>`>a)<ESC>`<i(<ESC>
vnoremap <LEADER>[ <ESC>`>a]<ESC>`<i[<ESC>
vnoremap <LEADER>] <ESC>`>a]<ESC>`<i[<ESC>
vnoremap <LEADER>{ <ESC>`>a}<ESC>`<i{<ESC>
vnoremap <LEADER>} <ESC>`>a}<ESC>`<i{<ESC>
vnoremap <LEADER>< <ESC>`>a><ESC>`<i<<ESC>
vnoremap <LEADER>> <ESC>`>a><ESC>`<i<<ESC>

" abrevs ===================================================
iabbrev adn and
iabbrev amx max
iabbrev itn int
iabbrev reurnt return
iabbrev tehn then
iabbrev tepydef typedef
iabbrev waht what
iabbrev strutc struct
iabbrev flaot float

" invisibles ===============================================
se nolist
se listchars=tab:\|▸,eol:¬,trail:∙
"se listchars=tab:>~,trail:.
nnoremap <C-P> :se list!<CR>

" NETRW files browser ===============================
let g:netrw_liststyle=3 " listing style
let g:netrw_browse_split=0 " opening behaviour
map <C-E> :Explore<CR>

runtime ftplugin/man.vim
runtime macros/matchit.vim

" vim-plug =================================================
let g:plug_threads=2

if has('nvim')
    let g:plug_dir='~/.config/nvim/plugged'
else
    let g:plug_dir='~/.vim/plugged'
endif

call plug#begin(g:plug_dir)

" toml -----------------------------------------------------
" for cargo (rust) files
source ~/.vim/pconfigs/toml.vim

" markdown -------------------------------------------------
source ~/.vim/pconfigs/tabular.vim
source ~/.vim/pconfigs/markdown.vim

" rust stuff -----------------------------------------------
source ~/.vim/pconfigs/rust.vim
source ~/.vim/pconfigs/racer.vim

" haskell --------------------------------------------------
"source ~/.vim/pconfigs/haskell.vim

" general --------------------------------------------------
" Underline words under the cursor
source ~/.vim/pconfigs/cursorword.vim

" Molokai colorscheme
source ~/.vim/pconfigs/molokai.vim

source ~/.vim/pconfigs/vimproc.vim
source ~/.vim/pconfigs/editorconfig.vim
source ~/.vim/pconfigs/sneak.vim
source ~/.vim/pconfigs/undotree.vim
source ~/.vim/pconfigs/cool.vim
"source ~/.vim/pconfigs/multiple-cursors.vim
source ~/.vim/pconfigs/surround.vim
source ~/.vim/pconfigs/startify.vim
"source ~/.vim/pconfigs/gtd.vim
"source ~/.vim/pconfigs/covim.vim
call plug#end()

"let g:gtd#dir = '~/.config/notes'
colorscheme molokai

if executable("rg")
    se grepprg=rg\ --vimgrep\ --no-heading\ $*
    se grepformat=%f:%l:%c:%m,%f:%l:%m
elseif filereadable("/usr/local/bin/grep")
    se grepprg=/usr/local/bin/grep
endif

nnoremap <leader>d I/**

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd VimEnter * echo "Fuck You Human .l."