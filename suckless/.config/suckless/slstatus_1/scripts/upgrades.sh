#!/bin/bash

upgrades(){
	#updates="$(aptitude search '~U' | wc -l)"
	#updates="$(cat ~/.local/share/updatecount.txt)"
	updates="$(apt list --upgradable | wc -l)"
    [ "$updates" -le 1 ] && printf "🧰 fully updated"\
	|| printf "🧰 $updates updates"
}

echo $(upgrades)
