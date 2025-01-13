#!/bin/bash
#   ____ _ _       _     _     _
#  / ___| (_)_ __ | |__ (_)___| |_
# | |   | | | '_ \| '_ \| / __| __|
# | |___| | | |_) | | | | \__ \ |_
#  \____|_|_| .__/|_| |_|_|___/\__|
#           |_|
#

dmenu() {
  rofi -dmenu -p "Cliphist" -theme "$HOME/.config/rofi/styles/style-launcher.rasi"
  # wofi --dmenu --prompt=clipboard-history -i $@
}

case $1 in
d)
  cliphist list | dmenu | cliphist delete
  ;;

w)
  if [ $(echo -e "Clear\nCancel" | dmenu) == "Clear" ]; then
    cliphist wipe
  fi
  ;;

*)
  cliphist list | dmenu | cliphist decode | wl-copy
  ;;
esac
