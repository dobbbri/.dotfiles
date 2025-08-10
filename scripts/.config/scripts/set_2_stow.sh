#!/bin/bash

echo "Stow ---------------------------------------------------------------"

rm ~/.bashrc

cd ~/.dotfiles

echo "-------"

stow alacritty
stow astro
stow bash
stow bspwm
stow fastfetch
stow gammastep
stow geany
stow git
stow lazygit
stow newvim
stow xarchiver
stow xinit

cd /home/sdobri
