#!/bin/sh

slstatus &

hsetroot -cover ~/.dotfiles/pictures/plasma1366x768.png &

# /usr/bin/syncthing serve --no-browser --no-restart --logflags=0 &

# polkit
lxpolkit &

dunst -config ~/.config/suckless/dunst/dunstrc &

picom --config ~/.config/suckless/picom/picom.conf &

# Fix cursor
xsetroot -cursor_name left_ptr
