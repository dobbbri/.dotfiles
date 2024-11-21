#!/bin/bash
mkdir ~/.local/share/fonts

cd /tmp
fonts=(
  "UbuntuSans"
  "JetBrainsMono"
  "Meslo"
)

for font in ${fonts[@]}; do
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/$font.zip
  unzip $font.zip -d ~/.local/share/fonts/$font/
  rm $font.zip
done
fc-cache
