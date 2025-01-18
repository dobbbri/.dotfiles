#!/bin/shell

echo "install sudo ---------------------------------------------------------"
#login with my user as password
# change to root (dont forget the minus)

su -

echo "clone dotfiles -------------------------------------------------------"
apt install vim sudo git 
git clone https://github.com/dobbbri/.dotfiles.git 


# vi  /etc/apt/sources.list 
# add "contrib non-free"
rm /etc/apt/sources.list
cp $HOME/.dotfiles/scripts/.config/scripts/config/sources.list /etc/apt/sources.list


echo "intall xorg ---------------------------------------------------------"
sudo apt update
sudo apt install xorg xserver-xorg dbus -yy


echo "fix brightness ------------------------------------------------------"
sudo apt install brightnessctl -yy

sudo brightnessctl --device='smc::kbd_backlight' set 30
sudo brightnessctl --device='acpi_video0' set 2


echo "edit sudoers ---------------------------------------------------------"
vi /etc/sudoers
# add:
# sergio ALL=(ALL:ALL) ALL 

# exit from root
exit
git clone https://github.com/dobbbri/.dotfiles.git 
# exit from my login
exit
# login


