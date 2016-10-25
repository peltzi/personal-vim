#!/bin/bash

git submodule update --init --recursive
cp -Ru .vim ~/.vim
cp .vimrc ~/.vimrc
