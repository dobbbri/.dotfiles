#!/bin/sh

echo "- Install Neovim from image ---------------------------------------------"
sudo rm /usr/local/bin/nvim
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

echo "- Install Neovim - languages --------------------------------------------"
sudo apt install --yes python3 python3-pip golang rustc cargo ripgrep lua5.1 luarocks
pip install neovim vim-vint --break-system-packages
# create a new symlink
sudo ln -s /usr/bin/python3 /usr/bin/python

echo "- fix neovim clipboard -------------------------------------------------"
sudo apt install --yes xsel xclip

echo "- remove vim-tin and install vim ----------------------------------------"
sudo apt --purge --yes autoremove vim-tiny