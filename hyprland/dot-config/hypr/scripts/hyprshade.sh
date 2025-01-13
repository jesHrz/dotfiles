#!/bin/bash
#  _    _                                           _
# | |  | |                                         | |
# | |__| |_   _ _ __  _ __ ___ _   _ _ __  ___  ___| |_
# |  __  | | | | '_ \| '__/ __| | | | '_ \/ __|/ _ \ __|
# | |  | | |_| | |_) | |  \__ \ |_| | | | \__ \  __/ |_
# |_|  |_|\__, | .__/|_|  |___/\__,_|_| |_|___/\___|\__|
#          __/ | |
#         |___/|_|
#

temperatures=(4000 4500 5000 5500 6000 6500)

dmenu() {
  theme="$HOME/.config/rofi/styles/style-launcher.rasi"
  rofi -dmenu -replace -theme $theme -i -no-show-icons -l ${#temperatures[@]} -width 30 -p "Hyprsunset"
}

select_temperature() {
  IFS=$'\n'
  cmd=$(echo "${temperatures[*]}")
  echo -n "$cmd" | dmenu
}

__notify() {
  notify-send "$1" --app-name="Hyprsunset" --urgency=low
}

enable_sunset() {
  /home/jeshrz/hyprsunset/_install/bin/hyprsunset --temperature $1 &
  __notify "Enable Hyprsunset ${1}K"
}

disable_sunset() {
  pkill hyprsunset
  sleep 0.5s
  __notify "Disable Hyprsunset"
}

toggle_sunset() {
  if pgrep -x "hyprsunset" >/dev/null; then
    disable_sunset
  else
    enable_sunset $1
  fi
}

if [ "$1" = "rofi" ]; then
  temperature=$(select_temperature)
  echo "$temperature"
  if [ ! -z "$temperature" ]; then
    enable_sunset $temperature
  fi
else
  toggle_sunset 5000
fi
