#!/bin/bash

# Helpers
notify () {
  echo "==================="
  echo $1
  echo "==================="
}

install_vim_plugins () {
  cd ~/.vim/bundle/
  git clone git@github.com:mxw/vim-jsx.git
  git clone git@github.com:airblade/vim-gitgutter.git
  git clone git@github.com:junegunn/goyo.vim.git
  git clone git@github.com:pangloss/vim-javascript.git
  git clone git@github.com:peitalin/vim-jsx-typescript.git
  git clone git@github.com:leafgarland/typescript-vim.git
  cd -
}

# Install Git
if ! [ -x "$(command -v git)" ]; then
  notify "Installing Git"
  brew install git
fi

# Install n, node version manager
if ! [ -x "$(command -v n)" ]; then
  notify "Installing N"
  brew install n
fi

# Set up directory structure for Pathogen
notify "Installing Pathogen"
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle

# Install pathogen
curl --silent https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim --create-dirs -o ~/.vim/autoload/pathogen.vim
curl --silent https://raw.githubusercontent.com/alexdovzhanyn/dotfiles/master/.vimrc --create-dirs -o ~/.vimrc

# Configure vim color scheme
cd ~/.vim && git init && git submodule add git@github.com:dracula/vim.git bundle/dracula-theme && cd -

install_vim_plugins

# Remind self to download important applications
echo "\n\nRemember to download:"
echo "Atom Text Editor: https://atom.io/"
echo "ITerm2: https://www.iterm2.com/"
echo "Postman: https://www.getpostman.com/"
echo "Slack: https://slack.com/downloads/mac"
echo "Telegram: https://desktop.telegram.org/"
echo "Spotify: https://www.spotify.com/us/"
