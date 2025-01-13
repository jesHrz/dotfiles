#!/usr/bin/env sh

bus=5

print_brightness() {
  output=$(ddcutil --noverify --bus $bus -t getvcp 10 2>/dev/null)
  if [ $? -eq 0 ]; then
    trimmed=${output#* * * }
    value=${trimmed%% *}

    cached_value=$(cat /tmp/waybar_ddcutil_value 2>/dev/null)
    if [ "$cached_value" != "$value" ]; then
      echo $value >/tmp/waybar_ddcutil_value
    fi
    echo {\"percentage\": $value}
  else
    echo {\"percentage\": $(cat /tmp/waybar_ddcutil_value 2>/dev/null || echo 0)}
  fi
}

command=$1
step=$2
case $command in
+ | -)
  ddcutil --noverify --bus $bus setvcp 10 $command $step 2>/dev/null
  ;;
*)
  print_brightness
  ;;
esac
