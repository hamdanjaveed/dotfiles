#!/bin/bash

hideOutput() {
    exec 4<&1
    exec 1>/dev/null
}

showOutput() {
    exec 1<&4
}

hideErrors() {
    exec 4<&2
    exec 2>/dev/null
}

showErrors() {
    exec 2<&4
}

# Check if brew is installed
hideErrors
brewOutput=`brew -v`
brewRegex=".*command not found.*"
showErrors

if [ -z "$brewOutput" ];
then
    printf "\nInstalling Homebrew..."

    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
else
    versionRegex="Homebrew (.*)"
    [[ $brewOutput =~ $versionRegex ]]
    version="${BASH_REMATCH[1]}"
    printf "\nHomebrew v%s is already installed\n" "$version"
fi

# Check for a good installation
hideErrors
brewOutput=`brew -v`
showErrors

if [ -z "$brewOutput" ];
then
    printf "ERROR: Homebrew was not installed properly\n"
else
    printf "Running brew doctor..."

    hideOutput; brewDoctor=`brew doctor`; showOutput;
    if [[ "$brewDoctor" != "Your system is ready to brew." ]];
    then
        printf "\n%s\n" "$brewDoctor"
    else
        printf "System is healthy\n"
        printf "Running brew update..."
        hideOutput; brewUpdate=`brew update`; showOutput;
        if [[ "$brewUpdate" == "Already up-to-date." ]];
        then
            printf "Homebrew is up to date\n"
        else
            printf "Homebrew updated:\n%s\n" "$brewUpdate"
        fi

        # Update taps
        printf "Updating taps...\n"
        hideErrors
        brew tap homebrew/versions
        brew tap caskroom/cask
        brew tap caskroom/versions
        brew tap caskroom/fonts
        showErrors

        # Install missing homebrew packages
        chmod +x ./scripts/brew-packages.sh
        ./scripts/brew-packages.sh
    fi
fi
