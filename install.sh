#!/bin/bash
printf "Installing dotfiles...\n\n"

rootpath="$HOME/dotfiles/files/"

oldFileDir="oldFiles"
oldFilePath="$HOME/dotfiles/$oldFileDir"
hiddenFilePath="$HOME/."

mkdir -p $oldFileDir

# Clear old files
for file in $oldFilePath; do
    rm -f file
done

# get the length of the longest file name
longestName=0

for file in $HOME/.*; do
    name=${file#${hiddenFilePath}}
    if [ -f $rootpath$name ]; then
	    tempSize=${#name}
	    if [ $((tempSize)) -gt $((longestName)) ]; then
	        longestName=$tempSize
        fi
    fi
done

# Backing up
for file in $HOME/.*; do
    name=${file#${hiddenFilePath}}
    if [ -f $rootpath$name ]; then
	printf "Backing up $name"
	newSize=${#name}
	finalSize=$((newSize - longestName - 3))
	printf '.%.0s' $(seq 1 $finalSize)
        mv $HOME/.$name $oldFilePath/$name
        printf "Done\n"
    fi
done

printf "Files backed up\n\n"

# Link new files
for file in $rootpath*; do
    name=${file#${rootpath}}
    printf "Linking up $name"
    newSize=${#name}
    finalSize=$((newSize - longestName - 3))
    printf '.%.0s' $(seq 1 $finalSize)

    ln -s "$HOME/dotfiles/files/$name" $HOME/.$name
    printf "Done\n"
done

printf "Files linked\n\n"

printf "... Finished"
