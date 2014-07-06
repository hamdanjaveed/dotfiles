#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install dotfiles
sh scripts/dotfiles.sh

# Set up git preferences
sh scripts/gitprefs.sh

# Install OS X preferences
sh scripts/osxprefs.sh

printf "\n... Finished, a restart may be required"

