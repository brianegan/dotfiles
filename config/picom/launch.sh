#!/bin/bash
for pid in $(pgrep -f $0); do
    if [ $pid != $$ ]; then
        kill $pid
    fi
done

pgrep -x picom > /dev/null || picom --experimental-backends &

while sleep 10; do  
    # Read from the blacklist file
    while IFS="" read -r p || [ -n "$p" ]; do
        if [[ -n $(pgrep $p) ]]; then 
            killall picom
            while [[ -n $(pgrep $p) ]]; do 
                sleep 5 
            done 
            picom --experimental-backends &
        fi 
    done < /home/brian/.config/picom/blacklist
done

