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
            'c') ./config.sh ;;
            'i') make
                 su -c "make clean install" root
                 mv ~/.xsession ~/.xsession-old
                 echo "exec dwm" >> ~/.xsession
                 chmod +rwx .xsession
                 echo "Install complete! Reboot for changes to take effect" ;;
            'q') echo "Quitting..."
                 exit 0 ;;
        esac
    else 
        echo "Welcome to dwm installer!"
        echo "Installing dependencies..."
        # Check package manager
        ls /usr/bin/apt && distro=debian
        ls /usr/bin/rpm && distro=rh
        ls /usr/bin/xbps-install && distro=void
        ls /usr/bin/pacman && distro=arch
        ls /usr/bin/emerge && distro=gentoo
        # Execute installation commands accordingly
        case $distro in
            "debian") su -c "apt install xorg picom dwm alacritty rofi maim xclip feh" root ;;
            "rh") su -c "dnf install xorg picom dwm alacritty rofi maim xclip feh" root ;;
            "void") su -c "xbps-install xorg picom dwm alacritty rofi maim xclip feh" root ;;
            "arch") su -c "pacman -S --needed xorg picom dwm alacritty rofi maim xclip feh" root ;;
            "gentoo") su -c "emerge --ask xorg picom dwm alacritty rofi maim xclip feh" root ;;
        esac
        echo "Installed all dependencies, time to configure dwm"
        chmod +rwx config.sh && ./config.sh
    fi
}
main $1
