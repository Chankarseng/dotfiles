#!/bin/bash

# nvim
# backup existing config if config already exist
if [ -d ~/.config/nvim ]; then
  mv ~/.config/nvim ~/.config/nvim.bak.$(date +%Y%m%d%H%M%S)
fi
cp -r nvim ~/.config/nvim

# tmux
# backup existing config if config already exist
if [ -f ~/.tmux.conf ]; then
  mv ~/.tmux.conf ~/.tmux.conf.bak.$(date +%Y%m%d%H%M%S)
fi
cp .tmux.conf ~/.tmux.conf
