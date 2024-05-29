#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.git-completion.bash

# Define shape of shell name
PS1='\r\n[\@] \W on branch \[\e[32m\]$(parse_git_branch)\[\e[0m\]\r\n\[\e[34m\]alex@extensiv \[\e[0m\]\[⇨\]  '

if [ -d "/usr/local/opt/ruby@3.1/bin" ]; then
  export PATH=/usr/local/opt/ruby@3.1/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# Useful functions
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

create_new_branch_off_master() {
  # Concatenate all the arguments into a single string
  branch_name="$*"

  # Replace spaces with dashes
  branch_name="${branch_name// /-}"

  # Create the new branch off master
  git checkout -b "$branch_name" origin/master
}

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

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
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(release|dev)\s*$)" | command xargs -n 1 git branch -d'
alias gc='git commit -v'
alias gcm='git checkout master'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gfo='git fetch origin'
alias gpb='git push origin $(parse_git_branch)'
alias gp='git push -v'
alias nbm='create_new_branch_off_master'
alias brb='~/projects/DiskCacheDaemon'

# Git add, commit, and push all changes to current branch.
# Usage: gacpb your commit message here
gacpb() {
  gaa
  gc -m "$*"
  gpb
}

export PATH=~/.local/bin:$HOME/Library/Android/sdk/platform-tools:$PATH

export ANDROID_SDK=/Users/alexdovzhanyn/Library/Android/sdk

echo "Hello, Alex. Don't forget these useful commands."
echo ""
echo "COMMAND           EXPLANATION"
echo "--------------------------------------------------------"
echo "ga [FILE]         git add [FILE]"
echo "gb                git branch"
echo "gst               git status"
echo "gcm               git checkout master"
echo "gcmsg [MESSAGE]   git commit -m [MESSAGE]"
echo "nbm [BRANCH]      git checkout -b [BRANCH] origin/master"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f "/Users/alexdovzhanyn/.ghcup/env" ] && source "/Users/alexdovzhanyn/.ghcup/env" # ghcup-env
