#!/bin/bash

#. library.sh

if [ $1 == 'show' ]; then
  defaults write com.apple.finder AppleShowAllFiles -bool true
  KillAll Finder
  echo "Hidden files have been successfully shown!"
  exit
elif [ $1 == 'hide' ]; then
  defaults write com.apple.finder AppleShowAllFiles -bool false
  KillAll Finder
  echo "Hidden files have been successfully hidden."
  exit
fi
