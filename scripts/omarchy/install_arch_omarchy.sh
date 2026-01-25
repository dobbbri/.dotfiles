#!/bin/bash

omarchy-install-terminal alacritty

sudo pacman -Sy python3 go rust cargo ripgrep lua51 luarocks
sudo pacman -Sy wget stow lua51 python-pip python3
sudo pacman -Sy xsel xclip

# stow vimbtw/
# nvm ls-remote --lts
# nvm install 22
