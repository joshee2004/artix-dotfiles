#!/usr/bin/env bash

# Author: Joshua Royar
# Description: Install script for my fork of dwm

main() {
    if [[ "$1" == "-i" ]] 
    then
        echo "Press c to configure dwm"
        echo "Press i to install dwm"
        echo "Press q to quit installer"
        read choice
        case "$choice" in
            'c') ./config.sh
            ;;
            'i') make
                 sudo make clean install
                 rm ~/.xsession
                 echo "exec dwm" >> ~/.xsession
                 echo "Install complete! Reboot for changes to take effect"
            ;;
            'q') echo "Quitting..."
                 exit 0
            ;;
        esac
    else 
        echo "Welcome to dwm installer!"
        echo "Installing dependencies... (ONLY WORKS ON ARCH BASED DISTROS!)" 
        sudo pacman -S --needed base-devel libx11 libxft libxinerama freetype2 fontconfig
        echo "Installed all dependencies, time to configure dwm"
        chmod +rwx config.sh && ./config.sh
    fi
}
main $1
