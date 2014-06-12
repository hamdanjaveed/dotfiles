#!/bin/bash
printf "Installing dotfiles...\n\n"

rootpath="$HOME/dotfiles/files/"
oldFilePath="$HOME/dotfiles/files_old"
hiddenFilePath="$HOME/."

mkdir -p files_old

# Clear old files
for file in $oldFilePath; do
    rm -f file
done

# Backing up
for file in $HOME/.*; do
    name=${file#${hiddenFilePath}}
    if [ -f $rootpath$name ]; then
        printf "Backing up $name..."
        mv $HOME/.$name $oldFilePath/$name
        printf "Done\n"
    fi
done

printf "Files backed up\n\n"

# Link new files
for file in $rootpath*; do
    name=${file#${rootpath}}
    printf "Linking $name..."
    ln -s "$HOME/dotfiles/files/$name" $HOME/.$name
    printf "Done\n"
done

printf "\n... Finished\n"
