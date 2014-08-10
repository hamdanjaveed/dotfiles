#!/bin/bash

hideOutput() { exec 4<&1; exec 1>/dev/null; }
showOutput() { exec 1<&4; }
hideErrors() { exec 5<&2; exec 2>/dev/null; }
showErrors() { exec 2<&5; }
hideAll() { hideOutput; hideErrors; }
showAll() { showOutput; showErrors; }
closeFileDescriptors() { exec 4>&- 5>&-; }

# Check if brew is installed
hideErrors
brewOutput=`brew -v`
brewRegex=".*command not found.*"
showErrors

if [ -z "$brewOutput" ]; then
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

if [ -z "$brewOutput" ]; then
    printf "ERROR: Homebrew was not installed properly\n"
else
    printf "Running brew update..."
    hideOutput; brewUpdate=`brew update`; showOutput;
    if [[ "$brewUpdate" == "Already up-to-date." ]]; then
        printf "Homebrew is up to date\n"
    else
        printf "Homebrew updated\n"
    fi

    printf "Running brew doctor..."
    hideAll; brewDoctor=`brew doctor 2>&1`; showAll;
    if [[ "$brewDoctor" != "Your system is ready to brew." ]]; then
        printf "System is sick! You should run brew doctor and resolve any issues.\n"
    else
        printf "System is healthy\n"

        # Update taps
        printf "Updating taps...\n"
        hideErrors
        brew tap homebrew/versions
        brew tap caskroom/cask
        brew tap caskroom/versions
        brew tap caskroom/fonts
        showErrors

        closeFileDescriptors

        # Install missing homebrew packages
        chmod +x ./scripts/brew-packages.sh
        ./scripts/brew-packages.sh
    fi
fi
