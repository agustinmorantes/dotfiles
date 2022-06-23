#!/bin/bash

# Install Packages
sudo apt update && sudo apt upgrade -y && \
xargs -a pkglist sudo apt install -y

# Zsh + OhMyZsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Symbolic Links
CURDIR=$(pwd)
mv ~/.bashrc ~/.bashrc.old
mv ~/.zshrc ~/.zshrc.old
mv ~/.gitconfig ~/.gitconfig.old
mv ~/.profile ~/.profile.old
mv ~/.zprofile ~/.zprofile.old
ln -sv "$CURDIR/shell/.bashrc" ~
ln -sv "$CURDIR/shell/.zshrc" ~
ln -sv "$CURDIR/git/.gitconfig" ~
ln -sv "$CURDIR/.profile" ~
ln -sv "$CURDIR/.profile" ~/.zprofile
