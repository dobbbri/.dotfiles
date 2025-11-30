#!/bin/sh

# /etc/X11/xinit/xinitrc
# global xinitrc file, used by all X sessions started by xinit (startx)
# invoke global X session script
# . /etc/X11/Xsession &

# Here dwm is kept as default
export DESKTOP_SESSION=dwm
session=${1:-dwm}

case $session in
i3   ) export DESKTOP_SESSION=i3 ;;
bspwm) export DESKTOP_SESSION=bspwm ;;
dk   ) export DESKTOP_SESSION=dk ;;
dwm  ) export DESKTOP_SESSION=dwm ;;
esac

case $session in
i3   ) exec i3 ;;
bspwm) exec bspwm ;;
dk   ) exec dk ;;
dwm  ) exec dwm ;;
xfce4) exec startxfce4 ;;
# No known session, try to run it as command
*    ) exec $1 ;;
esac

# execute
# startx ~/.xinitrc xfce4
