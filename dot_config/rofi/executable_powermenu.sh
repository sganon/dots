#!/bin/bash

# Options
shutdown=" Shutdown"
reboot=" Reboot"
lock=" Lock"
suspend="⏾ Suspend"
logout=" log Out"

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"
chosen="$(echo -e $options | rofi -theme theme_powermenu.rasi -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        betterlockscreen -l
        ;;
    $suspend)
        amixer set Master mute
        systemctl suspend
        ;;
    $logout)
        bspc quit
        ;;
esac

