#!/bin/bash

# vim: set ts=2 sts=2 sw=2 expandtab tw=0 :

# Check if google-chrome is installed
if command -v google-chrome &> /dev/null; then
  echo "google-chrome is already installed"
  return 0 2>/dev/null || exit 0
fi

# Install google-chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
  sudo dpkg -i google-chrome-stable_current_amd64.deb && \
  rm google-chrome*.deb
