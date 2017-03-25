iabbrev <buffer> fun <ESC>A(){}<ESC><UP><UP>t)hi
iabbrev <buffer> for for (;;) {}<ESC><UP>f(a
iabbrev <buffer> switch switch {case :break;}<ESC><UP><UP><UP>t{i
iabbrev <buffer> ()? () ? : <ESC>F)i
iabbrev <buffer> if if () {}<ESC><UP>f(a

setlocal makeprg=make

nnoremap <buffer> <F5> :make<CR>
nnoremap <buffer> <F6> :make clean<CR>

vnoremap <LEADER>c <ESC>`>a */<ESC>`<i/* <ESC>
