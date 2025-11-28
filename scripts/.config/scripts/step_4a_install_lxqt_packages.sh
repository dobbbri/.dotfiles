#!/bin/bash

sudo apt install -y lxqt-core xorg-dev xbindkeys xinput hsetroot brightnessctl \
  xdotool unzip libnotify-dev curl unzip ssh-askpass wget stow papirus-icon-theme \
  xdg-user-dirs-gtk build-essential cmake meson ninja-build wget \
  pkg-config || echo "Warning: Package installation failed."

echo "Package installation completed."
