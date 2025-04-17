#!/bin/bash

# vim: set ts=2 sts=2 sw=2 expandtab tw=0 :

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &&\
  ~/.fzf/install --all
echo '[ -f ~/.fzf.bash ] && source ~/.fzf.bash' >> ~/.bashrc

sudo apt install -y ripgrep
