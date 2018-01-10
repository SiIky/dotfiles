#!/usr/bin/env sh
CARGO=~/.cargo/bin/cargo
for R in \
    "https://github.com/Aaronepower/tokei" \
    "https://github.com/BurntSushi/ripgrep" \
    "https://github.com/cobalt-org/cobalt.rs" \
    "https://github.com/dan-t/rusty-tags" \
    "https://github.com/kbknapp/cargo-outdated" \
    "https://github.com/nabijaczleweli/cargo-update" \
    "https://github.com/ogham/exa" \
    "https://github.com/rust-lang-nursery/rustfmt" \
    "https://github.com/siiky/chop" \
    ; do
cargo install -f -j1 --git "$R"
done 2>cargo-rpkgs-install.log
strip -s ~/.cargo/bin/*
