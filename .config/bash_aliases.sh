#!/usr/bin/env bash
# ╒══════╗        ╒═══════╗
# │ ╓──┐ ║════════╗  ╓─┐  ║
# │ ╚══╛ ║──┐  ╓──╜  ║ │  ║  RustyTake-Off
# │ ╓─┐ ╔╝  │  ║  │  ║ │  ║  https://github.com/RustyTake-Off
# │ ║ │ ╚╗  │  ║  │  ╚═╛  ║
# └─╜ └──╜  └──╜  └───────╜
# Bash aliases executed from ~/.bashrc

# Movement
alias cd......="cd ../../../../../.."
alias cd.....="cd ../../../../.."
alias cd....="cd ../../../.."
alias cd...="cd ../../.."
alias cd..="cd ../.."
alias cd.="cd .."
alias hm="cd ~"
alias pr="cd ~/pr"
alias wk="cd ~/wk"

# Files manipulation
alias cp="cp -vi"
alias mkdir="mkdir -vp"
alias mv="mv -vi"
alias rm="rm -vI"

# Misc
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

# Apps
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

alias py="python3"
alias pysetup="python3 -m venv .venv && source .venv/bin/activate"
alias pysetreq="pip freeze > requirements.txt"
alias pygetreq="pip install -r requirements.txt"
alias pyup="source .venv/bin/activate"
alias pydown="deactivate"

alias k="kubectl"
alias h="helm"
alias tf="terraform"
