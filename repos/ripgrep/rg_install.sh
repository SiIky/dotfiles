#!/usr/bin/env sh
export RUSTFLAGS="-C target-cpu=native"
cargo build --release && cp target/release/rg ~/bin
