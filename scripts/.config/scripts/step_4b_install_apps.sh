#!/bin/bash

echo "Installing apps..."
sudo apt install -y alacritty thunar thunar-archive-plugin thunar-volman lxappearance feh \
  fonts-recommended fonts-font-awesome fonts-terminus eza flameshot qimgv firefox-esr \
  mousepad gparted htop color-picker mintstick atril transmission xarchiver ssh-askpass \
  breeze-gtk-theme breeze-icon-theme breeze-cursor-theme \
  lxtask fzf inkscape viewnior gimp || echo "Warning: Package installation failed."

echo "Apps installation completed."
