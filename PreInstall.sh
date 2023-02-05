#!/bin/bash

# chmod +x ~/myawesomedots/PreInstall.sh

echo "Initial apt update"
LANG=C apt update

echo "Apt Dist Upgrade"
LANG=C apt dist-upgrade -y
echo "Dist Upgrade complete. Autoremoving old stuff"
LANG=C apt autoremove -y

# Backup original sources.list file
cp /etc/apt/sources.list /etc/apt/sources.list.bak

# Replace "main" with "testing" in sources.list file
sed -i 's/main/testing/g' /etc/apt/sources.list

# Update package cache
sudo apt update
apt dist-upgrade -y
apt autoremove -y

PKGS=(

## Base Install plus
'xserver-xorg'
##'lightdm'
##'lightdm-gtk-greeter'
'desktop-base'
'lxdm'
'git'
'wget'
'curl'
'htop'
'apt-transport-https'
'at-spi2-core'
'psmisc'
'lxpolkit'
'unzip'

## Desktop Envs
'awesome'
'awesome-extra'
'suckless-tools'

## Networking
'network-manager-gnome'

## Sound
'pipewire'
'pipewire-alsa'
'pipewire-pulse'
'alsa-utils'
'pasystray'
'playerctl'
'volumeicon-alsa'

## Rice
'xfce4-terminal'
'picom'
'rofi'
##'papirus-icon-theme'
'fonts-font-awesome'

## Goodies
'firefox-esr'
'lxappearance'
'lxrandr'
'xfce4-panel'
'xfce4-power-manager'
'libnotify-bin'
'xfce4-notifyd'
'xfce4-goodies'
'xfce4-power-manager-plugins'
'xfce4-screenshooter'
'xfce4-statusnotifier-plugin'
'xfce4-taskmanager'
'xfce4-whiskermenu-plugin'
'xfce4-indicator-plugin'
'xfce4-session'
'mousepad'
'ristretto'
'synaptic'
'brightnessctl'
'thunar'
'thunar-volman'
'thunar-archive-plugin'
'thunar-media-tags-plugin'
'vlc'
)

for PKG in "${PKGS[@]}"; do
    echo "Installing: ${PKG}"
    LANG=C apt install "$PKG" -y --no-install-recommends
done
echo "All Normal Packages Installed"

# Enable LightDM on boot
#LANG=C systemctl enable lightdm

echo "Installing Brave Keyring"
## Install brave browser
LANG=C curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

LANG=C apt update

echo "Installing Brave-Browser"
LANG=C apt install brave-browser -y
