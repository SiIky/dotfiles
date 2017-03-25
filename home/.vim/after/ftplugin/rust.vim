iabbrev <buffer> fun fn() {}<ESC><UP>f(i
iabbrev <buffer> for for in  {}<ESC><UP>tii
iabbrev <buffer> => =>,<LEFT>
iabbrev <buffer> match match {}<ESC><UP>t{i
iabbrev <buffer> if if {}<ESC><UP>t{i

compiler cargo
setlocal makeprg=cargo

nnoremap <buffer> <F5> :make build<CR>
nnoremap <buffer> <F6> :make clean<CR>

vnoremap <LEADER>c <ESC>`>a */<ESC>`<i/* <ESC>
