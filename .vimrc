" General
se shm=at
se noeb " Turn off Bell
se ai " Auto Indent
se si " Smart Indenting
se wmnu " command auto complete
se sc " Show command preview
se autoread " auto refresh when a file is changed out of vim
se cursorline " highlight current line
se noshowmode " dont show MODE name on command bar
se foldmethod=manual " manual/marker/indent/expr/syntax/diff
se encoding=utf-8 " ViM Encoding
se showtabline=2 " Always show tabs line
se tabpagemax=5 " Max open tabs
se cmdheight=1 " Commands Section Height
se colorcolumn=60 " Line Wrap vertical warning
"set mouse=a " Enable Mouse
se confirm " Prompt user when trying to quit without saving
se wrap " Line Wrap
se linebreak
se so=5 " Lines above/below cursor when moving
se sj=1
se ru " Status Line - L#:C#
se expandtab " Tabs to Spaces
se ts=4 "Tab Size
se sw=4 " Tab Size
se softtabstop=0
se sta
se hid " Put current file buffer on BG and hide warning msg when opening a new file. :ls to show buffers
se nu " Line Numbers
se rnu " Relative Line Numbers
se t_Co=256 " Enable 256 colors on Vim
se ls=2 " Always display Status Line
se fdm=manual
syntax on " Turn on Syntax Highlighting
" General

" Monokai Theme
colorscheme molokai " Vim Theme
"let g:molokai_original = 1
"let g:rehash256 = 1
" Monokai Theme

" vim2hs
let g:haskell_conceal = 0
let g:haskell_conceal_enumerations = 0
let g:haskell_quasi = 0
let g:haskell_interpolation = 0
let g:haskell_regex = 0
let g:haskell_jmacro = 0
let g:haskell_shqq = 0
let g:haskell_sql = 0
let g:haskell_json = 0
let g:haskell_xml = 0
let g:haskell_hsp = 0
let g:haskell_multiline_strings = 1
let g:haskell_tabular = 0
" vim2hs

" Vim-Airline
let g:bufferline_echo = 0 " dont print to command bar
set ttimeoutlen=50 " Status bar change mode delay
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" bind <leader>{1..9} to change through tabs
let g:airline#extensions#whitespace#show_message = 0 " Disable whitespace warning
let g:airline#extensions#whitespace#symbol = '!' " Whitespace symbol
let g:airline#extensions#whitespace#enabled = 0 " Disable whitespace check
let g:airline#extensions#wordcount#enabled = 0 " Disable word-counting
let g:airline#extensions#syntastic#enabled = 1 " Enable Syntastic integration
let g:airline_section_b = '%{getcwd()}' " Show Working Directory on status bar
let g:airline_section_c = 'KAWAII~ViM'
let g:airline_left_sep='>>' " Left separator on Statusline
let g:airline_right_sep='<<' " Right separator on Statusline
let g:airline_theme='term' " Airline Theme
let g:airline_powerline_fonts = 0 " Use Powerline Fonts (special symbols)
let g:airline#extensions#tabline#enabled = 1 " Always show Airline tabs line
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 2 " Splits and Tab #
let g:airline#extensions#tabline#show_tab_nr = 1 " Show Tab #
let g:airline#extensions#tabline#show_tab_type = 1 " Show Tab type
let g:airline#extensions#tabline#show_close_button = 0 " Hide Close Button
let g:airline#extensions#tmuxline#enabled = 1 " Tmuxline Integration
let airline#extensions#tmuxline#color_template = 'normal' " which mode to show on Tmuxline (static, doesnt change)
" Vim-Airline

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Auto-close Vim if NERDTree open and no file in buffer
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '>>'
let g:NERDTreeDirArrowCollapsible = '<<'
"autocmd StdinReadPre * let s:std_in=1 " Open NERDTree if no file chosen on Vim startup
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " Open NERDTree if no file chosen on Vim startup
map <C-n> :NERDTreeToggle<CR> " Bind Ctrl-N to Open/Close NERDTree
" NERDTree

" Vundle
se nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
se rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' " Vundle Plugin Manager
"   My Plugins
Plugin 'bling/vim-airline' " AirLine Status Line
"Plugin 'tpope/vim-fugitive' " Git for Vim
"Plugin 'tpope/vim-sensible' " some settings
Plugin 'dag/vim2hs' " haskel stuff
Plugin 'scrooloose/syntastic' " Syntastic syntax highlighting
Plugin 'scrooloose/nerdtree' " NERDTree File Browser
Plugin 'edkolev/tmuxline.vim' " TmuxLine - Tmux integration
"Plugin 'eagletmt/ghcmod-vim' " GHC-Mod integration
"Plugin 'eagletmt/neco-ghc' " Needs GHC-Mod (cabal install ghc-mod)
"Plugin 'lukerandall/haskellmode-vim' " haskell-mode
Plugin 'vim-scripts/haskell.vim' " Syntax for Haskell
Plugin 'elixir-lang/vim-elixir' " Elixir Language Support
"Plugin 'Valloric/YouCompleteMe' " Autocomplete -- Vim w/ Python2 support required
"   My Plugins
" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Vundle
highlight comment cterm=italic
