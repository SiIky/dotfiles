#!/usr/bin/env sh
CARGO=~/.cargo/bin/cargo
$CARGO install -j1 --force --no-default-features --git "https://github.com/ogham/exa"
for R in "https://github.com/dan-t/rusty-tags" "https://github.com/BurntSushi/ripgrep" "https://github.com/dan-t/rusty-tags" "https://github.com/nabijaczleweli/cargo-update" "https://github.com/cobalt-org/cobalt.rs" "https://github.com/kbknapp/cargo-outdated"; do
    $CARGO install -j1 --force --git "$R"
done
