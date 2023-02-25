#!/bin/bash

# chmod +x ~/myawesomedots/PostInstall.sh

## Getting dracula gtk theme
cd ~
wget https://github.com/dracula/gtk/archive/master.zip
mkdir ~/.themes
unzip master.zip  -d ~/.themes
cp ~/.themes/gtk-master -r ~/.themes/dracula
rm -rf ~/.themes/gtk-master 

## Getting Dracula Icon theme
cd ~
mkdir ~/.icons
cd ~/.icons
wget https://github.com/dracula/gtk/files/5214870/Dracula.zip
unzip Dracula.zip
rm Dracula.zip

## Dracula Theme for xfce4-terminal
cd ~
mkdir -p ~/.local/share/xfce4/terminal/colorschemes
cd  ~/.local/share/xfce4/terminal/colorschemes
wget https://github.com/dracula/xfce4-terminal/archive/master.zip
unzip master.zip
rm master.zip

## Dracula theme for Mousepad
cd ~
git clone https://github.com/dracula/mousepad.git
cd mousepad
mkdir -p "$HOME/.local/share/gtksourceview-4/styles"
cp dracula.xml $HOME/.local/share/gtksourceview-4/styles
cd ~
rm -rf mousepad

# Download dots
#echo "Downloading dotfiles"
#cd ~
#git clone https://github.com/danthena/myawesomedots

# Symlink dots
awesomedots=$HOME/myawesomedots

ln -s $awesomedots/xfce4   ~/.config
ln -s $awesomedots/autostart   ~/.config
ln -s $awesomedots/awesome    ~/.config
ln -s $awesomedots/picom      ~/.config
ln -s $awesomedots/conky       ~/.config
ln -s $awesomedots/Wallpaper       ~/Wallpaper
ln -s $awesomedots/Xresources       ~/.Xresources
