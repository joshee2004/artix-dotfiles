#!/bin/sh

# Author: Joshua Royar
# Description: Config script for my fork of dwm

echo "Press 1 to edit theme"
echo "Press 2 to edit layouts"
echo "Press 3 to edit keybinds"
read choice

case "$choice" in
1) vim config/theme.h ;;
2) vim config/layout.h ;;
3) vim config/keys.h ;;
esac

./install.sh
