#!/bin/bash

# chmod +x ~/myawesomedots/PostInstall.sh

## Getting dracula gtk theme
cd ~
wget https://github.com/dracula/gtk/archive/master.zip
mkdir ~/.themes
file-roller gtk-master.zip --extract-to=~/.themes
cp ~/.themes/gtk-master -r ~/.themes/dracula
rm -rf ~/.themes/gtk-master 

## Getting Dracula Icon theme
cd ~
mkdir /.icons
cd .icons
wget https://github.com/dracula/gtk/files/5214870/Dracula.zip
file-roller Dracula.zip --extract-here
rm Dracula.zip

# Download dots
echo "Downloading dotfiles"
cd ~
git clone https://github.com/danthena/myawesomedots

# Symlink dots
awesomedots=$HOME/myawesomedots

ln -s $awesomedots/xfce4   ~/.config
ln -s $awesomedots/autostart   ~/.config
ln -s $awesomedots/awesome    ~/.config
ln -s $awesomedots/picom      ~/.config
ln -s $awesomedots/conky       ~/.config
ln -s $awesomedots/Wallpaper       ~/Wallpaper
ln -s $awesomedots/Xresources       ~/.Xresources
