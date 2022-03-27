#!/bin/bash

set -x
set -euf -o pipefail

ARGS=( "-t" "$HOME" )
while [[ $# -gt 0 ]]; do
  arg="$1"
  case "$arg" in
    -r|--restow)
    ARGS[2]="-R"
    ;;
  esac
  shift
done

# Common across all workspaces.
stow ${ARGS[@]} bash
stow ${ARGS[@]} nvim

# Multiple workspaces.
work="block"
function stowWork() {
  cd $1 && stow ${ARGS[@]} $work && cd ..
}

function stowWorkOrPersonal() {
  if [ -d "$1/$work" ];
  then
    stowWork $1
  else
    stow ${ARGS[@]} $1
  fi
}

stowWorkOrPersonal "git"
stowWorkOrPersonal "zsh"

# Work.
stowWork "mysql"

