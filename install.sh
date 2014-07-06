#!/bin/bash

printf "Installing dotfiles...\n\n"

# Ask for root permissions
sh scripts/askroot.sh

# Install dotfiles
sh scripts/dotfiles.sh

# Set up git preferences
sh scripts/gitprefs.sh

# Install OS X preferences
sh scripts/osxprefs.sh

printf "\n... Finished, a restart may be required"

