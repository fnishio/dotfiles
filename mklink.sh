#!/bin/sh

DOTFILES_DIR=$(cd $(dirname $0); pwd)

function link() {
  SRC_FILE=${DOTFILES_DIR/#${HOME}/.}/$1
  LNK_FILE=${HOME}/$1
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

# find dotfiles except for current dir and .git*
function dotfiles() {
  find $1 -name '.*' -maxdepth 1 | \
  egrep -v '\.$|\.git'
}

for file in `dotfiles ${DOTFILES_DIR}`; do
  link `basename $file`
done
