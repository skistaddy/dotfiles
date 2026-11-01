#!/bin/bash
if [ $PWD == ~/dotfiles ]; then
	stow -t ~/.config . --ignore=skistaddy &&
	stow -t ~ skistaddy &&
	echo "stowed into ~ and .config"
else
	echo "stow needs to be executed inside of the source directory"
fi
