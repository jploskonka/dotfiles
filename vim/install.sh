#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/vimrc.bundles ~/.vimrc.bundles

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim -c BundleInstall
