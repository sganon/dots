#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    echo "---" | tee -a /tmp/polybar-$m-top.log
    echo "$m"
    if [[ "$m" == "eDP1" ]]; then
        echo "eDP1"
        MONITOR=$m polybar --reload hidpi &
    else
        MONITOR=$m polybar --reload lodpi &
    fi
  done
else
  polybar --reload top &
fi
echo "Bars launched..."
