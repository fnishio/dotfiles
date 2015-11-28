" File format
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformat=unix
set fileformats=unix,mac,dos
set ts=4 sw=4 et

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
syntax on

"----------------------------------------------------
" NeoBundle
"
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundleLazy 'Shougo/vimfiler', {
  \   'autoload' : { 'commands' : [ 'VimFiler' ] },
  \ }

" vim-indent-guides
NeoBundle "nathanaelkane/vim-indent-guides"
colorscheme default
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=white
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=lightgrey
let g:indent_guides_color_change_percent = 30

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
