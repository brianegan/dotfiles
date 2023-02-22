#!/bin/bash

list_sinks() {
    sinks=$(pactl list sinks | grep -e 'Description:' | awk -F': ' '{print $2}') || return 1
    echo "$sinks" | sed -e "s/\t/\ /g"
}

selection_index_to_sink_name() {
    pactl list sinks | grep -e 'Name:' | awk -v n=$(($1 + 1)) -F': ' '{if(NR==n) print $2}'
}

select_sink() {
    selection_index="$(list_sinks | rofi -dmenu -format i)" || return 1
    [ -n "$selection_index" ] || return 1
    sink_name=$(selection_index_to_sink_name $selection_index) || return 1

    pactl set-default-sink $sink_name
}

case "$1" in
	list) list_sinks || exit 1;;
    current);;
	*) select_sink || exit 1;;
esac

exit 0
