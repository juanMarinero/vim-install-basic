#!/bin/bash

# vim: set ts=2 sts=2 sw=2 expandtab tw=0 :

sudo apt install -y bat
# make "bat" call-able, not only batcat
if [ ! -f "/usr/local/bin/bat" ]; then
  sudo ln -s /usr/bin/batcat /usr/local/bin/bat
fi
