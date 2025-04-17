#!/bin/bash

# vim: set ts=2 sts=2 sw=2 expandtab tw=0 :

# Check if NVM is installed
if command -v nvm &> /dev/null || [[ -n "$NVM_DIR" ]]; then
  echo "nvm is already installed"
  return 0 2>/dev/null || exit 0
fi

# Install NVM
# https://github.com/nvm-sh/nvm
git clone https://github.com/nvm-sh/nvm.git $HOME/.nvm && \
  cd ~/.nvm && \
  git checkout v0.40.1 && \ # or whatever latest version
  source ./nvm.sh && \
  nvm --version && \
  cd -

# Install NodeJS
nvm install --lts && \
  node -v && \
  npm -v && \
  nvm list

# Add to .bashrc
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.bashrc
echo 'export PATH="$PATH:$NVM_BIN/node"' >> ~/.bashrc

# Install Yarn
npm install -g yarn

# Add to .bashrc
echo 'export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"' >> ~/.bashrc
