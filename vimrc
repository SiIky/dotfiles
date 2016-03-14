scriptencoding utf-8
" vim-plug =================================================
let g:plug_threads = 1

call plug#begin('~/.vim/plugged')
" status line ----------------------------------------------
Plug 'itchyny/lightline.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'bling/vim-bufferline'
"Plug 'jlanzarotta/bufexplorer'

" indentation display --------------------------------------
Plug 'Yggdroot/indentLine', { 'for' : ['python', 'haskell', 'c', 'cpp'] }
"Plug 'nathanaelkane/vim-indent-guides', { 'for': ['haskell', 'python', 'c'] }

" markdown -------------------------------------------------
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown', { 'for' : 'markdown' }

" git integration ------------------------------------------
Plug 'tpope/vim-fugitive' " git wrapper
"Plug 'junegunn/vim-github-dashboard' " GH events browser
"Plug 'junegunn/gv.vim' " light git repo browser
"Plug 'gregsexton/gitv' " git repo browser

" some random settings -------------------------------------
"Plug 'tpope/vim-sensible'

" haskell stuff --------------------------------------------
Plug 'vim-scripts/haskell.vim', { 'for': 'haskell' } " syntax for haskell
"Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }" GHC-Mod integration
" completion plugin for haskell
"Plug 'eagletmt/neco-ghc', { 'for': 'haskell' } " (requires GHC-Mod: cabal install ghc-mod)
"Plug 'lukerandall/haskellmode-vim', { 'for': 'haskell' }
"Plug 'dag/vim2hs', { 'for': 'haskell' } " Fancy Stuff

" general --------------------------------------------------
" auto-window resize
"Plug 'justincampbell/vim-eighties'
" visual increment
"Plug 'triglav/vim-visual-increment'
" sideways
"Plug 'AndrewRadev/sideways.vim'
" yankring
"Plug 'vim-scripts/YankRing.vim'

" vimwiki
Plug 'vimwiki/vimwiki', { 'for': ['vimwiki', 'wiki'], 'on': ['VimwikiIndex', 'VimwikiTabIndex', 'VimwikiUISelect', 'VimwikiDiaryIndex', 'VimwikiMakeDiaryNote', 'VimwikiTabMakeDiaryNote', 'VimwikiFollowLink', 'VimwikiGoBackLink', 'VimwikiSplitLink', 'VimwikiVSplitLink', 'VimwikiTabnewLink', 'VimwikiNextLink', 'VimwikiPrevLink', 'VimwikiGoto', 'VimwikiDeleteLink', 'VimwikiRenameLink', 'Vimwiki2HTML', 'Vimwiki2HTMLBrowse', 'VimwikiAll2HTML', 'VimwikiToggleListItem', 'VimwikiListChangeLevel', 'VimwikiSearch', 'VimwikiBacklinks', 'VimwikiTable', 'VimwikiTableMoveColumnLeft', 'VimwikiGenerateLinks', 'VimwikiDiaryGenerateLinks', 'VimwikiDiaryNextDay', 'VimwikiDiaryPrevDay', 'VimwikiTOC', 'VimwikiCheckLinks', 'VimwikiRebuildTags', 'VimwikiSearchTags', 'VimwikiGenerateTags'] }

" windowswap
"Plug 'wesQ3/vim-windowswap'
" fuzzy finder n stuff
"Plug 'szw/vim-ctrlspace'
" parens/brackets auto closing
"Plug 'Raimondi/delimitMate'
" syntastic linter engine
"Plug 'scrooloose/syntastic'

" completion engine -- req python2+
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py', 'for': ['haskell', 'python', 'c'] } 

" async execution lib
"Plug 'Shougo/vimproc.vim', { 'do': 'make'}
call plug#end()

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
se conceallevel=0
se confirm
se cursorcolumn
se cursorline
se dir=~/.vim/swp//
se encoding=utf-8
se expandtab
se foldenable
se foldmethod=manual
se hidden
se hlsearch
se incsearch
se laststatus=2
se linebreak
se nocompatible
se noerrorbells
se noshowmode
se nospell
se number
se omnifunc=syntaxcomplete#Complete
se relativenumber
se ruler
se scrolljump=10
se scrolloff=5
se shiftwidth=4
se shortmess=at
se showcmd
se showtabline=2
se smartindent
se smarttab
se softtabstop=0
se splitbelow
se splitright
se t_Co=256
se tabpagemax=5
se tabstop=8
se ttimeoutlen=0 " status bar change mode delay (ms)
se wildignore+=*.swp,*.o
se wildmenu
se wrap
highlight comment cterm=italic
syntax on
"se mouse=a

" bindings -------------------------------------------------
" leader/localleader
let mapleader = ','
let maplocalleader = ''

nnoremap <c-s> :w<CR>

"movement keys for insert mode
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-j> <down>
inoremap <c-k> <up>

"movement keys for normal mode
nnoremap <c-j> 5j
nnoremap <c-k> 5k
vnoremap <c-j> 5j
vnoremap <c-k> 5k
nnoremap w W
nnoremap b B
nnoremap W w
nnoremap B b
nnoremap e E
nnoremap E e
vnoremap w W
vnoremap b B
vnoremap W w
vnoremap B b
vnoremap e E
vnoremap E e

"bye bye arrow keys
nnoremap <up> <esc>
nnoremap <down> <esc>
nnoremap <left> <esc>
nnoremap <right> <esc>

inoremap <up> <esc>
inoremap <down> <esc>
inoremap <left> <esc>
inoremap <right> <esc>

vnoremap <up> <esc>
vnoremap <down> <esc>
vnoremap <left> <esc>
vnoremap <right> <esc>

" move cursor to the beggining/end of the line
nnoremap H _
nnoremap L $
vnoremap H _
vnoremap L $

" search for selected text
vnoremap / y/<c-r>"

"open/close folds
nnoremap <space> za

" select a word and make it uppercase
nnoremap <c-u> viwU

" vimrc edit
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" tabs
nnoremap <localleader>1 1gt
nnoremap <localleader>2 2gt
nnoremap <localleader>3 3gt
nnoremap <localleader>4 4gt
nnoremap <localleader>5 5gt
nnoremap <localleader>6 6gt
nnoremap <localleader>7 7gt
nnoremap <localleader>8 8gt
nnoremap <localleader>9 9gt
nnoremap <localleader>l gt
nnoremap <localleader>h gT

" put stuff around words
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>` viw<esc>a`<esc>hbi`<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>) viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
nnoremap <leader>] viw<esc>a]<esc>hbi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
nnoremap <leader>} viw<esc>a}<esc>hbi{<esc>lel
nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel
nnoremap <leader>> viw<esc>a><esc>hbi<<esc>lel

" put stuff around selected text
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>` <esc>`>a`<esc>`<i`<esc>
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>) <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>] <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>
vnoremap <leader>} <esc>`>a}<esc>`<i{<esc>
vnoremap <leader>< <esc>`>a><esc>`<i<<esc>
vnoremap <leader>> <esc>`>a><esc>`<i<<esc>

" turn off search highlight
nnoremap <silent> <BS> :se hlsearch!<CR>

" abrevs ===================================================
iabbrev adn and
iabbrev waht what
iabbrev tehn then

" C snippets ===============================================
let @i='i#include <>i'
let @f='A (){}kba'
let @d='I#define '

" invisibles ===============================================
se list
se listchars=tab:▸~,eol:¬,trail:∙
"se listchars=tab:>~,trail:.

" indentline ===============================================
nnoremap <silent><tab> :IndentLinesToggle<CR>
let g:indentLine_char = '|'
let g:indentLine_color_term = 239
let g:indentLine_color_dark = 2
let g:indentLine_leadingSpaceChar = '.'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_enabled = 1

" NETRW explore file browser ===============================
let g:netrw_liststyle=3 " listing style
let g:netrw_browse_split=0 " opening behaviour
map <silent><c-e> :Explore<CR>

" monokai theme ============================================
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 0

" lightline ================================================
let g:lightline = {
    \ 'active': {
    \    'left': [ [ 'mode', 'paste' ],
    \              [ 'fugitive', 'filename', 'readonly' ] ]
    \ },
    \ 'component_function': {
    \    'fugitive': 'LightLineFugitive',
    \    'readonly': 'LightLineReadonly',
    \    'filename': 'LightLineFilename'
    \ },
    \ }

" lightline functions ---------------------------------------
function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return ""
    else
        return ""
    endif
endfunction

function! LightLineFugitive()
    if exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? ' '._ : ''
    endif
    return ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

" vimwiki ==================================================
nmap <localleader>es :VimwikiUISelect<CR>
au BufNewFile,BufRead,BufReadPost *.wiki set filetype=vimwiki
let g:vimwiki_hl_headers = 0
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_global_ext = 0
let g:vimwiki_ext2syntax = {
    \ '.md': 'markdown',
    \ '.wiki': 'default'
    \ }
let g:vimwiki_menu = '' " 'Vimwiki'
let g:vimwiki_listsyms = ' .oOX'
"let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_use_mouse = 0
let g:vimwiki_folding = ''
let g:vimwiki_use_calendar = 0
let g:vimwiki_table_mappings = 0
let g:vimwiki_table_auto_fmt = 1
let g:vimwiki_CJK_length = 0 " UTF8 related
let g:vimwiki_dir_link = ''
let g:vimwiki_conceallevel = 2
let g:vimwiki_autowriteall = 0
let g:vimwiki_url_maxsave = 15 "default
let g:vimwiki_map_prefix = '<localleader>e' " '<space>e'
let g:vimwiki_auto_chdir = 1

" change 'path' if needed
let g:vimwiki_list = [{
    \ 'path': '~/Documents/my_stuff/vim/wiki',
    \ 'auto_export': 0,
    \ 'auto_toc': 1,
    \ 'syntax': 'default',
    \ 'ext': '.wiki',
    \ 'maxhl': 1,
    \ 'auto_tags': 1,
    \ 'list_margin': -1
    \ }]

" delimitmate ==============================================
"let delimitMate_expand_cr = 1

" vim-markdown =============================================
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_folding_style_pythonic = 0
let g:vim_markdown_folding_level = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_emphasis_multiline = 0
let g:vim_markdown_math = 0

autocmd VimEnter * echo "Fuck You Human .l."
" stuff to remember
" :h session-file
