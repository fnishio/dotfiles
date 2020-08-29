#!/bin/sh

DOTFILES_DIR=$(cd $(dirname $0); pwd)

function link() {
  SRC_FILE=${DOTFILES_DIR/#${HOME}/.}/$1
  LNK_FILE=${HOME}/${1/dot\./\.}
  DATE=`date +"%Y%m%d_%H%M%S"`

  # if a file exists, backup it
  if [ -f $LNK_FILE ]; then
    if [ ! -L $LNK_FILE ]; then
      mv ${LNK_FILE} ${LNK_FILE}.${DATE}
    fi
  fi

  # make a symbolic link
  echo 'make a link from' $LNK_FILE 'to' $SRC_FILE
  ln -sf ${SRC_FILE} ${LNK_FILE}
}

for file in ${DOTFILES_DIR}/dot.*; do
  link `basename $file`
done

###
### .vimrc uses dein,
### then setup dein
if [ ! -d ~/.cache/deni ]; then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ${DOTFILES_DIR}/installer.sh
  sh ${DOTFILES_DIR}/installer.sh ~/.cache/dein
  rm ${DOTFILES_DIR}/installer.sh
fi
