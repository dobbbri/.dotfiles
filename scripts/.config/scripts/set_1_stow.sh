#!/bin/sh

echo "Stow ---------------------------------------------------------------"
ls

rm /home/sdobri/.bashrc

cd /home/sdobri/.dotfiles

echo "-------" 
# stow alacritty;  
stow astro
stow bash;   
stow bspwm
# stow feh;    
stow git;  
stow tinyvim;    
stow geany;  
stow neofetch;
stow sakura
stow xarchiver;
stow xinit;
# stow rofi;     
# stow dunst;  
# stow i3;   
# stow tint2;     
#
cd /home/sdobri
