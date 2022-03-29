[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# TODO evaluate
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

# User configuration
export PATH="$HOME/bin:/usr/local/go/bin:$PATH"

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

