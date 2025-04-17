#!/bin/bash

# vim: set ts=2 sts=2 sw=2 expandtab tw=0 :

# Read
# https://github.com/neovim/neovim/blob/master/BUILD.md#quick-start
# https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-source
# https://github.com/neovim/neovim/wiki/Introduction#migrate-to-a-cmake-based-build

# Clone/pull repo
dir="$HOME/neovim"
link="https://github.com/neovim/neovim"
if [[ ! -d "$dir" ]]; then
  git clone $link "$dir" && \
    echo "$dir cloned successfully" || exit
else
  cd "$dir" || exit
  git pull --rebase origin master && \
    echo "✅ $dir updated successfully" || \
    echo "❌ $dir update failed"
fi

# Checkout to a stable branch
git checkout stable

# Optimized build with debug info
make CMAKE_BUILD_TYPE=RelWithDebInfo

# Installs to `/usr/local/bin/nvim`
sudo make install

# Reset working dir
cd -
echo $PWD

# Check
nvim --version
