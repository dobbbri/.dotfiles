#!/bin/bash

brightness() {
	max_brightness="$(cat /sys/class/backlight/acpi_video0/max_brightness)"
	current_brightness="$(cat /sys/class/backlight/acpi_video0/brightness)"
	percent=$(awk "BEGIN { pc=100*${current_brightness}/${max_brightness};
	i=int(pc); print (pc-1<0.5)?i:i+1 }")
	echo "💡$percent%"

}

echo $(brightness)
