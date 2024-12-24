#!/bin/sh

echo "Stow ---------------------------------------------------------------"
rm $HOME/.bashrc
rm $HOME/.aliases
rm -rf $HOME/.config/geany/
rm -rf $HOME/.config/gtk-3.0/

cd $HOME/.dotfiles/

tools=(
"astro"
"alacritty"
"bash"
"dunst"
"geany"
"git"
"gtk-3.0"
"images"
"tinyvim"
"neofetch"
"scripts"
"suckless"
"ssh"
) for tool in ${tools[@]}
do 
	stow $tool
done

