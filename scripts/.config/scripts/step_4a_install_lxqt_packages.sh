#!/bin/bash

sudo apt install -y  lxqt-core xorg xinit xorg-dev xbindkeys xinput hsetroot brightnessctl \
  xdotool unzip curl unzip ssh-askpass wget stow papirus-icon-theme \
  build-essential cmake meson ninja-build wget \
  pkg-config || echo "Warning: Package installation failed."

echo "Package installation completed."
