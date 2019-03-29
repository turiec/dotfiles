#!/bin/bash

echo "=====> configuring git"
git config --global alias.hist "log --oneline --graph --decorate --color"
if [ -f .gitconfig ]; then
        cp .gitconfig ~/.gitconfig
fi
