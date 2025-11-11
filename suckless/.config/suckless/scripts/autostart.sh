#!/bin/sh

slstatus &

hsetroot -cover ~/.dotfiles/pictures/unnamed.jpg &
# hsetroot -cover ~/.dotfiles/pictures/kristaps-ungurs-x8Oro9-tG64-unsplash.jpg &

# /usr/bin/syncthing serve --no-browser --no-restart --logflags=0 &

# polkit agent
# if [[ ! `pidof xfce-polkit` ]]; then
# 	/usr/lib/xfce-polkit/xfce-polkit &
# fi

# Enable power management
# xfce4-power-manager &

if [[ $(pidof dunst) ]]; then
  pkill dunst
fi
dunst -config ~/.config/suckless/dunst/dunstrc &

picom --config ~/.config/suckless/picom/picom.conf &

# Fix cursor
xsetroot -cursor_name left_ptr
