#!/bin/bash
printf "Installing dotfiles...\n\n"

rootpath="$HOME/dotfiles/files/"

mkdir -p files_old

for file in $HOME/dotfiles/files/*; do
    name=${file#${rootpath}}
    mv $HOME/.$name $HOME/dotfiles/files_old/$name
    printf "Linking $name...\n"
    ln -s "$HOME/dotfiles/files/$name" $HOME/.$name
done

printf "\n... Finished"
