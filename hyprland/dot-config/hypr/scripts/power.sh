#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5

# Current Theme
dir="$HOME/.config/rofi/styles"
theme='style-powermenu'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`whoami`

# Options
shutdown='Shutdown'
reboot='Reboot'
lock='Lock'
suspend='Suspend'
logout='Logout'
yes='Yes'
no='No'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$host" \
		-mesg "Uptime: $uptime" \
		-click-to-exit \
		-theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$logout\n$shutdown\n$reboot\n$suspend" | rofi_cmd
}

__poweroff() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		echo ":: Shutdown"
		sleep 0.5
		systemctl poweroff
	fi
}

__reboot() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		echo ":: Reboot"
		sleep 0.5
		systemctl reboot
	fi
}

__suspend() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		echo ":: Suspend"
		sleep 0.5
		systemctl suspend
	fi
}

__logout() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		echo ":: Logout"
		sleep 0.5
		killall -9 Hyprland
		sleep 2
	fi
}

__lock() {
	echo ":: Lock"
	slepp 0.5
	hyprlock
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
  $shutdown)
    __shutdown
    ;;
  $reboot)
    __reboot
    ;;
  $lock)
    __lock
    ;;
  $suspend)
    __suspend
    ;;
  $logout)
    __logout
    ;;
esac
