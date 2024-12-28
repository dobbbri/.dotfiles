#!/bin/bash

# https://dwm.suckless.org/

#install libs
sudo apt install gcc make libxft-dev libxinerama-dev libxcb1-dev libx11-dev -yy

echo "Compile DWM ---------------------------------------------------------------"

tools=( "dwm" "st" "slstatus" "dmenu" "slock" "surf" )
for tool in ${tools[@]}
do 
	cd $HOME/.config/suckless/$tool
  make
  sudo make clean install
done

