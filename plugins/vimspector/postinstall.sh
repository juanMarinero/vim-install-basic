#!/bin/bash

if [[ -d $HOME/.vim_plugins ]]; then
  gadgets_dir="$HOME/.vim_plugins/plugged/vimspector/gadgets/linux"
  mkdir -p "$gadgets_dir"
  cp -v plugins/vimspector/.gadgets.json "$gadgets_dir"
fi

if [[ -d $HOME/.local/share/nvim ]]; then
  gadgets_dir="$HOME/.local/share/nvim/plugged/vimspector/gadgets/linux"
  mkdir -p "$gadgets_dir"
  cp -v plugins/vimspector/.gadgets.json "$gadgets_dir"
fi
