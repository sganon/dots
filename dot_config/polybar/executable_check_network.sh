#!/usr/bin/env bash

count=0
disconnected="睊"
disconnected1=""
wireless_connected=""
ethernet_connected=""

SSID_NAME=$(nmcli -f ACTIVE,SSID dev wifi list | awk '$1 == "yes" {print $2}')

ID="$(ip link | awk '/state UP/ {print $2}')"

while true; do
    if (ping -c 1 archlinux.org || ping -c 1 google.com || ping -c 1 bitbucket.org || ping -c 1 github.com || ping -c 1 sourceforge.net) &>/dev/null; then
        if [[ $ID == e* ]]; then
            if [[ "$1" == "ssid" ]]; then
                echo "$HOST" ; sleep 25
            elif [[ "$1" == "icon" ]]; then 
                echo "$ethernet_connected" ; sleep 25
            fi
        else
            if [[ "$1" == "ssid" ]]; then
                echo "${SSID_NAME}"; sleep 5
            elif [[ "$1" == "icon" ]]; then
                echo "$wireless_connected"; sleep 5
            fi
        fi
    else
        if [[ "$1" == "ssid" ]]; then
            echo "Disconnected"; sleep 0.5
        elif [[ "$1" == "icon" ]]; then
            echo "$disconnected"; sleep 0.5
        fi
    fi
done
