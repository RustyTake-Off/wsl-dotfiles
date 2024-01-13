#!/usr/bin/env bash
# ╒══════╗        ╒═══════╗
# │ ╓──┐ ║════════╗  ╓─┐  ║
# │ ╚══╛ ║──┐  ╓──╜  ║ │  ║  RustyTake-Off
# │ ╓─┐ ╔╝  │  ║  │  ║ │  ║  https://github.com/RustyTake-Off
# │ ║ │ ╚╗  │  ║  │  ╚═╛  ║
# └─╜ └──╜  └──╜  └───────╜
# WSL setup script

# Repository      -   "https://github.com/RustyTake-Off/wsl-dotfiles",
# Config file     -   "https://github.com/RustyTake-Off/wsl-dotfiles/blob/main/.config/config.json",
# Script file     -   "https://github.com/RustyTake-Off/wsl-dotfiles/blob/main/.config/wslup.sh"

# ================================================================================
# Main functions

get-help() {
  # Help message

  pass
}

get-apt-apps() {
  # Install some prerequisite and utility apps

  sudo apt update && sudo apt upgrade -y

  sudo apt install -y \
    apt-transport-https \
    build-essential \
    ca-certificates \
    software-properties-common \
    curl \
    gnupg \
    gpg \
    wget \
    tree \
    jq \
    fzf \
    ripgrep \
    zoxide

  if [ ! "$(command -v az)" ]; then
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
  fi
}

get-brew() {
  # Install homebrew if not installed

  if [ ! "$(command -v brew)" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "Homebrew is already installed!"
  fi
}

get-brew-apps() {
  # Check if homebrew is installed, install if not and install brew apps

  get-brew

  if [ ! "$(command -v brew)" ]; then
    command brew install \
      ansible \
      azcopy \
      kubectl \
      helm \
      k9s \
      nvm \
      tfenv \
      terragrunt \
      entr
  fi
}

set-dotfiles() {
  # Invokes the Dotfiles setup script

pass
}
