#!/bin/sh

# Author: Joshua Royar
# Description: Script to check the package manager

if [ -e "/usr/bin/apt" ]; then
    distro=debian
elif [ -e "/usr/bin/rpm" ]; then
    distro=rh
elif [ -e "/usr/bin/xbps-install" ]; then
    distro=void
elif [ -e "/usr/bin/pacman" ]; then
    distro=arch
elif [ -e "/usr/bin/emerge" ]; then
    distro=gentoo
else
    distro=unsupported
fi

echo $distro
