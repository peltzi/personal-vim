#!/bin/bash

git submodule update --init --recursive
cp -R .vim ~/.vim
cp .vimrc ~/.vimrc
