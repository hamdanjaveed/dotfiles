#!/bin/bash

printf "Checking for missing brew packages...\n"

# Check and install brew packages
brewList=$(brew list)

if [[ $brewList != *git* ]];    then brew install git;    fi
if [[ $brewList != *cmake* ]];  then brew install cmake;  fi
if [[ $brewList != *unrar* ]];  then brew install unrar;  fi

if [[ $brewList != *glfw3* ]];  then brew install homebrew/versions/glfw3;  fi
if [[ $brewList != *glew* ]];   then brew install glew;   fi
if [[ $brewList != *glm* ]];    then brew install glm;    fi
if [[ $brewList != *libpng* ]]; then brew install libpng; fi

# Cask
if [[ $brewList != *brew-cask* ]]; then brew install caskroom/cask/brew-cask; fi
brewList=$(brew cask list)

if [[ $brewList != *brackets* ]];      then brew cask install brackets;      fi
if [[ $brewList != *google-chrome* ]]; then brew cask install google-chrome; fi
if [[ $brewList != *minecraft* ]];     then brew cask install minecraft;     fi
if [[ $brewList != *sublime-text* ]];  then brew cask install sublime-text;  fi
if [[ $brewList != *font-source-code-pro* ]]; then brew cask install font-source-code-pro; fi
