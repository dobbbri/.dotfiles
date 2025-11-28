#!/bin/bash

echo "Stow ---------------------------------------------------------------"

sudo apt install -y stow

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
stow fzf
# stow i3
# stow dk
# stow bspwm

cd ~

