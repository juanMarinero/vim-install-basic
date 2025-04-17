#!/bin/bash

# vim: set ts=2 sts=2 sw=2 expandtab tw=0 :

# Read
# https://neovim.io/doc/user/intro.html#_un-installing-nvim
# https://nvchad.com/docs/quickstart/install#uninstall
# https://github.com/neovim/neovim/blob/master/INSTALL.md#uninstall

# APT uninstall
sudo apt purge neovim -y
sudo apt autoremove -y

# Binary uninstall
cd ~/neovim \
  && sudo cmake --build build/ --target uninstall \
  && cd -

# Purge remaining folders
sudo rm -rv "$(whereis nvim)" || echo "Already removed"
sudo rm -rf ~/.config/nvim
sudo rm -rf ~/.local/state/nvim
sudo rm -rf ~/.local/share/nvim
