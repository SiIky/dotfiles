#!/usr/bin/env sh
for R in \
    "https://github.com/Aaronepower/tokei" \
    "https://github.com/BurntSushi/ripgrep" \
    "https://github.com/dan-t/rusty-tags" \
    "https://github.com/nabijaczleweli/cargo-update" \
    "https://github.com/ogham/exa" \
    #"https://github.com/rust-lang-nursery/rustfmt" \
    "https://github.com/siiky/chop" \
    ; do
    cargo install -f -j 2 --git "$R"
done
strip -s ~/.cargo/bin/*
