#!/bin/bash

echo "-Enable/Fix tap to click"
sudo apt remove --yes xserver-xorg-input-synaptics
sudo apt install --yes xserver-xorg-input-libinput
sudo cp ~/.dotfiles/scripts/.config/scripts/config/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf

echo "remove modemmanager"
sudo apt autoremove modemmanager -y

echo "Remove printer services"
sudo apt autoremove cups system-config-printer simple-scan -y

echo "Remove bluetooth services"
sudo apt autoremove blueman bluez-utils bluez bluetooth -y

echo "Remove xdg-desktop-portal-gtk"
sudo apt autoremove xdg-desktop-portal-gtk -y

# echo "Remove pulseaudio"
# systemctl --user stop pulseaudio.service pulseaudio.socket
# systemctl --user disable pulseaudio.service pulseaudio.socket
# systemctl --user mask pulseaudio.service
# sudo apt autoremove pulseaudio pulseaudio-utils gstreamer1.0-pulseaudio libpulse0 libpulse-mainloop-glib0 libpulsedsp -y
# rm -rf ~/.config/pulse ~/.pulse ~/.pulse-cookie
