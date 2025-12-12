#!/bin/bash

sudo apt install -y xfce4 xfce4-power-manager gnome-keyring seahorse\
  xorg xinit xorg-dev dbus-x11 xinput hsetroot xdotool \
  unzip curl unzip ssh-askpass wget stow papirus-icon-theme \
  build-essential cmake meson ninja-build wget libnotify-bin \
  pkg-config || echo "Warning: Package installation failed."

echo "Package installation completed."
