#!/bin/bash

# Check if Vim is installed on the system
if [ -z "$(which vim)" ]  
then
	echo "Vim needs to be installed."
	exit 1
fi

# Create a sym link to HOME
ln -sf "$PWD/.vimrc" "$HOME/.vimrc"
