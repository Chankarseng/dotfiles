#!/bin/bash

current_date=$(date +%Y%m%d%H%M%S)
xcode-select --install

backup() {
  local target="$1"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    mv "$target" "$target.bak.$CURRENT_DATE"
  fi
}

link() {
  backup "$2"
  mkdir -p "$(dirname "$2")"
  ln -sfn "$1" "$2"
}
link "$PWD/nvim" ~/.config/nvim
link "$PWD/.tmux.conf" ~/.tmux.conf
link "$PWD/.zshrc" ~/.zshrc

mise install
corepack enable
nvim --headless "+Lazy! sync" +qa
