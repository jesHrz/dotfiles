#!/bin/bash

list=(zsh git nvim)
for i in ${list[*]}; do
  stow -Rnv -t $HOME $i --dotfiles || exit -1
done
