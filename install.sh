#!/bin/sh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

# Home
echo "Symlinking home files"
find $SCRIPTPATH -maxdepth 1 -type f -name '.*' -printf "%P\n" | while read file; do ln -s "$SCRIPTPATH/$file" "$file"; done

# Scripts
echo "Symlinking scripts"
ln -s $SCRIPTPATH/scripts .scripts

# Config
echo "Symlinking config files"
CONFIG_DIR=.config
mkdir -p $CONFIG_DIR
pushd $CONFIG_DIR > /dev/null
ln -s $SCRIPTPATH/config/* .
popd > /dev/null

# Wallpapers
echo "Symlinking wallpapers"
WALLPAPER_DIR=Pictures/Wallpapers
mkdir -p $WALLPAPER_DIR
pushd $WALLPAPER_DIR > /dev/null
ln -s $SCRIPTPATH/wallpapers/* .
popd > /dev/null

# Fonts
echo "Symlinking fonts"
FONTS_DIR=.local/share/fonts
mkdir -p $FONTS_DIR
pushd $FONTS_DIR > /dev/null
ln -s $SCRIPTPATH/fonts/feather-polybar/fonts/* .
popd > /dev/null
echo "Rebuilding font cache"
fc-cache -f -v > /dev/null
