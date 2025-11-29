#!/bin/sh

# /etc/X11/xinit/xinitrc
# global xinitrc file, used by all X sessions started by xinit (startx)
# invoke global X session script
# . /etc/X11/Xsession &

# export DESKTOP_SESSION=dk
# exec dbus-run-session dk

# export DESKTOP_SESSION=i3
# exec dbus-run-session i3

# export DESKTOP_SESSION=bspwm
# exec dbus-launch --exit-with-session bspwm

# export DESKTOP_SESSION=dwm
# exec dbus-launch --exit-with-session dwm
# exec dwm

# Here dwm is kept as default
session=${1:-dwm}

case $session in
    i3|i3wm           ) exec i3;;
    bsp               ) exec bspwm;;
    dk                ) exec dk;;
    dwm               ) exec dwm;;
    xfce|xfce4        ) exec startxfce4;;
    # No known session, try to run it as command
    *                 ) exec $1;;
esac
