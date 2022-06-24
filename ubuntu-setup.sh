#!/bin/bash

# Install Packages
sudo apt update && sudo apt upgrade -y && \
xargs -a pkglist sudo apt install -y

# Zsh + OhMyZsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Local Neovim, for unprivileged users
# wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
# tar -xzf nvim-linux64.tar.gz
# cp nvim-linux64/bin/nvim ~/.bin/nvim
# rm -Rf nvim-linux64 nvim-linux64.tar.gz

# Symbolic Links
CURDIR=$(pwd)
mv ~/.bashrc ~/.bashrc.old
mv ~/.zshrc ~/.zshrc.old
mv ~/.gitconfig ~/.gitconfig.old
mv ~/.profile ~/.profile.old
mv ~/.zprofile ~/.zprofile.old
mv ~/.config/nvim ~/.config/nvim.old
mv ~/.vimdid ~/.vimdid.old
ln -sv "$CURDIR/shell/.bashrc" ~
ln -sv "$CURDIR/shell/.zshrc" ~
ln -sv "$CURDIR/git/.gitconfig" ~
ln -sv "$CURDIR/shell/.profile" ~
ln -sv "$CURDIR/shell/.profile" ~/.zprofile
ln -sv "$CURDIR/editor/.config/nvim" ~/.config
ln -sv "$CURDIR/editor/.vimdid" ~
