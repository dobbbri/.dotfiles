#!/bin/bash

echo "Stow ---------------------------------------------------------------"

rm ~/.bashrc

cd ~/.dotfiles

echo "-------"

stow alacritty
stow astro
stow bash
stow suckless
stow fastfetch
stow gammastep
stow geany
stow git
stow lazygit
stow nvimBTW
stow xarchiver
stow xinit

cd /home/sdobri
