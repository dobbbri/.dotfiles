#!/bin/sh

export DESKTOP_SESSION=dwm
# Set keyboard repeat rate
xset r rate 250 60

# Fix cursor
xsetroot -cursor_name left_ptr

# Set root window background color
# xsetroot -solid black

slstatus &

hsetroot -cover ~/.dotfiles/pictures/big-city.jpg &

# /usr/bin/syncthing serve --no-browser --no-restart --logflags=0 &

# xfce4-power-manager &
# xfce4-session &
# lxpolkit &

dunst -config ~/.config/suckless/dunst/dunstrc &

picom --config ~/.config/suckless/picom/picom.conf &

