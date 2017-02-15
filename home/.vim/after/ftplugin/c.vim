iabbrev <buffer> fun <ESC>A(){}<ESC><UP><UP>t)i
iabbrev <buffer> for for (;;) {}<ESC><UP>f(a
iabbrev <buffer> switch switch {case :break;}<ESC><UP><UP><UP>t{i
iabbrev <buffer> ()? () ? : <ESC>F)i
iabbrev <buffer> if if () {}<ESC><UP>f(a

setlocal makeprg=make

nnoremap <buffer> <F4> :cwindow<CR>
nnoremap <buffer> <F5> :make<CR>
nnoremap <buffer> <F6> :make clean<CR>
nnoremap <buffer> <F7> :cprev<CR>
nnoremap <buffer> <F8> :cnext<CR>
nnoremap <buffer> <F9> :cclose<CR>
