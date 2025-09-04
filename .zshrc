# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export HOMEBREW_PREFIX="$(brew --prefix)"

plugins=(git autoswitch_virtualenv)

# Source files
source $ZSH/oh-my-zsh.sh
source $HOMEBREW_PREFIX/opt/spaceship/spaceship.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ZSH theme, https://github.com/spaceship-prompt/spaceship-prompt
ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ASYNC=true
SPACESHIP_PROMPT_ADD_NEWLINE=true

# Aliases
alias vim="nvim"
alias vi="nvim"
alias python=python3
alias pip=pip3
