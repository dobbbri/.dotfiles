#!/bin/bash 

bat() {
	status="$(cat /sys/class/power_supply/BAT0/status)"
	capacity="$(cat /sys/class/power_supply/BAT0/capacity)"

  if [ $status = 'Charging' ]; then
    status="🔌"
	  echo "$status $capacity%"
	elif [[ $capacity -ge 1 ]] && [[ $capacity -le 25 ]]; then
    status="🪫"
	  echo "$status $capacity%"
  elif [[ $capacity -ge 26 ]]; then
    status="🔋"
	  echo "$status $capacity%"
  fi
}
echo $(bat)
