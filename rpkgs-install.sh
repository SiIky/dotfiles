#!/usr/bin/env sh
cargo install --no-default-features --git "https://github.com/ogham/exa"
for R in "https://github.com/dan-t/rusty-tags" "https://github.com/BurntSushi/ripgrep" "https://github.com/dan-t/rusty-tags" "https://github.com/nabijaczleweli/cargo-update"; do
    cargo install --git "$R"
done
