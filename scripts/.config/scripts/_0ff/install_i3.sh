#!/bin/sh

# https://github.com/addy-dclxvi/i3-starterpack/tree/master

echo "- install i3 ------------------------------------------------------------"
sudo apt install --yes i3 i3lock dunst xsct fonts-font-awesome lxterminal rofi

rm -rf $HOME/.config/i3
ln -s $HOME/dotfiles/config/i3 $HOME/.config/i3

rm -rf $HOME/.config/dunst
ln -s $HOME/dotfiles/config/dunst $HOME/.config/dunst

rm -rf $HOME/.config/rofi
ln -s $HOME/dotfiles/config/rofi $HOME/.config/rofi

echo "THE END"

# sudo update-alternatives --config x-terminal-emulator
