#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# star some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


export _GL_SYNC_DISPLAY_DEVICE=DP-4
export QT_STYLE_OVERRIDE=adwaita-dark
export PATH=/home/brian/.local/bin:$PATH
export XDG_SESSION_TYPE=x11
xset r rate 250 31 & 

# xfce
# exec startxfce4

# Gnome
# export XDG_SESSION_TYPE=x11
# export GDK_BACKEND=x11
# exec gnome-session

# i3
# exec i3

# bspwm
export XDG_SESSION_DESKTOP=bspwm
exec bspwm

# chamfer
# exec stdbuf -oL -eL chamfer --shader-path=/usr/share/chamfer/shaders/ > /tmp/log 2>&1

# KDE
#export DESKTOP_SESSION=plasma
#exec startplasma-x11
