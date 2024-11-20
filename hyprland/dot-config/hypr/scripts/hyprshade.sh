#!/bin/bash
#  _   _                      _               _      
# | | | |_   _ _ __  _ __ ___| |__   __ _  __| | ___ 
# | |_| | | | | '_ \| '__/ __| '_ \ / _` |/ _` |/ _ \
# |  _  | |_| | |_) | |  \__ \ | | | (_| | (_| |  __/
# |_| |_|\__, | .__/|_|  |___/_| |_|\__,_|\__,_|\___|
#        |___/|_|                                    
# 

hyprshadesettings="$HOME/.config/hypr/settings/hyprshade.sh"

run_rofi() {
    theme="$HOME/.config/rofi/styles/style-launcher.rasi"
    rofi -dmenu -replace -theme $theme -i -no-show-icons -l 4 -width 30 -p "Hyprshade"
}

enable_shade() {
    # Toggle Hyprshade based on the selected filter
    hyprshade_filter="blue-light-filter-50"

    # Check if hyprshade.sh settings file exists and load
    if [ -f $hyprshadesettings ] ;then
        source $hyprshadesettings
    fi

    # Toggle Hyprshade
    if [ "$hyprshade_filter" != "off" ] ;then
        if [ -z $(hyprshade current) ] ;then
            echo ":: hyprshade is not running"
            hyprshade on $hyprshade_filter
            notify-send "Hyprshade activated" "with $(hyprshade current)"
            echo ":: hyprshade started with $(hyprshade current)"
        else
            notify-send "Hyprshade deactivated"
            echo ":: Current hyprshade $(hyprshade current)"
            echo ":: Switching hyprshade off"
            hyprshade off
        fi
    else
        hyprshade off
        echo ":: hyprshade turned off"
        notify-send "Hyprshade deactivated"
    fi

}

if [[ "$1" == "rofi" ]]; then
    # Open rofi to select the Hyprshade filter for toggle
    options="$(hyprshade ls)\nOff"
    
    # Open rofi
    choice=$(echo -e "$options" | run_rofi) 
    if [ ! -z $choice ] ;then
        echo "hyprshade_filter=\"$choice\"" > $hyprshadesettings
        enable_shade
    fi
else
    enable_shade
fi
