#!/bin/bash

mem() {
    used="$(free | awk '/Mem:/ {print $3}')"
    total="$(free | awk '/Mem:/ {print $2}')"
    human="$(free -h | awk '/Mem:/ {print $3}' | sed 's/i//g')"
    percent="$(( 200 * $used/$total - 100 * $used/$total ))"
    ram="$(( 200 * $used/$total - 100 * $used/$total ))%($human) "
	echo $ram
}

echo "🧠 $(mem)"
