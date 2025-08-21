#!/bin/bash

# nvim
# backup existing config if config already exist
if [ -d ~/.config/nvim ]; then
  mv ~/.config/nvim ~/.config/nvim.bak
fi
mkdir -p ~/.config/nvim
cp nvim ~/.config/nvim

# tmux
# backup existing config if config already exist
if [ -f ~/.tmux.conf ]; then
  mv ~/.tmux.conf ~/.tmux.conf.bak
fi
cp tmux.conf ~/.tmux.conf
