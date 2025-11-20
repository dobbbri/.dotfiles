#!/bin/sh

# Set keyboard repeat rate
xset r rate 250 60

# Fix cursor
xsetroot -cursor_name left_ptr

# Set root window background color
# xsetroot -solid black

slstatus &

hsetroot -cover ~/.dotfiles/pictures/plasma1366x768.png &

# /usr/bin/syncthing serve --no-browser --no-restart --logflags=0 &

# polkit
# lxpolkit &

dunst -config ~/.config/suckless/dunst/dunstrc &

picom --config ~/.config/suckless/picom/picom.conf &

