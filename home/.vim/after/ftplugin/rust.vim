iabbrev <buffer> fun fn() {<CR>}<ESC><UP>f(i
iabbrev <buffer> for for in  {<CR>}<ESC><UP>tii
iabbrev <buffer> => =>,<LEFT>
iabbrev <buffer> match match {<CR>}<ESC><UP>t{i
iabbrev <buffer> if if {<CR>}<ESC><UP>t{i

nnoremap <buffer> <F4> :cwindow<CR>
nnoremap <buffer> <F5> :Cargo check<CR>
nnoremap <buffer> <F6> :Cargo clean<CR>
nnoremap <buffer> <F7> :cprev<CR>
nnoremap <buffer> <F8> :cnext<CR>
nnoremap <buffer> <F9> :cclose<CR>

vnoremap <LEADER>c <ESC>`>a */<ESC>`<i/* <ESC>
