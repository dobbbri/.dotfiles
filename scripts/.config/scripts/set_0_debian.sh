#!/bin/sh

echo "install sudo ---------------------------------------------------------"
#login with my user as password
# change to root (dont forget the minus)
su -
apt update
apt install vim sudo git 

vi /etc/sudoers
#add:
sergio ALL=(ALL:ALL) ALL 

sudo vi /etc/apt/sources.list
# add "contrib non-free"
deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware
deb http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
deb-src http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
deb http://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware

# exit from root
exit
# exit from my login
exit
# login

sudo apt install brightnessctl xorg xserver-xorg xwallpaper -yy

sudo brightnessctl --device='smc::kbd_backlight' set 30
sudo brightnessctl --device='acpi_video0' set 2


echo "clone dotfiles ---------------------------------------------------------"
git clone https://github.com/dobbbri/.dotfiles.git $HOME/.dotfiles/
