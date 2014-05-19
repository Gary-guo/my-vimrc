#!/bin/bash


if [ ! -e $HOME/.fonts/powerline-fonts ]; then
    echo "Install powerline-fonts"
    git clone https://github.com/Lokaltog/powerline-fonts $HOME/.fonts
else
    echo "Upgrade powerline-fonts"
    cd "$HOME/.fonts/powerline-fonts" && git pull origin master
fi

fc-cache -vf ~/.fonts

#cat $HOME/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml
