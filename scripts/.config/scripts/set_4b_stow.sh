#!/bin/shell

echo "Stow ---------------------------------------------------------------"
rm $HOME/.bashrc

cd $HOME/.dotfiles

echo "-------" 

tools=("astro" "alacritty" "bash" "dunst" "git" "tinyvim" "neofetch" "suckless") 
for tool in ${tools[@]}
do 
	stow $tool
done

