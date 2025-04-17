#!/bin/bash

# vim: set ts=2 sts=2 sw=2 expandtab tw=0 :

# Uninstall any previous Vim
source install/Vim/uninstall.sh && \
  echo "✅ Uninstalled" || \
  echo "❌ Uninstalled"

# Prevent the package manager from automatically updating or installing Vim
# during system updates
source install/Vim/apt_hold.sh && \
  echo "✅ apt_hold" || \
  echo "❌ apt_hold"

# Install Vim dependencies
source install/Vim/dependencies.sh && \
  echo "✅ dependencies" || \
  echo "❌ dependencies"

# Install Vim
source install/Vim/make.sh && \
  echo "✅ make" || \
  echo "❌ make"

# Install plugin dependencies. E.g. plugins/vim-fugitive/dependencies.sh
for file in plugins/*/dependencies.sh; do
  if [[ -f "$file" ]]; then
    source "$file" && \
      echo "$file ✅" || \
      echo "$file ❌"
  fi
done

# Create a ~/.vimrc copy
[ -f $HOME/.vimrc ] && mv -v $HOME/.vimrc $HOME/.vimrc.bak

# Symlink to repo file
ln -s --relative .vimrc $HOME/.vimrc
ls -l $HOME/.vimrc

if false; then
  # Install Vim plugins
  vim -c "PlugInstall"
  echo "✅ :PlugInstall"

  # Run vimrc install codes that needed respective plugin to be installed
  for file in plugins/*/postinstall.vim; do
    if [[ -f "$file" ]]; then
      vim -c "source $file" -c "qa"
      sleep 1
      echo "$file ✅"
    fi
  done
fi
