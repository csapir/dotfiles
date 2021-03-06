#!/usr/bin/env bash

#
# This script creates symlinks for desired dotfiles in the users home diretory.
#

# Variables
dotfiles_dir=~/dotfiles
dirs="zsh"
aliases="aliases"

# Update dotfiles to master branch
echo "Updating $dotfiles_dir to master"
cd $dotfiles_dir;
#git pull origin master;
cd;

echo ""

function makeLinks() {
    # aliases
    ln -svf $dotfiles_dir/$aliases ~/.$aliases

    # For each dotfile in dirs, make a symlink
    for dir in $dirs; do
	echo "Linking $dir files"
	cd $dotfiles_dir/$dir;
	for file in *; do
	    ln -svf $dotfiles_dir/$dir/$file ~/.$file
	done
	echo ""
    done

    # emacs
    ln -svf $dotfiles_dir/emacs/emacs.d ~/.emacs.d

    # oh-my-zsh
    ln -svf $dotfiles_dir/oh-my-zsh ~/.oh-my-zsh

    echo "Finished."
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    makeLinks;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
	makeLinks;
    fi;
fi;
unset makeLinks;
