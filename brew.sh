#!/bin/bash

# Update homebrew, make sure it's the latest version
brew update
brew upgrade

BREW_PREFIX=$(brew --prefix)

brew install neovim
brew install zsh
brew install ripgrep
brew install lazygit
brew install tmux
brew install ghostty
brew install spaceship
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

brew cleanup
