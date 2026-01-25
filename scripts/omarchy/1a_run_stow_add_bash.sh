#!/bin/bash

echo "Stow ---------------------------------------------------------------"

# sudo apt install -y eza stow starship
sudo pacman -Sy stow


cd ~/.dotfiles

echo "-------"

stow astro
stow htop
stow vimbtw

cd ~

