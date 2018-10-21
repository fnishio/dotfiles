" File format
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformat=unix
set fileformats=unix,mac,dos

" indent
autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd FileType zsh        setlocal sw=2 sts=2 ts=2 et

" Display settings
set number
set ruler
set title
set showmatch
set laststatus=2
set statusline=%f%m%r%h%w[%L][%{&ff}]%y[%04l,%04v]
"              | | | | |  |   |      |  |    |
"              | | | | |  |   |      |  |    + current column
"              | | | | |  |   |      |  +-- current line
"              | | | | |  |   |      |
"              | | | | |  |   |      +-- current syntax in square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer

"---------------------------------------------------------
" dein.vim
"
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable
"---------------------------------------------------------
