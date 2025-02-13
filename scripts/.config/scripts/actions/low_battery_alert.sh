#!/bin/bash

BATTERYLEVEL=$(cat /sys/class/power_supply/BAT0/capacity)

if [ $BATTERYLEVEL -lt 70 ]; then
   /usr/bin/notify-send --icon=battery-low "Warning" "Battery level is ${BATTERYLEVEL}%!"
fi

# Access the Cron file
# crontab -e 

# Check battery level every five minutes
# 5 * * * * /home/sdobri/.dotfiles/scripts/.config/scripts/actions/low_battery_alert.sh

# Verify the configuration
# crontab -l

# Verify task execution
# grep CRON /var/log/syslog
#
# sudo service cron reload
