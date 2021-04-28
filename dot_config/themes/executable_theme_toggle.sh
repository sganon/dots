#!/bin/bash
variant=$1

echo "set termguicolors" > ~/.config/nvim/theme.vim
echo "let ayucolor=\"$1\"" >> ~/.config/nvim/theme.vim
echo "colorscheme ayu" >> ~/.config/nvim/theme.vim
