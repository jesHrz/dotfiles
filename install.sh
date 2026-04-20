#!/bin/bash

app=${1}
if [[ "x${app}" == "x" ]]; then
	echo "No app name specified"
	exit -1
fi

stow -Rv -t $HOME $app --dotfiles

# list=(zsh git nvim)
# for i in ${list[*]}; do
#   stow -Rnv -t $HOME $i --dotfiles || exit -1
# done
