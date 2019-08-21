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
