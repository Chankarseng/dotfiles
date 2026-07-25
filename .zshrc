# Homebrew
export HOMEBREW_PREFIX="$(brew --prefix)"

# Editor
export EDITOR="nvim"
export VISUAL="$EDITOR"

# Language/package managers
export PNPM_HOME="$HOME/Library/pnpm"

# PATH
typeset -U path PATH
path=(
  "$HOME/.opencode/bin"
  "$PNPM_HOME"
  "$HOMEBREW_PREFIX/bin"
  $path
)

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(git autoswitch_virtualenv)
ZSH_THEME="spaceship"

source "$ZSH/oh-my-zsh.sh"

# Prompt & plugins
[[ -f "$HOMEBREW_PREFIX/opt/spaceship/spaceship.zsh" ]] && source "$HOMEBREW_PREFIX/opt/spaceship/spaceship.zsh"
[[ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Tool initialization
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
command -v mise >/dev/null && eval "$(mise activate zsh)"

# Spaceship
SPACESHIP_PROMPT_ASYNC=true
SPACESHIP_PROMPT_ADD_NEWLINE=true

# Aliases
alias vim="nvim"
alias vi="nvim"
alias python="python3"
alias pip="pip3"
