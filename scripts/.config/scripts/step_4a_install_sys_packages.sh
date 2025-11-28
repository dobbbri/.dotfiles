#!/bin/bash

sudo apt install -y xorg xorg-dev dbus-x11 xbacklight xbindkeys xinput hsetroot brightnessctl \
  dialog gvfs-backends libnotify-bin xdotool unzip libnotify-dev alsa-utils \
  curl unzip ssh-askpass wget stow papirus-icon-theme heif-gdk-pixbuf webp-pixbuf-loader \
  xdg-user-dirs-gtk build-essential cmake meson ninja-build wget \
  pkg-config || echo "Warning: Package installation failed."

echo "Package installation completed."
