# polkit
# /usr/lib/lxpolkit &
# /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
 
dunst -config ~/.config/i3/dunst/dunstrc &
# picom --config ~/.config/i3/picom/picom.conf --animations -b &

xwallpaper --zoom ~/.dotfiles/pictures/mar.png &

~/.config/i3/scripts/polybar-i3 &

if hash sxhkd >/dev/null 2>&1; then
	pkill sxhkd
	sleep 0.5
	sxhkd -c "$HOME/.config/i3/sxhkd/sxhkdrc" &
fi
