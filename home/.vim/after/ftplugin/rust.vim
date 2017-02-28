iabbrev <buffer> fun fn() {}<ESC><UP>f(i
iabbrev <buffer> for for in  {}<ESC><UP>tii
iabbrev <buffer> => =>,<LEFT>
iabbrev <buffer> match match {}<ESC><UP>t{i
iabbrev <buffer> if if {}<ESC><UP>t{i

compiler cargo
setlocal makeprg=cargo

nnoremap <buffer> <F4> :cwindow<CR>
nnoremap <buffer> <F5> :make build<CR>
nnoremap <buffer> <F6> :make clean<CR>
nnoremap <buffer> <F7> :cprev<CR>
nnoremap <buffer> <F8> :cnext<CR>
nnoremap <buffer> <F9> :cclose<CR>

vnoremap <LEADER>c <ESC>`>a */<ESC>`<i/* <ESC>
