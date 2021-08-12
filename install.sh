#!/bin/bash

if [ -x "brew" ]; then
  brew install reattach-to-user-namespace
fi

CUR_DIR=$(cd $(dirname $0) && pwd)

FNAMES=(".bashrc" ".bash_profile" ".tmux.conf" ".zshrc")

for f in ${FNAMES[@]}
do
  srcpath="$CUR_DIR/$f"
  destpath="$HOME/$f"
  if [ -e $destpath ]; then
    echo "$destpath already exists."
  else
    ln -s $srcpath $destpath
    echo "created $destpath -> $srcpath"
  fi
done

