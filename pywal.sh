#!/bin/sh

# Author: Joshua Royar
# Description: Script to install pywal

distro=./package.sh

case $distro in
    "debian") su -c "apt install python3-pip && pip3 install pywal" root ;;
    "rh") su -c "dnf install python3-pip && pip3 install pywal" root ;;
    "void") su -c "xbps-install pywal" root ;;
    "arch") su -c "pacman -S pywal" root ;;
    "gentoo") su -c "emerge --ask python3-pip && pip3 install pywal" root ;;
    "unsupported") echo "Your distro is not supported. Make sure pip3 is installed before installing pywal"
                   su -c "pip3 install pywal" root ;;
esac
