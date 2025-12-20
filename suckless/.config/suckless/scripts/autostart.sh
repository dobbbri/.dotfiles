#!/bin/sh

xset r rate 250 60

xsetroot -cursor_name left_ptr

slstatus &

hsetroot -cover ~/.dotfiles/pictures/nice-blue.png &

dunst -config ~/.config/suckless/dunst/dunstrc &

picom --config ~/.config/suckless/picom/picom.conf &

# /usr/bin/syncthing serve --no-browser --no-restart --logflags=0 &

