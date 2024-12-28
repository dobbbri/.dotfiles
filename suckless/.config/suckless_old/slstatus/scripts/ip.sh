#!/bin/bash

networkicon() {
wire="$(ip a | awk '/enp/ && /inet 1/ || /eth/ && /inet 1/ {print $NF}' | wc -l)"
wifi="$(ip a | awk '/wlp/ && /inet 1/ {print $NF}' | wc -l)"
if [ $wire = 1 ]; then
    printf "🧵"
elif [ $wifi = 1 ]; then
    printf "🛜 "
else
    printf "🚫"
fi
}

ipaddress() {
    address="$(ip a | awk '/.255/ {print $2}' | sed -e 's|/24||' -e 1q)"
    printf "$address"
}

vpnconnection() {
    state="$(ip a | awk '/tun0/ && /inet/ {print $NF}' | wc -l)"
if [ $state = 1 ]; then
    printf "🔐"
else
    printf "⚠" 
fi
}

echo "$(networkicon) $(ipaddress) $(vpnconnection)"
