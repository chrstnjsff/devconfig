# Powerlevel10k Theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Powerlevel10k Instant Prompt (keep this close to the top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Oh-My-Zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Powerlevel10k Configuration (customize with `p10k configure`)
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Vscode Color Scheme for FZF
export FZF_DEFAULT_OPTS='--color=fg:#d4d4d4,bg:#1e1e1e,hl:#569cd6 --color=fg+:#d4d4d4,bg+:#2d2d2d,hl+:#569cd6 --color=info:#9cdcfe,prompt:#dcdcaa,pointer:#c586c0 --color=marker:#c586c0,spinner:#9cdcfe,header:#007acc'

# Add Krew bin to PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Additional Scripts and Configurations
source ~/scripts/key-bindings.zsh
source ~/.zsh/fzf-git.sh
eval "$(fzf --zsh)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias k="kubectl"
alias kns="kubens"
alias tf="aws-vault exec entry-point -- terraform"
alias tfp="aws-vault exec entry-point -- terraform plan"
alias tfa="aws-vault exec entry-point -- terraform apply -auto-approve"
alias v="nvim"
# Pyenv Configuration
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# Git-Related Functions and Aliases
function git-rebase-i {
  local count=${1:-1}
  git rebase -i HEAD~$count
}
eval "$(zoxide init zsh)"

alias gcob='git checkout $(git branch | fzf)'
alias gcobr='git checkout --track $(git branch -r | fzf)'
alias gco='git commit --amend'
alias gst='git status'
alias gpf='git push --force-with-lease'
alias git-resethard="git reset --hard origin/$(git branch | grep '*' | cut -d ' ' -f2)"
alias git-difflast='git diff HEAD~1'
alias git-showlatesttag='git log --pretty=format:"%d" | grep "tag:" | head -n 1'
alias gc="git commit -m"
alias gpu="git pull origin"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# Thefuck Alias
eval $(thefuck --alias)
