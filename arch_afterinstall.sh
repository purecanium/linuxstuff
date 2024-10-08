#!/bin/sh

# Archlinux after-install script for laptop users.
# Run this script as user with sudo privilage.

sudo pacman -S base-devel git qt5ct

echo "Installing yay (AUR helper)"
cd /opt
sudo git clone https://aur.archlinux.org/yay-bin
sudo chown -R $USER:$USER yay-bin
cd yay-bin
makepkg -si
cd

echo "Set qt5ct environment variable (for theming purposes)"
sudo pacman -S qt5ct
sudo echo "QT_QPA_PLATFORMTHEME=qt5ct" >> "/etc/environment"

echo "Slow down touchpad scrolling speed by 50%"
yay -S libinput-config
sudo echo "scroll-factor=0.5" > /etc/libinput.conf