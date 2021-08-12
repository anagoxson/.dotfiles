#!/bin/bash

if [ -x "brew" ]; then
  brew install reattach-to-user-namespace
fi

CUR_DIR=$(cd $(dirname $0) && pwd)

LINK_FILES=(".bashrc" ".bash_profile" ".tmux.conf" ".zshrc")
COPY_FILES=(".ssh/config")

for f in ${LINK_FILES[@]}
do
  srcpath="$CUR_DIR/$f"
  destpath="$HOME/$f"
  if [ -e $destpath ]; then
    echo "$destpath already exists."
  else
    ln -s $srcpath $destpath
    echo "symlink $destpath -> $srcpath created"
  fi
done

for f in ${COPY_FILES[@]}
do
  srcpath="$CUR_DIR/$f"
  destpath="$HOME/$f"
  if [ -e $destpath ]; then
    echo "$destpath already exists."
  else
    cp $srcpath $destpath
    echo "copy $srcpath to $destpath done"
  fi
done
