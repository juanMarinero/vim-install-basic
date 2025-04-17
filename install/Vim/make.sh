#!/bin/bash

# vim: set ts=2 sts=2 sw=2 expandtab tw=0 :

# Clone/pull repo
dir="$HOME/vim"
link="https://github.com/vim/vim.git"
if [[ ! -d "$dir" ]]; then
  git clone $link "$dir" && \
    echo "$dir cloned successfully" || exit
  cd "$dir"
else
  cd "$dir" || exit
  git pull --rebase origin master && \
    echo "✅ $dir updated successfully" || \
    echo "❌ $dir update failed"
fi

# Checkout to a stable branch
# git checkout stable

# Features
./configure --with-features=huge \
  --enable-multibyte \
  --enable-rubyinterp=yes \
  --enable-python3interp=yes \
  --with-python3-config-dir=$(python3-config --configdir) \
  --enable-perlinterp=yes \
  --enable-luainterp=yes \
  --enable-gui=gtk2 \
  --enable-cscope \
  --prefix=/usr/local

# "91" to be update in new versions
# Check: https://github.com/vim/vim/blob/master/src/version.h
make VIMRUNTIMEDIR=/usr/local/share/vim/vim91 V=1

sudo make install

# Reset working dir
cd -

# Highlight the NOT installed features
vim --version | sed 's/-/\x1b[31m&\x1b[0m/g'
