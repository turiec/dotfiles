#!/bin/bash

echo "=====> configuring git"
#git config --global alias.hist "log --oneline --graph --decorate --color"
if [ -f git/.gitconfig ]; then
        cp git/.gitconfig ~/.gitconfig
fi
