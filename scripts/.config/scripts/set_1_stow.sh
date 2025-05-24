#!/bin/sh

echo "Stow ---------------------------------------------------------------"

rm .bashrc

cd /home/sdobri/.dotfiles

echo "-------"
stow alacritty
stow astro
stow bash
stow bspwm
stow git
stow tinyvim
stow geany
stow sakura
stow xarchiver
stow xinit

cd /home/sdobri
