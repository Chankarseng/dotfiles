#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
current_date=$(date +%Y%m%d%H%M%S)

if ! xcode-select -p &>/dev/null; then
  xcode-select --install
  echo "Please complete the Xcode CLI Tools installation, then re-run this script."
  exit 1
fi

if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

backup() {
  local target="$1"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    mv "$target" "$target.bak.$current_date"
  fi
}

link() {
  backup "$2"
  mkdir -p "$(dirname "$2")"
  ln -sfn "$1" "$2"
}

link "$SCRIPT_DIR/nvim" ~/.config/nvim
link "$SCRIPT_DIR/.tmux.conf" ~/.tmux.conf
link "$SCRIPT_DIR/.zshrc" ~/.zshrc

"$SCRIPT_DIR/brew.sh"

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

eval "$(mise activate bash)"

corepack enable
mise install
