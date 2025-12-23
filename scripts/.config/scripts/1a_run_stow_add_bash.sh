#!/bin/bash

echo "Stow ---------------------------------------------------------------"

sudo apt install -y eza stow starship

rm ~/.bashrc

cd ~/.dotfiles

echo "-------"

stow alacritty
stow astro
stow bash
stow htop
stow suckless
stow git
stow lazygit
stow Thunar
stow vimbtw
stow xarchiver
stow xinit
stow fzfrc
stow starship
stow gtk-3.0
# stow i3
# stow dk
# stow bspwm
# stow sway

cd ~

