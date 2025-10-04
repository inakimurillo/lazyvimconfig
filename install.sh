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

# Create config directory in case it does not exits
mkdir -p ~/.config/

configpath="~/.config/nvim/"
if [ -d "$configpath" ]; then
  new="$configpath-$(date +%Y-%m-%d)"
  [ -e "$new" ] && new="${new}_$(date +%H%M%S)"
  mv "$configpath" "$new"
fi

echo "Copy repo config"
cp -r nvim/* $configpath

echo "Done"
