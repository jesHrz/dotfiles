#!/bin/bash

. library.sh

cmd=$(defaults read com.apple.finder AppleShowAllFiles)

arg=$1

if [[ -z $arg ]]; then
	if [ $cmd == 1 ]; then
		addResult "" "status" "Hidden Files are showing." "" "images/status.png" "yes" "yes"
		addResult "" "hide" "Hide" "Hide Hidden Files." "images/hide.png" "yes" "yes"
	else
		addResult "" "status" "Hidden Files are hidden." "" "images/status.png" "yes" "yes"
        addResult "" "show" "Show" "Show Hidden Files." "images/show.png" "yes" "yes"
	fi
elif [[ $arg =~ ^(s|S)([hH]*) ]]; then
	if [ $cmd == 1 ]; then
		addResult "" "invalid" "Invalid" "Hidden files are already shown now!" "images/invalid.png" "yes" "yes"
	else
		addResult "" "show" "Show" "Show Hidden Files." "images/show.png" "yes" "yes"
	fi
elif [[ $arg =~ ^(h|H)([iI]*) ]]; then
	if [ $cmd == 1 ]; then
		addResult "" "hide" "Hide" "Hide Hidden Files." "images/hide.png" "yes" "yes"
	else
		addResult "" "invalid" "Invalid" "Hidden files are already hidden now!" "images/invalid.png" "yes" "yes"
	fi
fi
getXMLResults
exit
