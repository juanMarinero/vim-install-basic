#!/bin/bash

# vim: set ts=2 sts=2 sw=2 expandtab tw=0 :

# APT uninstall
sudo apt purge vim -y
sudo apt purge vim-tiny -y
sudo apt-get purge --auto-remove -y vim-gtk3
sudo apt autoremove -y

# Binary uninstall
if [ -d $HOME/vim/src ]; then
  cd ~/vim/src \
    && sudo make uninstall
  cd -
fi

# Purge remaining folders
sudo rm -rv "$(whereis vim)" || echo "Already removed"
