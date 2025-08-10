#!/bin/bash

# Adding Contrib and Non-Free Repositories 
sudo add-apt-repository contrib
sudo add-apt-repository non-free
sudo apt update
sudo apt install vim sudo git 
git clone https://github.com/dobbbri/.dotfiles.git 

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


