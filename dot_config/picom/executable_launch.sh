#!/bin/bash
# Terminate already running picom instances
killall -q picom
# Wait until the processes have been shut down
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
# Launch picom in background, using default config location
picom -b --experimental-backends --config $HOME/.config/picom/picom.conf
echo "Picom launched..."
