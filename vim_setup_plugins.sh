#!/bin/bash

mkdir ~/.vim
cd  ~/.vim

# install monokai
mkdir colors
git clone https://github.com/tomasr/molokai
mv molokai/colors/molokai.vim ~/.vim/colors/

# install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vi

**************************************************
VIM PLUGINS SETUP FINISHED! bye.
**************************************************

END
