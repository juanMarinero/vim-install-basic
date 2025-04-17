#!/bin/bash

# vim: set ts=2 sts=2 sw=2 expandtab tw=0 :

sudo apt-mark hold vim

# vim must shown as "hold" (or not shown at all). Do not care about vim-tiny,vim-common,...
apt-mark showhold | grep -i "vim"
