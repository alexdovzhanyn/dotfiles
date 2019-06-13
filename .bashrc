#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Define shape of shell name
PS1='[\u \W]\$ '

# Useful functions

create_new_branch_off_master() {
  git checkout -b $1 origin/master
}

# Git add, commit, and push all changes to current branch.
# Usage: gacpb your commit message here
gacpb() {
  gaa
  gc -m "$*"
  gpb
}

# Convenient aliases
alias vi='vim'
alias ls='ls -la'
alias l='ls'
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gst='git status'
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
alias gc='git commit -v'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gfo='git fetch origin'
alias gpb='git push origin $BRANCH'
alias gp='git push -v'
alias nbm='create_new_branch_off_master'

export BRANCH=$(git rev-parse --abbrev-ref HEAD)
