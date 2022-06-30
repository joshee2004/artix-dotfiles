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
            'i') su -c "cp status.sh /usr/bin/dwmstatus && chmod +rwx /usr/bin/dwmstatus" root
                 make
                 su -c "make clean install" root
                 mv Xresources ~/.Xresources
                 mv ~/.xsession ~/.xsession-old
                 echo "xrdb ~/.Xresources & picom & dwmstatus & exec dwm" > ~/.xsession
                 chmod +rwx .xsession
                 echo "Install complete! Reboot for changes to take effect" ;;
            'q') echo "Quitting..."
                 exit 0 ;;
        esac
    else 
        echo "Welcome to dwm installer!"
        echo "Installing dependencies..."
        # Check package manager
        if [ -e "/usr/bin/apt" ]; then
            distro=debian
        fi
        if [ -e "/usr/bin/rpm" ]; then
            distro=rh
        fi
        if [ -e "/usr/bin/xbps-install" ]; then
            distro=void
        fi
        if [ -e "/usr/bin/pacman" ]; then
            distro=arch
        fi
        if [ -e "/usr/bin/emerge" ]; then
            distro=gentoo
        fi
        # Execute installation commands accordingly
        case $distro in
            "debian") su -c "apt install xorg picom dwm alacritty rofi vim maim xclip pfetch cmatrix feh" root ;;
            "rh") su -c "dnf install xorg picom dwm alacritty rofi vim maim xclip pfetch cmatrix feh" root ;;
            "void") su -c "xbps-install xorg picom dwm alacritty rofi vim maim xclip pfetch cmatrix feh" root ;;
            "arch") su -c "pacman -S --needed xorg picom dwm alacritty rofi vim maim xclip pfetch cmatrix feh" root ;;
            "gentoo") su -c "emerge --ask xorg picom dwm alacritty rofi vim maim xclip pfetch cmatrix feh" root ;;
        esac
        echo "Installed all dependencies, time to configure dwm"
        chmod +rwx config.sh && ./config.sh
    fi
}
main $1
