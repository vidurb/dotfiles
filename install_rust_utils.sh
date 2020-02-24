#!/usr/bin/env bash

echo "Installing Rustlang, Cargo package manager and C/C++/Rust build tools"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo apt install -y build-essential libgit2 cmake llvm
cargo install exa
cargo install bat
cargo install starship
