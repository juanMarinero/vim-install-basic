#!/bin/bash

# vim: set ts=2 sts=2 sw=2 expandtab tw=0 :

# Read
# https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim#requirements

source install/nodejs.sh

# To install just clang, lld and lldb (18 release)
if dpkg -l | grep -q '^ii  clang'; then
  echo "LLVM is already installed."
else
  # https://llvm.org/docs/GettingStarted.html#requirements
  # sudo apt install -y cmake zlib1g ninja-build

  # Run the installation script
  sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
fi
