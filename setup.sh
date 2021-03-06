#!/bin/bash

# Programs needed for dotfiles.
REQ_PROGS=(vim tmux xclip) 
NEEDS_INSTALL=false

for PROG in ${REQ_PROGS[@]} ; do
    if [ -z "$(which $PROG)" ] ; then 
        echo "$PROG needs to be installed."
	NEEDS_INSTALL=true 
    fi
done

if [ $NEEDS_INSTALL = true ] ; then 
    echo "Exiting"
    exit 1
fi

# Directories to be excluded from ln setup below.
# Directories are excluded using a grep pattern so should be separated by '|'.
EXCL_DIRS="scripts" 

PROG_DIRS=$(ls -l | grep -v -E $EXCL_DIRS | grep ^d | awk '{print $9}')

for PROG_DIR in ${PROG_DIRS[@]} ; do 
    FILE=$(ls $PROG_DIR | grep $PROG_DIR)
    
    if test -f "$HOME/.$FILE" ; then
		echo "Deleting $HOME/.$FILE"
		ln -sf "$PWD/$PROG_DIR/$FILE" "$HOME/.$FILE"
    else
		ln -sf "$PWD/$PROG_DIR/$FILE" "$HOME/.$FILE"
    fi 
done



