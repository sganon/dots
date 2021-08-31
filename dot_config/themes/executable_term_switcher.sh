#!/bin/bash

current=$(cat ~/.config/bspwm/theme)
echo "current theme $current"
next=""
if [[ "$current" == "dark" ]];then
    next="light"
elif [[ "$current" == "light" ]]; then
    next="dark"
fi

~/.config/themes/vim_theme_toggle.sh $next
alacritty-theme-switch -s $next.yaml

echo "switched to $next"
echo $next > ~/.config/bspwm/theme
