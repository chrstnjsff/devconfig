# Core Configuration
export ZSH="$HOME/.oh-my-zsh"

# Oh My Posh - replace with your preferred theme
eval "$(oh-my-posh init zsh)"
# To use a specific theme, replace the above line with:

 eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/atomic.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/clean-detailed.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/atomicBit.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/multiverse-neon.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/powerlevel10k_rainbow.omp.json)"

# Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Dracula Theme for FZF
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#ff79c6 --color=info:#8be9fd,prompt:#50fa7b,pointer:#ffb86c --color=marker:#ff79c6,spinner:#8be9fd,header:#6272a4'

# Path Configurations
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/usr/local/opt/python@3.11/bin:$PATH"
export PATH="$(brew --prefix)/opt/python@3.11/bin:$PATH"
export PATH="$PATH:/Users/christianjosefaquino/.local/bin"

# Source Additional Tools
source ~/scripts/key-bindings.zsh
source ~/.zsh/fzf-git.sh
eval "$(fzf --zsh)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Basic Aliases
alias ls='ls --color'                  
alias c='clear'
alias v="nvim"

# Kubernetes Aliases
alias k="kubectl"
alias kns="kubens"
alias kc="kubectx"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kgp="kubectl get pods"
alias kgn="kubectl get nodes"
alias kgs="kubectl get services"

# OpenTofu Aliases (migrated from Terraform)
alias tf="aws-vault exec mgmt -- tofu"
alias tfp="aws-vault exec mgmt -- tofu plan"
alias tfa="aws-vault exec mgmt -- tofu apply -auto-approve"
alias tfi="aws-vault exec mgmt -- tofu init"
alias tfw="aws-vault exec mgmt -- tofu workspace"
alias tfs="aws-vault exec mgmt -- tofu show"
alias tfv="aws-vault exec mgmt -- tofu validate"
alias tff="aws-vault exec mgmt -- tofu fmt"

# Git Aliases
alias gcob='git checkout $(git branch | fzf)'
alias gcobr='git checkout --track $(git branch -r | fzf)'
alias gco='git commit --amend'
alias gst='git status'
alias gpf='git push --force-with-lease'
alias git-resethard="git reset --hard origin/$(git branch | grep '*' | cut -d ' ' -f2)"
alias git-difflast='git diff HEAD~1'
alias git-showlatesttag='git log --pretty=format:"%d" | grep "tag:" | head -n 1'
alias gc="git commit -m"
alias gp="git pull"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add -u'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'
alias gcm='git checkout main'
alias gfp="git fetch -p"
alias gfa="git fetch --all"
alias grb="git fetch -p && git rebase -i origin/main"

# JIRA Aliases
alias j='open "https://mrge.atlassian.net/browse/$(git branch --show-current)"'

# Git Functions
function git-rebase-i {
  local count=${1:-1}
  git rebase -i HEAD~$count
}

# Tool Initializations
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# zoxide
eval "$(zoxide init zsh)"

# thefuck
eval $(thefuck --alias)

# Bash completion support
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/tofu tofu

# Zsh syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set command colors to green
ZSH_HIGHLIGHT_STYLES[command]='fg=#9ece6a,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#9ece6a,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=#9ece6a,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#9ece6a,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#9ece6a,bold'
