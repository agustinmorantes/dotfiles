#!/bin/bash

# Install packages
sudo dnf upgrade --refresh && \
xargs -a pkglist sudo dnf install -y

# Zsh + OhMyZsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

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
mkdir -p ~/.config
ln -sv "$CURDIR/editor/.config/nvim" ~/.config
ln -sv "$CURDIR/editor/.vimdid" ~
