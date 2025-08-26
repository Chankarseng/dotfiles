#!/bin/bash

current_date=$(date +%Y%m%d%H%M%S)

# nvim
# backup existing config if config already exist
if [ -d ~/.config/nvim ]; then
  mv ~/.config/nvim ~/.config/nvim.bak.$current_date
fi
cp -r nvim ~/.config/nvim

# tmux
# backup existing config if config already exist
if [ -f ~/.tmux.conf ]; then
  mv ~/.tmux.conf ~/.tmux.conf.bak.$current_date
fi
cp .tmux.conf ~/.tmux.conf

# zsh
if [[ -f ~/.zshrc ]]; then
  mv ~/.zshrc ~/.zshrc.conf.bak.$current_date
fi
cp .zshrc ~/.zshrc
