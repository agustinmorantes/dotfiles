#!/bin/bash

# Install Packages
sudo apt update && sudo apt upgrade -y && \
xargs -a pkglist sudo apt install -y

# Zsh + OhMyZsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Local Neovim, for unprivileged users
# wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
# tar -xzf nvim-linux64.tar.gz
# mkdir -p ~/.local
# cp -R nvim-linux64/* ~/.local
# rm -Rf nvim-linux64 nvim-linux64.tar.gz

# Neovim for privileged users
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.deb
sudo dpkg -i nvim-linux64.deb
rm nvim-linux64.deb

# Symbolic Links
CURDIR=$(pwd)
mv ~/.gitconfig ~/.gitconfig.old
mv ~/.config/nvim ~/.config/nvim.old
mv ~/.vimdid ~/.vimdid.old
ln -sv "$CURDIR/git/.gitconfig" ~
ln -sv "$CURDIR/editor/.config/nvim" ~/.config
ln -sv "$CURDIR/editor/.vimdid" ~
