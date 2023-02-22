#!/bin/bash
LOGOUT="Log out"
SHUTDOWN="Shut Down"
REBOOT="Reboot"
SELECTION=$(printf "$LOGOUT\n$REBOOT\n$SHUTDOWN" | rofi -dmenu -lines 3 -i -no-default-config)

case $SELECTION in
  $LOGOUT)
    bspc quit
    ;;

  $SHUTDOWN)
    shutdown now
    ;;

  $REBOOT)
    reboot
    ;;
esac
