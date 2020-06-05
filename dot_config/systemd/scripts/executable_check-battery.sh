#!/bin/bash
#printf 'script started' | systemd-cat -t check-battery #write to log when script is called
STATE=`acpi -b | awk '{print $3}' | cut -c 1-11`
PERCENTAGE=` acpi -b | awk '{print $4}' | tr -dc '0-9'`
echo $STATE $PERCENTAGE
if [[ "$STATE" == "Discharging" && "$PERCENTAGE" -lt "15" ]] ; then
        DISPLAY=:0 /usr/bin/notify-send -u critical -i /home/sganon/.local/share/icons/Qogir-dark/symbolic/devices/battery-symbolic.svg "Battery" "Low battery $PERCENTAGE%"
fi
if [[ "$STATE" == "Discharging" && "$PERCENTAGE" -lt "5"  ]]; then
        DISPLAY=:0 /usr/bin/notify-send -u critical -i /home/sganon/.local/share/icons/Qogir-dark/symbolic/devices/battery-symbolic.svg "Battery" "System will hibernate in 20sec"
        sleep 20
        systemctl suspend
fi
