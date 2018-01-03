iabbrev <buffer> fun <ESC>A()<CR>{<CR>}<ESC><UP><UP>t)hi
iabbrev <buffer> for for (;;) {<CR>}<ESC><UP>f(a
iabbrev <buffer> switch switch {<CR>case :<CR>break;<CR>}<ESC><UP><UP><UP>t{i
iabbrev <buffer> ()? () ? : <ESC>F)i
iabbrev <buffer> if if () {<CR>}<ESC><UP>f(a

setlocal makeprg=make

nnoremap <buffer> <F4> :cwindow<CR>
nnoremap <buffer> <F5> :make<CR>
nnoremap <buffer> <F6> :make clean<CR>
nnoremap <buffer> <F7> :cprev<CR>
nnoremap <buffer> <F8> :cnext<CR>
nnoremap <buffer> <F9> :cclose<CR>

nnoremap <LEADER>d I/**<CR><BS><BS>*/<C-O>O@brief 
vnoremap <LEADER>c <ESC>`>a */<ESC>`<i/* <ESC>
