#!/bin/bash

black=#1d2021
midgray=#665c54
white=#ebdbb2
red=#cc241d
brightred=#fb4934
green=#689d6a
lightgreen=#8ec07c
blue=#076678
lightblue=#458588
yellow=#d79921
brightyellow=#fabd2f
purple=#8f3f71

speakericon="/usr/share/icons/Adwaita/16x16/devices/audio-speakers-symbolic.symbolic.png"

bat() {
	batstat="$(cat /sys/class/power_supply/BAT0/status)"
	bat0="$(cat /sys/class/power_supply/BAT0/capacity)"
  capacity="$(bat0)"
    
	if [ $batstat = 'Charging' ]; then
    batstat="🔌"
	echo "$batstat^b$black^^c$lightblue^$capacity%"
	elif [[ $capacity -ge 1 ]] && [[ $capacity -le 25 ]]; then
    batstat="🪫"
	echo "$batstat^b$black^^c$red^$capacity%"
    elif [[ $capacity -ge 26 ]]; then
    batstat="🔋"
	echo "$batstat^b$black^^c$lightgreen^$capacity%"
    fi
}

### BRIGHTNESS Module
brightness() {
	max_brightness="$(cat /sys/class/backlight/intel_backlight/max_brightness)"
	current_brightness="$(cat /sys/class/backlight/intel_backlight/brightness)"
	percent=$(awk "BEGIN { pc=100*${current_brightness}/${max_brightness};
	i=int(pc); print (pc-1<0.5)?i:i+1 }")
	echo "💡$percent%"

}

### CPU Module ###
cpu() {
    cpu_value=$(grep -o "^[^ ]*" /proc/loadavg)
    echo "🖥 $cpu_value%"
}

### RAM Module ###
mem() {
    used="$(free | awk '/Mem:/ {print $3}')"
    total="$(free | awk '/Mem:/ {print $2}')"
    human="$(free -h | awk '/Mem:/ {print $3}' | sed 's/i//g')"
    percent="$(( 200 * $used/$total - 100 * $used/$total ))"
    ram="$(( 200 * $used/$total - 100 * $used/$total ))%($human) "

    #if [[ $percent -le 25 ]]; then
    #    echo "^b$black^   ^c$green^ $ram"
    #elif [[ $percent -ge 26 ]]; then
    #    echo "^b$black^   ^c$yellow^ $ram"
    #elif [[ $percent -ge 76 ]]; then
    #    echo "^b$black^   ^c$red^  $ram"
    #fi
    if [[ $percent -le 25 ]]; then
        echo "^b$black^🧠^c$green^ $ram^c$white^"
    elif [[ $percent -ge 26 ]]; then
        echo "^b$black^🧠^c$yellow^ $ram^c$white^"
    elif [[ $percent -ge 76 ]]; then
        echo "^b$black^🧠^c$red^ $ram^c$white^"
    fi
}

### UPDATE Module ###
upgrades(){
	#updates="$(aptitude search '~U' | wc -l)"
	updates="$(cat ~/.local/share/updatecount.txt)"
    [ "$updates" = 0 ] && printf "^b$black^🧰^c$yellow^ fully updated^c$white^"\
	|| printf "^b$black^🧰^c$red^ $updates updates^c$white^"
}

### STORAGE Module ###
hdd() {
    free="$(df -h /home | awk '/dev/ {print $3}' | sed 's/G/Gb/')"
    perc="$(df -h /home | awk '/dev/ {print $5}')"
    number="$(df -h /home | awk '/dev/ {print $5}' | sed 's/%//')"
   # if [[ $number -le 50 ]]; then
   #     echo "^b$black^ ^c$green^  $perc($free) "
   # elif [[ $number -ge 51 ]]; then
   #     echo "^b$black^ ^c$yellow^  $perc($free) "
   # elif [[ $number -ge 90 ]]; then
   #     echo "^b$black^ ^c$red^  $perc($free) "
   # fi
    
    if [[ $number -le 50 ]]; then
        echo "^b$black^💾^c$green^ $perc($free)^c$white^"
    elif [[ $number -ge 51 ]]; then
        echo "^b$black^💾^c$yellow^ $perc($free)^c$white^"
    elif [[ $number -ge 90 ]]; then
        echo "^b$black^💾^c$red^ $perc($free)^c$white^"
    fi
    }

networkicon() {
wire="$(ip a | awk '/enp/ && /inet 1/ || /eth/ && /inet 1/ {print $NF}' | wc -l)"
wifi="$(ip a | awk '/wlp/ && /inet 1/ {print $NF}' | wc -l)"
if [ $wire = 1 ]; then
    printf "^b$black^^c$white^🧵"
elif [ $wifi = 1 ]; then
    printf "^b$black^^c$yellow^🛜 "
else
    printf "^b$black^^c$red^🚫"
fi
}
#############################
#       IP ADDRESS
#############################
ipaddress() {
    address="$(ip a | awk '/.255/ {print $2}' | sed -e 's|/24||' -e 1q)"
    printf "^b$black^^c$white^$address"
}
############################
#       VPN CONNECTION
############################
vpnconnection() {
    state="$(ip a | awk '/tun0/ && /inet/ {print $NF}' | wc -l)"
if [ $state = 1 ]; then
    printf "🔐"
else
    printf "⚠" 
fi
}
volume() {
    VOLONOFF="$(amixer scontents | awk '/Left: Playback/ {print $NF}' | sed 's/[][]//g')"
    VOL="$(amixer scontents | awk '/Left: Playback/ {print $5}' | sed 's/[][]//g; s/%//')"
    LOWVOL="🔈"
    MIDVOL="🔉"
    HIVOL="🔊"
    VOLOFF="🔇"

    if [[ "$VOLONOFF" = "off" ]] || [[ "$VOL" = 0 ]]; then
        echo "^b$black^^c$red^$VOLOFF^c$white^"
    elif [[ "$VOL" -ge 1 ]] && [[ "$VOL" -le 25 ]]; then
        echo "^b$black^^c$green^$LOWVOL $VOL%^c$white^"
    elif [[ "$VOL" -ge 26 ]] && [[ "$VOL" -le 74 ]]; then
        echo "^b$black^^c$yellow^$MIDVOL $VOL%^c$white^"
    elif [[ "$VOL" -ge 75 ]] ; then
        echo "^b$black^^c$purple^$HIVOL $VOL%^c$white^"
    fi
}

forecast() {
    weather=$(awk '/value/ {print $2" "$3}' ~/.config/weather.txt | sed -e 's/\"//g' -e 1q)
    case "$weather" in
        "Clear ") icon="☀" ;;
        "Sunny ") icon="☀" ;;
        "Partly cloudy") icon="⛅" ;;
        "Cloudy") icon="☁️ " ;;
        "Overcast") icon="☁️ " ;;
        "Fog") icon="☁️ " ;;
        "Mist") icon="☁️ " ;;
        "Light rain") icon=" 🌧️" ;;
        "Light drizzle") icon=" 🌧️" ;;
        "Rain") icon=" 🌧️ " ;;
        "Patchy rain") icon=" 🌧️"  ;;
        "Moderate rain") icon=" 🌧️" ;;
        "Thunderstorm in") icon="⛈️ " ;;
        *) icon="⛅" ;;
    esac

   if [ $icon = ☀️ ]; then
       echo "^b$black^^c$yellow^ $icon ^c$white^$weather^c$white^"
   else
       printf "^b$black^^c$blue^ $icon ^c$white^$weather^c$white^"
   fi
}

temperature() {
temp=$(awk '/temp_F/ {print $2}' ~/.config/weather.txt | sed -e 's/\"//g' -e 's/,//')
tempicon="🌡"

if [ "$temp" -gt 80 ]; then
	printf  "^b$black^$tempicon^c$white^$temp F ^c$white^"
elif [ "$temp" -ge 50 ] && [ "$temp" -le 79 ]; then
	printf "^b$black^$tempicon^c$white^$temp F ^c$white^"
elif [ "$temp" -le 49 ]; then
	printf "^b$black^$tempicon^c$white^$temp F ^c$white^"
fi
}

clockinfo() {
    CLOCK=$(date '+%I')
    case "$CLOCK" in
    "00") icon="🕛" ;;
    "01") icon="🕐" ;;
    "02") icon="🕑" ;;
    "03") icon="🕒" ;;
    "04") icon="🕓" ;;
    "05") icon="🕔" ;;
    "06") icon="🕕" ;;
    "07") icon="🕖" ;;
    "08") icon="🕗" ;;
    "09") icon="🕘" ;;
    "10") icon="🕙" ;;
    "11") icon="🕚" ;;
    "12") icon="🕛" ;;
    esac
    echo "^b$black^🗓^c$lightblue^ $(date "+%b %d %Y (%a)")^b$black^^c$purple^ $(date "+$icon")^b$black^^c$yellow^ $(date "+%R") ^c$white^"

    #echo "^b$black^^c$yellow^ $(date "+%R")"

    #echo "^b$black^^c$blue^ $(date "+%b %d %Y (%a)")"
}

while true; do

  xsetroot -name "$(bat)   $(mem)   $(cpu)   $(volume)   $(clockinfo)"
	# xsetroot -name "$(bat) $(brightness) $(cpu) $(mem)$(upgrades) $(hdd) $(networkicon)$(ipaddress) $(vpnconnection)  $(volume) $(forecast)$(temperature) $(clockinfo)"
    sleep 10
done
