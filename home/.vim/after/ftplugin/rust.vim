iabbrev <buffer> fun fn() {
iabbrev <buffer> for for in  {
iabbrev <buffer> ret return
iabbrev <buffer> => =>,<LEFT>
iabbrev <buffer> match match {
iabbrev <buffer> if if {

compiler cargo
setlocal makeprg=cargo

nnoremap <buffer> <F4> :cwindow<CR>
nnoremap <buffer> <F5> :make build<CR>
nnoremap <buffer> <F6> :make clean<CR>
nnoremap <buffer> <F7> :cprev<CR>
nnoremap <buffer> <F8> :cnext<CR>
nnoremap <buffer> <F9> :cclose<CR>