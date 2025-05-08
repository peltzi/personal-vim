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

# Ask if user wants to overwrite ~/.config/nvim/ contents
while true; do
    read -p "Do want to overwrite contents of ~/.config/nvim/ ? [Y/N] " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* )
               echo "Nothing to do, exiting."
               exit;;
        * ) echo "Please answer Y or N.";;
    esac
done
echo

[ -f ~/.config/nvim ] && cp -R ~/.config/nvim ~/.config/nvim.BAK
mkdir -p ~/.config/nvim
cp -R ${GIT_DIR}/.config/nvim/. ~/.config/nvim
