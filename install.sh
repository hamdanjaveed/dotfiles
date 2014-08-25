#!/bin/bash

printf "Installing dotfiles...\n"

installOSXPrefs=false

if [ $# -ne 0 ] && [[ "$1" = "-a" ]];
then
    installOSXPrefs=true
fi

if [ "$installOSXPrefs" = true ];
then
    # Ask for root permissions
    ./scripts/askroot.sh
fi

# Install dotfiles
./scripts/dotfiles.sh

# Set up git preferences
./scripts/gitprefs.sh

if [ "$installOSXPrefs" = true ];
then
    # Install OS X preferences
    ./scripts/osxprefs.sh
else
    printf "\nSkipping OS X preferences (to set preferences, use the -a flag)\n"
fi

# Check and install brew
./scripts/brew.sh

printf "\n... Finished"

if [ "$installOSXPrefs" = true ];
then
    printf ", a restart may be required"
fi

