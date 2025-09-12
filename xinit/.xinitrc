#!/bin/sh

# /etc/X11/xinit/xinitrc
# global xinitrc file, used by all X sessions started by xinit (startx)
# invoke global X session script
# . /etc/X11/Xsession &

export DESKTOP_SESSION=dwm
slstatus &
exec dbus-run-session dwm

# export DESKTOP_SESSION=dk
# exec dbus-run-session dk

# export DESKTOP_SESSION=i3
# exec dbus-run-session i3

# export DESKTOP_SESSION=bspwm
# exec dbus-run-session bspwm
