#!/bin/bash

which pyenv

if [ $? -ne 0 ];then
    echo "no pyenv, install it first";
    exit 1
fi

sudo apt install build-essential cmake

#mkdir -p ~/.vim/colors
#wget -O ~/.vim/colors/gruvbox.vim https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

export PYTHON_CONFIGURE_OPTS="--enable-shared"
CURRENT=`pyenv version | awk '{print $1}'`
pyenv install 3.7.4

cd ~/.vim/bundle/YouCompleteMe
python install.py --clang-completer

pyenv global $CURRENT