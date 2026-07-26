# Homebrew
export HOMEBREW_PREFIX="$(brew --prefix)"

# PATH (before oh-my-zsh so brew plugins are findable)
typeset -U path PATH
path=(
  "$HOME/.opencode/bin"
  "$PNPM_HOME"
  "$HOMEBREW_PREFIX/bin"
  $path
)

# Completions (before oh-my-zsh so compinit picks them up)
fpath=("$HOMEBREW_PREFIX/share/zsh-completions" $fpath)

# Plugins (brew-managed, before oh-my-zsh)
[[ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if [[ -f "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]]; then
  source "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  python
  tmux
  docker
  fzf
  zoxide
  command-not-found
  web-search
  jsontools
  copypath
  copyfile
)

source "$ZSH/oh-my-zsh.sh"

# Editor
export EDITOR="nvim"
export VISUAL="$EDITOR"

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt sharehistory
setopt hist_ignore_space
setopt hist_reduce_blanks

# Tool initialization
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
command -v mise >/dev/null && eval "$(mise activate zsh)"

# Editors
alias vim="nvim"
alias vi="nvim"

# File listing (eza)
alias ls="eza --icons"
alias ll="eza -l --icons --git"
alias la="eza -la --icons --git"
alias lt="eza -T --icons --git"
alias l="eza -la --icons --git"
alias lsa="eza -la --icons --git"

# Quick edit
alias zshrc="$EDITOR ~/.zshrc"
alias tmuxconf="$EDITOR ~/.tmux.conf"
alias nvimrc="$EDITOR ~/.config/nvim"

# Reload shell
alias reload="exec zsh"

# Extra git aliases (beyond oh-my-zsh defaults)
alias gpf="git push --force-with-lease"
alias gds="git diff --staged"
alias gclean="git clean -fd"
alias gcl="git clone"

# mkcd function
mkcd() { mkdir -p "$1" && cd "$1"; }

# Python venv auto-activate
autoload -U add-zsh-hook
function auto-venv() {
  [[ -n "$VIRTUAL_ENV" ]] && return
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -f "$dir/pyproject.toml" || -f "$dir/requirements.txt" || -f "$dir/Pipfile" ]]; then
      for venv in "$dir/.venv" "$dir/venv"; do
        if [[ -d "$venv" ]]; then
          source "$venv/bin/activate"
          return
        fi
      done
    fi
    dir="$(dirname "$dir")"
  done
}
add-zsh-hook chpwd auto-venv

# zsh options
# setopt correct
unset -f command_not_found_handler
setopt globdots
setopt interactive_comments

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
