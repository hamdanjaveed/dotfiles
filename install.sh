#!/bin/bash

printf "Installing dotfiles...\n"

installOSXPrefs=false

if [ $# -ne 0 ] && [ "$1" = "-a" ];
then
    installOSXPrefs=true
fi

if [ "$installOSXPrefs"=true ];
then
    # Ask for root permissions
    sh scripts/askroot.sh
fi

# Install dotfiles
sh scripts/dotfiles.sh

# Set up git preferences
sh scripts/gitprefs.sh

if [ "$installOSXPrefs" = true ];
then
    # Install OS X preferences
    sh scripts/osxprefs.sh
else
    printf "Skipping OS X preferences (to set preferences, use the -a flag)\n"
fi

printf "\n... Finished"

if [ "$installOSXPrefs" = true ];
then
    printf ", a restart may be required"
fi

