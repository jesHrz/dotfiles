#!/usr/bin/env sh

bus=5

set_brightness() {
  ddcutil --noverify --bus $bus setvcp 10 $@ 2>/dev/null
}

get_brightness() {
  ddcutil --noverify --bus $bus -t getvcp 10 2>/dev/null
}

# takes ddcutil commandline as arguments
print_brightness() {
    if brightness=$(get_brightness); then
        brightness=$(echo "$brightness" | cut -d ' ' -f 4)
    else
        brightness=-1
    fi
    echo '{ "percentage":' "$brightness" '}'
}

command=$1
step=$2
case $command in
  + | -)
    set_brightness $command $step
    ;;
  max)
    set_brightness $command 100
    ;;
  min)
    set_brightness $command 0
    ;;
esac

print_brightness
