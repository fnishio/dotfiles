# -*- mode: sh; coding: utf-8 -*-
# .zshenv - environment vars

### Editor
export EDITOR=vim
export PAGER=lv
export LV='-c -l'

### PATH
# Ignore duplicate
typeset -U path

path=(
  /usr/local/bin(N-/)
  $path

# Python
  ~/.local/bin(N-/)
)

### OS Type
case ${OSTYPE} in
  darwin*)
    [ -f ~/.zshenv.darwin ] && source ~/.zshenv.darwin
    ;;
  linux*)
    [ -f ~/.zshenv.linux ] && source ~/.zshenv.linux
    ;;
esac

### WSL2 on Windows
if [[ `uname -r` =~ microsoft ]]; then
  [ -f ~/.zshenv.wsl ] && source ~/.zshenv.wsl
fi

[ -f ~/.zshenv.local ] && source ~/.zshenv.local
