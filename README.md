#dotfiles
My Terminal, Vim and OS X setup.

##Installation
Clone/download this repo into your home directory and run the install.sh script

```bash
./install.sh
```

##Usage
Note: this script requires bash 4. When you run the script, the script will make a backup of your existing dotfiles that are about to be replaced in ```~/dotfiles/oldFiles```, and then symlinks the new dot files that are stored in ``` ~/dotfiles/files ```.

##OS X Preferences
By default, OS X preferences will not be set. To set them, use the ```-a``` flag

```bash
./install.sh -a
```

Doing this will kill all affected apps (except Terminal), and may require a restart.

##Homebrew
The script will install Homebrew if needed, along with a bunch of packages and applications that I use. Check scripts/brew-packages.sh to see what will get installed.
