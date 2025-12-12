#!/bin/sh

session=${1:-dwm}

case $session in
i3)
  export DESKTOP_SESSION=i3
  exec dbus-launch --exit-with-session i3
  ;;
bspwm)
  exec bspwm
  ;;
dk)
  export DESKTOP_SESSION=dk
  exec dbus-launch --exit-with-session dk
  ;;
dwm)
  export DESKTOP_SESSION=dwm
  exec dbus-run-session dwm
  ;;
xfce4)
  exec startxfce4
  ;;
# No known session, try to run it as command
*)
  exec $1;;
esac

# execute
# startx ~/.xinitrc xfce4
