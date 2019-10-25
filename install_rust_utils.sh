#!/usr/bin/env bash


curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo apt install -y build-essentials libgit2 cmake llvm
cargo install exa
cargo install bat
cargo install starship
