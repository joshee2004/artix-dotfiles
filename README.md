# Joshua's Artix Dotfiles

## Info
![dwm-rice-1](readme/dwm-rice-2.png)
Dotfiles for my artix rice. Includes-
1. [x] Xorg server, video driver and basic fonts
2. [ ] Light DM (login shell)
3. [x] DWM (minimal window manager)
    - [x] custom-made status bar
    - [x] patches
        - Alpha
        - Self Restart
        - Fullscreen
        - Hide tags
        - Tag Labels
        - Underline tags
        - Xresources + xrdb
        - Status 2d with xrdb support
        - Winicon
        - Gapps
        - Centered Windows
4. [x] Rofi (application launcher)
5. [x] Alacritty (terminal)
6. [x] Neovim (text editor)
7. [x] Neofetch (for system info)
8. [x] CMatrix (cool matrix tool)
9. [x] Maim and Xclip (screenshot tools)
10. [x] Pywal (color scheme generator)
11. [x] And additional tools as needed

## My rice works on the following distros as of now
1. Debian
2. Fedora
3. Void
4. Arch **[TRIED AND TESTED!]**

![dwm-install-4.png](readme/dwm-install-4.png)

5. Gentoo

Feel free to fork my project to match your distro if you don't use one of the currently supported distros.

## Installation
1. Make sure you have git installed. Clone the repository using git clone:
    ```git clone https://github.com/joshee2004/artix-dotfiles```
2. cd to artix-dotfiles and run install.sh:
    ```cd artix-dotfiles && ./install.sh```
3. The installer will automatically detect your package manager and install the required softwares. Enter your password and press y to confirm installing the required packages.
    ![dwm-install-1](readme/dwm-install-1.png)
4. After that, you'll be asked to configure each software. You will have to refer to the documentation of the required softwares to configure. If you want to install everything with the default configuration, Press 6.
    ![dwm-install-2](readme/dwm-install-2.png)
5. Configuration of softwares other than dwm are pretty straight forward and involve editing the configuration file to suit your needs.
6. For dwm, you'll be given an option to continue configuring dwm, install it or quit the installation.
    - Press c to return back to configuration menu
    - Press i to save changes and install dwm
    - Press q to quit the installer
    ![dwm-install-3](readme/dwm-install-3.png)
6. Reboot after installing dwm to use it.
7. After rebooting, to enable pywal, go to the repo directory and run pywal.sh:
    ```cd artix-dotfiles && ./pywal.sh```

## Configuration
For pywal, visit https://github.com/dylanaraps/pywal/wiki/Customization for more information

## Bugs
If there are any bugs feel free to report them to me!
