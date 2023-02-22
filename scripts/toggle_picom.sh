#!/bin/bash
PICOMPID=$(pgrep -x picom)

if [[ -n $PICOMPID ]]; then
  kill $PICOMPID;
else
  picom --experimental-backends &
fi

