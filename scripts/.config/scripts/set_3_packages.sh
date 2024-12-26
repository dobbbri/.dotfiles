#!/bin/sh

# sudo mintstick -m format
# sudo mintstick -m iso

# brightnessctl --list
# sudo brightnessctl --device='smc::kbd_backlight' set 30
# sudo brightnessctl --device='acpi_video0' set 2

# chmod 400 ~/.ssh/id_ed25519

# sudo dpkg -i <pakage_name>
# https://obsidian.md/download
# https://bitwarden.com/download/
# https://github.com/shiftkey/desktop/releases/

# install libs
sudo apt install --yes libnotify-bin libgcr-3-dev libwebkit2gtk-4.0-dev build-essential libx11-dev libxft-dev \
  libxinerama-dev libfreetype6-dev libfontconfig1-dev libasound2-dev brightnessctl

# install packages
sudo apt install --yes git curl flameshot scrot gparted neofetch eza btop htop yaru-theme-gtk yaru-theme-icon \
  xarchiver feh dunst unzip fonts-noto-color-emoji ssh-askpass wget color-picker mintstick atril dconf-editor \ 
  stow alsa-utils chafa uget transmission

echo "- remove modemmanager --------------------------------------------------"
sudo apt --purge --yes autoremove modemmanager

echo "- Remove printer services -----------------------------------------------"
sudo apt --purge --yes autoremove cups system-config-printer simple-scan

echo "- Remove bluetooth services ---------------------------------------------"
sudo apt --purge --yes autoremove blueman bluez-utils bluez bluetooth
