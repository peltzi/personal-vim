#!/bin/bash

git submodule update --init --recursive
rsync -av --exclude bundle/YouCompleteMe/third_party/ycmd/ycm_core.so .vim/ ~/.vim/
cp .vimrc ~/.vimrc

if [ ! -f $HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so ];
then
  $HOME/.vim/bundle/YouCompleteMe/install.py
fi
