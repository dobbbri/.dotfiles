#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession &

export DESKTOP_SESSION=dwm     # values: dwm dk i3 bspwm
/usr/local/bin/slstatus &
exec /usr/local/bin/dwm

# exec dk
# exec i3
# exec bspwm 


# polkit
# /usr/lib/lxpolkit &
# /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
# dunst -config ~/.config/suckless/dunst/dunstrc &
# hsetroot -cover ~/.dotfiles/pictures/plasma1366x768.png &
# ~/.config/bspwm/scripts/polybar-bspwm &
# picom --config ~/.config/suckless/picom/picom.conf --animations -b &
# exec dbus-run-session bspwm 

