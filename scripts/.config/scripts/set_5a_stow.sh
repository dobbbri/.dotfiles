#!/bin/sh

echo "Stow ---------------------------------------------------------------"
ls

rm ~/.bashrc

cd ~/.dotfiles

echo "-------" 
stow alacritty;  
stow bash;   
stow feh;    
stow git;  
# stow rofi;     
stow tinyvim;    
stow xinit;
stow astro;      
# stow dunst;  
stow geany;  
# stow i3;   
stow neofetch;  
# stow tint2;     
stow xarchiver;
