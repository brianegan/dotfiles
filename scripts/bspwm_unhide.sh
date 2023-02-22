#!/bin/bash
windows=($(bspc query -N -n .window.hidden))
index="$(for i in "${!windows[@]}"; do printf "%s %s\n" $i "$(xtitle ${windows[i]})"; done | rofi -dmenu)" &&
    bspc node "${windows[${index%% *}]}" -g hidden=off
