#!/bin/sh

export DESKTOP_SESSION=dwm

# slstatus &

# polkit
# /usr/lib/lxpolkit &
# /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# background
xwallpaper --zoom ~/.dotfiles/pictures/nice-blue.png &

dunst -config ~/.config/suckless/dunst/dunstrc &
# picom --config ~/.config/suckless/picom/picom.conf --animations -b &
