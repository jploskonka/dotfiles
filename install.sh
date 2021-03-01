#!/usr/bin/env bash

brew install rbenv
brew install tmux
brew install tree
brew install ag


ln -s $(pwd)/git/gitconfig ~/.gitconfig
ln -s $(pwd)/git/gitignore ~/.gitignore
ln -s $(pwd)/git/gitmessage ~/.gitmessage
