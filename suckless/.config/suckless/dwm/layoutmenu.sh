#!/bin/bash

cat <<EOF | xmenu
[\\] Dwindle Layout	0
[]= Tiled Layout	1
[M] Monocle Layout	2
[@] Spiral Layout	3
H[] Deck Layout	4
TTT B Stack Layout	5
=== B Stack Horiz. Layout	6
HHH Grid Layout	7
### N Row Grid Layout	8
--- Horizgrid Layout	9
::: Gaplessgrid Layout	10
|M| Centered Layout	11
>M> Centered Floating Layout	12
><> Floating Layout	13
EOF
