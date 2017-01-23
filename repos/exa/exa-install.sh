#!/usr/bin/env sh
cargo build --release --no-default-features && cp target/release/exa ~/bin
