#!/bin/bash
########################################################################
# PARVEZ AHMEDS BATTERY SCRIPT!
########################################################################
while true; do
    battery_percentage=$(cat /sys/class/power_supply/BAT0/capacity)
    charging_status=$(cat /sys/class/power_supply/BAT0/status)
    if [ "$battery_percentage" -lt 15 ] && [ "$charging_status" != "Charging" ]; then
        notify-send -u critical "Laptop Batteries are LOW!" "Your Laptop Batteries are now at ${battery_percentage}%. Please Plug in Your Laptop Charger NOW!"
    fi
    sleep 60
done
