#!/usr/bin/env bash

/home/sdobri/.config/suckless/dwmbar/batteryStatus &

/home/sdobri/.config/suckless/dwmbar/dwmbar &
# slstatus &

# background
# feh --bg-scale ~/dotfiles/images/macOS-Graphic-Dark.jpg &

# power manager
xfce4-power-manager &

# polkit
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# compositor
# picom --animations -b &

# Notifications
dunst &
