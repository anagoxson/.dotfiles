#!/bin/bash

CUR_DIR=$(cd $(dirname $0) && pwd)

for f in $CUR_DIR/.??*
do
    filename=$(basename $f)
    srcpath="$CUR_DIR/$filename"
    destpath=~/$filename
    if [ -e $destpath ]; then
        echo "$destpath already exists."
    else
        ln -s $srcpath $destpath
        echo "created $destpath -> $srcpath"
    fi
done
