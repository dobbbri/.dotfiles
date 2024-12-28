#!/bin/sh

# sudo mintstick -m format
# sudo mintstick -m iso

# brightnessctl --list
sudo brightnessctl --device='smc::kbd_backlight' set 30
sudo brightnessctl --device='acpi_video0' set 2

# chmod 400 ~/.ssh/id_ed25519

# sudo dpkg -i <pakage_name>
# https://obsidian.md/download
# https://bitwarden.com/download/
# https://github.com/shiftkey/desktop/releases/

# install packages
sudo apt install firefox-esr pcmanfm exa stow alacritty -yy
sudo apt install xorg xserver-xorg xwallpaper -yy

sudo apt install git curl flameshot scrot gparted neofetch btop htop yaru-theme-gtk yaru-theme-icon xarchiver feh dunst unzip fonts-noto-color-emoji ssh-askpass wget color-picker mintstick atril dconf-editor stow alsa-utils chafa uget transmission -yy

echo "- remove modemmanager --------------------------------------------------"
sudo apt --purge --yes autoremove modemmanager

echo "- Remove printer services -----------------------------------------------"
sudo apt --purge --yes autoremove cups system-config-printer simple-scan

echo "- Remove bluetooth services ---------------------------------------------"
sudo apt --purge --yes autoremove blueman bluez-utils bluez bluetooth
