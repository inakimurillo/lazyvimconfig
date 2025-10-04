#!/bin/bash
echo " LazyVim installer and configuration"
echo ""

echo "Download Neovim"
wget https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.tar.gz

read -sp "Enter sudo password to copy Neovim in /opt/: " PASSWORD
echo "$PASSWORD" | sudo -S tar -xvf nvim-linux-x86_64.tar.gz -C /opt/

echo "Clean downloaded file"
rm nvim-linux-x86_64.tar.gz

echo "Add path to .bashrc"
echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin/"' >>~/.bashrc

echo "Install LazyVim"
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
