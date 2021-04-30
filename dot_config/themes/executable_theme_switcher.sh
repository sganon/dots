#!/bin/bash

current=$(cat ~/.config/bspwm/theme)
echo "current theme $current"
next=""
if [[ "$current" == "dark" ]];then
    next="light"
elif [[ "$current" == "light" ]]; then
    next="dark"
fi

~/.config/themes/polybar_theme_toogle.sh $next
~/.config/themes/vim_theme_toggle.sh $next
~/.config/themes/neovim_reload.py
~/.config/themes/gtk-theme-toggle.sh $next
alacritty-theme-switch -s $next.yaml

timeout 0.2 xsettingsd -c ~/.xsettingsd

echo "switched to $next"
echo $next > ~/.config/bspwm/theme
