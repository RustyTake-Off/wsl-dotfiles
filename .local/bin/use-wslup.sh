#!/usr/bin/env bash
# ╒══════╗        ╒═══════╗
# │ ╓──┐ ║════════╗  ╓─┐  ║
# │ ╚══╛ ║──┐  ╓──╜  ║ │  ║  RustyTake-Off
# │ ╓─┐ ╔╝  │  ║  │  ║ │  ║  https://github.com/RustyTake-Off
# │ ║ │ ╚╗  │  ║  │  ╚═╛  ║
# └─╜ └──╜  └──╜  └───────╜
# WSL setup script

# Repository      -   "https://github.com/RustyTake-Off/wsl-dotfiles",
# Script file     -   "https://github.com/RustyTake-Off/wsl-dotfiles/blob/main/.local/bin/use-wslup.sh"

# ================================================================================
# Main variables

REPO_URL="https://github.com/RustyTake-Off/wsl-dotfiles.git"

# ================================================================================
# Main functions

get-help() {
  # Help message

  echo "Help message"
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

  echo "Invoking Dotfiles setup script..."
  if [ -x "$HOME/.local/bin/set-dotfiles.sh" ]; then
    source "$HOME/.local/bin/set-dotfiles.sh"
  else
    command curl -fsLS
  fi
  echo "Invoke complete!"
}

# ================================================================================
# Miscellaneous code

if [ ! -d "$HOME/pr" ]; then
  command mkdir "$HOME/pr"
  echo "Creating 'personal' directory"
fi

if [ ! -d "$HOME/wk" ]; then
  command mkdir "$HOME/wk"
  echo "Creating 'work' directory"
fi
