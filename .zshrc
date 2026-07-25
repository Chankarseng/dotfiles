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
if [[ -f "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]]; then
  source "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

# Tool initialization
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
command -v mise >/dev/null && eval "$(mise activate zsh)"

# Directory navigation
alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."
alias -g ......="../../../../.."
alias md="mkdir -p"
alias rd="rmdir"
alias mkcd="mkdir -p \$1 && cd \$1"

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent
DIRSTACKSIZE=10

# Editors
alias vim="nvim"
alias vi="nvim"

# Language shortcuts
alias python="python3"
alias pip="pip3"

# File listing (eza)
alias ls="eza --icons"
alias ll="eza -l --icons --git"
alias la="eza -la --icons --git"
alias lt="eza -T --icons --git"
alias l="eza -la --icons --git"
alias lsa="eza -la --icons --git"

# Disk usage
alias df="df -h"
alias du="du -h"

# Safety
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Quick edit
alias zshrc="$EDITOR ~/.zshrc"
alias tmuxconf="$EDITOR ~/.tmux.conf"
alias nvimrc="$EDITOR ~/.config/nvim"

# Reload shell
alias reload="exec zsh"

# Git
alias gs="git status"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gl="git log --oneline --graph --decorate"
alias gla="git log --oneline --graph --decorate --all"
alias gd="git diff"
alias gds="git diff --staged"
alias gb="git branch"
alias gba="git branch -a"
alias gco="git checkout"
alias gsw="git switch"
alias gm="git merge"
alias grb="git rebase"
alias grbi="git rebase -i"
alias gst="git stash"
alias gstp="git stash pop"
alias gpl="git pull"
alias gf="git fetch"
alias gr="git remote"
alias gcl="git clone"
alias gclean="git clean -fd"

# Tmux
alias tks="tmux kill-session"
alias tns="tmux new-session"
alias tls="tmux ls"

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

# zsh options
setopt correct
setopt globdots
setopt interactive_comments

eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
