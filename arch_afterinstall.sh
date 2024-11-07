#!/bin/sh

# Archlinux after-install script for laptop users.
# Run this script as user with sudo privilage.

echo "Update package managing stuff"
sudo pacman-key --init
sudo pacman-key --populate
sudo pacman -Syy reflector

echo "Update mirror"
sudo reflector -a 6 --sort rate --save /etc/pacman.d/mirrorlist

echo "Activate pararrel download"
sudo sed -i '/^#ParallelDownloads =/c\ParallelDownloads = 5' /etc/pacman.conf

echo "Install essential package"
sudo pacman -Syu base-devel git qt5ct gvfs ntfs-3g

echo "Installing yay (AUR helper)"
cd /opt
sudo git clone https://aur.archlinux.org/yay-bin
sudo chown -R $USER:$USER yay-bin
cd yay-bin
makepkg -si
cd

echo "Set qt5ct environment variable (for theming purposes)"
sudo pacman -S qt5ct
echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee -a /etc/environment > /dev/null

echo "Slow down touchpad scrolling speed by 50%"
yay -S libinput-config
echo "scroll-factor=0.5" | sudo tee /etc/libinput.conf > /dev/null
