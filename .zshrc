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

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_reduce_blanks

# Completions
fpath=("$HOMEBREW_PREFIX/share/zsh-completions" $fpath)
autoload -Uz compinit && compinit

# Prompt & plugins
[[ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -f "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]] && source "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

# Tool initialization
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
command -v mise >/dev/null && eval "$(mise activate zsh)"

# Aliases
alias vim="nvim"
alias vi="nvim"
alias python="python3"
alias pip="pip3"

alias ls="eza --icons"
alias ll="eza -l --icons --git"
alias la="eza -la --icons --git"
alias lt="eza -T --icons --git"
alias l="eza -la --icons --git"

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"
alias gd="git diff"
alias gb="git branch"
alias gco="git checkout"
alias gsw="git switch"

# Python venv auto-activate
autoload -U add-zsh-hook
function auto-venv() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    return
  fi
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -f "$dir/pyproject.toml" || -f "$dir/requirements.txt" || -f "$dir/Pipfile" ]]; then
      if [[ -d "$dir/.venv" ]]; then
        source "$dir/.venv/bin/activate"
        return
      elif [[ -d "$dir/venv" ]]; then
        source "$dir/venv/bin/activate"
        return
      fi
    fi
    dir="$(dirname "$dir")"
  done
}
add-zsh-hook chpwd auto-venv

setopt correct
setopt globdots

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
