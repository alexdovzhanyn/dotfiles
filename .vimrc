set backspace=indent,eol,start
set nocompatible

"Allow syntax highlighting based on filetype
filetype plugin indent on
syntax on

"Convert tabs to spaces. 1 tab = 2 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

"Enable pathogen plugins
execute pathogen#infect()

"Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>
