#!/bin/sh

# Author: Joshua Royar
# Description: Install script for my fork of dwm

# Greet the user and detect distro using package.sh

echo "Welcome to my artix rice installer!"
echo "Before you proceed with the install, please install Terminus font for dwm, Hack Nerd font for text and Font Awesome for emojis for proper rendering."
echo "Let me detect what distro you are using"

distro=$(./package.sh)

# Print error if distro is unsupported and exit out of the shell

if [ $distro == "unsupported" ]; then
  echo "Oh no! Your distro is currently unsupported. You will have to manually install the following packages:"
  echo "xorg xinit picom make gcc alacritty rofi neovim maim xclip neofetch cmatrix feh"
  echo "Refer your package manager documentation for more info."
  exit 1
fi

# Install the dependencies if distro is supported

echo distro + "detected. Installing dependencies..."

case $distro in
  "debian") su -c "apt install xorg xinit picom make gcc alacritty rofi neovim maim xclip neofetch cmatrix feh" root ;;
  "rh") su -c "dnf install xorg xinit picom make gcc alacritty rofi neovim maim xclip neofetch cmatrix feh" root ;;
  "void") su -c "xbps-install xorg picom make gcc alacritty rofi neovim maim xclip neofetch cmatrix feh" root ;;
  "arch") su -c "pacman -S --needed xorg xorg-xinit picom make gcc alacritty rofi neovim maim xclip neofetch cmatrix feh" root ;;
  "gentoo") su -c "emerge --ask xorg xinit picom make gcc alacritty rofi neovim maim xclip neofetch cmatrix feh" root ;;
esac

echo "Installed all dependencies sucessfully. Time to configure your rice"

# Configuration Menu

echo "To configure your rice, refer to the documentation of the software online and change options accordingly"
echo "Press 1 to install pywal (This only installs pywal. You will have to refer to the documentation to configure it for the apps)"
echo "Press 2 to configure alacritty"
echo "Press 3 to configure rofi"
echo "Press 4 to configure neovim"
echo "Press 5 to configure dwm"
echo "Press 6 to install everything without configuration (defaults)"
read choice

case $choice in
  1) . /pywal.sh ;;
  2)  nvim alacritty/alacritty.yml
      cp -r alacritty ~/.config/ ;;
  3)  nvim rofi/config.rasi
      cp -r rofi ~/.config/ ;;
  4)  nvim nvim/init.lua
      cp -r nvim ~/.config/ ;;
  5)  . /dwm/install.sh ;;
  6)  cp -r alacritty rofi nvim ~/.config/
      . /dwm/install.sh ;;
esac
