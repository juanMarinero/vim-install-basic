#!/bin/bash

# vim: set ts=2 sts=2 sw=2 expandtab tw=0 :

# Read
# https://github.com/neovim/neovim/blob/master/BUILD.md#build-prerequisites

sudo apt update && sudo apt upgrade -y
sudo apt install -y git ninja-build gettext cmake curl build-essential \
  xclip python3-venv


# Python3 support
# And ~/.config/nvim/init.vim must have:
#   let g:python3_host_prog = expand("$HOME/.nvim-python/bin/python3")
python3 -m venv $HOME/.nvim-python
source $HOME/.nvim-python/bin/activate
pip install pynvim
pip install setuptools # for Vimspector
deactivate

# Provide python3 support
# Enable remote plugins https://neovim.io/doc/user/remote_plugin.html
source install/nodejs.sh && \
  source ~/.bashrc && \
  npm install -g neovim
