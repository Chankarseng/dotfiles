# Homebrew
export HOMEBREW_PREFIX="$(brew --prefix)"

# Editor
export EDITOR="nvim"
export VISUAL="$EDITOR"

# PATH
typeset -U path PATH
path=(
  "$HOME/.opencode/bin"
  "$PNPM_HOME"
  "$HOMEBREW_PREFIX/bin"
  $path
)

# Prompt & plugins
[[ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Tool initialization
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
command -v mise >/dev/null && eval "$(mise activate zsh)"

# Aliases
alias vim="nvim"
alias vi="nvim"
alias python="python3"
alias pip="pip3"

eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
