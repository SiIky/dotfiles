Plug 'rust-lang/rust.vim', { 'for': 'rust' }

let g:rustfmt_autosave=0

" tags support for Rust
autocmd BufRead *.rs :setlocal tags=./.tags;/,$RUST_SRC_PATH/.tags
autocmd BufWrite *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&"
