#!/bin/bash

printf "\nSetting git preferences..."
rm -f $HOME/.gitconfig

# Set name and email
git config --global user.name "Hamdan Javeed"
git config --global user.email "hamdan@hamdanjaveed.com"

# Set pager
git config --global core.pager less

# Set global .gitignore
git config --global core.excludesfile ~/.gitignore_global

# Set color option
git config --global color.ui true

printf "Done\n"

