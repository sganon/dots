#!/bin/bash

variant=$1

if [[ "$variant" == "dark" ]];then
    echo '
    [colors]
    trans = #00000000
    white = #FFFFFF
    black = #000000
    green = #55AA55
    dark-green = #557755
    blue = #5FAFFF 
    yellow = #FFFF87
    orange = #E95420
    magenta = #AF87FF
    red = #FF6059
    
    bg = #282828
    fg = ${colors.white}
    fg-dimmed = #444444
    accent = ${colors.blue}
    warning = ${colors.yellow}
    ' > $HOME/.config/polybar/colors.ini
elif [[ "$variant" == "light" ]];then
    echo '
    [colors]
    trans = #00000000
    white = #FFFFFF
    black = #000000
    green = #55AA55
    dark-green = #557755
    blue = #5FAFFF 
    yellow = #FFFF87
    orange = #E95420
    magenta = #AF87FF
    red = #FF6059
    
    bg = #FAFAFA
    fg = #5B6672
    fg-dimmed = #444444
    accent = ${colors.blue}
    warning = ${colors.yellow}
    ' > $HOME/.config/polybar/colors.ini
fi

$HOME/.config/polybar/launch.sh
