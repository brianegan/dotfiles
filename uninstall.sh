# Does not delete any files.
#
# Moves everything to the Trash using trash-cli utility 
# https://github.com/andreafrancia/trash-cli
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

# Home
echo "Uninstalling home files"
find $SCRIPTPATH -maxdepth 1 -type f -name '.*' -printf "%P\n" | while read file; do trash $file; done

# Scripts
echo "Uninstalling scripts"
trash .scripts

# Config
echo "Uninstalling config files"
CONFIG_DIR=.config
pushd $CONFIG_DIR > /dev/null
find $SCRIPTPATH/config -mindepth 1 -maxdepth 1 -printf "%P\n" | while read file; do trash $file; done
popd > /dev/null

# Wallpapers
echo "Uninstalling wallpapers"
WALLPAPER_DIR=Pictures/Wallpapers
mkdir -p $WALLPAPER_DIR
pushd $WALLPAPER_DIR > /dev/null
find $SCRIPTPATH/wallpapers -maxdepth 1 -type f -printf "%P\n" | while read file; do trash $file; done
popd > /dev/null

# Fonts
echo "Uninstalling fonts"
FONTS_DIR=.local/share/fonts
mkdir -p $FONTS_DIR
pushd $FONTS_DIR > /dev/null
find $SCRIPTPATH/fonts/feather-polybar/fonts -maxdepth 1 -type f -printf "%P\n" | while read file; do trash $file; done
popd > /dev/null
echo "Rebuilding font cache"
fc-cache -f -v > /dev/null
