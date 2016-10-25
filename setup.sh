#!/bin/bash

git submodule update --init --recursive
rsync -av .vim ~/.vim
cp .vimrc ~/.vimrc
