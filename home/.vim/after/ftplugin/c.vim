iabbrev <buffer> fun <ESC>A()
iabbrev <buffer> for for (;;) {
iabbrev <buffer> ret return ;<LEFT>
iabbrev <buffer> switch switch {
iabbrev <buffer> ()? () ? : <ESC>F)i
iabbrev <buffer> if if () {

setlocal makeprg=make

nnoremap <buffer> <F4> :cwindow<CR>
nnoremap <buffer> <F5> :make<CR>
nnoremap <buffer> <F6> :make clean<CR>
nnoremap <buffer> <F7> :cprev<CR>
nnoremap <buffer> <F8> :cnext<CR>
nnoremap <buffer> <F9> :cclose<CR>