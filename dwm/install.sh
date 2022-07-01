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
    else 
        echo "Welcome to dwm installer!"
        echo "Installing dependencies..."
        distro=$(. ../package.sh)
        # Execute installation commands accordingly
        case $distro in
            "debian") su -c "apt install xorg xinit picom make gcc alacritty rofi vim maim xclip neofetch cmatrix feh" root ;;
            "rh") su -c "dnf install xorg xinit picom make gcc alacritty rofi vim maim xclip neofetch cmatrix feh" root ;;
            "void") su -c "xbps-install xorg picom make gcc alacritty rofi vim maim xclip neofetch cmatrix feh" root ;;
            "arch") su -c "pacman -S --needed xorg xorg-xinit picom make gcc alacritty rofi vim maim xclip neofetch cmatrix feh" root ;;
            "gentoo") su -c "emerge --ask xorg xinit picom make gcc alacritty rofi vim maim xclip neofetch cmatrix feh" root ;;
            "unsupported") echo "Your distro is not supported! Manually install the following packages:"
                           echo "xorg picom dwm alacritty rofi vim maim xclip pfetch cmatrix feh" ;;
        esac
        echo "Installed all dependencies, time to configure dwm"
        chmod +rwx config.sh && ./config.sh
    fi
}
main $1
