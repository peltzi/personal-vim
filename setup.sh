#!/bin/bash

set -e

GIT_DIR=$(git rev-parse --show-toplevel)

while true; do
    read -p "Assuming vim repository ${GIT_DIR}, this correct? [Y/N] " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* )
               echo "Nothing to do, exiting."
               exit;;
        * ) echo "Please answer Y or N.";;
    esac
done
echo

# Make sure we are in git root
cd ${GIT_DIR}

# Update submodules to fetch the latest
git submodule update --init --recursive

# As if user wants to overwrite ~/.vim/ contents
while true; do
    read -p "Do want to overwrite contents of ~/.vim/ ? [Y/N] " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* )
               echo "Nothing to do, exiting."
               exit;;
        * ) echo "Please answer Y or N.";;
    esac
done
echo

# Sync our modules and stuff to users dir, ignore YouCompleteMe lib
rsync -av \
  --exclude bundle/YouCompleteMe/third_party/ycmd/ycm_core.so \
  ${GIT_DIR}/.vim/ \
  ~/.vim/

# If we have no ycm_core.so build one
if [ ! -f $HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so ];
then
  $HOME/.vim/bundle/YouCompleteMe/install.py
fi

# As if user wants to overwrite ~/.vimrc
while true; do
    read -p "Do want to overwrite your ~/.vimrc ? [Y/N] " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* )
               echo "Nothing to do, exiting."
               exit;;
        * ) echo "Please answer Y or N.";;
    esac
done
echo
cp ~/.vimrc ~/.vimrc.BAK
cp ${GIT_DIR}/.vimrc ~/.vimrc
