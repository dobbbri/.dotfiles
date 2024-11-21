#!/bin/sh

echo "install sudo ---------------------------------------------------------"
#login with my user as password
# change to root (dont forget the minus)
su -
apt update
apt install vim git

usermod -aG sudo sdobri
groups sdobri

sudo vim /etc/apt/sources.list
# add "main contrib non-free"
deb http://deb.debian.org/debian bookworm contrib main non-free-firmware
deb http://deb.debian.org/debian bookworm-updates contrib main non-free-firmware
deb http://deb.debian.org/debian bookworm-backports contrib main non-free-firmware
deb http://deb.debian.org/debian-security bookworm-security contrib main non-free-firmware

# exit from root
exit
# exit from my login
exit
# login

echo "New wifi driver ---------------------------------------------------------------"
sudo apt update
sudo apt install network-manager
sudo apt remove broadcom-sta-dkms && sudo apt install broadcom-sta-dkms
sudo apt upgrade
sudo systemctl reboot
