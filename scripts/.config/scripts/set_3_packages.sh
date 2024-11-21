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
sudo apt install --yes thunar flameshot scrot picom xfce4-terminal geany vlc gparted neofetch exa galculator curl btop htop \
  yaru-theme-gtk yaru-theme-icon thunar xarchiver file-roller lxappearance dialog xfce4-power-manager feh exa scrot dunst \
  unzip geany feh fonts-font-awesome fonts-recommended fonts-noto-color-emoji ssh-askpass wget color-picker mintstick redshift \
  atril dconf-editor stow alsamixergui

echo "Fix keyboard an monitor lights ------------------------------------------"
sudo brightnessctl --device='smc::kbd_backlight' set 30
sudo brightnessctl --device='acpi_video0' set 2

echo "- Optimize Linux Laptop Battery Life and thermal changes ----------------"
sudo apt install --yes tlp tlp-rdw linux-cpupower acpi-support acpi-call-dkms thermald
sudo tlp start

echo "- Enable/Fix tap to click -----------------------------------------------"
sudo apt remove --yes xserver-xorg-input-synaptics
sudo apt install --yes xserver-xorg-input-libinput
sudo mv $HOME/.dotfiles/scripts/.config/scripts/config/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf

echo "- remove modemmanager --------------------------------------------------"
sudo apt --purge --yes autoremove modemmanager

echo "- Remove printer services -----------------------------------------------"
sudo apt --purge --yes autoremove cups system-config-printer simple-scan

echo "- Remove bluetooth services ---------------------------------------------"
sudo apt --purge --yes autoremove blueman bluez-utils bluez bluetooth
