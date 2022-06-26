#!/bin/sh

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
                 su -c "make clean install" root
                 rm ~/.xsession
                 echo "exec dwm" >> ~/.xsession
                 chmod +rwx .xsession
                 echo "Install complete! Reboot for changes to take effect"
            ;;
            'q') echo "Quitting..."
                 exit 0
            ;;
        esac
    else 
        echo "Welcome to dwm installer!"
        echo "Installing dependencies... (ONLY WORKS ON ARCH BASED DISTROS!)" 
        su -c "pacman -S --needed base-devel libx11 libxft libxinerama freetype2 fontconfig maim xclip rofi" root
        echo "Installed all dependencies, time to configure dwm"
        chmod +rwx config.sh && ./config.sh
    fi
}
main $1
