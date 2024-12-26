#!/bin/bash

cpu() {
    cpu_value=$(grep -o "^[^ ]*" /proc/loadavg)
    echo "🖥 $cpu_value%"
}

echo $(cpu)
