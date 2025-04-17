#!/bin/bash

# vim: set ts=2 sts=2 sw=2 expandtab tw=0 :

sudo apt-mark hold neovim

# neovim must shown as "hold" (or not shown at all)
apt-mark showhold | grep -i "neovim"
