#!/usr/bin/env bash

printf "Checking for missing brew packages...\n"

# Check and install brew packages
brewList=$(brew list)

declare -A brewPackages=(["git"]="git" ["cmake"]="cmake" ["unrar"]="unrar" ["glfw3"]="homebrew/versions/glfw3" ["glew"]="glew" ["glm"]="glm" ["libpng"]="libpng" ["brew-cask"]="caskroom/cask/brew-cask" ["node"]="node" ["phantomjs"]="phantomjs" ["casperjs"]="casperjs" ["wget"]="wget" ["bash"]="bash" ["tmux"]="tmux" ["sdl2"]="sdl2" ["unrar"]="unrar" ["valgrind"]="valgrind" ["astyle"]="astyle")

for package in "${!brewPackages[@]}"; do
    if [[ $brewList != *$package* ]]; then
        brew install "${brewPackages["$package"]}"
    fi
done

# Cask
brewList=$(brew cask list)

declare -a caskApps=("brackets" "google-chrome" "minecraft" "sublime-text3" "font-source-code-pro" "mactex" "skype" "steam")

for app in "${caskApps[@]}"; do
    if [[ $brewList != *$app* ]]; then
        brew cask install $app
    fi
done

