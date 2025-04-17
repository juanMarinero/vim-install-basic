#!/bin/bash

# vim: set ts=2 sts=2 sw=2 expandtab tw=0 :

# Uninstall any previous Vim
source install/NeoVim/uninstall.sh && \
  echo "✅ Uninstalled" || \
  echo "❌ Uninstalled"

# Prevent the package manager from automatically updating or installing NeoVim
# during system updates
source install/NeoVim/apt_hold.sh && \
  echo "✅ apt_hold" || \
  echo "❌ apt_hold"

# Install Vim dependencies
source install/NeoVim/dependencies.sh && \
  echo "✅ dependencies" || \
  echo "❌ dependencies"

# Install Vim
source install/NeoVim/make.sh && \
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

# Symlink to repo file
mkdir -p ~/.config/nvim
ln -fs --relative .vimrc $HOME/.config/nvim/init.vim
ls -l $HOME/.config/nvim/init.vim

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
