#!/usr/bin/env bash
# ╒══════╗        ╒═══════╗
# │ ╓──┐ ║════════╗  ╓─┐  ║
# │ ╚══╛ ║──┐  ╓──╜  ║ │  ║  RustyTake-Off
# │ ╓─┐ ╔╝  │  ║  │  ║ │  ║  https://github.com/RustyTake-Off
# │ ║ │ ╚╗  │  ║  │  ╚═╛  ║
# └─╜ └──╜  └──╜  └───────╜
# Bash functions
# File executed from ~/.bashrc

rebash() {
  # Reload bashrc

  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
}

extract() {
  # Extracts any archive(s)

  for archive in "$@"; do
    if [ -f "$archive" ]; then
      case $archive in
        *.tar.bz2)   tar xvjf "$archive"    ;;
        *.tar.gz)    tar xvzf "$archive"    ;;
        *.bz2)       bunzip2 "$archive"     ;;
        *.rar)       rar x "$archive"       ;;
        *.gz)        gunzip "$archive"      ;;
        *.tar)       tar xvf "$archive"     ;;
        *.tbz2)      tar xvjf "$archive"    ;;
        *.tgz)       tar xvzf "$archive"    ;;
        *.zip)       unzip "$archive"       ;;
        *.Z)         uncompress "$archive"  ;;
        *.7z)        7z x "$archive"        ;;
        *)           echo "Cannot extract '$archive'..." ;;
      esac
    else
      echo "'$archive' is not a valid file!"
    fi
  done
}

permkeys() {
  # Removes read, write and execute permissions from group and others

  find "$HOME/.ssh" -maxdepth 1 -type f -name '*.pub' | while read -r file; do
    keyname=$(basename "$file" .pub)
    chmod go-rwx "$HOME/.ssh/$keyname"
  done
}