#!/bin/bash

printf "Installing dotfiles...\n"

restartRequired=false

# Ask for root permissions
sh scripts/askroot.sh

# Install dotfiles
sh scripts/dotfiles.sh

# Set up git preferences
sh scripts/gitprefs.sh

if [ $# -ne 0 ] && [ "$1" = "-a" ];
then
    # Install OS X preferences
    sh scripts/osxprefs.sh
    restartRequired=true
else
    printf "Skipping OS X preferences (to set preferences, use the -a flag)\n"
fi

printf "\n... Finished"

if [ "$restartRequired" = true ]
then
    printf ", a restart may be required"
fi

