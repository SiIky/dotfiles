Plug 'mbbill/undotree'

if has('nvim')
    nnoremap <M-u> :UndotreeToggle<CR>
else
    nnoremap <LOCALLEADER>u :UndotreeToggle<CR>
endif
let g:undotree_WindowLayout=2
let g:undotree_SetFocusWhenToggle=1
let g:undotree_HighlightChangedText=0
let g:undotree_ShortIndicators=1
