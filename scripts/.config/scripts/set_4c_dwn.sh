#!/bin/bash

# https://dwm.suckless.org/

echo "Compile DWM ---------------------------------------------------------------"

tools=( "dwm" "st" "slstatus" "dmenu" "slock" "surf" )
for tool in ${tools[@]}
do 
	cd $HOME/.config/suckless/$tool
  make
  sudo make clean install
done

