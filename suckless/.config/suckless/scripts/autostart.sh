#!/bin/sh

# slstatus &

# polkit
# /usr/lib/lxpolkit &
# /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# background
xwallpaper --zoom ~/.dotfiles/pictures/nice-blue.png &

# sxhkd
# (re)load sxhkd for keybinds
if hash sxhkd >/dev/null 2>&1; then
	pkill sxhkd
	sleep 0.5
	sxhkd -c "$HOME/.config/suckless/sxhkd/sxhkdrc" &
fi

dunst -config ~/.config/suckless/dunst/dunstrc &
picom --config ~/.config/suckless/picom/picom.conf --animations -b &
