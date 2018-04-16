#!/bin/bash

echo =====> checking Vim instalation
command -v vim >/dev/null 2>&1 || {
    echo >&2 "====> Vim is not installed. Installing...";
        sudo apt-get install vim; }

echo =====> applying Firefox settings
cd ~/.mozilla/firefox/
if [[ $(grep '\[Profile[^0]\]' profiles.ini) ]]
then PROFPATH=$(grep -E '^\[Profile|^Path|^Default' profiles.ini | grep -1 '^Default=1' | grep '^Path' | cut -c6-)
else PROFPATH=$(grep 'Path=' profiles.ini | sed 's/^Path=//')
fi
cd -

cp ./firefox/user.js ~/.mozilla/firefox/$PROFPAT
