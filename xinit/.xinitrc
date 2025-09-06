# #!/bin/bash 

#export DESKTOP_SESSION=dk
# exec dk

export DESKTOP_SESSION=dwm
/usr/local/bin/slstatus &
exec dbus-run-session /usr/local/bin/dwm

# export DESKTOP_SESSION=i3
# exec i3

# export DESKTOP_SESSION=bspwm
# exec dbus-run-session bspwm 
