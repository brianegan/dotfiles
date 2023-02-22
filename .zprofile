 if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
   export _GL_SYNC_DISPLAY_DEVICE=DP-4
   exec ssh-agent startx
 fi

#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  export _GL_SYNC_DISPLAY_DEVICE=DP-4
#   exec sway
#fi

# if [[ -z $DISPLAY && $(tty) == /dev/tty1 && $XDG_SESSION_TYPE == tty ]]; then
  # MOZ_ENABLE_WAYLAND=1 QT_QPA_PLATFORM=wayland XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
#fi
