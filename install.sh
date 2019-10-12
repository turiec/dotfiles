#!/bin/bash

echo "=====> checking Vim instalation"
command -v vim >/dev/null 2>&1 || {
	    echo >&2 "====> Vim is not installed. Installing...";
        sudo apt-get install vim; }

echo "=====> copy .vimrc"
cp ./vim/.vimrc ~/.vimrc

echo "=====> checking curl instalation (prerequisite for Vim plugins)"
command -v curl >/dev/null 2>&1 || {
    echo >&2 "====> Curl is not installed. Installing...";
        sudo apt-get install curl; }

echo "=====> installing Vim plugins"
# === install Vim plugins ===
# install pathogen
# mkdir -p ~/.vim/autoload ~/.vim/bundle && \
# curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install vim-airline
# git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
# echo "Remember to run :Helptags to generate help tags"

# Add pathogen to .vimrc
#if ! grep --quiet "execute pathogen#infect()" ~/.vimrc; then
#    echo "execute pathogen#infect()" >> ~/.vimrc;
#fi

# install Vundle plugin-manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


echo "=====> applying Firefox settings"
cd ~/.mozilla/firefox/
if [[ $(grep '\[Profile[^0]\]' profiles.ini) ]]
then PROFPATH=$(grep -E '^\[Profile|^Path|^Default' profiles.ini | grep -1 '^Default=1' | grep '^Path' | cut -c6-)
else PROFPATH=$(grep 'Path=' profiles.ini | sed 's/^Path=//')
fi
cd -

cp ./firefox/user.js ~/.mozilla/firefox/$PROFPAT

echo "=====> checking Tmux instalation"
command -v tmux >/dev/null 2>&1 || {
    echo >&2 "====> Tmux is not installed. Installing...";
            sudo apt-get install tmux; }

echo "=====> Installing screenfetch"
sudo apt-get install screenfetch

echo "=====> Copying bash settings"
cp bash/.b* ~/

echo "=====> Copying git settings"
if [ -f git/git_config.sh ]; then
        . git/git_config.sh
fi


echo "=====> Cloning informative git prompt for bash"
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

echo "=====> Reload bash settings"
#source ~/.bashrc
. ~/.bashrc
