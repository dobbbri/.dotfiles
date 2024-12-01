#!/bin/bash

## RAM
mem() {
  mem="$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
  echo -e " $mem"
}

## TEMP
temp() {
  TEMP="$(sensors | awk 'BEGIN{i=0;t=0;b=0}/id [0-9]/{b=$4};/Core/{++i;t+=$3}END{if(i>0){printf("%0.1f\n",t/i)}else{sub(/[^0-9.]/,"",b);print b}}')"
  echo -e " $TEMP "
}

## BATT
power() {
  PWR=$(cat /sys/class/power_supply/BAT0/capacity)
  echo -e "  $PWR%"
}

## VOL
volume() {
  VOL="$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))"
  echo -e "$VOL"
}

## SCREEN BRIGHTNESS
backlight() {
  BLT="$(brightnessctl get | awk '{print int($1)}')"
  echo -e "$BLT%"
}

## DATE
clock() {
  dte="$(date +"%a, %B %d %l:%M%p" | sed 's/  / /g')"
  echo -e "$dte "
}

while true; do
  xsetroot -name "  $(power)    $(mem)    $(temp)     $(volume)     $(backlight)   $(clock) "
  sleep 5s
done &
