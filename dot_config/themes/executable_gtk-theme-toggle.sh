#!/bin/bash

theme=$1

echo "Net/ThemeName \"Qogir-ubuntu-$theme\"" > ~/.xsettingsd

echo "
[Settings]
gtk-application-prefer-dark-theme=0
gtk-theme-name=Qogir-ubuntu-$theme
gtk-icon-theme-name=Adwaita
gtk-font-name=Cantarell 11
gtk-cursor-theme-name=Adwaita
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintslight
gtk-xft-rgba=rgb
" > ~/.config/gtk-3.0/settings.ini
