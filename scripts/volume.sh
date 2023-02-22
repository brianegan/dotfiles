#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
    amixer get Master | grep -Po '[0-9]+(?=%)' | head -1
}

function is_mute {
    amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function update_osd {
	if is_mute; then
		volnoti-show -m
	else
		volnoti-show `get_volume`
	fi
}

function send_notification {
	volume=`get_volume`
	icon=`get_icon`

	dunstify -r 2593 -a "volume_control_script" -h int:value:$volume "" "\n               <span font=\"polybar 48\">$icon</span>"
}

function get_icon {
	if is_mute; then
		echo ""
	else
		volume=`get_volume`

		if ((volume<10)); then
			echo ""
		elif ((10<=volume && volume<=60)); then
			echo ""
		else
			echo ""
		fi
	fi
}

case $1 in
    up)
	pactl set-sink-mute @DEFAULT_SINK@ 0

	if ((`get_volume`<=98)); then
		pactl set-sink-volume @DEFAULT_SINK@ +$2%
	fi

	update_osd 
	;;
    down)
	pactl set-sink-mute @DEFAULT_SINK@ 0
	pactl set-sink-volume @DEFAULT_SINK@ -$2%
	update_osd
	;;
    mute)
	pactl set-sink-mute @DEFAULT_SINK@ toggle
	update_osd 
	;;
esac
