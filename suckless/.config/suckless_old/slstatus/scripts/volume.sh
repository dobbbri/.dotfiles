#!/bin/bash

volume() {
    VOLMUTED="$(pamixer --get-volume-human)"
    VOL="$(pamixer --get-volume)"
    LOWVOL="🔈"
    MIDVOL="🔉"
    HIVOL="🔊"
    VOLOFF="🔇"

    if [[ "$VOLMUTED" = "muted" ]] || [[ "$VOL" = 0 ]]; then
        echo "$VOLOFF"
    elif [[ "$VOL" -ge 1 ]] && [[ "$VOL" -le 25 ]]; then
        echo "$LOWVOL $VOL%"
    elif [[ "$VOL" -ge 26 ]] && [[ "$VOL" -le 74 ]]; then
        echo "$MIDVOL $VOL%"
    elif [[ "$VOL" -ge 75 ]] ; then
        echo "$HIVOL $VOL%"
    fi
}
echo $(volume)
