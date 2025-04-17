#!/bin/bash

# Config
[[ -d "$HOME/.vim" ]] && \
  cp -v plugins/coc.nvim/coc-settings.json "$HOME/.vim/coc-settings.json"
[[ -d "$HOME/.config/nvim" ]] && \
  cp -v plugins/coc.nvim/coc-settings.json "$HOME/.config/nvim/coc-settings.json"
