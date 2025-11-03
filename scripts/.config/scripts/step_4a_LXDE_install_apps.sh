#!/bin/bash

# ========================================
# Package Installation Section
# ========================================
install_packages() {
  echo "Installing required packages..."
  sudo apt install -y alacritty \
    xbacklight brightnessctl thunar thunar-archive-plugin thunar-volman lxappearance dialog acpi acpid \
    feh eza flameshot qimgv xdotool unzip mintstick gparted htop color-picker mintstick atril heif-gdk-pixbuf webp-pixbuf-loader \
    transmission curl unzip ssh-askpass \
    fzf inkscape viewnior gimp || echo "Warning: Package installation failed."
  echo "Package installation completed."
}

# install_reqs() {
  # echo "Updating package lists and installing required dependencies..."
  # sudo apt install -y build-essential cmake meson ninja-build wget pkg-config || {
  #   echo "Package installation failed."
  #   exit 1
  # }
# }

fix_and_remove_packages() {
  echo "-Enable/Fix tap to click"
  sudo apt remove --yes xserver-xorg-input-synaptics
  sudo apt install --yes xserver-xorg-input-libinput
  sudo cp /home/sdobri/.dotfiles/scripts/.config/scripts/config/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf

  # echo "Remove geoclue-2.0(redshift) services"
  #  sudo apt --purge --yes autoremove geoclue-2.0

  echo "remove modemmanager"
  sudo apt --purge --yes autoremove modemmanager

  echo "Remove printer services"
  sudo apt --purge --yes autoremove cups system-config-printer simple-scan

  echo "Remove bluetooth services"
  sudo apt --purge --yes autoremove blueman bluez-utils bluez bluetooth

  echo "Remove xdg-desktop-portal for flatpack and snap"
  sudo apt --purge --yes xdg-desktop-portal
}

setup_user_dirs() {
  echo "Updating user directories..."
  mkdir -p ~/Screenshots/ || echo "Warning: Failed to create Screenshots directory."
  mkdir -p ~/Sites/ || echo "Warning: Failed to create Sites directory."
  mkdir -p ~/.nvm/ || echo "Warning: Failed to create .nvm directory."
  echo "User directories updated."
}

# ========================================
# Main Script Execution
# ========================================
echo "Starting installation process..."

install_packages
# install_reqs
setup_user_dirs
install_fonts
fix_and_remove_packages

echo "All installations completed successfully!"
