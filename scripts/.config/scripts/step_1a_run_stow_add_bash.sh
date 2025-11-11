#!/bin/bash

echo "Stow ---------------------------------------------------------------"

sudo apt install -y stow

rm ~/.bashrc

cd ~/.dotfiles

echo "-------"

stow alacritty
stow astro
stow bash
# stow bspwm
stow suckless
stow git
stow lazygit
stow Thunar
stow vimbtw
stow xarchiver
stow xinit
# stow fastfetch
# stow gammastep
# stow geany
# stow fzfrc

cd /home/sdobri
