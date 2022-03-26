[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# TODO evaluate
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export PATH="$HOME/bin:$PATH"

# Aliases

# Git
alias gs="git status"
alias gl="git log"
alias gsh="git show"

alias ga="git add -A"
alias gap="git add -p"
alias gcl="git clean -fd"
alias gc="git commit -m"
alias gca="git commit --amend"
alias gd="git diff"
alias gdc="git diff --cached"

alias gps="git push"
alias gpl="git pull"

alias gb="git branch"
alias gbm="git branch -m"
alias gbd="git branch -d"
alias gbD="git branch -D"
alias gm="git merge"
alias gma="git merge --abort"
alias gbmg="git branch --merged"
alias gbnm="git branch --no-merged"

alias gck="git checkout"
alias gnb="git checkout -b"
alias grH="git reset HEAD"
alias grh="git reset --hard"
alias grs="git reset --soft"
alias grh1="git reset --hard HEAD~1"
alias grs1="git reset --soft HEAD~1"

alias gr="git rebase"
alias gri="git rebase -i HEAD~"
alias grc="git rebase --continue"
alias gra="git rebase --abort"

alias gcp="git cherry-pick"
alias gcpc="git cherry-pick --continue"

autoload -U compinit && compinit -i

