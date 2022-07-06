#!/bin/sh

# Author: Joshua Royar
# Description: Install script for my fork of dwm

# Dwm options menu

echo "Press c to configure dwm"
echo "Press i to install dwm"
echo "Press q to quit installer"
read choice

case "$choice" in
    'c') ./config.sh ;;
    'i') su -c "cp status.sh /usr/bin/dwmstatus && chmod +rwx /usr/bin/dwmstatus" root
        make
        su -c "make clean install" root
        mv Xresources ~/.Xresources
        if [ -e ~/.xinitrc ]; then
            mv ~/.xinitrc ~/.xinitrc-old
        fi
        echo "picom & dwmstatus & exec dwm" > ~/.xinitrc
        chmod +rwx .xinitrc
        echo "if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then startx fi" > ~/.bash_profile
        echo "Install complete! Reboot for changes to take effect" ;;
    'q') echo "Quitting..."
        exit 0 ;;
esac
