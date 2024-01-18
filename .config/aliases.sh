#!/usr/bin/env bash
# ╒══════╗        ╒═══════╗
# │ ╓──┐ ║════════╗  ╓─┐  ║
# │ ╚══╛ ║──┐  ╓──╜  ║ │  ║  RustyTake-Off
# │ ╓─┐ ╔╝  │  ║  │  ║ │  ║  https://github.com/RustyTake-Off
# │ ║ │ ╚╗  │  ║  │  ╚═╛  ║
# └─╜ └──╜  └──╜  └───────╜
# Bash aliases
# File executed from ~/.bashrc

# Movement
alias cd......="cd ../../../../../.."
alias cd.....="cd ../../../../.."
alias cd....="cd ../../../.."
alias cd...="cd ../../.."
alias cd..="cd ../.."
alias cd.="cd .."
alias hm="cd ~"
alias hpr="cd ~/pr"
alias hwk="cd ~/wk"

# To work with dotfiles in $HOME and setup scripts
alias dot='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
alias wslup=". \$HOME/.local/bin/use-wslup.sh"
alias setdots=". \$HOME/.local/bin/set-dotfiles.sh"

# Files manipulation
alias cp="cp -vi"
alias mkdir="mkdir -vp"
alias mv="mv -vi"
alias rm="rm -vI"

# Better built-in commands
alias sup="sudo apt update"
alias supup="sudo apt update && sudo apt upgrade -y"
alias brup="brew upgrade"

alias h="history"
alias cls="clear"

alias ls="ls --color=always --group-directories-first"
alias la="ls -a --color=always --group-directories-first"
alias ll="ls -al --color=always --group-directories-first"
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"

alias fgrep="fgrep --color=auto"

alias df="df -h"
alias free="free -m"
alias psa="ps auxf"
alias pscpu="ps auxf | sort -nr -k 3"
alias psmem="ps auxf | sort -nr -k 4"

# Get ip addresses
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
alias locip="sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\\.){3}[0-9]*' | grep -Eo '([0-9]*\\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Git
alias g="git"
alias gi="git init"
alias gcl="git clone"
alias gs="git status --short"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gpll="git pull"
alias gpsh="git push"
alias gchb="git checkout -b"

# Python
alias py="python3"
alias pysetup="python3 -m venv .venv && source .venv/bin/activate"
alias pysetreq="pip freeze > requirements.txt"
alias pygetreq="pip install -r requirements.txt"
alias pyup="source .venv/bin/activate"
alias pydown="deactivate"
alias pipi="pip install"
alias pipu="pip install --upgrade"
alias pipuall="pip freeze --local | cut -d = -f 1  | xargs -n1 pip install --upgrade" # for upgradeing all pkgs

# Misc
alias k="kubectl"
alias h="helm"
alias tf="terraform"
