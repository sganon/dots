#!/bin/bash
variant=$1

if [[ "$variant" == "dark" ]];then
    variant="mirage"
fi

echo "set termguicolors" > ~/.config/nvim/theme.vim
echo "let ayucolor=\"$variant\"" >> ~/.config/nvim/theme.vim
echo "colorscheme ayu" >> ~/.config/nvim/theme.vim
